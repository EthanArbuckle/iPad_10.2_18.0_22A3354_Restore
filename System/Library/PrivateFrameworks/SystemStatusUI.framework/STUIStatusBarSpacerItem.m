@implementation STUIStatusBarSpacerItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

+ (STUIStatusBarIdentifier)randomDisplayIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarIdentifier uninternedIdentifierForObject:string:](STUIStatusBarIdentifier, "uninternedIdentifierForObject:string:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (STUIStatusBarIdentifier *)v5;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  STUIStatusBarSpacerDisplayItem *v5;
  id v6;

  v4 = a3;
  v5 = -[STUIStatusBarSpacerDisplayItem initWithIdentifier:item:]([STUIStatusBarSpacerDisplayItem alloc], "initWithIdentifier:item:", v4, self);

  v6 = objc_alloc_init(MEMORY[0x1E0DC39A0]);
  objc_msgSend(v6, "_setAllowsNegativeDimensions:", 1);
  -[STUIStatusBarSpacerDisplayItem setLayoutGuide:](v5, "setLayoutGuide:", v6);
  -[STUIStatusBarDisplayItem setLayoutItem:](v5, "setLayoutItem:", v6);

  return v5;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)STUIStatusBarSpacerItem;
  v7 = a3;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v10, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyUpdate:", v7, v10.receiver, v10.super_class);

  return v8;
}

@end
