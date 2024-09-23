@implementation UIWebPDFView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _UIApplicationLoadWebKit();
}

- (void)setIgnoreContentOffsetChanges:(int64_t)a3
{
  int64_t ignoreContentOffsetChanges;
  int64_t v4;
  int64_t v5;
  int64_t v6;

  ignoreContentOffsetChanges = self->_ignoreContentOffsetChanges;
  if (ignoreContentOffsetChanges <= 1)
    v4 = 1;
  else
    v4 = self->_ignoreContentOffsetChanges;
  v5 = v4 - 1;
  if (a3)
    v6 = ignoreContentOffsetChanges + 1;
  else
    v6 = v5;
  self->_ignoreContentOffsetChanges = v6;
}

- (void)setPdfDelegate:(id)a3
{
  if (self->_pdfDelegate != a3)
  {
    self->_pdfDelegate = (UIWebPDFViewDelegate *)a3;
    self->_delegateRespondsToDidScroll = objc_opt_respondsToSelector() & 1;
  }
}

- (unint64_t)totalPages
{
  return -[UIPDFDocument numberOfPages](self->_document, "numberOfPages");
}

- (BOOL)_hasPageRects
{
  return -[NSArray count](self->pageRects, "count") != 0;
}

- (CGPDFDocument)cgPDFDocument
{
  return self->_cgPDFDocument;
}

- (id)uiPDFDocument
{
  return self->_document;
}

- (NSData)documentData
{
  CGDataProvider *DataProvider;

  if (self->_cgPDFDocument && (DataProvider = (CGDataProvider *)CGPDFDocumentGetDataProvider()) != 0)
    return (NSData *)CGDataProviderCopyData(DataProvider);
  else
    return 0;
}

+ (void)setAsPDFDocRepAndView
{
  objc_msgSend(MEMORY[0x1E0DD9778], "setAsPDFDocRepAndView");
}

- (UIWebPDFView)initWithWebPDFViewPlaceholder:(id)a3
{
  UIWebPDFView *v4;
  UIWebPDFView *v5;
  UITapGestureRecognizer *v6;
  void *v7;
  _OWORD *v13;
  __int128 v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIWebPDFView;
  v4 = -[UIView init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_initialZoomScale = 1.0;
    v4->_pageViews = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIWebPDFView setBackgroundColorForUnRenderedContent:](v5, "setBackgroundColorForUnRenderedContent:", +[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    -[UIWebPDFView setPdfPlaceHolderView:](v5, "setPdfPlaceHolderView:", a3);
    -[WebPDFViewPlaceholder setDelegate:](-[UIWebPDFView pdfPlaceHolderView](v5, "pdfPlaceHolderView"), "setDelegate:", v5);
    if (-[WebPDFViewPlaceholder didCompleteLayout](v5->pdfPlaceHolderView, "didCompleteLayout"))
      -[UIWebPDFView performSelector:withObject:afterDelay:](v5, "performSelector:withObject:afterDelay:", sel_didCompleteLayout, v5->pdfPlaceHolderView, 0.0);
    v6 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v5, sel__tapGestureRecognized_);
    v5->_tapGestureRecognizer = v6;
    -[UIGestureRecognizer setDelegate:](v6, "setDelegate:", v5);
    -[UIView addGestureRecognizer:](v5, "addGestureRecognizer:", v5->_tapGestureRecognizer);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_willRotate_, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_didRotate_, CFSTR("UIWindowDidRotateNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_willZoom_, CFSTR("UITextSelectionWillZoom"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_didZoom_, CFSTR("UITextSelectionDidZoom"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_willScroll_, CFSTR("UITextSelectionWillScroll"), 0);
    __asm { FMOV            V0.2D, #-1.0 }
    v5->_contentOffsetAtScrollStart = _Q0;
    v13 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v5->_documentTransform.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v14 = v13[1];
    *(_OWORD *)&v5->_documentTransform.a = *v13;
    *(_OWORD *)&v5->_documentTransform.c = v14;
    v5->_documentScale = 1.0;
  }
  return v5;
}

- (void)_removeBackgroundImageObserverIfNeeded:(id)a3
{
  if (objc_msgSend(a3, "observationInfo"))
    objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("backgroundImage"));
}

- (void)dealloc
{
  void *v3;
  NSMutableArray *pageViews;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16[0] = CFSTR("UIWindowWillRotateNotification");
  v16[1] = CFSTR("UIWindowDidRotateNotification");
  v16[2] = CFSTR("UITextSelectionWillZoom");
  v16[3] = CFSTR("UITextSelectionDidZoom");
  v16[4] = CFSTR("UITextSelectionWillScroll");
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5));
  -[UIWebPDFView setPageRects:](self, "setPageRects:", 0);
  -[UIWebPDFView setPageMinYs:](self, "setPageMinYs:", 0);

  -[WebPDFViewPlaceholder setDelegate:](-[UIWebPDFView pdfPlaceHolderView](self, "pdfPlaceHolderView"), "setDelegate:", 0);
  -[UIWebPDFView setPdfPlaceHolderView:](self, "setPdfPlaceHolderView:", 0);
  -[UIWebPDFView setDocumentURL:](self, "setDocumentURL:", 0);
  -[UIWebPDFView setDocumentPassword:](self, "setDocumentPassword:", 0);
  CGPDFDocumentRelease(self->_cgPDFDocument);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  pageViews = self->_pageViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(pageViews);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setDelegate:", 0);
        -[UIWebPDFView _removeBackgroundImageObserverIfNeeded:](self, "_removeBackgroundImageObserverIfNeeded:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[UIWebPDFView setBackgroundColorForUnRenderedContent:](self, "setBackgroundColorForUnRenderedContent:", 0);
  v10.receiver = self;
  v10.super_class = (Class)UIWebPDFView;
  -[UIView dealloc](&v10, sel_dealloc);
}

