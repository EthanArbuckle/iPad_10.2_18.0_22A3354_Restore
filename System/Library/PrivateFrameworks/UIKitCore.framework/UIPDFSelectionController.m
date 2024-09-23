@implementation UIPDFSelectionController

- (UIPDFSelectionController)init
{
  UIPDFSelectionController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPDFSelectionController;
  v2 = -[UIPDFSelectionController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectionHideFromAncestor_, CFSTR("UITextSelectionWillScroll"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectionShowToAncestor_, CFSTR("UITextSelectionDidScroll"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectionHideFromAncestor_, CFSTR("UITextSelectionWillZoom"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectionShowToAncestor_, CFSTR("UITextSelectionDidZoom"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectionHide_, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_selectionShowDelayed_, CFSTR("UIWindowDidRotateNotification"), 0);
    v2->_pageView = 0;
    *(_WORD *)&v2->_instantModeIsSuspended = 0;
    v2->_needsLayout = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFSelectionController;
  -[UIPDFSelectionController dealloc](&v3, sel_dealloc);
}

- (void)selectionHideFromAncestor:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[UIView isDescendantOfView:](self->_pageView, "isDescendantOfView:", v5))
      -[UIPDFSelectionController selectionHide:](self, "selectionHide:", a3);
  }
}

- (void)selectionShowToAncestor:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[UIView isDescendantOfView:](self->_pageView, "isDescendantOfView:", v5))
      -[UIPDFSelectionController selectionShow:](self, "selectionShow:", a3);
  }
}

- (void)selectionHide:(id)a3
{
  self->_hiding = 1;
  if (self->_selectionWidget)
    -[UIPDFPageView hideSelection](self->_pageView, "hideSelection", a3);
}

- (void)selectionShow:(id)a3
{
  self->_hiding = 0;
  if (self->_selectionWidget)
    -[UIPDFPageView showSelection](self->_pageView, "showSelection", a3);
}

- (void)selectionShowDelayed:(id)a3
{
  -[UIPDFSelectionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_selectionShow_, 0, 0.4);
}

- (void)adjustSelection:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  __n128 v6;
  __n128 v7;
  UIPDFPage *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t IntersectingRect;
  uint64_t EndIndex;
  int64_t lastIndex;
  uint64_t v14;
  int IsWithinLayout;
  UIPDFPage *v16;
  UIPDFSelection *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  CGPoint origin;
  CGSize size;
  int v23;
  double MinX;
  double v25;
  __int128 v26;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  double MinY;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  uint64_t v35;
  CGFloat v36;
  __n128 v37;
  __n128 v38;
  uint64_t v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  UIPDFSelection *v43;
  UIPDFParagraphWidget *v44;
  UIPDFSelection *v45;
  uint64_t v46;
  uint64_t v47;
  UIPDFTextRangeWidget *v48;
  __int128 v49;
  __n128 v50;
  __n128 v51;
  CGAffineTransform v52;
  CGAffineTransform v53;
  CGRect v54;
  CGPoint v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  y = a3.y;
  x = a3.x;
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:");
  v50 = v6;
  v51 = v7;
  v8 = -[UIPDFPageView page](self->_pageView, "page");
  v9 = -[UIPDFPage CGPage](v8, "CGPage");
  if (!self->_rangeMode)
  {
    -[UIPDFSelectionWidget selectionRectangle](self->_selectionWidget, "selectionRectangle");
    -[UIPDFPageView convertRectToPDFPageSpace:](self->_pageView, "convertRectToPDFPageSpace:");
    IntersectingRect = CGPDFSelectionCreateIntersectingRect();
    if (!IntersectingRect)
      goto LABEL_32;
    goto LABEL_10;
  }
  if (self->_preceeds)
  {
    v10 = CGPDFSelectionCreateFromPointToIndex();
    if (v10)
    {
      IntersectingRect = v10;
      EndIndex = CGPDFSelectionGetEndIndex();
      lastIndex = self->_lastIndex;
      goto LABEL_9;
    }
    CGPDFPageGetLayout();
    CGPDFLayoutGetCharacterBounds();
    v36 = v64.origin.y;
    v37.n128_f64[0] = CGRectGetWidth(v64) + v64.origin.x;
    v38.n128_u64[0] = 0;
    v39 = v9;
    v40 = v50;
    v41 = v51;
    v42.n128_f64[0] = v36;
  }
  else
  {
    v14 = CGPDFSelectionCreateFromIndexToPoint();
    if (v14)
    {
      IntersectingRect = v14;
      EndIndex = CGPDFSelectionGetStartIndex();
      lastIndex = self->_firstIndex;
LABEL_9:
      if (EndIndex == lastIndex)
        goto LABEL_10;
LABEL_31:
      CGPDFSelectionRelease();
      goto LABEL_32;
    }
    CGPDFPageGetLayout();
    CGPDFLayoutGetCharacterBounds();
    v38.n128_u64[0] = 0;
    v39 = v9;
    v37 = v50;
    v42 = v51;
  }
  v46 = MEMORY[0x186DC6CD0](v39, 3, v40, v41, v37, v42, v38);
  if (!v46)
    goto LABEL_32;
  IntersectingRect = v46;
  if (CGPDFSelectionIsWithinLayout())
    goto LABEL_31;
