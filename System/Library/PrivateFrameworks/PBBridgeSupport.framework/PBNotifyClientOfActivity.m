@implementation PBNotifyClientOfActivity

void __PBNotifyClientOfActivity_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PBNotifyClientOfActivityNotification"), 0);

}

@end
