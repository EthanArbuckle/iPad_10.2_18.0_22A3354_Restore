@implementation WBSafariDirectoryPath

void __WBSafariDirectoryPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Safari"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)WBSafariDirectoryPath_safariDirectoryPath;
  WBSafariDirectoryPath_safariDirectoryPath = v0;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", WBSafariDirectoryPath_safariDirectoryPath, 0);

}

@end
