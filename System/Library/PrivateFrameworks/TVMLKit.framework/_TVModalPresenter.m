@implementation _TVModalPresenter

- (_TVModalPresenter)init
{

  return 0;
}

- (id)_hidden
{
  _TVModalPresenter *v2;
  id v3;
  __TVModalPresenterNavigationController *v4;
  UINavigationController *modalRootViewController;
  void *v6;
  uint64_t v7;
  void *v8;
  _TVPlaybackFadeAnimator *v9;
  _TVPlaybackFadeAnimator *playbackAnimator;
  uint64_t v11;
  _UIProgressiveBlurPresentationAnimator *presentingAnimator;
  uint64_t v13;
  _UIProgressiveBlurPresentationAnimator *dismissingAnimator;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_TVModalPresenter;
  v2 = -[_TVModalPresenter init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF6F98]);
    v4 = -[__TVModalPresenterNavigationController initWithRootViewController:]([__TVModalPresenterNavigationController alloc], "initWithRootViewController:", v3);
    modalRootViewController = v2->_modalRootViewController;
    v2->_modalRootViewController = &v4->super;

    -[UINavigationController setDelegate:](v2->_modalRootViewController, "setDelegate:", v2);
    -[UINavigationController setTransitioningDelegate:](v2->_modalRootViewController, "setTransitioningDelegate:", v2);
    -[UINavigationController setModalPresentationCapturesStatusBarAppearance:](v2->_modalRootViewController, "setModalPresentationCapturesStatusBarAppearance:", 1);
    -[UINavigationController setModalPresentationStyle:](v2->_modalRootViewController, "setModalPresentationStyle:", 5);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDF8028];
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__willRotateNotification_, v7, v8);

    v9 = objc_alloc_init(_TVPlaybackFadeAnimator);
    playbackAnimator = v2->_playbackAnimator;
    v2->_playbackAnimator = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7118]), "initForPresenting:", 1);
    presentingAnimator = v2->_presentingAnimator;
    v2->_presentingAnimator = (_UIProgressiveBlurPresentationAnimator *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7118]), "initForPresenting:", 0);
    dismissingAnimator = v2->_dismissingAnimator;
    v2->_dismissingAnimator = (_UIProgressiveBlurPresentationAnimator *)v13;

  }
  return v2;
}

+ (id)presenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30___TVModalPresenter_presenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (presenter_onceToken != -1)
    dispatch_once(&presenter_onceToken, block);
  return (id)presenter_presenter;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_TVModalPresenter;
  -[_TVModalPresenter dealloc](&v4, sel_dealloc);
}

