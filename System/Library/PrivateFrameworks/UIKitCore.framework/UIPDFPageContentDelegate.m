@implementation UIPDFPageContentDelegate

- (UIPDFPageContentDelegate)init
{
  UIPDFPageContentDelegate *result;
  CGPoint v3;
  CGSize v4;
  uint64_t v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPDFPageContentDelegate;
  result = -[UIPDFPageContentDelegate init](&v7, sel_init);
  if (result)
  {
    result->_document = 0;
    result->_pageIndex = 0;
    result->_view = 0;
    v3 = (CGPoint)*MEMORY[0x1E0C9D648];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    result->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    result->_bounds.size = v4;
    v5 = MEMORY[0x1E0C9BAA8];
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_transform.c = v6;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v5 + 32);
    result->_white = 0;
    result->_highlightColor = 0;
    result->_owner = 0;
    result->_box.origin = v3;
    result->_box.size = v4;
    result->_pageRotation = 0;
    result->_lock._os_unfair_lock_opaque = 0;
    result->_threadCount = 0;
    result->_isCancelled = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_white);
  -[UIPDFPageContentDelegate setDocument:](self, "setDocument:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageContentDelegate;
  -[UIPDFPageContentDelegate dealloc](&v3, sel_dealloc);
}

- (void)computeTransform
{
  unint64_t pageRotation;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  __int128 v8;
  _OWORD v9[3];

  pageRotation = self->_pageRotation;
  -[CALayer bounds](self->_owner, "bounds");
  CGPDFComputeTransform((uint64_t)v9, pageRotation, self->_box.origin.x, self->_box.origin.y, self->_box.size.width, self->_box.size.height, v4, v5, v6, v7);
  v8 = v9[1];
  *(_OWORD *)&self->_transform.a = v9[0];
  *(_OWORD *)&self->_transform.c = v8;
  *(_OWORD *)&self->_transform.tx = v9[2];
}

