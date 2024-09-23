@implementation TRILogCategory

void __TRILogCategory_ClientFramework_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "_");
  v1 = (void *)qword_1EFC74238;
  qword_1EFC74238 = (uint64_t)v0;

}

void __TRILogCategory_Daemon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "_");
  v1 = (void *)qword_1EFC74248;
  qword_1EFC74248 = (uint64_t)v0;

}

void __TRILogCategory_Server_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "server");
  v1 = (void *)qword_1EFC74258;
  qword_1EFC74258 = (uint64_t)v0;

}

void __TRILogCategory_Backtrace_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "backtrace");
  v1 = (void *)qword_1EFC74268;
  qword_1EFC74268 = (uint64_t)v0;

}

void __TRILogCategory_XCTest_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "test");
  v1 = (void *)qword_1EFC74278;
  qword_1EFC74278 = (uint64_t)v0;

}

void __TRILogCategory_InternalTool_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "tool");
  v1 = (void *)qword_1EFC74288;
  qword_1EFC74288 = (uint64_t)v0;

}

void __TRILogCategory_Archiving_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "archiving");
  v1 = (void *)qword_1EFC74298;
  qword_1EFC74298 = (uint64_t)v0;

}

@end
