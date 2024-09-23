@implementation TVModalPresenter

void __30___TVModalPresenter_presenter__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_hidden");
  v2 = (void *)presenter_presenter;
  presenter_presenter = v1;

}

void __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  objc_msgSend(*(id *)(a1 + 32), "setAutomaticallyAdjustsScrollViewInsets:", 0);
  objc_msgSend(*(id *)(a1 + 40), "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32));

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "pushViewController:animated:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(a1 + 48);
    v7 = v5;
    objc_msgSend(v7, "setOverrideOrientation:", objc_msgSend(v6, "configurationType") == 2);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 56), "willPresentTraitsOverridingViewController");
  if (objc_msgSend(*(id *)(a1 + 48), "configurationType") != 3)
    goto LABEL_11;
  objc_msgSend(*(id *)(a1 + 40), "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_11:
    v12 = *(void **)(a1 + 56);
    v13 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_2;
    v15[3] = &unk_24EB86B10;
    v18 = *(_BYTE *)(a1 + 72);
    v16 = v13;
    v17 = *(id *)(a1 + 64);
    objc_msgSend(v12, "presentViewController:animated:completion:", v16, 1, v15);

    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 40), "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "barButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_11;
  v14 = *(_QWORD *)(a1 + 64);
  if (v14)
    (*(void (**)(void))(v14 + 16))();
LABEL_12:

}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __TVModalPresenterNavigationController *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 40), "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_4;
      v26[3] = &unk_24EB85320;
      v27 = *(id *)(a1 + 64);
      objc_msgSend(v17, "dismissViewControllerAnimated:completion:", 0, v26);

      v18 = v27;
LABEL_12:

      goto LABEL_17;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_5;
    v24[3] = &unk_24EB85440;
    v19 = *(void **)(a1 + 32);
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v19, "setDismissalBlock:", v24);
    v18 = v25;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 48), "setAutomaticallyAdjustsScrollViewInsets:", 0);
  v8 = objc_msgSend(*(id *)(a1 + 56), "allowsModalOverModal");
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 0, 0);

    }
    v12 = -[__TVModalPresenterNavigationController initWithRootViewController:]([__TVModalPresenterNavigationController alloc], "initWithRootViewController:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "_configureModalController:withFromController:andConfiguration:", v12, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    -[__TVModalPresenterNavigationController setNavigationBarHidden:](v12, "setNavigationBarHidden:", 1);
    v13 = *(unsigned __int8 *)(a1 + 88);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    objc_msgSend(*(id *)(a1 + 48), "appDocument");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "templateElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "elementName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("descriptiveAlertTemplate")))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appDocument");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "templateElement");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "elementName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("alertTemplate"));

      if (!v23)
      {
LABEL_16:
        objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v12, v13 != 0, 0);

        goto LABEL_17;
      }
    }
    v13 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v9, "pushViewController:animated:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 72));
LABEL_17:

}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didPresentTraitsOverridingViewController");
  return result;
}

uint64_t __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_forceOrientationBackToSupportedOrientation");
  objc_msgSend(*(id *)(a1 + 40), "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);

  objc_msgSend(*(id *)(a1 + 40), "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3 == v4)
  {
    v8 = objc_msgSend(v5, "count");

    v9 = *(unsigned __int8 *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 56);
    if (v8 == 2)
      objc_msgSend(*(id *)(a1 + 32), "_dismissAnimated:completion:", v9 != 0, v10);
    else
      objc_msgSend(*(id *)(a1 + 40), "popViewControllerAnimated:completion:", v9 != 0, v10);
  }
  else
  {
    v11 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setViewControllers:", v11);
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(void))(v7 + 16))();

  }
}

uint64_t __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49___TVModalPresenter__dismissAnimated_completion___block_invoke(id *a1)
{
  _BYTE *WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
    WeakRetained[24] = 0;
  v4 = WeakRetained;
  if (a1[5])
    dispatch_async(MEMORY[0x24BDAC9B8], a1[5]);
  objc_msgSend(a1[4], "reset");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVModalPresenterDismissedNotification"), 0);

}

uint64_t __49___TVModalPresenter__dismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_43);
  return (id)sharedInstance___presenter;
}

void __34__TVModalPresenter_sharedInstance__block_invoke()
{
  TVModalPresenter *v0;
  void *v1;

  v0 = objc_alloc_init(TVModalPresenter);
  v1 = (void *)sharedInstance___presenter;
  sharedInstance___presenter = (uint64_t)v0;

}

