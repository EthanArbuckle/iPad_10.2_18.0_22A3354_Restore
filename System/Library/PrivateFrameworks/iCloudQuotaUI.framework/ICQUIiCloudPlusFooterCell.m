@implementation ICQUIiCloudPlusFooterCell

- (void)_addTopBorder
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  -[ICQUIiCloudPlusFooterCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v8 = (id)objc_msgSend(v3, "initWithFrame:", 20.0, 0.0, v5 + -20.0, 0.5);

  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

  -[ICQUIiCloudPlusFooterCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICQUIiCloudPlusFooterCell;
  -[PSTableCell layoutSubviews](&v3, sel_layoutSubviews);
  -[ICQUIiCloudPlusFooterCell _addTopBorder](self, "_addTopBorder");
  -[ICQUIiCloudPlusFooterCell setNeedsDisplay](self, "setNeedsDisplay");
}

@end
