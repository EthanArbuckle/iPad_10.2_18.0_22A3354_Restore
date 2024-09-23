@implementation VideosExtrasLoggingToOSLogging

void __VideosExtrasLoggingToOSLogging_block_invoke()
{
  id v0;
  os_log_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create((const char *)objc_msgSend(v0, "UTF8String"), "Extras");
  v2 = (void *)VideosExtrasLogObject;
  VideosExtrasLogObject = (uint64_t)v1;

}

@end
