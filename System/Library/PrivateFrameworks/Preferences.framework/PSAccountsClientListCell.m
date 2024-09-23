@implementation PSAccountsClientListCell

+ (int64_t)cellStyle
{
  return 3;
}

- (BOOL)canReload
{
  return 1;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PSAccountsClientListCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v11, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSAccountsClientListCell textLabel](self, "textLabel", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[PSAccountsClientListCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("cellSubtitleText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setText:", v8);
  -[PSAccountsClientListCell detailTextLabel](self, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "grayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  -[PSAccountsClientListCell setNeedsLayout](self, "setNeedsLayout");
}

@end
