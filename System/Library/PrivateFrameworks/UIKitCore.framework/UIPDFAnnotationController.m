@implementation UIPDFAnnotationController

+ (BOOL)pageHasAnnotations:(id)a3
{
  CGPDFDictionary *Dictionary;
  CGPDFArrayRef value;

  if (a3)
  {
    Dictionary = CGPDFPageGetDictionary((CGPDFPageRef)objc_msgSend(a3, "CGPage"));
    if (Dictionary)
    {
      value = 0;
      LOBYTE(Dictionary) = CGPDFDictionaryGetArray(Dictionary, "Annots", &value);
    }
  }
  else
  {
    LOBYTE(Dictionary) = 0;
  }
  return (char)Dictionary;
}

+ (id)newAnnotation:(CGPDFDictionary *)a3 type:(const char *)a4
{
  __objc2_class **v7;

  if (!strcmp("Underline", a4))
  {
    v7 = off_1E167B188;
  }
  else if (!strcmp("Text", a4))
  {
    v7 = off_1E167B180;
  }
  else if (!strcmp("FreeText", a4))
  {
    v7 = off_1E167B118;
  }
  else if (!strcmp("Highlight", a4))
  {
    v7 = off_1E167B120;
  }
  else if (!strcmp("StrikeOut", a4))
  {
    v7 = off_1E167B178;
  }
  else if (!strcmp("Circle", a4))
  {
    v7 = off_1E167B108;
  }
  else if (!strcmp("Square", a4))
  {
    v7 = off_1E167B168;
  }
  else if (!strcmp("Line", a4))
  {
    v7 = off_1E167B128;
  }
  else if (!strcmp("Popup", a4))
  {
    v7 = off_1E167B158;
  }
  else if (!strcmp("Link", a4))
  {
    v7 = off_1E167B130;
  }
  else
  {
    if (strcmp("Stamp", a4))
      return 0;
    v7 = off_1E167B170;
  }
  return (id)objc_msgSend(objc_alloc(*v7), "initWithAnnotationDictionary:", a3);
}

- (UIPDFAnnotationController)init
{
  UIPDFAnnotationController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFAnnotationController;
  result = -[UIPDFAnnotationController init](&v3, sel_init);
  if (result)
  {
    result->_tracking = 0;
    result->_cachedMarginNoteSize = (CGSize)*MEMORY[0x1E0C9D820];
  }
  return result;
}

- (UIPDFAnnotationController)initWithPageView:(id)a3
{
  UIPDFAnnotationController *v4;
  UIPDFAnnotationController *v5;

  v4 = -[UIPDFAnnotationController init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pageView = (UIPDFPageView *)a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    -[UIPDFAnnotationController setMakeUnderlineAnnotation:](v4, "setMakeUnderlineAnnotation:", 0);
    -[UIPDFAnnotationController setDrawingSurface:](v5, "setDrawingSurface:", objc_msgSend(a3, "layer"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPDFAnnotationController;
  -[UIPDFAnnotationController dealloc](&v3, sel_dealloc);
}

- (void)addAnnotation:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)willHandleTouchGestureAtPoint:(CGPoint)a3
{
  UIView *v3;

  v3 = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)-[UIView annotation](v3, "annotation"), "recognizeGestures");
  else
    return 0;
}

