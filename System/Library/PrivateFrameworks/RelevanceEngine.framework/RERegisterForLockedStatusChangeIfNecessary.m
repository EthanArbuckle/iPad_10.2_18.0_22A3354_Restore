@implementation RERegisterForLockedStatusChangeIfNecessary

uint64_t ___RERegisterForLockedStatusChangeIfNecessary_block_invoke()
{
  return notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&_RERegisterForLockedStatusChangeIfNecessary_notifyToken, MEMORY[0x24BDAC9B8], &__block_literal_global_77_0);
}

void ___RERegisterForLockedStatusChangeIfNecessary_block_invoke_2()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  RELogForDomain(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2132F7000, v0, OS_LOG_TYPE_DEFAULT, "post REDeviceLockStateChangedNotification", v2, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("REDeviceLockStateChangedNotification"), 0);

}

@end
