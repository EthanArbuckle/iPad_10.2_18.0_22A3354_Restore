@implementation TWCAttributionURLForTrafficParameter

void __TWCAttributionURLForTrafficParameter_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("twcweather://now"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL;
  TWCAttributionURLForTrafficParameter_sTWCAppiPhoneURL = v0;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("twc://now"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)TWCAttributionURLForTrafficParameter_sTWCAppiPadURL;
  TWCAttributionURLForTrafficParameter_sTWCAppiPadURL = v2;

}

@end
