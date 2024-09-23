@implementation SHFileChecksum

+ (id)checksumForFile:(id)a3 withError:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "checksumDataForFile:withError:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)checksumDataForFile:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CC_SHA1_CTX v12;
  unsigned __int8 md[20];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  memset(&v12, 0, sizeof(v12));
  if (CC_SHA1_Init(&v12))
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
      do
      {
        v8 = (void *)MEMORY[0x220745558]();
        objc_msgSend(v6, "readDataOfLength:", 0x100000);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = objc_retainAutorelease(v9);
        LODWORD(v9) = CC_SHA1_Update(&v12, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
        objc_autoreleasePoolPop(v8);
      }
      while ((_DWORD)v9 && objc_msgSend(v7, "length"));
      CC_SHA1_Final(md, &v12);
      objc_msgSend(v6, "closeAndReturnError:", 0);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
