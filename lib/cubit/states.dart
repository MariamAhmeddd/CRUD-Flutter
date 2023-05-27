
import '../modules/user.dart';

abstract class UserListStates{}
class UserListLoading extends UserListStates {}
class UserListLoaded extends UserListStates {
  //final List<User> users;
  //UserListLoaded(this.users);
}
class UserListError extends UserListStates {
  final String error;

  UserListError(this.error);
}

abstract class UserFormStates {}
class UserFormEmpty extends UserFormStates {}
class UserFormLoading extends UserFormStates {} //when I press edit button
class UserFormSuccess extends UserFormStates {}
class UserFormError extends UserFormStates {
  final String error;

  UserFormError(this.error);
}

abstract class UserDetailStates {}
class UserDetailLoading extends UserDetailStates {}
class UserDetailLoaded extends UserDetailStates {
  final User user;
  UserDetailLoaded(this.user);
}
class UserDetailError extends UserDetailStates {
  final String error;
  UserDetailError(this.error);
}
