@implementation PGMaterialView

- (PGMaterialView)initWithFrame:(CGRect)a3
{
  PGMaterialView *v3;
  PGCABackdropLayerView *v4;
  uint64_t v5;
  PGCABackdropLayerView *backdropLayerView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PGMaterialView;
  v3 = -[PGLayoutContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PGCABackdropLayerView alloc];
    -[PGMaterialView bounds](v3, "bounds");
    v5 = -[PGCABackdropLayerView initWithFrame:](v4, "initWithFrame:");
    backdropLayerView = v3->_backdropLayerView;
    v3->_backdropLayerView = (PGCABackdropLayerView *)v5;

    -[PGMaterialView insertSubview:atIndex:](v3, "insertSubview:atIndex:", v3->_backdropLayerView, 0);
  }
  return v3;
}

- (void)layoutSubviews
{
  PGCABackdropLayerView *backdropLayerView;
  UIView *contentView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGMaterialView;
  -[PGMaterialView layoutSubviews](&v5, sel_layoutSubviews);
  backdropLayerView = self->_backdropLayerView;
  -[PGMaterialView bounds](self, "bounds");
  -[PGCABackdropLayerView setFrame:](backdropLayerView, "setFrame:");
  contentView = self->_contentView;
  -[PGMaterialView bounds](self, "bounds");
  -[UIView setFrame:](contentView, "setFrame:");
}

- (void)addSubview:(id)a3
{
  PGCABackdropLayerView *v5;
  PGCABackdropLayerView *v6;
  void *v7;
  objc_super v8;

  v5 = (PGCABackdropLayerView *)a3;
  v6 = v5;
  if ((PGCABackdropLayerView *)self->_contentView != v5 && self->_backdropLayerView != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGMaterialView.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view == _contentView || view == _backdropLayerView"));

  }
  v8.receiver = self;
  v8.super_class = (Class)PGMaterialView;
  -[PGMaterialView addSubview:](&v8, sel_addSubview_, v6);

}

- (id)backgroundColor
{
  return -[PGCABackdropLayerView customBackgroundColor](self->_backdropLayerView, "customBackgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PGMaterialView backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v4))
  {

LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  -[PGMaterialView backgroundColor](self, "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 != v7)
  {
    -[PGCABackdropLayerView setCustomBackgroundColor:](self->_backdropLayerView, "setCustomBackgroundColor:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (double)_cornerRadius
{
  double result;

  -[PGCABackdropLayerView _cornerRadius](self->_backdropLayerView, "_cornerRadius");
  return result;
}

- (void)_setCornerRadius:(double)a3
{
  -[PGCABackdropLayerView _setCornerRadius:](self->_backdropLayerView, "_setCornerRadius:", a3);
}

- (double)_continuousCornerRadius
{
  double result;

  -[PGCABackdropLayerView _continuousCornerRadius](self->_backdropLayerView, "_continuousCornerRadius");
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[PGCABackdropLayerView _setContinuousCornerRadius:](self->_backdropLayerView, "_setContinuousCornerRadius:", a3);
}

- (BOOL)isBackdropHidden
{
  return -[PGCABackdropLayerView isHidden](self->_backdropLayerView, "isHidden");
}

- (void)setBackdropHidden:(BOOL)a3
{
  -[PGCABackdropLayerView setHidden:](self->_backdropLayerView, "setHidden:", a3);
}

- (UIView)contentView
{
  UIView *contentView;
  PGLayoutContainerView *v4;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = [PGLayoutContainerView alloc];
    -[PGMaterialView bounds](self, "bounds");
    v5 = -[PGLayoutContainerView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    v7 = self->_contentView;
    -[PGMaterialView subviews](self, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMaterialView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, objc_msgSend(v8, "count"));

    -[UIView PG_recursivelyDisallowGroupBlending](self, "PG_recursivelyDisallowGroupBlending");
    contentView = self->_contentView;
  }
  return contentView;
}

- (BOOL)PG_preferredVisibilityForView:(id)a3
{
  PGCABackdropLayerView *v4;
  void *v5;
  void *v6;
  PGMaterialView *v7;
  char v8;

  v4 = (PGCABackdropLayerView *)a3;
  -[PGMaterialView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_backdropLayerView == v4)
    v7 = self;
  else
    v7 = (PGMaterialView *)v4;
  v8 = objc_msgSend(v5, "PG_preferredVisibilityForView:", v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backdropLayerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
