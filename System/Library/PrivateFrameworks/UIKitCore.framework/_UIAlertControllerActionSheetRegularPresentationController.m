@implementation _UIAlertControllerActionSheetRegularPresentationController

- (id)_compactPresentationController
{
  _UIAlertControllerActionSheetCompactPresentationController *v3;
  void *v4;
  void *v5;
  _UIAlertControllerActionSheetCompactPresentationController *v6;

  v3 = [_UIAlertControllerActionSheetCompactPresentationController alloc];
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIAlertControllerPresentationController initWithPresentedViewController:presentingViewController:](v3, "initWithPresentedViewController:presentingViewController:", v4, v5);

  return v6;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  id v5;
  _UIAlertControllerActionSheetRegularPresentationController *v6;
  void *v7;
  NSString *v8;
  Class v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = self;
  -[UIPresentationController presentingViewController](v6, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_presentationControllerClassName");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = NSClassFromString(v8);

  if (v9 == (Class)objc_opt_class())
  {
    objc_msgSend(v5, "horizontalSizeClass");
  }
  else
  {
    v10 = objc_opt_class();
    if (objc_msgSend(v5, "horizontalSizeClass") == 1 && v9 != (Class)v10)
      goto LABEL_8;
  }
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if (v12)
  {
    v13 = v6;
    goto LABEL_11;
  }
LABEL_8:
  -[_UIAlertControllerActionSheetRegularPresentationController _compactPresentationController](v6, "_compactPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAlertControllerActionSheetRegularPresentationController _alertController](v6, "_alertController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_UIAlertControllerActionSheetRegularPresentationController.m"), 40, CFSTR("Unknown presentation controller class %@ encountered when adapting UIAlertController %@"), v17, v19);

  }
  objc_msgSend(v13, "_presentedAlertControllerDidAdapt");
LABEL_11:

  return v13;
}

- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UIPopoverPresentationController _popoverIsDismissingBecauseDismissInteractionOccurred](self, "_popoverIsDismissingBecauseDismissInteractionOccurred"))
  {
    v8 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIAlertControllerActionSheetRegularPresentationController;
    v8 = -[UIPopoverPresentationController dimmingViewWasTapped:withDismissCompletion:](&v11, sel_dimmingViewWasTapped_withDismissCompletion_, v6, v7);
    -[_UIAlertControllerActionSheetRegularPresentationController _alertController](self, "_alertController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dismissFromPopoverDimmingView");

  }
  return v8;
}

- (id)_exceptionStringForNilSourceViewOrBarButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[_UIAlertControllerActionSheetRegularPresentationController _alertController](self, "_alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIAlertControllerActionSheetRegularPresentationController _alertControllerContainer](self, "_alertControllerContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Your application has presented a UIAlertController (%@) of style UIAlertControllerStyleActionSheet from %@ (%@). The modalPresentationStyle of a UIAlertController with this style is UIModalPresentationPopover. You must provide location information for this popover through the alert controller's popoverPresentationController. You must provide either a sourceView and sourceRect or a barButtonItem.  If this information is not known when you present the alert controller, you may provide it in the UIPopoverPresentationControllerDelegate method -prepareForPopoverPresentation."), v3, v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIAlertControllerActionSheetRegularPresentationController;
    -[UIPopoverPresentationController _exceptionStringForNilSourceViewOrBarButtonItem](&v12, sel__exceptionStringForNilSourceViewOrBarButtonItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_alertController
{
  void *v2;
  void *v3;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_containedAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_alertControllerContainer
{
  void *v2;
  void *v3;

  -[_UIAlertControllerActionSheetRegularPresentationController _alertController](self, "_alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_alertControllerContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
