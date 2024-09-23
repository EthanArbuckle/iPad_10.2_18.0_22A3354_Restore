@implementation SUOverlayBackgroundViewController

- (SUOverlayBackgroundViewController)init
{
  SUOverlayBackgroundViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUOverlayBackgroundViewController;
  v2 = -[SUViewController init](&v4, sel_init);
  if (v2)
  {
    v2->_viewControllers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableArray *viewControllers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SUOverlayBackgroundViewController _tearDownFlipView](self, "_tearDownFlipView");
  if (self->_swipeGestureRecognizer)
    -[SUTouchCaptureView removeGestureRecognizer:](self->_captureView, "removeGestureRecognizer:");
  -[SUTouchCaptureView removeTarget:action:forControlEvents:](self->_captureView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_captureView = 0;
  -[UISwipeGestureRecognizer setDelegate:](self->_swipeGestureRecognizer, "setDelegate:", 0);

  self->_swipeGestureRecognizer = 0;
  self->_actionQueue = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  viewControllers = self->_viewControllers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(viewControllers);
        -[SUOverlayBackgroundViewController removeChildViewController:](self, "removeChildViewController:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  self->_viewControllers = 0;
  v8.receiver = self;
  v8.super_class = (Class)SUOverlayBackgroundViewController;
  -[SUViewController dealloc](&v8, sel_dealloc);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  SUOverlayTransition *v7;
  SUOverlayAction *v8;

  v3 = a3;
  if (-[NSMutableArray count](self->_viewControllers, "count"))
  {
    v8 = objc_alloc_init(SUOverlayAction);
    -[SUOverlayAction setActionType:](v8, "setActionType:", 2);
    v5 = -[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController");
    -[SUOverlayAction setViewController:](v8, "setViewController:", v5);
    if (v3)
    {
      v6 = objc_msgSend(v5, "presentationTransition");
      if (v6)
      {
        v7 = -[SUOverlayBackgroundViewController _copyTransitionForTransition:action:](self, "_copyTransitionForTransition:action:", v6, v8);
      }
      else
      {
        v7 = objc_alloc_init(SUOverlayTransition);
        -[SUOverlayTransition setType:](v7, "setType:", 2);
      }
      -[SUOverlayAction setTransition:](v8, "setTransition:", v7);

    }
    -[SUOverlayBackgroundViewController _enqueueAction:](self, "_enqueueAction:", v8);

  }
  else
  {
    -[SUOverlayBackgroundViewController _sendDidDismiss](self, "_sendDidDismiss");
  }
}

- (void)dismissOverlay:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  SUOverlayTransition *v8;
  SUOverlayAction *v9;

  v4 = a4;
  v9 = objc_alloc_init(SUOverlayAction);
  -[SUOverlayAction setActionType:](v9, "setActionType:", 1);
  -[SUOverlayAction setViewController:](v9, "setViewController:", a3);
  if (v4)
  {
    v7 = objc_msgSend(a3, "presentationTransition");
    if (v7)
    {
      v8 = -[SUOverlayBackgroundViewController _copyTransitionForTransition:action:](self, "_copyTransitionForTransition:action:", v7, v9);
    }
    else
    {
      v8 = objc_alloc_init(SUOverlayTransition);
      -[SUOverlayTransition setType:](v8, "setType:", 2);
    }
    -[SUOverlayAction setTransition:](v9, "setTransition:", v8);

  }
  -[SUOverlayBackgroundViewController _enqueueAction:](self, "_enqueueAction:", v9);

}

- (void)layoutViewControllers
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  int64_t selectedViewControllerIndex;
  unint64_t v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int64_t v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat rect;
  double v47;
  CGRect v48;

  v3 = -[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController");
  if (v3)
  {
    v4 = v3;
    -[SUOverlayBackgroundViewController _viewControllerKeyboardOffset](self, "_viewControllerKeyboardOffset");
    v6 = v5;
    -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", v4);
    v8 = v7;
    objc_msgSend((id)objc_msgSend(v4, "view"), "setFrame:", v7, fmax(v9 - v6, 20.0), v10, v11);
    objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "bounds");
    v13 = v12;
    v43 = v15;
    v44 = v14;
    rect = v16;
    -[SUOverlayBackgroundViewController _viewControllerHorizontalPadding](self, "_viewControllerHorizontalPadding");
    v18 = v17;
    v19 = -[NSMutableArray count](self->_viewControllers, "count");
    selectedViewControllerIndex = self->_selectedViewControllerIndex;
    if (selectedViewControllerIndex >= 1)
    {
      v21 = selectedViewControllerIndex + 1;
      v22 = 0.0;
      do
      {
        v23 = (void *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v21 - 2);
        -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", v23);
        v25 = v24;
        objc_msgSend((id)objc_msgSend(v23, "view"), "setFrame:", v8 - v22 - v24 - v18, v26 - v6, v24, v27);
        v22 = v22 + v18 + v25;
        --v21;
      }
      while (v21 > 1);
      selectedViewControllerIndex = self->_selectedViewControllerIndex;
    }
    v45 = v6;
    v28 = selectedViewControllerIndex + 1;
    v29 = v43;
    v30 = v44;
    if (selectedViewControllerIndex + 1 < v19)
    {
      v31 = 0.0;
      do
      {
        v32 = (void *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", v28);
        -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", v32);
        v34 = v33;
        v36 = v35;
        v47 = v37;
        v48.origin.x = v13;
        v48.origin.y = v30;
        v48.size.width = rect;
        v48.size.height = v29;
        v38 = v29;
        v39 = v30;
        v40 = v18 + v31 + CGRectGetMaxX(v48) + v36;
        v41 = (void *)objc_msgSend(v32, "view");
        v42 = v40;
        v30 = v39;
        v29 = v38;
        objc_msgSend(v41, "setFrame:", v42, v34 - v45, v36, v47);
        v31 = v31 + v18 + v36;
        ++v28;
      }
      while (v19 != v28);
    }
  }
}

- (void)populateNavigationHistoryWithItems:(id)a3
{
  unint64_t v5;
  unint64_t selectedViewControllerIndex;
  SUClientInterface *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  SUOverlayViewController *v15;
  SUOverlayTransition *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = -[NSMutableArray count](self->_viewControllers, "count");
  selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if (v5 < selectedViewControllerIndex)
    selectedViewControllerIndex = v5;
  self->_selectedViewControllerIndex = selectedViewControllerIndex;
  v7 = -[SUViewController clientInterface](self, "clientInterface");
  v8 = -[SUViewController viewControllerFactory](self, "viewControllerFactory");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(v8, "newStorePageViewControllerWithSection:", 0);
        objc_msgSend(v14, "setClientInterface:", v7);
        objc_msgSend(v14, "setTitle:", objc_msgSend(v13, "title"));
        objc_msgSend(v14, "setURLRequestProperties:", objc_msgSend(v13, "URLRequestProperties"));
        if (v14)
        {
          v15 = objc_alloc_init(SUOverlayViewController);
          -[SUOverlayViewController setBackViewController:](v15, "setBackViewController:", v14);
          -[SUViewController setClientInterface:](v15, "setClientInterface:", v7);
          v16 = objc_alloc_init(SUOverlayTransition);
          -[SUOverlayTransition setType:](v16, "setType:", 2);
          -[SUOverlayViewController setPresentationTransition:](v15, "setPresentationTransition:", v16);

          -[SUOverlayBackgroundViewController addChildViewController:](self, "addChildViewController:", v15);
          -[NSMutableArray insertObject:atIndex:](self->_viewControllers, "insertObject:atIndex:", v15, self->_selectedViewControllerIndex++);
          objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "addSubview:", -[SUOverlayViewController view](v15, "view"));

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
}

- (void)presentOverlay:(id)a3 withTransition:(id)a4
{
  id v7;
  SUOverlayAction *v8;

  v8 = objc_alloc_init(SUOverlayAction);
  -[SUOverlayAction setActionType:](v8, "setActionType:", 0);
  -[SUOverlayAction setViewController:](v8, "setViewController:", a3);
  v7 = -[SUOverlayBackgroundViewController _copyTransitionForTransition:action:](self, "_copyTransitionForTransition:action:", a4, v8);
  -[SUOverlayAction setTransition:](v8, "setTransition:", v7);

  -[SUOverlayBackgroundViewController _enqueueAction:](self, "_enqueueAction:", v8);
}

- (SUOverlayViewController)selectedViewController
{
  unint64_t selectedViewControllerIndex;

  selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if (selectedViewControllerIndex >= -[NSMutableArray count](self->_viewControllers, "count"))
    return 0;
  else
    return (SUOverlayViewController *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_selectedViewControllerIndex);
}

- (id)viewControllerForScriptWindowContext:(id)a3
{
  int v4;
  NSMutableArray *viewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "tag");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  viewControllers = self->_viewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(viewControllers);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "scriptWindowContext"), "tag") == v4)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)copyChildViewControllersForReason:(int64_t)a3
{
  unint64_t selectedViewControllerIndex;
  unint64_t v6;
  objc_super v8;

  selectedViewControllerIndex = self->_selectedViewControllerIndex;
  v6 = -[NSMutableArray count](self->_viewControllers, "count");
  if (!a3 && selectedViewControllerIndex < v6)
    return (id)-[NSMutableArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", self->_selectedViewControllerIndex, 1);
  v8.receiver = self;
  v8.super_class = (Class)SUOverlayBackgroundViewController;
  return -[SUViewController copyChildViewControllersForReason:](&v8, sel_copyChildViewControllersForReason_, a3);
}

- (id)copyArchivableContext
{
  SUViewControllerContext *v3;
  id v4;
  NSMutableArray *viewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (-[SUOverlayBackgroundViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    return 0;
  }
  v3 = objc_alloc_init(SUViewControllerContext);
  -[SUViewControllerContext setType:](v3, "setType:", 2);
  -[SUViewControllerContext setValue:forMetadataKey:](v3, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_selectedViewControllerIndex), CFSTR("selected-index"));
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  viewControllers = self->_viewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(viewControllers);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "copyArchivableContext");
        if (v10)
        {
          v11 = (void *)v10;
          objc_msgSend(v4, "addObject:", v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  -[SUViewControllerContext setValue:forMetadataKey:](v3, "setValue:forMetadataKey:", v4, CFSTR("sub-contexts"));

  return v3;
}

- (id)copyArchivableJetsamContext
{
  return 0;
}

- (void)keyboardWillHideWithInfo:(id)a3
{
  CGSize v5;
  objc_super v6;

  v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_keyboardFrame.size = v5;
  -[SUOverlayBackgroundViewController _layoutForKeyboardChangeWithInfo:](self, "_layoutForKeyboardChangeWithInfo:");
  v6.receiver = self;
  v6.super_class = (Class)SUOverlayBackgroundViewController;
  -[UIViewController keyboardWillHideWithInfo:](&v6, sel_keyboardWillHideWithInfo_, a3);
}

- (void)keyboardWillShowWithInfo:(id)a3
{
  CGRect *p_keyboardFrame;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  objc_super v14;

  p_keyboardFrame = &self->_keyboardFrame;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF7A20]), "CGRectValue");
  p_keyboardFrame->origin.x = v6;
  p_keyboardFrame->origin.y = v7;
  p_keyboardFrame->size.width = v8;
  p_keyboardFrame->size.height = v9;
  objc_msgSend(MEMORY[0x24BDF6D38], "convertRect:toView:", -[SUOverlayBackgroundViewController view](self, "view"), p_keyboardFrame->origin.x, p_keyboardFrame->origin.y, p_keyboardFrame->size.width, p_keyboardFrame->size.height);
  p_keyboardFrame->origin.x = v10;
  p_keyboardFrame->origin.y = v11;
  p_keyboardFrame->size.width = v12;
  p_keyboardFrame->size.height = v13;
  if (!-[SUOverlayBackgroundViewController presentedViewController](self, "presentedViewController"))
    -[SUOverlayBackgroundViewController _layoutForKeyboardChangeWithInfo:](self, "_layoutForKeyboardChangeWithInfo:", a3);
  v14.receiver = self;
  v14.super_class = (Class)SUOverlayBackgroundViewController;
  -[UIViewController keyboardWillShowWithInfo:](&v14, sel_keyboardWillShowWithInfo_, a3);
}

