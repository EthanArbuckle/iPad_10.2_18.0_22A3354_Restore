@implementation _UIDebuggingOverlayPresentedViewControllerDetail

- (void)_updateForInspectedViewController:(id)a3
{
  void *v4;
  UIDebuggingInformationVCDetailViewController *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(UIDebuggingInformationVCDetailViewController);
    objc_msgSend(v10, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDebuggingInformationVCDetailViewController inspectVC:](v5, "inspectVC:", v6);

    -[_UIDebuggingOverlayViewControllerDetail setViewController:](self, "setViewController:", v5);
    objc_msgSend(v10, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDebuggingOverlayDetail setDetail:](self, "setDetail:", v9);

  }
  else
  {
    -[_UIDebuggingOverlayDetail setDetail:](self, "setDetail:", CFSTR("None"));
  }

}

@end
