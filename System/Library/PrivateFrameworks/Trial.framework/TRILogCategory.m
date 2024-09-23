@implementation TRILogCategory

void __TRILogCategory_ClientFramework_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "_");
  v1 = (void *)qword_1ECED7F50;
  qword_1ECED7F50 = (uint64_t)v0;

}

void __TRILogCategory_Daemon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "_");
  v1 = (void *)qword_1ECED7F60;
  qword_1ECED7F60 = (uint64_t)v0;

}

void __TRILogCategory_Server_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "server");
  v1 = (void *)qword_1ECED7F70;
  qword_1ECED7F70 = (uint64_t)v0;

}

void __TRILogCategory_Backtrace_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "backtrace");
  v1 = (void *)qword_1ECED7F80;
  qword_1ECED7F80 = (uint64_t)v0;

}

void __TRILogCategory_XCTest_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "test");
  v1 = (void *)qword_1ECED7F90;
  qword_1ECED7F90 = (uint64_t)v0;

}

void __TRILogCategory_InternalTool_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "tool");
  v1 = (void *)qword_1ECED7FA0;
  qword_1ECED7FA0 = (uint64_t)v0;

}

void __TRILogCategory_Archiving_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.triald", "archiving");
  v1 = (void *)qword_1ECED7FB0;
  qword_1ECED7FB0 = (uint64_t)v0;

}

@end
