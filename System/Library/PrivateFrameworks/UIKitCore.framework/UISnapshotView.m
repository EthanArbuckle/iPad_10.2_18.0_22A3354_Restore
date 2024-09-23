@implementation UISnapshotView

- (UISnapshotView)initWithFrame:(CGRect)a3
{
  UISnapshotView *v3;
  UIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISnapshotView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    -[UIView bounds](v3, "bounds");
    v3->_imageView = -[UIView initWithFrame:](v4, "initWithFrame:");
    -[UISnapshotView setEdgeAntialiasingEnabled:](v3, "setEdgeAntialiasingEnabled:", 1);
    -[UIView addSubview:](v3, "addSubview:", v3->_imageView);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");

  self->_imageView = 0;
  -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");

  self->_shadowView = 0;
  self->_edgePaddingColor = 0;

  self->_edgePaddingViews = 0;
  v3.receiver = self;
  v3.super_class = (Class)UISnapshotView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setEdgePadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgePadding.left
    || a3.top != self->_edgePadding.top
    || a3.right != self->_edgePadding.right
    || a3.bottom != self->_edgePadding.bottom)
  {
    self->_edgePadding = a3;
    -[UISnapshotView _positionImageView](self, "_positionImageView");
  }
}

- (BOOL)isEdgeAntialiasingEnabled
{
  return (*((_BYTE *)self + 608) & 1) == 0;
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  int v3;

  v3 = *((unsigned __int8 *)self + 608);
  if (((v3 ^ a3) & 1) == 0)
  {
    *((_BYTE *)self + 608) = v3 & 0xFE | !a3;
    -[UISnapshotView _positionImageView](self, "_positionImageView");
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_edgeInsets.left
    || a3.top != self->_edgeInsets.top
    || a3.right != self->_edgeInsets.right
    || a3.bottom != self->_edgeInsets.bottom)
  {
    self->_edgeInsets = a3;
    -[UISnapshotView _positionImageView](self, "_positionImageView");
  }
}

- (void)_setContentOffset:(CGPoint)a3
{
  if (a3.x != self->_contentOffset.x || a3.y != self->_contentOffset.y)
  {
    self->_contentOffset = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isVerticalStretchEnabled
{
  return (*((_BYTE *)self + 608) & 2) == 0;
}

- (void)setVerticalStretchEnabled:(BOOL)a3
{
  char v4;

  if (a3)
    v4 = 0;
  else
    v4 = 2;
  *((_BYTE *)self + 608) = *((_BYTE *)self + 608) & 0xFD | v4;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (CGRect)_snapshotRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_snapshotRect.origin.x;
  y = self->_snapshotRect.origin.y;
  width = self->_snapshotRect.size.width;
  height = self->_snapshotRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setSnapshotRect:(CGRect)a3
{
  self->_snapshotRect = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShadowView:(id)a3
{
  UIImageView *shadowView;
  UIImageView *v6;

  shadowView = self->_shadowView;
  if (shadowView != a3)
  {
    -[UIView removeFromSuperview](shadowView, "removeFromSuperview");

    v6 = (UIImageView *)a3;
    self->_shadowView = v6;
    if (v6)
      -[UIView addSubview:](self, "addSubview:", v6);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISnapshotView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UISnapshotView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

- (void)setContentStretch:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)UISnapshotView;
  -[UIView setContentStretch:](&v8, sel_setContentStretch_);
  -[CALayer setContentsCenter:](-[UIView layer](self->_imageView, "layer"), "setContentsCenter:", x, y, width, height);
}

- (void)_positionImageView
{
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (void)_updateContentsRect
{
  CGRect *p_snapshotRect;
  double width;
  double v5;
  double v6;
  double height;
  double top;
  double left;
  double bottom;
  double right;
  double v12;
  float64x2_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double x;
  double y;
  double v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  p_snapshotRect = &self->_snapshotRect;
  if (CGRectIsEmpty(self->_snapshotRect))
  {
    width = self->_contentSize.width;
    v33 = 1.0;
    v35 = 0.0;
    v5 = 0.0;
    v6 = 1.0;
  }
  else
  {
    width = self->_contentSize.width;
    v6 = 1.0;
    v5 = 0.0;
    v33 = p_snapshotRect->size.width / width;
    v35 = p_snapshotRect->origin.x / width;
  }
  height = self->_contentSize.height;
  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  -[UIView bounds](self->_imageView, "bounds", *(_QWORD *)&v33, *(_QWORD *)&v35);
  v13 = *(float64x2_t *)&self->_edgeInsets.top;
  v15 = self->_contentSize.width;
  v14 = self->_contentSize.height;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(v13), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_edgeInsets.bottom))))) & 1) != 0)
  {
    v16 = 1.0 / v15;
    v17 = vmuld_lane_f64(v16, v13, 1);
    v18 = 1.0 / v14;
    v5 = 1.0 / v14 * v13.f64[0];
    v19 = (width - left - right) * v16;
    v6 = (height - top - bottom) * (1.0 / v14);
  }
  else
  {
    v18 = 1.0 / v14;
    v16 = 1.0 / v15;
    v19 = v34;
    v17 = v36;
  }
  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  v22 = y * v18;
  v23 = v12 < v14;
  if (y <= 0.0)
    v24 = y * v18;
  else
    v24 = -(y * v18);
  v25 = v6 + v24;
  v26 = v12 * v18;
  if (y <= 0.0)
    v27 = v22;
  else
    v27 = 0.0;
  if ((*(_DWORD *)&v23 & (*((unsigned __int8 *)self + 608) >> 1)) != 0)
    v28 = v26;
  else
    v28 = v25;
  v29 = v5 - v27;
  v30 = x * v16;
  if (x <= 0.0)
    v31 = x * v16;
  else
    v31 = 0.0;
  v32 = -(x * v16);
  if (x > 0.0)
    v30 = v32;
  -[CALayer setContentsRect:](-[UIView layer](self->_imageView, "layer"), "setContentsRect:", v17 - v31, v29, v19 + v30, v28);
}

