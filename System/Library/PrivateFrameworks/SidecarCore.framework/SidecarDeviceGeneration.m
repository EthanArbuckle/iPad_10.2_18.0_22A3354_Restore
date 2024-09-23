@implementation SidecarDeviceGeneration

void __SidecarDeviceGeneration_block_invoke()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_3_443);
}

void __SidecarDeviceGeneration_block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SidecarDevicesChangedNotification"), 0);

}

@end
