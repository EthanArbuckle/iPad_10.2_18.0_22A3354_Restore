@implementation WKWallpapersBaseURL

void __WKWallpapersBaseURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  SFRuntimeAbsoluteFilePathForPath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WKWallpapersBaseURL_baseURL;
  WKWallpapersBaseURL_baseURL = v0;

}

@end