- (void)layoutSubviews
{
  double height;
  double top;
  double bottom;
  CGPoint *p_contentOffset;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double left;
  double v18;
  double v19;
  double x;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)UISnapshotView;
  -[UIView layoutSubviews](&v30, sel_layoutSubviews);
  height = self->_contentSize.height;
  top = self->_edgeInsets.top;
  bottom = self->_edgeInsets.bottom;
  p_contentOffset = &self->_contentOffset;
  y = self->_contentOffset.y;
  -[UISnapshotView _edgePadding](self, "_edgePadding");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIView bounds](self, "bounds");
  left = self->_edgeInsets.left;
  v18 = self->_contentBeyondBounds.left;
  x = self->_contentOffset.x;
  v21 = self->_contentOffset.y;
  v22 = self->_contentBeyondBounds.bottom
      + self->_contentBeyondBounds.top
      + v13
      + v9
      + v19
      - self->_edgeInsets.top
      - self->_edgeInsets.bottom
      - v21;
  v23 = -v21;
  if (v21 <= 0.0)
    v23 = self->_contentOffset.y;
  v24 = v23 + v22;
  if ((*((_BYTE *)self + 608) & 2) != 0 && v24 > self->_contentSize.height)
    v24 = height - top - bottom - fabs(y);
  if (v21 <= 0.0)
    v21 = -0.0;
  v25 = self->_contentBeyondBounds.right + v18 + v15 + v11 + v16 - left - self->_edgeInsets.right;
  v26 = -x;
  if (x <= 0.0)
    v26 = p_contentOffset->x;
  v27 = v25 + v26;
  v28 = left - v11 - v18;
  if (x <= 0.0)
    v29 = -0.0;
  else
    v29 = p_contentOffset->x;
  -[UIView setFrame:](self->_imageView, "setFrame:", v28 + v29, self->_edgeInsets.top - v9 - self->_contentBeyondBounds.top + v21, v27, v24);
  -[UISnapshotView _updateContentsRect](self, "_updateContentsRect");
}

