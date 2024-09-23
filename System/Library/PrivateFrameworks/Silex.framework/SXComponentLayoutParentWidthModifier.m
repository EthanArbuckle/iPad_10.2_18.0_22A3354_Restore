@implementation SXComponentLayoutParentWidthModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a3;
  objc_msgSend(a4, "specVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1.6"), "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");
  if (objc_msgSend(v7, "count") | v8)
  {
    v9 = 0;
    while (1)
    {
      v10 = CFSTR("0");
      if (v9 < objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndex:", v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v11 = CFSTR("0");
      if (v9 < objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndex:", v9);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v12 = -[__CFString compare:options:](v10, "compare:options:", v11, 64);

      if (v12)
        break;
      ++v9;
      v13 = objc_msgSend(v6, "count");
      v14 = objc_msgSend(v7, "count");
      if (v13 <= v14)
        v15 = v14;
      else
        v15 = v13;
      if (v9 >= v15)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  if (v12 != 1)
  {
    objc_msgSend(v18, "componentLayouts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __58__SXComponentLayoutParentWidthModifier_modifyDOM_context___block_invoke;
    v19[3] = &unk_24D688F50;
    v20 = v18;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v19);

  }
}

void __58__SXComponentLayoutParentWidthModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SXComponentLayout *v16;
  void *v17;
  SXComponentLayout *v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  objc_msgSend(v5, "minimumWidth");
  v7 = v6;
  objc_msgSend(v5, "maximumWidth");
  v9 = v8;
  if (v7 == 7 || v8 == 7)
  {
    objc_msgSend(v5, "JSONRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v7 == 7)
    {
      v12 = objc_msgSend(v5, "minimumWidth");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f%@"), v12, CFSTR("pw"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("minimumWidth"));

    }
    if (v9 == 7)
    {
      v14 = objc_msgSend(v5, "maximumWidth");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f%@"), v14, CFSTR("pw"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("maximumWidth"));

    }
    v16 = [SXComponentLayout alloc];
    objc_msgSend(v5, "specificationVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SXJSONObject initWithJSONObject:andVersion:](v16, "initWithJSONObject:andVersion:", v11, v17);

    objc_msgSend(*(id *)(a1 + 32), "componentLayouts");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, v20);

  }
}

@end