- (UIViewController)presentedViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[_TVModalPresenter modalRootViewController](self, "modalRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 == 1)
  {
    v6 = 0;
  }
  else
  {
    -[_TVModalPresenter modalRootViewController](self, "modalRootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIViewController *)v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  objc_msgSend(a3, "childViewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_getAssociatedObject(v7, "TVMLPresenterConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "configurationType");

      if (v10 == 4)
      {
        v11 = 8;
        goto LABEL_8;
      }
      if (v10 == 2)
      {
        v11 = 32;
LABEL_8:
        v12 = *(id *)((char *)&self->super.isa + v11);
        goto LABEL_9;
      }
    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  objc_msgSend(a3, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_getAssociatedObject(v5, "TVMLPresenterConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, "configurationType");

      if (v8 == 4)
      {
        v9 = 16;
        goto LABEL_8;
      }
      if (v8 == 2)
      {
        v9 = 32;
LABEL_8:
        v10 = *(id *)((char *)&self->super.isa + v9);
        goto LABEL_9;
      }
    }
  }
  v10 = 0;
LABEL_9:

  return v10;
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

- (void)showController:(id)a3 fromController:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  TVModalPresenterConfiguration *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(TVModalPresenterConfiguration);
  -[_TVModalPresenter showController:fromController:withConfiguration:andCompletionBlock:](self, "showController:fromController:withConfiguration:andCompletionBlock:", v10, v9, v11, v8);

}

- (void)showController:(id)a3 fromController:(id)a4 withConfiguration:(id)a5 andCompletionBlock:(id)a6
{
  -[_TVModalPresenter showController:fromController:withConfiguration:animated:andCompletionBlock:](self, "showController:fromController:withConfiguration:animated:andCompletionBlock:", a3, a4, a5, 1, a6);
}

- (void)showController:(id)a3 fromController:(id)a4 withConfiguration:(id)a5 animated:(BOOL)a6 andCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (**v26)(_QWORD);
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void (**v32)(_QWORD);
  void *v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (**v47)(_QWORD);
  void *v48;
  id v49;
  _QWORD v50[4];
  void (**v51)(_QWORD);
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void (**v58)(_QWORD);
  id v59;
  BOOL v60;
  id location;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  BOOL v68;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(_QWORD))a7;
  if (!v12)
  {
    v39 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    {
      -[_TVModalPresenter showController:fromController:withConfiguration:animated:andCompletionBlock:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
      if (!v15)
        goto LABEL_14;
    }
    else if (!v15)
    {
      goto LABEL_14;
    }
    v15[2](v15);
    goto LABEL_14;
  }
  -[_TVModalPresenter modalRootViewController](self, "modalRootViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqual:", v16))
    goto LABEL_6;
  v17 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG))
    -[_TVModalPresenter showController:fromController:withConfiguration:animated:andCompletionBlock:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend(v16, "presentingViewController");
  v25 = objc_claimAutoreleasedReturnValue();

  v13 = (id)v25;
  if (!v25)
  {
    if (v15)
      v15[2](v15);
    v13 = 0;
  }
  else
  {
LABEL_6:
    -[_TVModalPresenter _configureModalController:withFromController:andConfiguration:](self, "_configureModalController:withFromController:andConfiguration:", v16, v13, v14);
    objc_setAssociatedObject(v12, "TVMLPresenterConfiguration", v14, (void *)1);
    v26 = v15;
    v27 = MEMORY[0x24BDAC760];
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke;
    v62[3] = &unk_24EB86B38;
    v28 = v12;
    v63 = v28;
    v48 = v16;
    v29 = v16;
    v64 = v29;
    v49 = v14;
    v30 = v14;
    v65 = v30;
    v31 = v13;
    v66 = v31;
    v47 = v26;
    v32 = v26;
    v67 = v32;
    v68 = a6;
    v33 = (void *)MEMORY[0x22767F470](v62);
    objc_initWeak(&location, self);
    v52[0] = v27;
    v52[1] = 3221225472;
    v52[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_3;
    v52[3] = &unk_24EB86B60;
    objc_copyWeak(&v59, &location);
    v34 = v29;
    v53 = v34;
    v13 = v31;
    v54 = v13;
    v35 = v33;
    v57 = v35;
    v55 = v28;
    v56 = v30;
    v60 = a6;
    v58 = v32;
    v36 = (void (**)(_QWORD))MEMORY[0x22767F470](v52);
    objc_msgSend(v34, "transitionCoordinator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      objc_msgSend(v34, "transitionCoordinator");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __97___TVModalPresenter_showController_fromController_withConfiguration_animated_andCompletionBlock___block_invoke_6;
      v50[3] = &unk_24EB86B88;
      v51 = v36;
      objc_msgSend(v38, "animateAlongsideTransition:completion:", 0, v50);

    }
    else
    {
      v36[2](v36);
    }

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);

    v16 = v48;
    v14 = v49;
    v15 = v47;
  }

LABEL_14:
}

- (void)hideController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  BOOL v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[_TVModalPresenter modalRootViewController](self, "modalRootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "presentedViewController");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject dismissViewControllerAnimated:completion:](v12, "dismissViewControllerAnimated:completion:", 0, v9);
LABEL_3:

    goto LABEL_4;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v10, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
LABEL_7:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v16)
        objc_enumerationMutation(v13);
      if (*(id *)(*((_QWORD *)&v34 + 1) + 8 * v17) == v8)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v15)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    v18 = v8;

    if (!v18)
      goto LABEL_17;
    v19 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke;
    v29[3] = &unk_24EB86BB0;
    v29[4] = self;
    v20 = v10;
    v30 = v20;
    v21 = v18;
    v31 = v21;
    v33 = a4;
    v32 = v9;
    v22 = (void (**)(_QWORD))MEMORY[0x22767F470](v29);
    objc_msgSend(v20, "transitionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v20, "transitionCoordinator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __60___TVModalPresenter_hideController_animated_withCompletion___block_invoke_2;
      v27[3] = &unk_24EB86B88;
      v28 = v22;
      objc_msgSend(v24, "animateAlongsideTransition:completion:", 0, v27);

    }
    else
    {
      v22[2](v22);
    }

  }
  else
  {
LABEL_13:

LABEL_17:
    v25 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v25;
      objc_msgSend(v10, "viewControllers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v8;
      v40 = 2112;
      v41 = v26;
      _os_log_impl(&dword_222D98000, v12, OS_LOG_TYPE_DEFAULT, "_TVModalPresenter: Cannot hide %@. It isn't in the stack: %@", buf, 0x16u);

      goto LABEL_3;
    }
  }
LABEL_4:

}

