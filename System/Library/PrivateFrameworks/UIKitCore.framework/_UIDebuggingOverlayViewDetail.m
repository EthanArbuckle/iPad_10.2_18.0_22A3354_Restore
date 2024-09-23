@implementation _UIDebuggingOverlayViewDetail

- (void)_updateForInspectedViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  UIDebuggingInformationInspectorDetailViewController *v9;

  v4 = a3;
  v9 = objc_alloc_init(UIDebuggingInformationInspectorDetailViewController);
  objc_msgSend(v4, "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingInformationInspectorDetailViewController inspectView:](v9, "inspectView:", v5);

  -[_UIDebuggingOverlayViewControllerDetail setViewController:](self, "setViewController:", v9);
  objc_msgSend(v4, "viewIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDebuggingOverlayDetail setDetail:](self, "setDetail:", v8);

}

@end
