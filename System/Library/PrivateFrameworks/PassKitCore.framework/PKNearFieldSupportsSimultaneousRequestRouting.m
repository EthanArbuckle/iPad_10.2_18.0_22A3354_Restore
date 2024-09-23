@implementation PKNearFieldSupportsSimultaneousRequestRouting

void __PKNearFieldSupportsSimultaneousRequestRouting_block_invoke()
{
  id v0;

  objc_msgSend(PKGetClassNFHardwareManager(), "sharedHardwareManagerWithNoUI");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_284 = objc_msgSend(v0, "areFeaturesSupported:outError:", 2048, 0);

}

@end