- (void)_configureModalController:(id)a3 withFromController:(id)a4 andConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  _TVModalPresenter *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "setModalPresentationStyle:", objc_msgSend(v10, "presentationStyle"));
  objc_msgSend(v8, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "_setShouldDismissWhenTappedOutside:", 1);
  objc_msgSend(v8, "setNavigationBarHidden:animated:", objc_msgSend(v10, "navigationBarHidden"), 0);
  if (objc_msgSend(v10, "configurationType") == 3)
  {
    objc_msgSend(v9, "childViewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "barButtonID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v14;
    if (v15)
    {
      v46 = self;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leftBarButtonItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        objc_msgSend(v14, "leftBarButtonItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v19);

      }
      v45 = v13;
      objc_msgSend(v14, "rightBarButtonItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        objc_msgSend(v14, "rightBarButtonItems");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObjectsFromArray:", v22);

      }
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v16;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v23)
      {
        v24 = v23;
        v42 = v11;
        v43 = v9;
        v44 = v8;
        v25 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v50 != v25)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v27, "customView");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "tv_associatedIKViewElement");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "attributes");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKey:", CFSTR("barButtonID"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "barButtonID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v31, "isEqualToString:", v32);

            if (v33)
            {
              v34 = v27;

              goto LABEL_23;
            }

          }
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
          if (v24)
            continue;
          break;
        }
        v34 = 0;
LABEL_23:
        v9 = v43;
        v8 = v44;
        v11 = v42;
      }
      else
      {
        v34 = 0;
      }

      v13 = v45;
      self = v46;
    }
    else
    {
      v34 = 0;
    }
    objc_msgSend(v8, "popoverPresentationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v34)
      objc_msgSend(v37, "setBarButtonItem:", v34);
    objc_msgSend(v10, "sourceView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend(v10, "sourceView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setSourceView:", v40);

      objc_msgSend(v10, "sourceRect");
      objc_msgSend(v38, "setSourceRect:");
    }
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBackgroundColor:", v41);

    objc_msgSend(v38, "setDelegate:", self);
    objc_msgSend(v10, "popoverSize");
    objc_msgSend(v8, "setPreferredContentSize:");

  }
  else
  {
    if (objc_msgSend(v10, "configurationType") == 1)
    {
      objc_msgSend(v10, "formSheetSize");
    }
    else
    {
      v35 = *MEMORY[0x24BDBF148];
      v36 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
    objc_msgSend(v8, "setPreferredContentSize:", v35, v36);
  }

}

- (BOOL)_isDismissing
{
  return self->_dismissing;
}

- (void)_dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  v6 = a4;
  -[_TVModalPresenter modalRootViewController](self, "modalRootViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_dismissing = 1;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __49___TVModalPresenter__dismissAnimated_completion___block_invoke;
  v16[3] = &unk_24EB86BD8;
  objc_copyWeak(&v19, &location);
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v17 = v10;
  v11 = (void (**)(_QWORD))MEMORY[0x22767F470](v16);
  objc_msgSend(v10, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __49___TVModalPresenter__dismissAnimated_completion___block_invoke_2;
    v14[3] = &unk_24EB85320;
    v15 = v11;
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", v4, v14);

  }
  else
  {
    v11[2](v11);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (void)_willRotateNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[_TVModalPresenter modalRootViewController](self, "modalRootViewController", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewController");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v7, "modalPresentationStyle");

    if (v6 == 7)
      -[_TVModalPresenter hideAllAnimated:withCompletion:](self, "hideAllAnimated:withCompletion:", 0, 0);
  }

}

- (void)_forceOrientationBackToSupportedOrientation
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v7, "statusBarOrientation") - 3) <= 1)
  {
    objc_msgSend(v7, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportedInterfaceOrientations") & 0x18;

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setOrientation:", 1);

    }
  }

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  void *v3;
  id v4;

  -[_TVModalPresenter modalRootViewController](self, "modalRootViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVModalPresenterDismissedNotification"), 0);

}

- (UINavigationController)modalRootViewController
{
  return self->_modalRootViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalRootViewController, 0);
  objc_storeStrong((id *)&self->_playbackAnimator, 0);
  objc_storeStrong((id *)&self->_dismissingAnimator, 0);
  objc_storeStrong((id *)&self->_presentingAnimator, 0);
}

- (void)showController:(uint64_t)a3 fromController:(uint64_t)a4 withConfiguration:(uint64_t)a5 animated:(uint64_t)a6 andCompletionBlock:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222D98000, a1, a3, "Cannot show nil controller.", a5, a6, a7, a8, 0);
}

- (void)showController:(uint64_t)a3 fromController:(uint64_t)a4 withConfiguration:(uint64_t)a5 animated:(uint64_t)a6 andCompletionBlock:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222D98000, a1, a3, "Cannot show controller from the ModalRootViewController", a5, a6, a7, a8, 0);
}

@end
