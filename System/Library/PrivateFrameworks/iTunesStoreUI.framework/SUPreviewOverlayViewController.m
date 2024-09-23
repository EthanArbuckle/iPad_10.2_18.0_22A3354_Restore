@implementation SUPreviewOverlayViewController

- (void)dealloc
{
  SUPreviewOverlayStorePageViewController *storePageViewController;
  objc_super v4;

  if (self->_storePageViewController)
  {
    -[SUPreviewOverlayViewController removeChildViewController:](self, "removeChildViewController:");
    storePageViewController = self->_storePageViewController;
  }
  else
  {
    storePageViewController = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SUPreviewOverlayViewController;
  -[SUViewController dealloc](&v4, sel_dealloc);
}

+ (double)defaultAnimationDuration
{
  return 0.35;
}

+ (id)defaultRequestProperties
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v2, "setURLBagKey:", CFSTR("ix-preview-overlay"));
  return v2;
}

+ (void)offsetScrollView:(id)a3 forViewController:(id)a4
{
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom"))
    +[SUPreviewOverlayViewController _setContentInsetsForScrollView:viewController:](SUPreviewOverlayViewController, "_setContentInsetsForScrollView:viewController:", a3, SUPreviewOverlayForViewController(a4));
}

- (void)hideInNavigationController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  self->_visible = 0;
  if (a5)
    (*((void (**)(id, SEL, id, BOOL))a5 + 2))(a5, a2, a3, a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4), "postNotificationName:object:", CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), self);
}

- (void)hideInViewController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];

  if (a4)
  {
    v7 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend((id)objc_opt_class(), "defaultAnimationDuration");
    v8[5] = a5;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke;
    v9[3] = &unk_24DE7AF90;
    v9[4] = self;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke_2;
    v8[3] = &unk_24DE7E268;
    v8[4] = self;
    objc_msgSend(v7, "animateWithDuration:animations:completion:", v9, v8);
  }
  else
  {
    if (-[SUPreviewOverlayViewController isViewLoaded](self, "isViewLoaded", a3))
      objc_msgSend((id)-[SUPreviewOverlayViewController view](self, "view"), "removeFromSuperview");
    -[SUPreviewOverlayViewController removeFromParentViewController](self, "removeFromParentViewController");
    self->_visible = 0;
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), self);
  }
}

uint64_t __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "setAlpha:", 0.0);
}

uint64_t __80__SUPreviewOverlayViewController_hideInViewController_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isViewLoaded"))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1176) = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

- (BOOL)isContentLoaded
{
  if (self->_loaded)
    return !-[SUStorePageViewController _isCacheExpired](self->_storePageViewController, "_isCacheExpired");
  else
    return 0;
}

- (void)loadWithCompletionBlock:(id)a3
{
  SUPreviewOverlayStorePageViewController *storePageViewController;
  uint64_t v6;

  storePageViewController = self->_storePageViewController;
  if (storePageViewController)
    v6 = -[SUStorePageViewController URLRequestProperties](storePageViewController, "URLRequestProperties");
  else
    v6 = objc_msgSend((id)objc_opt_class(), "defaultRequestProperties");
  -[SUPreviewOverlayViewController loadWithRequestProperties:completionBlock:](self, "loadWithRequestProperties:completionBlock:", v6, a3);
}

- (void)loadWithRequestProperties:(id)a3 completionBlock:(id)a4
{
  id loadBlock;
  SUPreviewOverlayViewController *v8;

  loadBlock = self->_loadBlock;
  if (loadBlock)
  {
    v8 = self;
    (*((void (**)(void))self->_loadBlock + 2))();
    loadBlock = self->_loadBlock;
  }

  self->_loadBlock = (id)objc_msgSend(a4, "copy");
  -[SUPreviewOverlayViewController view](self, "view");
  self->_loaded = 0;
  -[SUViewController setSkLoading:](self, "setSkLoading:", 1);
  objc_msgSend(-[SUPreviewOverlayViewController _storePageViewController](self, "_storePageViewController"), "reloadWithURLRequestProperties:", a3);
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  if (-[SUPreviewOverlayViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self, "view"), "frame");
    objc_msgSend((id)-[SUPreviewOverlayViewController view](self, "view"), "setFrame:", v6, v7, width, height);
  }
  self->_contentSize.width = width;
  self->_contentSize.height = height;
}

