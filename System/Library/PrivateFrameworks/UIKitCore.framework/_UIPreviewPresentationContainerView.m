@implementation _UIPreviewPresentationContainerView

- (_UIPreviewPresentationContainerView)initWithFrame:(CGRect)a3
{
  _UIPreviewPresentationContainerView *v3;
  _UIPreviewPresentationContainerView *v4;
  _UIPreviewPresentationContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewPresentationContainerView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIPreviewPresentationContainerView initPlatterViewsIfNeeded](v3, "initPlatterViewsIfNeeded");
    v5 = v4;
  }

  return v4;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v8 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[_UIPreviewPresentationContainerView contentTransformView](self, "contentTransformView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (double)blurRadius
{
  void *v2;
  double v3;
  double v4;

  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blurRadius");
  v4 = v3;

  return v4;
}

- (void)setBlurRadius:(double)a3
{
  id v4;

  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlurRadius:", a3);

}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)shouldRasterizeForTransition
{
  void *v2;
  char v3;

  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRasterizeForTransition");

  return v3;
}

- (void)setShouldRasterizeForTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterizeForTransition:", v3);

}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MidX;
  double MidY;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  __int128 v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  CGFloat rect;
  double v80;
  double v81;
  double v82;
  double v83;
  CGAffineTransform v84;
  CGAffineTransform v85;
  _OWORD v86[3];
  objc_super v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v87.receiver = self;
  v87.super_class = (Class)_UIPreviewPresentationContainerView;
  -[UIView layoutSubviews](&v87, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  x = v88.origin.x;
  y = v88.origin.y;
  width = v88.size.width;
  height = v88.size.height;
  CGRectGetWidth(v88);
  v89.origin.x = x;
  v89.origin.y = y;
  v89.size.width = width;
  v89.size.height = height;
  CGRectGetHeight(v89);
  -[_UIPreviewPresentationContainerView preferredContentSize](self, "preferredContentSize");
  v8 = v7;
  v10 = v9;
  -[_UIPreviewPresentationContainerView _standardPreferredContentSize](self, "_standardPreferredContentSize");
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = v8 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8);
  v83 = *MEMORY[0x1E0C9D648];
  if (v14)
  {
    rect = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v82 = v11 / v12;
    v90.origin.x = x;
    v90.origin.y = y;
    v18 = *MEMORY[0x1E0C9D648];
    v90.size.width = width;
    v90.size.height = height;
    v91.size.width = CGRectGetWidth(v90);
    v91.origin.x = v18;
    v91.origin.y = v13;
    v80 = v91.size.width;
    v91.size.height = rect;
    v81 = CGRectGetWidth(v91) / v82;
    v17 = v13;
  }
  else
  {
    if (v8 == 0.0)
      v15 = width;
    else
      v15 = v8;
    if (v10 == 0.0)
      v16 = height;
    else
      v16 = v10;
    v80 = v15;
    v81 = v16;
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }
  UIRoundToViewScale(self);
  v20 = v19;
  UIRoundToViewScale(self);
  v22 = v21;
  -[_UIPreviewPresentationContainerView _preferredPlatterRectForContainerRect:](self, "_preferredPlatterRectForContainerRect:", x, y, width, height);
  v23 = v92.origin.x;
  v24 = v92.origin.y;
  v25 = v92.size.width;
  v26 = v92.size.height;
  MidX = CGRectGetMidX(v92);
  v93.origin.x = v23;
  v93.origin.y = v24;
  v93.size.width = v25;
  v93.size.height = v26;
  MidY = CGRectGetMidY(v93);
  if (-[_UIPreviewPresentationContainerView shouldLayoutForCommitPhase](self, "shouldLayoutForCommitPhase"))
  {
    -[UIView bounds](self, "bounds");
    v30 = v29;
    v32 = v31;
    v20 = v33;
    v22 = v34;
  }
  else
  {
    v30 = MidX - v20 * 0.5;
    v32 = MidY - v22 * 0.5;
  }
  -[_UIPreviewPresentationContainerView platterView](self, "platterView", *(_QWORD *)&rect);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v30, v32, v20, v22);

  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  -[_UIPreviewPresentationContainerView platterClippingView](self, "platterClippingView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  v46 = 0.0;
  if (!-[_UIPreviewPresentationContainerView shouldLayoutForCommitPhase](self, "shouldLayoutForCommitPhase"))
  {
    -[_UIPreviewPresentationContainerView cornerRadius](self, "cornerRadius");
    v46 = v47;
  }
  -[_UIPreviewPresentationContainerView platterClippingView](self, "platterClippingView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "_setContinuousCornerRadius:", v46);

  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v51 = v50 + -13.0;
  v53 = v52 + -36.0;
  v55 = v54 + 26.0;
  v57 = v56 + 72.0;

  v94.origin.x = v51;
  v94.origin.y = v53;
  v94.size.width = v55;
  v94.size.height = v57;
  v95 = CGRectOffset(v94, 0.0, 4.0);
  v58 = v95.origin.x;
  v59 = v95.origin.y;
  v60 = v95.size.width;
  v61 = v95.size.height;
  -[_UIPreviewPresentationContainerView platterShadowView](self, "platterShadowView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", v58, v59, v60, v61);

  -[_UIPreviewPresentationContainerView platterClippingView](self, "platterClippingView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bounds");
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;

  -[_UIPreviewPresentationContainerView contentTransformView](self, "contentTransformView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v86[0] = *MEMORY[0x1E0C9BAA8];
  v86[1] = v73;
  v86[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v72, "setTransform:", v86);

  -[_UIPreviewPresentationContainerView contentTransformView](self, "contentTransformView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFrame:", v65, v67, v69, v71);

  -[_UIPreviewPresentationContainerView contentView](self, "contentView");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setFrame:", v83, v17, v80, v81);

  v96.origin.x = v65;
  v96.origin.y = v67;
  v96.size.width = v69;
  v96.size.height = v71;
  v76 = CGRectGetWidth(v96);
  v97.origin.x = v83;
  v97.origin.y = v17;
  v97.size.width = v80;
  v97.size.height = v81;
  v77 = CGRectGetWidth(v97);
  if (!-[_UIPreviewPresentationContainerView shouldLayoutForCommitPhase](self, "shouldLayoutForCommitPhase"))
  {
    CGAffineTransformMakeScale(&v85, v76 / v77, v76 / v77);
    -[_UIPreviewPresentationContainerView contentTransformView](self, "contentTransformView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v85;
    objc_msgSend(v78, "setTransform:", &v84);

  }
}

- (BOOL)_shouldEnclosedScrollViewFlashIndicators:(id)a3
{
  return 0;
}

- (void)initPlatterViewsIfNeeded
{
  void *v3;
  _UIPreviewPresentationEffectView *v4;
  _UIPreviewPresentationEffectView *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  UIView *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[_UIPreviewPresentationContainerView platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(_UIPreviewPresentationEffectView);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](v4, "setFrame:");
    -[_UIPreviewPresentationEffectView setBlurRadius:](v4, "setBlurRadius:", 8.0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[_UIPreviewPresentationContainerView setPlatterView:](self, "setPlatterView:", v4);

    v5 = objc_alloc_init(_UIPreviewPresentationEffectView);
    -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 1);
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[_UIPreviewPresentationContainerView setPlatterClippingView:](self, "setPlatterClippingView:", v5);

    v6 = [UIImageView alloc];
    v7 = -[UIImageView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("_UIPreviewPlatterShadow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v7, "setImage:", v8);

    -[_UIPreviewPresentationContainerView setPlatterShadowView:](self, "setPlatterShadowView:", v7);
    v9 = objc_alloc_init(UIView);
    -[UIView setAutoresizesSubviews:](v9, "setAutoresizesSubviews:", 0);
    v10 = *MEMORY[0x1E0C9D538];
    v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIView layer](v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnchorPoint:", v10, v11);

    -[_UIPreviewPresentationContainerView setContentTransformView:](self, "setContentTransformView:", v9);
    -[_UIPreviewPresentationContainerView platterClippingView](self, "platterClippingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationContainerView contentTransformView](self, "contentTransformView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    -[_UIPreviewPresentationContainerView platterView](self, "platterView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationContainerView platterClippingView](self, "platterClippingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v16);

    -[_UIPreviewPresentationContainerView platterView](self, "platterView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationContainerView platterShadowView](self, "platterShadowView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewPresentationContainerView platterClippingView](self, "platterClippingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertSubview:belowSubview:", v18, v19);

    -[_UIPreviewPresentationContainerView platterView](self, "platterView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](self, "addSubview:", v20);

    -[_UIPreviewPresentationContainerView setCornerRadius:](self, "setCornerRadius:", 13.0);
  }
}

- (CGRect)_preferredPlatterRectForContainerRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    _UIPreviewInteractionPlatterInsetsForRect(x, y, width, height);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v7 = x + v13;
    v8 = y + v12;
    v9 = width - (v14 + v17);
    v10 = height - (v12 + v16);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGSize)_standardPreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView bounds](self, "bounds");
  -[_UIPreviewPresentationContainerView _preferredPlatterRectForContainerRect:](self, "_preferredPlatterRectForContainerRect:");
  v4 = v3;
  v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)shouldLayoutForCommitPhase
{
  return self->_shouldLayoutForCommitPhase;
}

- (void)setShouldLayoutForCommitPhase:(BOOL)a3
{
  self->_shouldLayoutForCommitPhase = a3;
}

- (_UIPreviewPresentationEffectView)platterClippingView
{
  return self->_platterClippingView;
}

- (void)setPlatterClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_platterClippingView, a3);
}

- (UIView)platterShadowView
{
  return self->_platterShadowView;
}

- (void)setPlatterShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_platterShadowView, a3);
}

- (UIView)contentTransformView
{
  return self->_contentTransformView;
}

- (void)setContentTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTransformView, a3);
}

- (_UIPreviewPresentationEffectView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_contentTransformView, 0);
  objc_storeStrong((id *)&self->_platterShadowView, 0);
  objc_storeStrong((id *)&self->_platterClippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
