@implementation PXFloatingCardPresentationController

- (PXFloatingCardPresentationController)initWithContainerViewController:(id)a3
{
  id v4;
  PXFloatingCardPresentationController *v5;
  PXFloatingCardPresentationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXFloatingCardPresentationController;
  v5 = -[PXFloatingCardPresentationController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_containerViewController, v4);

  return v6;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PXFloatingCardViewController *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXFloatingCardGestureCoordinator *v17;
  void *v18;
  void *v19;
  PXFloatingCardGestureCoordinator *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double x;
  double y;
  double width;
  double height;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[9];
  CGRect v40;
  CGRect v41;

  v4 = a4;
  v7 = a3;
  if (-[PXFloatingCardPresentationController isPresenting](self, "isPresenting"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFloatingCardPresentationController.m"), 45, CFSTR("Attempting to present a floating card while one is already being presented."));

  }
  -[PXFloatingCardPresentationController setIsPresenting:](self, "setIsPresenting:", 1);
  v8 = -[PXFloatingCardViewController initWithContentViewController:]([PXFloatingCardViewController alloc], "initWithContentViewController:", v7);
  -[PXFloatingCardViewController setDelegate:](v8, "setDelegate:", self);
  -[PXFloatingCardPresentationController setCardViewController:](self, "setCardViewController:", v8);
  if (v4)
    v9 = 0.0;
  else
    v9 = 1.0;
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", v9);

  -[PXFloatingCardPresentationController containerViewController](self, "containerViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardPresentationController _addChildViewController:toParentViewController:](self, "_addChildViewController:toParentViewController:", v8, v12);

  objc_msgSend(v7, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "grabberFooterView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v14);

  v17 = [PXFloatingCardGestureCoordinator alloc];
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFloatingCardPresentationController layout](self, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PXFloatingCardGestureCoordinator initWithCardViewController:layout:](v17, "initWithCardViewController:layout:", v18, v19);
  -[PXFloatingCardPresentationController setGestureCoordinator:](self, "setGestureCoordinator:", v20);

  -[PXFloatingCardPresentationController gestureCoordinator](self, "gestureCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[PXFloatingCardPresentationController _applyLayout](self, "_applyLayout");
  if (v4)
  {
    -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v40.origin.x = v25;
    v40.origin.y = v27;
    v40.size.width = v29;
    v40.size.height = v31;
    v41 = CGRectOffset(v40, 0.0, -15.0);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
    -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", x, y, width, height);

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __71__PXFloatingCardPresentationController_presentViewController_animated___block_invoke;
    v39[3] = &unk_1E51490B0;
    v39[4] = self;
    *(CGFloat *)&v39[5] = v25;
    *(CGFloat *)&v39[6] = v27;
    *(CGFloat *)&v39[7] = v29;
    *(CGFloat *)&v39[8] = v31;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v39, 0, 0.25, 0.0);
  }

}

- (void)_applyLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  -[PXFloatingCardPresentationController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "width");
  v5 = v4;
  objc_msgSend(v3, "initialHeight");
  v7 = v6;
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSize:", v5, v7);

  v9 = (void *)MEMORY[0x1E0DC3F10];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__PXFloatingCardPresentationController__applyLayout__block_invoke;
  v14[3] = &unk_1E5148D08;
  v14[4] = self;
  v15 = v3;
  v13 = v3;
  objc_msgSend(v9, "performWithoutAnimation:", v14);
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 33);

  -[PXFloatingCardPresentationController gestureCoordinator](self, "gestureCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutDidChange");

}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[9];
  _QWORD aBlock[5];

  v3 = a3;
  if (!-[PXFloatingCardPresentationController isPresenting](self, "isPresenting"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFloatingCardPresentationController.m"), 86, CFSTR("Attempting to dismiss a floating card while one is not presented."));

  }
  -[PXFloatingCardPresentationController setIsPresenting:](self, "setIsPresenting:", 0);
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke;
    aBlock[3] = &unk_1E5149198;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    if (v3)
    {
      -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v20 = (void *)MEMORY[0x1E0DC3F10];
      v24[0] = v7;
      v24[1] = 3221225472;
      v24[2] = __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_2;
      v24[3] = &unk_1E51490B0;
      v24[4] = self;
      v24[5] = v13;
      *(double *)&v24[6] = v15 + -15.0;
      v24[7] = v17;
      v24[8] = v19;
      v22[0] = v7;
      v22[1] = 3221225472;
      v22[2] = __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_3;
      v22[3] = &unk_1E513FE10;
      v23 = v9;
      objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 0, v24, v22, 0.25, 0.0);

    }
    else
    {
      (*((void (**)(void *))v8 + 2))(v8);
    }

  }
}

