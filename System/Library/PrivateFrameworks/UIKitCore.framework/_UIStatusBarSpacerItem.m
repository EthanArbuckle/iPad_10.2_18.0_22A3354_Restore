@implementation _UIStatusBarSpacerItem

+ (_UIStatusBarIdentifier)randomDisplayIdentifier
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
  +[_UIStatusBarIdentifier uninternedIdentifierForObject:string:](_UIStatusBarIdentifier, "uninternedIdentifierForObject:string:", v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIStatusBarIdentifier *)v5;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  return 1;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  _UIStatusBarSpacerDisplayItem *v5;
  UILayoutGuide *v6;

  v4 = a3;
  v5 = -[_UIStatusBarSpacerDisplayItem initWithIdentifier:item:]([_UIStatusBarSpacerDisplayItem alloc], "initWithIdentifier:item:", v4, self);

  v6 = objc_alloc_init(UILayoutGuide);
  -[UILayoutGuide _setAllowsNegativeDimensions:](v6, "_setAllowsNegativeDimensions:", 1);
  -[_UIStatusBarSpacerDisplayItem setLayoutGuide:](v5, "setLayoutGuide:", v6);
  -[_UIStatusBarDisplayItem setLayoutItem:](v5, "setLayoutItem:", v6);

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
  v10.super_class = (Class)_UIStatusBarSpacerItem;
  v7 = a3;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v10, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applyUpdate:", v7, v10.receiver, v10.super_class);

  return v8;
}

@end
