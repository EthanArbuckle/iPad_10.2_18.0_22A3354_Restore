@implementation SUIQueryContextBuilder

+ (id)queryContextWithPerformEntityQueryCommand:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v6, "fromSuggestion");
  else
    v8 = 0;
  objc_msgSend(MEMORY[0x24BEB0278], "searchEntityWithCommand:fromSuggestion:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setQueryKind:", 9);
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchEntities:", v11);

  objc_msgSend(v9, "displayString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSearchString:", v12);

  objc_msgSend(v10, "setWhyQuery:", 8);
  objc_msgSend(a1, "setCommonPropertiesOnQueryContext:withView:", v10, v7);

  return v10;
}

+ (id)updateQueryContext:(id)a3 withSearchString:(id)a4 showSuggestions:(BOOL)a5 view:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = a4;
  if ((isMacOS() & 1) == 0)
    objc_msgSend(v10, "incrementQueryId");
  objc_msgSend(v10, "searchEntities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v10)
    v15 = v7;
  else
    v15 = 0;
  if (!v15 && !v14)
  {
    v16 = objc_opt_new();

    v10 = (id)v16;
  }
  if (!v10)
    v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setSearchString:", v12);

  if (v7)
    v17 = 1;
  else
    v17 = 8;
  if (v7)
    v18 = 2;
  else
    v18 = 5;
  objc_msgSend(v10, "setWhyQuery:", v17);
  if (v14)
    v19 = 9;
  else
    v19 = v18;
  objc_msgSend(v10, "setQueryKind:", v19);
  objc_msgSend(a1, "setCommonPropertiesOnQueryContext:withView:", v10, v11);

  return v10;
}

+ (void)setCommonPropertiesOnQueryContext:(id)a3 withView:(id)a4
{
  id v5;
  double v6;
  double v7;
  id v8;

  v5 = a4;
  v8 = a3;
  objc_msgSend(v8, "setDeviceAuthenticationState:", +[SUIUtilities deviceAuthenticationStateForView:](SUIUtilities, "deviceAuthenticationStateForView:", v5));
  objc_msgSend(v5, "tlks_scale");
  v7 = v6;

  objc_msgSend(v8, "setScaleFactor:", v7);
}

@end
