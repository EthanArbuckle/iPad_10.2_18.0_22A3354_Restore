@implementation UIWebPDFViewHandler

- (void)setHidePageViewsUntilReadyToRender:(BOOL)a3
{
  self->_hidePageViewsUntilReadyToRender = a3;
  -[UIWebPDFView setHidePageViewsUntilReadyToRender:](self->_pdfView, "setHidePageViewsUntilReadyToRender:");
}

- (void)setBackgroundColorForUnRenderedContent:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  self->_backgroundColorForUnRenderedContent = v5;
  -[UIWebPDFView setBackgroundColorForUnRenderedContent:](self->_pdfView, "setBackgroundColorForUnRenderedContent:", v5);
}

- (void)setHideActivityIndicatorForUnRenderedContent:(BOOL)a3
{
  self->_hideActivityIndicatorForUnRenderedContent = a3;
  -[UIWebPDFView setHideActivityIndicatorForUnRenderedContent:](self->_pdfView, "setHideActivityIndicatorForUnRenderedContent:");
}

- (void)setShowPageLabels:(BOOL)a3
{
  _BOOL4 showPageLabels;

  showPageLabels = self->_showPageLabels;
  if (showPageLabels != a3)
  {
    self->_showPageLabels = a3;
    showPageLabels = a3;
  }
  if (!showPageLabels)
    -[UIWebPDFViewHandler clearPageLabel](self, "clearPageLabel");
}

- (void)_setSearchControllerDocumentToSearch:(id)a3
{
  CGPDFDocument *v4;
  CGPDFDocument *v5;
  UIPDFDocument *v6;

  if (a3)
  {
    v4 = CGPDFDocumentCopy((uint64_t)-[UIWebPDFView cgPDFDocument](self->_pdfView, "cgPDFDocument"), -[UIWebPDFView documentPassword](self->_pdfView, "documentPassword"));
    if (v4)
    {
      v5 = v4;
      v6 = -[UIPDFDocument initWithCGPDFDocument:]([UIPDFDocument alloc], "initWithCGPDFDocument:", v4);
      CGPDFDocumentRelease(v5);
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(a3, "setDocumentToSearch:", v6);

  }
}

- (id)searchControllerForHighlighter:(id)a3
{
  NSMapTable *searchControllers;
  UIWebPDFSearchController *v6;

  searchControllers = self->_searchControllers;
  if (!searchControllers)
  {
    searchControllers = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 512, 4);
    self->_searchControllers = searchControllers;
  }
  v6 = -[NSMapTable objectForKey:](searchControllers, "objectForKey:", a3);
  if (!v6)
  {
    v6 = objc_alloc_init(UIWebPDFSearchController);
    -[NSMapTable setObject:forKey:](self->_searchControllers, "setObject:forKey:", v6, a3);
  }
  -[UIWebPDFViewHandler _setSearchControllerDocumentToSearch:](self, "_setSearchControllerDocumentToSearch:", v6);
  -[UIWebPDFView documentScale](self->_pdfView, "documentScale");
  -[UIWebPDFSearchController setDocumentScale:](v6, "setDocumentScale:");
  return v6;
}

- (void)clearSearchControllerForHighlighter:(id)a3
{
  id v5;

  v5 = -[NSMapTable objectForKey:](self->_searchControllers, "objectForKey:");
  if (v5)
  {
    objc_msgSend(v5, "setSearchDelegate:", 0);
    -[NSMapTable removeObjectForKey:](self->_searchControllers, "removeObjectForKey:", a3);
  }
}

- (id)findOnPageHighlighter
{
  return -[UIWebBrowserFindOnPageHighlighter initWithPDFViewHandler:]([UIWebBrowserFindOnPageHighlighter alloc], "initWithPDFViewHandler:", self);
}

- (UIWebPDFViewHandler)init
{
  UIWebPDFViewHandler *v2;
  UIWebPDFViewHandler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebPDFViewHandler;
  v2 = -[UIWebPDFViewHandler init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_scalesPageToFit = 1;
    v2->_initialZoomScale = 1.0;
    v2->_showsShadowsForHTMLContent = 1;
    -[UIWebPDFViewHandler setBackgroundColorForUnRenderedContent:](v2, "setBackgroundColorForUnRenderedContent:", +[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_didReceiveMemoryWarning_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), 0);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5[0] = CFSTR("UIApplicationDidReceiveMemoryWarningNotification");
  v5[1] = CFSTR("UIKeyboardDidShowNotification");
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2));
  -[UIWebPDFViewHandler clearAllViews](self, "clearAllViews");
  -[UIWebPDFViewHandler setBackgroundColorForUnRenderedContent:](self, "setBackgroundColorForUnRenderedContent:", 0);
  v4.receiver = self;
  v4.super_class = (Class)UIWebPDFViewHandler;
  -[UIWebPDFViewHandler dealloc](&v4, sel_dealloc);
}

- (void)didReceiveMemoryWarning:(id)a3
{
  NSEnumerator *v4;
  uint64_t v5;
  uint64_t v6;

  -[UIWebPDFView didReceiveMemoryWarning:](self->_pdfView, "didReceiveMemoryWarning:", a3);
  v4 = -[NSMapTable objectEnumerator](self->_searchControllers, "objectEnumerator");
  v5 = -[NSEnumerator nextObject](v4, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      -[UIWebPDFViewHandler _setSearchControllerDocumentToSearch:](self, "_setSearchControllerDocumentToSearch:", v6);
      v6 = -[NSEnumerator nextObject](v4, "nextObject");
    }
    while (v6);
  }
}

- (void)clearAllViews
{
  -[UIWebPDFViewHandler clearActionSheet](self, "clearActionSheet");
  -[UIWebPDFViewHandler clearLinkHighlight](self, "clearLinkHighlight");
  -[UIWebPDFViewHandler clearPageLabel](self, "clearPageLabel");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self->_pdfView);
  -[UIWebPDFView setPdfDelegate:](self->_pdfView, "setPdfDelegate:", 0);
  -[UIView removeFromSuperview](self->_pdfView, "removeFromSuperview");

  self->_pdfView = 0;
  -[UIView removeFromSuperview](self->_passwordEntryView, "removeFromSuperview");

  self->_passwordEntryView = 0;
  self->_searchControllers = 0;

  self->_labelViewFormatter = 0;
}

- (id)_scroller:(id)a3
{
  id result;

  result = -[UIView _scroller](self->_pdfView, "_scroller");
  if (!result)
    return (id)objc_msgSend(a3, "_scroller");
  return result;
}

- (id)_getPDFDocumentViewForWebView:(id)a3
{
  void *v4;

  WebThreadLock();
  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "webView"), "mainFrame"), "frameView"), "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v4;
  else
    return 0;
}

- (CGRect)_rectForPdfView:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIWebPDFViewHandlerDelegate frameForPDFViewWithHandler:proposedFrame:](self->_pdfHandlerDelegate, "frameForPDFViewWithHandler:proposedFrame:", self, x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_frameForDocumentBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  UIWebPDFView *pdfView;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[UIView frame](self->_pdfView, "frame", a3.origin.x, a3.origin.y);
  v7 = v6;
  v9 = v8;
  pdfView = self->_pdfView;
  if (pdfView)
  {
    -[UIWebPDFView documentTransform](pdfView, "documentTransform");
    v11 = *((double *)&v19 + 1);
    v12 = *(double *)&v19;
    v13 = *((double *)&v20 + 1);
    v14 = *(double *)&v20;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    v13 = 0.0;
    v11 = 0.0;
    v14 = 0.0;
    v12 = 0.0;
  }
  -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:", v7, v9, height * v14 + width * v12, height * v13 + width * v11, v19, v20, v21);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_rectForPasswordView:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[UIView frame](self->_passwordEntryView, "frame");
  v6 = v5;
  v8 = v7;
  objc_msgSend(a3, "frame");
  -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:", v6, v8);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)_replacePDFViewIfPresentWithWebDocView:(id)a3
{
  id v5;

  if (self->_pdfView)
  {
    v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:");
    objc_msgSend(v5, "insertSubview:aboveSubview:", a3, self->_pdfView);
    -[UIWebPDFViewHandler clearAllViews](self, "clearAllViews");
    objc_msgSend(v5, "_setShowsBackgroundShadow:", self->_showsShadowsForHTMLContent);
  }
}

- (void)_removePDFViewIfWebDocViewIsNotPDF:(id)a3
{
  if (!-[UIWebPDFViewHandler _getPDFDocumentViewForWebView:](self, "_getPDFDocumentViewForWebView:"))
    -[UIWebPDFViewHandler _replacePDFViewIfPresentWithWebDocView:](self, "_replacePDFViewIfPresentWithWebDocView:", a3);
}

- (void)_removePDFViewIfWebDocViewIsNotSamePDF:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "_documentUrl"), "_webkit_URLByRemovingFragment"), "isEqual:", -[NSURL _webkit_URLByRemovingFragment](-[UIWebPDFView documentURL](self->_pdfView, "documentURL"), "_webkit_URLByRemovingFragment")) & 1) == 0)-[UIWebPDFViewHandler _replacePDFViewIfPresentWithWebDocView:](self, "_replacePDFViewIfPresentWithWebDocView:", a3);
}