- (id)viewAtIndex:(int64_t)a3
{
  NSMutableArray *pageViews;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  pageViews = self->_pageViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = a3 + 1000000;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(pageViews);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v10, "tag") == v7)
      return v10;
    if (v6 == ++v9)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)viewportView
{
  UIView *v3;

  v3 = -[UIView superview](self, "superview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return self;
}

- (CGRect)_viewportBoundsInUIVIewCoordsWithView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(a3, "bounds");
  objc_msgSend(a3, "convertRect:toView:", self);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_viewportBoundsInUIViewCoords
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIWebPDFView _viewportBoundsInUIVIewCoordsWithView:](self, "_viewportBoundsInUIVIewCoordsWithView:", -[UIWebPDFView viewportView](self, "viewportView"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_viewCachingBoundsInUIViewCoords
{
  double initialZoomScale;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  initialZoomScale = self->_initialZoomScale;
  v4 = -[UIWebPDFView viewportView](self, "viewportView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "zoomScale");
    initialZoomScale = v5;
  }
  v6 = initialZoomScale / self->_initialZoomScale * 3.0;
  -[UIWebPDFView _viewportBoundsInUIVIewCoordsWithView:](self, "_viewportBoundsInUIVIewCoordsWithView:", v4);
  v11 = v9 - v10;
  v12 = v6 * v10;
  result.size.height = v12;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v7;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v11;
  _QWORD v12[6];
  objc_super v13;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("backgroundImage")) & 1) != 0)
  {
    v11 = (void *)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    if ((objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) == 0)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __63__UIWebPDFView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v12[3] = &unk_1E16C3CF0;
      v12[4] = a4;
      v12[5] = self;
      if (pthread_main_np() == 1)
        __63__UIWebPDFView_observeValueForKeyPath_ofObject_change_context___block_invoke((uint64_t)v12);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v12);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIWebPDFView;
    -[UIWebPDFView observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

uint64_t __63__UIWebPDFView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_removeBackgroundImageObserverIfNeeded:", *(_QWORD *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 608);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
      if (v7 != *(void **)(a1 + 32))
      {
        result = objc_msgSend(v7, "backgroundImage");
        if (!result)
          break;
      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    objc_msgSend(*(id *)(a1 + 40), "setReadyForSnapshot:", 1);
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("UIWebPDFViewReadyForSnapshotNotification"), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (id)_installViewAtIndex:(int64_t)a3 inFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIPDFPageView *v10;
  UIPDFPageView *v11;
  _QWORD v13[10];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = -[UIWebPDFView viewAtIndex:](self, "viewAtIndex:");
  if (!v10)
  {
    v11 = -[UIPDFPageView initWithPage:]([UIPDFPageView alloc], "initWithPage:", -[UIPDFDocument pageAtIndex:](self->_document, "pageAtIndex:", a3));
    v10 = v11;
    if (v11)
    {
      -[UIPDFPageView setShowAnnotations:](v11, "setShowAnnotations:", 1);
      -[UIPDFPageView setAllowSelection:](v10, "setAllowSelection:", 1);
      -[UIPDFPageView setUseBackingLayer:](v10, "setUseBackingLayer:", 1);
      -[UIView setTag:](v10, "setTag:", a3 + 1000000);
      -[UIPDFPageView setDelegate:](v10, "setDelegate:", self);
      -[UIPDFAnnotationController setDelegate:](-[UIPDFPageView annotationController](v10, "annotationController"), "setDelegate:", self);
      -[UIPDFPageView setBackingLayerColor:](v10, "setBackingLayerColor:", self->backgroundColorForUnRenderedContent);
      -[UIPDFPageView setShowActivityIndicator:](v10, "setShowActivityIndicator:", !self->hideActivityIndicatorForUnRenderedContent);
      -[UIView setHidden:](v10, "setHidden:", self->hidePageViewsUntilReadyToRender);
      -[UIPDFPageView setShowLinkAnnotationUnderline:](v10, "setShowLinkAnnotationUnderline:", 0);
      -[UIPDFPageView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, CFSTR("backgroundImage"), 1, 0);
      -[UIWebPDFView setReadyForSnapshot:](self, "setReadyForSnapshot:", 0);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __44__UIWebPDFView__installViewAtIndex_inFrame___block_invoke;
      v13[3] = &unk_1E16CB3A8;
      *(CGFloat *)&v13[6] = x;
      *(CGFloat *)&v13[7] = y;
      *(CGFloat *)&v13[8] = width;
      *(CGFloat *)&v13[9] = height;
      v13[4] = v10;
      v13[5] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
      AddShadowPathToView(v10);
      -[NSMutableArray addObject:](self->_pageViews, "addObject:", v10);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10, 0);

    }
  }
  return v10;
}

uint64_t __44__UIWebPDFView__installViewAtIndex_inFrame___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  CGAffineTransform v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  v1 = *(void **)(a1 + 32);
  v7 = *(CGRect *)(a1 + 48);
  v4 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 544);
  v5 = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 560);
  *(_OWORD *)&v6.a = *(_OWORD *)(*(_QWORD *)(a1 + 40) + 528);
  v3 = *(_OWORD *)&v6.a;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = v5;
  v8 = CGRectApplyAffineTransform(v7, &v6);
  v9 = CGRectIntegral(v8);
  return objc_msgSend(v1, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height, v3);
}

- (void)_addSubViewsInViewCoordsBounds:(CGRect)a3 force:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  double v14;
  __int128 v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MinY;
  double MaxY;
  unint64_t v22;
  unint64_t PreviousPageIndexGivenYOffset;
  unint64_t NextPageIndexGivenYOffset;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[UIView _scroller](self, "_scroller");
  if (v10)
  {
    v11 = v10;
    v12 = -[NSArray count](self->pageRects, "count");
    if (v12)
    {
      if (self->_pageMinYs)
      {
        v13 = v12;
        objc_msgSend(v11, "contentOffset");
        if (v14 - self->_contentOffsetAtScrollStart.y != 0.0
          || a4
          || !-[NSMutableArray count](self->_pageViews, "count"))
        {
          v15 = *(_OWORD *)&self->_documentTransform.c;
          *(_OWORD *)&v25.a = *(_OWORD *)&self->_documentTransform.a;
          *(_OWORD *)&v25.c = v15;
          *(_OWORD *)&v25.tx = *(_OWORD *)&self->_documentTransform.tx;
          CGAffineTransformInvert(&v26, &v25);
          v27.origin.x = x;
          v27.origin.y = y;
          v27.size.width = width;
          v27.size.height = height;
          v28 = CGRectApplyAffineTransform(v27, &v26);
          v16 = v28.origin.x;
          v17 = v28.origin.y;
          v18 = v28.size.width;
          v19 = v28.size.height;
          MinY = CGRectGetMinY(v28);
          v29.origin.x = v16;
          v29.origin.y = v17;
          v29.size.width = v18;
          v29.size.height = v19;
          MaxY = CGRectGetMaxY(v29);
          v22 = v13 - 1;
          PreviousPageIndexGivenYOffset = findPreviousPageIndexGivenYOffset(self->_pageMinYs, 0, v22, MinY);
          NextPageIndexGivenYOffset = findNextPageIndexGivenYOffset(self->_pageMinYs, 0, v22, MaxY);
          if (!NextPageIndexGivenYOffset)
            NextPageIndexGivenYOffset = findPreviousPageIndexGivenYOffset(self->_pageMinYs, 0, v22, MaxY);
          if (PreviousPageIndexGivenYOffset >= NextPageIndexGivenYOffset)
            PreviousPageIndexGivenYOffset = NextPageIndexGivenYOffset;
          if (NextPageIndexGivenYOffset < v22)
            v22 = NextPageIndexGivenYOffset;
          while (PreviousPageIndexGivenYOffset <= v22)
          {
            objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", PreviousPageIndexGivenYOffset), "CGRectValue");
            -[UIWebPDFView _installViewAtIndex:inFrame:](self, "_installViewAtIndex:inFrame:", PreviousPageIndexGivenYOffset++);
          }
        }
      }
    }
  }
}