- (void)addLinkAnnotationViews
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[UIPDFPage annotations](-[UIPDFPageView page](self->_pageView, "page"), "annotations");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hidden") & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
            if (!objc_msgSend(v8, "annotationView"))
              -[UIPDFAnnotationController _addLinkAnnotationViewFor:](self, "_addLinkAnnotationViewFor:", v8);
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (CGPoint)convertPoint:(CGPoint)a3 toSurfaceLayer:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  CALayer *v10;
  double v11;
  double v12;
  CGPoint result;

  -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  v10 = -[UIView layer](-[UIView superview](self->_pageView, "superview"), "layer");
  -[CALayer convertPoint:fromLayer:](v10, "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), v7, v9);
  objc_msgSend(a4, "convertPoint:fromLayer:", v10);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toSurfaceLayer:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CALayer *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[UIView layer](-[UIView superview](self->_pageView, "superview"), "layer");
  -[CALayer convertRect:fromLayer:](v14, "convertRect:fromLayer:", -[UIView layer](self->_pageView, "layer"), v7, v9, v11, v13);
  objc_msgSend(a4, "convertRect:fromLayer:", v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)addDrawingSurface:(id)a3 view:(id)a4
{
  SurfaceLayer *v6;

  v6 = objc_alloc_init(SurfaceLayer);
  -[SurfaceLayer setDelegate:](v6, "setDelegate:", a3);
  -[CALayer addSublayer:](self->_drawingSurface, "addSublayer:", v6);
  objc_msgSend(a3, "setDrawingLayer:", v6);
  -[UIPDFAnnotationController setSurfacePosition:](self, "setSurfacePosition:", a3);
  -[SurfaceLayer setNeedsDisplay](v6, "setNeedsDisplay");

}

- (void)setSurfacePosition:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double MidX;
  double MidY;
  CGAffineTransform v25[2];
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v5 = (void *)objc_msgSend(a3, "selection");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "bounds");
    x = v7;
    y = v9;
    width = v11;
    height = v13;
    memset(&v25[1], 0, sizeof(CGAffineTransform));
    objc_msgSend(v6, "transform");
    v25[0] = v25[1];
    if (!CGAffineTransformIsIdentity(v25))
    {
      v25[0] = v25[1];
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      v27 = CGRectApplyAffineTransform(v26, v25);
      x = v27.origin.x;
      y = v27.origin.y;
      width = v27.size.width;
      height = v27.size.height;
    }
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, width, height);
    -[UIView convertRect:fromView:](-[UIView superview](self->_pageView, "superview"), "convertRect:fromView:", self->_pageView, v15, v16, v17, v18);
    v19 = v28.origin.x;
    v20 = v28.origin.y;
    v21 = v28.size.width;
    v22 = v28.size.height;
    MidX = CGRectGetMidX(v28);
    v29.origin.x = v19;
    v29.origin.y = v20;
    v29.size.width = v21;
    v29.size.height = v22;
    MidY = CGRectGetMidY(v29);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    objc_msgSend((id)objc_msgSend(a3, "drawingLayer"), "setBounds:", 0.0, 0.0, v21, v22);
    objc_msgSend((id)objc_msgSend(a3, "drawingLayer"), "setPosition:", MidX, MidY);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);
    objc_msgSend((id)objc_msgSend(a3, "drawingLayer"), "setNeedsDisplay");
  }
}

- (void)_addRecognizers:(id)a3
{
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UILongPressGestureRecognizer *v7;

  v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_doubleTapRecognized_);
  -[UIGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 2);
  objc_msgSend(a3, "addGestureRecognizer:", v5);
  v6 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_annotationTapRecognized_);
  -[UIGestureRecognizer setDelegate:](v6, "setDelegate:", self);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v6, "setNumberOfTapsRequired:", 1);
  objc_msgSend(a3, "addGestureRecognizer:", v6);
  -[UIGestureRecognizer requireGestureRecognizerToFail:](v6, "requireGestureRecognizerToFail:", v5);

  objc_msgSend(a3, "annotation");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_linkPressRecognized_);
    -[UIGestureRecognizer setDelegate:](v7, "setDelegate:", self);
    objc_msgSend(a3, "addGestureRecognizer:", v7);

  }
}

- (void)_addLinkAnnotationViewFor:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIPDFAnnotationView *v9;

  objc_msgSend(a3, "Rect");
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
  v9 = -[UIView initWithFrame:]([UIPDFAnnotationView alloc], "initWithFrame:", v5, v6, v7, v8);
  -[UIView setBackgroundColor:](v9, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[UIView addSubview:](self->_pageView, "addSubview:", v9);
  objc_msgSend(a3, "setAnnotationView:", v9);
  -[UIPDFAnnotationView setAnnotation:](v9, "setAnnotation:", a3);
  -[UIPDFAnnotationController _addRecognizers:](self, "_addRecognizers:", v9);

}

