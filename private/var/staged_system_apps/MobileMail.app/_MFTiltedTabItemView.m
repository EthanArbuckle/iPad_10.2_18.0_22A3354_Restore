@implementation _MFTiltedTabItemView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MFTiltedTabItemView;
    v5 = -[_MFTiltedTabItemView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4);
  }

  return v5;
}

- (_MFTiltedTabItemView)init
{
  _MFTiltedTabItemView *v2;
  _MFTiltedTabItemView *v3;
  UIView *v4;
  UIView *closeButtonWrapperView;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  UIView *v10;
  UIView *contentClipperView;
  void *v12;
  _TabGradientView *v13;
  _TabGradientView *contentShadowView;
  void *v15;
  uint64_t v16;
  UIButton *closeButton;
  CGSize size;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_MFTiltedTabItemView;
  v2 = -[_MFTiltedTabItemView init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    -[_MFTiltedTabItemView setPreservesSuperviewLayoutMargins:](v2, "setPreservesSuperviewLayoutMargins:", 1);
    v3->_borrowedContentScale = 1.0;
    v3->_indexForLayout = 0x7FFFFFFFFFFFFFFFLL;
    v3->_countForLayout = 0x7FFFFFFFFFFFFFFFLL;
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    closeButtonWrapperView = v3->_closeButtonWrapperView;
    v3->_closeButtonWrapperView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_closeButtonWrapperView, "layer"));
    objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView layer](v3, "layer"));
    objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView layer](v3, "layer"));
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    v9 = objc_alloc((Class)UIView);
    -[_MFTiltedTabItemView bounds](v3, "bounds");
    v10 = (UIView *)objc_msgSend(v9, "initWithFrame:");
    contentClipperView = v3->_contentClipperView;
    v3->_contentClipperView = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_contentClipperView, "layer"));
    objc_msgSend(v12, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);

    -[UIView _setContinuousCornerRadius:](v3->_contentClipperView, "_setContinuousCornerRadius:", 10.0);
    -[UIView setPreservesSuperviewLayoutMargins:](v3->_contentClipperView, "setPreservesSuperviewLayoutMargins:", 1);
    -[UIView setClipsToBounds:](v3->_contentClipperView, "setClipsToBounds:", 1);
    -[_MFTiltedTabItemView addSubview:](v3, "addSubview:", v3->_contentClipperView);
    v13 = (_TabGradientView *)objc_msgSend((id)objc_opt_class(v3), "_newContentShadowView");
    contentShadowView = v3->_contentShadowView;
    v3->_contentShadowView = v13;

    -[_MFTiltedTabItemView addSubview:](v3, "addSubview:", v3->_contentShadowView);
    if ((sub_10019E6B4() & 1) == 0)
      -[_TabGradientView setHidden:](v3->_contentShadowView, "setHidden:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphXMark));
    v16 = objc_claimAutoreleasedReturnValue(+[UIButton systemButtonWithImage:target:action:](UIButton, "systemButtonWithImage:target:action:", v15, 0, 0));
    closeButton = v3->_closeButton;
    v3->_closeButton = (UIButton *)v16;

    -[UIView addSubview:](v3->_closeButtonWrapperView, "addSubview:", v3->_closeButton);
    size = CGRectNull.size;
    v3->_closeButtonHitRect.origin = CGRectNull.origin;
    v3->_closeButtonHitRect.size = size;
    -[_MFTiltedTabItemView addSubview:](v3, "addSubview:", v3->_closeButtonWrapperView);

  }
  return v3;
}

+ (id)_newContentShadowView
{
  _TabGradientView *v2;
  void *v3;

  v2 = objc_alloc_init(_TabGradientView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TabGradientView gradientLayer](v2, "gradientLayer"));
  +[MFSafariTabsClassConstants configureTabContentGradientLayer:](MFSafariTabsClassConstants, "configureTabContentGradientLayer:", v3);

  return v2;
}

- (void)layoutHeaderViewAnimated:(BOOL)a3 closeButton:(BOOL)a4
{
  _BOOL4 v5;
  double v7;
  double v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v20[5];
  BOOL v21;

  v5 = a3;
  v7 = (double)a4;
  -[UIButton alpha](self->_closeButton, "alpha");
  if (v8 != v7)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001ADD00;
    v20[3] = &unk_10051C6A8;
    v20[4] = self;
    v21 = a4;
    v9 = objc_retainBlock(v20);
    v10 = v9;
    if (v5)
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 327680, v9, 0, 0.22, 0.0);
    else
      ((void (*)(_QWORD *))v9[2])(v9);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView composePlaceholderView](self, "composePlaceholderView"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "layoutIfNeeded");
    -[UIView frame](self->_closeButtonWrapperView, "frame");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
    objc_msgSend(v19, "bounds");
    objc_msgSend(v19, "convertRect:toView:", self->_closeButtonWrapperView);
    -[UIView setFrame:](self->_closeButtonWrapperView, "setFrame:", v14, v16, v18);

  }
}

