@implementation PXPhotosGridEdgeSwipeInteractiveDismissalTransition

- (PXPhotosGridEdgeSwipeInteractiveDismissalTransition)initWithEdgeSwipeGesture:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  PXPhotosGridEdgeSwipeInteractiveDismissalTransition *v9;
  PXPhotosGridEdgeSwipeInteractiveDismissalTransition *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosGridEdgeSwipeInteractiveDismissalTransition;
  v9 = -[UIPercentDrivenInteractiveTransition init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_edgeSwipeGesture, a3);
    objc_msgSend(v7, "addTarget:action:", v10, sel__handleEdgeSwipeGesture_);
    objc_storeStrong((id *)&v10->_viewController, a4);
    -[UIPercentDrivenInteractiveTransition setWantsInteractiveStart:](v10, "setWantsInteractiveStart:", 0);
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->isRTL = objc_msgSend(v11, "effectiveUserInterfaceLayoutDirection") == 1;

  }
  return v10;
}

- (void)startInteractiveTransition:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotosGridEdgeSwipeInteractiveDismissalTransition;
  v4 = a3;
  -[UIPercentDrivenInteractiveTransition startInteractiveTransition:](&v6, sel_startInteractiveTransition_, v4);
  -[PXPhotosGridEdgeSwipeInteractiveDismissalTransition delegate](self, "delegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runTransitionAnimation:", v4);

}

- (void)_handleEdgeSwipeGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");

  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v6);

  v7 = objc_msgSend(v4, "state");
  switch(v7)
  {
    case 1:
      -[UIPercentDrivenInteractiveTransition setWantsInteractiveStart:](self, "setWantsInteractiveStart:", 1);
      -[PXPhotosGridEdgeSwipeInteractiveDismissalTransition viewController](self, "viewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

      break;
    case 2:
      PXClamp();
      -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](self, "updateInteractiveTransition:");
      break;
    case 3:
      -[UIPercentDrivenInteractiveTransition setWantsInteractiveStart:](self, "setWantsInteractiveStart:", 0);
      if (!-[PXPhotosGridEdgeSwipeInteractiveDismissalTransition _shouldCompleteTransition](self, "_shouldCompleteTransition"))goto LABEL_2;
      -[UIPercentDrivenInteractiveTransition finishInteractiveTransition](self, "finishInteractiveTransition");
      break;
    case 4:
    case 5:
LABEL_2:
      -[UIPercentDrivenInteractiveTransition cancelInteractiveTransition](self, "cancelInteractiveTransition");
      break;
    default:
      return;
  }
}

- (BOOL)_shouldCompleteTransition
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;
  double v9;
  BOOL v10;

  -[PXPhotosGridEdgeSwipeInteractiveDismissalTransition edgeSwipeGesture](self, "edgeSwipeGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "velocityInView:", v4);
  v6 = v5;

  if (self->isRTL)
    v7 = v6 < 0.0;
  else
    v7 = v6 > 0.0;
  v8 = fabs(v6) > 1000.0 && v7;
  -[UIPercentDrivenInteractiveTransition percentComplete](self, "percentComplete");
  v10 = v9 > 0.33 || v8;

  return v10;
}

- (UIScreenEdgePanGestureRecognizer)edgeSwipeGesture
{
  return self->_edgeSwipeGesture;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (PXPhotosGridEdgeSwipeInteractiveDismissalDelegate)delegate
{
  return (PXPhotosGridEdgeSwipeInteractiveDismissalDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_edgeSwipeGesture, 0);
}

@end