- (void)_addAnnotationViewFor:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGAffineTransform v20[2];
  CGRect v21;
  CGRect v22;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v5 = (void *)objc_msgSend(a3, "selection")) == 0)
  {
    objc_msgSend(a3, "Rect");
    goto LABEL_7;
  }
  v6 = v5;
  objc_msgSend(v5, "bounds");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  memset(&v20[1], 0, sizeof(CGAffineTransform));
  objc_msgSend(v6, "transform");
  v20[0] = v20[1];
  if (!CGAffineTransformIsIdentity(v20))
  {
    v20[0] = v20[1];
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectApplyAffineTransform(v21, v20);
LABEL_7:
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, width, height);
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "viewClass")), "initWithFrame:", v15, v16, v17, v18);
  objc_msgSend(v19, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  -[UIView addSubview:](self->_pageView, "addSubview:", v19);
  objc_msgSend(a3, "setAnnotationView:", v19);
  objc_msgSend(v19, "setAnnotation:", a3);
  -[UIPDFAnnotationController _addRecognizers:](self, "_addRecognizers:", v19);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[UIPDFAnnotationController addDrawingSurface:view:](self, "addDrawingSurface:view:", a3, v19);
  }

}

- (void)layoutAnnotationViews:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  double v11;
  UIPDFPlacementController *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[UIPDFPage annotations](-[UIPDFPageView page](self->_pageView, "page", a3), "annotations");
  if (objc_msgSend(v4, "count"))
  {
    os_unfair_lock_lock(&self->_lock);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "hidden") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (-[UIPDFPageView allowHighlighting](self->_pageView, "allowHighlighting")
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || -[UIPDFPageView showTextAnnotations](self->_pageView, "showTextAnnotations"))
                {
                  objc_msgSend(v9, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
                  if ((-[UIPDFPageView allowHighlighting](self->_pageView, "allowHighlighting")
                     || -[UIPDFPageView showAnnotations](self->_pageView, "showAnnotations"))
                    && objc_msgSend(v9, "recognizeGestures")
                    && !objc_msgSend(v9, "annotationView"))
                  {
                    -[UIPDFAnnotationController _addAnnotationViewFor:](self, "_addAnnotationViewFor:", v9);
                  }
                }
              }
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }
    if (-[UIPDFPageView allowHighlighting](self->_pageView, "allowHighlighting"))
    {
      -[UIPDFAnnotationController marginNoteImageSize](self, "marginNoteImageSize");
      v12 = -[UIPDFPlacementController initWithAnnotations:viewSize:]([UIPDFPlacementController alloc], "initWithAnnotations:viewSize:", v4, v10 + 4.0, v11 + 4.0);
      -[UIPDFPlacementController setPageView:](v12, "setPageView:", self->_pageView);
      -[UIPDFPlacementController layoutViews:](v12, "layoutViews:", -4.0);

    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)setView:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_pageView = (UIPDFPageView *)a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setNeedsDisplay
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = -[UIPDFPage annotations](-[UIPDFPageView page](self->_pageView, "page", 0), "annotations");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "annotationType") == 9)
          v8 = (void *)objc_msgSend(v7, "annotationView");
        else
          v8 = (void *)objc_msgSend(v7, "drawingLayer");
        objc_msgSend(v8, "setNeedsDisplay");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
}

- (void)drawAnnotations:(CGContext *)a3
{
  os_unfair_lock_s *p_lock;
  UIPDFPageView *pageView;
  UIPDFPageView *v7;
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  os_unfair_lock_s *lock;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pageView = self->_pageView;
  if (pageView)
  {
    v7 = pageView;
    lock = p_lock;
    v8 = !-[UIPDFPageView showAnnotations](self->_pageView, "showAnnotations")
      && -[UIPDFPageView allowHighlighting](self->_pageView, "allowHighlighting");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = -[UIPDFPage annotations](-[UIPDFPageView page](self->_pageView, "page"), "annotations");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || -[UIPDFPageView showTextAnnotations](self->_pageView, "showTextAnnotations"))
          {
            if (v8)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v14, "parent");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_18;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_18:
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    continue;
                }
              }
            }
            objc_msgSend(v14, "drawInContext:", a3);
            continue;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    os_unfair_lock_unlock(lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "view");
  objc_msgSend(v4, "annotation");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v4, "annotation");
    objc_msgSend(a3, "locationInView:", v4);
    return objc_msgSend(v5, "shouldRecognizeTapOrPress:");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "annotation");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 1;
  }
  return objc_msgSend((id)objc_msgSend(v4, "annotation"), "hasPopUp");
}

