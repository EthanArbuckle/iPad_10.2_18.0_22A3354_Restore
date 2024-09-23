@implementation ICQSpecifierWithSubtitleCell

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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)ICQSpecifierWithSubtitleCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v29, sel_refreshCellContentsWithSpecifier_, v4);
  -[ICQSpecifierWithSubtitleCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0, v29.receiver, v29.super_class);
  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEBB520];
  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pointSize");
  objc_msgSend(v8, "fontWithDescriptor:size:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v15);

  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v17);

  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D50]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v19);

  -[ICQSpecifierWithSubtitleCell textLabel](self, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNumberOfLines:", 5);

  -[ICQSpecifierWithSubtitleCell detailTextLabel](self, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v22);

  -[ICQSpecifierWithSubtitleCell detailTextLabel](self, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTextColor:", v24);

  -[ICQSpecifierWithSubtitleCell detailTextLabel](self, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setText:", v26);
  -[ICQSpecifierWithSubtitleCell detailTextLabel](self, "detailTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setNumberOfLines:", 15);

  -[ICQSpecifierWithSubtitleCell imageView](self, "imageView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentMode:", 1);

  -[ICQSpecifierWithSubtitleCell setNeedsLayout](self, "setNeedsLayout");
}

@end
