@implementation TSAViewController

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSAViewController;
  -[TSAViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isViewVisible
{
  int v3;

  v3 = -[TSAViewController isViewLoaded](self, "isViewLoaded");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)-[TSAViewController view](self, "view"), "superview") != 0;
  return v3;
}

- (BOOL)isLayoutBelowApplicationToolbar
{
  return 1;
}

- (UIColor)applicationBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.870588243, 1.0);
}

- (UIColor)applicationToolbarTitleColor
{
  return 0;
}

- (UIColor)applicationToolbarTintColor
{
  return 0;
}

- (UIColor)applicationToolbarBackgroundColor
{
  return 0;
}

- (id)toolbarButtonWithTitle:(id)a3 target:(id)a4 action:(SEL)a5 isModal:(BOOL)a6
{
  void *v9;

  v9 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1, a4, a5, a6);
  objc_msgSend(v9, "setExclusiveTouch:", 1);
  objc_msgSend((id)objc_msgSend(v9, "titleLabel"), "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 17.0));
  objc_msgSend(v9, "setTitle:forState:", a3, 0);
  objc_msgSend(v9, "sizeToFit");
  if (a5)
    objc_msgSend(v9, "addTarget:action:forControlEvents:", a4, a5, 64);
  return v9;
}

- (id)toolbarButtonWithImageName:(id)a3 target:(id)a4 action:(SEL)a5
{
  void *v8;
  uint64_t v9;
  void *v10;

  if (!a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSAViewController toolbarButtonWithImageName:target:action:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSAViewController.m"), 245, CFSTR("Invalid parameter not satisfying: %s"), "imageName");
  }
  v10 = (void *)objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  objc_msgSend(v10, "setExclusiveTouch:", 1);
  objc_msgSend(v10, "setImage:forState:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", a3), 0);
  objc_msgSend(v10, "sizeToFit");
  if (a5)
    objc_msgSend(v10, "addTarget:action:forControlEvents:", a4, a5, 64);
  return v10;
}

- (id)toolbarButtonWithImageName:(id)a3 disabledImageName:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v7;
  void *v8;

  v7 = -[TSAViewController toolbarButtonWithImageName:target:action:](self, "toolbarButtonWithImageName:target:action:", a3, a5, a6);
  v8 = v7;
  if (a4)
  {
    objc_msgSend(v7, "setAdjustsImageWhenDisabled:", 0);
    objc_msgSend(v8, "setImage:forState:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", a4), 2);
  }
  return v8;
}

- (NSString)toolbarButtonModalGearImageName
{
  return (NSString *)CFSTR("TSA_GearIcon");
}

- (id)toolbarButtonForUndoWithIsModal:(BOOL)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSAViewController toolbarButtonForUndoWithIsModal:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/application/ios/TSAViewController.m"), 286, CFSTR("No undo toolbar button"));
  return 0;
}

- (id)toolbarButtonForModalDone
{
  return -[TSAViewController toolbarButtonForModalDoneWithTarget:action:](self, "toolbarButtonForModalDoneWithTarget:action:", 0, 0);
}

- (id)toolbarButtonForModalDoneWithTarget:(id)a3 action:(SEL)a4
{
  id v4;

  v4 = -[TSAViewController toolbarButtonWithTitle:target:action:isModal:](self, "toolbarButtonWithTitle:target:action:isModal:", objc_msgSend((id)TSABundle(), "localizedStringForKey:value:table:", CFSTR("Done"), &stru_24D82FEB0, CFSTR("TSApplication")), a3, a4, 1);
  objc_msgSend(v4, "setFont:", objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BDF7880]));
  objc_msgSend(v4, "sizeToFit");
  return v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[TSAViewController p_stopListeningForVoiceOverNotifications](self, "p_stopListeningForVoiceOverNotifications");
  v5.receiver = self;
  v5.super_class = (Class)TSAViewController;
  -[TSAViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSAViewController;
  -[TSAViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[TSAViewController setViewDidAppear:](self, "setViewDidAppear:", 1);
  if (-[TSAViewController showFirstLaunchCoachingTipAfterViewAppears](self, "showFirstLaunchCoachingTipAfterViewAppears"))
  {
    -[TSAViewController setShowFirstLaunchCoachingTipAfterViewAppears:](self, "setShowFirstLaunchCoachingTipAfterViewAppears:", 0);
    -[TSAViewController showFirstLaunchCoachingTipIfNecessary](self, "showFirstLaunchCoachingTipIfNecessary");
  }
  -[TSAViewController p_startListeningForVoiceOverNotifications](self, "p_startListeningForVoiceOverNotifications");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[TSAViewController setViewDidAppear:](self, "setViewDidAppear:", 0);
  v5.receiver = self;
  v5.super_class = (Class)TSAViewController;
  -[TSAViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)p_startListeningForVoiceOverNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_voiceOverStatusDidChange, *MEMORY[0x24BDF7458], 0);
}

- (void)p_voiceOverStatusDidChange
{
  if (UIAccessibilityIsVoiceOverRunning())
    -[TSAViewController dismissCoachingTips](self, "dismissCoachingTips");
}

- (void)p_stopListeningForVoiceOverNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7458], 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  objc_super v9;

  v6 = a4;
  -[TSAViewController dismissCoachingTips](self, "dismissCoachingTips");
  v9.receiver = self;
  v9.super_class = (Class)TSAViewController;
  -[TSAViewController presentViewController:animated:completion:](&v9, sel_presentViewController_animated_completion_, a3, v6, a5);
}

- (BOOL)isPresentingModalViewController
{
  return -[TSAViewController presentedViewController](self, "presentedViewController") != 0;
}

- (BOOL)modalToolbarSupportsUndo
{
  return 0;
}

- (id)imageViewFromSnapshotOfView:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGContext *v14;
  CGContext *v15;
  CGImage *Image;
  uint64_t v17;

  v4 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
  v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "window"), "screen");
  if (v5)
  {
    objc_msgSend(v5, "scale");
    v7 = v6;
  }
  else
  {
    v7 = 1.0;
  }
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
  objc_msgSend(a3, "bounds");
  objc_msgSend(a3, "sizeThatFits:", v8, v9);
  v12 = TSDMultiplySizeScalar(v10, v11, v7);
  v13 = TSDCeilSize(v12);
  v14 = TSDBitmapContextCreate(11, v13);
  if (v14)
  {
    v15 = v14;
    CGContextScaleCTM(v14, v7, v7);
    objc_msgSend((id)objc_msgSend(a3, "layer"), "renderInContext:", v15);
    Image = CGBitmapContextCreateImage(v15);
    CGContextRelease(v15);
    if (Image)
    {
      v17 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, 0, v7);
      CGImageRelease(Image);
      Image = (CGImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v17);
      -[CGImage setContentScaleFactor:](Image, "setContentScaleFactor:", v7);
    }
  }
  else
  {
    Image = 0;
  }
  objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v4);
  return Image;
}

- (id)toolbarButtonForCoachingTipsWithTarget:(id)a3 action:(SEL)a4
{
  return -[TSAViewController toolbarButtonWithImageName:disabledImageName:target:action:](self, "toolbarButtonWithImageName:disabledImageName:target:action:", CFSTR("help_reg"), 0, a3, a4);
}

- (id)toolbarButtonItemForCoachingTipsWithTarget:(id)a3 action:(SEL)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", -[TSAViewController toolbarButtonForCoachingTipsWithTarget:action:](self, "toolbarButtonForCoachingTipsWithTarget:action:", a3, a4));
}

- (void)dismissHelpWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)isFirstLaunchCoachingTipShowing
{
  return 0;
}

- (id)coachingTipsButton
{
  return 0;
}

- (id)firstLaunchCoachingTipShownUserDefaultKey
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return -[NSString stringByAppendingString:](NSStringFromClass(v2), "stringByAppendingString:", CFSTR("FirstLaunchCoachingTipShownKey"));
}

- (NSArray)leftApplicationToolbarItems
{
  return self->_leftApplicationToolbarItems;
}

- (void)setLeftApplicationToolbarItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

- (NSArray)rightApplicationToolbarItems
{
  return self->_rightApplicationToolbarItems;
}

- (void)setRightApplicationToolbarItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (double)leftToolbarItemsInset
{
  return self->_leftToolbarItemsInset;
}

- (double)rightToolbarItemsInset
{
  return self->_rightToolbarItemsInset;
}

- (double)leftToolbarItemsMaximumWidth
{
  return self->_leftToolbarItemsMaximumWidth;
}

- (void)setLeftToolbarItemsMaximumWidth:(double)a3
{
  self->_leftToolbarItemsMaximumWidth = a3;
}

- (double)rightToolbarItemsMaximumWidth
{
  return self->_rightToolbarItemsMaximumWidth;
}

- (void)setRightToolbarItemsMaximumWidth:(double)a3
{
  self->_rightToolbarItemsMaximumWidth = a3;
}

- (BOOL)viewDidAppear
{
  return self->_viewDidAppear;
}

- (void)setViewDidAppear:(BOOL)a3
{
  self->_viewDidAppear = a3;
}

- (BOOL)showFirstLaunchCoachingTipAfterViewAppears
{
  return self->_showFirstLaunchCoachingTipAfterViewAppears;
}

- (void)setShowFirstLaunchCoachingTipAfterViewAppears:(BOOL)a3
{
  self->_showFirstLaunchCoachingTipAfterViewAppears = a3;
}

- (BOOL)firstLaunchCoachingTipsWereShowingBeforeRotation
{
  return self->_firstLaunchCoachingTipsWereShowingBeforeRotation;
}

- (void)setFirstLaunchCoachingTipsWereShowingBeforeRotation:(BOOL)a3
{
  self->_firstLaunchCoachingTipsWereShowingBeforeRotation = a3;
}

- (BOOL)coachingTipsWereShowingBeforeRotation
{
  return self->_coachingTipsWereShowingBeforeRotation;
}

- (void)setCoachingTipsWereShowingBeforeRotation:(BOOL)a3
{
  self->_coachingTipsWereShowingBeforeRotation = a3;
}

- (BOOL)shouldShowHelpOnAppear
{
  return self->_shouldShowHelpOnAppear;
}

- (void)setShouldShowHelpOnAppear:(BOOL)a3
{
  self->_shouldShowHelpOnAppear = a3;
}

@end
