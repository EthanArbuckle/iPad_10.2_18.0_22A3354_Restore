@implementation ButtonCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ButtonCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, a3);
  -[ButtonCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

  -[ButtonCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightedTextColor:", v7);

  -[ButtonCell textLabel](self, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ButtonCell traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isAXEnabled"))
    v10 = 3;
  else
    v10 = 2;
  objc_msgSend(v8, "setNumberOfLines:", v10);

  v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "vui_keyColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  -[ButtonCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v11);
}

@end
