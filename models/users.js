// requiring bcrypt for password hashing. 
var bcrypt = require("bcryptjs");

// creating our User model
// export for use on server file
module.exports = function(sequelize, DataTypes) {
  var User = sequelize.define("User", {
    // email cannot be null, and must be a proper email before creation
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: {
        isEmail: true
      }
    },
    // password cannot be null
    password: {
      type: DataTypes.STRING,
      allowNull: false
    }
  });

  // creating a custom method for User model
  // below will check if an unhashed password entered by
  // user can be compared to the hashed password stored in our database
  User.prototype.validPassword = function(password) {
    return bcrypt.compareSync(password, this.password);
  };

  // hooks are automatic methods that run during various phases of the User Model lifecycle
  // before a User is created, we will automatically hash their password
  User.hook("beforeCreate", function(user) {
    user.password = bcrypt.hashSync(user.password, bcrypt.genSaltSync(10), null);
  });
  return User;
};

//User.beforeCreate(user => {
  //  user.password = bcrypt.hashSync(
    //  user.password,
      //bcrypt.genSaltSync(10),
      //null
    //);
  //});