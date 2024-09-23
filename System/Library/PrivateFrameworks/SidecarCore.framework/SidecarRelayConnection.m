@implementation SidecarRelayConnection

void __SidecarRelayConnection_block_invoke_2()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SidecarCoreLogSubsystem(OS_LOG_TYPE_INFO);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0 && os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = CFSTR("com.apple.sidecar-relay");
    _os_log_impl(&dword_220044000, v1, OS_LOG_TYPE_INFO, "%{public}@: connection interrupted", (uint8_t *)&v6, 0xCu);
  }

  +[SidecarProviderProxy defaultProxy](SidecarProviderProxy, "defaultProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    SidecarRegisterServiceProvider(v3);
  +[SidecarCoreProxy defaultProxy](SidecarCoreProxy, "defaultProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "sidecarServicePresenterTerminate");

}

void __SidecarRelayConnection_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0 && os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v2 = 138543362;
    v3 = CFSTR("com.apple.sidecar-relay");
    _os_log_impl(&dword_220044000, v1, OS_LOG_TYPE_ERROR, "%{public}@: connection invalid", (uint8_t *)&v2, 0xCu);
  }

}

@end