- (void)_createPDFViewIfNeeded:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  UIWebPDFView *v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (!self->_pdfView)
  {
    v5 = -[UIWebPDFViewHandler _getPDFDocumentViewForWebView:](self, "_getPDFDocumentViewForWebView:");
    if (v5)
    {
      v6 = v5;
      v7 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", a3);
      if (v7)
        v8 = v7;
      else
        v8 = a3;
      v9 = -[UIWebPDFView initWithWebPDFViewPlaceholder:]([UIWebPDFView alloc], "initWithWebPDFViewPlaceholder:", v6);
      self->_pdfView = v9;
      -[UIWebPDFView setInitialZoomScale:](v9, "setInitialZoomScale:", self->_initialZoomScale);
      -[UIWebPDFView setDocumentURL:](self->_pdfView, "setDocumentURL:", objc_msgSend(a3, "_documentUrl"));
      -[UIWebPDFView setHidePageViewsUntilReadyToRender:](self->_pdfView, "setHidePageViewsUntilReadyToRender:", self->_hidePageViewsUntilReadyToRender);
      -[UIWebPDFView setBackgroundColorForUnRenderedContent:](self->_pdfView, "setBackgroundColorForUnRenderedContent:", self->_backgroundColorForUnRenderedContent);
      -[UIWebPDFView setHideActivityIndicatorForUnRenderedContent:](self->_pdfView, "setHideActivityIndicatorForUnRenderedContent:", self->_hideActivityIndicatorForUnRenderedContent);
      objc_msgSend(v8, "frame");
      -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:", 0.0, 0.0);
      v11 = v10;
      v13 = v12;
      -[UIView setFrame:](self->_pdfView, "setFrame:");
      -[UIWebPDFView setPdfDelegate:](self->_pdfView, "setPdfDelegate:", self);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "setContainerSize:", v11, v13);
    }
  }
}

- (void)_ensurePDFViewInHierarchyForWebDocView:(id)a3
{
  UIWebPDFView *pdfView;
  UIView *v6;
  UIDocumentPasswordView *passwordEntryView;

  pdfView = self->_pdfView;
  if (pdfView)
  {
    -[UIView frame](self->_pdfView, "frame");
    -[UIWebPDFViewHandler _rectForPdfView:](self, "_rectForPdfView:");
    -[UIView setFrame:](pdfView, "setFrame:");
    v6 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", a3);
    if (v6 != -[UIView superview](self->_pdfView, "superview"))
      -[UIView insertSubview:aboveSubview:](v6, "insertSubview:aboveSubview:", self->_pdfView, a3);
    if (objc_msgSend(a3, "superview"))
      objc_msgSend(a3, "removeFromSuperview");
    passwordEntryView = self->_passwordEntryView;
    if (passwordEntryView)
    {
      -[UIWebPDFViewHandler _rectForPasswordView:](self, "_rectForPasswordView:", v6);
      -[UIView setFrame:](passwordEntryView, "setFrame:");
      -[UIView insertSubview:above:](v6, "insertSubview:above:", self->_passwordEntryView, self->_pdfView);
    }
    -[UIView _setShowsBackgroundShadow:](v6, "_setShowsBackgroundShadow:", 0);
  }
}

- (void)_updateViewHierarchyForDocumentView:(id)a3 ignoreIfSame:(BOOL)a4
{
  if (a4)
  {
    -[UIWebPDFViewHandler _removePDFViewIfWebDocViewIsNotPDF:](self, "_removePDFViewIfWebDocViewIsNotPDF:", a3);
    -[UIWebPDFViewHandler _removePDFViewIfWebDocViewIsNotSamePDF:](self, "_removePDFViewIfWebDocViewIsNotSamePDF:", a3);
  }
  else if (self->_pdfView)
  {
    -[UIWebPDFViewHandler _replacePDFViewIfPresentWithWebDocView:](self, "_replacePDFViewIfPresentWithWebDocView:", a3);
  }
  -[UIWebPDFViewHandler _createPDFViewIfNeeded:](self, "_createPDFViewIfNeeded:", a3);
  -[UIWebPDFViewHandler _ensurePDFViewInHierarchyForWebDocView:](self, "_ensurePDFViewInHierarchyForWebDocView:", a3);
}

- (void)updateViewSettings
{
  id v3;
  void *v4;
  UIDocumentPasswordView *passwordEntryView;
  double v6;
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
  unint64_t v18;
  double v19;
  double v20;

  v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
  if (v3)
  {
    v4 = v3;
    passwordEntryView = self->_passwordEntryView;
    if (passwordEntryView)
    {
      -[UIWebPDFViewHandler _rectForPasswordView:](self, "_rectForPasswordView:", v3);
      -[UIView setFrame:](passwordEntryView, "setFrame:");
    }
    else
    {
      objc_msgSend(v3, "zoomScale");
      v7 = v6;
      objc_msgSend(v4, "minimumZoomScale");
      v9 = v8;
      objc_msgSend(v4, "frame");
      -[UIWebPDFViewHandler scalesForContainerSize:](self, "scalesForContainerSize:", v10, v11);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v18 = -[UIWebPDFViewHandler _verticalEdgeForContentOffsetInScrollView:](self, "_verticalEdgeForContentOffsetInScrollView:", v4);
      objc_msgSend(v4, "setMinimumZoomScale:", v13);
      objc_msgSend(v4, "setMaximumZoomScale:", v15);
      -[UIWebPDFView setInitialZoomScale:](self->_pdfView, "setInitialZoomScale:", v17);
      self->_initialZoomScale = v17;
      if (v7 < v17 || v7 == v9)
        objc_msgSend(v4, "setZoomScale:", v17);
      objc_msgSend(v4, "setZoomEnabled:", self->_scalesPageToFit);
      objc_msgSend(v4, "setBouncesHorizontally:", self->_scalesPageToFit);
      if (v18)
      {
        v19 = *MEMORY[0x1E0C9D538];
        -[UIWebPDFViewHandler _pinValueForVerticalEdge:inScrollView:](self, "_pinValueForVerticalEdge:inScrollView:", v18, v4);
        objc_msgSend(v4, "setContentOffset:animated:", 0, v19, v20);
      }
    }
  }
}

- (void)_adjustZoomScalesForScrollViewInternal:(id)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  UIWebPDFView *pdfView;
  double width;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  if (a3)
  {
    -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 1);
    objc_msgSend(a3, "setMinimumZoomScale:", 1.0);
    objc_msgSend(a3, "setMaximumZoomScale:", 32.0);
    objc_msgSend(a3, "setZoomScale:", 1.0);
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(a3, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], v6);
    objc_msgSend(a3, "setBouncesVertically:", 1);
    objc_msgSend(a3, "setScrollEnabled:", 1);
    -[UIWebPDFView documentBounds](self->_pdfView, "documentBounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    pdfView = self->_pdfView;
    if (pdfView)
      -[UIWebPDFView documentTransform](pdfView, "documentTransform");
    else
      memset(&v23, 0, sizeof(v23));
    v24.origin.x = v8;
    v24.origin.y = v10;
    v24.size.width = v12;
    v24.size.height = v14;
    v25 = CGRectApplyAffineTransform(v24, &v23);
    width = v25.size.width;
    objc_msgSend(a3, "setContentSize:", v25.size.width, v25.size.height);
    if (width > 0.0 && self->_scalesPageToFit)
    {
      objc_msgSend(a3, "contentOffset");
      v18 = v17;
      v20 = v19;
      objc_msgSend(a3, "frame");
      v22 = v21 / width;
      objc_msgSend(a3, "setMinimumZoomScale:", v22);
      objc_msgSend(a3, "setZoomScale:", v22);
      if (v5 == v18 && v6 == v20)
        objc_msgSend(a3, "setContentOffset:animated:", 0, v5, v6);
    }
    -[UIWebPDFViewHandler updateViewSettings](self, "updateViewSettings", *(_OWORD *)&v23.a, *(_OWORD *)&v23.c, *(_OWORD *)&v23.tx);
    -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 0);
  }
}

