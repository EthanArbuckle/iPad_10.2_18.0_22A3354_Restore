@implementation PKNearFieldLowPowerSupportIsAvailable

void __PKNearFieldLowPowerSupportIsAvailable_block_invoke()
{
  id v0;

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECF22C41 = objc_msgSend(v0, "areFeaturesSupported:outError:", 128, 0);

}

@end