- (void)loadView
{
  SUTouchCaptureView *v3;
  NSMutableArray *viewControllers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SUTouchCaptureView);
  self->_captureView = v3;
  -[SUTouchCaptureView addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", self, sel__captureViewAction_, 64);
  -[SUTouchCaptureView setAutoresizingMask:](self->_captureView, "setAutoresizingMask:", 18);
  -[SUTouchCaptureView setBackgroundColor:](self->_captureView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  -[SUOverlayBackgroundViewController setView:](self, "setView:", self->_captureView);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  viewControllers = self->_viewControllers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(viewControllers);
        -[SUTouchCaptureView addSubview:](self->_captureView, "addSubview:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "view"));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (-[NSMutableArray count](self->_viewControllers, "count"))
    -[SUTouchCaptureView setBackgroundColor:](self->_captureView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5));
  -[SUOverlayBackgroundViewController _reloadGestureRecognizers](self, "_reloadGestureRecognizers");
}

- (void)restoreArchivableContext:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("sub-contexts"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "copyViewController");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SUOverlayBackgroundViewController _addViewController:](self, "_addViewController:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("selected-index"));
  if (v11)
  {
    v12 = objc_msgSend(v11, "integerValue");
    v13 = -[NSMutableArray count](self->_viewControllers, "count") - 1;
    if (v12 < v13)
      v13 = v12;
    self->_selectedViewControllerIndex = v13;
  }
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUOverlayBackgroundViewController;
  return -[SUViewController shouldExcludeFromNavigationHistory](&v4, sel_shouldExcludeFromNavigationHistory)
      || -[NSMutableArray count](self->_viewControllers, "count") == 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
  v5.receiver = self;
  v5.super_class = (Class)SUOverlayBackgroundViewController;
  -[SUViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  objc_super v7;

  -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
  v7.receiver = self;
  v7.super_class = (Class)SUOverlayBackgroundViewController;
  -[SUViewController willAnimateRotationToInterfaceOrientation:duration:](&v7, sel_willAnimateRotationToInterfaceOrientation_duration_, a3, a4);
}

- (void)overlayPageViewTapped:(id)a3
{
  SUOverlayViewController *v5;
  SUOverlayViewController *v6;
  SUScriptFunction *v7;
  uint64_t v8;
  _QWORD v9[5];

  v5 = -[SUOverlayBackgroundViewController selectedViewController](self, "selectedViewController");
  if (v5)
  {
    if (!self->_askingToDismissSelection)
    {
      v6 = v5;
      if (-[NSMutableArray containsObject:](self->_viewControllers, "containsObject:", a3))
      {
        self->_askingToDismissSelection = 1;
        v7 = -[SUOverlayViewController shouldDismissFunction](v6, "shouldDismissFunction");
        v8 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __59__SUOverlayBackgroundViewController_overlayPageViewTapped___block_invoke;
        v9[3] = &unk_24DE7C7C8;
        v9[4] = v8;
        if (!-[SUScriptFunction callWithArguments:completionBlock:](v7, "callWithArguments:completionBlock:", 0, v9))
        {
          self->_askingToDismissSelection = 0;
          -[SUOverlayBackgroundViewController dismissOverlay:animated:](self, "dismissOverlay:animated:", v6, 1);
        }
      }
    }
  }
}

uint64_t __59__SUOverlayBackgroundViewController_overlayPageViewTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_shouldDismissFinishedWithValue:", a2);
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  NSMutableArray *viewControllers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    viewControllers = self->_viewControllers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(viewControllers);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(a3, "isDescendantOfViewController:", v11) & 1) != 0)
          {
            if (v11)
              -[SUOverlayBackgroundViewController dismissOverlay:animated:](self, "dismissOverlay:animated:", v11, 1);
            return;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
}

