@implementation STAppTitleSubtitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (BOOL)isAppCell
{
  return 1;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)STAppTitleSubtitleCell;
  -[PSTableCell layoutSubviews](&v14, sel_layoutSubviews);
  if (objc_msgSend((id)objc_opt_class(), "cellStyle") == 3
    && !-[STAppTitleSubtitleCell hasSubtitle](self, "hasSubtitle"))
  {
    -[STAppTitleSubtitleCell textLabel](self, "textLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    -[STAppTitleSubtitleCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = round((v11 - v9) * 0.5);

    -[STAppTitleSubtitleCell textLabel](self, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v12, v7, v9);

  }
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[PSTableCell specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("STAppBundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)STAppTitleSubtitleCell;
  -[PSTableCell setSpecifier:](&v10, sel_setSpecifier_, v4);
  if (-[STAppTitleSubtitleCell isAppCell](self, "isAppCell"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STAppBundleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v6)
    {
LABEL_9:

      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) != 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v8, "removeObserver:bundleIdentifier:", self, v6);
      objc_msgSend(v9, "removeObserver:bundleIdentifier:", self, v6);
    }
    if (v7)
    {
      objc_msgSend(v8, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfoOrIcon_, v7);
      objc_msgSend(v9, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfoOrIcon_, v7);
    }
    goto LABEL_8;
  }
LABEL_10:

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STAppTitleSubtitleCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v17, sel_refreshCellContentsWithSpecifier_, v4);
  if (objc_msgSend((id)objc_opt_class(), "cellStyle") == 3)
  {
    -[STAppTitleSubtitleCell detailTextLabel](self, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STAppTitleSubtitleCell setHasSubtitle:](self, "setHasSubtitle:", v7 != 0);
    if (-[STAppTitleSubtitleCell hasSubtitle](self, "hasSubtitle"))
    {
      objc_msgSend(v5, "setText:", v7);
      objc_msgSend(MEMORY[0x24BEBD4B8], "grayColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTextColor:", v8);

    }
    else
    {
      objc_msgSend(v5, "setText:", CFSTR(" "));
    }

  }
  if (-[STAppTitleSubtitleCell isAppCell](self, "isAppCell"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("STAppBundleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appInfoForBundleIdentifier:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageForBundleIdentifier:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
      v14 = 0;
    }
    -[STAppTitleSubtitleCell textLabel](self, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v12);

    -[STAppTitleSubtitleCell imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", v14);

  }
  -[STAppTitleSubtitleCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_didFetchAppInfoOrIcon:(id)a3
{
  void *v4;
  void *v5;

  -[PSTableCell specifier](self, "specifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[STAppTitleSubtitleCell refreshCellContentsWithSpecifier:](self, "refreshCellContentsWithSpecifier:", v4);
    v4 = v5;
  }

}

- (BOOL)hasSubtitle
{
  return self->_hasSubtitle;
}

- (void)setHasSubtitle:(BOOL)a3
{
  self->_hasSubtitle = a3;
}

@end
