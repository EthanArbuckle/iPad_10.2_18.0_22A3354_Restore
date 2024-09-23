@implementation XCTRegisterForBootstrap

void __XCTRegisterForBootstrap_block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint8_t v5[16];

  XCTTBDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2084C6000, v4, OS_LOG_TYPE_DEFAULT, "Got availability notification from test daemon.", v5, 2u);
  }

  notify_cancel(a2);
  XCTConnectToDaemon(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

@end
