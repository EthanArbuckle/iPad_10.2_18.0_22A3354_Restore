@implementation WFDeviceDetailsVariable

- (WFDeviceDetailsVariable)initWithAggrandizements:(id)a3
{
  void *v4;
  WFDeviceDetailsVariable *v5;

  WFVariableDictionaryWithAggrandizements(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v4, 0);

  return v5;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  void (**v4)(id, void *, _QWORD);
  Class v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a4;
  v5 = NSClassFromString(CFSTR("WFDeviceDetailsContentItem"));
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class itemWithObject:named:](v5, "itemWithObject:named:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D13EA8];
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "collectionWithItems:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v12, 0);

}

- (id)name
{
  return WFLocalizedString(CFSTR("Device Details"));
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0DC7DB0]);
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithSymbolName:symbolColor:background:", v4, v5, v6);

  return v7;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", NSClassFromString(CFSTR("WFDeviceDetailsContentItem")), 0);
}

@end