- (id)_addPageAtIndex:(unint64_t)a3
{
  if (-[NSArray count](self->pageRects, "count") <= a3)
    return 0;
  objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", a3), "CGRectValue");
  return -[UIWebPDFView _installViewAtIndex:inFrame:](self, "_installViewAtIndex:inFrame:", a3);
}

- (void)_removePageViewsNotInViewCoordsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *(_OWORD *)&self->_documentTransform.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&self->_documentTransform.a;
  *(_OWORD *)&v18.c = v8;
  *(_OWORD *)&v18.tx = *(_OWORD *)&self->_documentTransform.tx;
  CGAffineTransformInvert(&v19, &v18);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v21 = CGRectApplyAffineTransform(v20, &v19);
  v9 = v21.origin.y;
  v10 = v21.size.height;
  v11 = -[NSMutableArray count](self->_pageViews, "count", v21.origin.x);
  if (v11 - 1 >= 0)
  {
    v12 = v11;
    v13 = v9 + v10;
    do
    {
      v14 = (void *)-[NSMutableArray objectAtIndex:](self->_pageViews, "objectAtIndex:", --v12);
      objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", objc_msgSend(v14, "tag") - 1000000), "CGRectValue");
      if (v9 >= v15)
        v17 = v15 + v16 > v9;
      else
        v17 = v13 > v15;
      if (!v17)
      {
        objc_msgSend((id)objc_msgSend(v14, "annotationController", v15 + v16), "setDelegate:", 0);
        objc_msgSend(v14, "setDelegate:", 0);
        -[UIWebPDFView _removeBackgroundImageObserverIfNeeded:](self, "_removeBackgroundImageObserverIfNeeded:", v14);
        objc_msgSend(v14, "removeFromSuperview");
        -[NSMutableArray removeObjectAtIndex:](self->_pageViews, "removeObjectAtIndex:", v12);
      }
    }
    while (v12 > 0);
  }
}

- (void)_removePageViewsNotInCurrentViewCoordsRect
{
  -[UIWebPDFView _viewCachingBoundsInUIViewCoords](self, "_viewCachingBoundsInUIViewCoords");
  -[UIWebPDFView _removePageViewsNotInViewCoordsRect:](self, "_removePageViewsNotInViewCoordsRect:");
}

- (void)_scheduleRemovePageViewsNotInViewCoordsRect
{
  if (!self->_hasScheduledCacheUpdate)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__removePageViewsNotInCurrentViewCoordsRect, 0);
    -[UIWebPDFView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__removePageViewsNotInCurrentViewCoordsRect, 0, 0.02);
    self->_hasScheduledCacheUpdate = 1;
  }
}

- (void)ensureCorrectPagesAreInstalled:(BOOL)a3
{
  _BOOL8 v4;

  if (!self->_rotating && self->_ignoreContentOffsetChanges <= 0 && !self->_zooming)
  {
    v4 = a3;
    -[UIWebPDFView _viewCachingBoundsInUIViewCoords](self, "_viewCachingBoundsInUIViewCoords");
    -[UIWebPDFView _addSubViewsInViewCoordsBounds:force:](self, "_addSubViewsInViewCoordsBounds:force:", v4);
    self->_hasScheduledCacheUpdate = 0;
    -[UIWebPDFView _scheduleRemovePageViewsNotInViewCoordsRect](self, "_scheduleRemovePageViewsNotInViewCoordsRect");
  }
}

- (void)willScroll:(id)a3
{
  CGPoint *p_contentOffsetAtScrollStart;
  CGFloat v4;
  CGFloat v5;

  if (!self->_rotating)
  {
    p_contentOffsetAtScrollStart = &self->_contentOffsetAtScrollStart;
    objc_msgSend(-[UIView _scroller](self, "_scroller", a3), "contentOffset");
    p_contentOffsetAtScrollStart->x = v4;
    p_contentOffsetAtScrollStart->y = v5;
  }
}

- (void)_didScroll
{
  CGFloat v3;
  CGFloat v4;

  if (self->_document)
  {
    if (self->_delegateRespondsToDidScroll)
      -[UIWebPDFViewDelegate didScroll:](self->_pdfDelegate, "didScroll:", self);
    -[UIWebPDFView ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 0);
    objc_msgSend(-[UIView _scroller](self, "_scroller"), "contentOffset");
    self->_contentOffsetAtScrollStart.x = v3;
    self->_contentOffsetAtScrollStart.y = v4;
  }
}

- (void)didReceiveMemoryWarning:(id)a3
{
  -[UIWebPDFView _viewportBoundsInUIViewCoords](self, "_viewportBoundsInUIViewCoords", a3);
  -[UIWebPDFView _removePageViewsNotInViewCoordsRect:](self, "_removePageViewsNotInViewCoordsRect:");
  -[UIWebPDFView _recreateUIPDFDocument](self, "_recreateUIPDFDocument");
}