- (void)_captureViewAction:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[5];

  if (!self->_askingToDismissEverything)
  {
    self->_askingToDismissEverything = 1;
    v4 = (void *)objc_msgSend(-[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController", a3), "shouldDismissFunction");
    v5 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__SUOverlayBackgroundViewController__captureViewAction___block_invoke;
    v6[3] = &unk_24DE7C7C8;
    v6[4] = v5;
    if ((objc_msgSend(v4, "callWithArguments:completionBlock:", 0, v6) & 1) == 0)
    {
      self->_askingToDismissEverything = 0;
      -[SUOverlayBackgroundViewController dismissAnimated:](self, "dismissAnimated:", 1);
    }
  }
}

uint64_t __56__SUOverlayBackgroundViewController__captureViewAction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_shouldDismissFinishedWithValue:", a2);
}

- (void)_swipe:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "state") == 3 && (unint64_t)-[NSMutableArray count](self->_viewControllers, "count") >= 2)
  {
    v4 = (void *)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_selectedViewControllerIndex);
    if (objc_msgSend(v4, "canSwipeToDismiss"))
      -[SUOverlayBackgroundViewController dismissOverlay:animated:](self, "dismissOverlay:animated:", v4, 1);
  }
}

- (void)_backgroundAnimationDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3, a4, a5), "endIgnoringInteractionEvents");
  -[SUOverlayBackgroundViewController _overlayAnimationDidFinish](self, "_overlayAnimationDidFinish");
}

