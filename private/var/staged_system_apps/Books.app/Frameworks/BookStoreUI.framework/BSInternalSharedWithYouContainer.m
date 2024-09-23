@implementation BSInternalSharedWithYouContainer

- (BSInternalSharedWithYouContainer)initWithAttributionView:(id)a3
{
  id v4;
  BSInternalSharedWithYouContainer *v5;
  BSInternalSharedWithYouContainer *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[BSInternalSharedWithYouContainer init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[BSInternalSharedWithYouContainer setAttributionView:](v5, "setAttributionView:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](v6, "attributionView"));
    objc_msgSend(v7, "setHorizontalAlignment:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](v6, "attributionView"));
    -[BSInternalSharedWithYouContainer addSubview:](v6, "addSubview:", v8);

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BSInternalSharedWithYouContainer;
  -[BSInternalSharedWithYouContainer layoutSubviews](&v13, "layoutSubviews");
  -[BSInternalSharedWithYouContainer bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](self, "attributionView"));
  objc_msgSend(v9, "intrinsicContentSize");
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](self, "attributionView"));
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v11);

}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BSInternalSharedWithYouContainer;
  -[BSInternalSharedWithYouContainer setFrame:](&v14, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BSInternalSharedWithYouContainer bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](self, "attributionView"));
  objc_msgSend(v10, "intrinsicContentSize");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](self, "attributionView"));
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v12);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSInternalSharedWithYouContainer attributionView](self, "attributionView", a3.width, a3.height));
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (SWAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionView, 0);
}

@end