- (UIPDFPageView)view
{
  os_unfair_lock_s *p_lock;
  UIPDFPageView *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_view;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setView:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_view = (UIPDFPageView *)a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isCancelled
{
  UIPDFPageContentDelegate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsCancelled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isCancelled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  id v6;
  void *v7;
  unint64_t threadCount;
  _BOOL4 v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  UIPDFPageView *v21;
  int v22;
  char v23;
  CGAffineTransform v24[2];
  CGRect v25;
  CGRect v26;
  CGRect v27;

  if (!self->_view)
    return;
  if (-[UIPDFPageContentDelegate isCancelled](self, "isCancelled", a3))
    return;
  v6 = -[UIPDFPage copyPage](-[UIPDFPageView page](self->_view, "page"), "copyPage");
  if (!v6)
    return;
  v7 = v6;
  os_unfair_lock_lock(&self->_lock);
  threadCount = self->_threadCount;
  if (threadCount)
  {
    v9 = !self->_isCancelled;
  }
  else
  {
    self->_isCancelled = 0;
    v9 = 1;
  }
  self->_threadCount = threadCount + 1;
  os_unfair_lock_unlock(&self->_lock);
  -[CALayer bounds](-[UIPDFPageContentDelegate owner](self, "owner"), "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  memset(&v24[1], 0, sizeof(CGAffineTransform));
  -[UIPDFPageContentDelegate transform](self, "transform");
  CGContextSaveGState(a4);
  if (v9)
  {
    CGContextSetFillColorWithColor(a4, -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    CGContextFillRect(a4, v25);
    v26.origin.x = v11;
    v26.origin.y = v13;
    v26.size.width = v15;
    v26.size.height = v17;
    CGContextClipToRect(a4, v26);
    v24[0] = v24[1];
    CGContextConcatCTM(a4, v24);
    CGContextSetInterpolationQuality(a4, kCGInterpolationMedium);
    objc_msgSend(v7, "CGPage");
    CGContextDrawPDFPageWithProgressCallback();
  }
  else
  {
    v27.origin.x = v11;
    v27.origin.y = v13;
    v27.size.width = v15;
    v27.size.height = v17;
    CGContextClipToRect(a4, v27);
    v24[0] = v24[1];
    CGContextConcatCTM(a4, v24);
    CGContextSetInterpolationQuality(a4, kCGInterpolationMedium);
  }
  os_unfair_lock_lock(&self->_lock);
  v18 = self->_threadCount;
  if (!v18)
  {
    if (self->_isCancelled)
    {
LABEL_15:
      self->_isCancelled = 0;
      goto LABEL_16;
    }
LABEL_17:
    v20 = 0;
    goto LABEL_18;
  }
  v19 = v18 - 1;
  self->_threadCount = v19;
  if (!self->_isCancelled)
    goto LABEL_17;
  if (!v19)
    goto LABEL_15;
LABEL_16:
  v20 = 1;
LABEL_18:
  os_unfair_lock_unlock(&self->_lock);

  v21 = -[UIPDFPageContentDelegate view](self, "view");
  if (-[UIPDFPageView showAnnotations](v21, "showAnnotations"))
    LOBYTE(v22) = 0;
  else
    v22 = !-[UIPDFPageView allowHighlighting](v21, "allowHighlighting");
  if (v21)
    v23 = v20;
  else
    v23 = 1;
  if ((v23 & 1) == 0 && (v22 & 1) == 0)
    -[UIPDFPageView drawAnnotations:](v21, "drawAnnotations:", a4);

  CGContextRestoreGState(a4);
}

- (void)drawSelectionLayerBlockMode:(id)a3 inContext:(CGContext *)a4
{
  UIPDFPageView *v6;
  UIPDFPageView *v7;
  UIPDFPage *v8;
  uint64_t v9;
  void *v10;
  CALayer *v11;
  CALayer *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGColor *v25;
  CGRect v26;

  v6 = -[UIPDFPageContentDelegate view](self, "view", a3);
  if (v6)
  {
    v7 = v6;
    v8 = -[UIPDFPageView page](v6, "page");
    if (v8)
    {
      v9 = -[UIPDFPage selection](v8, "selection");
      if (v9)
      {
        v10 = (void *)v9;
        v11 = -[UIPDFPageContentDelegate owner](self, "owner");
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v10, "bounds");
          -[UIPDFPageView convertRectFromPDFPageSpace:](v7, "convertRectFromPDFPageSpace:");
          -[CALayer convertRect:fromLayer:](v12, "convertRect:fromLayer:", -[UIView layer](v7, "layer"), v13, v14, v15, v16);
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v25 = -[UIPDFPageContentDelegate highlightColor](self, "highlightColor");
          CGContextSaveGState(a4);
          CGContextSetFillColorWithColor(a4, v25);
          v26.origin.x = v18;
          v26.origin.y = v20;
          v26.size.width = v22;
          v26.size.height = v24;
          CGContextFillRect(a4, v26);
          CGContextRestoreGState(a4);
        }
      }
    }
  }
}

- (void)addRect:(CGRect)a3 toPath:(CGPath *)a4 transform:(CGAffineTransform *)a5 view:(id)a6 owner:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double MinY;
  double MaxX;
  double MaxY;
  double MinX;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MinX = CGRectGetMinX(a3);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MinY = CGRectGetMinY(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MaxX = CGRectGetMaxX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  MaxY = CGRectGetMaxY(v43);
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MinX), vmulq_n_f64(*(float64x2_t *)&a5->c, MinY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v15, v16);
  v18 = v17;
  v20 = v19;
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MaxX), vmulq_n_f64(*(float64x2_t *)&a5->c, MinY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v21, v22);
  v24 = v23;
  v26 = v25;
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MaxX), vmulq_n_f64(*(float64x2_t *)&a5->c, MaxY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v27, v28);
  v30 = v29;
  v32 = v31;
  objc_msgSend(a6, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a5->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a5->a, MinX), vmulq_n_f64(*(float64x2_t *)&a5->c, MaxY))));
  objc_msgSend(a7, "convertPoint:fromLayer:", objc_msgSend(a6, "layer"), v33, v34);
  CPSetCGPathPoints4(a4, v18, v20, v24, v26, v30, v32, v35, v36);
  CGPathCloseSubpath(a4);
}

