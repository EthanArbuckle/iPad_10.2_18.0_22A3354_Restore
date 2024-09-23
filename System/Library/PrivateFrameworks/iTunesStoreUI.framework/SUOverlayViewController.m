@implementation SUOverlayViewController

- (SUOverlayViewController)init
{
  return -[SUOverlayViewController initWithOverlayConfiguration:](self, "initWithOverlayConfiguration:", 0);
}

- (SUOverlayViewController)initWithOverlayConfiguration:(id)a3
{
  SUOverlayViewController *v4;
  CGFloat v5;
  CGFloat v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUOverlayViewController;
  v4 = -[SUViewController init](&v8, sel_init);
  if (v4)
  {
    v4->_scriptWindowContext = objc_alloc_init(SUScriptWindowContext);
    v4->_canSwipeToDismiss = 1;
    objc_msgSend((id)objc_opt_class(), "defaultOverlaySize");
    v4->_overlaySize.width = v5;
    v4->_overlaySize.height = v6;
    v4->_shadowOpacity = 0.670000017;
    v4->_shadowRadius = 15.0;
    if (a3)
      -[SUOverlayViewController _applyOverlayConfiguration:](v4, "_applyOverlayConfiguration:", a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUOverlayViewController _setActiveViewController:updateInterface:](self, "_setActiveViewController:updateInterface:", 0, 0);
  -[SUOverlayViewController _tearDownTouchCaptureView](self, "_tearDownTouchCaptureView");

  v3.receiver = self;
  v3.super_class = (Class)SUOverlayViewController;
  -[SUViewController dealloc](&v3, sel_dealloc);
}

+ (CGSize)defaultOverlaySize
{
  uint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  v3 = 256.0;
  if (v2 == 1)
    v3 = 650.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)flipWithTransition:(id)a3
{
  SUOverlayTransition *lastFlipTransition;
  SUOverlayAction *v6;

  v6 = objc_alloc_init(SUOverlayAction);
  -[SUOverlayAction setActionType:](v6, "setActionType:", 3);
  -[SUOverlayAction setTransition:](v6, "setTransition:", a3);
  -[SUOverlayAction setViewController:](v6, "setViewController:", -[SUOverlayViewController _activeViewController](self, "_activeViewController"));
  lastFlipTransition = self->_lastFlipTransition;
  if (lastFlipTransition != a3)
  {

    self->_lastFlipTransition = (SUOverlayTransition *)objc_msgSend(a3, "copy");
  }
  -[SUOverlayViewController _enqueueAction:](self, "_enqueueAction:", v6);

}

- (BOOL)isActiveOverlay
{
  return objc_msgSend(-[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "selectedViewController") == (_QWORD)self;
}

- (BOOL)isOnFront
{
  return -[SUOverlayViewController _activeViewController](self, "_activeViewController") == self->_frontViewController;
}

- (SUMaskProvider)maskProvider
{
  return -[SUMaskedView maskProvider](self->_subviewContainerView, "maskProvider");
}

- (void)setBackViewController:(id)a3
{
  UIViewController *backViewController;
  UIViewController *activeViewController;
  BOOL v7;

  backViewController = self->_backViewController;
  if (backViewController != a3)
  {
    activeViewController = self->_activeViewController;
    if (activeViewController)
      v7 = activeViewController == backViewController;
    else
      v7 = 0;
    if (v7)
    {
      -[SUOverlayViewController _setActiveViewController:updateInterface:](self, "_setActiveViewController:updateInterface:", a3, 1);
      backViewController = self->_backViewController;
    }

    self->_backViewController = (UIViewController *)a3;
  }
}

- (void)setFrontViewController:(id)a3
{
  UIViewController *frontViewController;
  UIViewController *activeViewController;
  BOOL v7;

  frontViewController = self->_frontViewController;
  if (frontViewController != a3)
  {
    activeViewController = self->_activeViewController;
    if (activeViewController)
      v7 = activeViewController == frontViewController;
    else
      v7 = 0;
    if (v7)
    {
      -[SUOverlayViewController _setActiveViewController:updateInterface:](self, "_setActiveViewController:updateInterface:", a3, 1);
      frontViewController = self->_frontViewController;
    }

    self->_frontViewController = (UIViewController *)a3;
  }
}

- (void)setMaskProvider:(id)a3
{
  objc_msgSend(-[SUOverlayViewController _subviewContainerView](self, "_subviewContainerView"), "setMaskProvider:", a3);
  -[SUOverlayViewController _applyDisplayProperties](self, "_applyDisplayProperties");
}

- (void)setOverlaySize:(CGSize)a3
{
  if (self->_overlaySize.width != a3.width || self->_overlaySize.height != a3.height)
  {
    self->_overlaySize = a3;
    objc_msgSend(-[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "layoutViewControllers");
    -[SUOverlayViewController _applyDisplayProperties](self, "_applyDisplayProperties");
  }
}

- (void)setScriptWindowContext:(id)a3
{
  if (self->_scriptWindowContext != a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      self->_scriptWindowContext = (SUScriptWindowContext *)a3;
    }
  }
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
  -[SUOverlayViewController _applyDisplayProperties](self, "_applyDisplayProperties");
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
  -[SUOverlayViewController _applyDisplayProperties](self, "_applyDisplayProperties");
}

- (void)viewWillDismissWithTransition:(id)a3
{
  if (objc_msgSend(a3, "type") == 1)
    -[SUOverlayViewController _setShadowVisible:](self, "_setShadowVisible:", 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _BOOL4 v6;
  int64_t state;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUOverlayViewController;
  v6 = -[SUViewController canPerformAction:withSender:](&v9, sel_canPerformAction_withSender_, a3, a4);
  if (v6)
  {
    if (sel_isEqual(a3, sel_storePage_finishedWithSuccess_))
    {
      state = self->_state;
      if ((state & 6) != 0)
        LOBYTE(v6) = 0;
      else
        LOBYTE(v6) = state & 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)copyArchivableContext
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUOverlayViewController;
  v3 = -[SUViewController copyArchivableContext](&v9, sel_copyArchivableContext);
  objc_msgSend(v3, "setType:", 3);
  if (!-[SUOverlayViewController shouldExcludeFromNavigationHistory](self, "shouldExcludeFromNavigationHistory"))
  {
    v4 = -[UIViewController copyArchivableContext](self->_backViewController, "copyArchivableContext");
    v5 = v4;
    if (v4 && objc_msgSend(v4, "type"))
      objc_msgSend(v3, "setValue:forMetadataKey:", v5, CFSTR("back"));

    v6 = -[UIViewController copyArchivableContext](self->_frontViewController, "copyArchivableContext");
    v7 = v6;
    if (v6 && objc_msgSend(v6, "type"))
      objc_msgSend(v3, "setValue:forMetadataKey:", v7, CFSTR("front"));

    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_activeViewController == self->_frontViewController), CFSTR("on-front"));
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUOverlayViewController presentationTransition](self, "presentationTransition"), CFSTR("presentation"));
  }
  return v3;
}

