@implementation NSURL(StockAdditions)

+ (id)stocks_sanitizedURLFromString:()StockAdditions
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1808];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);

    if (v5)
    {
      objc_msgSend(v5, "percentEncodedHost");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "URLHostAllowedCharacterSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
          v10 = (void *)v8;
        else
          v10 = v6;
        v11 = v10;

        objc_msgSend(v5, "setPercentEncodedHost:", v11);
      }
      objc_msgSend(v5, "percentEncodedQuery");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (void *)v14;
        else
          v16 = v12;
        v17 = v16;

        objc_msgSend(v5, "setPercentEncodedQuery:", v17);
      }
      objc_msgSend(v5, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

@end