- (void)willRotate:(id)a3
{
  CGPoint *p_contentOffsetAtScrollStart;
  CGFloat v5;
  CGFloat v6;

  self->_rotating = 1;
  p_contentOffsetAtScrollStart = &self->_contentOffsetAtScrollStart;
  objc_msgSend(-[UIView _scroller](self, "_scroller", a3), "contentOffset");
  p_contentOffsetAtScrollStart->x = v5;
  p_contentOffsetAtScrollStart->y = v6;
  if (self->_hasScheduledCacheUpdate)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__removePageViewsNotInCurrentDocCoordsRect, 0);
}

- (void)didRotate:(id)a3
{
  CGFloat v4;
  CGFloat v5;

  self->_rotating = 0;
  -[UIWebPDFView ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 1);
  objc_msgSend(-[UIView _scroller](self, "_scroller"), "contentOffset");
  self->_contentOffsetAtScrollStart.x = v4;
  self->_contentOffsetAtScrollStart.y = v5;
}

- (void)willZoom:(id)a3
{
  CGPoint *p_contentOffsetAtScrollStart;
  CGFloat v5;
  CGFloat v6;

  self->_zooming = 1;
  p_contentOffsetAtScrollStart = &self->_contentOffsetAtScrollStart;
  objc_msgSend(-[UIView _scroller](self, "_scroller", a3), "contentOffset");
  p_contentOffsetAtScrollStart->x = v5;
  p_contentOffsetAtScrollStart->y = v6;
  if (self->_hasScheduledCacheUpdate)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__removePageViewsNotInCurrentDocCoordsRect, 0);
}

- (void)didZoom:(id)a3
{
  self->_zooming = 0;
  -[UIWebPDFView ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 1);
}

- (unint64_t)firstVisiblePageNumber
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  __int128 v11;
  CGFloat height;
  NSArray *pageMinYs;
  double MinX;
  uint64_t PreviousPageIndexGivenYOffset;
  NSMutableArray *pageViews;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double width;
  double v32;
  _BOOL4 v33;
  CGFloat r1;
  CGFloat y;
  CGFloat x;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v46 = *MEMORY[0x1E0C80C00];
  -[UIWebPDFView _viewportBoundsInUIViewCoords](self, "_viewportBoundsInUIViewCoords");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_OWORD *)&self->_documentTransform.c;
  *(_OWORD *)&v43.a = *(_OWORD *)&self->_documentTransform.a;
  *(_OWORD *)&v43.c = v11;
  *(_OWORD *)&v43.tx = *(_OWORD *)&self->_documentTransform.tx;
  CGAffineTransformInvert(&v44, &v43);
  v47.origin.x = v4;
  v47.origin.y = v6;
  v47.size.width = v8;
  v47.size.height = v10;
  v48 = CGRectApplyAffineTransform(v47, &v44);
  height = v48.size.height;
  pageMinYs = self->_pageMinYs;
  y = v48.origin.y;
  x = v48.origin.x;
  r1 = v48.size.width;
  MinX = CGRectGetMinX(v48);
  PreviousPageIndexGivenYOffset = findPreviousPageIndexGivenYOffset(pageMinYs, 0, -[NSArray count](self->pageRects, "count") - 1, MinX);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  pageViews = self->_pageViews;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    v20 = 0.0;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v40 != v19)
        objc_enumerationMutation(pageViews);
      v22 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v21), "tag") - 1000000;
      objc_msgSend(-[NSArray objectAtIndex:](self->pageRects, "objectAtIndex:", v22), "CGRectValue");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v49.origin.y = y;
      v49.origin.x = x;
      v49.size.width = r1;
      v49.size.height = height;
      v51.origin.x = v24;
      v51.origin.y = v26;
      v51.size.width = v28;
      v51.size.height = v30;
      v50 = CGRectIntersection(v49, v51);
      width = v50.size.width;
      v32 = v50.size.height;
      v52.origin.x = v24;
      v52.origin.y = v26;
      v52.size.width = v28;
      v52.size.height = v30;
      v33 = CGRectEqualToRect(v50, v52);
      if (width * v32 > v20 || v33)
        PreviousPageIndexGivenYOffset = v22;
      if (v33)
        break;
      if (width * v32 > v20)
        v20 = width * v32;
      if (v18 == ++v21)
      {
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v18)
          goto LABEL_3;
        return PreviousPageIndexGivenYOffset + 1;
      }
    }
  }
  return PreviousPageIndexGivenYOffset + 1;
}

- (void)prepareForSnapshot:(BOOL)a3
{
  NSMutableArray *pageViews;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  id v12;
  double v13;
  uint64_t v14;
  UIImageView *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  pageViews = self->_pageViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(pageViews);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setShadowPath:", 0);
        objc_msgSend((id)objc_msgSend(v9, "layer"), "setShadowOffset:", 0.0, 3.0);
        v10 = (void *)objc_msgSend(v9, "layer");
        LODWORD(v11) = 0;
        objc_msgSend(v10, "setShadowOpacity:", v11);
        if (-[UIWebPDFView viewportView](self, "viewportView") != self)
        {
          v12 = -[UIWebPDFView viewportView](self, "viewportView");
          if (v12)
          {
            objc_msgSend(v12, "zoomScale");
            if (v13 > 2.5)
              return;
            if (!self->_backingLayerImageViews)
              self->_backingLayerImageViews = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
            v14 = objc_msgSend(v9, "backgroundImage");
            if (v14)
            {
              v15 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v14);
              objc_msgSend(v9, "frame");
              -[UIImageView setFrame:](v15, "setFrame:");
              -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v15, v9);

              -[NSMutableArray addObject:](self->_backingLayerImageViews, "addObject:", v15);
              objc_msgSend(v9, "setHidden:", 1);
            }
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
}