- (TVModalPresenter)init
{
  TVModalPresenter *v2;
  uint64_t v3;
  _UIProgressiveBlurPresentationAnimator *presentingAnimator;
  uint64_t v5;
  _UIProgressiveBlurPresentationAnimator *dismissingAnimator;
  _TVPlaybackFadeAnimator *v7;
  _TVPlaybackFadeAnimator *playbackAnimator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TVModalPresenter;
  v2 = -[TVModalPresenter init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7118]), "initForPresenting:", 1);
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = (_UIProgressiveBlurPresentationAnimator *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7118]), "initForPresenting:", 0);
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = (_UIProgressiveBlurPresentationAnimator *)v5;

    v7 = objc_alloc_init(_TVPlaybackFadeAnimator);
    playbackAnimator = v2->_playbackAnimator;
    v2->_playbackAnimator = v7;

  }
  return v2;
}

- (NSHashTable)_presentationControllers
{
  NSHashTable *presentationControllers;
  NSHashTable *v4;
  NSHashTable *v5;

  presentationControllers = self->__presentationControllers;
  if (!presentationControllers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
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

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[TVModalPresenter _presentationControllers](self, "_presentationControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[TVModalPresenter _presentationControllers](self, "_presentationControllers");
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

- (void)presentViewController:(id)a3 forResponder:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  CGRect v22;

  v21 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend((id)objc_opt_class(), "_viewControllerForResponder:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v13;
  v17 = v16;

  if (objc_msgSend(v11, "type") == 7)
  {
    objc_msgSend(v11, "popOverSourceRect");
    if (CGRectIsEmpty(v22))
    {
      objc_msgSend(v11, "popOverSourceView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v11, "popOverSourceBarButtonItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v20 == 0;

      }
    }
    else
    {
      v19 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v19)
      objc_msgSend(v11, "setPopOverSourceView:", v10);
  }
  -[TVModalPresenter presentViewController:fromViewController:options:completion:](self, "presentViewController:fromViewController:options:completion:", v21, v17, v11, v12);

}

- (void)presentViewController:(id)a3 fromViewController:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  TVModalPresenter *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  TVModalPresentationNavigationController *v20;
  char v21;
  char v22;
  char v23;
  TVModalPresenter *v24;
  TVModalPresenter *v25;
  TVModalPresentationNavigationController *v26;
  void (**v27)(_QWORD);
  void *v28;
  void *v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD v32[4];
  TVModalPresentationNavigationController *v33;
  TVModalPresenter *v34;
  TVModalPresenter *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = (TVModalPresenter *)a5;
  v13 = a6;
  objc_initWeak(location, self);
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      objc_msgSend(v14, "setPresentedModal:", 1);

    }
    objc_msgSend(v11, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "presentedViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v16, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "type");
    v19 = -[TVModalPresenter type](v12, "type");

    if (v18 == v19)
    {
      if (v16)
      {
LABEL_11:
        v20 = v16;
        v21 = 1;
LABEL_17:
        -[TVModalPresentationNavigationController setConfiguration:](v20, "setConfiguration:", v12);
        if (-[TVModalPresenter conformsToProtocol:](v12, "conformsToProtocol:", &unk_2557C1EE8))
          v24 = v12;
        else
          v24 = self;
        v25 = v24;
        -[TVModalPresentationNavigationController setTransitioningDelegate:](v20, "setTransitioningDelegate:", v25);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke;
        v32[3] = &unk_24EB87FE0;
        objc_copyWeak(&v39, location);
        v26 = v20;
        v33 = v26;
        v40 = v21;
        v34 = v12;
        v35 = self;
        v36 = v10;
        v38 = v13;
        v37 = v11;
        v27 = (void (**)(_QWORD))MEMORY[0x22767F470](v32);
        -[TVModalPresentationNavigationController transitionCoordinator](v26, "transitionCoordinator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          -[TVModalPresentationNavigationController transitionCoordinator](v26, "transitionCoordinator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4;
          v30[3] = &unk_24EB86B88;
          v31 = v27;
          objc_msgSend(v29, "animateAlongsideTransition:completion:", 0, v30);

        }
        else
        {
          v27[2](v27);
        }

        objc_destroyWeak(&v39);
        goto LABEL_24;
      }
    }
    else
    {
      v22 = -[TVModalPresenter allowsModalOverModal](v12, "allowsModalOverModal");
      if (v16)
        v23 = v22;
      else
        v23 = 0;
      if ((v23 & 1) != 0)
        goto LABEL_11;
    }
    v20 = -[TVModalPresentationNavigationController initWithConfiguration:]([TVModalPresentationNavigationController alloc], "initWithConfiguration:", v12);
    v21 = 0;
    goto LABEL_17;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVModalPresentationErrorDomain"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v16);
LABEL_24:

  }
  objc_destroyWeak(location);

}

void __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_18;
  objc_msgSend(WeakRetained, "_presentationControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 88))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "allowsModalOverModal"))
      objc_msgSend(*(id *)(a1 + 48), "presentViewController:fromViewController:options:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    else
      objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "isAnimated"));
    goto LABEL_18;
  }
  v5 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 64), "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "pushViewController:animated:", *(_QWORD *)(a1 + 56), 0);
  if (objc_msgSend(*(id *)(a1 + 40), "type") == 7)
  {
    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "popOverSourceBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBarButtonItem:", v8);

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "popOverSourceRect");
    objc_msgSend(v9, "setSourceRect:");

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "popOverSourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceView:", v11);

    objc_msgSend(*(id *)(a1 + 32), "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPermittedArrowDirections:", objc_msgSend(*(id *)(a1 + 40), "popOverArrowDirection"));

    v13 = objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_2557BF1D0);
    v14 = 48;
    if (v13)
      v14 = 40;
    v15 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + v14);
    objc_msgSend(v15, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v16);

    goto LABEL_13;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type") == 1001 || objc_msgSend(*(id *)(a1 + 40), "type") == 1002)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, objc_msgSend(*(id *)(a1 + 40), "type") == 1001);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_applyAlertActionsForController:", v18);
    objc_msgSend(v18, "setContentViewController:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setContainingAlertController:", v18);
    v17 = v5;
    v5 = v18;