- (void)scalingFlipViewDidFinish:(id)a3
{
  if (self->_activeFlipView == a3)
    -[SUOverlayBackgroundViewController _overlayAnimationDidFinish](self, "_overlayAnimationDidFinish");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_enqueueAction:(id)a3
{
  NSMutableArray *actionQueue;

  actionQueue = self->_actionQueue;
  if (!actionQueue)
  {
    actionQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_actionQueue = actionQueue;
  }
  -[NSMutableArray addObject:](actionQueue, "addObject:", a3);
  if (-[NSMutableArray count](self->_actionQueue, "count") == 1)
    -[SUOverlayBackgroundViewController _performNextAction](self, "_performNextAction");
}

- (void)_finishDismissAction:(id)a3
{
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  unint64_t selectedViewControllerIndex;
  unint64_t v9;

  v5 = (void *)objc_msgSend(a3, "transition");
  objc_msgSend((id)objc_msgSend(v5, "sourceElement"), "setProperty:value:", CFSTR("opacity"), CFSTR("1.0"));
  v6 = objc_msgSend(a3, "viewController");
  v7 = objc_msgSend(v5, "type") != 0;
  -[SUOverlayBackgroundViewController _finishDismissOfViewController:animated:](self, "_finishDismissOfViewController:animated:", v6, v7);
  objc_msgSend((id)objc_msgSend(a3, "otherViewController"), "viewDidAppear:", v7);
  if (-[NSMutableArray count](self->_viewControllers, "count"))
  {
    selectedViewControllerIndex = self->_selectedViewControllerIndex;
    v9 = -[NSMutableArray count](self->_viewControllers, "count") - 1;
    if (selectedViewControllerIndex < v9)
      v9 = selectedViewControllerIndex;
    self->_selectedViewControllerIndex = v9;
    -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
    -[SUOverlayBackgroundViewController _reloadGestureRecognizers](self, "_reloadGestureRecognizers");
  }
  else
  {
    self->_selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[SUOverlayBackgroundViewController _sendDidDismiss](self, "_sendDidDismiss");
  }
}

- (void)_finishDismissEverythingAction:(id)a3
{
  uint64_t v4;
  NSMutableArray *viewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend((id)objc_msgSend(a3, "transition"), "type");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  viewControllers = self->_viewControllers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(viewControllers);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "presentationTransition"), "sourceElement"), "setProperty:value:", CFSTR("opacity"), CFSTR("1.0"));
        -[SUOverlayBackgroundViewController _finishDismissOfViewController:animated:](self, "_finishDismissOfViewController:animated:", v10, v4 != 0);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  -[NSMutableArray removeAllObjects](self->_viewControllers, "removeAllObjects");
  self->_selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  -[SUOverlayBackgroundViewController _sendDidDismiss](self, "_sendDidDismiss");
}

- (void)_finishDismissOfViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  if (objc_msgSend(a3, "isViewLoaded"))
    objc_msgSend((id)objc_msgSend(a3, "view"), "removeFromSuperview");
  objc_msgSend(a3, "viewDidDisappear:", v4);
  -[SUOverlayBackgroundViewController removeChildViewController:](self, "removeChildViewController:", a3);
  objc_msgSend(a3, "invalidate");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUOverlayDidDismissNotification"), a3);
}