- (void)invalidateForMemoryPurge
{
  objc_super v3;

  if (!-[SUViewController isVisible](self, "isVisible")
    && -[SUOverlayTransition type](self->_presentationTransition, "type") == 1)
  {
    -[SUOverlayTransition setSourceElement:](self->_presentationTransition, "setSourceElement:", 0);
    -[SUOverlayTransition setType:](self->_presentationTransition, "setType:", 2);
  }
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayViewController;
  -[SUViewController invalidateForMemoryPurge](&v3, sel_invalidateForMemoryPurge);
}

- (void)loadView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v3 = (void *)objc_msgSend(-[SUOverlayViewController _activeViewController](self, "_activeViewController"), "view");
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setAutoresizingMask:", 18);
  v13 = -[SUOverlayViewController _subviewContainerView](self, "_subviewContainerView");
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v12, "addSubview:", v13);
  -[SUOverlayViewController setView:](self, "setView:", v12);

  objc_msgSend(v3, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v13, "addSubview:", v3);
  -[SUOverlayViewController _setShadowVisible:](self, "_setShadowVisible:", 0);
  -[SUOverlayViewController _applyDisplayProperties](self, "_applyDisplayProperties");
}

- (void)restoreArchivableContext:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIViewController *backViewController;
  void *v11;
  objc_super v12;

  v5 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("back"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v5, "copyViewController");
    -[SUOverlayViewController setBackViewController:](self, "setBackViewController:", v6);

  }
  v7 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("front"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copyViewController");
    -[SUOverlayViewController setFrontViewController:](self, "setFrontViewController:", v8);

  }
  v9 = objc_msgSend(a3, "valueForMetadataKey:", CFSTR("presentation"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUOverlayViewController setPresentationTransition:](self, "setPresentationTransition:", v9);
  backViewController = self->_backViewController;
  v11 = (void *)objc_msgSend(a3, "valueForMetadataKey:", CFSTR("on-front"));
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v11, "BOOLValue"))
    backViewController = self->_frontViewController;
  -[SUOverlayViewController _setActiveViewController:updateInterface:](self, "_setActiveViewController:updateInterface:", backViewController, 1);
  v12.receiver = self;
  v12.super_class = (Class)SUOverlayViewController;
  -[SUViewController restoreArchivableContext:](&v12, sel_restoreArchivableContext_, a3);
}

