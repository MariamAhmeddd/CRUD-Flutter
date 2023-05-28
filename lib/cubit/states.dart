
import '../modules/user.dart';

abstract class UserListStates{}
class UserListLoading extends UserListStates {}
class UserListLoaded extends UserListStates {}
class UserListError extends UserListStates {
  final String error;
  UserListError(this.error);
}

abstract class UserFormStates {}
class UserFormEmpty extends UserFormStates {}
class UserFormSuccess extends UserFormStates {}
class UserFormError extends UserFormStates {
  final String error;
  UserFormError(this.error);
}

abstract class UserDetailStates {}
class UserDetailLoading extends UserDetailStates {}
class UserDetailLoaded extends UserDetailStates {}
class UserDetailError extends UserDetailStates {
  final String error;
  UserDetailError(this.error);
}
