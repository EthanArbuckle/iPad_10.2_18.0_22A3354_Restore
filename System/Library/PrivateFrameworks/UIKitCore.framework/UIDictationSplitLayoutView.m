@implementation UIDictationSplitLayoutView

- (UIDictationSplitLayoutView)initWithFrame:(CGRect)a3
{
  UIDictationSplitLayoutView *v3;
  UIDictationSplitLayoutView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIDictationSplitLayoutView;
  v3 = -[UIDictationLayoutView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIDictationView removeBackgroundView](v3, "removeBackgroundView");
  return v4;
}

@end