- (void)_finishPresentAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;

  v5 = (void *)objc_msgSend(a3, "viewController");
  v6 = (void *)-[SUOverlayBackgroundViewController view](self, "view");
  v7 = (void *)objc_msgSend(v5, "view");
  v8 = objc_msgSend(v7, "superview");
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, "frame");
    objc_msgSend(v6, "convertRect:fromView:", v9);
  }
  else
  {
    -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", v5);
  }
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v6, "addSubview:", v7);
  v10 = objc_msgSend((id)objc_msgSend(a3, "transition"), "type") != 0;
  objc_msgSend((id)objc_msgSend(a3, "otherViewController"), "viewDidDisappear:", v10);
  objc_msgSend(v5, "viewDidAppear:", v10);
  if (objc_msgSend(v5, "isOnFront"))
  {
    v11 = (void *)objc_msgSend((id)objc_msgSend(a3, "transition"), "copy");
    objc_msgSend(v11, "setType:", 1);
    objc_msgSend(v5, "flipWithTransition:", v11);

  }
  self->_selectedViewControllerIndex = -[NSMutableArray indexOfObjectIdenticalTo:](self->_viewControllers, "indexOfObjectIdenticalTo:", v5);
  -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
  -[SUOverlayBackgroundViewController _reloadGestureRecognizers](self, "_reloadGestureRecognizers");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUOverlayDidShowNotification"), v5);
}

- (void)_overlayActionDidFinish
{
  void *v3;
  int v4;

  v3 = (void *)-[NSMutableArray objectAtIndex:](self->_actionQueue, "objectAtIndex:", 0);
  v4 = objc_msgSend(v3, "actionType");
  if (v4)
  {
    if (v4 == 2)
    {
      -[SUOverlayBackgroundViewController _finishDismissEverythingAction:](self, "_finishDismissEverythingAction:", v3);
    }
    else if (v4 == 1)
    {
      -[SUOverlayBackgroundViewController _finishDismissAction:](self, "_finishDismissAction:", v3);
    }
  }
  else
  {
    -[SUOverlayBackgroundViewController _finishPresentAction:](self, "_finishPresentAction:", v3);
  }
  -[SUScalingFlipView removeFromSuperview](self->_activeFlipView, "removeFromSuperview");
  -[SUOverlayBackgroundViewController _tearDownFlipView](self, "_tearDownFlipView");
  -[NSMutableArray removeObjectAtIndex:](self->_actionQueue, "removeObjectAtIndex:", 0);
  -[SUOverlayBackgroundViewController _performNextAction](self, "_performNextAction");
}

- (void)_overlayAnimationDidFinish
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)-[NSMutableArray objectAtIndex:](self->_actionQueue, "objectAtIndex:", 0);
  v4 = objc_msgSend(v3, "animationCount");
  v5 = v4 - 1;
  if (v4 >= 1)
  {
    objc_msgSend(v3, "setAnimationCount:", v5);
    v4 = v5;
  }
  if (!v4)
    -[SUOverlayBackgroundViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
}

- (void)_performDismissAction:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t selectedViewControllerIndex;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v16;
  void *v17;

  v5 = (id)objc_msgSend(a3, "viewController");
  v6 = (void *)objc_msgSend(a3, "transition");
  v7 = objc_msgSend(v6, "type");
  objc_msgSend(v5, "viewWillDismissWithTransition:", v6);
  objc_msgSend(v5, "viewWillDisappear:", v7 != 0);
  v8 = -[NSMutableArray count](self->_viewControllers, "count");
  if (v8 != 1)
  {
    selectedViewControllerIndex = self->_selectedViewControllerIndex;
    if (selectedViewControllerIndex == -[NSMutableArray indexOfObjectIdenticalTo:](self->_viewControllers, "indexOfObjectIdenticalTo:", v5))--self->_selectedViewControllerIndex;
  }
  v10 = -[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController");
  if (v10 == v5)
    v11 = 0;
  else
    v11 = v10;
  objc_msgSend(a3, "setOtherViewController:", v11);
  objc_msgSend(v11, "viewWillAppear:", v7 != 0);
  v12 = (void *)-[SUOverlayBackgroundViewController view](self, "view");
  if (v7)
  {
    objc_msgSend(v6, "duration");
    if (v8 != 1 && v7 != 2 && v7 != 3)
    {
      -[SUOverlayBackgroundViewController _removeViewController:](self, "_removeViewController:", v5);
      goto LABEL_27;
    }
    v16 = v13;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
    objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__backgroundAnimationDidStop_finished_context_);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDuration:", v16);
    if (v8 == 1)
    {
      objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    }
    else if (v7 == 2)
    {
      -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
LABEL_26:
      -[SUOverlayBackgroundViewController _removeViewController:](self, "_removeViewController:", v5);
      objc_msgSend(a3, "setAnimationCount:", objc_msgSend(a3, "animationCount") + 1);
      objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
LABEL_27:
      if (v7 == 1)
        -[SUOverlayBackgroundViewController _performFlipForAction:](self, "_performFlipForAction:", a3);
      return;
    }
    if (v7 == 3)
    {
      -[SUOverlayBackgroundViewController _removeViewController:](self, "_removeViewController:", v5);
      -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
      v17 = (void *)objc_msgSend(v5, "view");
      -[SUOverlayBackgroundViewController _frameForSlideFromBottomForViewController:](self, "_frameForSlideFromBottomForViewController:", v5);
      objc_msgSend(v17, "setFrame:");
    }
    goto LABEL_26;
  }
  -[SUOverlayBackgroundViewController _removeViewController:](self, "_removeViewController:", v5);
  if (v8 == 1)
    objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  else
    -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
  -[SUOverlayBackgroundViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
}

