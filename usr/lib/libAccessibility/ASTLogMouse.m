@implementation ASTLogMouse

void __ASTLogMouse_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "ASTMouse");
  v1 = (void *)ASTLogMouse___logObj;
  ASTLogMouse___logObj = (uint64_t)v0;

}

@end
