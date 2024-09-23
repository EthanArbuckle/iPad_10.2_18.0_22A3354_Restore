@implementation VUIModalPresenter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  return (id)sharedInstance___presenter;
}

void __35__VUIModalPresenter_sharedInstance__block_invoke()
{
  VUIModalPresenter *v0;
  void *v1;

  v0 = objc_alloc_init(VUIModalPresenter);
  v1 = (void *)sharedInstance___presenter;
  sharedInstance___presenter = (uint64_t)v0;

}

- (VUIModalPresenter)init
{
  VUIModalPresenter *v2;
  uint64_t v3;
  _UIProgressiveBlurPresentationAnimator *presentingAnimator;
  uint64_t v5;
  _UIProgressiveBlurPresentationAnimator *dismissingAnimator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIModalPresenter;
  v2 = -[VUIModalPresenter init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE70]), "initForPresenting:", 1);
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = (_UIProgressiveBlurPresentationAnimator *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE70]), "initForPresenting:", 0);
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = (_UIProgressiveBlurPresentationAnimator *)v5;

  }
  return v2;
}

- (id)_presentationControllers
{
  NSHashTable *presentationControllers;
  NSHashTable *v4;
  NSHashTable *v5;

  presentationControllers = self->__presentationControllers;
  if (!presentationControllers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->__presentationControllers;
    self->__presentationControllers = v4;

    presentationControllers = self->__presentationControllers;
  }
  return presentationControllers;
}

- (NSArray)presentedViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[VUIModalPresenter _presentationControllers](self, "_presentationControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VUIModalPresenter _presentationControllers](self, "_presentationControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v11, "viewControllers", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v21 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
              if ((objc_msgSend(v5, "containsObject:", v17) & 1) == 0)
                objc_msgSend(v5, "addObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v14);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v18;
}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  VUIModalPresenter *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  VUIModalPresentationNavigationController *v23;
  char v24;
  char v25;
  VUIModalPresenter *v26;
  VUIModalPresenter *v27;
  VUIModalPresentationNavigationController *v28;
  void (**v29)(_QWORD);
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(_QWORD);
  _QWORD v35[4];
  VUIModalPresentationNavigationController *v36;
  VUIModalPresenter *v37;
  VUIModalPresenter *v38;
  id v39;
  id v40;
  void (**v41)(_QWORD, _QWORD, _QWORD);
  id v42;
  char v43;
  char v44;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = (VUIModalPresenter *)a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))v13;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v11;
      objc_msgSend(v15, "vuiPresentedViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "vuiPresentedViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v17, "configuration", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "type");
    v20 = -[VUIModalPresenter type](v12, "type");

    v21 = v10;
    if (v19 == v20)
    {
      if (!v17)
      {
LABEL_16:
        v23 = -[VUIModalPresentationNavigationController initWithConfiguration:]([VUIModalPresentationNavigationController alloc], "initWithConfiguration:", v12);
        v24 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v22 = -[VUIModalPresenter allowsModalOverModal](v12, "allowsModalOverModal");
      if (!v17 || (v22 & 1) == 0)
        goto LABEL_16;
    }
    v23 = v17;
    v24 = 1;
LABEL_17:
    -[VUIModalPresentationNavigationController setConfiguration:](v23, "setConfiguration:", v12);
    v25 = -[VUIModalPresenter isAnimated](v12, "isAnimated");
    objc_initWeak(location, self);
    if (-[VUIModalPresenter conformsToProtocol:](v12, "conformsToProtocol:", &unk_1F02040B0))
      v26 = v12;
    else
      v26 = self;
    v27 = v26;
    -[VUIModalPresentationNavigationController setTransitioningDelegate:](v23, "setTransitioningDelegate:", v27);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke;
    v35[3] = &unk_1E9F2B980;
    objc_copyWeak(&v42, location);
    v28 = v23;
    v36 = v28;
    v43 = v24;
    v37 = v12;
    v38 = self;
    v10 = v21;
    v39 = v21;
    v41 = v14;
    v44 = v25;
    v11 = v32;
    v40 = v32;
    v29 = (void (**)(_QWORD))MEMORY[0x1DF08E588](v35);
    -[VUIModalPresentationNavigationController transitionCoordinator](v28, "transitionCoordinator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[VUIModalPresentationNavigationController transitionCoordinator](v28, "transitionCoordinator");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4;
      v33[3] = &unk_1E9F2B9A8;
      v34 = v29;
      objc_msgSend(v31, "animateAlongsideTransition:completion:", 0, v33);

    }
    else
    {
      v29[2](v29);
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);

    goto LABEL_24;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIModalPresentationErrorDomain"), 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v17);
LABEL_24:

  }
}

