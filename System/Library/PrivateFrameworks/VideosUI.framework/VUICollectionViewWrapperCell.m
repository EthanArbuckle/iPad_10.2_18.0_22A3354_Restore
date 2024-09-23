@implementation VUICollectionViewWrapperCell

- (void)setChildView:(id)a3
{
  UIView *v5;
  UIView **p_childView;
  UIView *childView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_childView = &self->_childView;
  childView = self->_childView;
  if (childView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](childView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_childView, a3);
    if (*p_childView)
    {
      -[VUICollectionViewWrapperCell contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_childView);

    }
    -[VUICollectionViewWrapperCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UIView *childView;
  double v4;
  double v5;
  CGSize result;

  childView = self->_childView;
  if (childView)
  {
    -[UIView sizeThatFits:](childView, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  UIView *childView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUICollectionViewWrapperCell;
  -[VUICollectionViewWrapperCell layoutSubviews](&v5, sel_layoutSubviews);
  childView = self->_childView;
  -[VUICollectionViewWrapperCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UIView setFrame:](childView, "setFrame:");

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  UIView *childView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUICollectionViewWrapperCell;
  -[VUICollectionViewWrapperCell prepareForReuse](&v6, sel_prepareForReuse);
  -[VUICollectionViewWrapperCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  childView = self->_childView;
  self->_childView = 0;

}

- (UIView)childView
{
  return self->_childView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childView, 0);
}

@end
