@implementation SUPlaceholderViewController

- (SUPlaceholderViewController)init
{
  SUPlaceholderViewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUPlaceholderViewController;
  v2 = -[SUViewController init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__bagDidLoadNotification_, *MEMORY[0x24BEC8B38], 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC8B38], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUPlaceholderViewController;
  -[SUViewController dealloc](&v4, sel_dealloc);
}

- (SULoadingView)loadingView
{
  SULoadingView *result;
  SULoadingView *v4;

  result = self->_loadingView;
  if (!result)
  {
    v4 = objc_alloc_init(SULoadingView);
    self->_loadingView = v4;
    -[SULoadingView setAutoresizingMask:](v4, "setAutoresizingMask:", 45);
    -[SULoadingView setHidden:](self->_loadingView, "setHidden:", self->_hideLoadingView);
    return self->_loadingView;
  }
  return result;
}

- (void)setBackgroundGradient:(id)a3
{
  SUGradient *backgroundGradient;

  backgroundGradient = self->_backgroundGradient;
  if (backgroundGradient != a3)
  {

    self->_backgroundGradient = (SUGradient *)objc_msgSend(a3, "copy");
    -[SUPlaceholderViewController _reloadBackgroundGradient](self, "_reloadBackgroundGradient");
  }
}

- (void)setDefaultBackgroundGradient:(id)a3
{
  SUGradient *defaultBackgroundGradient;

  defaultBackgroundGradient = self->_defaultBackgroundGradient;
  if (defaultBackgroundGradient != a3)
  {

    self->_defaultBackgroundGradient = (SUGradient *)objc_msgSend(a3, "copy");
    -[SUPlaceholderViewController _reloadBackgroundGradient](self, "_reloadBackgroundGradient");
  }
}

- (void)setShouldShowLoadingView:(BOOL)a3
{
  if (self->_hideLoadingView == a3)
  {
    self->_hideLoadingView = !a3;
    -[SULoadingView setHidden:](self->_loadingView, "setHidden:");
  }
}

- (BOOL)shouldShowLoadingView
{
  return !self->_hideLoadingView;
}

- (id)copyArchivableContext
{
  return 0;
}

- (id)copyDefaultScriptProperties
{
  return 0;
}

- (void)loadView
{
  id v3;
  SUGradientView *gradientView;
  SUGradientView *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x24BDF6D50]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  v6 = (id)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  objc_msgSend(v6, "setScrollEnabled:", 0);
  objc_msgSend(v6, "_setContentInsetAdjustmentBehavior:", 2);
  gradientView = self->_gradientView;
  if (!gradientView)
  {
    v5 = objc_alloc_init(SUGradientView);
    self->_gradientView = v5;
    -[SUGradientView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    gradientView = self->_gradientView;
  }
  objc_msgSend(v6, "bounds");
  -[SUGradientView setFrame:](gradientView, "setFrame:");
  objc_msgSend(v6, "addSubview:", self->_gradientView);
  -[SUPlaceholderViewController setView:](self, "setView:", v6);
  -[SUPlaceholderViewController _reloadBackgroundGradient](self, "_reloadBackgroundGradient");

}

- (void)parentViewControllerHierarchyDidChange
{
  objc_super v3;

  -[SUPlaceholderViewController _reloadBackgroundGradient](self, "_reloadBackgroundGradient");
  v3.receiver = self;
  v3.super_class = (Class)SUPlaceholderViewController;
  -[UIViewController parentViewControllerHierarchyDidChange](&v3, sel_parentViewControllerHierarchyDidChange);
}

- (void)setSkLoading:(BOOL)a3
{
  uint64_t v5;
  dispatch_time_t v6;
  _QWORD block[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUPlaceholderViewController;
  -[SUViewController setSkLoading:](&v8, sel_setSkLoading_);
  if (a3)
  {
    v5 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
    v6 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__SUPlaceholderViewController_setSkLoading___block_invoke;
    block[3] = &unk_24DE7AF90;
    block[4] = v5;
    dispatch_after(v6, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[SUPlaceholderViewController _reloadLoadingView](self, "_reloadLoadingView");
  }
}

uint64_t __44__SUPlaceholderViewController_setSkLoading___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_reloadLoadingView");
}

- (void)setScriptProperties:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUPlaceholderViewController;
  -[SUViewController setScriptProperties:](&v4, sel_setScriptProperties_, a3);
  -[SUPlaceholderViewController _reloadBackgroundGradient](self, "_reloadBackgroundGradient");
}

- (id)_copyActiveGradient
{
  id result;

  result = self->_backgroundGradient;
  if (!result)
  {
    result = -[SUPlaceholderViewController _newURLBagBackgroundGradient](self, "_newURLBagBackgroundGradient");
    if (!result)
      return self->_defaultBackgroundGradient;
  }
  return result;
}

- (id)_newURLBagBackgroundGradient
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;
  SUGradient *v7;
  __CFString *v8;
  uint64_t v9;

  v3 = -[SUClientInterface clientIdentifier](-[SUViewController clientInterface](self, "clientInterface"), "clientIdentifier");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8C48], "sharedCache"), "URLBagForContext:", v5), "valueForKey:", CFSTR("platform-gradients")), "objectForKey:", v4);
  v7 = 0;
  if (!v6)
    v7 = +[SUGradient gradientWithColor:](SUGradient, "gradientWithColor:", objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = -[UIViewController overlayViewController](self, "overlayViewController") ? CFSTR("overlay") : CFSTR("page");
    v9 = objc_msgSend(v6, "objectForKey:", v8);
    if (v9)
      return -[SUGradient initWithPropertyList:]([SUGradient alloc], "initWithPropertyList:", v9);
  }
  return v7;
}

- (void)_reloadBackgroundGradient
{
  id v3;
  id v4;

  if (-[SUPlaceholderViewController isViewLoaded](self, "isViewLoaded"))
  {
    v4 = -[SUViewController copyScriptProperties](self, "copyScriptProperties");
    if (objc_msgSend(v4, "usesBlurredBackground"))
    {
      -[SUGradientView setGradient:](self->_gradientView, "setGradient:", 0);
      -[SUGradientView setBackgroundColor:](self->_gradientView, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
    }
    else
    {
      v3 = -[SUPlaceholderViewController _copyActiveGradient](self, "_copyActiveGradient");
      -[SUGradientView setGradient:](self->_gradientView, "setGradient:", v3);

    }
  }
}

- (void)_reloadLoadingView
{
  SULoadingView *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  float v16;

  if (-[UIViewController isSkLoaded](self, "isSkLoaded"))
  {
    v3 = -[SUPlaceholderViewController loadingView](self, "loadingView");
    -[SULoadingView sizeToFit](v3, "sizeToFit");
    v4 = (void *)-[SUPlaceholderViewController view](self, "view");
    objc_msgSend(v4, "addSubview:", v3);
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    objc_msgSend(v4, "contentInset");
    v10 = v9;
    v12 = v11;
    -[SULoadingView frame](v3, "frame");
    v14 = (v6 - v13) * 0.5;
    v16 = (v8 - v15) * 0.5 - (v10 + v12) * 0.5;
    -[SULoadingView setFrame:](v3, "setFrame:", floorf(v14), floorf(v16));
  }
  else
  {
    -[SULoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  }
}

- (SUGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (SUGradient)defaultBackgroundGradient
{
  return self->_defaultBackgroundGradient;
}

@end
