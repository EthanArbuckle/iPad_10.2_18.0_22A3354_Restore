@implementation VUIPresenterController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23 != -1)
    dispatch_once(&sharedInstance_onceToken_23, &__block_literal_global_103);
  return (id)sharedInstance___presenter;
}

void __40__VUIPresenterController_sharedInstance__block_invoke()
{
  VUIPresenterController *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPresenterController);
  v1 = (void *)sharedInstance___presenter;
  sharedInstance___presenter = (uint64_t)v0;

}

- (VUIPresenterController)init
{
  VUIPresenterController *v2;
  uint64_t v3;
  NSMapTable *presentingSourceViewMapTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIPresenterController;
  v2 = -[VUIPresenterController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    presentingSourceViewMapTable = v2->_presentingSourceViewMapTable;
    v2->_presentingSourceViewMapTable = (NSMapTable *)v3;

  }
  return v2;
}

+ (void)pushViewController:(id)a3 fromViewController:(id)a4 withZoomTransition:(BOOL)a5 sourceView:(id)a6 presentationSourceID:(id)a7 isAnimated:(BOOL)a8 completion:(id)a9
{
  _BOOL4 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  char isKindOfClass;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _BOOL4 v48;
  id v49;
  _QWORD block[4];
  NSObject *v51;
  uint8_t buf[16];

  v48 = a8;
  v11 = a5;
  v47 = a1;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v49 = a9;
  +[VUIApplicationRouter topMostVisibleViewController](VUIApplicationRouter, "topMostVisibleViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "documentCreator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isDocumentViewController:equalToViewController:", v17, v13);

  if (v20)
  {
    VUIDefaultLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v21, OS_LOG_TYPE_INFO, "VUIPresenterController:pushViewController trying to push or zoom the same viewmodel view controller as the existing one on top.", buf, 2u);
    }
    v22 = v16;
    v23 = v15;
    v24 = v49;
    goto LABEL_39;
  }
  if (v14)
  {
    if (v11)
      goto LABEL_7;
LABEL_23:
    v22 = v16;
    goto LABEL_24;
  }
  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v26;
  }
  else
  {
    +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v27;
  objc_msgSend(v27, "presentedViewController", v47);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v14, "presentedViewController");
    v30 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v30;
  }
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isShowingExtras");

  if (v32)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "extrasNavigationController");
    v34 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v34;
  }

  if (!v11)
    goto LABEL_23;
LABEL_7:
  v22 = v16;
  if (!_os_feature_enabled_impl())
  {
LABEL_24:
    v23 = v15;
    goto LABEL_37;
  }
  v23 = v15;
  if (v22)
  {
    if (!v15)
    {
      if (v14)
      {
        objc_msgSend(v14, "topViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v14, "topViewController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v25, "findPresentationSourceViewWithId:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = 0;
          }

        }
      }
    }
  }
  if (objc_msgSend(v23, "conformsToProtocol:", &unk_1F0345300, v47))
  {
    objc_msgSend(v23, "zoomSourceView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v37 = v35;

      v23 = v37;
    }

  }
  +[VUIPresenterController sharedInstance](VUIPresenterController, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "presentingSourceViewMapTable");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v39;
  objc_sync_enter(v40);
  objc_msgSend(v40, "objectForKey:", v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 != v23)
  {
    v42 = (void *)objc_opt_class();
    v43 = v23;
    LODWORD(v42) = objc_msgSend(v42, "_setZoomPreferredTransitionForViewController:sourceView:", v13, v43);

    if ((_DWORD)v42)
    {
      if (!v22)
      {
        objc_msgSend(v43, "layer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "cornerRadius");

      }
      objc_msgSend(v40, "setObject:forKey:", v43, v14);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIPresenterController sharedInstance](VUIPresenterController, "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObserver:selector:name:object:", v46, sel__controllerDidDisplay_, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), v14);

    }
  }
  objc_sync_exit(v40);

LABEL_37:
  v24 = v49;
  objc_msgSend(v14, "pushViewController:animated:", v13, v48, v47);
  if (v49)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __137__VUIPresenterController_pushViewController_fromViewController_withZoomTransition_sourceView_presentationSourceID_isAnimated_completion___block_invoke;
    block[3] = &unk_1E9F98E68;
    v51 = v49;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v21 = v51;
LABEL_39:

  }
}

uint64_t __137__VUIPresenterController_pushViewController_fromViewController_withZoomTransition_sourceView_presentationSourceID_isAnimated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_controllerDidDisplay:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[VUIPresenterController sharedInstance](VUIPresenterController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingSourceViewMapTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("VUITVAppNavigationDidDisplayViewControllerNotification"), v7);

  }
}

