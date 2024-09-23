@implementation SidecarCoreInit

void __SidecarCoreInit_block_invoke()
{
  uint64_t v0;
  void *v1;
  os_log_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__SidecarCoreBundle;
  __SidecarCoreBundle = v0;

  v2 = os_log_create("com.apple.sidecar", "core");
  atomic_store((unint64_t)v2, &__SidecarCoreLogSubsystem);
  v3 = v2;
  objc_msgSend(MEMORY[0x24BDD1540], "setUserInfoValueProviderForDomain:provider:", CFSTR("SidecarErrorDomain"), &__block_literal_global_870);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.SidecarCore", v6);
  v5 = (void *)__sidecarQueue;
  __sidecarQueue = (uint64_t)v4;

}

@end
