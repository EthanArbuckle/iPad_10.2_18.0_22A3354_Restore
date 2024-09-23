@implementation _UIPreviewPresentationPlatterView

- (_UIPreviewPresentationPlatterView)initWithContentView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UIPreviewPresentationPlatterView *v9;
  _UIPreviewPresentationPlatterView *v10;
  _UIPreviewPresentationEffectView *v11;
  _UIPreviewPresentationEffectView *v12;
  UIView *v13;
  double v14;
  double v15;
  void *v16;
  UIImageView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _UIPreviewPresentationPlatterView *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIPreviewPresentationPlatterView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[UIView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[_UIPreviewPresentationPlatterView setContentView:](v9, "setContentView:", v4);
    -[UIView setClipsToBounds:](v10, "setClipsToBounds:", 0);
    v11 = objc_alloc_init(_UIPreviewPresentationEffectView);
    -[UIView bounds](v10, "bounds");
    -[UIView setFrame:](v11, "setFrame:");
    -[_UIPreviewPresentationEffectView setBlurRadius:](v11, "setBlurRadius:", 0.0);
    -[_UIPreviewPresentationPlatterView setContentEffectView:](v10, "setContentEffectView:", v11);

    v12 = objc_alloc_init(_UIPreviewPresentationEffectView);
    -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 1);
    -[_UIPreviewPresentationPlatterView setContentClipView:](v10, "setContentClipView:", v12);

    v13 = objc_alloc_init(UIView);
    -[UIView setAutoresizesSubviews:](v13, "setAutoresizesSubviews:", 0);
    v14 = *MEMORY[0x1E0C9D538];
    v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView layer](v13, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPoint:", v14, v15);

    -[_UIPreviewPresentationPlatterView setContentTransformView:](v10, "setContentTransformView:", v13);
    v17 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v5, v6, v7, v8);
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("_UIPreviewPlatterShadow"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v17, "setImage:", v18);

    -[_UIPreviewPresentationPlatterView setContentShadowView:](v10, "setContentShadowView:", v17);
    -[_UIPreviewPresentationPlatterView contentTransformView](v10, "contentTransformView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v4);

    -[_UIPreviewPresentationPlatterView contentClipView](v10, "contentClipView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationPlatterView contentTransformView](v10, "contentTransformView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    -[_UIPreviewPresentationPlatterView contentEffectView](v10, "contentEffectView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationPlatterView contentClipView](v10, "contentClipView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    -[_UIPreviewPresentationPlatterView contentEffectView](v10, "contentEffectView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v24);

    -[_UIPreviewPresentationPlatterView contentShadowView](v10, "contentShadowView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationPlatterView contentEffectView](v10, "contentEffectView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v25, v26);

    v27 = v10;
  }

  return v10;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  -[_UIPreviewPresentationPlatterView contentSize](self, "contentSize");
  if (width != v7 || height != v6)
  {
    self->_contentSize.width = width;
    self->_contentSize.height = height;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentClippingSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  -[_UIPreviewPresentationPlatterView contentClippingSize](self, "contentClippingSize");
  if (width != v7 || height != v6)
  {
    self->_contentClippingSize.width = width;
    self->_contentClippingSize.height = height;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)blurRadius
{
  void *v2;
  double v3;
  double v4;

  -[_UIPreviewPresentationPlatterView contentEffectView](self, "contentEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blurRadius");
  v4 = v3;

  return v4;
}

- (void)setBlurRadius:(double)a3
{
  id v4;

  -[_UIPreviewPresentationPlatterView contentEffectView](self, "contentEffectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlurRadius:", a3);

}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[_UIPreviewPresentationPlatterView contentClipView](self, "contentClipView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[_UIPreviewPresentationPlatterView contentClipView](self, "contentClipView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setDropShadowEnabled:(BOOL)a3
{
  if (-[_UIPreviewPresentationPlatterView isDropShadowEnabled](self, "isDropShadowEnabled") != a3)
  {
    self->_dropShadowEnabled = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double Height;
  double v52;
  void *v53;
  CGFloat Width;
  void *v55;
  _BOOL4 v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  _QWORD v63[5];
  objc_super v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v64.receiver = self;
  v64.super_class = (Class)_UIPreviewPresentationPlatterView;
  -[UIView layoutSubviews](&v64, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIPreviewPresentationPlatterView contentEffectView](self, "contentEffectView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v6;
  v59 = v8;
  v60 = v10;
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[_UIPreviewPresentationPlatterView contentEffectView](self, "contentEffectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[_UIPreviewPresentationPlatterView contentClippingSize](self, "contentClippingSize");
  v24 = *MEMORY[0x1E0C9D820];
  v23 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v21 == *MEMORY[0x1E0C9D820] && v22 == v23)
  {
    v26 = v20;
  }
  else
  {
    v26 = v22;
    v16 = round(v16 + v20 * 0.5 - v22 * 0.5);
    v14 = round(v14 + v18 * 0.5 - v21 * 0.5);
    v18 = v21;
  }
  -[_UIPreviewPresentationPlatterView contentClipView](self, "contentClipView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v14, v16, v18, v26);

  -[_UIPreviewPresentationPlatterView contentClipView](self, "contentClipView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "convertRect:fromView:", self, v4, v58, v59, v60);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __51___UIPreviewPresentationPlatterView_layoutSubviews__block_invoke;
  v63[3] = &unk_1E16B1B28;
  v63[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v63);
  -[_UIPreviewPresentationPlatterView contentTransformView](self, "contentTransformView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

  -[_UIPreviewPresentationPlatterView contentSize](self, "contentSize");
  v40 = v39;
  if (v39 == v24 && v38 == v23)
  {
    -[_UIPreviewPresentationPlatterView contentTransformView](self, "contentTransformView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "bounds");
    v43 = v42;
    v45 = v44;
    v47 = v46;
    v49 = v48;
    -[_UIPreviewPresentationPlatterView contentView](self, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

  }
  else
  {
    v65.origin.x = v30;
    v65.origin.y = v32;
    v65.size.width = v34;
    v65.size.height = v36;
    Height = CGRectGetHeight(v65);
    v66.origin.x = v30;
    v66.origin.y = v32;
    v66.size.width = v34;
    v66.size.height = v36;
    v52 = Height * (v40 / CGRectGetWidth(v66));
    -[_UIPreviewPresentationPlatterView contentView](self, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setFrame:", 0.0, 0.0, v40, v52);

    v67.origin.x = v30;
    v67.origin.y = v32;
    v67.size.width = v34;
    v67.size.height = v36;
    Width = CGRectGetWidth(v67);
    CGAffineTransformMakeScale(&v62, Width / v40, Width / v40);
    -[_UIPreviewPresentationPlatterView contentTransformView](self, "contentTransformView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v62;
    objc_msgSend(v41, "setTransform:", &v61);
  }

  -[_UIPreviewPresentationPlatterView contentShadowView](self, "contentShadowView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v68.origin.x = v4 + -13.0;
  v68.origin.y = v58 + -36.0;
  v68.size.width = v59 + 26.0;
  v68.size.height = v60 + 72.0;
  v69 = CGRectOffset(v68, 0.0, 4.0);
  objc_msgSend(v55, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
  v56 = -[_UIPreviewPresentationPlatterView isDropShadowEnabled](self, "isDropShadowEnabled");
  v57 = 1.0;
  if (!v56)
    v57 = 0.0;
  objc_msgSend(v55, "setAlpha:", v57);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)contentClippingSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentClippingSize.width;
  height = self->_contentClippingSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isDropShadowEnabled
{
  return self->_dropShadowEnabled;
}

- (_UIPreviewPresentationEffectView)contentEffectView
{
  return self->_contentEffectView;
}

- (void)setContentEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_contentEffectView, a3);
}

- (_UIPreviewPresentationEffectView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
  objc_storeStrong((id *)&self->_contentClipView, a3);
}

- (UIView)contentTransformView
{
  return self->_contentTransformView;
}

- (void)setContentTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTransformView, a3);
}

- (UIView)contentShadowView
{
  return self->_contentShadowView;
}

- (void)setContentShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_contentShadowView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentShadowView, 0);
  objc_storeStrong((id *)&self->_contentTransformView, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_contentEffectView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
