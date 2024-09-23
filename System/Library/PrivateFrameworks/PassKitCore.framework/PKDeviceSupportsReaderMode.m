@implementation PKDeviceSupportsReaderMode

void __PKDeviceSupportsReaderMode_block_invoke()
{
  id v0;

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECF21C84 = objc_msgSend(v0, "areFeaturesSupported:outError:", 1, 0);

}

@end
