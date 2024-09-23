@implementation UIViewController(SUOverlayBackgroundAdditions)

- (uint64_t)dismissOverlayBackgroundViewController
{
  __objc2_class *v1;

  v1 = (__objc2_class *)objc_msgSend(a1, "parentViewController");
  if (!v1)
    v1 = SUClientDispatch;
  return -[__objc2_class dismissOverlayBackgroundViewController](v1, "dismissOverlayBackgroundViewController");
}

- (uint64_t)overlayBackgroundViewController
{
  __objc2_class *v1;

  v1 = (__objc2_class *)objc_msgSend(a1, "parentViewController");
  if (!v1)
    v1 = SUClientDispatch;
  return -[__objc2_class overlayBackgroundViewController](v1, "overlayBackgroundViewController");
}

- (uint64_t)presentOverlayBackgroundViewController:()SUOverlayBackgroundAdditions
{
  __objc2_class *v4;

  v4 = (__objc2_class *)objc_msgSend(a1, "parentViewController");
  if (!v4)
    v4 = SUClientDispatch;
  return -[__objc2_class presentOverlayBackgroundViewController:](v4, "presentOverlayBackgroundViewController:", a3);
}

- (BOOL)presentOverlayViewController:()SUOverlayBackgroundAdditions withTransition:
{
  SUOverlayBackgroundViewController *v7;
  SUOverlayBackgroundViewController *v8;

  v7 = (SUOverlayBackgroundViewController *)objc_msgSend(a1, "overlayBackgroundViewController");
  if (!v7)
  {
    v8 = objc_alloc_init(SUOverlayBackgroundViewController);
    -[SUViewController setClientInterface:](v8, "setClientInterface:", objc_msgSend(0, "clientInterface"));
    if (objc_msgSend(a1, "presentOverlayBackgroundViewController:", v8))
      v7 = v8;
    else
      v7 = 0;

  }
  if (!objc_msgSend(a3, "clientInterface"))
    objc_msgSend(a3, "setClientInterface:", -[SUViewController clientInterface](v7, "clientInterface"));
  -[SUOverlayBackgroundViewController presentOverlay:withTransition:](v7, "presentOverlay:withTransition:", a3, a4);
  return v7 != 0;
}

- (uint64_t)presentViewController:()SUOverlayBackgroundAdditions inOverlayWithConfiguration:
{
  void *v7;
  SUOverlayViewController *v8;
  SUOverlayTransition *v9;
  uint64_t v10;

  objc_opt_class();
  v7 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v7 = (void *)objc_msgSend(a3, "navigationController");
  objc_msgSend(v7, "setNavigationBarHidden:", objc_msgSend(a4, "shouldShowNavigationBar") ^ 1);
  v8 = -[SUOverlayViewController initWithOverlayConfiguration:]([SUOverlayViewController alloc], "initWithOverlayConfiguration:", a4);
  -[SUOverlayViewController setBackViewController:](v8, "setBackViewController:", a3);
  v9 = objc_alloc_init(SUOverlayTransition);
  -[SUOverlayTransition setType:](v9, "setType:", +[SUOverlayTransition transitionTypeFromString:](SUOverlayTransition, "transitionTypeFromString:", objc_msgSend(a4, "transitionName")));
  v10 = objc_msgSend(a1, "presentOverlayViewController:withTransition:", v8, v9);

  return v10;
}

@end