- (id)scriptWindowContext
{
  return self->_scriptWindowContext;
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  unsigned __int8 v3;
  char v4;
  char v5;
  char v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUOverlayViewController;
  v3 = -[SUViewController shouldExcludeFromNavigationHistory](&v9, sel_shouldExcludeFromNavigationHistory);
  v4 = objc_opt_respondsToSelector();
  v5 = v4 | v3;
  if ((v4 & 1) != 0 && (v3 & 1) == 0)
    v5 = -[UIViewController shouldExcludeFromNavigationHistory](self->_backViewController, "shouldExcludeFromNavigationHistory");
  v6 = objc_opt_respondsToSelector();
  v7 = v6 | v5;
  if ((v6 & 1) != 0 && (v5 & 1) == 0)
    v7 = -[UIViewController shouldExcludeFromNavigationHistory](self->_frontViewController, "shouldExcludeFromNavigationHistory");
  return v7 & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUOverlayViewController _setShadowVisible:](self, "_setShadowVisible:", 1);
  v5.receiver = self;
  v5.super_class = (Class)SUOverlayViewController;
  -[SUViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  SUMaskedView *subviewContainerView;
  SUTouchCaptureView *v6;
  SUTouchCaptureView *touchCaptureView;
  objc_super v8;

  v3 = a3;
  if (-[SUOverlayViewController isViewLoaded](self, "isViewLoaded"))
    subviewContainerView = self->_subviewContainerView;
  else
    subviewContainerView = 0;
  if (-[SUMaskedView window](subviewContainerView, "window"))
  {
    v6 = objc_alloc_init(SUTouchCaptureView);
    self->_touchCaptureView = v6;
    -[SUTouchCaptureView addTarget:action:forControlEvents:](v6, "addTarget:action:forControlEvents:", self, sel__touchCaptureAction_, 64);
    -[SUTouchCaptureView setAutoresizingMask:](self->_touchCaptureView, "setAutoresizingMask:", 18);
    touchCaptureView = self->_touchCaptureView;
    -[SUMaskedView bounds](subviewContainerView, "bounds");
    -[SUTouchCaptureView setFrame:](touchCaptureView, "setFrame:");
    -[SUMaskedView addSubview:](subviewContainerView, "addSubview:", self->_touchCaptureView);
  }
  v8.receiver = self;
  v8.super_class = (Class)SUOverlayViewController;
  -[SUViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SUOverlayViewController _activeViewController](self, "_activeViewController");
  -[SUOverlayViewController _tearDownTouchCaptureView](self, "_tearDownTouchCaptureView");
  v5.receiver = self;
  v5.super_class = (Class)SUOverlayViewController;
  -[SUViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)imagePageViewTapped:(id)a3
{
  -[SUOverlayViewController flipWithTransition:](self, "flipWithTransition:", -[SUOverlayViewController _flipTransition](self, "_flipTransition", a3));
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int64_t state;

  v4 = a4;
  if (objc_msgSend(a3, "isDescendantOfViewController:", self->_backViewController))
  {
    v7 = self->_state & 0xFFFFFFFFFFFFFFFDLL;
    v8 = 2;
  }
  else
  {
    v9 = objc_msgSend(a3, "isDescendantOfViewController:", self->_frontViewController);
    state = self->_state;
    if (!v9)
      goto LABEL_8;
    v7 = state & 0xFFFFFFFFFFFFFFFBLL;
    v8 = 4;
  }
  if (v4)
    v8 = 0;
  state = v7 | v8;
  self->_state = state;
LABEL_8:
  self->_state = state & 0xFFFFFFFFFFFFFFFELL;
  if (!v4)
    -[SUOverlayViewController flipWithTransition:](self, "flipWithTransition:", -[SUOverlayViewController _flipTransition](self, "_flipTransition"));
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[SUOverlayViewController _overlayAnimationDidFinish](self, "_overlayAnimationDidFinish", a3, a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (void)_touchCaptureAction:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "sendAction:to:from:forEvent:", sel_overlayPageViewTapped_, 0, self, 0);
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
    -[SUOverlayViewController _performNextAction](self, "_performNextAction");
}

- (void)_finishFlipAction:(id)a3
{
  UIViewController *v5;
  UIViewController *backViewController;
  uint64_t v7;
  _BOOL8 v8;

  v5 = (UIViewController *)objc_msgSend(a3, "viewController");
  backViewController = self->_backViewController;
  if (v5 == backViewController)
    backViewController = self->_frontViewController;
  v7 = objc_msgSend((id)objc_msgSend(a3, "transition"), "type");
  if (-[SUOverlayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v8 = v7 == 1;
    -[UIViewController viewDidDisappear:](v5, "viewDidDisappear:", v8);
    -[UIViewController viewDidAppear:](backViewController, "viewDidAppear:", v8);
    if (self->_touchCaptureView)
      -[SUMaskedView bringSubviewToFront:](self->_subviewContainerView, "bringSubviewToFront:");
    -[SUOverlayViewController _setShadowVisible:](self, "_setShadowVisible:", 1);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUOverlayDidFlipNotification"), self);
}

- (void)_overlayActionDidFinish
{
  void *v3;

  v3 = (void *)-[NSMutableArray objectAtIndex:](self->_actionQueue, "objectAtIndex:", 0);
  if (objc_msgSend(v3, "actionType") == 3)
    -[SUOverlayViewController _finishFlipAction:](self, "_finishFlipAction:", v3);
  -[NSMutableArray removeObjectAtIndex:](self->_actionQueue, "removeObjectAtIndex:", 0);
  -[SUOverlayViewController _performNextAction](self, "_performNextAction");
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
    -[SUOverlayViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
}

- (void)_performFlipAction:(id)a3
{
  uint64_t v5;
  UIViewController *frontViewController;

  v5 = objc_msgSend(a3, "viewController");
  frontViewController = self->_frontViewController;
  if ((UIViewController *)v5 == frontViewController)
    frontViewController = self->_backViewController;
  -[SUOverlayViewController _setActiveViewController:updateInterface:](self, "_setActiveViewController:updateInterface:", frontViewController, 0);
  if ((-[SUOverlayViewController isViewLoaded](self, "isViewLoaded") & 1) != 0)
    -[SUOverlayViewController _performFlipTransitionAction:](self, "_performFlipTransitionAction:", a3);
  else
    -[SUOverlayViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
}

- (void)_performFlipTransitionAction:(id)a3
{
  void *v5;
  UIViewController *v6;
  UIViewController *frontViewController;
  const __CFString *v8;
  uint64_t v9;
  _BOOL8 v10;
  SUMaskedView *subviewContainerView;
  UIView *v12;
  void *v13;
  double v14;
  double v15;
  float v16;

  v5 = (void *)objc_msgSend(a3, "transition");
  v6 = (UIViewController *)objc_msgSend(a3, "viewController");
  frontViewController = self->_frontViewController;
  if (v6 == frontViewController)
  {
    frontViewController = self->_backViewController;
    v8 = CFSTR("fromRight");
  }
  else
  {
    v8 = CFSTR("fromLeft");
  }
  v9 = objc_msgSend(v5, "type");
  self->_state = self->_state & 0xFFFFFFFFFFFFFFFELL | -[SUOverlayViewController _isControllerLoaded:](self, "_isControllerLoaded:", frontViewController) ^ 1;
  v10 = v9 == 1;
  -[UIViewController viewWillDisappear:](v6, "viewWillDisappear:", v10);
  -[UIViewController viewWillAppear:](frontViewController, "viewWillAppear:", v10);
  subviewContainerView = self->_subviewContainerView;
  v12 = -[UIViewController view](frontViewController, "view");
  -[SUMaskedView bounds](subviewContainerView, "bounds");
  -[UIView setFrame:](v12, "setFrame:");
  if (objc_msgSend(v5, "type") == 1)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BDE57E8], "animation");
    objc_msgSend(v13, "setDelegate:", self);
    objc_msgSend(v5, "duration");
    v15 = v14;
    UIAnimationDragCoefficient();
    objc_msgSend(v13, "setDuration:", v15 * v16);
    objc_msgSend(v13, "setFillMode:", *MEMORY[0x24BDE5978]);
    objc_msgSend(v13, "setSubtype:", v8);
    objc_msgSend(v13, "setType:", CFSTR("oglFlip"));
    objc_msgSend(v13, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[SUOverlayViewController _setShadowVisible:](self, "_setShadowVisible:", 0);
    -[UIView removeFromSuperview](-[UIViewController view](v6, "view"), "removeFromSuperview");
    objc_msgSend((id)-[SUMaskedView layer](subviewContainerView, "layer"), "addAnimation:forKey:", v13, 0);
    -[SUMaskedView addSubview:](subviewContainerView, "addSubview:", v12);
    objc_msgSend(a3, "setAnimationCount:", 1);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  else
  {
    -[UIView removeFromSuperview](-[UIViewController view](v6, "view"), "removeFromSuperview");
    -[SUMaskedView addSubview:](subviewContainerView, "addSubview:", v12);
    -[UIViewController viewDidDisappear:](v6, "viewDidDisappear:", 0);
    -[UIViewController viewDidAppear:](frontViewController, "viewDidAppear:", 0);
    -[SUOverlayViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
  }
}

- (void)_performNextAction
{
  void *v3;

  if (-[NSMutableArray count](self->_actionQueue, "count"))
  {
    v3 = (void *)-[NSMutableArray objectAtIndex:](self->_actionQueue, "objectAtIndex:", 0);
    if (objc_msgSend(v3, "actionType") == 3)
      -[SUOverlayViewController _performFlipAction:](self, "_performFlipAction:", v3);
    else
      -[SUOverlayViewController _overlayActionDidFinish](self, "_overlayActionDidFinish");
  }
}

- (id)_activeViewController
{
  id result;

  result = self->_activeViewController;
  if (!result)
  {
    -[SUOverlayViewController _setActiveViewController:updateInterface:](self, "_setActiveViewController:updateInterface:", self->_backViewController, 1);
    return self->_activeViewController;
  }
  return result;
}

- (void)_applyDisplayProperties
{
  void *v3;
  double v4;
  double shadowOpacity;
  CGPath *v6;

  if (-[SUOverlayViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_msgSend((id)-[SUOverlayViewController view](self, "view"), "layer");
    objc_msgSend(v3, "setShadowRadius:", self->_shadowRadius);
    objc_msgSend(v3, "shadowOffset");
    if (v4 > -0.00000011920929)
    {
      shadowOpacity = self->_shadowOpacity;
      *(float *)&shadowOpacity = shadowOpacity;
      objc_msgSend(v3, "setShadowOpacity:", shadowOpacity);
    }
    v6 = -[SUMaskedView copyMaskPath](self->_subviewContainerView, "copyMaskPath");
    objc_msgSend(v3, "setShadowPath:", v6);
    if (v6)
      CGPathRelease(v6);
  }
}

- (void)_applyOverlayConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  SURoundedCornersMaskProvider *v7;
  double v8;
  double v9;

  v5 = objc_msgSend(a3, "cornerRadius");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = objc_alloc_init(SURoundedCornersMaskProvider);
    -[SURoundedCornersMaskProvider setCornerRadius:](v7, "setCornerRadius:", (double)v6);
    -[SUOverlayViewController setMaskProvider:](self, "setMaskProvider:", v7);

  }
  objc_msgSend(a3, "size");
  if (v9 > 0.00000011920929)
    self->_overlaySize.height = v9;
  if (v8 > 0.00000011920929)
    self->_overlaySize.width = v8;
}

- (id)_flipTransition
{
  SUOverlayTransition *lastFlipTransition;
  SUOverlayTransition *v3;

  lastFlipTransition = self->_lastFlipTransition;
  if (!lastFlipTransition)
  {
    lastFlipTransition = objc_alloc_init(SUOverlayTransition);
    -[SUOverlayTransition setType:](lastFlipTransition, "setType:", 1);
    v3 = lastFlipTransition;
  }
  return lastFlipTransition;
}

- (BOOL)_isControllerLoaded:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend(a3, "navigationController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a3, "isSkLoaded");
  else
    return 0;
}

- (void)_setActiveViewController:(id)a3 updateInterface:(BOOL)a4
{
  UIViewController *activeViewController;
  _BOOL4 v6;
  UIView *v8;
  SUMaskedView *subviewContainerView;

  activeViewController = self->_activeViewController;
  if (activeViewController != a3)
  {
    v6 = a4;
    if (a4)
    {
      if (-[UIViewController isViewLoaded](self->_activeViewController, "isViewLoaded"))
      {
        -[UIViewController viewWillDisappear:](self->_activeViewController, "viewWillDisappear:", 0);
        -[UIView removeFromSuperview](-[UIViewController view](self->_activeViewController, "view"), "removeFromSuperview");
        -[UIViewController viewDidDisappear:](self->_activeViewController, "viewDidDisappear:", 0);
      }
      activeViewController = self->_activeViewController;
    }
    if (activeViewController)
      -[SUOverlayViewController removeChildViewController:](self, "removeChildViewController:");
    self->_activeViewController = (UIViewController *)a3;
    if (a3)
    {
      -[SUOverlayViewController addChildViewController:](self, "addChildViewController:", a3);
      if (v6)
      {
        if (-[SUOverlayViewController isViewLoaded](self, "isViewLoaded"))
        {
          -[UIViewController viewWillAppear:](self->_activeViewController, "viewWillAppear:", 0);
          v8 = -[UIViewController view](self->_activeViewController, "view");
          subviewContainerView = self->_subviewContainerView;
          -[SUMaskedView bounds](subviewContainerView, "bounds");
          -[UIView setFrame:](v8, "setFrame:");
          -[SUMaskedView addSubview:](subviewContainerView, "addSubview:", v8);
          -[UIViewController viewDidAppear:](self->_activeViewController, "viewDidAppear:", 0);
        }
      }
    }
  }
}

- (void)_setShadowVisible:(BOOL)a3
{
  void *v5;
  double v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)-[SUOverlayViewController view](self, "view"), "layer");
  v7 = v5;
  if (a3)
  {
    objc_msgSend(v5, "setShadowOffset:", 0.0, 10.0);
    -[SUOverlayViewController _applyDisplayProperties](self, "_applyDisplayProperties");
  }
  else
  {
    LODWORD(v6) = 0;
    objc_msgSend(v5, "setShadowOpacity:", v6);
    objc_msgSend(v7, "setShadowOffset:", 0.0, -3.0);
  }
}

- (id)_subviewContainerView
{
  id result;
  SUMaskedView *v4;

  result = self->_subviewContainerView;
  if (!result)
  {
    v4 = objc_alloc_init(SUMaskedView);
    self->_subviewContainerView = v4;
    -[SUMaskedView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    return self->_subviewContainerView;
  }
  return result;
}

- (void)_tearDownTouchCaptureView
{
  -[SUTouchCaptureView removeFromSuperview](self->_touchCaptureView, "removeFromSuperview");
  -[SUTouchCaptureView removeTarget:action:forControlEvents:](self->_touchCaptureView, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);

  self->_touchCaptureView = 0;
}

- (UIViewController)backViewController
{
  return self->_backViewController;
}

- (BOOL)canSwipeToDismiss
{
  return self->_canSwipeToDismiss;
}

- (void)setCanSwipeToDismiss:(BOOL)a3
{
  self->_canSwipeToDismiss = a3;
}

- (UIViewController)frontViewController
{
  return self->_frontViewController;
}

- (CGSize)overlaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_overlaySize.width;
  height = self->_overlaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SUOverlayTransition)presentationTransition
{
  return self->_presentationTransition;
}

- (void)setPresentationTransition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1176);
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (SUScriptFunction)shouldDismissFunction
{
  return self->_shouldDismissFunction;
}

- (void)setShouldDismissFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1208);
}

@end