- (void)setUserInfoString:(id)a3
{
  NSString *userInfoString;

  userInfoString = self->_userInfoString;
  if (userInfoString != a3)
  {

    self->_userInfoString = (NSString *)objc_msgSend(a3, "copy");
    -[SUStorePageViewController setScriptUserInfo:](self->_storePageViewController, "setScriptUserInfo:", a3);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPreviewOverlayUserInfoDidChangeNotification"), self);
  }
}

- (void)showInNavigationController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  CGFloat MaxY;
  CGFloat v24;
  CGRect v25;

  v7 = (void *)objc_msgSend(a3, "navigationBar");
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)-[SUPreviewOverlayViewController view](self, "view");
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v21 = (v17 - v13) * 0.5;
  v22 = v9 - floorf(v21);
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  MaxY = CGRectGetMaxY(v25);
  v24 = MaxY - v20;
  objc_msgSend(v16, "setFrame:", v22, MaxY - v20, v18, v20);
  objc_msgSend((id)objc_msgSend(v7, "superview"), "insertSubview:belowSubview:", v16, v7);
  objc_msgSend(v16, "setFrame:", v22, v20 + v24, v18, v20);
  self->_visible = 1;
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), self);
}

- (void)showInViewController:(id)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[5];

  v9 = (void *)objc_msgSend(a3, "view");
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v12 = (void *)-[SUPreviewOverlayViewController view](self, "view");
  objc_msgSend(v12, "setAutoresizingMask:", 33);
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v17 = v11 - v13;
  -[SUPreviewOverlayViewController paddingRight](self, "paddingRight");
  v19 = v17 - v18;
  -[SUPreviewOverlayViewController paddingTop](self, "paddingTop");
  objc_msgSend(v12, "setFrame:", v19, v20, v14, v16);
  objc_msgSend(v9, "addSubview:", v12);
  objc_msgSend(a3, "addChildViewController:", self);
  if (a4)
  {
    objc_msgSend(v12, "setAlpha:", 0.0);
    v21 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend((id)objc_opt_class(), "defaultAnimationDuration");
    v22[5] = a5;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke;
    v23[3] = &unk_24DE7AF90;
    v23[4] = v12;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke_2;
    v22[3] = &unk_24DE7E268;
    v22[4] = self;
    objc_msgSend(v21, "animateWithDuration:animations:completion:", v23, v22);
  }
  else
  {
    self->_visible = 1;
    objc_msgSend(v12, "setAlpha:", 1.0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), self);
  }
}

uint64_t __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __80__SUPreviewOverlayViewController_showInViewController_animated_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1176) = 1;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("SUPreviewOverlayVisibilityDidChangeNotification"), *(_QWORD *)(a1 + 32));
}

- (void)invalidateForMemoryPurge
{
  objc_super v3;

  if (!-[SUViewController isVisible](self, "isVisible"))
    self->_loaded = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUPreviewOverlayViewController;
  -[SUViewController invalidateForMemoryPurge](&v3, sel_invalidateForMemoryPurge);
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  SUPreviewOverlayViewController *v5;

  self->_loaded = a4;
  -[SUViewController setSkLoading:](self, "setSkLoading:", 0);
  if (self->_loadBlock)
  {
    v5 = self;
    (*((void (**)(void))self->_loadBlock + 2))();

    self->_loadBlock = 0;
  }
}

- (void)loadView
{
  SUPreviewOverlayView *v3;
  double height;
  SUPreviewOverlayView *v5;

  v3 = [SUPreviewOverlayView alloc];
  if (self->_contentSize.height >= 1.0)
    height = self->_contentSize.height;
  else
    height = 1.0;
  v5 = -[SUPreviewOverlayView initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, self->_contentSize.width, height);
  -[SUPreviewOverlayView setStorePageView:](v5, "setStorePageView:", objc_msgSend(-[SUPreviewOverlayViewController _storePageViewController](self, "_storePageViewController"), "view"));
  -[SUPreviewOverlayViewController setView:](self, "setView:", v5);

}

