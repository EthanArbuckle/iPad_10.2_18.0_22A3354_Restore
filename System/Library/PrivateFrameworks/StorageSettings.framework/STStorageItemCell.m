@implementation STStorageItemCell

+ (id)specifierForItemURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = a3;
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, 0, 0, 0, 0, -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "setProperty:forKey:", v4, CFSTR("stItemURL"));

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  STStorageItemCell *v17;
  id v18;
  _QWORD v19[5];
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STStorageItemCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v20, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stItemURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDE5EF0]);
    ScreenScale();
    v8 = (void *)objc_msgSend(v6, "initWithFileAtURL:size:scale:representationTypes:", v5, 4, 29.0, 29.0, v7);
    objc_msgSend(MEMORY[0x24BDE5EF8], "sharedGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke;
    v19[3] = &unk_24C756AF0;
    v19[4] = self;
    objc_msgSend(v9, "generateBestRepresentationForRequest:completionHandler:", v8, v19);

    v18 = 0;
    objc_msgSend(v5, "getResourceValue:forKey:error:", &v18, *MEMORY[0x24BDBCCC0], 0);
    v11 = v18;
    if (!objc_msgSend(v11, "length"))
    {
      objc_msgSend(v5, "URLByDeletingPathExtension");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v13;
    }
    -[STStorageTableCell setTitle:](self, "setTitle:", v11);
    dispatch_get_global_queue(9, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_3;
    v15[3] = &unk_24C7569C8;
    v16 = v5;
    v17 = self;
    dispatch_async(v14, v15);

  }
  else
  {
    -[STStorageTableCell setIcon:](self, "setIcon:", 0);
    -[STStorageTableCell setTitle:](self, "setTitle:", CFSTR("<No URL specified>"));
    -[STStorageTableCell setInfo:](self, "setInfo:", 0);
    -[STStorageTableCell setSize:](self, "setSize:", 0);
    NSLog(CFSTR("Error: no URL provided in specifier"));
  }

}

void __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_2;
  block[3] = &unk_24C756AC8;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 40))
    PSBlankIconImage();
  else
    objc_msgSend(*(id *)(a1 + 48), "UIImage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIcon:", v2);

}

void __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  v20 = 0;
  objc_msgSend(v2, "getResourceValue:forKey:error:", &v20, *MEMORY[0x24BDBCCE8], 0);
  v3 = v20;
  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    v19 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v19, *MEMORY[0x24BDBCC00], 0);
    v3 = v19;
  }
  v5 = *(void **)(a1 + 32);
  v18 = 0;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v18, *MEMORY[0x24BDBCBD8], 0);
  v6 = v18;
  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    v17 = 0;
    objc_msgSend(v7, "getResourceValue:forKey:error:", &v17, *MEMORY[0x24BDBCBE0], 0);
    v6 = v17;
    if (!v6)
    {
      v8 = *(void **)(a1 + 32);
      v16 = 0;
      objc_msgSend(v8, "getResourceValue:forKey:error:", &v16, *MEMORY[0x24BDBCBF0], 0);
      v6 = v16;
      if (!v6)
        goto LABEL_8;
    }
  }
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  if (v9 != 0.0)
  {
    STFormattedShortDate();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_8:
    v10 = 0;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_4;
  v13[3] = &unk_24C756AC8;
  v13[4] = *(_QWORD *)(a1 + 40);
  v14 = v10;
  v15 = v3;
  v11 = v3;
  v12 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

}

uint64_t __54__STStorageItemCell_refreshCellContentsWithSpecifier___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setInfo:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setSize:", objc_msgSend(*(id *)(a1 + 48), "longLongValue"));
}

@end
