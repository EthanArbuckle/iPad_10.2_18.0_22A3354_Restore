@implementation STStorageAppCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  STStorageAppCell *v26;
  _QWORD v27[5];
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)STStorageAppCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v28, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stStorageApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageTableCell setTitle:](self, "setTitle:", v7);

    objc_msgSend(v4, "propertyForKey:", CFSTR("stIcon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[STStorageTableCell setIcon:](self, "setIcon:", v8);
    }
    else
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke;
      v27[3] = &unk_24C756978;
      v27[4] = self;
      STLoadTableIconForApp(v6, v27);
    }
    objc_msgSend(v6, "lastUsedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9 || (objc_msgSend(v9, "timeIntervalSinceReferenceDate"), v11 == 0.0))
    {
      v15 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      if (LastUsedFormatString_onceToken != -1)
        dispatch_once(&LastUsedFormatString_onceToken, &__block_literal_global_24);
      v13 = (id)LastUsedFormatString__lastUsedFormat;
      STFormattedShortDate();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[STStorageTableCell setInfo:](self, "setInfo:", v15);
    -[STStorageTableCell setInfoHidden:](self, "setInfoHidden:", objc_msgSend(v15, "length") == 0);
    objc_msgSend(v4, "propertyForKey:", CFSTR("stCloudIconHidden"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = objc_msgSend(v16, "BOOLValue");
    else
      v18 = objc_msgSend(v6, "isDemoted") ^ 1;
    -[STStorageTableCell setCloudIconHidden:](self, "setCloudIconHidden:", v18);
    objc_msgSend(v6, "appSizeIfComputed");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = objc_msgSend(v19, "userTotal");
      STFormattedSize();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[STStorageTableCell setSize:](self, "setSize:", v21);
      -[STStorageTableCell setSizeString:](self, "setSizeString:", v22);
    }
    else
    {
      STSharedConcurrentQueue();
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_2;
      block[3] = &unk_24C7569C8;
      v25 = v6;
      v26 = self;
      dispatch_async(v23, block);

      v22 = v25;
    }

  }
}

- (STStorageAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  STStorageAppCell *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)STStorageAppCell;
  v9 = -[STStorageTableCell initWithStyle:reuseIdentifier:specifier:](&v14, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "propertyForKey:", CFSTR("stStorageApp"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("App:%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STStorageAppCell setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v12);

    }
  }

  return v9;
}

+ (id)specifierForStorageApp:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = a3;
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, 0, 0, 0, 0, 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "setProperty:forKey:", v4, CFSTR("stStorageApp"));

  return v5;
}

+ (id)specifierForChildApp:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = specifierForChildApp__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&specifierForChildApp__onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, a1, 0, 0, specifierForChildApp___appDetailClass, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "appIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75AC0]);

  objc_msgSend(v6, "setProperty:forKey:", v5, CFSTR("stStorageApp"));
  return v6;
}

Class __41__STStorageAppCell_specifierForChildApp___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("STStorageAppDetailController"));
  specifierForChildApp___appDetailClass = (uint64_t)result;
  return result;
}

+ (id)specifierForAppIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BEB1C80];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  +[STStorageAppCell specifierForStorageApp:](STStorageAppCell, "specifierForStorageApp:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)specifierForAppBundleURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageAppCell specifierForAppIdentifier:](STStorageAppCell, "specifierForAppIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specifierForAppProxy:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageAppCell specifierForAppIdentifier:](STStorageAppCell, "specifierForAppIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIcon:", a2);
}

void __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  _QWORD block[5];
  __CFString *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "appSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userTotal");
  if (v3 != objc_msgSend(*(id *)(a1 + 40), "size"))
  {
    if (v2)
    {
      STFormattedSize();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = &stru_24C756F10;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_3;
    block[3] = &unk_24C7569A0;
    v5 = *(_QWORD *)(a1 + 40);
    v8 = v4;
    v9 = v3;
    block[4] = v5;
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __53__STStorageAppCell_refreshCellContentsWithSpecifier___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSize:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setSizeString:", *(_QWORD *)(a1 + 40));
}

@end
