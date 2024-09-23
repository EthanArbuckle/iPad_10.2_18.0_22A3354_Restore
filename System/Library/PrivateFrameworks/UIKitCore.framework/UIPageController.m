@implementation UIPageController

- (void)dealloc
{
  uint64_t v3;
  UIView **wrapperViews;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];

  self->_viewControllers = 0;
  v3 = 0;
  self->_scrollView = 0;
  wrapperViews = self->_wrapperViews;
  do
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = -[UIView subviews](wrapperViews[v3], "subviews");
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    wrapperViews[v3++] = 0;
  }
  while (v3 != 3);
  v10.receiver = self;
  v10.super_class = (Class)UIPageController;
  -[UIViewController dealloc](&v10, sel_dealloc);
}

- (void)loadView
{
  NSMutableArray *v3;
  objc_class *v4;
  id v5;
  UIScrollView *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIPageController;
  -[UIViewController loadView](&v17, sel_loadView);
  *(_QWORD *)&self->super._viewControllerFlags &= ~0x100000uLL;
  if (!self->_viewControllers)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    self->_viewControllers = v3;
    -[NSMutableArray addObject:](v3, "addObject:", CFSTR("UnloadedViewController"));
    -[NSMutableArray addObject:](self->_viewControllers, "addObject:", CFSTR("UnloadedViewController"));
    -[NSMutableArray addObject:](self->_viewControllers, "addObject:", CFSTR("UnloadedViewController"));
  }
  v4 = (objc_class *)objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (objc_class *)-[UIPageControllerDelegate _pageControllerScrollViewClass](self->_delegate, "_pageControllerScrollViewClass");
  v5 = [v4 alloc];
  -[UIPageController _scrollViewFrame](self, "_scrollViewFrame");
  v6 = (UIScrollView *)objc_msgSend(v5, "initWithFrame:");
  -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[UIScrollView setPagingEnabled:](v6, "setPagingEnabled:", 1);
  -[UIScrollView setShowsHorizontalScrollIndicator:](v6, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](v6, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setPageController:](v6, "setPageController:", self);
  -[UIScrollView setAlwaysBounceHorizontal:](v6, "setAlwaysBounceHorizontal:", 1);
  v7 = 0;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  do
  {
    v12 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v9, v10, v11);
    self->_wrapperViews[v7] = v12;
    -[UIView addSubview:](v6, "addSubview:", v12);
    ++v7;
  }
  while (v7 != 3);
  -[UIView addSubview:](-[UIViewController view](self, "view"), "addSubview:", v6);
  -[UIView bounds](v6, "bounds");
  -[UIPageController _scrollView:boundsDidChangeToSize:](self, "_scrollView:boundsDidChangeToSize:", v6, v13, v14);
  self->_scrollView = v6;
  -[UIPageController _createPageControl](self, "_createPageControl");
  -[UIView bounds](v6, "bounds");
  -[UIPageController _scrollView:boundsDidChangeToSize:](self, "_scrollView:boundsDidChangeToSize:", v6, v15, v16);
}

- (void)viewDidUnload
{
  uint64_t v3;
  UIView **wrapperViews;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];

  v3 = 0;
  self->_scrollView = 0;
  wrapperViews = self->_wrapperViews;
  do
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = -[UIView subviews](wrapperViews[v3], "subviews");
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "removeFromSuperview");
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    wrapperViews[v3++] = 0;
  }
  while (v3 != 3);
  v10.receiver = self;
  v10.super_class = (Class)UIPageController;
  -[UIViewController viewDidUnload](&v10, sel_viewDidUnload);
}

- (void)setDelegate:(id)a3
{
  char v4;
  char v5;

  if (self->_delegate != a3)
  {
    self->_delegate = (UIPageControllerDelegate *)a3;
    *(_BYTE *)&self->_pageControllerFlags = *(_BYTE *)&self->_pageControllerFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = 2;
    else
      v4 = 0;
    *(_BYTE *)&self->_pageControllerFlags = *(_BYTE *)&self->_pageControllerFlags & 0xFD | v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 4;
    else
      v5 = 0;
    *(_BYTE *)&self->_pageControllerFlags = *(_BYTE *)&self->_pageControllerFlags & 0xFB | v5;
  }
}

- (void)setPageSpacing:(double)a3
{
  UIScrollView *scrollView;

  if ((double)self->_pageSpacing != a3)
  {
    self->_pageSpacing = (int)a3;
    if (-[UIViewController _existingView](self, "_existingView"))
    {
      scrollView = self->_scrollView;
      if (scrollView)
      {
        -[UIPageController _scrollViewFrame](self, "_scrollViewFrame");
        -[UIScrollView setFrame:](scrollView, "setFrame:");
      }
    }
  }
}

- (double)pageSpacing
{
  return (double)self->_pageSpacing;
}

- (id)_scrollView
{
  return self->_scrollView;
}

- (BOOL)_isViewControllerBeingUnloaded:(id)a3 atIndex:(int64_t)a4
{
  id v7;
  BOOL result;
  unint64_t v9;

  if (!a3)
    return 0;
  v7 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  result = 0;
  if (a3 != CFSTR("UnloadedViewController") && v7 != a3)
  {
    v9 = 0;
    do
    {
      result = a4 == v9 || -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v9) != (_QWORD)a3;
      if (v9 > 1)
        break;
      ++v9;
    }
    while (result);
  }
  return result;
}

