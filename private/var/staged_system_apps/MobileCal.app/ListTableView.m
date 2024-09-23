@implementation ListTableView

- (ListTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  ListTableView *v4;
  ListTableView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ListTableView;
  v4 = -[ListTableView initWithFrame:style:](&v7, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[ListTableView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[ListTableView setSeparatorStyle:](v5, "setSeparatorStyle:", 0);
    -[ListTableView _setMarginWidth:](v5, "_setMarginWidth:", 0.0);
    -[ListTableView setSectionHeaderTopPadding:](v5, "setSectionHeaderTopPadding:", 24.0);
  }
  return v5;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ListTableView;
  -[ListTableView willMoveToWindow:](&v5, "willMoveToWindow:", v4);
  if (v4)
  {
    if (self->_layoutOnJoiningViewHierarchy)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy(v4);
      -[ListTableView layoutSubviews](self, "layoutSubviews");
      EKUIPopFallbackSizingContextWithViewHierarchy(v4);
      self->_layoutOnJoiningViewHierarchy = 0;
    }
    objc_storeWeak((id *)&self->_lastKnownWindow, v4);
  }

}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  id WeakRetained;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ListTableView window](self, "window"));
  if (v3)
  {

LABEL_4:
    v4 = 0;
    goto LABEL_5;
  }
  if ((EKUIHasFallbackSizingContext() & 1) != 0)
    goto LABEL_4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastKnownWindow);

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)&self->_lastKnownWindow);
    EKUIPushFallbackSizingContextWithViewHierarchy(v4);
  }
  else
  {
    v4 = 0;
    self->_layoutOnJoiningViewHierarchy = 1;
  }
LABEL_5:
  v6.receiver = self;
  v6.super_class = (Class)ListTableView;
  -[ListTableView layoutSubviews](&v6, "layoutSubviews");
  if (v4)
    EKUIPopFallbackSizingContextWithViewHierarchy(v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastKnownWindow);
}

@end
