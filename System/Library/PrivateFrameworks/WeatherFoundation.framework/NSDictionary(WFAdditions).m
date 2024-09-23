@implementation NSDictionary(WFAdditions)

- (id)wf_objectOfKind:()WFAdditions forKeyPath:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a1;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "firstObject", (_QWORD)v18);
          v14 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = v7;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v14, "objectForKeyedSubscript:", v13),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {

          v16 = 0;
          goto LABEL_17;
        }
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    v14 = v7;
  }
  else
  {
    v14 = v7;
    v16 = v14;
  }
LABEL_17:

  return v16;
}

- (uint64_t)wf_objectForKeyPath:()WFAdditions
{
  return objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", 0, a3);
}

- (id)wf_dictionaryForKeyPath:()WFAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_arrayForKeyPath:()WFAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_stringForKeyPath:()WFAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_URLForKeyPath:()WFAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_numberForKeyPath:()WFAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)wf_temperatureWithCelsiusKeyPath:()WFAdditions fahrenheitKeyPath:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "wf_objectOfKind:forKeyPath:", objc_opt_class(), v6);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v8 | v9)
  {
    v10 = (void *)objc_opt_new();
    if (v8)
    {
      objc_msgSend((id)v8, "doubleValue");
      objc_msgSend(v10, "setCelsius:");
    }
    if (v9)
    {
      objc_msgSend((id)v9, "doubleValue");
      objc_msgSend(v10, "setFahrenheit:");
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)wf_integerForKeyPath:()WFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "wf_numberForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "wf_stringForKeyPath:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "integerValue");
  return v9;
}

- (float)wf_floatForKeyPath:()WFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  float v9;
  float v10;

  v4 = a3;
  objc_msgSend(a1, "wf_numberForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "wf_stringForKeyPath:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "floatValue");
  v10 = v9;

  return v10;
}

- (double)wf_doubleForKeyPath:()WFAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a1, "wf_numberForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "wf_stringForKeyPath:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (id)wf_filter:()WFAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __39__NSDictionary_WFAdditions__wf_filter___block_invoke;
    v12 = &unk_24CCA1EA8;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v9);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v6, v9, v10, v11, v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

@end
