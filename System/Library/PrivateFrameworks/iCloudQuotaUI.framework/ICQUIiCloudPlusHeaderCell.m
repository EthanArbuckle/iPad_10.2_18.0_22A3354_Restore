@implementation ICQUIiCloudPlusHeaderCell

+ (int64_t)cellStyle
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICQUIiCloudPlusHeaderCell;
  -[PSTableCell layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIiCloudPlusHeaderCell setSeparatorColor:](self, "setSeparatorColor:", v3);

  -[ICQUIiCloudPlusHeaderCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE1D0], *MEMORY[0x24BEBB5E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  -[ICQUIiCloudPlusHeaderCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v7);

  -[ICQUIiCloudPlusHeaderCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUIiCloudPlusHeaderCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v7, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75D50], v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQUIiCloudPlusHeaderCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
