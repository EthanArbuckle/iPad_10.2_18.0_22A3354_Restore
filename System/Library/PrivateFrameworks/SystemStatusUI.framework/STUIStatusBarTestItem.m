@implementation STUIStatusBarTestItem

- (id)dependentEntryKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  if (self->_overrideDependentEntryKeys)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[STUIStatusBarItem identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[STUIStatusBarTestData dependentDataKeyForItemIdentifier:](STUIStatusBarTestData, "dependentDataKeyForItemIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithObject:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)identifierForIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemIdentifierFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)displayIdentifierForIndex:(int64_t)a3 displayIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "identifierForIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "displayItemIdentifierFromIdentifier:string:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (STUIStatusBarTestItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  STUIStatusBarTestItem *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTestItem;
  v4 = -[STUIStatusBarItem initWithIdentifier:statusBar:](&v7, sel_initWithIdentifier_statusBar_, a3, a4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarTestItem setStringViews:](v4, "setStringViews:", v5);

  return v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4;
  STUIStatusBarStringView *v5;
  STUIStatusBarStringView *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stringViews, "objectForKeyedSubscript:", v4);
  v5 = (STUIStatusBarStringView *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = [STUIStatusBarStringView alloc];
    v5 = -[STUIStatusBarStringView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarStringView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stringViews, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)_defaultStringFromDisplayIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STUIStatusBarTestItem;
  v6 = a4;
  v7 = a3;
  -[STUIStatusBarItem applyUpdate:toDisplayItem:](&v20, sel_applyUpdate_toDisplayItem_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data", v20.receiver, v20.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "testEntries");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STUIStatusBarTestData dependentDataKeyForDisplayItemIdentifier:](STUIStatusBarTestData, "dependentDataKeyForDisplayItemIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarTestItem viewForIdentifier:](self, "viewForIdentifier:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v13, "stringValue");
  else
    -[STUIStatusBarTestItem _defaultStringFromDisplayIdentifier:](self, "_defaultStringFromDisplayIdentifier:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);
  -[STUIStatusBarTestItem otherAnimation](self, "otherAnimation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[STUIStatusBarTestItem otherAnimation](self, "otherAnimation");
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v18;
  }

  return v8;
}

- (NSArray)overrideDependentEntryKeys
{
  return self->_overrideDependentEntryKeys;
}

- (void)setOverrideDependentEntryKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (STUIStatusBarAnimation)additionAnimation
{
  return self->_additionAnimation;
}

- (void)setAdditionAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_additionAnimation, a3);
}

- (STUIStatusBarAnimation)removalAnimation
{
  return self->_removalAnimation;
}

- (void)setRemovalAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_removalAnimation, a3);
}

- (STUIStatusBarAnimation)otherAnimation
{
  return self->_otherAnimation;
}

- (void)setOtherAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_otherAnimation, a3);
}

- (NSMutableDictionary)stringViews
{
  return self->_stringViews;
}

- (void)setStringViews:(id)a3
{
  objc_storeStrong((id *)&self->_stringViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringViews, 0);
  objc_storeStrong((id *)&self->_otherAnimation, 0);
  objc_storeStrong((id *)&self->_removalAnimation, 0);
  objc_storeStrong((id *)&self->_additionAnimation, 0);
  objc_storeStrong((id *)&self->_overrideDependentEntryKeys, 0);
}

@end