- (UIEdgeInsets)_edgePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgePadding.top;
  if ((*((_BYTE *)self + 608) & 1) != 0)
  {
    left = self->_edgePadding.left;
    bottom = self->_edgePadding.bottom;
    right = self->_edgePadding.right;
  }
  else
  {
    top = top + 1.0;
    left = self->_edgePadding.left + 1.0;
    bottom = self->_edgePadding.bottom + 1.0;
    right = self->_edgePadding.right + 1.0;
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_drawEdges:(UIEdgeInsets)a3 withContentSize:(CGSize)a4
{
  double height;
  double width;
  double right;
  double bottom;
  double left;
  double top;
  double v11;
  _QWORD *ContextStack;
  CGContext *v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.height;
  width = a4.width;
  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((*((_BYTE *)self + 608) & 1) != 0)
    v11 = 0.0;
  else
    v11 = 1.0;
  -[UIColor set](self->_edgePaddingColor, "set");
  if (top - v11 > 0.0)
    UIRectFillUsingOperation(1, v11, v11, right + left + width - (v11 + v11), top - v11);
  if (left - v11 > 0.0)
    UIRectFillUsingOperation(1, v11, v11, left - v11, bottom + top + height - (v11 + v11));
  if (bottom - v11 > 0.0)
    UIRectFillUsingOperation(1, v11, top + height, right + left + width - (v11 + v11), bottom - v11);
  if (right - v11 > 0.0)
    UIRectFillUsingOperation(1, left + width, v11, right - v11, bottom + top + height - (v11 + v11));
  if ((*((_BYTE *)self + 608) & 1) == 0)
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v13 = 0;
    else
      v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    v14 = right + left + width;
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.height = 1.0;
    v16.size.width = v14;
    CGContextClearRect(v13, v16);
    v15 = bottom + top + height;
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = 1.0;
    v17.size.height = v15;
    CGContextClearRect(v13, v17);
    v18.origin.y = v15 + -1.0;
    v18.origin.x = 0.0;
    v18.size.height = 1.0;
    v18.size.width = v14;
    CGContextClearRect(v13, v18);
    v19.origin.x = v14 + -1.0;
    v19.origin.y = 0.0;
    v19.size.width = 1.0;
    v19.size.height = v15;
    CGContextClearRect(v13, v19);
  }
}

- (CGRect)_contentsCenterForEdgePadding:(UIEdgeInsets)a3 withContentSize:(CGSize)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  v4 = a3.left / a4.width;
  v5 = a3.top / a4.height;
  v6 = (a4.width - a3.left - a3.right) / a4.width;
  v7 = (a4.height - a3.top - a3.bottom) / a4.height;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v7;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_addEdgePaddingViewInRect:(CGRect)a3
{
  UIView *v4;

  v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UIView setBackgroundColor:](v4, "setBackgroundColor:", self->_edgePaddingColor);
  -[NSMutableArray addObject:](self->_edgePaddingViews, "addObject:", v4);
  -[UIView addSubview:](self->_imageView, "addSubview:", v4);

}

