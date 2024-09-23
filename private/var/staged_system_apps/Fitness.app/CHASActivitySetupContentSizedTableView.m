@implementation CHASActivitySetupContentSizedTableView

- (void)setContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHASActivitySetupContentSizedTableView;
  -[CHASActivitySetupContentSizedTableView setContentSize:](&v4, "setContentSize:", a3.width, a3.height);
  -[CHASActivitySetupContentSizedTableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[CHASActivitySetupContentSizedTableView layoutIfNeeded](self, "layoutIfNeeded");
  -[CHASActivitySetupContentSizedTableView contentSize](self, "contentSize");
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

@end
