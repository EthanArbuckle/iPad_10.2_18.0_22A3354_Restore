@implementation PKDeviceSupportsBackgroundTagReading

void __PKDeviceSupportsBackgroundTagReading_block_invoke()
{
  id v0;

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECF21C85 = objc_msgSend(v0, "areFeaturesSupported:outError:", 64, 0);

}

@end