- (void)snapshotComplete
{
  NSMutableArray *backingLayerImageViews;
  NSMutableArray *pageViews;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  backingLayerImageViews = self->_backingLayerImageViews;
  if (backingLayerImageViews)
  {
    -[NSMutableArray makeObjectsPerformSelector:](backingLayerImageViews, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    self->_backingLayerImageViews = 0;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  pageViews = self->_pageViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(pageViews);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        AddShadowPathToView(v9);
        objc_msgSend(v9, "setHidden:", 0);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (void)viewWillClose
{
  -[UIWebPDFView setPdfPlaceHolderView:](self, "setPdfPlaceHolderView:", 0);
}

- (BOOL)_tryToUnlockDocumentWithPassword:(id)a3
{
  BOOL v5;
  CGPDFDocument *cgPDFDocument;
  uint64_t v7;
  const char *v8;
  WebPDFViewPlaceholder *v9;

  if (!a3)
    return 0;
  if (!CGPDFDocumentIsUnlocked(self->_cgPDFDocument))
  {
    cgPDFDocument = self->_cgPDFDocument;
    v7 = objc_msgSend(a3, "UTF8String");
    if (v7)
      v8 = (const char *)v7;
    else
      v8 = "";
    if (CGPDFDocumentUnlockWithPassword(cgPDFDocument, v8))
    {
      -[UIWebPDFView setDocumentPassword:](self, "setDocumentPassword:", a3);
      v9 = -[UIWebPDFView pdfPlaceHolderView](self, "pdfPlaceHolderView");
      v5 = 1;
      -[WebPDFViewPlaceholder setNeedsLayout:](v9, "setNeedsLayout:", 1);
      return v5;
    }
    return 0;
  }
  return 1;
}

- (BOOL)_checkIfDocumentNeedsUnlock
{
  __CFString *v4;
  CGPDFDocument *cgPDFDocument;
  uint64_t v6;
  const char *v7;
  _BOOL4 v8;

  if (CGPDFDocumentIsUnlocked(self->_cgPDFDocument))
    return 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (__CFString *)-[UIWebPDFViewDelegate passwordForPDFView:](self->_pdfDelegate, "passwordForPDFView:", self);
  else
    v4 = &stru_1E16EDF20;
  cgPDFDocument = self->_cgPDFDocument;
  v6 = -[__CFString UTF8String](v4, "UTF8String");
  if (v6)
    v7 = (const char *)v6;
  else
    v7 = "";
  v8 = CGPDFDocumentUnlockWithPassword(cgPDFDocument, v7);
  if (v8)
  {
    -[UIWebPDFView setDocumentPassword:](self, "setDocumentPassword:", v4);
    -[UIWebPDFView pdfPlaceHolderView](self, "pdfPlaceHolderView");
    WebThreadRun();
  }
  return !v8;
}

uint64_t __43__UIWebPDFView__checkIfDocumentNeedsUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUnlockDocument");
}

- (void)_recreateUIPDFDocument
{
  CGPDFDocument *v3;
  UIPDFDocument *document;

  if (CGPDFDocumentIsUnlocked(self->_cgPDFDocument))
  {
    v3 = CGPDFDocumentCopy((uint64_t)self->_cgPDFDocument, -[UIWebPDFView documentPassword](self, "documentPassword"));
    document = self->_document;
    if (document)
    {
      -[UIWebPDFView clearSelection](self, "clearSelection");
      document = self->_document;
    }

    self->_document = -[UIPDFDocument initWithCGPDFDocument:]([UIPDFDocument alloc], "initWithCGPDFDocument:", v3);
    CGPDFDocumentRelease(self->_cgPDFDocument);
    self->_cgPDFDocument = v3;
  }
}

- (void)didCompleteLayout
{
  WebPDFViewPlaceholder *v3;
  WebPDFViewPlaceholder *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  __int128 v11;
  CGAffineTransform v12;
  CGRect v13;

  v3 = -[UIWebPDFView pdfPlaceHolderView](self, "pdfPlaceHolderView");
  v4 = v3;
  if (!self->_cgPDFDocument)
    self->_cgPDFDocument = CGPDFDocumentRetain((CGPDFDocumentRef)-[WebPDFViewPlaceholder document](v3, "document"));
  if (!-[UIWebPDFView _checkIfDocumentNeedsUnlock](self, "_checkIfDocumentNeedsUnlock"))
  {
    -[UIWebPDFView _recreateUIPDFDocument](self, "_recreateUIPDFDocument");
    -[WebPDFViewPlaceholder clearDocument](v4, "clearDocument");
    -[UIWebPDFView setPageRects:](self, "setPageRects:", -[WebPDFViewPlaceholder pageRects](v4, "pageRects"));
    -[UIWebPDFView setPageMinYs:](self, "setPageMinYs:", -[WebPDFViewPlaceholder pageYOrigins](v4, "pageYOrigins"));
  }
  -[WebPDFViewPlaceholder bounds](v4, "bounds");
  if (!CGRectEqualToRect(v13, self->_documentBounds))
  {
    -[WebPDFViewPlaceholder bounds](v4, "bounds");
    self->_documentBounds.origin.x = v5;
    self->_documentBounds.origin.y = v6;
    self->_documentBounds.size.width = v7;
    self->_documentBounds.size.height = v8;
    -[UIView bounds](self, "bounds");
    v10 = v9 / self->_documentBounds.size.width;
    self->_documentScale = v10;
    CGAffineTransformMakeScale(&v12, v10, v10);
    v11 = *(_OWORD *)&v12.c;
    *(_OWORD *)&self->_documentTransform.a = *(_OWORD *)&v12.a;
    *(_OWORD *)&self->_documentTransform.c = v11;
    *(_OWORD *)&self->_documentTransform.tx = *(_OWORD *)&v12.tx;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebPDFViewDelegate didDetermineDocumentBounds:](self->_pdfDelegate, "didDetermineDocumentBounds:", self);
  }

}

- (void)zoom:(id)a3 to:(CGRect)a4 atPoint:(CGPoint)a5 kind:(int)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
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

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "convertRect:toView:", self, v12, v11, width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(a3, "convertPoint:toView:", self, x, y);
    -[UIWebPDFViewDelegate pdfView:zoomToRect:forPoint:considerHeight:](self->_pdfDelegate, "pdfView:zoomToRect:forPoint:considerHeight:", self, a6 != 2, v16, v18, v20, v22, v23, v24);
  }
}

- (void)resetZoom:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFViewDelegate resetZoom:](self->_pdfDelegate, "resetZoom:", self);
}

- (void)_didTouch:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToURL:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  UIWebPDFViewDelegate *pdfDelegate;
  uint64_t v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    pdfDelegate = self->_pdfDelegate;
    v14 = objc_msgSend(a6, "absoluteString");
    objc_msgSend(a3, "convertRect:toView:", self, x, y, width, height);
    -[UIWebPDFViewDelegate handleLinkClick:inRect:](pdfDelegate, "handleLinkClick:inRect:", v14);
  }
}

