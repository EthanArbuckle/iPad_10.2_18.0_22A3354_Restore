@implementation VUIDialogInteractionController

- (VUIDialogInteractionController)initWithPresentingViewController:(id)a3 collectionView:(id)a4 controllerToPresent:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIDialogInteractionController *v12;
  VUIDialogInteractionController *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  VUIPreviewInteractionController *v17;
  VUIPreviewInteractionController *interactionController;
  uint64_t v19;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)VUIDialogInteractionController;
  v12 = -[VUIDialogInteractionController init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collectionView, a4);
    objc_storeStrong((id *)&v13->_presentingViewController, a3);
    objc_storeStrong((id *)&v13->_presentedViewController, a5);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "forceTouchCapability");

    if (v16 == 2)
    {
      v17 = -[VUIPreviewInteractionController initWithPresentingViewController:collectionView:controllerToPresent:]([VUIPreviewInteractionController alloc], "initWithPresentingViewController:collectionView:controllerToPresent:", v13->_presentingViewController, v13->_collectionView, v13->_presentedViewController);
      interactionController = v13->_interactionController;
      v13->_interactionController = v17;

      -[VUIPreviewInteractionController setDelegate:](v13->_interactionController, "setDelegate:", v13);
    }
    else
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v13, sel_longPressGestureRecognizerPressed_);
      longPressGestureRecognizer = v13->_longPressGestureRecognizer;
      v13->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v19;

      -[UILongPressGestureRecognizer setDelegate:](v13->_longPressGestureRecognizer, "setDelegate:", v13);
      -[UILongPressGestureRecognizer setDelaysTouchesBegan:](v13->_longPressGestureRecognizer, "setDelaysTouchesBegan:", 1);
      -[UICollectionView addGestureRecognizer:](v13->_collectionView, "addGestureRecognizer:", v13->_longPressGestureRecognizer);
    }
  }

  return v13;
}

- (void)dismissConfirmation
{
  void *v3;
  uint64_t *v4;
  VUIPreviewInteractionController *interactionController;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  VUIDialogInteractionController *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  VUIDialogInteractionController *v15;

  if (self->_wrapperViewController)
  {
    v3 = (void *)MEMORY[0x1E0DC3F20];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke;
    v14 = &unk_1E9F98DF0;
    v15 = self;
    v4 = &v11;
LABEL_3:
    objc_msgSend(v3, "_performWithoutDeferringTransitions:", v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
    return;
  }
  interactionController = self->_interactionController;
  if (interactionController)
  {
    -[VUIPreviewInteractionController dismissConfirmation](interactionController, "dismissConfirmation");
    -[VUIDialogInteractionController _cleanup](self, "_cleanup");
    return;
  }
  if (self->_presentingViewController)
  {
    v3 = (void *)MEMORY[0x1E0DC3F20];
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_3;
    v9 = &unk_1E9F98DF0;
    v10 = self;
    v4 = &v6;
    goto LABEL_3;
  }
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_2;
  v4[3] = &unk_1E9F98DF0;
  v4[4] = v1;
  return objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v4);
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_4;
  v4[3] = &unk_1E9F98DF0;
  v4[4] = v1;
  return objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, v4);
}

uint64_t __53__VUIDialogInteractionController_dismissConfirmation__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)longPressGestureRecognizerPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1 && !self->_isPresenting)
  {
    objc_msgSend(v5, "locationInView:", self->_collectionView);
    -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[VUIDialogInteractionController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_presentViewController_, v4, 0.2);

  }
}

