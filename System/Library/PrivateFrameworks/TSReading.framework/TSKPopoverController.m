@implementation TSKPopoverController

+ (BOOL)anyPopoversVisible
{
  BOOL result;

  result = gVisiblePopovers;
  if (gVisiblePopovers)
    return CFArrayGetCount((CFArrayRef)gVisiblePopovers) > 0;
  return result;
}

+ (double)defaultPopoverPlacementPadding
{
  return 30.0;
}

- (TSKPopoverController)initWithContentViewController:(id)a3
{
  TSKPopoverController *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSKPopoverController;
  v3 = -[TSKPopoverController initWithContentViewController:](&v7, sel_initWithContentViewController_, a3);
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_p_orientationWillChange_, CFSTR("TSKWillRotateToInterfaceOrientation"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_p_willShowPopoverNotification_, CFSTR("TSKPopoverControllerWillShowPopoverNotification"), 0);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_p_applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
    -[TSKPopoverController setDismissOnMoviePlayback:](v3, "setDismissOnMoviePlayback:", 1);
    -[TSKPopoverController setDismissAnimatedOnOrientationChange:](v3, "setDismissAnimatedOnOrientationChange:", 1);
    v6.receiver = v3;
    v6.super_class = (Class)TSKPopoverController;
    -[TSKPopoverController setDelegate:](&v6, sel_setDelegate_, v3);
    -[TSKPopoverController setBackgroundColor:](v3, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "whiteColor"));
  }
  return v3;
}

- (void)dealloc
{
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  objc_super v5;
  CFRange v6;

  v3 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v6.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v6.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v6, self);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)gVisiblePopovers, FirstIndexOfValue);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSKPopoverController;
  -[TSKPopoverController dealloc](&v5, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  self->mSavedDelegate = (UIPopoverControllerDelegate *)a3;
}

- (void)p_sendPopoverHidDelegateMessage
{
  -[TSKPopoverController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)-[TSKPopoverController delegate](self, "delegate"), "popoverControllerDidDismissPopover:", self);
}

- (void)p_dismissPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  TSKPopoverController *v5;
  const __CFArray *v6;
  objc_super v7;
  CFRange v8;

  if (!self->mIsDismissing)
  {
    v3 = a3;
    v5 = self;
    self->mIsDismissing = 1;
    v6 = (const __CFArray *)gVisiblePopovers;
    if (gVisiblePopovers)
    {
      v8.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
      v8.location = 0;
      LODWORD(v6) = CFArrayGetFirstIndexOfValue(v6, v8, self) != -1;
    }
    if ((-[TSKPopoverController isPopoverVisible](self, "isPopoverVisible") & 1) != 0 || (_DWORD)v6)
    {
      if (-[TSKPopoverController popoverControllerShouldDismissPopover:](self, "popoverControllerShouldDismissPopover:", self))
      {
        v7.receiver = self;
        v7.super_class = (Class)TSKPopoverController;
        -[TSKPopoverController dismissPopoverAnimated:](&v7, sel_dismissPopoverAnimated_, v3);
        -[TSKPopoverController p_sendPopoverHidDelegateMessage](self, "p_sendPopoverHidDelegateMessage");
      }
    }
    self->mIsDismissing = 0;

  }
}

- (void)p_willShowPopoverNotification:(id)a3
{
  if ((TSKPopoverController *)objc_msgSend(a3, "object") != self)
    -[TSKPopoverController p_dismissPopoverAnimated:](self, "p_dismissPopoverAnimated:", 1);
}

