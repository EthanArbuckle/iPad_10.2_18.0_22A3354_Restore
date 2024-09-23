@implementation _UIScrollViewScrollIndicatorVisualStyle_CarPlay

- (id)colorForIndicatorStyle:(int64_t)a3 expanded:(BOOL)a4
{
  void *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIScrollViewScrollIndicatorVisualStyle_CarPlay;
    -[_UIScrollViewScrollIndicatorVisualStyle_iOS colorForIndicatorStyle:expanded:](&v6, sel_colorForIndicatorStyle_expanded_, a3, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0, a4, 0.68, 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
