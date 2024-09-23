@implementation UNNotificationAttachment

void __56__UNNotificationAttachment_Staging___systemDirectoryURL__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BDBCF48];
  BSSystemRootDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("System"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_systemDirectoryURL___systemDirectoryURL;
  _systemDirectoryURL___systemDirectoryURL = v2;

}

@end
