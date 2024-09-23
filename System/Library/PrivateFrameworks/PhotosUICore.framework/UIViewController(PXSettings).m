@implementation UIViewController(PXSettings)

- (void)px_presentViewControllerInNavigationController:()PXSettings animated:dimissButtonLocation:completion:
{
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a6;
  v9 = (objc_class *)MEMORY[0x1E0DC3A40];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithRootViewController:", v10);
  objc_msgSend(v11, "setToolbarHidden:", 0);
  objc_msgSend(v11, "setModalPresentationStyle:", objc_msgSend(v10, "modalPresentationStyle"));
  objc_msgSend(v10, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v10, sel__px_dismiss_);

  if (a5 == 1)
  {
    objc_msgSend(v12, "setRightBarButtonItem:", v13);
  }
  else if (!a5)
  {
    objc_msgSend(v12, "setLeftBarButtonItem:", v13);
  }
  objc_msgSend(a1, "presentViewController:animated:completion:", v11, 1, v14);

}

- (uint64_t)_px_dismiss:()PXSettings
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