- (void)_didTouch:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToPageIndex:(unint64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  UIWebPDFViewDelegate *pdfDelegate;
  uint64_t v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    pdfDelegate = self->_pdfDelegate;
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#page%lu"), a6 + 1);
    objc_msgSend(a3, "convertRect:toView:", self, x, y, width, height);
    -[UIWebPDFViewDelegate handleLinkClick:inRect:](pdfDelegate, "handleLinkClick:inRect:", v14);
  }
}

- (void)_didLongPress:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToURL:(id)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  UIWebPDFViewDelegate *pdfDelegate;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    pdfDelegate = self->_pdfDelegate;
    v16 = objc_msgSend(a6, "absoluteString");
    objc_msgSend(a3, "convertPoint:toView:", self, x, y);
    v31 = v18;
    v32 = v17;
    objc_msgSend(a3, "convertRect:toView:", self, v12, v11, width, height);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(a3, "convertRectToPDFPageSpace:", v12, v11, width, height);
    -[UIWebPDFViewDelegate handleLongPressOnLink:atPoint:inRect:contentRect:](pdfDelegate, "handleLongPressOnLink:atPoint:inRect:contentRect:", v16, v32, v31, v20, v22, v24, v26, v27, v28, v29, v30);
  }
}

- (void)_didLongPress:(id)a3 inRect:(CGRect)a4 atPoint:(CGPoint)a5 linkingToPageIndex:(unint64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  UIWebPDFViewDelegate *pdfDelegate;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    pdfDelegate = self->_pdfDelegate;
    v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#page%lu"), a6 + 1);
    objc_msgSend(a3, "convertPoint:toView:", self, x, y);
    v31 = v18;
    v32 = v17;
    objc_msgSend(a3, "convertRect:toView:", self, v12, v11, width, height);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(a3, "convertRectToPDFPageSpace:", v12, v11, width, height);
    -[UIWebPDFViewDelegate handleLongPressOnLink:atPoint:inRect:contentRect:](pdfDelegate, "handleLongPressOnLink:atPoint:inRect:contentRect:", v16, v32, v31, v20, v22, v24, v26, v27, v28, v29, v30);
  }
}

- (void)annotation:(id)a3 wasTouchedAtPoint:(CGPoint)a4 controller:(id)a5
{
  double y;
  double x;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  y = a4.y;
  x = a4.x;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend((id)objc_msgSend(a3, "annotationController"), "pageView");
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(a3, "Rect");
      objc_msgSend(v10, "convertRectFromPDFPageSpace:");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v19 = objc_msgSend(a3, "url");
      if (v19)
      {
        -[UIWebPDFView _didTouch:inRect:atPoint:linkingToURL:](self, "_didTouch:inRect:atPoint:linkingToURL:", v10, v19, v12, v14, v16, v18, x, y);
      }
      else
      {
        v20 = objc_msgSend(a3, "pageNumber");
        if (v20)
          v21 = v20 - 1;
        else
          v21 = 0;
        -[UIWebPDFView _didTouch:inRect:atPoint:linkingToPageIndex:](self, "_didTouch:inRect:atPoint:linkingToPageIndex:", v10, v21, v12, v14, v16, v18, x, y);
      }
    }
  }
}

- (void)annotation:(id)a3 isBeingPressedAtPoint:(CGPoint)a4 controller:(id)a5
{
  double y;
  double x;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  y = a4.y;
  x = a4.x;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend((id)objc_msgSend(a3, "annotationController"), "pageView");
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(a3, "Rect");
      objc_msgSend(v10, "convertRectFromPDFPageSpace:");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v19 = objc_msgSend(a3, "url");
      if (v19)
      {
        -[UIWebPDFView _didLongPress:inRect:atPoint:linkingToURL:](self, "_didLongPress:inRect:atPoint:linkingToURL:", v10, v19, v12, v14, v16, v18, x, y);
      }
      else
      {
        v20 = objc_msgSend(a3, "pageNumber");
        if (v20)
          v21 = v20 - 1;
        else
          v21 = 0;
        -[UIWebPDFView _didLongPress:inRect:atPoint:linkingToPageIndex:](self, "_didLongPress:inRect:atPoint:linkingToPageIndex:", v10, v21, v12, v14, v16, v18, x, y);
      }
    }
  }
}

- (void)clearSelection
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_pageViews, "makeObjectsPerformSelector:", sel_clearSelection);
}

- (id)_pageWithSelection
{
  NSMutableArray *pageViews;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  pageViews = self->_pageViews;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v12;
LABEL_3:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v5)
      objc_enumerationMutation(pageViews);
    v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
    v8 = (void *)objc_msgSend(v7, "page");
    if (v8)
    {
      v9 = (void *)objc_msgSend(v8, "selection");
      if (v9)
      {
        if (objc_msgSend((id)objc_msgSend(v9, "string"), "length"))
          return v7;
      }
    }
    if (v4 == ++v6)
    {
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pageViews, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)_selection
{
  return (id)objc_msgSend((id)objc_msgSend(-[UIWebPDFView _pageWithSelection](self, "_pageWithSelection"), "page"), "selection");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _BOOL4 v5;
  objc_super v7;

  if (sel__define_ == a3)
  {
    v5 = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 2, a4);
    if (v5)
      LOBYTE(v5) = +[UIReferenceLibraryViewController _shouldShowDefineForTerm:](UIReferenceLibraryViewController, "_shouldShowDefineForTerm:", objc_msgSend(-[UIWebPDFView _selection](self, "_selection"), "string"));
  }
  else if (sel__translate_ == a3)
  {
    v5 = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 32, a4);
    if (v5)
    {
      -[UIWebPDFView _selection](self, "_selection");
      LOBYTE(v5) = 1;
    }
  }
  else if (sel__share_ == a3)
  {
    v5 = -[UIResponder _canShowTextServiceForType:](self, "_canShowTextServiceForType:", 8, a4);
    if (v5)
      LOBYTE(v5) = objc_msgSend((id)objc_msgSend(-[UIWebPDFView _selection](self, "_selection"), "string"), "length") != 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIWebPDFView;
    LOBYTE(v5) = -[UIView canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
  return v5;
}

- (void)_define:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  v4 = -[UIWebPDFView _pageWithSelection](self, "_pageWithSelection", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "page"), "selection");
  v6 = objc_msgSend(v5, "string");
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&v15, 0, sizeof(v15));
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v4, "convertRectFromPDFPageSpace:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  -[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 2, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v6, v4));
}