- (void)adjustZoomScalesForScrollView
{
  id v3;
  void *v4;
  double v5;
  double v6;

  v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
  if (v3)
  {
    v4 = v3;
    if (self->_passwordEntryView)
    {
      objc_msgSend(v3, "setMinimumZoomScale:", 1.0);
      objc_msgSend(v4, "setMaximumZoomScale:", 1.0);
      objc_msgSend(v4, "setZoomScale:", 1.0);
      objc_msgSend(v4, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      -[UIView bounds](self->_passwordEntryView, "bounds");
      objc_msgSend(v4, "setContentSize:", v5, v6);
      if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(v4, "setBouncesVertically:", 0);
        objc_msgSend(v4, "setScrollEnabled:", 0);
      }
    }
    else
    {
      -[UIWebPDFViewHandler _adjustZoomScalesForScrollViewInternal:](self, "_adjustZoomScalesForScrollViewInternal:", v3);
    }
  }
}

- (void)clearLinkHighlight
{
  -[UIView removeFromSuperview](self->_linkHighlightView, "removeFromSuperview");

  self->_linkHighlightView = 0;
}

- (id)createLinkHighlight
{
  _UIHighlightView *linkHighlightView;
  _UIHighlightView *v4;

  linkHighlightView = self->_linkHighlightView;
  if (!linkHighlightView)
  {
    v4 = [_UIHighlightView alloc];
    linkHighlightView = -[_UIHighlightView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setOpaque:](linkHighlightView, "setOpaque:", 0);
    -[_UIHighlightView setCornerRadius:](linkHighlightView, "setCornerRadius:", 3.0);
    -[_UIHighlightView setColor:](linkHighlightView, "setColor:", +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.3));
    self->_linkHighlightView = linkHighlightView;
  }
  return linkHighlightView;
}

- (void)highlightRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  void *v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIWebPDFViewHandler clearLinkHighlight](self, "clearLinkHighlight");
  if (self->_pdfView)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    v16 = CGRectInset(v15, -3.0, -3.0);
    v8 = v16.origin.x;
    v9 = v16.origin.y;
    v10 = v16.size.width;
    v11 = v16.size.height;
    v12 = -[UIWebPDFViewHandler createLinkHighlight](self, "createLinkHighlight");
    objc_msgSend(v12, "removeFromSuperview");
    -[UIView addSubview:](self->_pdfView, "addSubview:", v12);
    v13 = 4;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 4);
    do
    {
      objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v10 + 3.0, v11 + 3.0));
      --v13;
    }
    while (v13);
    objc_msgSend(v12, "setCornerRadii:", v14);

    objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);
  }
}

- (void)scrollToPageNumber:(int64_t)a3 animate:(BOOL)a4
{
  int64_t v4;
  id v7;
  void *v8;
  NSArray *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  UIWebPDFView *pdfView;
  UIWebPDFView *v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  v4 = a3 - 1;
  if (a3 >= 1)
  {
    v7 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a4);
    if (v7)
    {
      v8 = v7;
      v9 = -[UIWebPDFView pageRects](self->_pdfView, "pageRects");
      if (-[NSArray count](v9, "count"))
      {
        if (-[NSArray count](v9, "count") >= a3)
        {
          -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 1);
          objc_msgSend(v8, "setZoomScale:", self->_initialZoomScale);
          objc_msgSend(-[NSArray objectAtIndex:](v9, "objectAtIndex:", v4), "CGRectValue");
          v11 = v10;
          v13 = v12;
          v15 = v14;
          v17 = v16;
          pdfView = self->_pdfView;
          if (pdfView)
          {
            -[UIWebPDFView documentTransform](pdfView, "documentTransform");
            v19 = self->_pdfView;
          }
          else
          {
            v19 = 0;
            memset(&v20, 0, sizeof(v20));
          }
          v21.origin.x = v11;
          v21.origin.y = v13;
          v21.size.width = v15;
          v21.size.height = v17;
          v22 = CGRectApplyAffineTransform(v21, &v20);
          objc_msgSend(v8, "convertRect:fromView:", v19, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
          objc_msgSend(v8, "contentOffset");
          objc_msgSend(v8, "setContentOffset:animated:", 0);
          -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 0);
          -[UIWebPDFView ensureCorrectPagesAreInstalled:](self->_pdfView, "ensureCorrectPagesAreInstalled:", 1);
        }
      }
    }
  }
}

- (id)_absoluteUrlRelativeToDocumentURL:(id)a3
{
  NSURL *v4;

  v4 = -[NSURL absoluteURL](-[UIWebPDFView documentURL](self->_pdfView, "documentURL"), "absoluteURL");
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("#")) & 1) == 0
    && !-[NSString hasSuffix:](-[NSURL absoluteString](v4, "absoluteString"), "hasSuffix:", CFSTR("/")))
  {
    v4 = -[NSURL URLByDeletingLastPathComponent](v4, "URLByDeletingLastPathComponent");
  }
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", a3, v4), "absoluteURL"), "standardizedURL");
}

- (void)_completeLinkClickWithURL:(id)a3
{
  -[UIWebPDFViewHandler clearLinkHighlight](self, "clearLinkHighlight");
  if (a3)
  {
    -[UIWebPDFView pdfPlaceHolderView](self->_pdfView, "pdfPlaceHolderView");
    WebThreadRun();
  }
}

uint64_t __49__UIWebPDFViewHandler__completeLinkClickWithURL___block_invoke(uint64_t a1)
{
  WebThreadRunOnMainThread();
  objc_msgSend(*(id *)(a1 + 48), "simulateClickOnLinkToURL:", *(_QWORD *)(a1 + 40));
  return WebThreadRunOnMainThread();
}

uint64_t __49__UIWebPDFViewHandler__completeLinkClickWithURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateWillClickLink:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__UIWebPDFViewHandler__completeLinkClickWithURL___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateDidClickLink:", *(_QWORD *)(a1 + 40));
}

- (void)_completeLinkClickWithURLString:(id)a3
{
  -[UIWebPDFViewHandler _completeLinkClickWithURL:](self, "_completeLinkClickWithURL:", -[UIWebPDFViewHandler _absoluteUrlRelativeToDocumentURL:](self, "_absoluteUrlRelativeToDocumentURL:", a3));
}

- (void)_notifyDelegateWillClickLink:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFViewHandlerDelegate pdfViewHandler:willClickLink:](self->_pdfHandlerDelegate, "pdfViewHandler:willClickLink:", self, a3);
}

- (void)_notifyDelegateDidClickLink:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIWebPDFViewHandlerDelegate pdfViewHandler:linkClicked:](self->_pdfHandlerDelegate, "pdfViewHandler:linkClicked:", self, a3);
}

- (void)handleLinkClick:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UIWebPDFViewHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__completeLinkClickWithURLString_, a3, 0.2);
  -[UIWebPDFViewHandler highlightRect:](self, "highlightRect:", x, y, width, height);
}

- (void)clearActionSheet
{
  _UIRotatingAlertController *v3;

  -[_UIRotatingAlertController doneWithSheet](self->_linkActionSheet, "doneWithSheet");
  v3 = self->_linkActionSheet;
  self->_linkActionSheet = 0;

  self->_linkActions = 0;
  self->_linkActionInfo = 0;
}

- (id)_actionForType:(int)a3
{
  return -[UIWebPDFViewHandler _actionForType:withActionInfo:](self, "_actionForType:withActionInfo:", *(_QWORD *)&a3, 0);
}

