@implementation PSUIFaceIDEnrollmentCoordinator

- (PSUIFaceIDEnrollmentCoordinator)initWithPresentingViewController:(id)a3 configuration:(unint64_t)a4
{
  id v7;
  PSUIFaceIDEnrollmentCoordinator *v8;
  PSEnrollmentNavigationController *v9;
  PSEnrollmentNavigationController *presentedViewController;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PSUIFaceIDEnrollmentCoordinator;
  v8 = -[PSUIFaceIDEnrollmentCoordinator init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(PSEnrollmentNavigationController);
    presentedViewController = v8->__presentedViewController;
    v8->__presentedViewController = v9;

    -[PSEnrollmentNavigationController setDismissalDelegate:](v8->__presentedViewController, "setDismissalDelegate:", v8);
    objc_storeStrong((id *)&v8->_presentingViewController, a3);
    v8->_configuration = a4;
  }

  return v8;
}

- (void)startWithPasscode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void (**v17)(void *, uint64_t);
  unint64_t v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD aBlock[5];
  id v34;
  id v35;
  id location;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PSPointImageOfColor();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundImage:forBarMetrics:", v8, 0);

  -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setHidesShadow:", 1);

  -[PSUIFaceIDEnrollmentCoordinator delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "faceIDEnrollmentCoordinatorShouldPresentInModalSheet:", self);

  -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((_DWORD)v10)
    v14 = 2;
  else
    v14 = 0;
  objc_msgSend(v12, "setModalPresentationStyle:", v14);

  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke;
  aBlock[3] = &unk_24F9E49E8;
  aBlock[4] = self;
  v16 = v4;
  v34 = v16;
  objc_copyWeak(&v35, &location);
  v17 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v18 = -[PSUIFaceIDEnrollmentCoordinator configuration](self, "configuration");
  if (v18 < 2)
  {
    v17[2](v17, 1);
  }
  else
  {
    if (v18 == 2)
    {
      v26 = objc_alloc(MEMORY[0x24BE0CF10]);
      v32[0] = v15;
      v32[1] = 3221225472;
      v32[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_3;
      v32[3] = &unk_24F9E4A10;
      v20 = v32;
      v32[4] = v17;
      v31[0] = v15;
      v31[1] = 3221225472;
      v31[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_4;
      v31[3] = &unk_24F9E3BF8;
      v31[4] = self;
      v21 = (void *)objc_msgSend(v26, "initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:", 0, 0, 0, v32, v31);
      v38[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setViewControllers:", v27);

      -[PSUIFaceIDEnrollmentCoordinator presentingViewController](self, "presentingViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentViewController:animated:completion:", v25, 1, 0);
      goto LABEL_10;
    }
    if (v18 == 3)
    {
      v19 = objc_alloc(MEMORY[0x24BE0CF08]);
      v30[0] = v15;
      v30[1] = 3221225472;
      v30[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_5;
      v30[3] = &unk_24F9E4A10;
      v20 = v30;
      v30[4] = v17;
      v29[0] = v15;
      v29[1] = 3221225472;
      v29[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_6;
      v29[3] = &unk_24F9E3BF8;
      v29[4] = self;
      v21 = (void *)objc_msgSend(v19, "initInBuddy:isDemo:bkDevice:withEndEnrollmentActionPrimary:enrollmentActionSecondary:", 0, 0, 0, v30, v29);
      v37 = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setViewControllers:", v22);

      -[PSUIFaceIDEnrollmentCoordinator presentingViewController](self, "presentingViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUIFaceIDEnrollmentCoordinator presentedViewController](self, "presentedViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentViewController:animated:completion:", v25, 1, 0);
LABEL_10:

    }
  }

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_2;
  v5[3] = &unk_24F9E49C0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v7 = a2;
  objc_msgSend(v3, "preloadAndCreateEnrollmentControllerWithPasscode:completion:", v4, v5);
  objc_destroyWeak(&v6);
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "configuration");
  if (v4 <= 3)
    objc_msgSend(v8, "setEnrollmentConfiguration:", qword_22E0F3DF0[v4]);
  objc_msgSend(WeakRetained, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v8, *(_BYTE *)(a1 + 40) == 0);

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(WeakRetained, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

uint64_t __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PSUIFaceIDEnrollmentCoordinator_startWithPasscode___block_invoke_6(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)preloadAndCreateEnrollmentControllerWithPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x24BE0CF00];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke;
  v11[3] = &unk_24F9E4A38;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "preloadWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke_2;
  v5[3] = &unk_24F9E38E8;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
}

void __95__PSUIFaceIDEnrollmentCoordinator_preloadAndCreateEnrollmentControllerWithPasscode_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CF00]), "initWithPreloadedState:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setDelegate:", WeakRetained);
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInSheet:", objc_msgSend(v3, "faceIDEnrollmentCoordinatorShouldPresentInModalSheet:", WeakRetained));

  objc_msgSend(v2, "primeWithPasscode:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)pearlEnrollController:(id)a3 finishedEnrollWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PSUIFaceIDEnrollmentCoordinator delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "faceIDEnrollmentCoordinator:finishedEnrollmentWithError:", self, v5);

}

- (void)enrollmentNavigationControllerWillDismiss:(id)a3
{
  id v4;

  -[PSUIFaceIDEnrollmentCoordinator delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceIDEnrollmentCoordinatorWillDismiss:", self);

}

- (void)enrollmentNavigationControllerDidDismiss:(id)a3
{
  id v4;

  -[PSUIFaceIDEnrollmentCoordinator set_presentedViewController:](self, "set_presentedViewController:", 0);
  -[PSUIFaceIDEnrollmentCoordinator delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "faceIDEnrollmentCoordinatorDidDismiss:", self);

}

- (unint64_t)configuration
{
  return self->_configuration;
}

- (PSUIFaceIDEnrollmentCoordinatorDelegate)delegate
{
  return (PSUIFaceIDEnrollmentCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (PSEnrollmentNavigationController)_presentedViewController
{
  return self->__presentedViewController;
}

- (void)set_presentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->__presentedViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__presentedViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