- (void)doubleTapRecognized:(id)a3
{
  UIPDFPageView *pageView;

  objc_msgSend((id)objc_msgSend(a3, "view"), "annotation");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "state") == 3)
  {
    pageView = self->_pageView;
    objc_msgSend(a3, "locationInView:", pageView);
    -[UIPDFPageView doubleTapAt:](pageView, "doubleTapAt:");
  }
}

- (void)resetBeingPressedForRecognizer:(id)a3 withDelegate:(id)a4 withAnnotation:(id)a5
{
  -[UIPDFPageView clearSelection](self->_pageView, "clearSelection");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "locationInView:", self->_pageView);
    objc_msgSend(a4, "annotation:isBeingPressedAtPoint:controller:", a5, self);
  }
}

- (void)linkPressRecognized:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "view"), "annotation");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[UIPDFAnnotationController delegate](self, "delegate");
    if (v6)
    {
      v7 = v6;
      if (objc_msgSend(a3, "state") == 1)
        -[UIPDFAnnotationController resetBeingPressedForRecognizer:withDelegate:withAnnotation:](self, "resetBeingPressedForRecognizer:withDelegate:withAnnotation:", a3, v7, v5);
    }
  }
}

- (void)annotationTapRecognized:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  if (self->_pageView)
  {
    v5 = objc_msgSend(a3, "view");
    if (v5)
    {
      v6 = (void *)v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "annotation");
        if (objc_msgSend(a3, "state") == 3)
        {
          -[UIPDFPageView clearSelection](self->_pageView, "clearSelection");
          v8 = -[UIPDFAnnotationController delegate](self, "delegate");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(a3, "locationInView:", self->_pageView);
            -[NSObject annotation:wasTouchedAtPoint:controller:](v8, "annotation:wasTouchedAtPoint:controller:", v7, self);
          }
        }
      }
    }
  }
}

- (BOOL)intersects:(CGPDFSelection *)a3 with:(CGPDFSelection *)a4
{
  uint64_t NumberOfTextRanges;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t TextRange;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
  v5 = CGPDFSelectionGetNumberOfTextRanges();
  if (NumberOfTextRanges < 1)
  {
    return 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    v8 = 1;
    while (1)
    {
      TextRange = CGPDFSelectionGetTextRange();
      if (v6 >= 1)
        break;
LABEL_8:
      v8 = ++v7 < NumberOfTextRanges;
      if (v7 == NumberOfTextRanges)
        return v8;
    }
    v11 = TextRange;
    v12 = 0;
    v13 = TextRange + v10;
    while (1)
    {
      v14 = CGPDFSelectionGetTextRange();
      if (v13 > v14 && v14 + v15 > v11)
        break;
      if (v6 == ++v12)
        goto LABEL_8;
    }
  }
  return v8;
}