- (id)_actionForType:(int)a3 withActionInfo:(id)a4
{
  uint64_t v4;
  id v5;
  _QWORD *v6;
  UIWebPDFLinkAction *v7;
  id result;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v4 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0:
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x3052000000;
      v11[3] = __Block_byref_object_copy__244;
      v11[4] = __Block_byref_object_dispose__244;
      v11[5] = self;
      v5 = (id)objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Open Link"), CFSTR("Open"), CFSTR("Localizable"));
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke;
      v10[3] = &unk_1E16ECEA8;
      v10[4] = v11;
      _Block_object_dispose(v11, 8);
      v6 = v10;
      if (v5)
        goto LABEL_9;
      goto LABEL_11;
    case 1:
      v5 = (id)objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Copy Link"), CFSTR("Copy"), CFSTR("Localizable"));
      v6 = &__block_literal_global_681;
      if (!v5)
        goto LABEL_11;
      goto LABEL_9;
    case 2:
      v5 = _UINSLocalizedStringWithDefaultValue(CFSTR("Add to Reading List"), CFSTR("Add to Reading List"));
      v6 = &__block_literal_global_433_0;
      if (!v5)
        goto LABEL_11;
      goto LABEL_9;
    case 3:
      v5 = _UINSLocalizedStringWithDefaultValue(CFSTR("Open in Safari"), CFSTR("Open in Safari"));
      v6 = &__block_literal_global_436;
      if (v5)
        goto LABEL_9;
      goto LABEL_11;
    case 4:
      v9 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("UIWebPDFLinkActionExternalApplicationName"));
      v5 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("Open in “%@” (Link Element Action Sheet Button)"), CFSTR("Open in “%@”"), CFSTR("Localizable")), v9);
      v6 = &__block_literal_global_443_0;
      if (!v5)
        goto LABEL_11;
LABEL_9:
      v7 = objc_alloc_init(UIWebPDFLinkAction);
      -[UIWebPDFLinkAction setTitle:](v7, "setTitle:", v5);
      -[UIWebPDFLinkAction setType:](v7, "setType:", v4);
      -[UIWebPDFLinkAction setHandler:](v7, "setHandler:", v6);
      result = v7;
      break;
    default:
LABEL_11:
      result = 0;
      break;
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "valueForKey:", CFSTR("UIWebPDFLinkActionURLAttribute"));
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_completeLinkClickWithURL:", result);
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  UIPasteboard *v5;
  uint64_t v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a2, "valueForKey:", CFSTR("UIWebPDFLinkActionURLAttribute"));
  if (result)
  {
    v3 = (void *)result;
    v7[0] = objc_msgSend(UIPasteboardTypeListString, "objectAtIndex:", 0);
    v8[0] = objc_msgSend(v3, "absoluteString");
    v7[1] = objc_msgSend(UIPasteboardTypeListURL, "objectAtIndex:", 0);
    v8[1] = v3;
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v6 = v4;
    return -[UIPasteboard setItems:](v5, "setItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1));
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  result = objc_msgSend(a2, "valueForKey:", CFSTR("UIWebPDFLinkActionURLAttribute"));
  if (result)
  {
    v3 = (void *)result;
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__244;
    v10 = __Block_byref_object_dispose__244;
    v4 = (void *)_MergedGlobals_13_7;
    v11 = _MergedGlobals_13_7;
    if (!_MergedGlobals_13_7)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __getSSReadingListClass_block_invoke_1;
      v5[3] = &unk_1E16B14C0;
      v5[4] = &v6;
      __getSSReadingListClass_block_invoke_1((uint64_t)v5);
      v4 = (void *)v7[5];
    }
    _Block_object_dispose(&v6, 8);
    return objc_msgSend((id)objc_msgSend(v4, "defaultReadingList"), "addReadingListItemWithURL:title:previewText:error:", v3, objc_msgSend(v3, "absoluteString"), 0, 0);
  }
  return result;
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UIWebPDFLinkActionAppLinkAttribute")), "openInWebBrowser:setAppropriateOpenStrategyAndWebBrowserState:completionHandler:", 1, 0, &__block_literal_global_438);
}

uint64_t __53__UIWebPDFViewHandler__actionForType_withActionInfo___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("UIWebPDFLinkActionAppLinkAttribute")), "openInWebBrowser:setAppropriateOpenStrategyAndWebBrowserState:completionHandler:", 0, 0, &__block_literal_global_444);
}

- (id)_actionsForInteractionInfo:(id)a3
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("UIWebPDFLinkActionURLAttribute"));
  if (_UIApplicationHasAppLinkEntitlements() && (v8 = _UIAppLinkForURL(v7)) != 0)
  {
    v9 = v8;
    v10 = (void *)objc_msgSend(a3, "mutableCopy");
    v11 = objc_msgSend((id)objc_msgSend(v9, "targetApplicationRecord"), "localizedName");
    if (v11)
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("UIWebPDFLinkActionExternalApplicationName"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("UIWebPDFLinkActionAppLinkAttribute"));
      objc_msgSend(v6, "addObject:", -[UIWebPDFViewHandler _actionForType:withActionInfo:](self, "_actionForType:withActionInfo:", 3, v10));
      v12 = 4;
    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("UIWebPDFLinkActionAppLinkAttribute"));
      v12 = 3;
    }
    objc_msgSend(v6, "addObject:", -[UIWebPDFViewHandler _actionForType:withActionInfo:](self, "_actionForType:withActionInfo:", v12, v10));

  }
  else
  {
    objc_msgSend(v6, "addObject:", -[UIWebPDFViewHandler _actionForType:](self, "_actionForType:", 0));
  }
  if (objc_msgSend(v7, "isHTTPOrHTTPSURL"))
  {
    v13 = -[UIWebPDFViewHandler _actionForType:](self, "_actionForType:", 2);
    if (!v13)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWebPDFView.m"), 2313, CFSTR("readingListAction is nil"));
    objc_msgSend(v6, "addObject:", v13);
  }
  v14 = -[UIWebPDFViewHandler _actionForType:](self, "_actionForType:", 1);
  if (!v14)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWebPDFView.m"), 2322, CFSTR("copyAction is nil"));
  objc_msgSend(v6, "addObject:", v14);
  return v6;
}

- (void)_showLinkSheet:(id)a3
{
  uint64_t v5;
  void *v6;
  _UIRotatingAlertController *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UIWebPDFViewHandler clearLinkHighlight](self, "clearLinkHighlight");
  v5 = objc_msgSend(a3, "valueForKey:", CFSTR("UIWebPDFLinkActionURLAttribute"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_alloc_init(_UIRotatingAlertController);
    -[UIAlertController setTitle:](v7, "setTitle:", objc_msgSend(v6, "_web_userVisibleString"));
    -[_UIRotatingAlertController setRotatingSheetDelegate:](v7, "setRotatingSheetDelegate:", self);
    v8 = -[UIWebPDFViewHandler _actionsForInteractionInfo:](self, "_actionsForInteractionInfo:", a3);
    v16 = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (id)-[UIWebPDFViewHandlerDelegate pdfViewHandler:actionsForURL:suggestedActions:](self->_pdfHandlerDelegate, "pdfViewHandler:actionsForURL:suggestedActions:", self, v6, v8, a3);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16, v16);
    v10 = MEMORY[0x1E0C809B0];
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "title");
          v19[0] = v10;
          v19[1] = 3221225472;
          v19[2] = __38__UIWebPDFViewHandler__showLinkSheet___block_invoke;
          v19[3] = &unk_1E16C3D18;
          v19[4] = self;
          v19[5] = v14;
          v19[6] = v7;
          -[UIAlertController _addActionWithTitle:image:style:handler:](v7, "_addActionWithTitle:image:style:handler:", v15, 0, 0, v19);
        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __38__UIWebPDFViewHandler__showLinkSheet___block_invoke_2;
    v18[3] = &unk_1E16C3CF0;
    v18[4] = self;
    v18[5] = v7;
    -[UIAlertController _addActionWithTitle:image:style:handler:](v7, "_addActionWithTitle:image:style:handler:", _UINSLocalizedStringWithDefaultValue(CFSTR("Cancel"), CFSTR("Cancel")), 0, 1, v18);
    self->_linkActionSheet = v7;
    self->_linkActionInfo = (NSDictionary *)v17;
    self->_linkActions = (NSArray *)v8;
    if (!-[_UIRotatingAlertController presentSheet](v7, "presentSheet"))
      -[UIWebPDFViewHandler performAction:fromAlertController:](self, "performAction:fromAlertController:", 0, v7);
  }
}