LABEL_10:
  IsWithinLayout = CGPDFSelectionIsWithinLayout();
  if (!self->_rangeMode || (IsWithinLayout & 1) != 0)
  {
    if (self->_rangeMode)
      v23 = 0;
    else
      v23 = IsWithinLayout;
    if (v23 == 1)
    {
      CGPDFSelectionGetBounds();
      -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
      v58 = CGRectInset(v57, 8.0, 8.0);
      v55.x = x;
      v55.y = y;
      if (CGRectContainsPoint(v58, v55) && CGPDFSelectionGetNumberOfTextRanges() >= 1)
      {
        memset(&v53, 0, sizeof(v53));
        CGPDFSelectionGetRectAndTransform();
        v59.origin = 0u;
        v59.size = 0u;
        v60 = CGRectInset(v59, 0.1, 0.1);
        v52.a = v60.origin.x;
        v52.b = v60.origin.y;
        v52.c = v60.size.width;
        v52.d = v60.size.height;
        MinX = CGRectGetMinX(v60);
        v61.origin.x = v52.a;
        v61.origin.y = v52.b;
        v61.size.width = v52.c;
        v61.size.height = v52.d;
        v25 = MinX * 0.0 + CGRectGetMaxY(v61) * 0.0 + 0.0;
        CGPDFSelectionGetRectAndTransform();
        v62.origin.x = v52.a;
        v62.origin.y = v52.b;
        v62.size.width = v52.c;
        v62.size.height = v52.d;
        v63 = CGRectInset(v62, 0.1, 0.1);
        v52.a = v63.origin.x;
        v52.b = v63.origin.y;
        v52.c = v63.size.width;
        v52.d = v63.size.height;
        *(double *)&v26 = CGRectGetMaxX(v63);
        v49 = v26;
        *(CGFloat *)&v26 = v52.a;
        b = v52.b;
        c = v52.c;
        d = v52.d;
        MinY = CGRectGetMinY(*(CGRect *)&v26);
        *(_QWORD *)&v31.f64[0] = v50.n128_u64[0];
        *(_QWORD *)&v31.f64[1] = v51.n128_u64[0];
        v32 = vsubq_f64(v31, vaddq_f64((float64x2_t)0, vaddq_f64(vmulq_n_f64((float64x2_t)0, *(double *)&v49), vmulq_n_f64((float64x2_t)0, MinY))));
        v33 = vmulq_f64(v32, v32);
        v34 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v33.f64[0], 0);
        v34.f64[0] = (v50.n128_f64[0] - v25) * (v50.n128_f64[0] - v25);
        v33.f64[0] = (v51.n128_f64[0] - v25) * (v51.n128_f64[0] - v25);
        *(float32x2_t *)&v33.f64[0] = vsqrt_f32(vcvt_f32_f64(vaddq_f64(v34, v33)));
        LOBYTE(v33.f64[0]) = vcgt_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&v33.f64[0], 1), *(float32x2_t *)&v33.f64[0]).u8[0];
        self->_preceeds = LOBYTE(v33.f64[0]) & 1;
        v35 = (LOBYTE(v33.f64[0]) & 1) != 0
            ? CGPDFSelectionCreateFromPointToIndex()
            : CGPDFSelectionCreateFromIndexToPoint();
        v47 = v35;
        if (v35)
        {
          CGPDFSelectionRelease();
          -[UIPDFSelectionWidget remove](self->_selectionWidget, "remove");

          v48 = objc_alloc_init(UIPDFTextRangeWidget);
          self->_selectionWidget = (UIPDFSelectionWidget *)v48;
          -[UIPDFTextRangeWidget setPageView:](v48, "setPageView:", self->_pageView);
          self->_rangeMode = 1;
          -[UIPDFSelectionWidget setSelectedGrabber:](self->_selectionWidget, "setSelectedGrabber:", !self->_preceeds);
          IntersectingRect = v47;
        }
      }
    }
  }
  else
  {
    v16 = -[UIPDFPageView page](self->_pageView, "page");
    v17 = -[UIPDFPage selection](v16, "selection");
    v18 = -[UIPDFSelection numberOfRectangles](v17, "numberOfRectangles");
    if (v18)
    {
      v19 = v18;
      for (i = 0; i != v19; ++i)
      {
        memset(&v54, 0, sizeof(v54));
        memset(&v53, 0, sizeof(v53));
        -[UIPDFSelection getBounds:transform:index:](v17, "getBounds:transform:index:", &v54, &v53, i);
        origin = v54.origin;
        size = v54.size;
        v52 = v53;
        v56 = CGRectApplyAffineTransform(v54, &v52);
        v65.origin = origin;
        v65.size = size;
        CGRectUnion(v56, v65);
      }
    }
    CGPDFSelectionRelease();
    -[UIPDFPage CGPage](v16, "CGPage");
    IntersectingRect = CGPDFSelectionCreateIntersectingRect();
    if (IntersectingRect)
    {
      v43 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", v16, IntersectingRect);
      -[UIPDFPage setSelection:](v16, "setSelection:", v43);

      -[UIPDFSelectionWidget remove](self->_selectionWidget, "remove");
      self->_rangeMode = 0;
      v44 = objc_alloc_init(UIPDFParagraphWidget);
      self->_selectionWidget = (UIPDFSelectionWidget *)v44;
      -[UIPDFParagraphWidget setPageView:](v44, "setPageView:", self->_pageView);
      -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v43);
    }
  }
  v45 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", v8, IntersectingRect);
  self->_firstIndex = -[UIPDFSelection startIndex](v45, "startIndex");
  self->_lastIndex = -[UIPDFSelection endIndex](v45, "endIndex");
  -[UIPDFPage setSelection:](v8, "setSelection:", v45);

  CGPDFSelectionRelease();
  -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection"));
