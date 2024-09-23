@implementation XCTConnectToDaemon

void __XCTConnectToDaemon_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)targetSessionsByServiceName;
  targetSessionsByServiceName = v0;

}

uint64_t __XCTConnectToDaemon_block_invoke_2(uint64_t a1)
{
  return XCTRegisterForBootstrap(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), *(_QWORD *)(a1 + 40), 1);
}

@end
