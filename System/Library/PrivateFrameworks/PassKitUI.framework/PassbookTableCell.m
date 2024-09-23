@implementation PassbookTableCell

- (PassbookTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PassbookTableCell *v9;
  PassbookTableCell *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PassbookTableCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v12, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
    -[PassbookTableCell _updateActivityIndicatorForSpecifier:](v9, "_updateActivityIndicatorForSpecifier:", v8);

  return v10;
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PassbookTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v5, sel_refreshCellContentsWithSpecifier_, v4);
  -[PassbookTableCell _updateActivityIndicatorForSpecifier:](self, "_updateActivityIndicatorForSpecifier:", v4, v5.receiver, v5.super_class);

}

- (void)_updateActivityIndicatorForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PKSettingsSpecifierLoadingKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4 && objc_msgSend(v4, "BOOLValue"))
  {
    -[PassbookTableCell accessoryView](self, "accessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v6, "startAnimating");
      -[PassbookTableCell setAccessoryView:](self, "setAccessoryView:", v6);

    }
  }
  else
  {
    -[PassbookTableCell setAccessoryView:](self, "setAccessoryView:", 0);
  }

}

@end
