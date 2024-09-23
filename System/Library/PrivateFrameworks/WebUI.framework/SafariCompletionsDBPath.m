@implementation SafariCompletionsDBPath

void __SafariCompletionsDBPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Safari"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SafariCompletionsDBPath_path;
  SafariCompletionsDBPath_path = v0;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", SafariCompletionsDBPath_path, 0);

  objc_msgSend((id)SafariCompletionsDBPath_path, "stringByAppendingPathComponent:", CFSTR("FormValues.plist"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByResolvingSymlinksInPath");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)SafariCompletionsDBPath_path;
  SafariCompletionsDBPath_path = v3;

}

@end