uint64_t __38__UIWebPDFViewHandler__showLinkSheet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction:fromAlertController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __38__UIWebPDFViewHandler__showLinkSheet___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAction:fromAlertController:", 0, *(_QWORD *)(a1 + 40));
}

- (void)handleLongPressOnLink:(id)a3 atPoint:(CGPoint)a4 inRect:(CGRect)a5 contentRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  id v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v10 = a4.y;
    v11 = a4.x;
    v13 = -[UIWebPDFViewHandler _absoluteUrlRelativeToDocumentURL:](self, "_absoluteUrlRelativeToDocumentURL:");
    if (v13)
    {
      v15[0] = v13;
      v14[0] = CFSTR("UIWebPDFLinkActionURLAttribute");
      v14[1] = CFSTR("UIWebPDFLinkActionPointAttribute");
      v15[1] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v10);
      v14[2] = CFSTR("UIWebPDFLinkActionRectAttribute");
      v15[2] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", x, y, width, height);
      v14[3] = CFSTR("UIWebPDFLinkActionContentRectAttribute");
      v15[3] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
      -[UIWebPDFViewHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showLinkSheet_, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4), 0.75);
      -[UIWebPDFViewHandler highlightRect:](self, "highlightRect:", x, y, width, height);
    }
  }
}

- (void)performAction:(id)a3 fromAlertController:(id)a4
{
  uint64_t v5;

  if (self->_linkActionSheet == a4)
  {
    if (!a3)
    {
      v5 = objc_msgSend(0, "handler");
      if (v5)
        (*(void (**)(uint64_t, NSDictionary *))(v5 + 16))(v5, self->_linkActionInfo);
    }
    -[_UIRotatingAlertController doneWithSheet](self->_linkActionSheet, "doneWithSheet");
    -[UIWebPDFViewHandler clearActionSheet](self, "clearActionSheet");
  }
}

- (id)hostViewForSheet:(id)a3
{
  id result;
  UIWebPDFView *pdfView;
  void *v6;
  id v7;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = (id)-[UIWebPDFViewHandlerDelegate hostViewForLinkSheet:](self->_pdfHandlerDelegate, "hostViewForLinkSheet:", self)) == 0)
  {
    pdfView = self->_pdfView;
    if (!pdfView)
      return -[UIView window](self->_pdfView, "window");
    v6 = 0;
    do
    {
      v7 = +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", pdfView);
      if (v7)
        v6 = v7;
      pdfView = -[UIView superview](pdfView, "superview");
    }
    while (pdfView);
    if (!v6)
      return -[UIView window](self->_pdfView, "window");
    result = (id)objc_msgSend(v6, "view");
    if (!result)
      return -[UIView window](self->_pdfView, "window");
  }
  return result;
}

- (CGRect)initialPresentationRectInHostViewForSheet:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CGRect v7;

  v4 = -[UIWebPDFViewHandler hostViewForSheet:](self, "hostViewForSheet:", 0);
  if (v4
    && (v5 = v4,
        (v6 = -[NSDictionary valueForKey:](self->_linkActionInfo, "valueForKey:", CFSTR("UIWebPDFLinkActionPointAttribute"))) != 0))
  {
    objc_msgSend(v6, "CGPointValue");
    objc_msgSend(v5, "convertPoint:fromView:", self->_pdfView);
    v7.size.width = 1.0;
    v7.size.height = 1.0;
    return CGRectInset(v7, -22.0, -22.0);
  }
  else
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
  }
}

- (void)clearPageLabel
{
  -[UIView removeFromSuperview](self->_pageLabelView, "removeFromSuperview");

  self->_pageLabelView = 0;
}

- (id)createPageLabel
{
  id result;
  UIWebPDFLabelView *v4;

  result = self->_pageLabelView;
  if (!result)
  {
    v4 = [UIWebPDFLabelView alloc];
    result = -[UIWebPDFLabelView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    self->_pageLabelView = (UIWebPDFLabelView *)result;
  }
  return result;
}

- (void)_showPasswordErrorAlert
{
  UIAlertController *v3;
  id v4;
  _QWORD v5[5];

  -[UITextField setText:](-[UIDocumentPasswordView passwordField](self->_passwordEntryView, "passwordField"), "setText:", 0);
  v3 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", _UINSLocalizedStringWithDefaultValue(CFSTR("The document could not be opened with that password."), CFSTR("The document could not be opened with that password.")), 0, 1);
  v4 = _UINSLocalizedStringWithDefaultValue(CFSTR("OK"), CFSTR("OK"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__UIWebPDFViewHandler__showPasswordErrorAlert__block_invoke;
  v5[3] = &unk_1E16ECCD8;
  v5[4] = self;
  -[UIAlertController addAction:](v3, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v4, 1, v5));
  objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", self->_pdfView), "presentViewController:animated:completion:", v3, 1, 0);
}

uint64_t __46__UIWebPDFViewHandler__showPasswordErrorAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "passwordField"), "becomeFirstResponder");
}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  if (-[UIWebPDFView _tryToUnlockDocumentWithPassword:](self->_pdfView, "_tryToUnlockDocumentWithPassword:", a3, a4))
  {
    -[UIWebPDFView pdfPlaceHolderView](self->_pdfView, "pdfPlaceHolderView");
    WebThreadRun();
  }
  else
  {
    -[UIWebPDFViewHandler _showPasswordErrorAlert](self, "_showPasswordErrorAlert");
  }
}

uint64_t __60__UIWebPDFViewHandler_userDidEnterPassword_forPasswordView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUnlockDocument");
}

- (void)_adjustContentOffsetForKeyboardIfNeeded
{
  UIDocumentPasswordView *passwordEntryView;
  UITextField *v4;
  id v5;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  CGFloat v32;
  CGFloat v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  passwordEntryView = self->_passwordEntryView;
  if (passwordEntryView)
  {
    v4 = -[UIDocumentPasswordView passwordField](passwordEntryView, "passwordField");
    if (-[UITextField isEditing](v4, "isEditing"))
    {
      v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
      if (v5)
      {
        v6 = v5;
        if (+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"))
        {
          objc_msgSend((id)objc_msgSend(v6, "keyboardSceneDelegate"), "visibleFrameInView:", 0);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
          if (!CGRectIsEmpty(v34))
          {
            v11 = (void *)objc_msgSend(v6, "window");
            if (objc_msgSend(+[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 0), "containsObject:", v11))v12 = y;
            else
              v12 = y + -50.0;
            objc_msgSend(v11, "convertRect:fromWindow:", 0, x, v12, width, height);
            objc_msgSend(v6, "convertRect:fromView:", v11);
            v14 = v13;
            v16 = v15;
            v18 = v17;
            v20 = v19;
            -[UIView bounds](v4, "bounds");
            -[UIView convertRect:toView:](v4, "convertRect:toView:", v6);
            v32 = v22;
            v33 = v21;
            v24 = v23;
            v26 = v25;
            -[UIView bounds](self->_passwordEntryView, "bounds");
            v28 = v27;
            v30 = v29;
            v35.origin.x = v14;
            v35.origin.y = v16;
            v35.size.width = v18;
            v35.size.height = v20;
            objc_msgSend(v6, "setContentSize:", v28, CGRectGetHeight(v35) + v30);
            v31 = v24 + v26 > v16;
            if (v24 >= v16)
              v31 = v16 + v20 > v24;
            if (v31)
            {
              v36.size.width = v32;
              v36.origin.x = v33;
              v36.origin.y = v24;
              v36.size.height = v26;
              CGRectGetMaxY(v36);
              v37.origin.x = v14;
              v37.origin.y = v16;
              v37.size.width = v18;
              v37.size.height = v20;
              CGRectGetMinY(v37);
              objc_msgSend(v6, "contentOffset");
              objc_msgSend(v6, "setContentOffset:animated:", 1);
            }
          }
        }
      }
    }
  }
}

- (void)_keyboardDidShow:(id)a3
{
  -[UIWebPDFViewHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__adjustContentOffsetForKeyboardIfNeeded, 0, 0.25);
}

- (void)didBeginEditingPassword:(id)a3 inView:(id)a4
{
  if (self->_passwordEntryView)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4), "addObserver:selector:name:object:", self, sel__keyboardDidShow_, CFSTR("UIKeyboardDidShowNotification"), 0);
}

