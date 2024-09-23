@implementation SXHiddenComponentRemovalModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v5 = a3;
  objc_msgSend(a4, "specVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("1.6"), "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (objc_msgSend(v8, "count") | v9)
  {
    v10 = 0;
    while (1)
    {
      v11 = CFSTR("0");
      if (v10 < objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndex:", v10);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v12 = CFSTR("0");
      if (v10 < objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "objectAtIndex:", v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v13 = -[__CFString compare:options:](v11, "compare:options:", v12, 64);

      if (v13)
        break;
      ++v10;
      v14 = objc_msgSend(v7, "count");
      v15 = objc_msgSend(v8, "count");
      if (v14 <= v15)
        v16 = v15;
      else
        v16 = v14;
      if (v10 >= v16)
        goto LABEL_12;
    }
  }
  else
  {
LABEL_12:
    v13 = 0;
  }

  if (v13 != 1)
  {
    objc_msgSend(v5, "components");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__SXHiddenComponentRemovalModifier_modifyDOM_context___block_invoke;
    v18[3] = &unk_24D68E0B8;
    v19 = v5;
    objc_msgSend(v17, "enumerateComponentsWithBlock:", v18);

  }
}

uint64_t __54__SXHiddenComponentRemovalModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "hidden"))
  {
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeComponentWithIdentifier:", v7);

    objc_msgSend(*(id *)(a1 + 32), "analysis");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conditionalObjectAnalysis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SXConditionTypes();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeComponentIdentifier:conditionTypes:", v10, v11);

  }
  return 1;
}

@end