- (void)setDismissOnMoviePlayback:(BOOL)a3
{
  const __CFArray *v3;
  _BOOL4 mDismissOnMoviePlayback;
  void *v6;
  CFRange v7;

  self->mDismissOnMoviePlayback = a3;
  v3 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v7.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v7.location = 0;
    if (CFArrayGetFirstIndexOfValue(v3, v7, self) != -1)
    {
      mDismissOnMoviePlayback = self->mDismissOnMoviePlayback;
      v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      if (mDismissOnMoviePlayback)
        objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_moviePlaybackWillBegin_, CFSTR("TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification"), 0);
      else
        objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification"), 0);
    }
  }
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6 constrainToView:(BOOL)a7 withPadding:(double)a8
{
  _BOOL8 v8;
  double height;
  double x;
  CGFloat v14;
  CGFloat width;
  CGFloat y;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  double v32;
  CGFloat rect;
  CGFloat v34;
  CGFloat v35;
  double v36;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v8 = a6;
  height = a3.size.height;
  x = a3.origin.x;
  if (a7)
  {
    v14 = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    objc_msgSend(a4, "bounds");
    v18 = v17;
    v20 = v19;
    v21 = x;
    v23 = v22;
    v25 = v24;
    -[TSKPopoverController popoverContentSize](self, "popoverContentSize");
    v35 = v21;
    v36 = v26;
    v32 = v27;
    v38.origin.x = v21;
    v34 = width;
    v38.origin.y = y;
    v38.size.width = width;
    height = v14;
    v38.size.height = v14;
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v23;
    v45.size.height = v25;
    v39 = CGRectIntersection(v38, v45);
    v28 = v39.origin.x;
    v29 = v39.size.width;
    v30 = v39.size.height;
    rect = v39.origin.y;
    if (CGRectGetMinX(v39) > v36 + a8)
      goto LABEL_5;
    v40.origin.y = rect;
    v40.origin.x = v28;
    v40.size.width = v29;
    v40.size.height = v30;
    if (v23 - CGRectGetMaxX(v40) > v36 + a8)
      goto LABEL_5;
    v41.origin.x = v28;
    v41.origin.y = rect;
    v41.size.width = v29;
    v41.size.height = v30;
    if (CGRectGetMinY(v41) <= v32 + a8)
    {
      v42.origin.x = v28;
      v42.origin.y = rect;
      v42.size.width = v29;
      v42.size.height = v30;
      v31 = v25 - CGRectGetMaxY(v42) <= v32 + a8;
      a3.size.width = v34;
      x = v35;
      a3.origin.y = y;
      if (v31)
      {
        v43.origin.x = v28;
        v43.origin.y = rect;
        v43.size.width = v29;
        v43.size.height = v30;
        x = CGRectGetMidX(v43);
        v44.origin.x = v28;
        v44.origin.y = rect;
        v44.size.width = v29;
        v44.size.height = v30;
        a3.origin.y = CGRectGetMidY(v44);
        a3.size.width = 1.0;
        height = 1.0;
      }
    }
    else
    {
LABEL_5:
      a3.size.width = v34;
      x = v35;
      a3.origin.y = y;
    }
  }
  -[TSKPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", a4, a5, v8, x, a3.origin.y, a3.size.width, height, a8);
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double x;
  double y;
  double width;
  double height;
  const __CFArray *v14;
  __CFArray *Mutable;
  objc_super v16;
  _QWORD v17[5];
  CFRange v18;
  CGRect v19;

  v6 = a6;
  v19 = CGRectIntegral(a3);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKPopoverControllerWillShowPopoverNotification"), self);
  v14 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v18.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v18.location = 0;
    if (CFArrayGetFirstIndexOfValue(v14, v18, self) != -1)
      goto LABEL_7;
    Mutable = (__CFArray *)gVisiblePopovers;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    gVisiblePopovers = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, self);
  if (-[TSKPopoverController dismissOnMoviePlayback](self, "dismissOnMoviePlayback"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_moviePlaybackWillBegin_, CFSTR("TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification"), 0);
LABEL_7:
  objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "addPopoverController:", self);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__TSKPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke;
  v17[3] = &unk_24D829278;
  v17[4] = self;
  objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v17);
  v16.receiver = self;
  v16.super_class = (Class)TSKPopoverController;
  -[TSKPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](&v16, sel_presentPopoverFromRect_inView_permittedArrowDirections_animated_, a4, a5, v6, x, y, width, height);
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

uint64_t __88__TSKPopoverController_presentPopoverFromRect_inView_permittedArrowDirections_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKPopoverControllerDidShowPopoverNotification"), *(_QWORD *)(a1 + 32));
}

- (void)moviePlaybackWillBegin:(id)a3
{
  __CFRunLoop *Main;
  const void *v5;
  _QWORD block[5];

  Main = CFRunLoopGetMain();
  v5 = (const void *)*MEMORY[0x24BDBD598];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TSKPopoverController_moviePlaybackWillBegin___block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  CFRunLoopPerformBlock(Main, v5, block);
  CFRunLoopWakeUp(Main);
}

uint64_t __47__TSKPopoverController_moviePlaybackWillBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_dismissPopoverAnimated:", 1);
}

- (void)p_orientationWillChange:(id)a3
{
  -[TSKPopoverController p_dismissPopoverAnimated:](self, "p_dismissPopoverAnimated:", self->mDismissAnimatedOnOrientationChange);
}

- (BOOL)popoverControllerShouldDismissPopover:(id)a3
{
  int v5;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (v5 = -[UIPopoverControllerDelegate popoverControllerShouldDismissPopover:](self->mSavedDelegate, "popoverControllerShouldDismissPopover:", a3)) != 0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKWillDismissPopoverNotification"), self);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  const __CFArray *v5;
  CFIndex FirstIndexOfValue;
  CFIndex v7;
  CFRange v8;

  v5 = (const __CFArray *)gVisiblePopovers;
  if (gVisiblePopovers)
  {
    v8.length = CFArrayGetCount((CFArrayRef)gVisiblePopovers);
    v8.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v5, v8, self);
    if (FirstIndexOfValue != -1)
    {
      v7 = FirstIndexOfValue;
      if (-[TSKPopoverController dismissOnMoviePlayback](self, "dismissOnMoviePlayback"))
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSKMoviePlaybackRegistryObjectWillBeginMoviePlaybackNotification"), 0);
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)gVisiblePopovers, v7);
    }
  }
  objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "removePopoverController:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSKDidDismissPopover"), self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIPopoverControllerDelegate popoverControllerDidDismissPopover:](self->mSavedDelegate, "popoverControllerDidDismissPopover:", a3);
}

- (void)p_applicationDidEnterBackground:(id)a3
{
  -[TSKPopoverController p_dismissPopoverAnimated:](self, "p_dismissPopoverAnimated:", 0);
}

- (BOOL)dismissOnUndo
{
  return self->mDismissOnUndo;
}

- (void)setDismissOnUndo:(BOOL)a3
{
  self->mDismissOnUndo = a3;
}

- (BOOL)dismissOnMoviePlayback
{
  return self->mDismissOnMoviePlayback;
}

- (BOOL)dismissAnimatedOnOrientationChange
{
  return self->mDismissAnimatedOnOrientationChange;
}

- (void)setDismissAnimatedOnOrientationChange:(BOOL)a3
{
  self->mDismissAnimatedOnOrientationChange = a3;
}

@end
