@implementation _SBRootFolderLayoutWrapperView

- (UIView)wrappedView
{
  return self->_wrappedView;
}

- (void)setHeaderOffset:(double)a3
{
  if (self->_headerOffset != a3)
  {
    self->_headerOffset = a3;
    -[_SBRootFolderLayoutWrapperView _updateLayout](self, "_updateLayout");
  }
}

- (void)setExtendedSize:(CGSize)a3
{
  if (self->_extendedSize.width != a3.width || self->_extendedSize.height != a3.height)
  {
    self->_extendedSize = a3;
    -[_SBRootFolderLayoutWrapperView _updateLayout](self, "_updateLayout");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SBRootFolderLayoutWrapperView;
  -[_SBRootFolderLayoutWrapperView layoutSubviews](&v3, sel_layoutSubviews);
  -[_SBRootFolderLayoutWrapperView _updateLayout](self, "_updateLayout");
}

- (void)_updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double statusBarHeightAdjustment;
  double v14;
  double v15;
  double v16;

  -[_SBRootFolderLayoutWrapperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9 + self->_extendedSize.height;
  UIRectGetCenter();
  v12 = v11;
  statusBarHeightAdjustment = self->_statusBarHeightAdjustment;
  v14 = v10 - statusBarHeightAdjustment;
  v16 = v15 + statusBarHeightAdjustment - self->_headerOffset;
  -[UIView setBounds:](self->_wrappedView, "setBounds:", v4, v6, v8, v14);
  -[UIView setCenter:](self->_wrappedView, "setCenter:", v12, v16);
}

- (void)setStatusBarHeightAdjustment:(double)a3
{
  if (self->_statusBarHeightAdjustment != a3)
  {
    self->_statusBarHeightAdjustment = a3;
    -[_SBRootFolderLayoutWrapperView _updateLayout](self, "_updateLayout");
  }
}

- (void)setWrappedView:(id)a3
{
  UIView *v5;
  UIView *wrappedView;
  UIView *v7;

  v5 = (UIView *)a3;
  wrappedView = self->_wrappedView;
  if (wrappedView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](wrappedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_wrappedView, a3);
    -[_SBRootFolderLayoutWrapperView addSubview:](self, "addSubview:", self->_wrappedView);
    -[_SBRootFolderLayoutWrapperView _updateLayout](self, "_updateLayout");
    v5 = v7;
  }

}

- (id)description
{
  return -[_SBRootFolderLayoutWrapperView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBRootFolderLayoutWrapperView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBRootFolderLayoutWrapperView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[_SBRootFolderLayoutWrapperView succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBRootFolderLayoutWrapperView frame](self, "frame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("frame"));
  v6 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("statusBarHeightAdjustment"), self->_statusBarHeightAdjustment);
  v7 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("headerOffset"), self->_headerOffset);
  v8 = (id)objc_msgSend(v4, "appendSize:withName:", CFSTR("extendedSize"), self->_extendedSize.width, self->_extendedSize.height);
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", self->_wrappedView, CFSTR("wrappedView"));
  return v4;
}

- (double)statusBarHeightAdjustment
{
  return self->_statusBarHeightAdjustment;
}

- (double)headerOffset
{
  return self->_headerOffset;
}

- (CGSize)extendedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extendedSize.width;
  height = self->_extendedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end
