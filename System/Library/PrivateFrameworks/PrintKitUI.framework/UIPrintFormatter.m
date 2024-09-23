@implementation UIPrintFormatter

- (UIPrintFormatter)init
{
  UIPrintFormatter *v2;
  UIPrintFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPrintFormatter;
  v2 = -[UIPrintFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_startPage = 0x7FFFFFFFFFFFFFFFLL;
    -[UIPrintFormatter _setNeedsRecalc](v2, "_setNeedsRecalc");
    *(int64x2_t *)&v3->_maximumContentHeight = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v3->_perPageContentInsets.top = 0u;
    *(_OWORD *)&v3->_perPageContentInsets.bottom = 0u;
    *(_WORD *)&v3->_requiresMainThread = 257;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_maximumContentHeight;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_maximumContentWidth;
  v5 = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)((char *)result + 72) = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)((char *)result + 56) = v5;
  v6 = *(_OWORD *)&self->_perPageContentInsets.bottom;
  *(_OWORD *)((char *)result + 88) = *(_OWORD *)&self->_perPageContentInsets.top;
  *(_OWORD *)((char *)result + 104) = v6;
  return result;
}

- (void)removeFromPrintPageRenderer
{
  UIPrintPageRenderer **p_printPageRenderer;
  id WeakRetained;
  UIPrintFormatter *v4;

  p_printPageRenderer = &self->_printPageRenderer;
  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)p_printPageRenderer);
  objc_msgSend(WeakRetained, "_removePrintFormatter:", v4);

}

- (void)setMaximumContentWidth:(CGFloat)maximumContentWidth
{
  if (self->_maximumContentWidth != maximumContentWidth)
  {
    self->_maximumContentWidth = maximumContentWidth;
    -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
  }
}

- (void)setMaximumContentHeight:(CGFloat)maximumContentHeight
{
  if (self->_maximumContentHeight != maximumContentHeight)
  {
    self->_maximumContentHeight = maximumContentHeight;
    -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
  }
}

- (void)setContentInsets:(UIEdgeInsets)contentInsets
{
  if (contentInsets.left != self->_contentInsets.left
    || contentInsets.top != self->_contentInsets.top
    || contentInsets.right != self->_contentInsets.right
    || contentInsets.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = contentInsets;
    -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
  }
}

- (void)setPerPageContentInsets:(UIEdgeInsets)perPageContentInsets
{
  if (perPageContentInsets.left != self->_perPageContentInsets.left
    || perPageContentInsets.top != self->_perPageContentInsets.top
    || perPageContentInsets.right != self->_perPageContentInsets.right
    || perPageContentInsets.bottom != self->_perPageContentInsets.bottom)
  {
    self->_perPageContentInsets = perPageContentInsets;
    -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
  }
}

- (void)setPrintPageRenderer:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_printPageRenderer);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_printPageRenderer, obj);
    -[UIPrintFormatter _setNeedsRecalc](self, "_setNeedsRecalc");
    v5 = obj;
  }

}

- (void)_setNeedsRecalc
{
  self->_needsRecalc = 1;
}

- (void)_recalcIfNecessary
{
  if (self->_needsRecalc)
  {
    self->_needsRecalc = 0;
    self->_pageCount = -[UIPrintFormatter _recalcPageCount](self, "_recalcPageCount");
  }
}

- (NSInteger)pageCount
{
  -[UIPrintFormatter _recalcIfNecessary](self, "_recalcIfNecessary");
  return self->_pageCount;
}

- (int64_t)_recalcPageCount
{
  return 0;
}