- (void)captureSnapshotRect:(CGRect)a3 fromView:(id)a4 withSnapshotType:(int)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _QWORD *ContextStack;
  CGContext *v42;
  __IOSurface *v43;
  unint64_t v44;
  unint64_t v45;
  void *BaseAddress;
  size_t BytesPerRow;
  CGColorSpace *DeviceRGB;
  uint64_t v49;
  _QWORD *v50;
  CGContext *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGContext *v56;
  int *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  _QWORD *v62;
  CGContext *v63;
  _QWORD *v64;
  CGContext *v65;
  void *v66;
  _QWORD *v67;
  uint64_t v68;
  CGFloat v69;
  size_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _BOOL8 v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double rect;
  CGAffineTransform v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  objc_msgSend(a4, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  self->_contentBeyondBounds.top = fmax(v15 - y, 0.0);
  self->_contentBeyondBounds.left = fmax(v13 - x, 0.0);
  self->_contentBeyondBounds.bottom = fmax(y + height - (v15 + v19), 0.0);
  self->_contentBeyondBounds.right = fmax(x + width - (v13 + v17), 0.0);
  -[UISnapshotView _edgePadding](self, "_edgePadding");
  v79 = v22;
  rect = v21;
  v77 = v23;
  v78 = v24;
  v25 = objc_msgSend((id)objc_msgSend(a4, "window"), "screen");
  v26 = a4;
  if (v25)
    v26 = (id)objc_msgSend(a4, "window");
  objc_msgSend(v26, "_currentScreenScale");
  v76 = v27;
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
  -[NSMutableArray makeObjectsPerformSelector:](self->_edgePaddingViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  -[NSMutableArray removeAllObjects](self->_edgePaddingViews, "removeAllObjects");
  if (a5 == 2)
  {
    if ((*((_BYTE *)self + 608) & 1) != 0)
      v28 = 0.0;
    else
      v28 = 1.0;
    -[UISnapshotView _edgePadding](self, "_edgePadding");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[UIView addSubview:](self->_imageView, "addSubview:", a4);
    objc_msgSend(a4, "setFrame:", v32, v30, width, height);
    v37 = width + v32;
    v38 = v28 + v28;
    if (self->_edgePadding.top != 0.0)
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v28, v28, v36 + v37 - v38, v30 - v28);
    v39 = height + v30;
    if (self->_edgePadding.left != 0.0)
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v28, v28, v32 - v28, v34 + v39 - v38);
    if (self->_edgePadding.bottom != 0.0)
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v28, v39, v36 + v37 - v38, v34 - v28);
    if (self->_edgePadding.right != 0.0)
      -[UISnapshotView _addEdgePaddingViewInRect:](self, "_addEdgePaddingViewInRect:", v37, v28, v36 - v28, v34 + v39 - v38);
    v40 = 1.0;
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0, 1.0, 1.0);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v42 = 0;
    else
      v42 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    v52 = 0.0;
    v82.origin.x = 0.0;
    v82.origin.y = 0.0;
    v82.size.width = 1.0;
    v82.size.height = 1.0;
    CGContextClearRect(v42, v82);
    v43 = (__IOSurface *)(id)objc_msgSend(_UIGraphicsGetImageFromCurrentImageContext(0), "CGImage");
    UIGraphicsEndImageContext();
    self->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    v53 = 0.0;
    v54 = 1.0;
    v55 = 1.0;
  }
  else if (a5 == 1)
  {
    v43 = -[UIView _createRenderingBufferFromRect:padding:gamut:]((__IOSurface *)a4, -1, x, y, width, height, rect, v77, v78, v79);
    v44 = IOSurfaceGetWidth(v43);
    v45 = IOSurfaceGetHeight(v43);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_edgePadding.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_edgePadding.bottom))))) & 1) != 0)goto LABEL_19;
    if ((*((_BYTE *)self + 608) & 1) == 0)
    {
      v83.origin.x = v14;
      v83.origin.y = v16;
      v83.size.width = v18;
      v83.size.height = v20;
      v85.origin.x = x;
      v85.origin.y = y;
      v85.size.width = width;
      v85.size.height = height;
      if (!CGRectEqualToRect(v83, v85))
      {
LABEL_19:
        IOSurfaceLock(v43, 0, 0);
        BaseAddress = IOSurfaceGetBaseAddress(v43);
        BytesPerRow = IOSurfaceGetBytesPerRow(v43);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        if (-[UIDevice _supportsDeepColor](+[UIDevice currentDevice](UIDevice, "currentDevice"), "_supportsDeepColor"))
        {
          v49 = CGIOSurfaceContextCreate();
        }
        else
        {
          v49 = (uint64_t)CGBitmapContextCreate(BaseAddress, v44, v45, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
        }
        v56 = (CGContext *)v49;
        CGColorSpaceRelease(DeviceRGB);
        if (v56)
        {
          CGContextTranslateCTM(v56, 0.0, (double)v45);
          CGContextScaleCTM(v56, v76, -v76);
          CGAffineTransformMakeScale(&v81, v76, -v76);
          CGContextSetBaseCTM();
          UIGraphicsPushContext(v56);
          -[UISnapshotView _drawEdges:withContentSize:](self, "_drawEdges:withContentSize:", rect, v77, v78, v79, width, height);
          v57 = (int *)GetContextStack(0);
          PopContextFromStack(v57);
          CGContextRelease(v56);
        }
        IOSurfaceUnlock(v43, 0, 0);
      }
    }
    v55 = v76;
    self->_contentSize.width = (double)v44 / v76;
    self->_contentSize.height = (double)v45 / v76;
    -[UISnapshotView _contentsCenterForEdgePadding:withContentSize:](self, "_contentsCenterForEdgePadding:withContentSize:", rect, v77, v78, v79);
    v52 = v58;
    v53 = v59;
    v54 = v60;
    v40 = v61;
  }
  else
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v79 + width + v77, v78 + height + rect, v76);
    -[UISnapshotView _drawEdges:withContentSize:](self, "_drawEdges:withContentSize:", rect, v77, v78, v79, width, height);
    v50 = GetContextStack(0);
    if (*(int *)v50 < 1)
      v51 = 0;
    else
      v51 = (CGContext *)v50[3 * (*(_DWORD *)v50 - 1) + 1];
    v55 = v76;
    v84.origin.x = v77;
    v84.origin.y = rect;
    v84.size.width = width;
    v84.size.height = height;
    CGContextClipToRect(v51, v84);
    v62 = GetContextStack(0);
    if (*(int *)v62 < 1)
      v63 = 0;
    else
      v63 = (CGContext *)v62[3 * (*(_DWORD *)v62 - 1) + 1];
    CGContextTranslateCTM(v63, -x, -y);
    v64 = GetContextStack(0);
    if (*(int *)v64 < 1)
      v65 = 0;
    else
      v65 = (CGContext *)v64[3 * (*(_DWORD *)v64 - 1) + 1];
    CGContextTranslateCTM(v65, v77, rect);
    v66 = (void *)objc_msgSend(a4, "layer");
    v67 = GetContextStack(0);
    if (*(int *)v67 < 1)
      v68 = 0;
    else
      v68 = v67[3 * (*(_DWORD *)v67 - 1) + 1];
    objc_msgSend(v66, "renderInContext:", v68);
    v43 = (__IOSurface *)(id)objc_msgSend(_UIGraphicsGetImageFromCurrentImageContext(0), "CGImage");
    v69 = (double)CGImageGetWidth(v43) / v76;
    v70 = CGImageGetHeight(v43);
    self->_contentSize.width = v69;
    self->_contentSize.height = (double)v70 / v76;
    -[UISnapshotView _contentsCenterForEdgePadding:withContentSize:](self, "_contentsCenterForEdgePadding:withContentSize:", rect, v77, v78, v79, v69);
    v52 = v71;
    v53 = v72;
    v54 = v73;
    v40 = v74;
    UIGraphicsEndImageContext();
  }
  v75 = a5 == 2;
  -[CALayer setContents:](-[UIView layer](self->_imageView, "layer"), "setContents:", v43);
  -[CALayer setContentsCenter:](-[UIView layer](self->_imageView, "layer"), "setContentsCenter:", v52, v53, v54, v40);
  -[UIView setContentScaleFactor:](self->_imageView, "setContentScaleFactor:", v55);
  -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  -[UISnapshotView _updateContentsRect](self, "_updateContentsRect");
  -[CALayer setShouldRasterize:](-[UIView layer](self->_imageView, "layer"), "setShouldRasterize:", v75);
  -[CALayer setFrozen:](-[UIView layer](self->_imageView, "layer"), "setFrozen:", v75);

  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v12);
}

- (void)captureSnapshotOfView:(id)a3 withSnapshotType:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "bounds");
  -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](self, "captureSnapshotRect:fromView:withSnapshotType:", a3, v4);
}

- (UIEdgeInsets)edgePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgePadding.top;
  left = self->_edgePadding.left;
  bottom = self->_edgePadding.bottom;
  right = self->_edgePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)_snapshotView
{
  return self->_imageView;
}

- (CGSize)_contentSize
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

- (CGPoint)_contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIColor)edgePaddingColor
{
  return self->_edgePaddingColor;
}

- (void)setEdgePaddingColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (UIView)shadowView
{
  return &self->_shadowView->super;
}

@end
