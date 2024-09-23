@implementation _UIActionSheetPresentationController

- (id)_visualStyleForTraitCollection:(id)a3
{
  return objc_alloc_init(_UIActionSheetPresentationControllerVisualStyleiOS);
}

- (id)_compactPresentationController
{
  void *v3;
  _UIActionSheetCompactPresentationController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _UIActionSheetCompactPresentationController *v9;
  void *v10;

  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [_UIActionSheetCompactPresentationController alloc];
    -[UIPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPresentationController traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSheetPresentationController _visualStyleForTraitCollection:](self, "_visualStyleForTraitCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIActionSheetCompactPresentationController initWithPresentedViewController:presentingViewController:visualStyle:](v4, "initWithPresentedViewController:presentingViewController:visualStyle:", v5, v6, v8);

    -[_UIActionSheetPresentationController setCompactPresentationController:](self, "setCompactPresentationController:", v9);
    -[_UIActionSheetCompactPresentationController setActionSheetDelegate:](v9, "setActionSheetDelegate:", self);
    -[_UIActionSheetPresentationController dismissActionTitle](self, "dismissActionTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActionSheetCompactPresentationController setDismissActionTitle:](v9, "setDismissActionTitle:", v10);

    -[_UIActionSheetCompactPresentationController setDismissActionUsesShorterHeightWhenCompactVertically:](v9, "setDismissActionUsesShorterHeightWhenCompactVertically:", self->_dismissActionUsesShorterHeightWhenCompactVertically);
  }
  return -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
}

- (int64_t)_presentationContextForViewController:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "_isInPopoverPresentation") & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 1) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "_isInContextOfPresentationControllerOfClass:effective:", objc_opt_class(), 1))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_UIActionSheetPresentationController _compactPresentationController](self, "_compactPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIActionSheetPresentationControllerToUse(v4, -[_UIActionSheetPresentationController _presentationContextForViewController:](self, "_presentationContextForViewController:", v6), self, v5, -[_UIActionSheetPresentationController _shouldUseCompactPresentationControllerWhenPresentedInSheet](self, "_shouldUseCompactPresentationControllerWhenPresentedInSheet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActionSheetDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIActionSheetPresentationController;
  -[UIPopoverPresentationController dealloc](&v4, sel_dealloc);
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  return 0;
}

- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4
{
  id v5;
  BOOL v6;
  objc_super v8;
  _QWORD v9[5];

  v5 = a3;
  if (-[UIPopoverPresentationController _popoverIsDismissingBecauseDismissInteractionOccurred](self, "_popoverIsDismissingBecauseDismissInteractionOccurred"))
  {
    v6 = 0;
  }
  else
  {
    v9[1] = 3221225472;
    v9[2] = __83___UIActionSheetPresentationController_dimmingViewWasTapped_withDismissCompletion___block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    v8.receiver = self;
    v8.super_class = (Class)_UIActionSheetPresentationController;
    v9[0] = MEMORY[0x1E0C809B0];
    v6 = -[UIPopoverPresentationController dimmingViewWasTapped:withDismissCompletion:](&v8, sel_dimmingViewWasTapped_withDismissCompletion_, v5, v9);
  }

  return v6;
}

- (id)_exceptionStringForNilSourceViewOrBarButtonItem
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Your application has presented a %@ (%@). In its current trait environment, the modalPresentationStyle of a %@ with this style is UIModalPresentationPopover. You must provide location information for this popover through the view controller's popoverPresentationController. You must provide either a sourceView and sourceRect or a barButtonItem.  If this information is not known when you present the view controller, you may provide it in the UIPopoverPresentationControllerDelegate method -prepareForPopoverPresentation."), v5, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setDismissActionTitle:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_dismissActionTitle, a3);
  v5 = a3;
  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDismissActionTitle:", v5);

}

- (void)setDismissActionUsesShorterHeightWhenCompactVertically:(BOOL)a3
{
  id v3;

  self->_dismissActionUsesShorterHeightWhenCompactVertically = a3;
  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDismissActionUsesShorterHeightWhenCompactVertically:", 1);

}

- (void)beginPseudoAlertPresentationMode
{
  id v2;

  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginPseudoAlertPresentationMode");

}

- (void)endPseudoAlertPresentationMode
{
  id v2;

  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endPseudoAlertPresentationMode");

}

- (void)setAvoidsKeyboardDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_avoidsKeyboardDisabled = a3;
  -[_UIActionSheetPresentationController compactPresentationController](self, "compactPresentationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAvoidsKeyboardDisabled:", v3);

}

- (void)actionSheetCompactPresentationControllerDidDismiss:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[_UIActionSheetPresentationController actionSheetDelegate](self, "actionSheetDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIActionSheetPresentationController actionSheetDelegate](self, "actionSheetDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionSheetPresentationControllerDidDismissActionSheet:", self);

  }
}

- (BOOL)actionSheetCompactPresentationControllerShouldPresentInCurrentContext:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIActionSheetPresentationController _presentationContextForViewController:](self, "_presentationContextForViewController:", v4);

  return v5 == 1;
}

- (NSString)dismissActionTitle
{
  return self->_dismissActionTitle;
}

- (BOOL)dismissActionUsesShorterHeightWhenCompactVertically
{
  return self->_dismissActionUsesShorterHeightWhenCompactVertically;
}

- (BOOL)_shouldUseCompactPresentationControllerWhenPresentedInSheet
{
  return self->__shouldUseCompactPresentationControllerWhenPresentedInSheet;
}

- (void)_setShouldUseCompactPresentationControllerWhenPresentedInSheet:(BOOL)a3
{
  self->__shouldUseCompactPresentationControllerWhenPresentedInSheet = a3;
}

- (UIActionSheetPresentationControllerDelegate)actionSheetDelegate
{
  return (UIActionSheetPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionSheetDelegate);
}

- (void)setActionSheetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionSheetDelegate, a3);
}

- (_UIActionSheetCompactPresentationController)compactPresentationController
{
  return self->_compactPresentationController;
}

- (void)setCompactPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_compactPresentationController, a3);
}

- (BOOL)avoidsKeyboardDisabled
{
  return self->_avoidsKeyboardDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compactPresentationController, 0);
  objc_destroyWeak((id *)&self->_actionSheetDelegate);
  objc_storeStrong((id *)&self->_dismissActionTitle, 0);
}

@end