LABEL_32:
  -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay", v49);
}

- (BOOL)useParagraphMode
{
  return 0;
}

- (void)addSelectionWidget:(id)a3
{
  UIPDFTextRangeWidget *v5;

  v5 = objc_alloc_init(UIPDFTextRangeWidget);
  self->_selectionWidget = (UIPDFSelectionWidget *)v5;
  -[UIPDFTextRangeWidget setPageView:](v5, "setPageView:", self->_pageView);
  -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", a3);
  -[UIPDFSelectionController suspendInstantHighlightMode](self, "suspendInstantHighlightMode");
}

- (void)setSelectionFor:(CGPoint)a3
{
  double y;
  double x;
  UIPDFPage *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 rangeMode;
  int IsStandaloneGraphic;
  UIPDFSelection *v11;

  if (!self->_instantHighlightMode)
  {
    y = a3.y;
    x = a3.x;
    v6 = -[UIPDFPageView page](self->_pageView, "page");
    -[UIPDFPage CGPage](v6, "CGPage");
    -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
    v7 = CGPDFSelectionCreateAtPointWithOptions();
    if (v7)
    {
      v8 = v7;
      rangeMode = self->_rangeMode;
      IsStandaloneGraphic = CGPDFSelectionIsStandaloneGraphic();
      if (rangeMode)
      {
        if (IsStandaloneGraphic)
          self->_rangeMode = 0;
      }
      else if ((IsStandaloneGraphic & 1) == 0)
      {
        self->_rangeMode = 1;
        CGPDFSelectionRelease();
        v8 = CGPDFSelectionCreateAtPointWithOptions();
      }
      v11 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", v6, v8);
      CGPDFSelectionRelease();
      -[UIPDFPage setSelection:](v6, "setSelection:", v11);

    }
    else
    {
      -[UIPDFPage setSelection:](v6, "setSelection:", 0);
    }
    -[UIPDFPageView setSelectionNeedsDisplay](self->_pageView, "setSelectionNeedsDisplay");
  }
}

