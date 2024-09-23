@implementation SBSystemApertureSceneElementPlaceholderWrapperView

- (SBSystemApertureSceneElementPlaceholderWrapperView)initWithContentView:(id)a3
{
  id v5;
  SBSystemApertureSceneElementPlaceholderWrapperView *v6;
  SBSystemApertureSceneElementPlaceholderWrapperView *v7;
  UIView **p_contentView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureSceneElementPlaceholderWrapperView;
  v6 = -[SBSystemApertureSceneElementPlaceholderWrapperView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    p_contentView = &v6->_contentView;
    objc_storeStrong((id *)&v6->_contentView, a3);
    if (*p_contentView)
      -[SBSystemApertureSceneElementPlaceholderWrapperView addSubview:](v7, "addSubview:");
  }

  return v7;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  id WeakRetained;
  UIView *v8;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v8 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView)
    {
      -[SBSystemApertureSceneElementPlaceholderWrapperView addSubview:](self, "addSubview:");
      -[SBSystemApertureSceneElementPlaceholderWrapperView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[SBSystemApertureSceneElementPlaceholderWrapperView setNeedsLayout](self, "setNeedsLayout");
      -[SBSystemApertureSceneElementPlaceholderWrapperView layoutIfNeeded](self, "layoutIfNeeded");
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "placeholderWrapperViewDidChangeContentView:", self);

    v5 = v8;
  }

}

- (void)layoutSubviews
{
  UIView *contentView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSystemApertureSceneElementPlaceholderWrapperView;
  -[SBSystemApertureSceneElementPlaceholderWrapperView layoutSubviews](&v5, sel_layoutSubviews);
  contentView = self->_contentView;
  -[SBSystemApertureSceneElementPlaceholderWrapperView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
  -[SBSystemApertureSceneElementPlaceholderWrapperView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[SBSystemApertureSceneElementPlaceholderWrapperView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsHitTesting:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIView intrinsicContentSize](self->_contentView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)allowsReparentingByLayoutHost
{
  return 1;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (SBSystemApertureSceneElementPlaceholderWrapperViewDelegate)delegate
{
  return (SBSystemApertureSceneElementPlaceholderWrapperViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