- (BOOL)isSelection:(CGPDFSelection *)a3 equalTo:(CGPDFSelection *)a4
{
  uint64_t NumberOfTextRanges;
  uint64_t v5;
  uint64_t v6;
  uint64_t TextRange;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v12;

  if (a3 == a4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    NumberOfTextRanges = CGPDFSelectionGetNumberOfTextRanges();
    if (NumberOfTextRanges == CGPDFSelectionGetNumberOfTextRanges())
    {
      v5 = NumberOfTextRanges - 1;
      if (NumberOfTextRanges < 1)
      {
        LOBYTE(v12) = 1;
      }
      else
      {
        v6 = 0;
        do
        {
          TextRange = CGPDFSelectionGetTextRange();
          v9 = v8;
          v12 = TextRange == CGPDFSelectionGetTextRange() && v9 == v10;
        }
        while (v12 && v5 != v6++);
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (void)mergeSelectionOfAnnotation:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  UIPDFSelection *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UIPDFPopupAnnotation *v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v42 = (void *)objc_msgSend(a3, "selection");
  v4 = objc_msgSend(v42, "CGSelection");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = -[UIPDFPage annotations](-[UIPDFPageView page](self->_pageView, "page"), "annotations");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v12 = (void *)objc_msgSend(v11, "selection");
          if (v12)
          {
            v13 = objc_msgSend(v12, "CGSelection");
            if (v13)
            {
              v14 = v13;
              if (!-[UIPDFAnnotationController isSelection:equalTo:](self, "isSelection:equalTo:", v4, v13))
              {
                if (-[UIPDFAnnotationController intersects:with:](self, "intersects:with:", v4, v14))
                  objc_msgSend(v5, "addObject:", v11);
              }
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v8);
  }
  v15 = objc_msgSend(v5, "count");
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v42, "extent");
    v18 = 0;
    v20 = v19 + v17 - 1;
    do
    {
      v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v18), "selection"), "extent");
      if (v21 < v17)
        v17 = v21;
      if (v22 + v21 - 1 > v20)
        v20 = v22 + v21 - 1;
      ++v18;
    }
    while (v16 != v18);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v24 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(v5);
          v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          if (objc_msgSend(v28, "popup"))
          {
            v29 = objc_msgSend(v28, "contents");
            if (v29)
            {
              v30 = v29;
              if (objc_msgSend(v23, "length"))
                objc_msgSend(v23, "appendString:", CFSTR("\n"));
              objc_msgSend(v23, "appendString:", v30);
            }
          }
          v31 = -[UIPDFAnnotationController delegate](self, "delegate");
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[NSObject annotationWasRemoved:controller:](v31, "annotationWasRemoved:controller:", v28, self);
          v32 = (void *)objc_msgSend(v28, "popup");
          if (v32)
          {
            v33 = v32;
            objc_msgSend(v32, "setParent:", 0);
            -[UIPDFPage removeAnnotation:](-[UIPDFPageView page](self->_pageView, "page"), "removeAnnotation:", v33);
          }
          -[UIPDFPage removeAnnotation:](-[UIPDFPageView page](self->_pageView, "page"), "removeAnnotation:", v28);
        }
        v25 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v25);
    }

    -[UIPDFPage CGPage](-[UIPDFPageView page](self->_pageView, "page"), "CGPage");
    v34 = CGPDFSelectionCreateForRange();
    if (v34)
    {
      v35 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", -[UIPDFPageView page](self->_pageView, "page"), v34);
      objc_msgSend(a3, "setSelection:", v35);

      if (objc_msgSend(a3, "annotationView"))
      {
        CGPDFSelectionGetBounds();
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
        objc_msgSend((id)objc_msgSend(a3, "annotationView"), "setFrame:", v36, v37, v38, v39);
        -[UIPDFAnnotationController setSurfacePosition:](self, "setSurfacePosition:", a3);
      }
      else
      {
        -[UIPDFAnnotationController _addAnnotationViewFor:](self, "_addAnnotationViewFor:", a3);
      }
      if (objc_msgSend(v23, "length"))
      {
        v40 = objc_alloc_init(UIPDFPopupAnnotation);
        objc_msgSend(a3, "setPopup:", v40);
        objc_msgSend(a3, "setContents:", v23);
        -[UIPDFPopupAnnotation setParent:](v40, "setParent:", a3);
        -[UIPDFPage addAnnotation:](-[UIPDFPageView page](self->_pageView, "page"), "addAnnotation:", v40);

      }
      CGPDFSelectionRelease();
    }
  }
  else
  {
    v23 = v5;
  }

}

- (BOOL)madeInstantAnnotation
{
  return self->_currentAnnotation != 0;
}

- (BOOL)trackMoved:(CGPoint)a3
{
  BOOL v3;

  v3 = vabdd_f64(self->_startPoint.x, a3.x) > 12.0;
  return vabdd_f64(self->_startPoint.y, a3.y) > 12.0 || v3;
}

- (void)_initialRange:(CGPoint)a3
{
  uint64_t v4;
  int64_t FirstIndex;
  uint64_t LastIndex;

  -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", a3.x, a3.y);
  -[UIPDFPage CGPage](-[UIPDFPageView page](self->_pageView, "page"), "CGPage");
  v4 = CGPDFSelectionCreateAtPointWithOptions();
  self->_initialRange.location = 0;
  self->_initialRange.length = 0;
  if (v4)
  {
    FirstIndex = CGPDFSelectionGetFirstIndex();
    LastIndex = CGPDFSelectionGetLastIndex();
    self->_initialRange.location = FirstIndex;
    self->_initialRange.length = LastIndex - FirstIndex + 1;
    CGPDFSelectionRelease();
  }
}

