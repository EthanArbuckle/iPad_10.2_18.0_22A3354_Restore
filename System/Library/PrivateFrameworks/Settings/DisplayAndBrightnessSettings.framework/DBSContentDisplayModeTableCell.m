@implementation DBSContentDisplayModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (DBSContentDisplayModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DBSContentDisplayModeTableCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DBSContentDisplayModeTableCell;
  v4 = -[DBSContentDisplayModeTableCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSContentDisplayModeTableCell detailTextLabel](v4, "detailTextLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSContentDisplayModeTableCell detailTextLabel](v4, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    -[DBSContentDisplayModeTableCell detailTextLabel](v4, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

  }
  return v4;
}

@end
