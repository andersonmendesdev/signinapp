enum StatusEnum {
  initial,
  loading,
  success,
  error,
}

extension MemberStatusEnum on StatusEnum {
  bool isLoading() => this == StatusEnum.loading;
  bool isError() =>this == StatusEnum.error;
}