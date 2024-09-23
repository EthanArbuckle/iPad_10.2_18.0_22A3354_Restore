@implementation STMessagesExternalDataSize

void __STMessagesExternalDataSize_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;
  id v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/System/Library/PreferenceBundles/StoragePlugins/CKStoragePlugin.bundle"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v2 = objc_msgSend(v1, "loadAndReturnError:", &v9);
  v3 = v9;
  v4 = 0;
  if (v2)
  {
    v5 = (objc_class *)objc_msgSend(v1, "principalClass");
    if (v5)
    {
      v6 = objc_alloc_init(v5);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "externDataSizeAppIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "containsObject:", CFSTR("com.apple.MobileSMS")))
          v4 = v6;
        else
          v4 = 0;

      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 0;
    }
  }

  v8 = (void *)STMessagesExternalDataSize__messagesPlugin;
  STMessagesExternalDataSize__messagesPlugin = (uint64_t)v4;

}

@end