void __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  char v30;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_21;
  objc_msgSend(WeakRetained, "_presentationControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 88))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "allowsModalOverModal"))
      objc_msgSend(*(id *)(a1 + 48), "presentViewController:fromViewController:options:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    else
      objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 89));
    goto LABEL_21;
  }
  v5 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 64), "vuiPresentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 56), 0);
  if (objc_msgSend(*(id *)(a1 + 40), "type") == 7)
  {
    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "popOverSourceBarButtonItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBarButtonItem:", v9);

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "popOverSourceRect");
    objc_msgSend(v10, "setSourceRect:");

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "popOverSourceView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceView:", v12);

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPermittedArrowDirections:", objc_msgSend(*(id *)(a1 + 40), "popOverArrowDirection"));

    v14 = objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1F01F90D8);
    v15 = 48;
    if (v14)
      v15 = 40;
    v16 = *(void **)(a1 + 32);
    v17 = *(id *)(a1 + v15);
    objc_msgSend(v16, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v17);

    goto LABEL_16;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") == 1001 || objc_msgSend(*(id *)(a1 + 40), "type") == 1002)
  {
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "type") == 1001);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_applyAlertActionsForController:", v19);
    objc_msgSend(v19, "setContentViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setContainingAlertController:", v19);
    v18 = v5;
    v5 = v19;
LABEL_16:

  }
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2;
  v26 = &unk_1E9F2B958;
  v27 = *(id *)(a1 + 64);
  v20 = v5;
  v28 = v20;
  v30 = *(_BYTE *)(a1 + 89);
  v29 = *(id *)(a1 + 72);
  v21 = MEMORY[0x1DF08E588](&v23);
  v22 = (void *)v21;
  if (v7)
    objc_msgSend(*(id *)(a1 + 64), "dismissViewControllerAnimated:completion:", 0, v21, v23, v24, v25, v26, v27, v28);
  else
    (*(void (**)(uint64_t))(v21 + 16))(v21);

LABEL_21:
}

void __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3;
  v4[3] = &unk_1E9F2B930;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, v3, v4);

}

uint64_t __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __81__VUIModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke;
      v18[3] = &unk_1E9F2B930;
      v19 = v8;
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", v6, v18);

      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v7, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v10, "topViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v7)
  {
    v15 = (id)objc_msgSend(v10, "popViewControllerAnimated:completion:", v6, v8);
  }
  else
  {
    objc_msgSend(v10, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObject:", v7);
    objc_msgSend(v10, "setViewControllers:animated:", v14, v6);
    if (v8)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke_2;
      v16[3] = &unk_1E9F2B930;
      v17 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v16);

    }
  }
LABEL_13:

}

uint64_t __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __63__VUIModalPresenter_dismissViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  char isKindOfClass;
  _UIProgressiveBlurPresentationAnimator *v8;

  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = 0;
  if (v6 && (isKindOfClass & 1) != 0)
    v8 = self->_presentingAnimator;

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  char isKindOfClass;
  _UIProgressiveBlurPresentationAnimator *v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v6 = self->_dismissingAnimator;

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0CEAE78];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  objc_msgSend(v9, "setBlurStyle:", 4005);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissingAnimator, 0);
  objc_storeStrong((id *)&self->_presentingAnimator, 0);
  objc_storeStrong((id *)&self->__presentationControllers, 0);
}

@end
