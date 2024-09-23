@implementation SSMutableURLRequestProperties

void __102__SSMutableURLRequestProperties_RadioRequestAdditions__newForRadioRequestURL_accountUniqueIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BEB1E90], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copyDeviceGUID");
  v1 = (void *)newForRadioRequestURL_accountUniqueIdentifier____deviceGUID;
  newForRadioRequestURL_accountUniqueIdentifier____deviceGUID = v0;

}

@end
