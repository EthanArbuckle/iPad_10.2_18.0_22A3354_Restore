@implementation SAArchitectureForTranslatedTask

int *__SAArchitectureForTranslatedTask_block_invoke()
{
  int v0;
  NSObject *v1;
  int *result;
  int v3;
  uint64_t FamilyName;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  _sa_logt();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    FamilyName = CSArchitectureGetFamilyName();
    _os_log_error_impl(&dword_1B9BE0000, v1, OS_LOG_TYPE_ERROR, "Unknown translation architecture %s", (uint8_t *)&v3, 0xCu);
  }

  result = __error();
  *result = v0;
  return result;
}

@end
