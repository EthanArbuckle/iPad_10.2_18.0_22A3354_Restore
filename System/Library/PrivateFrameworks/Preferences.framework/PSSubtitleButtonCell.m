@implementation PSSubtitleButtonCell

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
  v11.super_class = (Class)PSSubtitleButtonCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v11, sel_refreshCellContentsWithSpecifier_, v4);
  -[PSSubtitleButtonCell textLabel](self, "textLabel", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[PSSubtitleButtonCell detailTextLabel](self, "detailTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("cellSubtitleText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v4, "propertyForKey:", CFSTR("cellSubtitleColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PSSubtitleButtonCell detailTextLabel](self, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
  -[PSSubtitleButtonCell setNeedsLayout](self, "setNeedsLayout");

}

@end