- (void)didEndEditingPassword:(id)a3 inView:(id)a4
{
  id v5;
  void *v6;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  CGRect v12;
  CGRect v13;

  if (self->_passwordEntryView)
  {
    v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a4);
    if (v5)
    {
      v6 = v5;
      -[UIView frame](self->_passwordEntryView, "frame");
      x = v12.origin.x;
      y = v12.origin.y;
      width = v12.size.width;
      height = v12.size.height;
      MaxX = CGRectGetMaxX(v12);
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      objc_msgSend(v6, "setContentSize:", MaxX, CGRectGetMaxY(v13));
      objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, y);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("UIKeyboardDidShowNotification"), 0);
    }
  }
}

- (void)_showPasswordEntryViewForFile:(id)a3
{
  UIDocumentPasswordView *v4;
  UIDocumentPasswordView *passwordEntryView;

  if (!self->_passwordEntryView)
  {
    v4 = -[UIDocumentPasswordView initWithDocumentName:]([UIDocumentPasswordView alloc], "initWithDocumentName:", a3);
    self->_passwordEntryView = v4;
    -[UIDocumentPasswordView setPasswordDelegate:](v4, "setPasswordDelegate:", self);
    passwordEntryView = self->_passwordEntryView;
    -[UIWebPDFViewHandler _rectForPasswordView:](self, "_rectForPasswordView:", self->_pdfView);
    -[UIView setFrame:](passwordEntryView, "setFrame:");
  }
  -[UIView insertSubview:above:](-[UIView superview](self->_pdfView, "superview", a3), "insertSubview:above:", self->_passwordEntryView, self->_pdfView);
}

- (void)_postdidDetermineDocumentBounds
{
  if (-[UIView superview](self->_pdfView, "superview"))
  {
    -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 1);
    -[UIWebPDFViewHandler adjustZoomScalesForScrollView](self, "adjustZoomScalesForScrollView");
    -[UIWebPDFViewHandler restoreStateFromPendingHistoryItem](self, "restoreStateFromPendingHistoryItem");
    -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 0);
    -[UIWebPDFViewHandler ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIWebPDFViewHandlerDelegate pdfViewHandlerCompletedLayoutAndIsUnlocked:](self->_pdfHandlerDelegate, "pdfViewHandlerCompletedLayoutAndIsUnlocked:", self);
  }
}

- (void)didDetermineDocumentBounds:(id)a3
{
  UIWebPDFView *pdfView;
  _QWORD v5[5];
  _QWORD v6[5];

  pdfView = self->_pdfView;
  -[UIWebPDFView documentBounds](pdfView, "documentBounds", a3);
  -[UIWebPDFViewHandler _frameForDocumentBounds:](self, "_frameForDocumentBounds:");
  -[UIView setFrame:](pdfView, "setFrame:");
  if (self->_passwordEntryView)
  {
    -[UIWebPDFViewHandler _adjustZoomScalesForScrollViewInternal:](self, "_adjustZoomScalesForScrollViewInternal:", -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0));
    v5[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke;
    v6[3] = &unk_1E16B41B8;
    v6[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke_2;
    v5[3] = &unk_1E16E8700;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v6, v5, 0.25, 0.0);
  }
  else
  {
    -[UIWebPDFViewHandler _postdidDetermineDocumentBounds](self, "_postdidDetermineDocumentBounds");
  }
}

uint64_t __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setAlpha:", 0.0);
}

uint64_t __50__UIWebPDFViewHandler_didDetermineDocumentBounds___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeFromSuperview");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_postdidDetermineDocumentBounds");
}

- (void)pdfView:(id)a3 zoomToRect:(CGRect)a4 forPoint:(CGPoint)a5 considerHeight:(BOOL)a6
{
  CGSize v7;

  self->_rectOfInterest = a4;
  self->_rectOfInterestConsidersHeight = a6;
  _UIWebDoubleTapAtLocation(self, a5.x, a5.y);
  self->_rectOfInterestConsidersHeight = 0;
  v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_rectOfInterest.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_rectOfInterest.size = v7;
}

- (void)resetZoom:(id)a3
{
  id v4;

  v4 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
  if (v4)
    objc_msgSend(v4, "setZoomScale:animated:", 1, self->_initialZoomScale);
}

- (id)passwordForPDFView:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIWebPDFViewHandlerDelegate passwordForPDFViewHandler:](self->_pdfHandlerDelegate, "passwordForPDFViewHandler:", self);
  -[UIWebPDFViewHandler _showPasswordEntryViewForFile:](self, "_showPasswordEntryViewForFile:", -[WebPDFViewPlaceholder title](-[UIWebPDFView pdfPlaceHolderView](self->_pdfView, "pdfPlaceHolderView"), "title"));
  -[UIWebPDFViewHandler adjustZoomScalesForScrollView](self, "adjustZoomScalesForScrollView");
  return 0;
}

- (void)didScroll:(id)a3
{
  if (!objc_msgSend(a3, "ignoreContentOffsetChanges"))
    -[UIWebPDFViewHandler updatePageNumberLabelWithUserScrolling:animated:](self, "updatePageNumberLabelWithUserScrolling:animated:", objc_msgSend(-[UIView _scroller](self->_pdfView, "_scroller"), "isDragging"), 0);
}

- (void)ensureCorrectPagesAreInstalled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[UIView superview](self->_pdfView, "superview"))
    -[UIWebPDFView ensureCorrectPagesAreInstalled:](self->_pdfView, "ensureCorrectPagesAreInstalled:", v3);
}

- (UIWebPDFView)pdfView
{
  return self->_pdfView;
}

- (UIView)frontView
{
  if (self->_passwordEntryView)
    return &self->_passwordEntryView->super;
  else
    return (UIView *)-[UIWebPDFViewHandler pdfView](self, "pdfView");
}

- (void)removeViewFromSuperview
{
  -[UIView removeFromSuperview](self->_passwordEntryView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_pdfView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_pageLabelView, "removeFromSuperview");
}

- (void)updateViewHierarchyForDocumentViewNewLoad:(id)a3
{
  id v5;

  v5 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:");
  if (!self->_cachedScrollViewShadowsState)
  {
    self->_showsShadowsForHTMLContent = objc_msgSend(v5, "_showsBackgroundShadow");
    self->_cachedScrollViewShadowsState = 1;
  }
  if (-[UIWebPDFViewHandler _getPDFDocumentViewForWebView:](self, "_getPDFDocumentViewForWebView:", a3))
  {
    self->_initialZoomScale = 1.0;
    -[UIWebPDFViewHandler _updateViewHierarchyForDocumentView:ignoreIfSame:](self, "_updateViewHierarchyForDocumentView:ignoreIfSame:", a3, 0);
  }
}

- (void)updateViewHierarchyForDocumentViewTabSwitch:(id)a3 restoringZoomScale:(double)a4 andScrollPt:(CGPoint)a5
{
  double y;
  double x;
  UIWebPDFView *pdfView;
  id v11;
  void *v12;

  y = a5.y;
  x = a5.x;
  pdfView = self->_pdfView;
  -[UIWebPDFView setIgnoreContentOffsetChanges:](pdfView, "setIgnoreContentOffsetChanges:", 1);
  -[UIWebPDFViewHandler _updateViewHierarchyForDocumentView:ignoreIfSame:](self, "_updateViewHierarchyForDocumentView:ignoreIfSame:", a3, 1);
  -[UIWebPDFViewHandler adjustZoomScalesForScrollView](self, "adjustZoomScalesForScrollView");
  if (self->_passwordEntryView)
  {
    if (pdfView)
LABEL_3:
      -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 0);
  }
  else
  {
    v11 = -[UIView _scroller](self->_pdfView, "_scroller");
    v12 = v11;
    if (a4 > 1.00000012)
      objc_msgSend(v11, "setZoomScale:", a4);
    objc_msgSend(v12, "_setContentOffsetPinned:animated:", 0, x, y);
    if (pdfView)
      goto LABEL_3;
  }
  -[UIWebPDFViewHandler ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 1);
}

