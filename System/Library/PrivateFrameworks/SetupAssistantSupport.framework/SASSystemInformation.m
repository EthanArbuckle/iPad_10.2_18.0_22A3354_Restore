@implementation SASSystemInformation

+ (id)productVersion
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  void *v4;

  v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    v4 = (void *)objc_msgSend((id)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x1E0C9ABB0]), "copy");
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)deviceClass
{
  return (id)MGCopyAnswer();
}

+ (id)productType
{
  return (id)MGCopyAnswer();
}

+ (id)storageAvailable
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)storageCapacity
{
  void *v2;
  void *v3;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DE2CB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)compareProductVersion:(id)a3 toProductVersion:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    if (v10 | objc_msgSend(v9, "count"))
    {
      v11 = 0;
      v7 = 1;
      while (1)
      {
        if (objc_msgSend(v8, "count") <= v11)
        {
          v13 = 0;
        }
        else
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "intValue");

        }
        if (objc_msgSend(v9, "count") <= v11)
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

        }
        if (v13 > v15)
          break;
        if (v13 < v15)
        {
          v7 = -1;
          break;
        }
        ++v11;
        v16 = objc_msgSend(v8, "count");
        v17 = objc_msgSend(v9, "count");
        if (v16 <= v17)
          v18 = v17;
        else
          v18 = v16;
        if (v18 <= v11)
          goto LABEL_17;
      }
    }
    else
    {
LABEL_17:
      v7 = 0;
    }

  }
  return v7;
}

@end