LABEL_13:

  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2;
  v22[3] = &unk_24EB85610;
  v23 = *(id *)(a1 + 64);
  v19 = v5;
  v24 = v19;
  v25 = *(id *)(a1 + 72);
  v20 = MEMORY[0x22767F470](v22);
  v21 = (void *)v20;
  if (v6)
    objc_msgSend(*(id *)(a1 + 64), "dismissViewControllerAnimated:completion:", 0, v20);
  else
    (*(void (**)(uint64_t))(v20 + 16))(v20);

LABEL_18:
}

void __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3;
  v3[3] = &unk_24EB85320;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "presentViewController:animated:completion:", v2, 1, v3);

}

uint64_t __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __80__TVModalPresenter_presentViewController_fromViewController_options_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissViewControllerWithResponder:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v6 = a4;
  v19 = a3;
  v8 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend((id)objc_opt_class(), "_viewControllerForResponder:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVModalPresenter presentedViewControllers](self, "presentedViewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  -[TVModalPresenter presentedViewControllers](self, "presentedViewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if (!v9 || (v11 & 1) != 0 || (v14 & 1) != 0)
  {
    if (v9)
    {
      -[TVModalPresenter dismissViewController:animated:completion:](self, "dismissViewController:animated:completion:", v9, v6, v8);
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {
    do
    {
      objc_msgSend(v9, "parentViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v15;
      }
      else
      {
        objc_msgSend(v9, "presentingViewController");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v17;

      v9 = v18;
    }
    while (v18);
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVModalPresentationErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v9);
    goto LABEL_13;
  }
LABEL_14:

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
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke;
      v18[3] = &unk_24EB85320;
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
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke_2;
      v16[3] = &unk_24EB85320;
      v17 = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], v16);

    }
  }
LABEL_13:

}

uint64_t __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __62__TVModalPresenter_dismissViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissAllViewControllersWithAnimation:(BOOL)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = dispatch_group_create();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TVModalPresenter _presentationControllers](self, "_presentationControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        dispatch_group_enter(v6);
        objc_msgSend(v13, "presentingViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v9;
        v18[1] = 3221225472;
        v18[2] = __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke;
        v18[3] = &unk_24EB85440;
        v19 = v6;
        objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, v18);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke_2;
  v16[3] = &unk_24EB85320;
  v17 = v5;
  v15 = v5;
  dispatch_group_notify(v6, MEMORY[0x24BDAC9B8], v16);

}

void __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __70__TVModalPresenter_dismissAllViewControllersWithAnimation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

+ (id)_viewControllerForResponder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v5, "nextResponder");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (!v8)
    goto LABEL_10;
  objc_msgSend(v8, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  if (v11 != 1000)
  {
    objc_msgSend(v9, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "type");

    if (v14 == 4)
    {
      v12 = 16;
      goto LABEL_9;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  v12 = 32;
LABEL_9:
  v15 = *(id *)((char *)&self->super.isa + v12);
LABEL_11:

  return v15;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  objc_msgSend(v6, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 != 1000)
  {
    objc_msgSend(v7, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "type");

    if (v12 == 4)
    {
      v10 = 24;
      goto LABEL_9;
    }
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v10 = 32;
LABEL_9:
  v13 = *(id *)((char *)&self->super.isa + v10);
LABEL_11:

  return v13;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x24BDF7120];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithPresentedViewController:presentingViewController:", v8, v7);

  objc_msgSend(v9, "setBlurStyle:", 4005);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackAnimator, 0);
  objc_storeStrong((id *)&self->_dismissingAnimator, 0);
  objc_storeStrong((id *)&self->_presentingAnimator, 0);
  objc_storeStrong((id *)&self->__presentationControllers, 0);
}

@end