- (void)_replaceViewControllerAtIndex:(int64_t)a3 withViewController:(id)a4
{
  id v7;
  NSMutableArray *viewControllers;
  id v9;
  _BOOL4 v10;
  UIView **wrapperViews;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (id)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  viewControllers = self->_viewControllers;
  v9 = a4;
  if (!a4)
    v9 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  -[NSMutableArray replaceObjectAtIndex:withObject:](viewControllers, "replaceObjectAtIndex:withObject:", a3, v9);
  v10 = -[UIPageController _isViewControllerBeingUnloaded:atIndex:](self, "_isViewControllerBeingUnloaded:atIndex:", v7, a3);
  if (v10)
    objc_msgSend(v7, "willMoveToParentViewController:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  wrapperViews = self->_wrapperViews;
  v12 = -[UIView subviews](self->_wrapperViews[a3], "subviews", 0);
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "removeFromSuperview");
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }
  if (v10)
    objc_msgSend(v7, "removeFromParentViewController");

  if (a4 != CFSTR("UnloadedViewController") && a4)
  {
    v17 = (void *)objc_msgSend(a4, "view");
    -[UIView bounds](wrapperViews[a3], "bounds");
    objc_msgSend(v17, "setFrame:");
    -[UIView addSubview:](wrapperViews[a3], "addSubview:", v17);
  }
  -[UIPageController _adjustScrollViewContentInsets](self, "_adjustScrollViewContentInsets");
}

- (void)_setPreviousViewController:(id)a3
{
  -[UIPageController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", 0, a3);
}

- (void)_setVisibleViewController:(id)a3
{
  -[UIPageController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", 1, a3);
}

- (void)_setNextViewController:(id)a3
{
  -[UIPageController _replaceViewControllerAtIndex:withViewController:](self, "_replaceViewControllerAtIndex:withViewController:", 2, a3);
}

- (BOOL)_needToLoadPrevious
{
  return -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0) == (_QWORD)CFSTR("UnloadedViewController");
}

- (BOOL)_needToLoadVisible
{
  return -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 1) == (_QWORD)CFSTR("UnloadedViewController");
}

- (BOOL)_needToLoadNext
{
  return -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 2) == (_QWORD)CFSTR("UnloadedViewController");
}

- (id)_loadPreviousViewController
{
  id v3;
  id v4;
  int64_t pageCount;
  int64_t visibleIndex;
  char pageControllerFlags;
  UIPageControllerDelegate *delegate;
  UIPageController *v10;
  uint64_t v11;
  BOOL v12;
  __CFString *v14;

  v3 = -[UIPageController _visibleViewController](self, "_visibleViewController");
  if (!v3)
    goto LABEL_26;
  v4 = v3;
  pageCount = self->_pageCount;
  if (!pageCount)
  {
    if ((*(_BYTE *)&self->_pageControllerFlags & 1) != 0)
      goto LABEL_26;
LABEL_13:
    v11 = -[UIPageControllerDelegate pageController:viewControllerLeftOfController:](self->_delegate, "pageController:viewControllerLeftOfController:", self, v3);
    goto LABEL_23;
  }
  visibleIndex = self->_visibleIndex;
  pageControllerFlags = (char)self->_pageControllerFlags;
  if (visibleIndex <= 0 && (pageCount < 3 || (pageControllerFlags & 0x10) == 0))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_pageControllerFlags & 1) == 0)
    goto LABEL_13;
  v4 = (id)(pageCount - 1);
  if (pageCount < 1)
  {
LABEL_26:
    -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", 0, v4);
    return 0;
  }
  if (visibleIndex < 1)
  {
    if (visibleIndex)
      v12 = 0;
    else
      v12 = (unint64_t)pageCount >= 3;
    if (!v12 || (pageControllerFlags & 0x10) == 0)
      goto LABEL_26;
    delegate = self->_delegate;
    v10 = self;
  }
  else
  {
    delegate = self->_delegate;
    v10 = self;
    v4 = (id)(visibleIndex - 1);
  }
  v11 = -[UIPageControllerDelegate pageController:viewControllerAtIndex:](delegate, "pageController:viewControllerAtIndex:", v10, v4);
LABEL_23:
  v14 = (__CFString *)v11;
  if (!v11)
    goto LABEL_26;
  -[UIViewController addChildViewController:](self, "addChildViewController:", v11);
  -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", v14);
  if (v14 == CFSTR("UnloadedViewController"))
    return CFSTR("UnloadedViewController");
  -[__CFString didMoveToParentViewController:](v14, "didMoveToParentViewController:", self);
  return v14;
}

- (id)_loadVisibleViewControllerAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v5;
  uint64_t v6;

  v3 = a3;
  if ((*(_BYTE *)&self->_pageControllerFlags & 1) != 0)
  {
    if (self->_pageCount < 1)
      goto LABEL_10;
    v6 = -[UIPageControllerDelegate pageController:viewControllerAtIndex:](self->_delegate, "pageController:viewControllerAtIndex:", self, self->_visibleIndex);
  }
  else
  {
    v5 = (__CFString *)-[UIPageControllerDelegate pageController:viewControllerLeftOfController:](self->_delegate, "pageController:viewControllerLeftOfController:", self, 0);
    if (v5)
      goto LABEL_7;
    v6 = -[UIPageControllerDelegate pageController:viewControllerRightOfController:](self->_delegate, "pageController:viewControllerRightOfController:", self, 0);
  }
  v5 = (__CFString *)v6;
  if (!v6)
  {
LABEL_10:
    -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", 0);
    v5 = 0;
    if (!v3)
      return v5;
    goto LABEL_13;
  }