- (void)_performDismissEverythingAction:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *viewControllers;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "viewController");
  v24 = a3;
  v6 = (void *)objc_msgSend(a3, "transition");
  v7 = objc_msgSend(v6, "type");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  viewControllers = self->_viewControllers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(viewControllers);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v13, "viewWillDismissWithTransition:", v6);
        objc_msgSend(v13, "viewWillDisappear:", v7 != 0);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }
  v14 = (void *)-[SUOverlayBackgroundViewController view](self, "view");
  if (v7)
  {
    v23 = v14;
    if (v7 == 1)
      -[SUOverlayBackgroundViewController _performFlipForAction:](self, "_performFlipForAction:", v24);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
    objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__backgroundAnimationDidStop_finished_context_);
    v15 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(v6, "duration");
    objc_msgSend(v15, "setAnimationDuration:");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = self->_viewControllers;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          if (objc_msgSend(v21, "isViewLoaded"))
          {
            if (v21 != v5)
              goto LABEL_18;
            if (v7 != 1)
            {
              if (v7 != 3)
              {
LABEL_18:
                objc_msgSend((id)objc_msgSend(v21, "view"), "setAlpha:", 0.0);
                continue;
              }
              v22 = (void *)objc_msgSend(v5, "view");
              -[SUOverlayBackgroundViewController _frameForSlideFromBottomForViewController:](self, "_frameForSlideFromBottomForViewController:", v5);
              objc_msgSend(v22, "setFrame:");
            }
          }
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }
    objc_msgSend(v23, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    objc_msgSend(v24, "setAnimationCount:", objc_msgSend(v24, "animationCount") + 1);
    objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
  }
  else
  {
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    -[SUOverlayBackgroundViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
  }
}

- (void)_performNextAction
{
  void *v3;

  if (-[NSMutableArray count](self->_actionQueue, "count"))
  {
    v3 = (void *)-[NSMutableArray objectAtIndex:](self->_actionQueue, "objectAtIndex:", 0);
    switch(objc_msgSend(v3, "actionType"))
    {
      case 0u:
        -[SUOverlayBackgroundViewController _performPresentAction:](self, "_performPresentAction:", v3);
        break;
      case 1u:
        -[SUOverlayBackgroundViewController _performDismissAction:](self, "_performDismissAction:", v3);
        break;
      case 2u:
        -[SUOverlayBackgroundViewController _performDismissEverythingAction:](self, "_performDismissEverythingAction:", v3);
        break;
      case 3u:
        -[SUOverlayBackgroundViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
        break;
      default:
        return;
    }
  }
}

- (void)_performPresentAction:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend(a3, "viewController");
  v6 = (void *)objc_msgSend(a3, "transition");
  v7 = objc_msgSend(v6, "type");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUOverlayWillShowNotification"), v5);
  objc_msgSend(v5, "setPresentationTransition:", v6);
  if (v7 == 2 && (objc_msgSend(v5, "isOnFront") & 1) == 0)
    objc_msgSend(v5, "flipWithTransition:", 0);
  objc_msgSend(v5, "viewWillAppear:", v7 != 0);
  -[SUOverlayBackgroundViewController _addViewController:](self, "_addViewController:", v5);
  v8 = -[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController");
  objc_msgSend(a3, "setOtherViewController:", v8);
  objc_msgSend(v8, "viewWillDisappear:", v7 != 0);
  v9 = (void *)-[SUOverlayBackgroundViewController view](self, "view");
  if (v7)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
    v10 = (void *)objc_msgSend(v5, "view");
    if (!v8)
    {
      self->_selectedViewControllerIndex = -[NSMutableArray count](self->_viewControllers, "count") - 1;
      objc_msgSend(v10, "setAlpha:", 0.0);
    }
    switch(v7)
    {
      case 1:
        -[SUOverlayBackgroundViewController _performFlipForAction:](self, "_performFlipForAction:", a3);
        break;
      case 2:
        objc_msgSend(v9, "addSubview:", objc_msgSend(v5, "view"));
        -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
        break;
      case 3:
        objc_msgSend(v9, "addSubview:", v10);
        -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
        -[SUOverlayBackgroundViewController _frameForSlideFromBottomForViewController:](self, "_frameForSlideFromBottomForViewController:", v5);
        objc_msgSend(v10, "setFrame:");
        break;
    }
    self->_selectedViewControllerIndex = -[NSMutableArray count](self->_viewControllers, "count") - 1;
    objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDelegate:", self);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDidStopSelector:", sel__backgroundAnimationDidStop_finished_context_);
    v11 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(v6, "duration");
    objc_msgSend(v11, "setAnimationDuration:");
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2)
      -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5));
    objc_msgSend(v10, "setAlpha:", 1.0);
    objc_msgSend(a3, "setAnimationCount:", objc_msgSend(a3, "animationCount") + 1);
    objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
  }
  else
  {
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, 0.5));
    -[SUOverlayBackgroundViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
  }
}

