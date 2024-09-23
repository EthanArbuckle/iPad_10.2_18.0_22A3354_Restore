@implementation CarContentSizedTableView

- (CarContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CarContentSizedTableView *v4;
  CarContentSizedTableView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CarContentSizedTableView;
  v4 = -[CarContentSizedTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[CarContentSizedTableView setAlwaysBounceHorizontal:](v4, "setAlwaysBounceHorizontal:", 0);
    -[CarContentSizedTableView setAlwaysBounceVertical:](v5, "setAlwaysBounceVertical:", 0);
    -[CarContentSizedTableView setShowsHorizontalScrollIndicator:](v5, "setShowsHorizontalScrollIndicator:", 0);
    -[CarContentSizedTableView setShowsVerticalScrollIndicator:](v5, "setShowsVerticalScrollIndicator:", 0);
  }
  return v5;
}

- (void)setContentSize:(CGSize)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarContentSizedTableView;
  -[CarContentSizedTableView setContentSize:](&v4, "setContentSize:", a3.width, a3.height);
  -[CarContentSizedTableView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  CGSize result;

  -[CarContentSizedTableView layoutIfNeeded](self, "layoutIfNeeded");
  -[CarContentSizedTableView contentSize](self, "contentSize");
  v4 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)setAlwaysBounceHorizontal:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarContentSizedTableView;
  -[CarContentSizedTableView setAlwaysBounceHorizontal:](&v3, "setAlwaysBounceHorizontal:", 0);
}

- (void)setAlwaysBounceVertical:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarContentSizedTableView;
  -[CarContentSizedTableView setAlwaysBounceVertical:](&v3, "setAlwaysBounceVertical:", 0);
}

@end