- (void)_translate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  v4 = -[UIWebPDFView _pageWithSelection](self, "_pageWithSelection", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "page"), "selection");
  v6 = objc_msgSend(v5, "string");
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&v15, 0, sizeof(v15));
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v4, "convertRectFromPDFPageSpace:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  -[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 32, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v6, v4));
}

- (void)_share:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  v4 = -[UIWebPDFView _pageWithSelection](self, "_pageWithSelection", a3);
  v5 = (void *)objc_msgSend((id)objc_msgSend(v4, "page"), "selection");
  v6 = objc_msgSend(v5, "string");
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&v15, 0, sizeof(v15));
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v12;
  v16.size.height = v14;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  objc_msgSend(v4, "convertRectFromPDFPageSpace:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  -[UIResponder _showServiceForType:withContext:](self, "_showServiceForType:withContext:", 8, +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v6, v4));
}

- (void)_tapGestureRecognized:(id)a3
{
  if (self->_tapGestureRecognizer == a3)
    -[UIWebPDFView clearSelection](self, "clearSelection");
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_tapGestureRecognizer != a3 || -[UIWebPDFView _selection](self, "_selection") != 0;
}

- (unint64_t)_pageNumberForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v8;
  double v9;
  double v10;
  NSArray *v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *(_OWORD *)&self->_documentTransform.c;
  *(_OWORD *)&v19.a = *(_OWORD *)&self->_documentTransform.a;
  *(_OWORD *)&v19.c = v8;
  *(_OWORD *)&v19.tx = *(_OWORD *)&self->_documentTransform.tx;
  CGAffineTransformInvert(&v20, &v19);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v22 = CGRectApplyAffineTransform(v21, &v20);
  v9 = v22.origin.y;
  v10 = v22.size.height;
  v11 = -[UIWebPDFView pageRects](self, "pageRects", v22.origin.x);
  v12 = -[NSArray count](v11, "count");
  v13 = 0;
  v14 = v9 + v10;
  while (v12 != v13)
  {
    objc_msgSend(-[NSArray objectAtIndex:](v11, "objectAtIndex:", v13), "CGRectValue");
    if (v15 >= v9)
      v17 = v14 > v15;
    else
      v17 = v15 + v16 > v9;
    ++v13;
    if (v17)
      return v13;
  }
  return 0;
}