- (void)dimAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[4];
  id v13;

  v3 = a3;
  -[PXFloatingCardPresentationController cardViewController](self, "cardViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PXFloatingCardPresentationController_dimAnimated___block_invoke;
    aBlock[3] = &unk_1E5149198;
    v13 = v4;
    v7 = (void (**)(_QWORD))_Block_copy(aBlock);
    v8 = v7;
    if (v3)
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __52__PXFloatingCardPresentationController_dimAnimated___block_invoke_2;
      v10[3] = &unk_1E5148A40;
      v11 = v7;
      objc_msgSend(v9, "animateWithDuration:animations:", v10, 0.25);

    }
    else
    {
      v7[2](v7);
    }

  }
}

- (void)setLayout:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  PXFloatingCardLayout *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a4;
  v7 = (PXFloatingCardLayout *)a3;
  if (self->_layout != v7)
  {
    objc_storeStrong((id *)&self->_layout, a3);
    -[PXFloatingCardPresentationController gestureCoordinator](self, "gestureCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLayout:", v7);

    if (v4)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__PXFloatingCardPresentationController_setLayout_animated___block_invoke;
      v9[3] = &unk_1E5149198;
      v9[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v9, 0, 0.25, 0.0);
    }
    else
    {
      -[PXFloatingCardPresentationController _applyLayout](self, "_applyLayout");
    }
  }

}

- (void)_addChildViewController:(id)a3 toParentViewController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = a3;
  objc_msgSend(v5, "addChildViewController:", v8);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  objc_msgSend(v8, "didMoveToParentViewController:", v5);
}

- (void)_removeChildViewControllerFromParent:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "willMoveToParentViewController:", 0);
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v4, "removeFromParentViewController");
}

- (double)availableHeightForCardViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PXFloatingCardPresentationController containerViewController](self, "containerViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "layoutFrame");
  v7 = v6 + -30.0;

  return v7;
}

- (void)gestureCoordinatorDidBeginInteraction:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[PXFloatingCardPresentationController containerViewController](self, "containerViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

}

- (void)cardViewController:(id)a3 didUpdateHeight:(double)a4
{
  id v5;

  -[PXFloatingCardPresentationController layout](self, "layout", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateCardHeight:", a4);

}

- (void)cardViewController:(id)a3 didUpdatePosition:(unint64_t)a4
{
  id v5;

  -[PXFloatingCardPresentationController layout](self, "layout", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didUpdateCardPosition:", a4);

}

- (void)floatingCardViewControllerDismissTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXFloatingCardPresentationController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationController:dismissTappedForViewController:", self, v4);

}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (PXFloatingCardLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (PXFloatingCardPresentationControllerDelegate)delegate
{
  return (PXFloatingCardPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXFloatingCardContainer)containerViewController
{
  return (PXFloatingCardContainer *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (PXFloatingCardViewController)cardViewController
{
  return (PXFloatingCardViewController *)objc_loadWeakRetained((id *)&self->_cardViewController);
}

- (void)setCardViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewController, a3);
}

- (PXFloatingCardGestureCoordinator)gestureCoordinator
{
  return self->_gestureCoordinator;
}

- (void)setGestureCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_gestureCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureCoordinator, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layout, 0);
}

uint64_t __59__PXFloatingCardPresentationController_setLayout_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyLayout");
}

void __52__PXFloatingCardPresentationController_dimAnimated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.699999988);

}

uint64_t __52__PXFloatingCardPresentationController_dimAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeChildViewControllerFromParent:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setCardViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setGestureCoordinator:", 0);
}

void __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

}

uint64_t __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __52__PXFloatingCardPresentationController__applyLayout__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "gestureCoordinator");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerPointForPosition:", objc_msgSend(*(id *)(a1 + 40), "initialPosition"));
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCenter:", v3, v5);

}

void __71__PXFloatingCardPresentationController_presentViewController_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

}

@end