- (void)extendSelectionToParagraph
{
  UIPDFPage *v3;
  UIPDFSelection *v4;

  v3 = -[UIPDFPageView page](self->_pageView, "page");
  v4 = -[UIPDFPage selection](v3, "selection");
  -[UIPDFSelection extendToParagraph](v4, "extendToParagraph");
  -[UIPDFPage setSelection:](v3, "setSelection:", v4);
  -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v4);
}

- (void)clearSelection
{
  UIPDFPage *v3;

  v3 = -[UIPDFPageView page](self->_pageView, "page");
  if (-[UIPDFPage selection](v3, "selection"))
  {
    if (self->_selectionWidget)
    {
      -[UIMenuController setMenuVisible:animated:](+[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController"), "setMenuVisible:animated:", 0, 1);
      -[UIPDFSelectionWidget remove](self->_selectionWidget, "remove");

      self->_selectionWidget = 0;
    }
    if (self->_instantModeIsSuspended)
      *(_WORD *)&self->_instantModeIsSuspended = 256;
    -[UIPDFPage setSelection:](v3, "setSelection:", 0);
    -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay");
  }
}

- (void)hideWidget
{
  UIPDFSelectionWidget *selectionWidget;

  selectionWidget = self->_selectionWidget;
  if (selectionWidget)
    -[UIPDFSelectionWidget hide](selectionWidget, "hide");
}

- (BOOL)shouldTrackAt:(CGPoint)a3
{
  UIPDFSelectionWidget *selectionWidget;
  int v5;
  CGPoint v7;

  selectionWidget = self->_selectionWidget;
  if (selectionWidget)
  {
    self->_resizingWidget = 0;
    v7 = (CGPoint)0;
    v5 = -[UIPDFSelectionWidget hitTest:fixedPoint:preceeds:](selectionWidget, "hitTest:fixedPoint:preceeds:", &v7, &self->_preceeds, a3.x, a3.y);
    if (v5)
    {
      self->_isTracking = 1;
      self->_selectionFixedPoint = v7;
      self->_resizingWidget = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
    if (self->_instantModeIsSuspended)
      *(_WORD *)&self->_instantModeIsSuspended = 256;
  }
  return v5;
}

- (void)startSelectingAt:(CGPoint)a3
{
  UIPDFSelection *v4;
  UIPDFSelection *v5;
  UIPDFParagraphWidget *v6;

  -[UIPDFSelectionController setSelectionFor:](self, "setSelectionFor:", a3.x, a3.y);
  if (!self->_rangeMode)
  {
    v4 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
    if (v4)
    {
      v5 = v4;

      v6 = objc_alloc_init(UIPDFParagraphWidget);
      self->_selectionWidget = (UIPDFSelectionWidget *)v6;
      -[UIPDFParagraphWidget setPageView:](v6, "setPageView:", self->_pageView);
      -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v5);
    }
  }
  if (-[UIPDFPageView delegate](self->_pageView, "delegate"))
  {
    -[UIPDFPageView delegate](self->_pageView, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject selectionWillTrack:](-[UIPDFPageView delegate](self->_pageView, "delegate"), "selectionWillTrack:", self->_pageView);
  }
  -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
}

- (void)startTracking:(CGPoint)a3 showMagnifier:(BOOL *)a4
{
  double y;
  double x;
  UIPDFAnnotationController *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  BOOL v13;

  y = a3.y;
  x = a3.x;
  if (self->_instantHighlightMode)
  {
    self->_cancelled = 0;
    *a4 = 0;
    v8 = -[UIPDFPageView annotationController](self->_pageView, "annotationController");
    if (-[UIPDFAnnotationController willTrackAtPoint:](v8, "willTrackAtPoint:", x, y))
    {
      -[UIPDFAnnotationController startTracking:](v8, "startTracking:", x, y);
      -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
      self->_startPoint.x = v9;
      self->_startPoint.y = v10;
    }
    else
    {
      self->_cancelled = 1;
    }
  }
  else if (self->_pageView)
  {
    if (self->_resizingWidget)
    {
      *a4 = self->_rangeMode;
      -[UIPDFSelectionWidget selectedPointFor:](self->_selectionWidget, "selectedPointFor:", a3.x, a3.y);
      self->_adjustedPoint.x = v11;
      self->_adjustedPoint.y = v12;
      if (-[UIPDFPageView delegate](self->_pageView, "delegate"))
      {
        -[UIPDFPageView delegate](self->_pageView, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSObject selectionWillTrack:](-[UIPDFPageView delegate](self->_pageView, "delegate"), "selectionWillTrack:", self->_pageView);
      }
    }
    else
    {
      self->_rangeMode = !-[UIPDFSelectionController useParagraphMode](self, "useParagraphMode");
      v13 = !-[UIPDFPageView allowHighlighting](self->_pageView, "allowHighlighting") && self->_rangeMode;
      *a4 = v13;
      -[UIPDFSelectionController startSelectingAt:](self, "startSelectingAt:", x, y);
    }
    if (!self->_rangeMode)
      self->_isTracking = 0;
  }
}

- (void)tracking:(CGPoint)a3 showMagnifier:(BOOL *)a4
{
  double y;
  double x;
  BOOL *p_needsLayout;
  CGFloat v9;
  CGFloat v10;
  BOOL rangeMode;
  UIPDFSelection *v12;
  UIPDFSelectionWidget *selectionWidget;
  UIPDFParagraphWidget *v14;

  if (!self->_pageView)
    return;
  y = a3.y;
  x = a3.x;
  if (!self->_instantHighlightMode)
  {
    if (self->_resizingWidget)
    {
      -[UIPDFSelectionWidget selectedPointFor:](self->_selectionWidget, "selectedPointFor:", a3.x, a3.y);
      self->_adjustedPoint.x = v9;
      self->_adjustedPoint.y = v10;
      -[UIPDFSelectionWidget track:](self->_selectionWidget, "track:", x, y);
      -[UIPDFSelectionController adjustSelection:](self, "adjustSelection:", self->_adjustedPoint.x, self->_adjustedPoint.y);
      rangeMode = self->_rangeMode;
    }
    else
    {
      -[UIPDFSelectionController setSelectionFor:](self, "setSelectionFor:", a3.x, a3.y);
      if (!self->_rangeMode)
      {
        v12 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
        selectionWidget = self->_selectionWidget;
        if (v12)
        {
          if (!selectionWidget)
          {
            v14 = objc_alloc_init(UIPDFParagraphWidget);
            self->_selectionWidget = (UIPDFSelectionWidget *)v14;
            -[UIPDFParagraphWidget setPageView:](v14, "setPageView:", self->_pageView);
            selectionWidget = self->_selectionWidget;
          }
          -[UIPDFSelectionWidget setSelection:](selectionWidget, "setSelection:", v12);
        }
        else if (selectionWidget)
        {
          -[UIPDFSelectionWidget remove](selectionWidget, "remove");

          self->_selectionWidget = 0;
        }
        goto LABEL_11;
      }
      rangeMode = 1;
    }
    *a4 = rangeMode;
LABEL_11:
    -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
    p_needsLayout = &self->_needsLayout;
    goto LABEL_12;
  }
  if (!self->_cancelled)
  {
    *a4 = 0;
    -[UIPDFAnnotationController tracking:](-[UIPDFPageView annotationController](self->_pageView, "annotationController"), "tracking:", a3.x, a3.y);
    p_needsLayout = &self->_needsLayout;
    if (self->_needsLayout)
    {
      -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
LABEL_12:
      *p_needsLayout = 0;
    }
  }
}

- (void)endTracking:(CGPoint)a3
{
  double y;
  double x;
  _BOOL4 v6;
  UIPDFPageView *pageView;
  UIPDFSelection *v8;
  UIPDFSelection *v9;
  UIPDFSelectionWidget *v10;
  UIPDFTextRangeWidget *v11;
  UIPDFPage *v12;
  uint64_t v13;
  UIPDFSelection *v14;
  UIPDFSelectionWidget *selectionWidget;

  if (self->_instantHighlightMode)
  {
    if (!self->_cancelled)
    {
      y = a3.y;
      x = a3.x;
      v6 = -[UIPDFAnnotationController madeInstantAnnotation](-[UIPDFPageView annotationController](self->_pageView, "annotationController"), "madeInstantAnnotation");
      pageView = self->_pageView;
      if (v6)
      {
        -[UIPDFAnnotationController endTrackingAtPoint:](-[UIPDFPageView annotationController](pageView, "annotationController"), "endTrackingAtPoint:", x, y);
      }
      else
      {
        v12 = -[UIPDFPageView page](pageView, "page");
        -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
        -[UIPDFPage CGPage](v12, "CGPage");
        v13 = CGPDFSelectionCreateAtPointWithOptions();
        if (v13)
        {
          v14 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", -[UIPDFPageView page](self->_pageView, "page"), v13);
          -[UIPDFPage setSelection:](v12, "setSelection:", v14);

          selectionWidget = self->_selectionWidget;
          if (selectionWidget)
          {

            self->_selectionWidget = 0;
          }
          -[UIPDFSelectionController suspendInstantHighlightMode](self, "suspendInstantHighlightMode");
          CGPDFSelectionRelease();
        }
      }
      -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
      -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay");
    }
  }
  else
  {
    if (self->_rangeMode)
    {
      v8 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page", a3.x, a3.y), "selection");
      if (v8)
      {
        if (!self->_resizingWidget)
        {
          v9 = v8;
          v10 = self->_selectionWidget;
          if (v10)

          self->_firstIndex = -[UIPDFSelection startIndex](v9, "startIndex");
          self->_lastIndex = -[UIPDFSelection endIndex](v9, "endIndex");
          v11 = objc_alloc_init(UIPDFTextRangeWidget);
          self->_selectionWidget = (UIPDFSelectionWidget *)v11;
          -[UIPDFTextRangeWidget setPageView:](v11, "setPageView:", self->_pageView);
          -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v9);
        }
      }
    }
    self->_isTracking = 0;
    -[UIPDFSelectionWidget endTracking](self->_selectionWidget, "endTracking", a3.x, a3.y);
    if (-[UIPDFPageView delegate](self->_pageView, "delegate"))
    {
      -[UIPDFPageView delegate](self->_pageView, "delegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject selectionDidEndTracking:](-[UIPDFPageView delegate](self->_pageView, "delegate"), "selectionDidEndTracking:", self->_pageView);
    }
    -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
    -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay");
    self->_resizingWidget = 0;
  }
}

- (void)suspendInstantHighlightMode
{
  UIPDFSelection *v3;
  UIPDFSelection *v4;
  UIPDFSelectionWidget *selectionWidget;
  UIPDFTextRangeWidget *v6;
  uint64_t v7;
  int64_t StartIndex;
  int64_t EndIndex;

  v3 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
  if (v3)
  {
    v4 = v3;
    self->_resizingWidget = 0;
    self->_rangeMode = 1;
    *(_WORD *)&self->_instantModeIsSuspended = 1;
    self->_isTracking = 0;
    selectionWidget = self->_selectionWidget;
    if (selectionWidget)

    v6 = objc_alloc_init(UIPDFTextRangeWidget);
    self->_selectionWidget = (UIPDFSelectionWidget *)v6;
    -[UIPDFTextRangeWidget setPageView:](v6, "setPageView:", self->_pageView);
    -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v4);
    v7 = -[UIPDFSelection CGSelection](v4, "CGSelection");
    self->_firstIndex = 0;
    self->_lastIndex = 0;
    if (v7)
    {
      StartIndex = CGPDFSelectionGetStartIndex();
      EndIndex = CGPDFSelectionGetEndIndex();
      if (StartIndex != -1 && EndIndex != -1)
      {
        self->_firstIndex = StartIndex;
        self->_lastIndex = EndIndex;
      }
    }
  }
}

- (void)startTracking:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  UIPDFPage *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  UIPDFSelection *v18;
  UIPDFSelectionWidget *selectionWidget;
  UIPDFParagraphWidget *v20;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = -[UIPDFPageView page](self->_pageView, "page");
  v10 = -[UIPDFPage CGPage](v9, "CGPage");
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", v7, v6);
  v12 = v11;
  v14 = v13;
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
  v17 = MEMORY[0x186DC6CD0](v10, 3, v12, v14, v15, v16, 1.0);
  if (v17)
  {
    v18 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", v9, v17);
    CGPDFSelectionRelease();
    -[UIPDFPage setSelection:](v9, "setSelection:", v18);
    selectionWidget = self->_selectionWidget;
    if (selectionWidget)
    {
      -[UIPDFSelectionWidget remove](selectionWidget, "remove");

    }
    v20 = objc_alloc_init(UIPDFParagraphWidget);
    self->_selectionWidget = (UIPDFSelectionWidget *)v20;
    -[UIPDFParagraphWidget setPageView:](v20, "setPageView:", self->_pageView);
    -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v18);
    -[UIPDFSelectionWidget layout](self->_selectionWidget, "layout");

    self->_rangeMode = 0;
    *(_WORD *)&self->_instantModeIsSuspended = 1;
  }
  else
  {
    -[UIPDFPage setSelection:](v9, "setSelection:", 0);
  }
  -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
  -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay");
}

