@implementation WFDayOfWeekButton

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)WFDayOfWeekButton;
  -[WFDayOfWeekButton layoutSubviews](&v5, sel_layoutSubviews);
  -[WFDayOfWeekButton bounds](self, "bounds");
  v3 = CGRectGetWidth(v6) * 0.5;
  -[WFDayOfWeekButton layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

@end
