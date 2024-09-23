@implementation _UIRotatingAlertController

- (_UIRotatingAlertController)init
{
  _UIRotatingAlertController *v2;
  _UIRotatingAlertController *v3;
  void *v4;
  _UIRotatingAlertController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRotatingAlertController;
  v2 = -[UIViewController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_arrowDirections = 15;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_willRotate_, CFSTR("UIWindowWillRotateNotification"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_didRotate_, CFSTR("UIWindowDidRotateNotification"), 0);
    v5 = v3;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIWindowWillRotateNotification");
  v6[1] = CFSTR("UIWindowDidRotateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIRotatingAlertController;
  -[UIAlertController dealloc](&v5, sel_dealloc);
}

- (BOOL)presentSheet
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  objc_msgSend(WeakRetained, "initialPresentationRectInHostViewForSheet:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  return -[_UIRotatingAlertController presentSheetFromRect:](self, "presentSheetFromRect:", v5, v7, v9, v11);
}

- (BOOL)presentSheetFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  void *v9;
  _UIRotatingAlertController *presentedViewControllerWhileRotating;
  _UIRotatingAlertController *v11;
  void *v12;
  BOOL v13;
  void *v14;
  _UIRotatingAlertController *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  objc_msgSend(WeakRetained, "hostViewForSheet:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    presentedViewControllerWhileRotating = (_UIRotatingAlertController *)self->_presentedViewControllerWhileRotating;
    if (!presentedViewControllerWhileRotating)
      presentedViewControllerWhileRotating = self;
    v11 = presentedViewControllerWhileRotating;
    -[UIAlertController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 7);
    -[UIViewController popoverPresentationController](v11, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceView:", v9);
    objc_msgSend(v12, "setSourceRect:", x, y, width, height);
    objc_msgSend(v12, "setPermittedArrowDirections:", self->_arrowDirections);
    if (self->_popoverPresentationControllerDelegateWhileRotating)
      objc_msgSend(v12, "setDelegate:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "presentAlertController:animated:completionBlock:", self, 1, 0);
    }
    else
    {
      +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentViewController:animated:completion:", v11, 1, 0);
      objc_msgSend(v14, "presentedViewController");
      v15 = (_UIRotatingAlertController *)objc_claimAutoreleasedReturnValue();

      if (v11 != v15)
      {
        v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    v13 = 1;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)doneWithSheet
{
  UIViewController *presentedViewControllerWhileRotating;
  UIPopoverPresentationControllerDelegate *popoverPresentationControllerDelegateWhileRotating;

  presentedViewControllerWhileRotating = self->_presentedViewControllerWhileRotating;
  self->_presentedViewControllerWhileRotating = 0;

  popoverPresentationControllerDelegateWhileRotating = self->_popoverPresentationControllerDelegateWhileRotating;
  self->_popoverPresentationControllerDelegateWhileRotating = 0;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__didRotateAndLayout, 0);
}

- (void)_presentingViewControllerWillChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRotatingAlertController;
  -[UIViewController _presentingViewControllerWillChange:](&v8, sel__presentingViewControllerWillChange_, v4);
  -[_UIRotatingAlertController rotatingSheetDelegate](self, "rotatingSheetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIRotatingAlertController rotatingSheetDelegate](self, "rotatingSheetDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sheet:presentingViewControllerWillChange:", self, v4);

  }
}

- (void)_presentingViewControllerDidChange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIRotatingAlertController;
  -[UIViewController _presentingViewControllerDidChange:](&v8, sel__presentingViewControllerDidChange_, v4);
  -[_UIRotatingAlertController rotatingSheetDelegate](self, "rotatingSheetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIRotatingAlertController rotatingSheetDelegate](self, "rotatingSheetDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sheet:presentingViewControllerDidChange:", self, v4);

  }
}

- (BOOL)_shouldAbortAdaptationFromTraitCollection:(id)a3 toTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  CGAffineTransform v6;

  if (!a5)
    return 0;
  objc_msgSend(a5, "targetTransform", a3, a4);
  return !CGAffineTransformIsIdentity(&v6);
}

- (void)willRotate:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  UIViewController *v15;
  UIViewController *presentedViewControllerWhileRotating;
  UIViewController *v17;
  void *v18;
  UIPopoverPresentationControllerDelegate *v19;
  UIPopoverPresentationControllerDelegate *popoverPresentationControllerDelegateWhileRotating;
  _QWORD v21[5];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  objc_msgSend(WeakRetained, "hostViewForSheet:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController _existingView](self, "_existingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
LABEL_10:

    goto LABEL_11;
  }
  v9 = (void *)v8;
  objc_msgSend(v6, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "presentationStyle");

    if (v13 == 7 && !self->_isRotating)
    {
      self->_isRotating = 1;
      self->_readyToPresentAfterRotation = 0;
      -[UIViewController presentingViewController](self, "presentingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[UIViewController presentedViewController](self, "presentedViewController");
        v15 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v11;
      }
      presentedViewControllerWhileRotating = self->_presentedViewControllerWhileRotating;
      self->_presentedViewControllerWhileRotating = v15;
      v17 = v15;

      objc_msgSend(v11, "popoverPresentationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegate");
      v19 = (UIPopoverPresentationControllerDelegate *)objc_claimAutoreleasedReturnValue();
      popoverPresentationControllerDelegateWhileRotating = self->_popoverPresentationControllerDelegateWhileRotating;
      self->_popoverPresentationControllerDelegateWhileRotating = v19;

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __41___UIRotatingAlertController_willRotate___block_invoke;
      v21[3] = &unk_1E16B1B28;
      v21[4] = self;
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, v21);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (void)_updateSheetPositionAfterRotation
{
  _UIRotatingAlertController *presentedViewControllerWhileRotating;
  void *v4;
  BOOL v5;
  void *v6;
  id WeakRetained;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  _BOOL4 v17;
  id v19;
  void *v20;
  double x;
  double y;
  double width;
  double height;
  UIViewController *v25;
  UIPopoverPresentationControllerDelegate *popoverPresentationControllerDelegateWhileRotating;
  _UIRotatingAlertController *v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  presentedViewControllerWhileRotating = (_UIRotatingAlertController *)self->_presentedViewControllerWhileRotating;
  if (!presentedViewControllerWhileRotating)
    presentedViewControllerWhileRotating = self;
  v27 = presentedViewControllerWhileRotating;
  -[UIViewController presentingViewController](v27, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    -[UIViewController presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  if (self->_isRotating && self->_readyToPresentAfterRotation && !v5)
  {
    self->_isRotating = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
    objc_msgSend(WeakRetained, "presentationRectInHostViewForSheet:", self);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    v17 = -[UIViewController isModalInPresentation](self->_presentedViewControllerWhileRotating, "isModalInPresentation");
    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    if (!CGRectIsEmpty(v28) || v17)
    {
      v19 = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
      objc_msgSend(v19, "hostViewForSheet:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v32.origin.x = v10;
      v32.origin.y = v12;
      v32.size.width = v14;
      v32.size.height = v16;
      v30 = CGRectIntersection(v29, v32);
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;

      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.width = width;
      v31.size.height = height;
      if (CGRectIsEmpty(v31))
      {
        if (v17)
          -[_UIRotatingAlertController presentSheet](self, "presentSheet");
      }
      else
      {
        -[_UIRotatingAlertController presentSheetFromRect:](self, "presentSheetFromRect:", x, y, width, height);
      }
      v25 = self->_presentedViewControllerWhileRotating;
      self->_presentedViewControllerWhileRotating = 0;

      popoverPresentationControllerDelegateWhileRotating = self->_popoverPresentationControllerDelegateWhileRotating;
      self->_popoverPresentationControllerDelegateWhileRotating = 0;

    }
  }

}

- (void)_didRotateAndLayout
{
  self->_readyToPresentAfterRotation = 1;
  -[_UIRotatingAlertController _updateSheetPositionAfterRotation](self, "_updateSheetPositionAfterRotation");
}

- (void)didRotate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
  objc_msgSend(WeakRetained, "hostViewForSheet:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "window");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
    -[_UIRotatingAlertController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__didRotateAndLayout, 0, 0.0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIRotatingAlertControllerDelegate)rotatingSheetDelegate
{
  return (_UIRotatingAlertControllerDelegate *)objc_loadWeakRetained((id *)&self->_rotatingSheetDelegate);
}

- (void)setRotatingSheetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rotatingSheetDelegate, a3);
}

- (unint64_t)arrowDirections
{
  return self->_arrowDirections;
}

- (void)setArrowDirections:(unint64_t)a3
{
  self->_arrowDirections = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rotatingSheetDelegate);
  objc_storeStrong((id *)&self->_popoverPresentationControllerDelegateWhileRotating, 0);
  objc_storeStrong((id *)&self->_presentedViewControllerWhileRotating, 0);
}

@end
