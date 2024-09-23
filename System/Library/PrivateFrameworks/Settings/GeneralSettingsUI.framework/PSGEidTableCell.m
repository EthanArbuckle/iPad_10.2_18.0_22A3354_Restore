@implementation PSGEidTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSGEidTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSGEidTableCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSGEidTableCell;
  v4 = -[PSGEidTableCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "altTextColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PSGEidTableCell detailTextLabel](v4, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    if (!v6)
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGEidTableCell detailTextLabel](v4, "detailTextLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    -[PSGEidTableCell detailTextLabel](v4, "detailTextLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNumberOfLines:", 0);

  }
  return v4;
}

@end