- (CATransform3D)contentTransform
{
  void *v4;
  CATransform3D *result;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentClipperView, "layer"));
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)setContentTransform:(CATransform3D *)a3
{
  void *v3;
  __int128 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_contentClipperView, "layer", *(_QWORD *)&a3->m11, *(_QWORD *)&a3->m12, *(_QWORD *)&a3->m13, *(_QWORD *)&a3->m14, *(_QWORD *)&a3->m21, *(_QWORD *)&a3->m22, *(_QWORD *)&a3->m23, *(_QWORD *)&a3->m24, *(_QWORD *)&a3->m31, *(_QWORD *)&a3->m32, *(_QWORD *)&a3->m33, *(_QWORD *)&a3->m34, *(_QWORD *)&a3->m41, *(_QWORD *)&a3->m42, *(_QWORD *)&a3->m43, *(_QWORD *)&a3->m44));
  objc_msgSend(v3, "setTransform:", &v4);

}

- (void)setBorrowedContentScale:(double)a3
{
  UIView *borrowedContentView;
  CGAffineTransform v4;

  if (self->_borrowedContentScale != a3)
  {
    self->_borrowedContentScale = a3;
    borrowedContentView = self->_borrowedContentView;
    CGAffineTransformMakeScale(&v4, a3, a3);
    -[UIView setTransform:](borrowedContentView, "setTransform:", &v4);
  }
}

- (void)setBorrowedContentView:(id)a3
{
  UIView *v5;
  UIView *borrowedContentView;
  UIView *v7;
  UIView *contentClipperView;
  double MidX;
  double MidY;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UIView *v15;
  CGRect v16;
  CGRect v17;

  v5 = (UIView *)a3;
  borrowedContentView = self->_borrowedContentView;
  v15 = v5;
  if (borrowedContentView != v5)
  {
    v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIView superview](borrowedContentView, "superview"));
    contentClipperView = self->_contentClipperView;

    if (v7 == contentClipperView)
      -[UIView removeFromSuperview](self->_borrowedContentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_borrowedContentView, a3);
    if (v15)
    {
      -[UIView insertSubview:belowSubview:](self->_contentClipperView, "insertSubview:belowSubview:", v15, self->_contentShadowView);
      -[UIView bounds](v15, "bounds");
      MidX = CGRectGetMidX(v16);
      -[UIView bounds](v15, "bounds");
      MidY = CGRectGetMidY(v17);
      -[_MFTiltedTabItemView contentClippingInsets](self, "contentClippingInsets");
      v12 = v11;
      -[_MFTiltedTabItemView contentClippingInsets](self, "contentClippingInsets");
      -[UIView setCenter:](v15, "setCenter:", MidX - v12, MidY - v13);
      v14 = objc_opt_class(ComposePlaceholderView);
      if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
        -[UIView configureLeadingPlaceholderWithSize:](v15, "configureLeadingPlaceholderWithSize:", 13.0, 13.0);
    }
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
  double v11;
  double v12;
  double v13;

  -[UIView frame](self->_contentClipperView, "frame");
  if (self->_autoresizesContentView)
  {
    -[_MFTiltedTabItemView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    -[_MFTiltedTabItemView contentClippingInsets](self, "contentClippingInsets");
    v10 = v9;
    v3 = v6 - (v11 + v12);
    v4 = v8 - (v13 + v10);
  }
  -[UIView setFrame:](self->_contentClipperView, "setFrame:", CGPointZero.x, CGPointZero.y, v3, v4);
  if ((sub_10019E6B4() & 1) == 0)
    -[_TabGradientView setHidden:](self->_contentShadowView, "setHidden:", self->_borrowedContentView == 0);
}

- (void)installMaskCutoutView:(id)a3
{
  id v4;

  v4 = a3;
  -[_MFTiltedTabItemView setMaskCutoutView:](self, "setMaskCutoutView:");
  -[UIView frame](self->_contentClipperView, "frame");
  objc_msgSend(v4, "setFrame:");
  -[_MFTiltedTabItemView addSubview:](self, "addSubview:", v4);

}

