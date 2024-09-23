@implementation SPLogInit

void __SPLogInit_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("SPLogPersistedTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SPLogPersistedTypes"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      gSPLogDebugAsDefault = objc_msgSend(v5, "containsObject:", CFSTR("debug"));
      if ((gSPLogDebugAsDefault & 1) != 0)
        v6 = 1;
      else
        v6 = objc_msgSend(v5, "containsObject:", CFSTR("info"));
      gSPLogInfoAsDefault = v6;

    }
    v3 = v7;
  }

}

@end
