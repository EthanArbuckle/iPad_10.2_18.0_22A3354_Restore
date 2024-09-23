@implementation SACompareDyldToCSLevel

const char *__SACompareDyldToCSLevel_block_invoke()
{
  const char *result;
  const char *v1;
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = getenv("SA_COMPARE_DYLD_TO_CS");
  if (result)
  {
    v1 = result;
    result = (const char *)strtol(result, 0, 0);
    dword_1ED1DD914 = (int)result;
    if (result >= 3)
    {
      v2 = *__error();
      _sa_logt();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        v11 = dword_1ED1DD914;
        v12 = 2080;
        v13 = v1;
        _os_log_error_impl(&dword_1B9BE0000, v3, OS_LOG_TYPE_ERROR, "SA_COMPARE_DYLD_TO_CS of %d invalid (from %s)", buf, 0x12u);
      }

      *__error() = v2;
      _SASetCrashLogMessage(328, "SA_COMPARE_DYLD_TO_CS of %d invalid (from %s)", v4, v5, v6, v7, v8, v9, dword_1ED1DD914);
      _os_crash();
      __break(1u);
    }
  }
  return result;
}

@end
