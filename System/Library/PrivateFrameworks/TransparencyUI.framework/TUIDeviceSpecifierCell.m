@implementation TUIDeviceSpecifierCell

- (id)blankIcon
{
  if (blankIcon_onceToken != -1)
    dispatch_once(&blankIcon_onceToken, &__block_literal_global_17);
  return (id)blankIcon__blankIcon;
}

void __35__TUIDeviceSpecifierCell_blankIcon__block_invoke()
{
  uint64_t v0;
  void *v1;
  CGSize v2;

  v2.height = 40.0;
  v2.width = 29.0;
  UIGraphicsBeginImageContextWithOptions(v2, 0, 0.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v0 = objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v1 = (void *)blankIcon__blankIcon;
  blankIcon__blankIcon = v0;

}

- (id)getLazyIcon
{
  TUIDeviceImage *v3;
  id v4;
  TUIDeviceImage *v5;
  objc_super v7;

  v3 = [TUIDeviceImage alloc];
  v7.receiver = self;
  v7.super_class = (Class)TUIDeviceSpecifierCell;
  -[PSTableCell getLazyIcon](&v7, sel_getLazyIcon);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = -[TUIDeviceImage initWithCGImage:](v3, "initWithCGImage:", objc_msgSend(v4, "CGImage"));

  return v5;
}

+ (int64_t)cellStyle
{
  return 3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)TUIDeviceSpecifierCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v22, sel_refreshCellContentsWithSpecifier_, v4);
  -[TUIDeviceSpecifierCell textLabel](self, "textLabel", v22.receiver, v22.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[TUIDeviceSpecifierCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v8);

  -[TUIDeviceSpecifierCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  -[TUIDeviceSpecifierCell textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 0);

  -[TUIDeviceSpecifierCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  -[TUIDeviceSpecifierCell detailTextLabel](self, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  -[TUIDeviceSpecifierCell detailTextLabel](self, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTextColor:", v16);

  -[TUIDeviceSpecifierCell detailTextLabel](self, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setText:", v18);
  -[TUIDeviceSpecifierCell detailTextLabel](self, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLineBreakMode:", 0);

  -[TUIDeviceSpecifierCell detailTextLabel](self, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNumberOfLines:", 0);

  -[TUIDeviceSpecifierCell imageView](self, "imageView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentMode:", 2);

  -[TUIDeviceSpecifierCell setNeedsLayout](self, "setNeedsLayout");
}

@end
