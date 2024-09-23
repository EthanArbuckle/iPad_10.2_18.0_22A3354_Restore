@implementation NSURL(SRSSExtras)

+ (id)URLWithStringAndDataDetection:()SRSSExtras
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14E8], "dataDetectorWithTypes:error:", 32, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    if (objc_msgSend(v8, "resultType") == 32)
    {
      objc_msgSend(v8, "URL");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

@end