- (BOOL)willTrackAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;

  y = a3.y;
  x = a3.x;
  if (-[UIPDFAnnotationController delegate](self, "delegate")
    && (v6 = -[UIPDFAnnotationController delegate](self, "delegate"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return -[NSObject willTrackAnnotationAtPoint:controller:](v6, "willTrackAnnotationAtPoint:controller:", self, x, y);
  }
  else
  {
    return 0;
  }
}

- (void)startTracking:(CGPoint)a3
{
  double y;
  double x;
  UIPDFMarkupAnnotation *currentAnnotation;

  y = a3.y;
  x = a3.x;
  currentAnnotation = self->_currentAnnotation;
  if (currentAnnotation)
  {

    self->_currentAnnotation = 0;
  }
  self->_tracking = 1;
  self->_moving = 0;
  self->_startPoint.x = x;
  self->_startPoint.y = y;
  -[UIPDFAnnotationController _initialRange:](self, "_initialRange:", x, y);
}

- (void)tracking:(CGPoint)a3
{
  double y;
  double x;
  int64_t length;
  _BOOL4 v7;
  __objc2_class **v8;
  uint64_t BetweenRangeAndPoint;
  UIPDFSelection *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  y = a3.y;
  x = a3.x;
  if (!self->_moving)
  {
    if (!-[UIPDFAnnotationController trackMoved:](self, "trackMoved:", a3.x, a3.y))
      return;
    self->_moving = 1;
  }
  length = self->_initialRange.length;
  if (!length)
  {
    -[UIPDFAnnotationController _initialRange:](self, "_initialRange:", x, y);
    length = self->_initialRange.length;
  }
  if (length >= 1)
  {
    if (!self->_currentAnnotation)
    {
      v7 = -[UIPDFAnnotationController makeUnderlineAnnotation](self, "makeUnderlineAnnotation");
      v8 = off_1E167B188;
      if (!v7)
        v8 = off_1E167B120;
      self->_currentAnnotation = (UIPDFMarkupAnnotation *)objc_alloc_init(*v8);
      -[UIPDFAnnotation setAnnotationController:](self->_currentAnnotation, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
      -[UIPDFAnnotation setColor:](self->_currentAnnotation, "setColor:", -[UIColor CGColor](-[UIPDFAnnotationController currentColor](self, "currentColor"), "CGColor"));
    }
    -[UIPDFPage CGPage](-[UIPDFPageView page](self->_pageView, "page"), "CGPage");
    -[UIPDFPageView convertPointToPDFPageSpace:](self->_pageView, "convertPointToPDFPageSpace:", x, y);
    BetweenRangeAndPoint = CGPDFSelectionCreateBetweenRangeAndPoint();
    if (BetweenRangeAndPoint)
    {
      v10 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", -[UIPDFPageView page](self->_pageView, "page"), BetweenRangeAndPoint);
      -[UIPDFAnnotation setSelection:](self->_currentAnnotation, "setSelection:", v10);

      if (-[UIPDFAnnotation annotationView](self->_currentAnnotation, "annotationView"))
      {
        CGPDFSelectionGetBounds();
        -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
        -[UIView setFrame:](-[UIPDFAnnotation annotationView](self->_currentAnnotation, "annotationView"), "setFrame:", v11, v12, v13, v14);
        -[UIPDFAnnotationController setSurfacePosition:](self, "setSurfacePosition:", self->_currentAnnotation);
      }
      else
      {
        -[UIPDFAnnotationController _addAnnotationViewFor:](self, "_addAnnotationViewFor:", self->_currentAnnotation);
      }
      CGPDFSelectionRelease();
      -[UIView setNeedsDisplay](-[UIPDFAnnotation annotationView](self->_currentAnnotation, "annotationView"), "setNeedsDisplay");
    }
  }
}

- (void)endTrackingAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSObject *v6;
  NSObject *v7;

  y = a3.y;
  x = a3.x;
  if (!-[UIPDFAnnotation selection](self->_currentAnnotation, "selection")
    || (-[UIPDFAnnotationController mergeSelectionOfAnnotation:](self, "mergeSelectionOfAnnotation:", self->_currentAnnotation), !-[UIPDFAnnotation selection](self->_currentAnnotation, "selection")))
  {
    -[UIPDFAnnotationController layoutAnnotationViews:](self, "layoutAnnotationViews:", self->_pageView);
  }
  self->_tracking = 0;
  v6 = -[UIPDFAnnotationController delegate](self, "delegate");
  if (v6)
  {
    v7 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject annotation:didEndTrackingAtPoint:controller:](v7, "annotation:didEndTrackingAtPoint:controller:", self->_currentAnnotation, self, x, y);
  }

  self->_currentAnnotation = 0;
  -[UIPDFPageView setNeedsDisplay](self->_pageView, "setNeedsDisplay");
}

