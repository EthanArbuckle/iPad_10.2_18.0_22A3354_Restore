@implementation NSFileManager(TSPersistence)

- (uint64_t)setDefaultFileProtectionAtDocumentURL:()TSPersistence error:
{
  return objc_msgSend(a1, "changeFileProtectionAtURL:fromProtection:toProtection:recursively:error:", a3, 0, *MEMORY[0x24BDD0CD0], 1, a4);
}

- (uint64_t)setDefaultFileProtectionForDirectoryPath:()TSPersistence error:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDD0CF0];
  v12[0] = *MEMORY[0x24BDD0CD0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v8, v6, a4);

  return v9;
}

- (void)assertDefaultFileProtectionAtDocumentURL:()TSPersistence
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(a1, "hasAtLeastFileProtection:atURL:recursively:", *MEMORY[0x24BDD0CE0]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSFileManager(TSPersistence) assertDefaultFileProtectionAtDocumentURL:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/NSFileManager_TSPersistence.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 30, CFSTR("Document does not have default file protection set: %@"), v7);

  }
}

@end