- (BOOL)pageHasSelection
{
  UIPDFPage *v2;

  v2 = -[UIPDFPageView page](-[UIPDFPageContentDelegate view](self, "view"), "page");
  if (v2)
    LOBYTE(v2) = -[UIPDFPage selection](v2, "selection") != 0;
  return (char)v2;
}

- (void)drawSelectionLayer:(id)a3 inContext:(CGContext *)a4
{
  UIPDFPageView *v7;
  UIPDFPageView *v8;
  UIPDFSelectionController *v9;
  UIPDFSelectionController *v10;
  UIPDFPage *v11;
  UIPDFSelection *v12;
  CALayer *v13;
  CALayer *v14;
  UIPDFPageView *v15;
  CGColor *v16;
  uint64_t NumberOfRectsAndTransforms;
  uint64_t v18;
  uint64_t i;
  const CGPath *Mutable;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;

  v7 = -[UIPDFPageContentDelegate view](self, "view");
  if (v7)
  {
    v8 = v7;
    v9 = -[UIPDFPageView selectionController](v7, "selectionController");
    if (v9)
    {
      v10 = v9;
      if (-[UIPDFSelectionController rangeMode](v9, "rangeMode")
        || -[UIPDFSelectionController instantHighlightMode](v10, "instantHighlightMode"))
      {
        v11 = -[UIPDFPageView page](v8, "page");
        if (v11)
        {
          v12 = -[UIPDFPage selection](v11, "selection");
          if (v12)
          {
            if (-[UIPDFSelection CGSelection](v12, "CGSelection"))
            {
              v13 = -[UIPDFPageContentDelegate owner](self, "owner");
              if (v13)
              {
                v14 = v13;
                v15 = v8;
                CGPDFSelectionRetain();
                v16 = -[UIPDFPageContentDelegate highlightColor](self, "highlightColor");
                NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
                if (NumberOfRectsAndTransforms)
                {
                  v18 = NumberOfRectsAndTransforms;
                  for (i = 0; i != v18; ++i)
                  {
                    v22 = 0u;
                    v23 = 0u;
                    memset(v21, 0, sizeof(v21));
                    CGPDFSelectionGetRectAndTransform();
                    Mutable = CGPathCreateMutable();
                    -[UIPDFPageContentDelegate addRect:toPath:transform:view:owner:](self, "addRect:toPath:transform:view:owner:", Mutable, v21, v8, v14, v22, v23);
                    CGContextSaveGState(a4);
                    CGContextSetFillColorWithColor(a4, v16);
                    CGContextAddPath(a4, Mutable);
                    CGContextFillPath(a4);
                    CGContextRestoreGState(a4);
                    CGPathRelease(Mutable);
                  }
                }
                CGPDFSelectionRelease();

              }
            }
          }
        }
      }
      else
      {
        -[UIPDFPageContentDelegate drawSelectionLayerBlockMode:inContext:](self, "drawSelectionLayerBlockMode:inContext:", a3, a4);
      }
    }
  }
}

- (CALayer)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  self->_owner = (CALayer *)a3;
}

- (CGRect)box
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_box, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBox:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_box, &v3, 32, 1, 0);
}

- (unint64_t)pageRotation
{
  return self->_pageRotation;
}

- (void)setPageRotation:(unint64_t)a3
{
  self->_pageRotation = a3;
}

- (CGColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(CGColor *)a3
{
  self->_highlightColor = a3;
}

- (UIPDFDocument)document
{
  return (UIPDFDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDocument:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

@end
