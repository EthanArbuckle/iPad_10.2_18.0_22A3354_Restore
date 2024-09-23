@implementation SFRFExposureDocumentLocalizedStringForKey

void ___SFRFExposureDocumentLocalizedStringForKey_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDBCF48];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/Notices"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), CFSTR("RFExposure"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_SFRFExposureDocumentLocalizedStringForKey___rfExposureBundle;
  _SFRFExposureDocumentLocalizedStringForKey___rfExposureBundle = v4;

}

@end