- (void)updateViewHierarchyForDocumentViewTabSwitch:(id)a3
{
  -[UIWebPDFViewHandler updateViewHierarchyForDocumentViewTabSwitch:restoringZoomScale:andScrollPt:](self, "updateViewHierarchyForDocumentViewTabSwitch:restoringZoomScale:andScrollPt:", a3, 1.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)updateViewHierarchyForDocumentViewLoadComplete:(id)a3
{
  -[UIWebPDFViewHandler _removePDFViewIfWebDocViewIsNotPDF:](self, "_removePDFViewIfWebDocViewIsNotPDF:", a3);
  -[UIWebPDFViewHandler ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 0);
}

- (id)_getLabelViewFormatter
{
  id result;

  result = self->_labelViewFormatter;
  if (!result)
  {
    result = +[WebPDFNSNumberFormatter copyNumberFormater](WebPDFNSNumberFormatter, "copyNumberFormater");
    self->_labelViewFormatter = (WebPDFNSNumberFormatter *)result;
  }
  return result;
}

- (void)updatePageNumberLabelWithUserScrolling:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  UIWebPDFView *pdfView;
  UIWebPDFLabelView *pageLabelView;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (!self->_showPageLabels)
    goto LABEL_6;
  v5 = a4;
  if (a3 || -[UIWebPDFLabelView isTimerInstalled](self->_pageLabelView, "isTimerInstalled"))
  {
    pdfView = self->_pdfView;
    if (!pdfView || -[UIWebPDFView totalPages](pdfView, "totalPages") <= 1)
    {
LABEL_6:
      pageLabelView = self->_pageLabelView;
LABEL_7:
      -[UIWebPDFLabelView fadeOut](pageLabelView, "fadeOut", a3, a4);
      return;
    }
    v8 = -[UIWebPDFView firstVisiblePageNumber](self->_pdfView, "firstVisiblePageNumber");
    pageLabelView = self->_pageLabelView;
    if (!v8)
      goto LABEL_7;
    if (-[UIWebPDFLabelView currentPageIndex](pageLabelView, "currentPageIndex") == v8)
    {
      v9 = 0;
    }
    else
    {
      -[UIWebPDFLabelView setCurrentPageIndex:](self->_pageLabelView, "setCurrentPageIndex:", v8);
      v10 = -[UIWebPDFViewHandler _getLabelViewFormatter](self, "_getLabelViewFormatter");
      v11 = objc_msgSend(v10, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8));
      v12 = objc_msgSend(v10, "stringFromNumber:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[UIWebPDFView totalPages](self->_pdfView, "totalPages")));
      v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", _UINSLocalizedStringWithDefaultValue(CFSTR("%1$@ of %2$@"), CFSTR("%1$@ of %2$@")), v11, v12);
    }
    v13 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
    objc_msgSend(v13, "contentOffset");
    v15 = v14;
    v17 = v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIWebPDFViewHandlerDelegate originForPDFPageLabelViewWithHandler:proposedOrigin:](self->_pdfHandlerDelegate, "originForPDFPageLabelViewWithHandler:proposedOrigin:", self, v15, v17);
      v15 = v18;
      v17 = v19;
    }
    objc_msgSend(-[UIWebPDFViewHandler createPageLabel](self, "createPageLabel"), "showNowInSuperView:atOrigin:withText:animated:", v13, v9, v5, v15, v17);
  }
}

- (void)handleScrollToAnchor:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3 && -[UIView superview](self->_pdfView, "superview"))
  {
    v5 = (void *)objc_msgSend(a3, "lowercaseString");
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("page")))
      v5 = (void *)objc_msgSend(v5, "substringFromIndex:", 4);
    v6 = objc_msgSend(v5, "integerValue");
    if (v6 >= 1)
      -[UIWebPDFViewHandler scrollToPageNumber:animate:](self, "scrollToPageNumber:animate:", v6, 0);
  }
}

- (void)_resultRects:(id)a3 andResultViews:(id)a4 forSearchResult:(id)a5 inViewCoordinates:(id)a6
{
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  _UIAttributedStringView *v23;
  float v24;
  CGFloat v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  v11 = (void *)objc_msgSend(a5, "rects");
  v12 = (void *)objc_msgSend(a5, "strings");
  v13 = (void *)objc_msgSend(a5, "rotationAngles");
  v14 = objc_msgSend(v11, "count");
  v15 = objc_msgSend(v12, "count");
  if (v14 >= v15)
    v14 = v15;
  v16 = objc_msgSend(v13, "count");
  if (v14 >= v16)
    v17 = v16;
  else
    v17 = v14;
  if (v17)
  {
    for (i = 0; i != v17; ++i)
    {
      objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", i), "CGRectValue");
      objc_msgSend(a6, "convertRectFromPDFPageSpace:");
      objc_msgSend(a6, "convertRect:toView:", self->_pdfView);
      v28 = CGRectIntegral(v27);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:"));
      v23 = -[_UIAttributedStringView initWithFrame:]([_UIAttributedStringView alloc], "initWithFrame:", x, y, width, height);
      -[_UIAttributedStringView setString:](v23, "setString:", objc_msgSend(v12, "objectAtIndex:", i));
      objc_msgSend((id)objc_msgSend(v13, "objectAtIndex:", i), "floatValue");
      -[_UIAttributedStringView setTextRotationAngle:](v23, "setTextRotationAngle:", v24);
      objc_msgSend(a6, "convertRectFromPDFPageSpace:", 0.0, 0.0, 1.0, 1.0);
      objc_msgSend(a6, "convertRect:toView:", self->_pdfView);
      CGAffineTransformMakeScale(&v26, v25, v25);
      -[UIView setTransform:](v23, "setTransform:", &v26);
      objc_msgSend(a4, "addObject:", v23);

    }
  }
}

- (void)revealSearchResult:(id)a3 andZoomIn:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double x;
  double y;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  CGRect v34;
  CGRect v35;

  if (a3)
  {
    v4 = a4;
    v7 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
    if (v7)
    {
      v8 = v7;
      objc_msgSend(a3, "boundingBox");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = -[UIWebPDFView _addPageAtIndex:](self->_pdfView, "_addPageAtIndex:", objc_msgSend(a3, "pageIndex"));
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v17, "convertRectFromPDFPageSpace:", v10, v12, v14, v16);
        objc_msgSend(v18, "convertRect:toView:", self->_pdfView);
        v35 = CGRectInset(v34, -80.0, -80.0);
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
        if (v4)
        {
          objc_msgSend(v8, "zoomToRect:animated:", 1, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height);
        }
        else
        {
          if (+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"))
          {
            objc_msgSend((id)objc_msgSend(v8, "keyboardSceneDelegate"), "visibleFrameInView:", v8);
            v24 = v23;
          }
          else
          {
            v24 = *(double *)(MEMORY[0x1E0C9D628] + 24);
          }
          -[UIView convertPoint:toView:](self->_pdfView, "convertPoint:toView:", v8, x + width * 0.5, y + height * 0.5);
          v26 = v25;
          v28 = v27;
          objc_msgSend(v8, "bounds");
          v30 = v26 - v29 * 0.5;
          objc_msgSend(v8, "bounds");
          objc_msgSend(v8, "setContentOffset:animated:", 1, v30, v28 - (v31 - v24) * 0.5);
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[UIWebPDFViewHandler _resultRects:andResultViews:forSearchResult:inViewCoordinates:](self, "_resultRects:andResultViews:forSearchResult:inViewCoordinates:", v32, v33, a3, v18);
          -[UIWebPDFViewHandlerDelegate highlightSearchResultBounds:resultRects:contentViews:forPDFViewHandler:](self->_pdfHandlerDelegate, "highlightSearchResultBounds:resultRects:contentViews:forPDFViewHandler:", v32, v33, self, x, y, width, height);

        }
      }
    }
  }
}

