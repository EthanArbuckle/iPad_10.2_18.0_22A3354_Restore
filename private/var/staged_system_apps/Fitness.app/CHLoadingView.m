@implementation CHLoadingView

- (CHLoadingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CHLoadingView *v7;
  UIActivityIndicatorView *v8;
  UIActivityIndicatorView *indicatorView;
  void *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CHLoadingView;
  v7 = -[CHLoadingView initWithFrame:](&v12, "initWithFrame:");
  if (v7)
  {
    v8 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", x, y, width, height);
    indicatorView = v7->_indicatorView;
    v7->_indicatorView = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[CHLoadingView setBackgroundColor:](v7, "setBackgroundColor:", v10);

    -[CHLoadingView addSubview:](v7, "addSubview:", v7->_indicatorView);
  }
  return v7;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

@end
