@implementation SBSHomeScreenConfigurationLayout

- (SBSHomeScreenConfigurationLayout)initWithItems:(id)a3 dockItems:(id)a4
{
  id v6;
  id v7;
  SBSHomeScreenConfigurationLayout *v8;
  uint64_t v9;
  NSArray *items;
  uint64_t v11;
  NSArray *dockItems;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSHomeScreenConfigurationLayout;
  v8 = -[SBSHomeScreenConfigurationLayout init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    items = v8->_items;
    v8->_items = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    dockItems = v8->_dockItems;
    v8->_dockItems = (NSArray *)v11;

  }
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSArray *items;
  id v5;

  items = self->_items;
  v5 = a3;
  objc_msgSend(v5, "encodeCollection:forKey:", items, CFSTR("items"));
  objc_msgSend(v5, "encodeCollection:forKey:", self->_dockItems, CFSTR("dockItems"));

}

- (SBSHomeScreenConfigurationLayout)initWithBSXPCCoder:(id)a3
{
  id v4;
  SBSHomeScreenConfigurationLayout *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *items;
  uint64_t v9;
  uint64_t v10;
  NSArray *dockItems;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSHomeScreenConfigurationLayout;
  v5 = -[SBSHomeScreenConfigurationLayout init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("items"));
    v7 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v7;

    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("dockItems"));
    v10 = objc_claimAutoreleasedReturnValue();
    dockItems = v5->_dockItems;
    v5->_dockItems = (NSArray *)v10;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  v3 = (void *)objc_opt_new();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_items);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_dockItems);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSArray *items;
  uint64_t v7;
  id v8;
  id v9;
  NSArray *dockItems;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke;
  v19[3] = &unk_1E288D790;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", items, v19);
  dockItems = self->_dockItems;
  v14 = v7;
  v15 = 3221225472;
  v16 = __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke_2;
  v17 = &unk_1E288D790;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", dockItems, &v14);
  LOBYTE(dockItems) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return (char)dockItems;
}

id __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __44__SBSHomeScreenConfigurationLayout_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_items, CFSTR("items"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_dockItems, CFSTR("dockItems"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)dockItems
{
  return self->_dockItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dockItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
