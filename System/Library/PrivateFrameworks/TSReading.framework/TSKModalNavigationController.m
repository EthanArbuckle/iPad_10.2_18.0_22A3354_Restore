@implementation TSKModalNavigationController

- (TSKModalNavigationController)initWithRootViewController:(id)a3
{
  TSKModalNavigationController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKModalNavigationController;
  v3 = -[TSKModalNavigationController initWithRootViewController:](&v6, sel_initWithRootViewController_, a3);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_p_statusBarWillChange_, *MEMORY[0x24BDF75C0], 0);
    v3->mIsFullscreenViewController = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[UIView removeFromSuperview](self->mTopSeparator, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)TSKModalNavigationController;
  -[TSKModalNavigationController dealloc](&v3, sel_dealloc);
}

- (void)setShowTopSeparator:(BOOL)a3
{
  if (self->mShowTopSeparator != a3)
  {
    self->mShowTopSeparator = a3;
    if (-[TSKModalNavigationController isViewLoaded](self, "isViewLoaded"))
      -[TSKModalNavigationController layoutViews](self, "layoutViews");
  }
}

- (void)p_statusBarWillChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[10];

  if (TSUPhoneUI())
  {
    if (self->mIsFullscreenViewController)
    {
      v4 = (void *)MEMORY[0x24BDD1968];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "statusBarFrame");
      v5 = (void *)objc_msgSend(v4, "valueWithCGRect:");
      if (v5)
      {
        objc_msgSend(v5, "CGRectValue");
        if (v6 >= v7)
          v8 = v7;
        else
          v8 = v6;
        v9 = (void *)-[TSKModalNavigationController navigationBar](self, "navigationBar");
        objc_msgSend(v9, "frame");
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __54__TSKModalNavigationController_p_statusBarWillChange___block_invoke;
        v13[3] = &unk_24D82A930;
        v13[6] = v10;
        *(double *)&v13[7] = v8;
        v13[8] = v11;
        v13[9] = v12;
        v13[4] = v9;
        v13[5] = self;
        objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v13, 0, 0.35, 0.0);
      }
    }
  }
}

uint64_t __54__TSKModalNavigationController_p_statusBarWillChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "view"), "setNeedsLayout");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "view"), "layoutIfNeeded");
}

- (void)layoutViews
{
  _BOOL4 v3;
  UIView *mTopSeparator;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v3 = -[TSKModalNavigationController showTopSeparator](self, "showTopSeparator");
  mTopSeparator = self->mTopSeparator;
  if (v3)
  {
    if (!mTopSeparator)
    {
      v5 = (void *)-[TSKModalNavigationController navigationBar](self, "navigationBar");
      objc_msgSend(v5, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      self->mTopSeparator = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v6, v8, v10, 1.0);
      TSUScreenScale();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v7, v9, v11, 1.0 / v12);
      objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.78, 1.0));
      objc_msgSend(v13, "setUserInteractionEnabled:", 0);
      objc_msgSend(v13, "setAutoresizingMask:", 2);
      -[UIView addSubview:](self->mTopSeparator, "addSubview:", v13);

      -[UIView setUserInteractionEnabled:](self->mTopSeparator, "setUserInteractionEnabled:", 0);
      -[UIView setAutoresizingMask:](self->mTopSeparator, "setAutoresizingMask:", 34);
      objc_msgSend(v5, "addSubview:", self->mTopSeparator);
    }
  }
  else if (mTopSeparator)
  {
    -[UIView removeFromSuperview](mTopSeparator, "removeFromSuperview");

    self->mTopSeparator = 0;
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKModalNavigationController;
  -[TSKModalNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  -[TSKModalNavigationController layoutViews](self, "layoutViews");
}

- (int64_t)positionForBar:(id)a3
{
  if (self->mIsFullscreenViewController)
    return 3;
  else
    return 2;
}

- (BOOL)showTopSeparator
{
  return self->mShowTopSeparator;
}

- (BOOL)isFullscreenViewController
{
  return self->mIsFullscreenViewController;
}

- (void)setIsFullscreenViewController:(BOOL)a3
{
  self->mIsFullscreenViewController = a3;
}

@end
