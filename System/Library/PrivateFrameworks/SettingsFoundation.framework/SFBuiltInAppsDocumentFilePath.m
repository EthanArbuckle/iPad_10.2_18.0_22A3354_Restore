@implementation SFBuiltInAppsDocumentFilePath

void __SFBuiltInAppsDocumentFilePath_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x24BDBCF48];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/Notices"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), CFSTR("BuiltInApps"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("builtinapps"), CFSTR("html"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)SFBuiltInAppsDocumentFilePath___path;
  SFBuiltInAppsDocumentFilePath___path = v5;

}

@end
