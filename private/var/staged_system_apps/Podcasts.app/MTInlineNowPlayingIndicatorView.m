@implementation MTInlineNowPlayingIndicatorView

+ (double)maximumLevelHeightDefault
{
  return 13.0;
}

+ (double)maximumLevelHeightMin
{
  return 7.0;
}

+ (double)maximumLevelHeightMax
{
  return 26.0;
}

- (MTInlineNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  MTInlineNowPlayingIndicatorView *v3;
  MTInlineNowPlayingIndicatorView *v4;
  void *v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTInlineNowPlayingIndicatorView;
  v3 = -[MTInlineNowPlayingIndicatorView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTInlineNowPlayingIndicatorView setBounceStyle:](v3, "setBounceStyle:", 1);
    -[MTInlineNowPlayingIndicatorView setNumberOfLevels:](v4, "setNumberOfLevels:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "scale");
    v7 = v6;

    -[MTInlineNowPlayingIndicatorView setLevelCornerRadius:](v4, "setLevelCornerRadius:", 1.0 / v7);
    objc_msgSend((id)objc_opt_class(v4), "maximumLevelHeightDefault");
    -[MTInlineNowPlayingIndicatorView setMaximumLevelHeight:](v4, "setMaximumLevelHeight:");
  }
  return v4;
}

- (BOOL)playing
{
  return -[MTInlineNowPlayingIndicatorView playbackState](self, "playbackState") == (id)1;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MTInlineNowPlayingIndicatorView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)MTInlineNowPlayingIndicatorView;
    -[MTInlineNowPlayingIndicatorView setFrame:](&v12, "setFrame:", x, y, width, height);
    -[MTInlineNowPlayingIndicatorView adjustBarHeightToSize](self, "adjustBarHeightToSize");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MTInlineNowPlayingIndicatorView bounds](self, "bounds");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)MTInlineNowPlayingIndicatorView;
    -[MTInlineNowPlayingIndicatorView setBounds:](&v12, "setBounds:", x, y, width, height);
    -[MTInlineNowPlayingIndicatorView adjustBarHeightToSize](self, "adjustBarHeightToSize");
  }
}

- (CGSize)sizeThatFitsBarHeight:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend((id)objc_opt_class(self), "maximumLevelHeightMax");
  if (v5 <= a3)
    a3 = v5;
  objc_msgSend((id)objc_opt_class(self), "maximumLevelHeightMin");
  if (a3 < v6)
    a3 = v6;
  -[MTInlineNowPlayingIndicatorView frame](self, "frame");
  -[MTInlineNowPlayingIndicatorView sizeThatFits:](self, "sizeThatFits:", v7, a3);
  v9 = a3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)adjustBarHeightToSize
{
  double v3;

  -[MTInlineNowPlayingIndicatorView frame](self, "frame");
  -[MTInlineNowPlayingIndicatorView setMaximumLevelHeight:](self, "setMaximumLevelHeight:", v3);
}

- (NSString)accessibilityIdentifier
{
  MTInlineNowPlayingIndicatorView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  MTInlineNowPlayingIndicatorView.accessibilityIdentifier.getter();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end
