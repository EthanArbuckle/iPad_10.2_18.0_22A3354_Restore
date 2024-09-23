@implementation PSGShrinkingTextCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PSTableCell titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);

  -[PSTableCell titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  v5.receiver = self;
  v5.super_class = (Class)PSGShrinkingTextCell;
  -[PSTableCell layoutSubviews](&v5, sel_layoutSubviews);
}

@end
