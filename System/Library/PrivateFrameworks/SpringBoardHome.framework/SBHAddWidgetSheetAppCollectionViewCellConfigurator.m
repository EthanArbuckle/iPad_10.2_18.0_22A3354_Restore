@implementation SBHAddWidgetSheetAppCollectionViewCellConfigurator

- (SBHAddWidgetSheetAppCollectionViewCellConfigurator)initWithIconCache:(id)a3
{
  id v5;
  SBHAddWidgetSheetAppCollectionViewCellConfigurator *v6;
  SBHAddWidgetSheetAppCollectionViewCellConfigurator *v7;
  uint64_t v8;
  SBHIconImageAppearance *iconImageAppearance;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCellConfigurator;
  v6 = -[SBHAddWidgetSheetAppCollectionViewCellConfigurator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconImageCache, a3);
    +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
    v8 = objc_claimAutoreleasedReturnValue();
    iconImageAppearance = v7->_iconImageAppearance;
    v7->_iconImageAppearance = (SBHIconImageAppearance *)v8;

  }
  return v7;
}

- (void)configureCell:(id)a3 withApplicationWidgetCollection:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _hydrateCellTitle:forApplicationWidgetCollection:]((uint64_t)self, v7, v6);
  -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _hydrateCellImage:forApplicationWidgetCollection:]((id *)&self->super.isa, v7, v6);

}

- (void)_hydrateCellTitle:(void *)a3 forApplicationWidgetCollection:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v9, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v6 = v9;
    objc_msgSend(v6, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAddWidgetSheetAppCollectionViewCellTitle:", v8);

  }
}

- (void)_hydrateCellImage:(void *)a3 forApplicationWidgetCollection:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    objc_msgSend(v5, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "iconImageAppearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconImageApplicationBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!a1[1])
      {
        v10 = objc_opt_new();
        v11 = a1[1];
        a1[1] = (id)v10;

      }
      -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _cacheKeyForApplicationWidgetCollection:]((uint64_t)a1, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[1], "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(v5, "iconImageApplicationBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[2], "iconImageInfo");
        SBHGetApplicationIconImageWithImageAppearance(v14, v8, 0, v15, v16, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(a1[1], "setObject:forKey:", v13, v12);
      }

    }
    else if (v7)
    {
      objc_msgSend(a1[2], "imageForIcon:imageAppearance:options:", v7, v8, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBLogWidgets();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _hydrateCellImage:forApplicationWidgetCollection:].cold.1((uint64_t)v5, v18);

      v13 = 0;
    }
    objc_msgSend(v6, "setAddWidgetSheetAppCollectionViewCellIconImage:", v13);

  }
}

- (id)_cacheKeyForApplicationWidgetCollection:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    v3 = a2;
    objc_msgSend(v2, "iconImageInfo");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leafIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconImageApplicationBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - %@ - %.1fx%.1f@%.0fx - %.1f"), v14, v15, v5, v7, v9, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBHIconImageAppearance)iconImageAppearance
{
  return self->_iconImageAppearance;
}

- (void)setIconImageAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageAppearance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_nonAppIconImageCache, 0);
}

- (void)_hydrateCellImage:(uint64_t)a1 forApplicationWidgetCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Found nil icon for applicationWidgetCollection:%@", (uint8_t *)&v2, 0xCu);
}

@end
