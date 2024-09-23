@implementation CollapsedCellBackgroundView

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CollapsedCellBackgroundView;
  -[CollapsedCellBackgroundView layoutSubviews](&v6, "layoutSubviews");
  -[CollapsedCellBackgroundView bounds](self, "bounds");
  v4 = v3 * 0.5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollapsedCellBackgroundView layer](self, "layer"));
  objc_msgSend(v5, "setCornerRadius:", v4);

}

@end
