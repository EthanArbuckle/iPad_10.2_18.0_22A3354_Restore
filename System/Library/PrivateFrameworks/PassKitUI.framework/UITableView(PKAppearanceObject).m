@implementation UITableView(PKAppearanceObject)

- (id)pk_childrenForAppearance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tableHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "tableHeaderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(a1, "tableFooterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "tableFooterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  objc_msgSend(a1, "visibleCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v7);

  return v2;
}

- (uint64_t)pk_applyAppearance:()PKAppearanceObject
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v5);

  objc_msgSend(a1, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v4, "tableViewSeparatorColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSeparatorColor:", v8);

  objc_msgSend(v4, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSectionIndexColor:", v9);

  objc_msgSend(v4, "foregroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSectionIndexBackgroundColor:", v10);

  LODWORD(v10) = objc_msgSend(v4, "hasDarkAppearance");
  if ((_DWORD)v10)
    v11 = 2;
  else
    v11 = 0;
  return objc_msgSend(a1, "setIndicatorStyle:", v11);
}

@end
