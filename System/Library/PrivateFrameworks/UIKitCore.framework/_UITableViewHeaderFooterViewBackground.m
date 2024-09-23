@implementation _UITableViewHeaderFooterViewBackground

- (_UITableViewHeaderFooterViewBackground)initWithFrame:(CGRect)a3
{
  _UITableViewHeaderFooterViewBackground *v3;
  _UITableViewHeaderFooterViewBackground *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITableViewHeaderFooterViewBackground;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  return v4;
}

- (void)applyBackgroundConfiguration:(id)a3
{
  id v4;
  _UISystemBackgroundView *systemBackgroundView;
  _UISystemBackgroundView *v6;
  _UISystemBackgroundView *v7;
  void *v8;
  id v9;

  v4 = a3;
  systemBackgroundView = self->_systemBackgroundView;
  v9 = v4;
  if (!v4 || systemBackgroundView)
  {
    -[UIView setHidden:](systemBackgroundView, "setHidden:", v4 == 0);
    if (v9)
    {
      -[_UISystemBackgroundView setConfiguration:](self->_systemBackgroundView, "setConfiguration:", v9);
    }
    else
    {
      +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISystemBackgroundView setConfiguration:](self->_systemBackgroundView, "setConfiguration:", v8);

    }
  }
  else
  {
    v6 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v4);
    v7 = self->_systemBackgroundView;
    self->_systemBackgroundView = v6;

    -[UIView setAutoresizingMask:](self->_systemBackgroundView, "setAutoresizingMask:", 18);
    -[UIView bounds](self, "bounds");
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_systemBackgroundView, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
}

@end