+ (void)presentViewController:(id)a3 fromViewController:(id)a4 WithConfiguration:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  double *v18;
  VUINavigationController *v19;
  double v20;
  double v21;
  VUINavigationController *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  VUINavigationController *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  double v68;
  VUINavigationController *v69;
  void *v70;
  unsigned int v71;
  id v72;
  int v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  VUINavigationController *v77;
  CGRect v78;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v10, "vuiIsBeingDismissed"))
  {
    objc_msgSend(v10, "vuiPresentingViewController");
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }
  v14 = objc_msgSend(v11, "isAnimated");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v73 = objc_msgSend(v11, "isModalOverModalAllowed");
  else
    v73 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "type");
    v17 = v16 == objc_msgSend(v11, "type") ? v73 : 1;

    if ((v17 & 1) == 0)
    {
      v41 = (void *)objc_opt_class();
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke;
      v76[3] = &unk_1E9F98E68;
      v77 = (VUINavigationController *)v12;
      objc_msgSend(v41, "pushViewController:fromViewController:withZoomTransition:sourceView:presentationSourceID:isAnimated:completion:", v9, v10, 0, 0, 0, 1, v76);
      v19 = v77;
      goto LABEL_62;
    }
  }
  v18 = (double *)MEMORY[0x1E0C9D820];
  if (objc_msgSend(v11, "shouldWrapModalInNavigationController"))
  {
    v19 = -[_VUITVAppNavigationController initWithRootViewController:]([VUINavigationController alloc], "initWithRootViewController:", v9);
    -[VUINavigationController setConfiguration:](v19, "setConfiguration:", v11);
  }
  else
  {
    v19 = (VUINavigationController *)v9;
  }
  v21 = *v18;
  v20 = v18[1];
  if (objc_msgSend(v11, "type") == 2)
  {
    v22 = v19;
    v23 = 0;
LABEL_20:
    -[VUINavigationController setModalPresentationStyle:](v22, "setModalPresentationStyle:", v23);
LABEL_21:
    v24 = v20;
    v25 = v21;
    goto LABEL_22;
  }
  if (objc_msgSend(v11, "type") == 3)
  {
    v22 = v19;
    v23 = 8;
    goto LABEL_20;
  }
  if (objc_msgSend(v11, "type") == 4)
  {
    -[VUINavigationController setModalPresentationStyle:](v19, "setModalPresentationStyle:", 2);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v42 = v11;
    -[VUINavigationController presentationController](v19, "presentationController");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "isTapDismissable"))
      objc_msgSend(v43, "_setShouldDismissWhenTappedOutside:", 1);
    v44 = v14;
    if (objc_msgSend(v42, "prefersGrabberVisible"))
      objc_msgSend(v43, "setPrefersGrabberVisible:", 1);
    objc_msgSend(v42, "detents");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    if (v46)
    {
      objc_msgSend(v42, "detents");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setDetents:", v47);

    }
    objc_msgSend(v42, "preferredSize");
    v14 = v44;
    if (v49 != v21 || (v24 = v20, v25 = v21, v48 != v20))
    {
      objc_msgSend(v42, "preferredSize");
      v25 = v50;
      v24 = v51;
    }

  }
  else
  {
    if (objc_msgSend(v11, "type") == 9)
    {
      if (objc_msgSend(MEMORY[0x1E0DC69D0], "isPhone"))
        v52 = 2;
      else
        v52 = 1;
      -[VUINavigationController setModalPresentationStyle:](v19, "setModalPresentationStyle:", v52);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[VUINavigationController presentationController](v19, "presentationController");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "_setShouldDismissWhenTappedOutside:", 0);
        if (objc_msgSend(MEMORY[0x1E0DC69D0], "isPad"))
          objc_msgSend(v53, "_setWantsFullScreen:", 1);
        objc_msgSend(v53, "_setAllowsInteractiveDismissWhenFullScreen:", 1);

      }
      goto LABEL_21;
    }
    if (objc_msgSend(v11, "type") != 5)
      goto LABEL_60;
    v54 = v11;
    objc_msgSend(v54, "sourceView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "sourceRect");
    if (CGRectIsEmpty(v78))
      objc_msgSend(v55, "bounds");
    else
      objc_msgSend(v54, "sourceRect");
    v60 = v56;
    v61 = v57;
    v62 = v58;
    v63 = v59;
    v64 = objc_msgSend(v54, "popOverArrowDirection");
    objc_msgSend(v54, "preferredSize");
    if (v66 == v21 && v65 == v20)
    {
      v25 = 340.0;
      v24 = 168.0;
    }
    else
    {
      objc_msgSend(v54, "preferredSize");
      v25 = v67;
      v24 = v68;
    }
    v71 = v14;
    if (objc_msgSend(v54, "isPresentationAdjustedToSizeClass"))
    {
      v69 = (VUINavigationController *)objc_alloc_init(MEMORY[0x1E0DC3450]);
      objc_msgSend(v9, "setVuiPreferredContentSize:", v25, v24);
      -[VUINavigationController setContentViewController:](v69, "setContentViewController:", v19);
      -[VUINavigationController setPreferredStyle:](v69, "setPreferredStyle:", 0);

      v19 = v69;
    }
    -[VUINavigationController setModalPresentationStyle:](v19, "setModalPresentationStyle:", 7);
    -[VUINavigationController popoverPresentationController](v19, "popoverPresentationController");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setSourceRect:", v60, v61, v62, v63);
    objc_msgSend(v70, "setSourceView:", v55);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v70, "setDelegate:", v19);
    objc_msgSend(v70, "setPermittedArrowDirections:", v64);
    objc_msgSend(v70, "_setCentersPopoverIfSourceViewNotSet:", 1);

    v14 = v71;
  }