- (void)presentViewController:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  VUIPresentationContainerViewController *v14;
  VUIPresentationContainerViewController *wrapperViewController;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double Width;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat x;
  CGFloat y;
  double v28;
  double height;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[6];
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(WeakRetained, "dialogInteractionController:shouldBeginInteractionForIndexPath:", self, v5))
  {
    objc_storeStrong((id *)&self->_currentIndexPath, a3);
    self->_isPresenting = 1;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceIdiom"))
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "userInterfaceIdiom") == 1)
      {
        -[UIViewController traitCollection](self->_presentingViewController, "traitCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "horizontalSizeClass") == 1)
        {
          -[UIViewController traitCollection](self->_presentingViewController, "traitCollection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "verticalSizeClass");

          if (v13 != 2)
            goto LABEL_14;
LABEL_8:
          v14 = objc_alloc_init(VUIPresentationContainerViewController);
          wrapperViewController = self->_wrapperViewController;
          self->_wrapperViewController = v14;

          -[VUIPresentationContainerViewController setModalPresentationStyle:](self->_wrapperViewController, "setModalPresentationStyle:", 4);
          -[VUIPresentationContainerViewController setTransitioningDelegate:](self->_wrapperViewController, "setTransitioningDelegate:", self);
          -[VUIPresentationContainerViewController view](self->_wrapperViewController, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIViewController view](self->_presentedViewController, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addSubview:", v17);

          -[VUIPresentationContainerViewController addChildViewController:](self->_wrapperViewController, "addChildViewController:", self->_presentedViewController);
          v18 = MEMORY[0x1E0C809B0];
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __56__VUIDialogInteractionController_presentViewController___block_invoke;
          v43[3] = &unk_1E9F98DF0;
          v43[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3F20], "_performWithoutDeferringTransitions:", v43);
          -[VUIPresentationContainerViewController presentationController](self->_wrapperViewController, "presentationController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "containerView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bounds");
          Width = CGRectGetWidth(v44);
          objc_msgSend(v20, "safeAreaInsets");
          v23 = Width - v22;
          objc_msgSend(v20, "safeAreaInsets");
          v25 = v23 - v24 + -33.0;
          objc_msgSend(v20, "bounds");
          x = v45.origin.x;
          y = v45.origin.y;
          v28 = v45.size.width;
          height = v45.size.height;
          v30 = CGRectGetWidth(v45) + -33.0;
          v46.origin.x = x;
          v46.origin.y = y;
          v46.size.width = v28;
          v46.size.height = height;
          v31 = CGRectGetHeight(v46) + -33.0;
          if (v30 >= v25)
            v32 = v25;
          else
            v32 = v30;
          v33 = fmin(v31, 56.0);
          objc_msgSend(v19, "setModalSize:", v32, v33);
          -[UIViewController setPreferredContentSize:](self->_presentedViewController, "setPreferredContentSize:", v32, v33);
          objc_msgSend(v19, "presentedView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setFrame:", (v28 - v32) * 0.5, (height - v33) * 0.5, v32, v33);
          objc_msgSend(v19, "backdropView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[VUIConfirmationBlurEffect effectWithStyle:](VUIConfirmationBlurEffect, "effectWithStyle:", 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setEffect:", v36);
          v40[0] = v18;
          v40[1] = 3221225472;
          v40[2] = __56__VUIDialogInteractionController_presentViewController___block_invoke_2;
          v40[3] = &unk_1E9F98FD8;
          v41 = v34;
          v42 = v35;
          v37 = v35;
          v38 = v34;
          objc_msgSend(v19, "setCompletedAnimationBlock:", v40);

          goto LABEL_15;
        }

      }
LABEL_14:
      -[UIViewController setModalPresentationStyle:](self->_presentedViewController, "setModalPresentationStyle:", 7);
      -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", self->_presentedViewController, 1, 0);
      -[UIViewController popoverPresentationController](self->_presentedViewController, "popoverPresentationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSourceView:", v20);
      objc_msgSend(v20, "bounds");
      objc_msgSend(v19, "setSourceRect:");
      objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryDynamicBackgroundColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setBackgroundColor:", v39);

      objc_msgSend(v19, "setPermittedArrowDirections:", 15);
LABEL_15:

      objc_msgSend(WeakRetained, "dialogInteractionController:interactionDidBeginForIndexPath:", self, v5);
      goto LABEL_16;
    }

    goto LABEL_8;
  }
LABEL_16:

}

void __56__VUIDialogInteractionController_presentViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 0, 0);

}

uint64_t __56__VUIDialogInteractionController_presentViewController___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setEffect:", 0);
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  VUIDialogPresentationController *dialogPresentationController;
  id v8;
  id v9;
  VUIDialogPresentationController *v10;
  VUIDialogPresentationController *v11;

  dialogPresentationController = self->_dialogPresentationController;
  if (!dialogPresentationController)
  {
    v8 = a4;
    v9 = a3;
    v10 = -[VUIDialogPresentationController initWithPresentedViewController:presentingViewController:]([VUIDialogPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v9, v8);

    v11 = self->_dialogPresentationController;
    self->_dialogPresentationController = v10;

    dialogPresentationController = self->_dialogPresentationController;
  }
  return dialogPresentationController;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  VUIDialogInteractionController *v11;
  _QWORD v12[5];

  v4 = a3;
  -[VUIDialogInteractionController transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v11 = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__VUIDialogInteractionController_animateTransition___block_invoke;
  v12[3] = &unk_1E9F98DF0;
  v12[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__VUIDialogInteractionController_animateTransition___block_invoke_2;
  v9[3] = &unk_1E9F9A240;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v12, v9, v6, 0.0, 1.0, 0.0);

}

void __52__VUIDialogInteractionController_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "completedAnimationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "completedAnimationBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

uint64_t __52__VUIDialogInteractionController_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  char v5;
  uint64_t result;

  v3 = *(void **)(a1 + 32);
  if (!a2)
    return objc_msgSend(v3, "completeTransition:", 0);
  v4 = objc_msgSend(v3, "transitionWasCancelled");
  v5 = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v4 ^ 1u);
  if ((v5 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_cleanup");
  return result;
}

- (BOOL)interactionController:(id)a3 shouldInteractionControllerBeginForIndexPath:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(WeakRetained, "dialogInteractionController:shouldBeginInteractionForIndexPath:", self, v6);

  if (v8)
    objc_storeStrong((id *)&self->_currentIndexPath, a4);

  return v8;
}

- (void)interactionController:(id)a3 didBeginForIndexPath:(id)a4
{
  VUIDialogInteractionControllerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dialogInteractionController:interactionDidBeginForIndexPath:", self, v6);

}

- (void)_cleanup
{
  id WeakRetained;
  VUIPresentationContainerViewController *wrapperViewController;
  VUIDialogPresentationController *dialogPresentationController;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dialogInteractionController:interactionDidEndForIndexPath:", self, self->_currentIndexPath);

  wrapperViewController = self->_wrapperViewController;
  self->_wrapperViewController = 0;

  dialogPresentationController = self->_dialogPresentationController;
  self->_dialogPresentationController = 0;

  self->_isPresenting = 0;
}

- (VUIDialogInteractionControllerDelegate)delegate
{
  return (VUIDialogInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void)setCurrentIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_currentIndexPath, a3);
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (VUIPreviewInteractionController)interactionController
{
  return self->_interactionController;
}

- (void)setInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_interactionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_currentIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dialogPresentationController, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