- (void)_addViewController:(id)a3
{
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:");
  -[SUOverlayBackgroundViewController addChildViewController:](self, "addChildViewController:", a3);
}

- (CGRect)_centeredFrameForViewController:(id)a3
{
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
  double v17;
  double v18;
  CGRect result;

  objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "bounds");
  v5 = v4;
  v7 = v6;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "statusBarFrame");
  v9 = v8;
  v11 = v10;
  if (a3)
    objc_msgSend(a3, "overlaySize");
  else
    +[SUOverlayViewController defaultOverlaySize](SUOverlayViewController, "defaultOverlaySize");
  v14 = v12;
  v15 = v13;
  v16 = floor((v5 - v12) * 0.5);
  if (v11 >= v9)
    v17 = v9;
  else
    v17 = v11;
  v18 = floor((v7 - v13 - v17) * 0.5);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (id)_copyTransitionForTransition:(id)a3 action:(id)a4
{
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v6 = (void *)objc_msgSend(a3, "copy");
  if (objc_msgSend(v6, "type") == 1)
  {
    v7 = objc_msgSend(a4, "actionType");
    objc_msgSend((id)objc_msgSend(v6, "sourceElement"), "frame");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_msgSend(a4, "viewController");
    if (!objc_msgSend((id)objc_msgSend(v6, "sourceElement"), "imageRepresentation")
      || v11 < 0.00000011920929
      || v9 < 0.00000011920929)
    {
      goto LABEL_7;
    }
    if (!v7)
    {
      if (!-[NSMutableArray count](self->_viewControllers, "count"))
        return v6;
      goto LABEL_7;
    }
    if (objc_msgSend(v12, "isOnFront"))
LABEL_7:
      objc_msgSend(v6, "setType:", 2);
  }
  return v6;
}

- (CGRect)_frameForSlideFromBottomForViewController:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "bounds");
  v6 = v5;
  -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", a3);
  v10 = v6 + floor((v6 - v9) * 0.5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v7;
  return result;
}

- (void)_layoutForKeyboardChangeWithInfo:(id)a3
{
  uint64_t v5;
  float v6;
  double v7;

  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF79B8]), "unsignedIntegerValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDF79C0]), "floatValue");
  if (v6 <= 2.2204e-16)
  {
    -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
  }
  else
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x24BDF6F90], "beginAnimations:context:", 0, 0);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationCurve:", v5);
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationDuration:", v7);
    -[SUOverlayBackgroundViewController layoutViewControllers](self, "layoutViewControllers");
    objc_msgSend(MEMORY[0x24BDF6F90], "commitAnimations");
  }
}

- (void)_performFlipForAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SUScalingFlipView *v18;
  SUScalingFlipView *activeFlipView;
  SUScalingFlipView *v20;
  SUScalingFlipView *v21;
  id v22;

  v5 = (void *)objc_msgSend(a3, "transition");
  v6 = (void *)objc_msgSend(a3, "viewController");
  v7 = (void *)objc_msgSend(v5, "sourceElement");
  v8 = objc_msgSend(v7, "imageRepresentation");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)-[SUOverlayBackgroundViewController view](self, "view");
    v11 = (void *)objc_msgSend(v6, "view");
    if ((void *)objc_msgSend(v11, "superview") == v10)
      v12 = objc_msgSend((id)objc_msgSend(v10, "subviews"), "indexOfObjectIdenticalTo:", v11);
    else
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
    objc_msgSend(v22, "setContentMode:", 1);
    objc_msgSend(v7, "frame");
    if (v16 >= v15)
      v17 = v16;
    else
      v17 = v15;
    objc_msgSend(v10, "convertRect:fromView:", 0, v13 + floor((v15 - v17) * 0.5), v14 + floor((v16 - v17) * 0.5), v17, v17);
    objc_msgSend(v22, "setFrame:");
    if (objc_msgSend(a3, "actionType"))
    {
      v18 = -[SUScalingFlipView initWithFrontView:backView:]([SUScalingFlipView alloc], "initWithFrontView:backView:", v11, v22);
      self->_activeFlipView = v18;
      -[SUScalingFlipView setDirection:](v18, "setDirection:", 1);
      activeFlipView = self->_activeFlipView;
    }
    else
    {
      -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", v6);
      objc_msgSend(v11, "setFrame:");
      activeFlipView = -[SUScalingFlipView initWithFrontView:backView:]([SUScalingFlipView alloc], "initWithFrontView:backView:", v22, v11);
      self->_activeFlipView = activeFlipView;
    }
    -[SUScalingFlipView setDelegate:](activeFlipView, "setDelegate:", self);
    v20 = self->_activeFlipView;
    objc_msgSend(v5, "duration");
    -[SUScalingFlipView setDuration:](v20, "setDuration:");
    v21 = self->_activeFlipView;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "addSubview:", v21);
    else
      objc_msgSend(v10, "insertSubview:atIndex:", v21, v12);
    objc_msgSend(v7, "setProperty:value:", CFSTR("opacity"), CFSTR("0"));
    objc_msgSend(a3, "setAnimationCount:", objc_msgSend(a3, "animationCount") + 1);
    -[SUScalingFlipView performFlip](self->_activeFlipView, "performFlip");

  }
}