LABEL_7:
  -[UIViewController addChildViewController:](self, "addChildViewController:", v5);
  -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", v5);
  if (v5 == CFSTR("UnloadedViewController"))
  {
    v5 = CFSTR("UnloadedViewController");
    if (!v3)
      return v5;
  }
  else
  {
    -[__CFString didMoveToParentViewController:](v5, "didMoveToParentViewController:", self);
    if (!v3)
      return v5;
  }
LABEL_13:
  if (((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3u) - 1 <= 1)
  {
    -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 1, 0);
    -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 2, 0);
  }
  return v5;
}

- (id)_loadNextViewController
{
  id v3;
  int64_t pageCount;
  int64_t visibleIndex;
  int64_t v6;
  char pageControllerFlags;
  UIPageControllerDelegate *delegate;
  int64_t v10;
  UIPageController *v11;
  uint64_t v12;
  __CFString *v15;

  v3 = -[UIPageController _visibleViewController](self, "_visibleViewController");
  if (!v3)
    goto LABEL_26;
  pageCount = self->_pageCount;
  if (!pageCount)
  {
    if ((*(_BYTE *)&self->_pageControllerFlags & 1) != 0)
      goto LABEL_26;
LABEL_13:
    v12 = -[UIPageControllerDelegate pageController:viewControllerRightOfController:](self->_delegate, "pageController:viewControllerRightOfController:", self, v3);
    goto LABEL_23;
  }
  visibleIndex = self->_visibleIndex;
  v6 = pageCount - 1;
  pageControllerFlags = (char)self->_pageControllerFlags;
  if (visibleIndex >= pageCount - 1 && (pageCount < 3 || (pageControllerFlags & 0x10) == 0))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_pageControllerFlags & 1) == 0)
    goto LABEL_13;
  if (pageCount < 1)
  {
LABEL_26:
    -[UIPageController _setNextViewController:](self, "_setNextViewController:", 0);
    return 0;
  }
  if (visibleIndex >= v6)
  {
    if (visibleIndex != v6 || (unint64_t)pageCount < 3 || (pageControllerFlags & 0x10) == 0)
      goto LABEL_26;
    delegate = self->_delegate;
    v11 = self;
    v10 = 0;
  }
  else
  {
    delegate = self->_delegate;
    v10 = visibleIndex + 1;
    v11 = self;
  }
  v12 = -[UIPageControllerDelegate pageController:viewControllerAtIndex:](delegate, "pageController:viewControllerAtIndex:", v11, v10);
LABEL_23:
  v15 = (__CFString *)v12;
  if (!v12)
    goto LABEL_26;
  -[UIViewController addChildViewController:](self, "addChildViewController:", v12);
  -[UIPageController _setNextViewController:](self, "_setNextViewController:", v15);
  if (v15 == CFSTR("UnloadedViewController"))
    return CFSTR("UnloadedViewController");
  -[__CFString didMoveToParentViewController:](v15, "didMoveToParentViewController:", self);
  return v15;
}

