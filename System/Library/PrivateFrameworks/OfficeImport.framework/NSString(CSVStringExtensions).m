@implementation NSString(CSVStringExtensions)

- (id)_copyCsvRows:()CSVStringExtensions usingDelimiter:columnCountIsConstant:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  char v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  _BYTE *v29;
  id v30;
  unint64_t *v31;
  id v32;
  void *v33;
  id v34;
  id v35;

  v32 = a4;
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  *a3 = 0;
  *a5 = 1;
  objc_msgSend(MEMORY[0x24BDD1690], "whitespaceAndNewlineCharacterSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invertedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "formIntersectionWithCharacterSet:", v9);

  v10 = (void *)MEMORY[0x24BDD1690];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\"), v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "characterSetWithCharactersInString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = a3;
  v29 = a5;

  objc_msgSend(v12, "formUnionWithCharacterSet:", v33);
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCharactersToBeSkipped:", 0);
  while ((objc_msgSend(v13, "isAtEnd") & 1) == 0)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    v15 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    v16 = 0;
    v17 = 0;
    while ((v17 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x22E2DDB58]();
      v35 = 0;
      v19 = objc_msgSend(v13, "scanUpToCharactersFromSet:intoString:", v12, &v35);
      v20 = v35;
      if (v19)
        objc_msgSend(v15, "appendString:", v20);
      if (objc_msgSend(v13, "isAtEnd"))
      {
        objc_msgSend(v14, "addObject:", v15);
        v17 = 1;
        v21 = v20;
        goto LABEL_23;
      }
      v34 = v20;
      v22 = objc_msgSend(v13, "scanCharactersFromSet:intoString:", v33, &v34);
      v21 = v34;

      if (v22)
      {
        v23 = v21;
        if ((v16 & 1) != 0)
          goto LABEL_11;
        objc_msgSend(v14, "addObject:", v15);
        v16 = 0;
        v17 = 1;
      }
      else if (objc_msgSend(v13, "scanString:intoString:", CFSTR("\"), 0))
      {
        if ((v16 & 1) != 0 && objc_msgSend(v13, "scanString:intoString:", CFSTR("\"), 0))
        {
          objc_msgSend(v15, "appendString:", CFSTR("\"));
          goto LABEL_12;
        }
        v17 = 0;
        v16 ^= 1u;
      }
      else if (objc_msgSend(v13, "scanString:intoString:", v32, 0))
      {
        v23 = v32;
        if ((v16 & 1) != 0)
        {
LABEL_11:
          objc_msgSend(v15, "appendString:", v23);
LABEL_12:
          v17 = 0;
          v16 = 1;
          goto LABEL_23;
        }
        objc_msgSend(v14, "addObject:", v15);
        v24 = objc_alloc_init(MEMORY[0x24BDD16A8]);

        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "scanCharactersFromSet:intoString:", v25, 0);

        v16 = 0;
        v17 = 0;
        v15 = v24;
      }
      else
      {
        objc_msgSend(v13, "setScanLocation:", objc_msgSend(v13, "scanLocation") + 1);
        v17 = 0;
      }
LABEL_23:

      objc_autoreleasePoolPop(v18);
    }
    v26 = objc_msgSend(v14, "count");
    if (v26)
    {
      objc_msgSend(v30, "addObject:", v14);
      v27 = *v31;
      if (*v31 && v26 != v27)
        *v29 = 0;
      if (v26 > v27)
        *v31 = v26;
    }

  }
  return v30;
}

- (void)copyCsvRows:()CSVStringExtensions
{
  void *v5;
  void *v7;
  void *v8;
  id v10;
  char v12;
  unint64_t v13;
  char v14;

  v14 = 0;
  v5 = (void *)objc_msgSend(a1, "_copyCsvRows:usingDelimiter:columnCountIsConstant:", a3, CFSTR(","), &v14);
  if (*a3 == 1 || v14 == 0)
  {
    v13 = 0;
    v12 = 0;
    v7 = (void *)objc_msgSend(a1, "_copyCsvRows:usingDelimiter:columnCountIsConstant:", &v13, CFSTR(";"), &v12);
    v8 = v7;
    if (v13 >= 2 && v12 != 0)
    {
      v10 = v7;

      *a3 = v13;
      v5 = v10;
    }

  }
  return v5;
}

@end
