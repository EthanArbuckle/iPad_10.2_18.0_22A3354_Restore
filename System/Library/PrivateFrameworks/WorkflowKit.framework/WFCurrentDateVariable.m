@implementation WFCurrentDateVariable

- (WFCurrentDateVariable)initWithAggrandizements:(id)a3
{
  void *v4;
  WFCurrentDateVariable *v5;

  WFVariableDictionaryWithAggrandizements(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v4, 0);

  return v5;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D13F20];
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v5, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D13EA8];
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionWithItems:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11, 0);

}

- (id)name
{
  return WFLocalizedString(CFSTR("Current Date"));
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC7DB0]);
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithSymbolName:symbolColor:background:", CFSTR("calendar"), v3, v4);

  return v5;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_opt_class());
}

@end