- (id)_linkAnnotationViewAt:(CGPoint)a3
{
  id result;
  id v4;

  result = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (result)
  {
    v4 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "annotation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v4;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isLinkAnnotationAt:(CGPoint)a3
{
  return -[UIPDFAnnotationController _linkAnnotationViewAt:](self, "_linkAnnotationViewAt:", a3.x, a3.y) != 0;
}

- (BOOL)linkAnnotationShouldBegin:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "locationInView:", self->_pageView);
  v5 = v4;
  v7 = v6;
  v8 = -[UIPDFAnnotationController _linkAnnotationViewAt:](self, "_linkAnnotationViewAt:");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(v8, "annotation");
    objc_msgSend(v9, "convertPoint:fromView:", self->_pageView, v5, v7);
    LOBYTE(v8) = objc_msgSend(v10, "shouldRecognizeTapOrPress:");
  }
  return (char)v8;
}

- (id)annotationAt:(CGPoint)a3
{
  UIView *v3;
  UIView *v4;

  v3 = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (v3 && (v4 = v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return (id)-[UIView annotation](v4, "annotation");
  else
    return 0;
}

- (id)linkAnnotationAt:(CGPoint)a3
{
  id result;
  id v4;
  void *v5;

  result = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0, a3.x, a3.y);
  if (result)
  {
    v4 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(v4, "annotation");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v5;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)annotationBriefPressRecognized:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  objc_msgSend(a3, "locationInView:", self->_pageView);
  v5 = -[UIPDFAnnotationController linkAnnotationAt:](self, "linkAnnotationAt:");
  if (v5)
  {
    v6 = v5;
    v7 = -[UIPDFAnnotationController delegate](self, "delegate");
    v8 = objc_msgSend(a3, "state");
    if ((unint64_t)(v8 - 3) >= 3)
    {
      if (v8 == 1)
        -[UIPDFAnnotationController resetBeingPressedForRecognizer:withDelegate:withAnnotation:](self, "resetBeingPressedForRecognizer:withDelegate:withAnnotation:", a3, v7, v6);
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (BOOL)annotationSingleTapRecognized:(id)a3
{
  UIView *v5;
  UIView *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;

  objc_msgSend(a3, "locationInView:", self->_pageView);
  v5 = -[UIView hitTest:withEvent:](self->_pageView, "hitTest:withEvent:", 0);
  if (v5)
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v7 = -[UIView annotation](v6, "annotation"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (v8 = -[UIPDFAnnotationController delegate](self, "delegate"),
          v9 = objc_msgSend(a3, "state"),
          (unint64_t)(v9 - 4) < 2))
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    if (v9 == 3)
    {
      -[UIPDFPageView clearSelection](self->_pageView, "clearSelection");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(a3, "locationInView:", self->_pageView);
        -[NSObject annotation:wasTouchedAtPoint:controller:](v8, "annotation:wasTouchedAtPoint:controller:", v7, self);
      }
      goto LABEL_8;
    }
    LOBYTE(v5) = 1;
  }
  return (char)v5;
}

- (BOOL)willDoSomethingWithTap:(CGPoint)a3
{
  id v3;

  v3 = -[UIPDFAnnotationController annotationAt:](self, "annotationAt:", a3.x, a3.y);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v3, "recognizeGestures");
  return (char)v3;
}

- (id)annotatePageSelection
{
  UIPDFSelection *v3;
  UIPDFSelection *v4;
  _BOOL4 v5;
  __objc2_class **v6;
  id v7;

  v3 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
  v4 = v3;
  -[UIPDFPageView clearSelection](self->_pageView, "clearSelection");
  v5 = -[UIPDFAnnotationController makeUnderlineAnnotation](self, "makeUnderlineAnnotation");
  v6 = off_1E167B188;
  if (!v5)
    v6 = off_1E167B120;
  v7 = objc_alloc_init(*v6);
  objc_msgSend(v7, "setEditable:", 1);
  objc_msgSend(v7, "setSelection:", v3);

  objc_msgSend(v7, "setAnnotationController:", -[UIPDFPageView annotationController](self->_pageView, "annotationController"));
  -[UIPDFAnnotationController mergeSelectionOfAnnotation:](self, "mergeSelectionOfAnnotation:", v7);
  -[UIPDFAnnotationController addAnnotation:](self, "addAnnotation:", v7);
  return v7;
}

- (void)copyAttributesOf:(id)a3 to:(id)a4
{
  objc_msgSend(a4, "setContents:", objc_msgSend(a3, "contents"));
  objc_msgSend(a4, "setSelection:", objc_msgSend(a3, "selection"));
}

+ (CGImage)newMaskImage:(CGPDFPage *)a3 size:(CGSize)a4
{
  double height;
  double width;
  float v7;
  float v8;
  CGFloat v9;
  CGFloat v10;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  CGImage *Image;
  CGRect BoxRect;

  height = a4.height;
  width = a4.width;
  BoxRect = CGPDFPageGetBoxRect(a3, kCGPDFCropBox);
  v7 = width;
  v8 = height;
  v9 = truncf(v7) / BoxRect.size.width;
  v10 = truncf(v8) / BoxRect.size.height;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v12 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, 8uLL, 0, DeviceRGB, 0x4001u);
  CGContextScaleCTM(v12, v9, v10);
  CGContextDrawPDFPage(v12, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGContextRelease(v12);
  CGColorSpaceRelease(DeviceRGB);
  return Image;
}

- (CGImage)newHighlightMaskImageFor:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  if (self->_delegate
    && (height = a3.size.height,
        width = a3.size.width,
        y = a3.origin.y,
        x = a3.origin.x,
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (CGImage *)-[NSObject newHighlightMaskImage:controller:](self->_delegate, "newHighlightMaskImage:controller:", self, x, y, width, height);
  }
  else
  {
    return 0;
  }
}

- (CGImage)underlineImageFor:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  if (self->_delegate
    && (height = a3.size.height,
        width = a3.size.width,
        y = a3.origin.y,
        x = a3.origin.x,
        (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (CGImage *)-[NSObject underlineImage:controller:](self->_delegate, "underlineImage:controller:", self, x, y, width, height);
  }
  else
  {
    return 0;
  }
}

- (CGSize)marginNoteImageSize
{
  double width;
  CGFloat v4;
  double height;
  CGSize result;

  width = self->_cachedMarginNoteSize.width;
  if (width == 0.0)
  {
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject marginNoteImageSize:](self->_delegate, "marginNoteImageSize:", self);
        self->_cachedMarginNoteSize.width = width;
        self->_cachedMarginNoteSize.height = v4;
      }
      else
      {
        width = self->_cachedMarginNoteSize.width;
      }
    }
    if (width == 0.0)
    {
      __asm { FMOV            V0.2D, #22.0 }
      self->_cachedMarginNoteSize = _Q0;
      width = 22.0;
    }
  }
  height = self->_cachedMarginNoteSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)marginNoteImage:(id)a3
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[NSObject marginNoteImage:controller:](self->_delegate, "marginNoteImage:controller:", a3, self);
  else
    return 0;
}

- (UIPDFAnnotation)currentAnnotation
{
  return &self->_currentAnnotation->super;
}

- (void)setCurrentAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)makeUnderlineAnnotation
{
  return self->makeUnderlineAnnotation;
}

- (void)setMakeUnderlineAnnotation:(BOOL)a3
{
  self->makeUnderlineAnnotation = a3;
}

- (CALayer)drawingSurface
{
  return self->_drawingSurface;
}

- (void)setDrawingSurface:(id)a3
{
  self->_drawingSurface = (CALayer *)a3;
}

- (NSObject)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (UIPDFPageView)pageView
{
  return self->_pageView;
}

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (void)setAllowEditing:(BOOL)a3
{
  self->_allowEditing = a3;
}

- (UIColor)currentColor
{
  return self->_currentColor;
}

- (void)setCurrentColor:(id)a3
{
  self->_currentColor = (UIColor *)a3;
}

@end
