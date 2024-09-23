@implementation NFBuildVersion

void __NFBuildVersion_block_invoke()
{
  char *v0;
  void *specific;
  void (*v2)(uint64_t, const char *, ...);
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  qword_1ECFF6A08 = MGCopyAnswer();
  if (!qword_1ECFF6A08)
  {
    v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v2 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v2)
    {
      v2(3, "%s:%i Failed to query build", "NFBuildVersion_block_invoke", 540);
      v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v3 = dispatch_get_specific(v0);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v4 = _NFSharedLogClient[(_QWORD)v3];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v6 = "NFBuildVersion_block_invoke";
      v7 = 1024;
      v8 = 540;
      _os_log_impl(&dword_1C34DB000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to query build", buf, 0x12u);
    }
    qword_1ECFF6A08 = (uint64_t)CFSTR("UnknownBuild");
  }
}

@end
