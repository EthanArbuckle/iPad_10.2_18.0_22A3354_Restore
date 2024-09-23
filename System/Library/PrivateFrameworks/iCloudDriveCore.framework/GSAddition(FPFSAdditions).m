@implementation GSAddition(FPFSAdditions)

+ (uint64_t)brc_isLegacyConflictAddition:()FPFSAdditions
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "nameSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE3AE80]);

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("_"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == 4 && objc_msgSend(v8, "hasSuffix:", CFSTR(":")))
      {
        objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      if (v8)
        v10 = objc_msgSend(MEMORY[0x24BE17640], "validateMangledIDString:", v8);
      else
        v10 = 0;

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