- (void)tracking:(CGPoint)a3 andPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  UIPDFPage *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  UIPDFSelection *v18;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = -[UIPDFPageView page](self->_pageView, "page");
  v10 = -[UIPDFPage CGPage](v9, "CGPage");
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", v7, v6);
  v12 = v11;
  v14 = v13;
  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
  v17 = MEMORY[0x186DC6CD0](v10, 3, v12, v14, v15, v16, 1.0);
  if (v17)
  {
    v18 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", v9, v17);
    CGPDFSelectionRelease();
    -[UIPDFPage setSelection:](v9, "setSelection:", v18);
    -[UIPDFSelectionWidget setSelection:](self->_selectionWidget, "setSelection:", v18);
    -[UIPDFSelectionWidget layout](self->_selectionWidget, "layout");

    -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
    -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay");
  }
}

- (CGPoint)selectedPointOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[UIPDFSelectionWidget viewOffset](self->_selectionWidget, "viewOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)initialSelectionPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[UIPDFSelectionWidget initialSelectionPointOnPage](self->_selectionWidget, "initialSelectionPointOnPage");
  -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)currentSelectionPoint
{
  double v3;
  double v4;
  CGPoint result;

  -[UIPDFSelectionWidget currentSelectionPointOnPage](self->_selectionWidget, "currentSelectionPointOnPage");
  -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)layoutSelections
{
  UIPDFSelectionWidget *selectionWidget;

  selectionWidget = self->_selectionWidget;
  if (selectionWidget)
    -[UIPDFSelectionWidget layout](selectionWidget, "layout");
}

- (id)description
{
  uint64_t v2;

  v2 = -[UIPDFSelectionWidget description](self->_selectionWidget, "description");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Selection Controller, widget: %@"), v2);
}

- (UIPDFPageView)pageView
{
  return self->_pageView;
}

- (void)setPageView:(id)a3
{
  self->_pageView = (UIPDFPageView *)a3;
}

- (BOOL)rangeMode
{
  return self->_rangeMode;
}

- (UIPDFSelectionWidget)selectionWidget
{
  return self->_selectionWidget;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (CGPoint)adjustedPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_adjustedPoint.x;
  y = self->_adjustedPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)instantHighlightMode
{
  return self->_instantHighlightMode;
}

- (void)setInstantHighlightMode:(BOOL)a3
{
  self->_instantHighlightMode = a3;
}

@end