- (CGRect)_pageContentRect:(BOOL)a3
{
  _BOOL4 v3;
  CGSize v5;
  id WeakRetained;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  CGSize v22;
  double left;
  double right;
  double v25;
  double v26;
  double v27;
  double top;
  double bottom;
  double height;
  double v31;
  double v32;
  double v33;
  float64x2_t v34;
  float64x2_t v35;
  double x;
  double y;
  double width;
  double v39;
  CGRect v40;
  CGRect remainder;
  CGRect v42;
  CGRect result;

  v3 = a3;
  v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  remainder.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  remainder.size = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_printPageRenderer);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "printableRect", 0, 0, 0, 0);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    remainder.origin.x = v8;
    remainder.origin.y = v10;
    remainder.size.width = v12;
    remainder.size.height = v14;
    objc_msgSend(v7, "headerHeight");
    v17 = v16;
    v42.origin.x = v9;
    v42.origin.y = v11;
    v42.size.width = v13;
    v42.size.height = v15;
    CGRectDivide(v42, &v40, &remainder, v17, CGRectMinYEdge);
    objc_msgSend(v7, "footerHeight");
    CGRectDivide(remainder, &v40, &remainder, v18, CGRectMaxYEdge);
    v19.f64[0] = 0.0;
    if (v3)
      v19.f64[0] = self->_contentInsets.top;
    v20.f64[0] = self->_contentInsets.left;
    v21 = v20.f64[0] + remainder.origin.x;
    remainder.origin.x = v21;
    remainder.origin.y = v19.f64[0] + remainder.origin.y;
    v20.f64[1] = v19.f64[0];
    v19.f64[0] = self->_contentInsets.right;
    v22 = (CGSize)vsubq_f64((float64x2_t)remainder.size, vaddq_f64(v20, v19));
    remainder.size = v22;
    left = self->_perPageContentInsets.left;
    if (left > v21)
    {
      remainder.size.width = v22.width - (left - v21);
      remainder.origin.x = left;
    }
    right = self->_perPageContentInsets.right;
    objc_msgSend(v7, "paperRect");
    if (right > v25 - remainder.size.width - remainder.origin.x)
    {
      v26 = self->_perPageContentInsets.right;
      objc_msgSend(v7, "paperRect");
      remainder.size.width = remainder.size.width - (v26 - (v27 - remainder.size.width - remainder.origin.x));
    }
    top = self->_perPageContentInsets.top;
    if (top > remainder.origin.y)
    {
      remainder.size.height = remainder.size.height - (top - remainder.origin.y);
      remainder.origin.y = top;
    }
    bottom = self->_perPageContentInsets.bottom;
    objc_msgSend(v7, "paperRect");
    height = remainder.size.height;
    if (bottom > v31 - remainder.size.height - remainder.origin.y)
    {
      v32 = self->_perPageContentInsets.bottom;
      objc_msgSend(v7, "paperRect");
      height = remainder.size.height - (v32 - (v33 - remainder.size.height - remainder.origin.y));
    }
    v34.f64[0] = remainder.size.width;
    v34.f64[1] = height;
    v35 = (float64x2_t)vextq_s8(*(int8x16_t *)&self->_maximumContentHeight, *(int8x16_t *)&self->_maximumContentHeight, 8uLL);
    remainder.size = (CGSize)vmaxnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v35, v34), (int8x16_t)v34, (int8x16_t)v35), (float64x2_t)0);
  }

  x = remainder.origin.x;
  y = remainder.origin.y;
  width = remainder.size.width;
  v39 = remainder.size.height;
  result.size.height = v39;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)rectForPageAtIndex:(NSInteger)pageIndex
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSInteger startPage;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 IsEmpty;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v7 = *MEMORY[0x1E0C9D648];
  startPage = self->_startPage;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  if (startPage <= pageIndex)
  {
    v7 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (self->_pageCount + startPage > pageIndex)
    {
      -[UIPrintFormatter _pageContentRect:](self, "_pageContentRect:", startPage == pageIndex);
      v7 = v12;
      v9 = v13;
      v10 = v14;
      v11 = v15;
    }
  }
  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v10;
  v21.size.height = v11;
  IsEmpty = CGRectIsEmpty(v21);
  if (IsEmpty)
    v17 = v3;
  else
    v17 = v7;
  if (IsEmpty)
    v18 = v4;
  else
    v18 = v9;
  if (IsEmpty)
    v19 = v5;
  else
    v19 = v10;
  if (IsEmpty)
    v20 = v6;
  else
    v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (UIPrintPageRenderer)printPageRenderer
{
  return (UIPrintPageRenderer *)objc_loadWeakRetained((id *)&self->_printPageRenderer);
}

- (CGFloat)maximumContentHeight
{
  return self->_maximumContentHeight;
}

- (CGFloat)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)perPageContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_perPageContentInsets.top;
  left = self->_perPageContentInsets.left;
  bottom = self->_perPageContentInsets.bottom;
  right = self->_perPageContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSInteger)startPage
{
  return self->_startPage;
}

- (void)setStartPage:(NSInteger)startPage
{
  self->_startPage = startPage;
}

- (BOOL)requiresMainThread
{
  return self->_requiresMainThread;
}

- (BOOL)imagePDFAnnotations
{
  return self->_imagePDFAnnotations;
}

- (void)setImagePDFAnnotations:(BOOL)a3
{
  self->_imagePDFAnnotations = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printPageRenderer);
}

@end
