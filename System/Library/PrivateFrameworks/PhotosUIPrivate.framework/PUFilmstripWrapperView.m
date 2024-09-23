@implementation PUFilmstripWrapperView

- (PUFilmstripWrapperView)initWithFrame:(CGRect)a3
{
  PUFilmstripWrapperView *v3;
  id v4;
  uint64_t v5;
  UIView *clippingView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUFilmstripWrapperView;
  v3 = -[PUFilmstripWrapperView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PUFilmstripWrapperView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    clippingView = v3->_clippingView;
    v3->_clippingView = (UIView *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_clippingView, "setBackgroundColor:", v7);

    -[UIView setClipsToBounds:](v3->_clippingView, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](v3->_clippingView, "setAutoresizingMask:", 18);
    -[PUFilmstripWrapperView addSubview:](v3, "addSubview:", v3->_clippingView);
  }
  return v3;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    -[PUFilmstripWrapperView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleRect = &self->_visibleRect;
  if (!CGRectEqualToRect(self->_visibleRect, a3))
  {
    p_visibleRect->origin.x = x;
    p_visibleRect->origin.y = y;
    p_visibleRect->size.width = width;
    p_visibleRect->size.height = height;
    -[PUFilmstripWrapperView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_isExpanded != a3)
  {
    self->_isExpanded = a3;
    -[PUFilmstripWrapperView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setExpandedSize:(CGSize)a3
{
  if (self->_expandedSize.width != a3.width || self->_expandedSize.height != a3.height)
  {
    self->_expandedSize = a3;
    -[PUFilmstripWrapperView setNeedsLayout](self, "setNeedsLayout");
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
  _BOOL4 v15;
  NSNumber *anchoredLeft;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  _BOOL4 v30;
  NSNumber *v31;
  NSNumber *v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double x;
  double v46;
  double y;
  double v48;
  double width;
  double v50;
  double height;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGRect recta;
  CGPoint v57;
  CGPoint v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = PUFilmstripWrapperView;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, sel_layoutSubviews);
  -[PUFilmstripWrapperView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUFilmstripWrapperView filmstripView](self, "filmstripView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFilmstripWrapperView clippingView](self, "clippingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "desiredClippingOutset");
  v14 = v13;
  v15 = -[PUFilmstripWrapperView isExpanded](self, "isExpanded");
  anchoredLeft = self->_anchoredLeft;
  if (v15)
  {
    self->_anchoredLeft = 0;

    -[PUFilmstripWrapperView expandedSize](self, "expandedSize");
    if (v17 >= v8)
      v18 = v17;
    else
      v18 = v8;
    v59.origin.x = v4;
    v59.origin.y = v6;
    v59.size.width = v8;
    v59.size.height = v10;
    v60 = CGRectInset(v59, v14 * -2.0, v14 * -2.0);
    objc_msgSend(v12, "setFrame:", v60.origin.x, v60.origin.y, v60.size.width, v60.size.height);
    v19 = 0.0;
    v20 = v10;
    v21 = 0.0;
  }
  else
  {
    if (!anchoredLeft)
    {
      objc_msgSend(v11, "visibleRect");
      v57.x = 0.0;
      v57.y = 0.0;
      v22 = CGRectContainsPoint(v61, v57);
      objc_msgSend(v11, "visibleRect");
      recta.origin.x = v23;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v11, "bounds");
      v58.x = CGRectGetMaxX(v62) + -1.0;
      v58.y = 0.0;
      v63.origin.x = recta.origin.x;
      v63.origin.y = v25;
      v63.size.width = v27;
      v63.size.height = v29;
      v30 = CGRectContainsPoint(v63, v58);
      v31 = self->_anchoredLeft;
      if (!v30 || v22)
        v32 = (NSNumber *)MEMORY[0x1E0C9AAB0];
      else
        v32 = (NSNumber *)MEMORY[0x1E0C9AAA0];
      self->_anchoredLeft = v32;

    }
    v64.origin.x = v4;
    v64.origin.y = v6;
    v64.size.width = v8;
    v64.size.height = v10;
    v65 = CGRectInset(v64, 0.0, v14 * -2.0);
    objc_msgSend(v12, "setFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    v33 = -[NSNumber BOOLValue](self->_anchoredLeft, "BOOLValue");
    objc_msgSend(v11, "frame");
    -[PUFilmstripWrapperView convertRect:fromView:](self, "convertRect:fromView:", v12);
    v18 = v34;
    v21 = v8 - v34;
    if (v33)
      v21 = 0.0;
  }
  objc_msgSend(v12, "convertRect:fromView:", self, v21, v19, v18, v20);
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v12, "convertRect:fromView:", self, v4, v6, v8, v10);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[PUFilmstripWrapperView backgroundView](self, "backgroundView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setFrame:", v36, v38, v40, v42);

  -[PUFilmstripWrapperView visibleRect](self, "visibleRect");
  objc_msgSend(v11, "convertRect:fromView:", self);
  x = v44;
  y = v46;
  width = v48;
  height = v50;
  if (-[PUFilmstripWrapperView isAnimating](self, "isAnimating"))
  {
    objc_msgSend(v11, "visibleRect");
    v68.origin.x = v52;
    v68.origin.y = v53;
    v68.size.width = v54;
    v68.size.height = v55;
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v67 = CGRectUnion(v66, v68);
    x = v67.origin.x;
    y = v67.origin.y;
    width = v67.size.width;
    height = v67.size.height;
  }
  objc_msgSend(v11, "setVisibleRect:", x, y, width, height);

}

- (void)setFilmstripView:(id)a3
{
  -[PUFilmstripWrapperView setFilmstripView:leavingPreviousViewInPlace:](self, "setFilmstripView:leavingPreviousViewInPlace:", a3, 0);
}

- (void)setFilmstripView:(id)a3 leavingPreviousViewInPlace:(BOOL)a4
{
  PUFilmstripView *v7;
  PUFilmstripView *filmstripView;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  PUFilmstripView *v23;
  CGRect v24;
  CGRect v25;

  v7 = (PUFilmstripView *)a3;
  filmstripView = self->_filmstripView;
  if (filmstripView != v7)
  {
    v23 = v7;
    if (!a4)
      -[PUFilmstripView removeFromSuperview](filmstripView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_filmstripView, a3);
    -[PUFilmstripWrapperView clippingView](self, "clippingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[PUFilmstripView desiredClippingOutset](v23, "desiredClippingOutset");
    v19 = v18 + v18;
    -[PUFilmstripView desiredClippingOutset](v23, "desiredClippingOutset");
    v21 = v20 + v20;
    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    v25 = CGRectInset(v24, v19, v21);
    -[PUFilmstripView setFrame:](v23, "setFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);

    -[PUFilmstripWrapperView clippingView](self, "clippingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    -[PUFilmstripWrapperView setNeedsLayout](self, "setNeedsLayout");
    -[PUFilmstripWrapperView layoutIfNeeded](self, "layoutIfNeeded");
    v7 = v23;
  }

}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  UIView *v8;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  v8 = v5;
  if (backgroundView != v5)
  {
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[PUFilmstripWrapperView clippingView](self, "clippingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PUFilmstripView)filmstripView
{
  return self->_filmstripView;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (CGSize)expandedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expandedSize.width;
  height = self->_expandedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSNumber)anchoredLeft
{
  return self->_anchoredLeft;
}

- (void)setAnchoredLeft:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_anchoredLeft, 0);
  objc_storeStrong((id *)&self->_filmstripView, 0);
}

@end