- (void)_reloadGestureRecognizers
{
  char v3;
  UISwipeGestureRecognizer *swipeGestureRecognizer;
  UISwipeGestureRecognizer *v5;
  UISwipeGestureRecognizer *v6;

  v3 = objc_msgSend(-[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController"), "canSwipeToDismiss");
  swipeGestureRecognizer = self->_swipeGestureRecognizer;
  if ((v3 & 1) != 0)
  {
    if (!swipeGestureRecognizer)
    {
      v5 = (UISwipeGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E18]), "initWithTarget:action:", self, sel__swipe_);
      self->_swipeGestureRecognizer = v5;
      -[UISwipeGestureRecognizer setDelegate:](v5, "setDelegate:", self);
      -[UISwipeGestureRecognizer setDirection:](self->_swipeGestureRecognizer, "setDirection:", 1);
      swipeGestureRecognizer = self->_swipeGestureRecognizer;
    }
    -[SUTouchCaptureView addGestureRecognizer:](self->_captureView, "addGestureRecognizer:", swipeGestureRecognizer);
  }
  else
  {
    if (swipeGestureRecognizer)
    {
      -[SUTouchCaptureView removeGestureRecognizer:](self->_captureView, "removeGestureRecognizer:");
      v6 = self->_swipeGestureRecognizer;
    }
    else
    {
      v6 = 0;
    }
    -[UISwipeGestureRecognizer setDelegate:](v6, "setDelegate:", 0);

    self->_swipeGestureRecognizer = 0;
  }
}

- (void)_removeViewController:(id)a3
{
  -[SUOverlayBackgroundViewController removeChildViewController:](self, "removeChildViewController:");
  -[NSMutableArray removeObject:](self->_viewControllers, "removeObject:", a3);
}

- (id)_selectedViewController
{
  unint64_t selectedViewControllerIndex;

  selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if ((selectedViewControllerIndex & 0x8000000000000000) != 0
    || selectedViewControllerIndex >= -[NSMutableArray count](self->_viewControllers, "count"))
  {
    return 0;
  }
  else
  {
    return (id)-[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", self->_selectedViewControllerIndex);
  }
}

- (void)_sendDidDismiss
{
  SUOverlayBackgroundViewController *v3;
  SUOverlayBackgroundDelegate *delegate;

  v3 = self;
  delegate = self->_delegate;
  if (delegate)
    -[SUOverlayBackgroundDelegate scriptOverlayBackgroundDidDismiss:](delegate, "scriptOverlayBackgroundDidDismiss:", self);
  else
    -[UIViewController dismissOverlayBackgroundViewController](self, "dismissOverlayBackgroundViewController");
}

- (void)_shouldDismissFinishedWithValue:(id)a3
{
  int v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (self->_askingToDismissEverything)
    {
      self->_askingToDismissEverything = 0;
      goto LABEL_7;
    }
    if (!self->_askingToDismissSelection)
      return;
    self->_askingToDismissSelection = 0;
LABEL_13:
    -[SUOverlayBackgroundViewController dismissOverlay:animated:](self, "dismissOverlay:animated:", -[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController"), 1);
    return;
  }
  v5 = objc_msgSend(a3, "BOOLValue");
  if (self->_askingToDismissEverything)
  {
    self->_askingToDismissEverything = 0;
    if (!v5)
      return;
LABEL_7:
    -[SUOverlayBackgroundViewController dismissAnimated:](self, "dismissAnimated:", 1);
    return;
  }
  if (self->_askingToDismissSelection)
  {
    self->_askingToDismissSelection = 0;
    if (v5)
      goto LABEL_13;
  }
}

- (void)_tearDownFlipView
{
  -[SUScalingFlipView setDelegate:](self->_activeFlipView, "setDelegate:", 0);

  self->_activeFlipView = 0;
}

- (double)_viewControllerHorizontalPadding
{
  uint64_t v3;
  double result;
  int64_t v5;

  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  result = 20.0;
  if (v3 == 1)
  {
    v5 = -[SUViewController interfaceOrientation](self, "interfaceOrientation", 20.0);
    result = 96.0;
    if ((unint64_t)(v5 - 1) < 2)
      return 34.0;
  }
  return result;
}

- (double)_viewControllerKeyboardOffset
{
  CGRect *p_keyboardFrame;
  double v3;
  NSMutableArray *viewControllers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double y;
  double height;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;
  CGRect v20;

  v18 = *MEMORY[0x24BDAC8D0];
  p_keyboardFrame = &self->_keyboardFrame;
  v3 = 0.0;
  if (self->_keyboardFrame.size.height > 0.00000011920929 && -[NSMutableArray count](self->_viewControllers, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    viewControllers = self->_viewControllers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v3 = 1.79769313e308;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(viewControllers);
          -[SUOverlayBackgroundViewController _centeredFrameForViewController:](self, "_centeredFrameForViewController:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          y = v19.origin.y;
          v20 = CGRectIntersection(v19, *p_keyboardFrame);
          if (y >= v20.size.height)
            height = v20.size.height;
          else
            height = y;
          if (v3 >= height)
            v3 = height;
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](viewControllers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    else
    {
      return 1.79769313e308;
    }
  }
  return v3;
}

- (SUOverlayBackgroundDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUOverlayBackgroundDelegate *)a3;
}

- (NSArray)viewControllers
{
  return &self->_viewControllers->super;
}

@end