- (id)_previousViewController
{
  __CFString *v3;

  v3 = (__CFString *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 0);
  if (v3 == CFSTR("UnloadedViewController"))
    v3 = -[UIPageController _loadPreviousViewController](self, "_loadPreviousViewController");
  if (v3 == (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    return 0;
  else
    return v3;
}

- (id)_visibleViewController
{
  __CFString *v3;

  v3 = (__CFString *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 1);
  if (v3 == CFSTR("UnloadedViewController"))
    v3 = -[UIPageController _loadVisibleViewControllerAndNotify:](self, "_loadVisibleViewControllerAndNotify:", 0);
  if (v3 == (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    return 0;
  else
    return v3;
}

- (id)_nextViewController
{
  __CFString *v3;

  v3 = (__CFString *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", 2);
  if (v3 == CFSTR("UnloadedViewController"))
    v3 = -[UIPageController _loadNextViewController](self, "_loadNextViewController");
  if (v3 == (__CFString *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    return 0;
  else
    return v3;
}

- (BOOL)_hasPreviousViewController
{
  int64_t pageCount;

  pageCount = self->_pageCount;
  if (!pageCount)
    return -[UIPageController _previousViewController](self, "_previousViewController") != 0;
  if (self->_visibleIndex > 0)
    return 1;
  if (pageCount > 2)
    return (*(_BYTE *)&self->_pageControllerFlags & 0x10) != 0;
  return 0;
}

- (BOOL)_hasVisibleViewController
{
  return -[UIPageController _visibleViewController](self, "_visibleViewController") != 0;
}

- (BOOL)_hasNextViewController
{
  int64_t pageCount;

  pageCount = self->_pageCount;
  if (!pageCount)
    return -[UIPageController _nextViewController](self, "_nextViewController") != 0;
  if (self->_visibleIndex < pageCount - 1)
    return 1;
  if (pageCount > 2)
    return (*(_BYTE *)&self->_pageControllerFlags & 0x10) != 0;
  return 0;
}

- (UIViewController)visibleViewController
{
  return (UIViewController *)-[UIPageController _visibleViewController](self, "_visibleViewController");
}

- (void)_notifyViewController:(id)a3 ofState:(int)a4 previousState:(int)a5 animated:(BOOL)a6
{
  _BOOL8 v6;

  if (a4 != a5)
  {
    v6 = a6;
    switch(a4)
    {
      case 1:
        if (a5 == 3)
          -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", a3, 4, *(_QWORD *)&a5, a6);
        objc_msgSend(a3, "__viewWillAppear:", v6);
        break;
      case 2:
        if (a5 != 1)
          -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", a3, 1, *(_QWORD *)&a5, a6);
        objc_msgSend(a3, "__viewDidAppear:", v6);
        break;
      case 3:
        if (a5 == 1)
          -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", a3, 2, *(_QWORD *)&a5, a6);
        -[UIViewController __viewWillDisappear:]((uint64_t)a3, v6);
        break;
      case 4:
        if (a5 != 3)
          -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", a3, 3, *(_QWORD *)&a5, a6);
        -[UIViewController __viewDidDisappear:]((uint64_t)a3, v6);
        break;
      default:
        return;
    }
  }
}

- (void)_setPreviousViewControllerNotificationState:(int)a3
{
  self->_notificationState[0] = a3;
}

- (void)_setVisibleViewControllerNotificationState:(int)a3
{
  self->_notificationState[1] = a3;
}

- (void)_setNextViewControllerNotificationState:(int)a3
{
  self->_notificationState[2] = a3;
}

- (int)_previousViewControllerNotificationState
{
  return self->_notificationState[0];
}

- (int)_visibleViewControllerNotificationState
{
  return self->_notificationState[1];
}

- (int)_nextViewControllerNotificationState
{
  return self->_notificationState[2];
}

- (void)_notifyPreviousViewController:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (-[UIPageController _previousViewController](self, "_previousViewController"))
  {
    -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", -[UIPageController _previousViewController](self, "_previousViewController"), v5, -[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState"), v4);
    self->_notificationState[0] = v5;
  }
}

- (void)_notifyVisibleViewController:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (-[UIPageController _visibleViewController](self, "_visibleViewController"))
  {
    -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", -[UIPageController _visibleViewController](self, "_visibleViewController"), v5, -[UIPageController _visibleViewControllerNotificationState](self, "_visibleViewControllerNotificationState"), v4);
    self->_notificationState[1] = v5;
  }
}

- (void)_notifyNextViewController:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (-[UIPageController _nextViewController](self, "_nextViewController"))
  {
    -[UIPageController _notifyViewController:ofState:previousState:animated:](self, "_notifyViewController:ofState:previousState:animated:", -[UIPageController _nextViewController](self, "_nextViewController"), v5, -[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState"), v4);
    self->_notificationState[2] = v5;
  }
}

- (void)_scrollViewWillBeginPaging
{
  UIView **wrapperViews;

  if ((*(_BYTE *)&self->_pageControllerFlags & 6) != 0)
  {
    if ((*(_BYTE *)&self->_pageControllerFlags & 2) != 0)
      -[UIPageControllerDelegate pageControllerWillBeginPaging:](self->_delegate, "pageControllerWillBeginPaging:");
  }
  else
  {
    wrapperViews = self->_wrapperViews;
    -[UIView setUserInteractionEnabled:](self->_wrapperViews[0], "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](wrapperViews[1], "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](wrapperViews[2], "setUserInteractionEnabled:", 0);
  }
}

- (void)_scrollViewDidEndPaging
{
  if ((*(_BYTE *)&self->_pageControllerFlags & 6) != 0)
  {
    if ((*(_BYTE *)&self->_pageControllerFlags & 4) != 0)
      -[UIPageControllerDelegate pageControllerDidEndPaging:](self->_delegate, "pageControllerDidEndPaging:", self);
  }
  else
  {
    -[UIView setUserInteractionEnabled:](self->_wrapperViews[0], "setUserInteractionEnabled:", 1);
    -[UIView setUserInteractionEnabled:](self->_wrapperViews[1], "setUserInteractionEnabled:", 1);
    -[UIView setUserInteractionEnabled:](self->_wrapperViews[2], "setUserInteractionEnabled:", 1);
  }
  if (-[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState"))
  {
    -[UIPageController _notifyPreviousViewController:animated:](self, "_notifyPreviousViewController:animated:", 4, 1);
  }
  else if (-[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState"))
  {
    -[UIPageController _notifyNextViewController:animated:](self, "_notifyNextViewController:animated:", 4, 1);
  }
  -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 2, 1);
}

- (void)_adjustScrollViewContentInsets
{
  id v3;
  double v4;
  double v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int64_t pageCount;
  int64_t visibleIndex;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = -[UIPageController _scrollView](self, "_scrollView");
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = -[UIPageController _hasPreviousViewController](self, "_hasPreviousViewController");
  v7 = -[UIPageController _hasNextViewController](self, "_hasNextViewController");
  pageCount = self->_pageCount;
  if (pageCount)
  {
    visibleIndex = self->_visibleIndex;
    v10 = fmax(v5 * (double)visibleIndex, 0.0);
    v11 = fmax(v5 * (double)(pageCount + ~visibleIndex), 0.0);
  }
  else
  {
    v10 = v5 * 100.0;
    v11 = v5 * 100.0;
  }
  v12 = -v5;
  if (v6)
    v13 = v10;
  else
    v13 = -v5;
  if (v7)
    v12 = v11;
  objc_msgSend(v3, "setContentInset:", 0.0, v13, 0.0, v12);
}

- (void)_scrollView:(id)a3 boundsDidChangeToSize:(CGSize)a4
{
  double height;
  double width;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a3, "setContentSize:", a4.width * 3.0);
  objc_msgSend(a3, "setContentOffset:", width, 0.0);
  -[UIView setFrame:](self->_wrapperViews[0], "setFrame:", (double)self->_pageSpacing, 0.0, width - (double)(2 * self->_pageSpacing), height);
  -[UIView setFrame:](self->_wrapperViews[1], "setFrame:", width + (double)self->_pageSpacing, 0.0, width - (double)(2 * self->_pageSpacing), height);
  -[UIView setFrame:](self->_wrapperViews[2], "setFrame:", width + width + (double)self->_pageSpacing, 0.0, width - (double)(2 * self->_pageSpacing), height);
  -[UIPageController _adjustScrollViewContentInsets](self, "_adjustScrollViewContentInsets");
}

- (void)_scrollViewDidScroll:(id)a3 forceUpdate:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v13;
  id v14;
  int64_t visibleIndex;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;

  if (!a4
    && ((objc_msgSend(a3, "isTracking") & 1) == 0
     && (objc_msgSend(a3, "isDecelerating") & 1) == 0
     && !objc_msgSend(a3, "isScrollAnimating")
     || (objc_msgSend(a3, "_isHorizontalBouncing") & 1) != 0))
  {
    return;
  }
  objc_msgSend(a3, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = -[UIPageController _hasPreviousViewController](self, "_hasPreviousViewController");
  v11 = -[UIPageController _hasNextViewController](self, "_hasNextViewController");
  v12 = v7 > v9 && v11;
  if (v10
    && v7 < v9
    && -[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState") != 1)
  {
    if (-[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState"))
      -[UIPageController _notifyNextViewController:animated:](self, "_notifyNextViewController:animated:", 4, 1);
    -[UIPageController _notifyPreviousViewController:animated:](self, "_notifyPreviousViewController:animated:", 1, 1);
  }
  else
  {
    if (!v12
      || -[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState") == 1)
    {
      goto LABEL_21;
    }
    if (-[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState"))
      -[UIPageController _notifyPreviousViewController:animated:](self, "_notifyPreviousViewController:animated:", 4, 1);
    -[UIPageController _notifyNextViewController:animated:](self, "_notifyNextViewController:animated:", 1, 1);
  }
  -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 3, 1);
LABEL_21:
  v13 = -[UIPageController _previousViewController](self, "_previousViewController");
  v14 = -[UIPageController _nextViewController](self, "_nextViewController");
  if (v13 && v7 <= 0.0)
  {
    -[UIPageController _setNextViewController:](self, "_setNextViewController:", -[UIPageController _visibleViewController](self, "_visibleViewController"));
    -[UIPageController _setNextViewControllerNotificationState:](self, "_setNextViewControllerNotificationState:", -[UIPageController _visibleViewControllerNotificationState](self, "_visibleViewControllerNotificationState"));
    -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", -[UIPageController _previousViewController](self, "_previousViewController"));
    -[UIPageController _setVisibleViewControllerNotificationState:](self, "_setVisibleViewControllerNotificationState:", -[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState"));
    -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", CFSTR("UnloadedViewController"));
    -[UIPageController _setPreviousViewControllerNotificationState:](self, "_setPreviousViewControllerNotificationState:", 0);
    objc_msgSend(a3, "setContentOffset:", v7 + v9, 0.0);
    visibleIndex = self->_visibleIndex;
    if ((*(_BYTE *)&self->_pageControllerFlags & 0x10) != 0)
    {
      if (visibleIndex <= 0)
        visibleIndex = self->_pageCount;
    }
    else if (visibleIndex <= 1)
    {
      visibleIndex = 1;
    }
    self->_visibleIndex = visibleIndex - 1;
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
    -[UIPageController _loadPreviousViewController](self, "_loadPreviousViewController");
LABEL_43:
    -[UIPageController _adjustScrollViewContentInsets](self, "_adjustScrollViewContentInsets");
    return;
  }
  if (v14 && v7 >= v9 + v9)
  {
    -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", -[UIPageController _visibleViewController](self, "_visibleViewController"));
    -[UIPageController _setPreviousViewControllerNotificationState:](self, "_setPreviousViewControllerNotificationState:", -[UIPageController _visibleViewControllerNotificationState](self, "_visibleViewControllerNotificationState"));
    -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", -[UIPageController _nextViewController](self, "_nextViewController"));
    -[UIPageController _setVisibleViewControllerNotificationState:](self, "_setVisibleViewControllerNotificationState:", -[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState"));
    -[UIPageController _setNextViewController:](self, "_setNextViewController:", CFSTR("UnloadedViewController"));
    -[UIPageController _setNextViewControllerNotificationState:](self, "_setNextViewControllerNotificationState:", 0);
    objc_msgSend(a3, "setContentOffset:", v7 - v9, 0.0);
    if ((*(_BYTE *)&self->_pageControllerFlags & 0x10) != 0)
    {
      v18 = self->_visibleIndex;
      if (v18 < self->_pageCount - 1)
        v19 = v18 + 1;
      else
        v19 = 0;
      self->_visibleIndex = v19;
    }
    else
    {
      v16 = self->_visibleIndex;
      if (self->_pageCount - 1 >= v16 + 1)
        v17 = v16 + 1;
      else
        v17 = self->_pageCount - 1;
      self->_visibleIndex = v17;
    }
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:");
    -[UIPageController _loadNextViewController](self, "_loadNextViewController");
    goto LABEL_43;
  }
}

- (CGRect)_scrollViewFrame
{
  double v3;
  double v4;
  int pageSpacing;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[UIView bounds](-[UIViewController view](self, "view"), "bounds");
  pageSpacing = self->_pageSpacing;
  v7 = v6 - (double)pageSpacing;
  v9 = v8 + (double)(2 * pageSpacing);
  result.size.height = v4;
  result.size.width = v9;
  result.origin.y = v3;
  result.origin.x = v7;
  return result;
}

- (int64_t)visibleIndex
{
  return self->_visibleIndex;
}

- (void)setVisibleIndex:(int64_t)a3 animated:(BOOL)a4
{
  -[UIPageController setVisibleIndex:preservingLoadedViewControllers:animated:](self, "setVisibleIndex:preservingLoadedViewControllers:animated:", a3, 1, a4);
}

- (void)setVisibleIndex:(int64_t)a3
{
  -[UIPageController setVisibleIndex:preservingLoadedViewControllers:animated:](self, "setVisibleIndex:preservingLoadedViewControllers:animated:", a3, 1, 0);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  int64_t pageCount;
  int64_t *p_visibleIndex;
  int64_t visibleIndex;

  pageCount = self->_pageCount;
  self->_pageCount = a3;
  if (!a3 || !pageCount)
  {
    -[UIPageController setVisibleIndex:](self, "setVisibleIndex:", 0);
    p_visibleIndex = &self->_visibleIndex;
    -[UIPageController reloadViewControllerAtIndex:](self, "reloadViewControllerAtIndex:", self->_visibleIndex - 1);
    -[UIPageController reloadViewControllerAtIndex:](self, "reloadViewControllerAtIndex:", self->_visibleIndex);
LABEL_11:
    visibleIndex = *p_visibleIndex;
LABEL_12:
    -[UIPageController reloadViewControllerAtIndex:](self, "reloadViewControllerAtIndex:", visibleIndex + 1);
    return;
  }
  p_visibleIndex = &self->_visibleIndex;
  visibleIndex = self->_visibleIndex;
  if (pageCount < a3 && visibleIndex == pageCount - 1)
    goto LABEL_12;
  if (visibleIndex >= a3 - 1)
  {
    -[UIPageController setVisibleIndex:](self, "setVisibleIndex:");
    goto LABEL_11;
  }
}

- (BOOL)wraps
{
  return (*(_BYTE *)&self->_pageControllerFlags >> 4) & 1;
}

- (void)setWraps:(BOOL)a3
{
  char pageControllerFlags;
  char v5;
  id v6;
  id v7;

  pageControllerFlags = (char)self->_pageControllerFlags;
  if (((((pageControllerFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    v5 = a3 ? 16 : 0;
    *(_BYTE *)&self->_pageControllerFlags = pageControllerFlags & 0xEF | v5;
    if (a3)
    {
      if (!-[UIPageController _needToLoadPrevious](self, "_needToLoadPrevious"))
      {
        v6 = -[UIPageController _previousViewController](self, "_previousViewController");
        if (v6 == (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
          -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", CFSTR("UnloadedViewController"));
      }
      if (!-[UIPageController _needToLoadNext](self, "_needToLoadNext"))
      {
        v7 = -[UIPageController _nextViewController](self, "_nextViewController");
        if (v7 == (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
          -[UIPageController _setNextViewController:](self, "_setNextViewController:", CFSTR("UnloadedViewController"));
      }
    }
  }
}

- (BOOL)displaysPageControl
{
  return (*(_BYTE *)&self->_pageControllerFlags >> 3) & 1;
}

- (void)_pageChanged:(id)a3
{
  -[UIPageController setVisibleIndex:animated:](self, "setVisibleIndex:animated:", objc_msgSend(a3, "currentPage"), 1);
}

- (void)_createPageControl
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
  double v14;
  double v15;
  double v16;
  UIPageControl *pageControl;
  double v18;
  CGRect v19;

  if ((*(_BYTE *)&self->_pageControllerFlags & 8) != 0)
  {
    -[UIView frame](self->_scrollView, "frame");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    self->_pageControl = objc_alloc_init(UIPageControl);
    -[UIView addSubview:](-[UIViewController view](self, "view"), "addSubview:", self->_pageControl);
    -[UIControl addTarget:action:forControlEvents:](self->_pageControl, "addTarget:action:forControlEvents:", self, sel__pageChanged_, 4096);
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", self->_pageCount);
    -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", self->_visibleIndex);
    -[UIView sizeToFit](self->_pageControl, "sizeToFit");
    -[UIView frame](self->_pageControl, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    pageControl = self->_pageControl;
    -[UIView bounds](-[UIViewController view](self, "view"), "bounds");
    -[UIView setFrame:](pageControl, "setFrame:", v12, CGRectGetMaxY(v19) - v16, v14, v16);
    -[UIView setAutoresizingMask:](self->_pageControl, "setAutoresizingMask:", 10);
    -[UIView frame](self->_pageControl, "frame");
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10 - v18);
  }
}

- (void)setDisplaysPageControl:(BOOL)a3
{
  char pageControllerFlags;
  char v5;

  pageControllerFlags = (char)self->_pageControllerFlags;
  if (((((pageControllerFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 8;
    else
      v5 = 0;
    *(_BYTE *)&self->_pageControllerFlags = pageControllerFlags & 0xF7 | v5;
    if (a3 && -[UIViewController _existingView](self, "_existingView"))
    {
      -[UIPageController _createPageControl](self, "_createPageControl");
    }
    else
    {
      -[UIView removeFromSuperview](self->_pageControl, "removeFromSuperview");

      self->_pageControl = 0;
    }
  }
}

- (int64_t)indexOfViewController:(id)a3
{
  uint64_t v4;
  int64_t result;
  int64_t pageCount;

  v4 = -[NSMutableArray indexOfObject:](self->_viewControllers, "indexOfObject:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  pageCount = self->_pageCount;
  result = v4 + self->_visibleIndex - 1;
  if (result < 0)
  {
    result += pageCount;
  }
  else if (result >= pageCount)
  {
    result %= pageCount;
  }
  return result;
}

- (BOOL)_allowsAutorotation
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  v3 = -[UIViewController _allowsAutorotation](&v5, sel__allowsAutorotation);
  if (-[UIPageController _visibleViewController](self, "_visibleViewController"))
    v3 &= objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "_allowsAutorotation");
  return v3;
}

- (BOOL)_doesVisibleViewControllerSupportInterfaceOrientation:(int64_t)a3
{
  if (-[UIPageController _visibleViewController](self, "_visibleViewController"))
    return objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "_isSupportedInterfaceOrientation:", a3);
  else
    return 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if (objc_msgSend((id)objc_opt_class(), "_doesOverrideLegacyShouldAutorotateMethod"))
    return -[UIPageController shouldAutorotateToInterfaceOrientation:](self, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    return -[UIPageController _doesVisibleViewControllerSupportInterfaceOrientation:](self, "_doesVisibleViewControllerSupportInterfaceOrientation:", a3);
}

- (id)rotatingHeaderView
{
  return (id)objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "rotatingHeaderView");
}

- (id)rotatingFooterView
{
  return (id)objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "rotatingFooterView");
}

- (BOOL)_shouldUseOnePartRotation
{
  return objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "_shouldUseOnePartRotation");
}

- (void)_getRotationContentSettings:(id *)a3
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "_getRotationContentSettings:", a3);
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "willRotateToInterfaceOrientation:duration:", a3, a4);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "willAnimateRotationToInterfaceOrientation:duration:", a3, a4);
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "willAnimateFirstHalfOfRotationToInterfaceOrientation:duration:", a3, a4);
}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "didAnimateFirstHalfOfRotationToInterfaceOrientation:", a3);
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "willAnimateSecondHalfOfRotationFromInterfaceOrientation:duration:", a3, a4);
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(-[UIPageController _visibleViewController](self, "_visibleViewController"), "didRotateFromInterfaceOrientation:", a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 1, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_);
  -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 2, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 3, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIPageController;
  -[UIViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 4, v3);
}

- (UIPageControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setVisibleIndex:(int64_t)a3 preservingLoadedViewControllers:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  int64_t pageCount;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  UIScrollView *scrollView;
  double v15;
  double v16;
  unsigned int v17;
  int64_t visibleIndex;
  const __CFString *v19;
  const __CFString *v20;
  UIPageController *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;

  v5 = a4;
  pageCount = self->_pageCount;
  if (pageCount <= 1)
    pageCount = 1;
  v8 = pageCount - 1;
  if (v8 >= (a3 & ~(a3 >> 63)))
    v9 = a3 & ~(a3 >> 63);
  else
    v9 = v8;
  v10 = v9 - self->_visibleIndex;
  if (v10 || !a4)
  {
    if (a5)
    {
      v11 = (double)v10;
      -[UIView bounds](self->_scrollView, "bounds");
      v13 = v12 * v11;
      scrollView = self->_scrollView;
      -[UIScrollView contentOffset](scrollView, "contentOffset");
      v16 = v15 + v13;
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      -[UIScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", 1, v16);
      return;
    }
    v17 = ((*(_DWORD *)&self->super._viewControllerFlags >> 1) & 3) - 1;
    if (v17 <= 1
      && !-[UIPageController _needToLoadVisible](self, "_needToLoadVisible")
      && -[UIPageController _hasVisibleViewController](self, "_hasVisibleViewController"))
    {
      -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 3, 0);
    }
    if (!v5)
      goto LABEL_74;
    visibleIndex = self->_visibleIndex;
    if (v9 == visibleIndex + 1)
    {
      if (v17 <= 1
        && !-[UIPageController _needToLoadNext](self, "_needToLoadNext")
        && -[UIPageController _hasNextViewController](self, "_hasNextViewController"))
      {
        -[UIPageController _notifyNextViewController:animated:](self, "_notifyNextViewController:animated:", 1, 0);
      }
      if (-[UIPageController _needToLoadVisible](self, "_needToLoadVisible"))
        v19 = CFSTR("UnloadedViewController");
      else
        v19 = -[UIPageController _visibleViewController](self, "_visibleViewController");
      -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", v19);
      if (-[UIPageController _needToLoadVisible](self, "_needToLoadVisible"))
        v22 = 0;
      else
        v22 = -[UIPageController _visibleViewControllerNotificationState](self, "_visibleViewControllerNotificationState");
      -[UIPageController _setPreviousViewControllerNotificationState:](self, "_setPreviousViewControllerNotificationState:", v22);
      if (-[UIPageController _needToLoadNext](self, "_needToLoadNext"))
        v23 = CFSTR("UnloadedViewController");
      else
        v23 = -[UIPageController _nextViewController](self, "_nextViewController");
      -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", v23);
      if (-[UIPageController _needToLoadNext](self, "_needToLoadNext"))
        v24 = 0;
      else
        v24 = -[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState");
      -[UIPageController _setVisibleViewControllerNotificationState:](self, "_setVisibleViewControllerNotificationState:", v24);
      -[UIPageController _setNextViewController:](self, "_setNextViewController:", CFSTR("UnloadedViewController"));
      -[UIPageController _setNextViewControllerNotificationState:](self, "_setNextViewControllerNotificationState:", 0);
      goto LABEL_47;
    }
    if (v9 == visibleIndex - 1)
    {
      if (v17 <= 1
        && !-[UIPageController _needToLoadPrevious](self, "_needToLoadPrevious")
        && -[UIPageController _hasPreviousViewController](self, "_hasPreviousViewController"))
      {
        -[UIPageController _notifyPreviousViewController:animated:](self, "_notifyPreviousViewController:animated:", 1, 0);
      }
      if (-[UIPageController _needToLoadVisible](self, "_needToLoadVisible"))
        v20 = CFSTR("UnloadedViewController");
      else
        v20 = -[UIPageController _visibleViewController](self, "_visibleViewController");
      -[UIPageController _setNextViewController:](self, "_setNextViewController:", v20);
      if (-[UIPageController _needToLoadVisible](self, "_needToLoadVisible"))
        v25 = 0;
      else
        v25 = -[UIPageController _visibleViewControllerNotificationState](self, "_visibleViewControllerNotificationState");
      -[UIPageController _setNextViewControllerNotificationState:](self, "_setNextViewControllerNotificationState:", v25);
      if (-[UIPageController _needToLoadPrevious](self, "_needToLoadPrevious"))
        v26 = CFSTR("UnloadedViewController");
      else
        v26 = -[UIPageController _previousViewController](self, "_previousViewController");
      -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", v26);
      if (-[UIPageController _needToLoadPrevious](self, "_needToLoadPrevious"))
        v27 = 0;
      else
        v27 = -[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState");
      -[UIPageController _setVisibleViewControllerNotificationState:](self, "_setVisibleViewControllerNotificationState:", v27);
      v21 = self;
    }
    else
    {
LABEL_74:
      if (v17 <= 1
        && !-[UIPageController _needToLoadVisible](self, "_needToLoadVisible")
        && -[UIPageController _hasVisibleViewController](self, "_hasVisibleViewController"))
      {
        -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 4, 0);
      }
      -[UIPageController _setNextViewController:](self, "_setNextViewController:", CFSTR("UnloadedViewController"));
      -[UIPageController _setNextViewControllerNotificationState:](self, "_setNextViewControllerNotificationState:", 0);
      -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", CFSTR("UnloadedViewController"));
      -[UIPageController _setVisibleViewControllerNotificationState:](self, "_setVisibleViewControllerNotificationState:", 0);
      v21 = self;
    }
    -[UIPageController _setPreviousViewController:](v21, "_setPreviousViewController:", CFSTR("UnloadedViewController"));
    -[UIPageController _setPreviousViewControllerNotificationState:](self, "_setPreviousViewControllerNotificationState:", 0);
LABEL_47:
    self->_visibleIndex = v9;
    if (v17 <= 1)
    {
      if (!-[UIPageController _needToLoadNext](self, "_needToLoadNext")
        && -[UIPageController _hasNextViewController](self, "_hasNextViewController")
        && -[UIPageController _nextViewControllerNotificationState](self, "_nextViewControllerNotificationState") == 3)
      {
        -[UIPageController _notifyNextViewController:animated:](self, "_notifyNextViewController:animated:", 4, 0);
      }
      else if (!-[UIPageController _needToLoadPrevious](self, "_needToLoadPrevious")
             && -[UIPageController _hasPreviousViewController](self, "_hasPreviousViewController")
             && -[UIPageController _previousViewControllerNotificationState](self, "_previousViewControllerNotificationState") == 3)
      {
        -[UIPageController _notifyPreviousViewController:animated:](self, "_notifyPreviousViewController:animated:", 4, 0);
      }
      if (!-[UIPageController _needToLoadVisible](self, "_needToLoadVisible")
        && -[UIPageController _hasVisibleViewController](self, "_hasVisibleViewController"))
      {
        -[UIPageController _notifyVisibleViewController:animated:](self, "_notifyVisibleViewController:animated:", 2, 0);
      }
    }
    if (-[UIPageController _needToLoadVisible](self, "_needToLoadVisible"))
      -[UIPageController _loadVisibleViewControllerAndNotify:](self, "_loadVisibleViewControllerAndNotify:", v17 < 2);
  }
}

- (void)reloadViewControllerAtIndex:(int64_t)a3
{
  int64_t visibleIndex;
  int64_t v6;

  visibleIndex = self->_visibleIndex;
  if (visibleIndex - 1 <= a3 && visibleIndex + 1 >= a3)
  {
    v6 = a3 - visibleIndex + 1;
    switch(v6)
    {
      case 2:
        -[UIPageController _setNextViewController:](self, "_setNextViewController:", CFSTR("UnloadedViewController"));
        -[UIPageController _setNextViewControllerNotificationState:](self, "_setNextViewControllerNotificationState:", 0);
        break;
      case 1:
        -[UIPageController _setVisibleViewController:](self, "_setVisibleViewController:", CFSTR("UnloadedViewController"));
        -[UIPageController _setVisibleViewControllerNotificationState:](self, "_setVisibleViewControllerNotificationState:", 0);
        -[UIPageController _loadVisibleViewControllerAndNotify:](self, "_loadVisibleViewControllerAndNotify:", 1);
        break;
      case 0:
        -[UIPageController _setPreviousViewController:](self, "_setPreviousViewController:", CFSTR("UnloadedViewController"));
        -[UIPageController _setPreviousViewControllerNotificationState:](self, "_setPreviousViewControllerNotificationState:", 0);
        break;
    }
  }
}

- (id)_pageControllerScrollView
{
  if (!-[UIPageController _scrollView](self, "_scrollView"))
    -[UIViewController view](self, "view");
  return -[UIPageController _scrollView](self, "_scrollView");
}

@end
