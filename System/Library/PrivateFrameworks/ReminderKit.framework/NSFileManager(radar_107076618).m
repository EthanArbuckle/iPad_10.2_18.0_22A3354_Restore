@implementation NSFileManager(radar_107076618)

+ (id)remcrtt_createTemporaryFileDirectoryURLIfNeeded
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
