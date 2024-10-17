import './../models/user.dart';

// Initialize users
List<User> initUsers() {
    return <User>[]; 
}

// Sign up user
void signUp(List<User> users, User user) {
    // Get user
    var usr = users.where((x) => x.email == user.email);
    // If user already signed
    if (usr.isNotEmpty) {
        return;
    }

    users.add(user);
}

// Authenticate user
bool authUser(List<User> users, String email, String password) {
    // Get user
    var usr = users.where((x) => x.email == email);
    // Check if user is signed and if password is correct
    if (usr.isNotEmpty && usr.first.password == password) {
        return true;
    }
    return false;
}

// Change user password
void changePassword(List<User> users, String email, newPassword) {
    // Get user
    var user = users.where((x) => x.email == email);
    int index = users.indexOf(user.first);
    users[index].password = newPassword;
}

List<User> users = initUsers();
User tester = User("1111", "asdf", "asdf", "asdf");