- (void)uninstallMaskCutoutView
{
  id v3;

  -[_MFTiltedTabItemView setMaskCutoutView:](self, "setMaskCutoutView:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[_MFTiltedTabItemView maskCutoutView](self, "maskCutoutView"));
  objc_msgSend(v3, "removeFromSuperview");

}

- (ComposePlaceholderView)composePlaceholderView
{
  UIView *borrowedContentView;
  uint64_t v4;
  UIView *v5;

  borrowedContentView = self->_borrowedContentView;
  v4 = objc_opt_class(ComposePlaceholderView);
  if ((objc_opt_isKindOfClass(borrowedContentView, v4) & 1) != 0)
    v5 = self->_borrowedContentView;
  else
    v5 = 0;
  return (ComposePlaceholderView *)v5;
}

- (UIView)closeButtonWrapperView
{
  return self->_closeButtonWrapperView;
}

- (UIView)contentClipperView
{
  return self->_contentClipperView;
}

- (UIView)maskCutoutView
{
  return self->_maskCutoutView;
}

- (void)setMaskCutoutView:(id)a3
{
  objc_storeStrong((id *)&self->_maskCutoutView, a3);
}

- (UIView)borrowedContentView
{
  return self->_borrowedContentView;
}

- (_TabGradientView)contentShadowView
{
  return self->_contentShadowView;
}

- (BOOL)topBackdropScaled
{
  return self->_topBackdropScaled;
}

- (void)setTopBackdropScaled:(BOOL)a3
{
  self->_topBackdropScaled = a3;
}

- (double)topBackdropHeight
{
  return self->_topBackdropHeight;
}

- (void)setTopBackdropHeight:(double)a3
{
  self->_topBackdropHeight = a3;
}

- (CGRect)closeButtonHitRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_closeButtonHitRect.origin.x;
  y = self->_closeButtonHitRect.origin.y;
  width = self->_closeButtonHitRect.size.width;
  height = self->_closeButtonHitRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCloseButtonHitRect:(CGRect)a3
{
  self->_closeButtonHitRect = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (double)borrowedContentScale
{
  return self->_borrowedContentScale;
}

- (unint64_t)contentViewType
{
  return self->_contentViewType;
}

- (void)setContentViewType:(unint64_t)a3
{
  self->_contentViewType = a3;
}

- (int64_t)capturedInterfaceOrientation
{
  return self->_capturedInterfaceOrientation;
}

- (void)setCapturedInterfaceOrientation:(int64_t)a3
{
  self->_capturedInterfaceOrientation = a3;
}

- (UIEdgeInsets)contentClippingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentClippingInsets.top;
  left = self->_contentClippingInsets.left;
  bottom = self->_contentClippingInsets.bottom;
  right = self->_contentClippingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentClippingInsets:(UIEdgeInsets)a3
{
  self->_contentClippingInsets = a3;
}

- (BOOL)contentViewNeedsRemoval
{
  return self->_contentViewNeedsRemoval;
}

- (void)setContentViewNeedsRemoval:(BOOL)a3
{
  self->_contentViewNeedsRemoval = a3;
}

- (BOOL)autoresizesContentView
{
  return self->_autoresizesContentView;
}

- (void)setAutoresizesContentView:(BOOL)a3
{
  self->_autoresizesContentView = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)isReordering
{
  return self->_reordering;
}

- (void)setReordering:(BOOL)a3
{
  self->_reordering = a3;
}

- (BOOL)isClosing
{
  return self->_closing;
}

- (void)setClosing:(BOOL)a3
{
  self->_closing = a3;
}

- (BOOL)isFinishedClosing
{
  return self->_finishedClosing;
}

- (void)setFinishedClosing:(BOOL)a3
{
  self->_finishedClosing = a3;
}

- (unint64_t)indexForLayout
{
  return self->_indexForLayout;
}

- (void)setIndexForLayout:(unint64_t)a3
{
  self->_indexForLayout = a3;
}

- (unint64_t)countForLayout
{
  return self->_countForLayout;
}

- (void)setCountForLayout:(unint64_t)a3
{
  self->_countForLayout = a3;
}

- (double)verticalScrollAdjustment
{
  return self->_verticalScrollAdjustment;
}

- (void)setVerticalScrollAdjustment:(double)a3
{
  self->_verticalScrollAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_contentShadowView, 0);
  objc_storeStrong((id *)&self->_borrowedContentView, 0);
  objc_storeStrong((id *)&self->_maskCutoutView, 0);
  objc_storeStrong((id *)&self->_contentClipperView, 0);
  objc_storeStrong((id *)&self->_closeButtonWrapperView, 0);
}

@end
