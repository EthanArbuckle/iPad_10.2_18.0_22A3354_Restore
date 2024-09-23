@implementation NSURL

void __52__NSURL_RemoteUIAdditions__rui_isSupportedNativeURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("prefs"), CFSTR("music"), CFSTR("fmf1"), CFSTR("applenews"), CFSTR("itms-ui"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rui_isSupportedNativeURL_supportedSchemes;
  rui_isSupportedNativeURL_supportedSchemes = v0;

}

void __52__NSURL_RemoteUIAdditions__rui_isSupportedSafariURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("http"), CFSTR("https"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)rui_isSupportedSafariURL_supportedSafariSchemes;
  rui_isSupportedSafariURL_supportedSafariSchemes = v0;

}

@end
