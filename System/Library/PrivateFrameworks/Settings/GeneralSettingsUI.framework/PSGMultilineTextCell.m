@implementation PSGMultilineTextCell

- (PSGMultilineTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSGMultilineTextCell *v4;
  PSGMultilineTextCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSGMultilineTextCell;
  v4 = -[PSGMultilineTextCell initWithStyle:reuseIdentifier:](&v14, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PSTableCell titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNumberOfLines:", 0);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](v5, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PSTableCell titleLabel](v5, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v11);

    if (!v10)
  }
  return v5;
}

@end