- (id)_previewOverlayContainerForViewController:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", a3, 0);
  v4 = objc_msgSend(v3, "count");
  if (v4 < 1)
  {
LABEL_7:
    v7 = 0;
  }
  else
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_msgSend(v3, "objectAtIndex:", v6);
      if ((objc_msgSend(v7, "conformsToProtocol:", &unk_2551AA348) & 1) != 0)
        break;
      v8 = (void *)objc_msgSend(v7, "childViewControllers");
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v3, "addObjectsFromArray:", v8);
        v5 = objc_msgSend(v3, "count");
      }
      if (++v6 >= v5)
        goto LABEL_7;
    }
  }

  return v7;
}

- (id)_scrollViewForViewController:(id)a3
{
  return SUViewFirstUIScrollView(objc_msgSend(a3, "view"));
}

- (id)_storePageViewController
{
  id result;
  SUPreviewOverlayStorePageViewController *v4;
  id v5;

  result = self->_storePageViewController;
  if (!result)
  {
    v4 = objc_alloc_init(SUPreviewOverlayStorePageViewController);
    self->_storePageViewController = v4;
    -[SUViewController setClientInterface:](v4, "setClientInterface:", -[SUViewController clientInterface](self, "clientInterface"));
    -[SUStorePageViewController setLoadsWhenHidden:](self->_storePageViewController, "setLoadsWhenHidden:", 1);
    -[SUStorePageViewController _setReloadsWhenCacheExpired:](self->_storePageViewController, "_setReloadsWhenCacheExpired:", 0);
    -[SUStorePageViewController setScriptUserInfo:](self->_storePageViewController, "setScriptUserInfo:", self->_userInfoString);
    -[SUStorePageViewController setURLRequestProperties:](self->_storePageViewController, "setURLRequestProperties:", objc_msgSend((id)objc_opt_class(), "defaultRequestProperties"));
    -[SUPreviewOverlayViewController addChildViewController:](self, "addChildViewController:", self->_storePageViewController);
    v5 = -[SUStorePageViewController copyDefaultScriptProperties](self->_storePageViewController, "copyDefaultScriptProperties");
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    objc_msgSend(v5, "setScrollingDisabled:", 1);
    objc_msgSend(v5, "setShouldLoadProgressively:", 0);
    -[SUStorePageViewController setScriptProperties:](self->_storePageViewController, "setScriptProperties:", v5);

    return self->_storePageViewController;
  }
  return result;
}

+ (void)_setContentInsetsForScrollView:(id)a3 viewController:(id)a4
{
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
  double v31;
  double v32;
  double v33;
  double v34;

  if (a3)
  {
    v6 = SUPreviewOverlayScrollViewIsPreviewAdjusted(a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(a3, "contentInset");
    v34 = v6;
    v14 = v13 - v6;
    v16 = v15 - v10;
    v18 = v17 - v12;
    v20 = v19 - v8;
    if (a4)
    {
      if (*((_BYTE *)a4 + 1176))
      {
        objc_msgSend((id)objc_msgSend(a4, "view"), "frame");
        v22 = v21;
      }
      else
      {
        v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
      }
      v14 = v14 + v22;
      v24 = 0.0;
      v25 = 0.0;
      v23 = 0.0;
    }
    else
    {
      v22 = *MEMORY[0x24BDF7718];
      v23 = *(double *)(MEMORY[0x24BDF7718] + 8);
      v25 = *(double *)(MEMORY[0x24BDF7718] + 16);
      v24 = *(double *)(MEMORY[0x24BDF7718] + 24);
    }
    objc_msgSend(a3, "setContentInset:", v14, v20, v16, v18);
    objc_msgSend(a3, "setScrollIndicatorInsets:", v14, v20, v16, v18);
    SUPreviewOverlayScrollViewSetPreviewAdjusted(a3, v22, v23, v25, v24);
    if (v22 != v34)
    {
      objc_msgSend(a3, "contentOffset");
      v27 = v26;
      v29 = v28 - (v22 - v34);
      if (v29 < 0.0 && v14 <= -v29)
      {
        objc_msgSend(a3, "contentSize");
        v32 = v31;
        objc_msgSend(a3, "frame");
        if (v32 >= v33)
          objc_msgSend(a3, "setContentOffset:", v27, v29);
      }
    }
  }
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)paddingRight
{
  return self->_paddingRight;
}

- (void)setPaddingRight:(double)a3
{
  self->_paddingRight = a3;
}

- (double)paddingTop
{
  return self->_paddingTop;
}

- (void)setPaddingTop:(double)a3
{
  self->_paddingTop = a3;
}

- (NSString)userInfoString
{
  return self->_userInfoString;
}

@end