- ($1AB5FA073B851C12C2339EC22442E995)scalesForContainerSize:(CGSize)a3
{
  double width;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  UIWebPDFView *pdfView;
  double v14;
  double v15;
  double v16;
  double v17;
  CGAffineTransform v18;
  $1AB5FA073B851C12C2339EC22442E995 result;
  CGRect v20;
  CGRect v21;

  width = a3.width;
  -[UIWebPDFView documentBounds](self->_pdfView, "documentBounds", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  pdfView = self->_pdfView;
  if (pdfView)
    -[UIWebPDFView documentTransform](pdfView, "documentTransform");
  else
    memset(&v18, 0, sizeof(v18));
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v21 = CGRectApplyAffineTransform(v20, &v18);
  v14 = width / v21.size.width;
  if (v21.size.width <= 0.0)
    v14 = 1.0;
  if (v14 >= 1.0)
    v15 = v14;
  else
    v15 = 1.0;
  v16 = 32.0;
  if (!self->_scalesPageToFit)
  {
    v16 = v15;
    v14 = v15;
  }
  v17 = v14;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v14;
  return result;
}

- (void)saveStateToHistoryItem:(id)a3 forWebView:(id)a4
{
  id v6;
  void *v7;
  double v8;
  _BOOL8 v9;

  if (!objc_msgSend(a4, "documentType"))
  {
    v6 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "contentOffset");
      objc_msgSend(a3, "_setScrollPoint:");
      objc_msgSend(v7, "zoomScale");
      v9 = self->_initialZoomScale == v8;
      *(float *)&v8 = v8;
      objc_msgSend(a3, "_setScale:isInitial:", v9, v8);
    }
  }
}

- (void)restoreStateFromPendingHistoryItem
{
  id v3;
  void *v4;
  uint64_t v5;
  double v6;

  if (self->_pendingHistoryItemRestore.restorePending)
  {
    v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
    if (v3)
    {
      v4 = v3;
      v5 = 24;
      if (!self->_pendingHistoryItemRestore.isInitialScale)
        v5 = 112;
      v6 = *(double *)((char *)&self->super.isa + v5);
      -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 1);
      objc_msgSend(v4, "setZoomScale:", v6);
      objc_msgSend(v4, "_setContentOffsetPinned:animated:", 0, self->_pendingHistoryItemRestore.contentOffset.x, self->_pendingHistoryItemRestore.contentOffset.y);
      -[UIWebPDFView setIgnoreContentOffsetChanges:](self->_pdfView, "setIgnoreContentOffsetChanges:", 0);
      self->_pendingHistoryItemRestore.restorePending = 0;
    }
  }
}

- (void)restoreStateFromHistoryItem:(id)a3 forWebView:(id)a4
{
  CGFloat v6;
  CGFloat v7;
  float v8;

  if (!objc_msgSend(a4, "documentType"))
  {
    self->_pendingHistoryItemRestore.restorePending = 1;
    self->_pendingHistoryItemRestore.isInitialScale = objc_msgSend(a3, "_scaleIsInitial");
    objc_msgSend(a3, "_scrollPoint");
    self->_pendingHistoryItemRestore.contentOffset.x = v6;
    self->_pendingHistoryItemRestore.contentOffset.y = v7;
    objc_msgSend(a3, "_scale");
    self->_pendingHistoryItemRestore.zoomScale = v8;
    if (-[UIWebPDFView _hasPageRects](self->_pdfView, "_hasPageRects"))
    {
      -[UIWebPDFViewHandler restoreStateFromPendingHistoryItem](self, "restoreStateFromPendingHistoryItem");
      -[UIWebPDFViewHandler ensureCorrectPagesAreInstalled:](self, "ensureCorrectPagesAreInstalled:", 1);
    }
  }
}

- (id)enclosingScrollView
{
  return -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
}

- (id)contentView
{
  return self->_pdfView;
}

- (double)zoomedDocumentScale
{
  id v2;
  double result;

  v2 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
  if (!v2)
    return 1.0;
  objc_msgSend(v2, "zoomScale");
  return result;
}

- (CGRect)visibleContentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIWebPDFView _viewportBoundsInUIViewCoords](self->_pdfView, "_viewportBoundsInUIViewCoords");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)minimumScaleForSize:(CGSize)a3
{
  id v3;
  double result;

  v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a3.width, a3.height);
  if (!v3)
    return 1.0;
  objc_msgSend(v3, "minimumZoomScale");
  return result;
}

- (CGRect)rectOfInterestForPoint:(CGPoint)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectOfInterest.origin.x;
  y = self->_rectOfInterest.origin.y;
  width = self->_rectOfInterest.size.width;
  height = self->_rectOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)doubleTapScalesForSize:(CGSize)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $1AB5FA073B851C12C2339EC22442E995 result;

  v3 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0, a3.width, a3.height);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "minimumZoomScale");
    v6 = v5;
    objc_msgSend(v4, "maximumZoomScale");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = 0.0;
  v10 = v6;
  result.var2 = v9;
  result.var1 = v8;
  result.var0 = v10;
  return result;
}

- (BOOL)considerHeightForDoubleTap
{
  return self->_rectOfInterestConsidersHeight;
}

- (void)updateBoundariesOfScrollView:(id)a3 withScales:(id)a4
{
  double var2;
  double var1;

  var2 = a4.var2;
  var1 = a4.var1;
  objc_msgSend(a3, "setMinimumZoomScale:", a4.var0);
  objc_msgSend(a3, "setMaximumZoomScale:", var1);
  -[UIWebPDFView setInitialZoomScale:](self->_pdfView, "setInitialZoomScale:", var2);
  self->_initialZoomScale = var2;
}

- (CGRect)rectOfInterestForRotation
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)minimumVerticalContentOffset
{
  return 0.0;
}

- (double)heightToKeepVisible
{
  return 0.0;
}

- (CGRect)activeRectForRectOfInterest:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)_pinValueForVerticalEdge:(unint64_t)a3 inScrollView:(id)a4
{
  double v4;
  double v6;
  double v7;
  double v8;
  double result;

  v4 = 0.0;
  if (a3 == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIWebPDFViewHandlerDelegate minimumVerticalContentOffsetForPDFViewHandler:](self->_pdfHandlerDelegate, "minimumVerticalContentOffsetForPDFViewHandler:", self);
      return result;
    }
  }
  else if (a3 == 2)
  {
    objc_msgSend(a4, "contentSize");
    v7 = v6;
    objc_msgSend(a4, "bounds");
    return v7 - v8;
  }
  return v4;
}

- (unint64_t)_verticalEdgeForContentOffsetInScrollView:(id)a3
{
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;

  objc_msgSend(a3, "contentOffset");
  v6 = v5;
  v7 = 1;
  -[UIWebPDFViewHandler _pinValueForVerticalEdge:inScrollView:](self, "_pinValueForVerticalEdge:inScrollView:", 1, a3);
  if (v6 > v8)
  {
    -[UIWebPDFViewHandler _pinValueForVerticalEdge:inScrollView:](self, "_pinValueForVerticalEdge:inScrollView:", 2, a3);
    if (v6 >= v9)
      return 2;
    else
      return 0;
  }
  return v7;
}

- (void)rotateEnclosingScrollViewToFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  UIDocumentPasswordView *passwordEntryView;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_passwordEntryView)
  {
    v8 = -[UIWebPDFViewHandler _scroller:](self, "_scroller:", 0);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "setFrame:", x, y, width, height);
      passwordEntryView = self->_passwordEntryView;
      -[UIWebPDFViewHandler _rectForPasswordView:](self, "_rectForPasswordView:", v9);
      -[UIView setFrame:](passwordEntryView, "setFrame:");
    }
  }
  else
  {
    _UIWebRotateToFrame(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
}

- (BOOL)showPageLabels
{
  return self->_showPageLabels;
}

- (BOOL)scalesPageToFit
{
  return self->_scalesPageToFit;
}

- (void)setScalesPageToFit:(BOOL)a3
{
  self->_scalesPageToFit = a3;
}

- (UIWebPDFViewHandlerDelegate)pdfHandlerDelegate
{
  return self->_pdfHandlerDelegate;
}

- (void)setPdfHandlerDelegate:(id)a3
{
  self->_pdfHandlerDelegate = (UIWebPDFViewHandlerDelegate *)a3;
}

- (BOOL)hidePageViewsUntilReadyToRender
{
  return self->_hidePageViewsUntilReadyToRender;
}

- (UIColor)backgroundColorForUnRenderedContent
{
  return self->_backgroundColorForUnRenderedContent;
}

- (BOOL)hideActivityIndicatorForUnRenderedContent
{
  return self->_hideActivityIndicatorForUnRenderedContent;
}

@end
