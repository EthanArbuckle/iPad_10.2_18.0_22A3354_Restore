@implementation TopLineView

- (TopLineView)initWithFrame:(CGRect)a3
{
  TopLineView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TopLineView;
  v3 = -[TopLineView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TopLineView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  CGContext *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGRect v11;

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v5 = CurrentContext;
    -[TopLineView bounds](self, "bounds");
    v7 = v6;
    +[CompactMonthWeekView grayLineHeight](CompactMonthWeekView, "grayLineHeight");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CompactMonthWeekView grayLineColor](CompactMonthWeekView, "grayLineColor"));
    objc_msgSend(v10, "set");

    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = v7;
    v11.size.height = v9;
    CGContextFillRect(v5, v11);
    CGContextFlush(v5);
  }
}

@end