- (CGPDFPage)imageForContactRect:(CGFloat)a3 onPageInViewRect:(CGFloat)a4 destinationRect:(CGFloat)a5
{
  double width;
  double height;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  size_t v33;
  CGPDFPage *Page;
  CGPDFPage *ImageFromCurrentImageContext;
  int v36;
  int v37;
  BOOL v38;
  CGFloat v39;
  CGFloat v40;
  double MaxX;
  CGFloat MaxY;
  double v43;
  int v44;
  int v45;
  CGFloat v46;
  double v47;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat v53;
  _QWORD *ContextStack;
  CGContext *v55;
  CGFloat v56;
  double MinY;
  CGFloat x;
  CGFloat y;
  double MinX;
  CGFloat txa;
  CGFloat txb;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v70.origin.x = a10;
  v70.origin.y = a11;
  v70.size.width = a12;
  v70.size.height = a13;
  v71 = CGRectIntegral(v70);
  width = v71.size.width;
  height = v71.size.height;
  x = v71.origin.x;
  y = v71.origin.y;
  if (CGRectIsEmpty(v71))
    return 0;
  v72.origin.x = a2;
  v72.origin.y = a3;
  v72.size.width = a4;
  v72.size.height = a5;
  v73 = CGRectIntegral(v72);
  v29 = v73.origin.x;
  v30 = v73.origin.y;
  v31 = v73.size.width;
  v32 = v73.size.height;
  if (CGRectIsEmpty(v73))
    return 0;
  v33 = objc_msgSend(a1, "_pageNumberForRect:", a6, a7, a8, a9);
  if (!v33)
    return 0;
  Page = CGPDFDocumentGetPage((CGPDFDocumentRef)objc_msgSend(a1, "cgPDFDocument"), v33);
  ImageFromCurrentImageContext = Page;
  if (Page)
  {
    v36 = CGPDFPageGetRotationAngle(Page) % 360;
    v37 = v36 + (v36 < 0 ? 0x168 : 0);
    v38 = v37 == 90 || v37 == 270;
    if (v38)
      v39 = height;
    else
      v39 = width;
    if (v38)
      height = width;
    memset(&v65, 0, 32);
    memset(&transform, 0, sizeof(transform));
    v74.origin.x = v29;
    v74.origin.y = v30;
    v74.size.width = v31;
    v74.size.height = v32;
    MinX = CGRectGetMinX(v74);
    v75.origin.x = v29;
    v75.origin.y = v30;
    v75.size.width = v31;
    v75.size.height = v32;
    v40 = v29;
    MinY = CGRectGetMinY(v75);
    v76.origin.x = v29;
    v76.origin.y = v30;
    v76.size.width = v31;
    v76.size.height = v32;
    MaxX = CGRectGetMaxX(v76);
    v77.origin.x = v29;
    v77.origin.y = v30;
    v77.size.width = v31;
    v77.size.height = v32;
    MaxY = CGRectGetMaxY(v77);
    v78.origin.x = v40;
    v78.origin.y = v30;
    v78.size.width = v31;
    v78.size.height = v32;
    txa = CGRectGetWidth(v78);
    v79.origin.x = v40;
    v79.origin.y = v30;
    v79.size.width = v31;
    v79.size.height = v32;
    v43 = CGRectGetHeight(v79);
    v44 = CGPDFPageGetRotationAngle(ImageFromCurrentImageContext) % 360;
    v45 = v44 + (v44 < 0 ? 0x168 : 0);
    if (v45 > 179)
    {
      v46 = x;
      if (v45 != 180)
      {
        if (v45 == 270)
        {
          MaxX = -MinX;
          *(_OWORD *)&v65.a = xmmword_18666F250;
          *(_OWORD *)&v65.c = xmmword_1866830B0;
          v47 = MaxY;
          goto LABEL_22;
        }
LABEL_30:
        abort();
      }
      v65.a = -1.0;
      v65.b = 0.0;
      v65.c = 0.0;
      v65.d = -1.0;
      v47 = MaxX;
      MaxX = MaxY;
    }
    else
    {
      v46 = x;
      if (v45)
      {
        if (v45 == 90)
        {
          v47 = -MinY;
          *(_OWORD *)&v65.a = xmmword_18667DCB0;
          *(_OWORD *)&v65.c = xmmword_1866721B0;
LABEL_22:
          v49 = v43;
          v43 = txa;
LABEL_26:
          v65.tx = v47;
          v65.ty = MaxX;
          CGAffineTransformMakeTranslation(&transform, v49 * -0.5, v43 * -0.5);
          t1 = v65;
          t2 = transform;
          CGAffineTransformConcat(&v65, &t1, &t2);
          v80.origin.x = v46;
          v80.origin.y = y;
          v80.size.width = v39;
          v80.size.height = height;
          txb = CGRectGetMinX(v80);
          v81.origin.x = v46;
          v81.origin.y = y;
          v81.size.width = v39;
          v81.size.height = height;
          v50 = CGRectGetMinY(v81);
          v82.origin.x = v46;
          v82.origin.y = y;
          v82.size.width = v39;
          v82.size.height = height;
          v51 = CGRectGetWidth(v82);
          v83.origin.x = v46;
          v83.origin.y = y;
          v83.size.width = v39;
          v83.size.height = height;
          v52 = CGRectGetHeight(v83);
          v53 = fmin(v51 / v49, v52 / v43);
          CGAffineTransformMakeScale(&t1, v53, v53);
          transform = t1;
          t2 = v65;
          v66 = t1;
          CGAffineTransformConcat(&t1, &t2, &v66);
          v65 = t1;
          CGAffineTransformMakeTranslation(&t1, v51 * 0.5, v52 * 0.5);
          transform = t1;
          t2 = v65;
          v66 = t1;
          CGAffineTransformConcat(&t1, &t2, &v66);
          v65 = t1;
          CGAffineTransformMakeTranslation(&t1, txb, v50);
          transform = t1;
          t2 = v65;
          v66 = t1;
          CGAffineTransformConcat(&t1, &t2, &v66);
          v65 = t1;
          _UIGraphicsBeginImageContextWithOptions(1, 0, v39, height, 0.0);
          ContextStack = GetContextStack(0);
          if (*(int *)ContextStack < 1)
            v55 = 0;
          else
            v55 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
          v84.origin.x = v46;
          v84.origin.y = y;
          v84.size.width = v39;
          v84.size.height = height;
          CGContextClipToRect(v55, v84);
          v85.origin.x = v46;
          v85.origin.y = y;
          v85.size.width = v39;
          v85.size.height = height;
          v56 = CGRectGetHeight(v85);
          CGContextTranslateCTM(v55, 0.0, v56);
          CGContextScaleCTM(v55, 1.0, -1.0);
          transform = v65;
          CGContextConcatCTM(v55, &transform);
          CGContextSetFillColorWithColor(v55, -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
          v86.origin.x = v46;
          v86.origin.y = y;
          v86.size.width = v39;
          v86.size.height = height;
          CGContextFillRect(v55, v86);
          CGContextDrawPDFPage(v55, ImageFromCurrentImageContext);
          ImageFromCurrentImageContext = (CGPDFPage *)_UIGraphicsGetImageFromCurrentImageContext(0);
          UIGraphicsEndImageContext();
          return ImageFromCurrentImageContext;
        }
        goto LABEL_30;
      }
      v47 = -MinX;
      MaxX = -MinY;
      v65.a = 1.0;
      v65.b = 0.0;
      v65.c = 0.0;
      v65.d = 1.0;
    }
    v49 = txa;
    goto LABEL_26;
  }
  return ImageFromCurrentImageContext;
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 504);
}

- (UIWebPDFViewDelegate)pdfDelegate
{
  return self->_pdfDelegate;
}

- (CGRect)documentBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_documentBounds.origin.x;
  y = self->_documentBounds.origin.y;
  width = self->_documentBounds.size.width;
  height = self->_documentBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)initialZoomScale
{
  return self->_initialZoomScale;
}

- (void)setInitialZoomScale:(double)a3
{
  self->_initialZoomScale = a3;
}

- (CGAffineTransform)documentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].tx;
  return self;
}

- (void)setDocumentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_documentTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_documentTransform.c = v4;
  *(_OWORD *)&self->_documentTransform.tx = v3;
}

- (double)documentScale
{
  return self->_documentScale;
}

- (WebPDFViewPlaceholder)pdfPlaceHolderView
{
  return self->pdfPlaceHolderView;
}

- (void)setPdfPlaceHolderView:(id)a3
{
  self->pdfPlaceHolderView = (WebPDFViewPlaceholder *)a3;
}

- (int64_t)ignoreContentOffsetChanges
{
  return self->_ignoreContentOffsetChanges;
}

- (BOOL)hidePageViewsUntilReadyToRender
{
  return self->hidePageViewsUntilReadyToRender;
}

- (void)setHidePageViewsUntilReadyToRender:(BOOL)a3
{
  self->hidePageViewsUntilReadyToRender = a3;
}

- (UIColor)backgroundColorForUnRenderedContent
{
  return self->backgroundColorForUnRenderedContent;
}

- (void)setBackgroundColorForUnRenderedContent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 640);
}

- (BOOL)hideActivityIndicatorForUnRenderedContent
{
  return self->hideActivityIndicatorForUnRenderedContent;
}

- (void)setHideActivityIndicatorForUnRenderedContent:(BOOL)a3
{
  self->hideActivityIndicatorForUnRenderedContent = a3;
}

- (NSString)documentPassword
{
  return self->documentPassword;
}

- (void)setDocumentPassword:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 648);
}

- (NSArray)pageRects
{
  return self->pageRects;
}

- (void)setPageRects:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 656);
}

- (BOOL)readyForSnapshot
{
  return self->readyForSnapshot;
}

- (void)setReadyForSnapshot:(BOOL)a3
{
  self->readyForSnapshot = a3;
}

- (NSArray)pageMinYs
{
  return self->_pageMinYs;
}

- (void)setPageMinYs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

@end
