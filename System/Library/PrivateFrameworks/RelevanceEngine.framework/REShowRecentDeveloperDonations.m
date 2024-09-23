@implementation REShowRecentDeveloperDonations

uint64_t __REShowRecentDeveloperDonations_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1648]);
  v1 = (void *)REShowRecentDeveloperDonations_defaultAccessLock;
  REShowRecentDeveloperDonations_defaultAccessLock = (uint64_t)v0;

  return notify_register_dispatch("com.apple.duetexpertd.defaultsChanged", (int *)&REShowRecentDeveloperDonations_notifyToken, MEMORY[0x24BDAC9B8], &__block_literal_global_68_0);
}

void __REShowRecentDeveloperDonations_block_invoke_2()
{
  id v0;

  objc_msgSend((id)REShowRecentDeveloperDonations_defaultAccessLock, "lock");
  REShowRecentDeveloperDonations___needsUpdate = 0;
  objc_msgSend((id)REShowRecentDeveloperDonations_defaultAccessLock, "unlock");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("REShowRecentDeveloperDonationsChangedNotification"), 0);

}

@end
