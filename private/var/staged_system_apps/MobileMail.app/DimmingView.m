@implementation DimmingView

- (DimmingView)initWithFrame:(CGRect)a3
{
  DimmingView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DimmingView;
  v3 = -[DimmingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0274509806, 0.0431372561, 0.0666666701, 0.5));
    -[DimmingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DimmingView delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "dimmingViewWasTapped:", self);

}

- (BOOL)transparent
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DimmingView backgroundColor](self, "backgroundColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)setTransparent:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0274509806, 0.0431372561, 0.0666666701, 0.5));
  v5 = (id)v4;
  -[DimmingView setBackgroundColor:](self, "setBackgroundColor:", v4);

}

- (DimmingViewDelegate)delegate
{
  return (DimmingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
