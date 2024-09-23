@implementation SFRoHSComplianceDocumentFilePath

void __SFRoHSComplianceDocumentFilePath_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  int v12;
  __int128 v13;
  int v14;
  __int128 v15;
  int v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF48];
  SFRuntimeAbsoluteFilePathForPath(CFSTR("/System/Library/ProductDocuments/Notices"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.bundle"), CFSTR("RoHS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 1278131292;
  v17 = xmmword_20ACA60D8;
  v16 = -1841712216;
  v15 = xmmword_20ACA60EC;
  v14 = 659506830;
  v13 = xmmword_20ACA6100;
  v12 = 213746202;
  v11 = xmmword_20ACA6114;
  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    v6 = CFSTR("rohs-compliance-2019");
  }
  else
  {
    LODWORD(v10) = -2114570942;
    v9 = xmmword_20ACA6128;
    if ((MGIsDeviceOfType() & 1) != 0)
    {
      v6 = CFSTR("rohs-compliance-2019a");
    }
    else if (SFDeviceSupportsShipsWithoutAdapterRoHSELabel())
    {
      v6 = CFSTR("rohs-compliance-2020");
    }
    else
    {
      v6 = CFSTR("rohs-compliance");
    }
  }
  objc_msgSend(v5, "pathForResource:ofType:", v6, CFSTR("html"), &v15, &v13, &v11, 0, v9, v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)SFRoHSComplianceDocumentFilePath___path;
  SFRoHSComplianceDocumentFilePath___path = v7;

}

@end