LABEL_22:
  if (v25 != v21 || v24 != v20)
    -[VUINavigationController setVuiPreferredContentSize:](v19, "setVuiPreferredContentSize:", v25, v24);
  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isShowingExtras");

  if (v27)
  {
    +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "extrasNavigationController");
    v72 = v10;
    v29 = v11;
    v30 = v19;
    v31 = v12;
    v32 = v9;
    v33 = v14;
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "topViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "presentedViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "presentedViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v37 == 0;
    v14 = v33;
    v9 = v32;
    v12 = v31;
    v19 = v30;
    v11 = v29;
    v10 = v72;
  }
  else
  {
    v38 = 1;
  }
  objc_msgSend(v10, "vuiPresentingViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    v40 = v27;
  else
    v40 = 1;

  if (v40 != 1)
  {
    if ((v73 & 1) == 0)
      goto LABEL_60;
LABEL_35:
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke_2;
    v74[3] = &unk_1E9F98E68;
    v75 = v12;
    objc_msgSend(v10, "vui_presentViewController:animated:completion:", v19, v14, v74);

    goto LABEL_62;
  }
  if (((v38 | v73) & 1) != 0)
    goto LABEL_35;
LABEL_60:
  if (v12)
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
LABEL_62:

}

uint64_t __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

+ (void)dismissViewController:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v5
    && (objc_msgSend(v5, "vuiPresentingViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__VUIPresenterController_dismissViewController_completion___block_invoke;
    v8[3] = &unk_1E9F98E68;
    v9 = v6;
    objc_msgSend(v5, "vui_dismissViewControllerAnimated:completion:", 1, v8);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

uint64_t __59__VUIPresenterController_dismissViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)popViewController:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "vuiNavigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v7 = v5) != 0)
  {
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);
    if (v6)
    {
      objc_msgSend(v7, "transitionCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__VUIPresenterController_popViewController_completion___block_invoke;
      v10[3] = &unk_1E9FA0588;
      v11 = v6;
      objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

    }
  }
  else
  {
    if (v6)
      v6[2](v6);
    v7 = 0;
  }

}

uint64_t __55__VUIPresenterController_popViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)popOrDismissViewController:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  void (**v21)(_QWORD);
  _QWORD block[4];
  void (**v23)(_QWORD);

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(v5, "vuiNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "vuiNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "popToViewController:animated:", v5, 1);

    objc_msgSend(v5, "vuiPresentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "vuiPresentedViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "vui_dismissViewControllerAnimated:completion:", 1, 0);

    }
    if (v6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke;
      block[3] = &unk_1E9F98E68;
      v23 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v12 = v23;
LABEL_9:

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "vuiPresentingViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_2;
        v20[3] = &unk_1E9F98E68;
        v21 = v6;
        objc_msgSend(v5, "vui_dismissViewControllerAnimated:completion:", 1, v20);
        v12 = v21;
        goto LABEL_9;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v5;
      v15 = (id)objc_msgSend(v14, "popViewControllerAnimated:", 1);
      if (v6)
      {
        objc_msgSend(v14, "transitionCoordinator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v14, "transitionCoordinator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_3;
          v18[3] = &unk_1E9FA0588;
          v19 = v6;
          objc_msgSend(v17, "animateAlongsideTransition:completion:", 0, v18);

        }
        else
        {
          v6[2](v6);
        }
      }

    }
    else if (v6)
    {
      v6[2](v6);
    }
  }

}

uint64_t __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)_setZoomPreferredTransitionForViewController:(id)a3 sourceView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
LABEL_4:
    LOBYTE(v8) = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__VUIPresenterController__setZoomPreferredTransitionForViewController_sourceView___block_invoke;
      aBlock[3] = &unk_1E9FA05B0;
      v12 = v7;
      v8 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0DC4488], "zoomWithSourceViewProvider:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setPreferredTransition:", v9);

      LOBYTE(v8) = 1;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return (char)v8;
}

id __82__VUIPresenterController__setZoomPreferredTransitionForViewController_sourceView___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSMapTable)presentingSourceViewMapTable
{
  return self->_presentingSourceViewMapTable;
}

- (void)setPresentingSourceViewMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSourceViewMapTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSourceViewMapTable, 0);
}

@end
