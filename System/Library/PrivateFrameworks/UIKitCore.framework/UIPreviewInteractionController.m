@implementation UIPreviewInteractionController

- (UIPreviewInteractionController)init
{
  return -[UIPreviewInteractionController initWithView:](self, "initWithView:", 0);
}

- (UIPreviewInteractionController)initWithView:(id)a3
{
  id v4;
  UIPreviewInteractionController *v5;
  UIPreviewInteractionController *v6;
  UIPreviewInteraction *v7;
  UIPreviewInteraction *previewInteraction;
  UIPreviewInteractionController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPreviewInteractionController;
  v5 = -[UIPreviewInteractionController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceView, v4);
    if (v4)
    {
      v7 = -[UIPreviewInteraction initWithView:]([UIPreviewInteraction alloc], "initWithView:", v4);
      previewInteraction = v6->_previewInteraction;
      v6->_previewInteraction = v7;

      -[UIPreviewInteraction setDelegate:](v6->_previewInteraction, "setDelegate:", v6);
    }
    -[UIPreviewInteractionController initGestureRecognizers](v6, "initGestureRecognizers");
    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIPreviewInteractionController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIPreviewInteractionController gestureRecognizers](self, "gestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "removeGestureRecognizer:", v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)UIPreviewInteractionController;
  -[UIPreviewInteractionController dealloc](&v11, sel_dealloc);
}

- (NSArray)gestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  -[UIPreviewInteractionController touchObservingGestureRecognizer](self, "touchObservingGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  -[UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)_viewControllerIsChildOfExpandedSplitViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      v7 = (objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v6, "_isCollapsed")
        || -[UIPreviewInteractionController _viewControllerIsChildOfExpandedSplitViewController:](self, "_viewControllerIsChildOfExpandedSplitViewController:", v6);
    }
    else
    {
      objc_msgSend(v5, "presentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && (objc_msgSend(v8, "shouldPresentInFullscreen") & 1) == 0)
      {
        objc_msgSend(v9, "presentingViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[UIPreviewInteractionController _viewControllerIsChildOfExpandedSplitViewController:](self, "_viewControllerIsChildOfExpandedSplitViewController:", v10);

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_previewingIsPossibleForView:(id)a3
{
  void *v4;

  objc_msgSend(a3, "_viewControllerForAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[UIPreviewInteractionController _viewControllerIsChildOfExpandedSplitViewController:](self, "_viewControllerIsChildOfExpandedSplitViewController:", v4);

  return (char)self;
}

- (BOOL)startInteractivePreviewAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  int has_internal_diagnostics;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  _UIPICSimpleInteractionProgress *v34;
  void *v35;
  BOOL v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  void *v50;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  unint64_t v54;
  NSObject *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  _QWORD v59[5];
  id v60;
  BOOL v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  uint64_t v65;

  y = a3.y;
  x = a3.x;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    || (-[UIPreviewInteractionController setLocation:](self, "setLocation:", x, y),
        !-[UIPreviewInteractionController _previewingIsPossibleForView:](self, "_previewingIsPossibleForView:", v8)))
  {
    v13 = 0;
    goto LABEL_27;
  }
  -[UIPreviewInteractionController _activateFeedback](self, "_activateFeedback");
  -[UIPreviewInteractionController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v10, "previewInteractionController:viewControllerForPreviewingAtPosition:inView:presentingViewController:", self, v8, &v62, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v62;
  v13 = v11 != 0;
  if (v11)
  {
    objc_msgSend(v11, "presentingViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v12;
    if (v14 || (objc_msgSend(v11, "isBeingPresented") & 1) != 0)
    {

    }
    else if ((objc_msgSend(v11, "isBeingDismissed") & 1) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIPreviewInteractionController.m"), 217, CFSTR("The view controller returned from -previewViewControllerForPosition:inSourceView: must not already be presented"));

LABEL_7:
    objc_msgSend(v11, "_setOverrideUseCustomPresentation:", 1);
    -[UIPreviewInteractionController _transitionDelegateForPreviewViewController:atPosition:inView:](self, "_transitionDelegateForPreviewViewController:atPosition:inView:", v11, v8, x, y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewInteractionController setCurrentTransitionDelegate:](self, "setCurrentTransitionDelegate:", v15);
    objc_msgSend(v11, "_setOverrideTransitioningDelegate:", v15);

    objc_msgSend(v11, "presentationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (has_internal_diagnostics)
    {
      if (v18)
      {
LABEL_9:
        -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setFeedbackGenerator:", v19);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "setPreviewInteractionController:", self);
          -[UIPreviewInteractionController previewingContext](self, "previewingContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setPreviewingContext:", v20);

        }
        objc_msgSend(v8, "bounds");
        v22 = v21;
        v24 = v23;
        v26 = v25;
        v28 = v27;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "sourceRect");
          v22 = v29;
          v24 = v30;
          v26 = v31;
          v28 = v32;
        }
        objc_msgSend(v16, "setSourceRect:", v22, v24, v26, v28);
        objc_msgSend(v16, "setSourceView:", v8);
        -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPanningGestureRecognizer:", v33);

        if (-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
        {
          v34 = objc_alloc_init(_UIPICSimpleInteractionProgress);
          -[UIPreviewInteractionController setInteractionProgressForPresentation:](self, "setInteractionProgressForPresentation:", v34);

        }
        -[UIPreviewInteractionController setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", v11);
        -[UIPreviewInteractionController setCurrentPresentationController:](self, "setCurrentPresentationController:", v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "previewInteractionController:willPresentViewController:forPosition:inSourceView:", self, v11, v8, x, y);
        -[UIPreviewInteractionController _configureCommitInteractionProgressForView:](self, "_configureCommitInteractionProgressForView:", v8, v10);
        -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setForcePresentationControllerDelegate:", self);

        v36 = -[UIPreviewInteractionController configureRevealTransformSourceViewSnapshotSuppressionFromLocation:inView:](self, "configureRevealTransformSourceViewSnapshotSuppressionFromLocation:inView:", v8, x, y);
        v37 = -[UIPreviewInteractionController _usesPreviewPresentationController](self, "_usesPreviewPresentationController");
        -[UIPreviewInteractionController windowForPreviewPresentation](self, "windowForPreviewPresentation");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "windowScene");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "_setReachabilitySupported:forReason:", 0, CFSTR("UIPreviewInteractionController startInteractivePreviewAtLocation"));

        if (!v37)
        {
          objc_msgSend(v58, "view");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "window");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIPreviewInteractionController setWindowForPreviewPresentation:](self, "setWindowForPreviewPresentation:", v41);

          -[UIPreviewInteractionController windowForPreviewPresentation](self, "windowForPreviewPresentation");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "beginDisablingInterfaceAutorotation");

          -[UIPreviewInteractionController windowForPreviewPresentation](self, "windowForPreviewPresentation");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          __UIStatusBarManagerForWindow(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isStatusBarHidden");

          -[UIPreviewInteractionController setStatusBarWasHidden:](self, "setStatusBarWasHidden:", v45);
        }
        if (!v36)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v16, "_prepareInitialSourceViewSnapshot");
        }
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __75__UIPreviewInteractionController_startInteractivePreviewAtLocation_inView___block_invoke;
        v59[3] = &unk_1E16B4008;
        v59[4] = self;
        v61 = v37;
        v12 = v58;
        v60 = v58;
        objc_msgSend(v60, "presentViewController:animated:completion:", v11, 1, v59);
        -[UIPreviewInteractionController delegate](self, "delegate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_opt_respondsToSelector();

        if ((v47 & 1) != 0)
        {
          -[UIPreviewInteractionController delegate](self, "delegate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "previewInteractionController:willPresentViewController:", self, v11);

        }
        v10 = v57;
        goto LABEL_25;
      }
      __UIFaultDebugAssertLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
LABEL_38:

        goto LABEL_9;
      }
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = v53;
      _os_log_fault_impl(&dword_185066000, v51, OS_LOG_TYPE_FAULT, "The feedbackGenerator in %@ should not be nil!", buf, 0xCu);
    }
    else
    {
      if (v18)
        goto LABEL_9;
      v54 = startInteractivePreviewAtLocation_inView____s_category;
      if (!startInteractivePreviewAtLocation_inView____s_category)
      {
        v54 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v54, (unint64_t *)&startInteractivePreviewAtLocation_inView____s_category);
      }
      v55 = *(NSObject **)(v54 + 8);
      if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v51 = v55;
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = v53;
      _os_log_impl(&dword_185066000, v51, OS_LOG_TYPE_ERROR, "The feedbackGenerator in %@ should not be nil!", buf, 0xCu);
    }

    goto LABEL_38;
  }
LABEL_25:

LABEL_27:
  return v13;
}

void __75__UIPreviewInteractionController_startInteractivePreviewAtLocation_inView___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "currentPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !*(_BYTE *)(a1 + 48))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "statusBarWasHidden") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_setStatusBarHidden:", 1);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forceOrderOutAutomaticAnimated:", 1);

  }
}

- (BOOL)configureRevealTransformSourceViewSnapshotSuppressionFromLocation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIPreviewInteractionController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "previewInteractionController:shouldUseStandardRevealTransformForPreviewingAtLocation:inView:", self, v7, x, y);
    -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9 ^ 1;
    objc_msgSend(v10, "set_sourceViewSnapshotAndScaleTransformSuppressed:", v9 ^ 1u);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)configureRevealTransformWithInteractionProgress:(id)a3 forLocation:(CGPoint)a4 inView:(id)a5 containerView:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  id v14;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  v11 = a5;
  v12 = a6;
  -[UIPreviewInteractionController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "previewInteractionController:interactionProgress:forRevealAtLocation:inSourceView:containerView:", self, v14, v11, v12, x, y);

}

- (BOOL)startInteractivePreviewWithGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  LOBYTE(self) = -[UIPreviewInteractionController startInteractivePreviewAtLocation:inView:](self, "startInteractivePreviewAtLocation:inView:", v5, v7, v9);
  return (char)self;
}

- (void)cancelInteractivePreview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInteractive"))
  {
    -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_currentInteractionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v5) = os_variant_has_internal_diagnostics();
    v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE326F0);
    if ((_DWORD)v5)
    {
      if ((v7 & 1) != 0)
      {
LABEL_4:
        if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE326F0, *(_OWORD *)v19))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "cancelInteractiveTransition:", &__block_literal_global_417);
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "cancelInteractiveTransition");
          }
          else if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)v19 = 138412290;
              *(_QWORD *)&v19[4] = v6;
              _os_log_fault_impl(&dword_185066000, v18, OS_LOG_TYPE_FAULT, "Interaction controller %@ does not implement -cancelInteractiveTransition or -cancelInteractiveTransition:", v19, 0xCu);
            }

          }
          else
          {
            v11 = qword_1ECD7F688;
            if (!qword_1ECD7F688)
            {
              v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v11, (unint64_t *)&qword_1ECD7F688);
            }
            v12 = *(NSObject **)(v11 + 8);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v19 = 138412290;
              *(_QWORD *)&v19[4] = v6;
              _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Interaction controller %@ does not implement -cancelInteractiveTransition or -cancelInteractiveTransition:", v19, 0xCu);
            }
          }
        }

        goto LABEL_21;
      }
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v19 = 138412290;
        *(_QWORD *)&v19[4] = objc_opt_class();
        v14 = *(id *)&v19[4];
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Trying to cancel a preview interaction controller of class %@ that does not conform to UIForceInteractionController protocol", v19, 0xCu);

      }
    }
    else
    {
      if ((v7 & 1) != 0)
        goto LABEL_4;
      v15 = _MergedGlobals_1177;
      if (!_MergedGlobals_1177)
      {
        v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&_MergedGlobals_1177);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      v13 = v16;
      *(_DWORD *)v19 = 138412290;
      *(_QWORD *)&v19[4] = objc_opt_class();
      v17 = *(id *)&v19[4];
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Trying to cancel a preview interaction controller of class %@ that does not conform to UIForceInteractionController protocol", v19, 0xCu);

    }
    goto LABEL_4;
  }
  objc_msgSend(v3, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    if (v4)
    {
      v10 = objc_msgSend(v4, "isCancelled");

      if ((v10 & 1) != 0)
        goto LABEL_21;
    }
    else
    {

    }
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);
    -[UIPreviewInteractionController _previewPresentationControllerDidScheduleDismiss](self, "_previewPresentationControllerDidScheduleDismiss");
  }
LABEL_21:

}

- (void)commitInteractivePreview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_canCommitPresentation");

      if (v7)
      {
        self->_isCommitting = 1;
        -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) != 0)
        {
          -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_willCommitPresentation");

        }
        if (!-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
        {
          -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "transitionToState:ended:", CFSTR("commit"), 1);

        }
        -[UIPreviewInteractionController delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "presentingViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __58__UIPreviewInteractionController_commitInteractivePreview__block_invoke;
        v16[3] = &unk_1E16B1B28;
        v16[4] = self;
        +[_UIPreviewTransitionController performCommitTransitionWithDelegate:forViewController:previewViewController:previewInteractionController:completion:](_UIPreviewTransitionController, "performCommitTransitionWithDelegate:forViewController:previewViewController:previewInteractionController:completion:", v12, v13, v4, self, v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPreviewInteractionController setCurrentCommitTransition:](self, "setCurrentCommitTransition:", v14);

        +[_UIStatistics previewInteractionPopCount](_UIStatistics, "previewInteractionPopCount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "incrementValueBy:", 1);

        _UIPowerLogPopOccured();
      }
    }

  }
}

uint64_t __58__UIPreviewInteractionController_commitInteractivePreview__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentCommitTransition:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[UIPreviewInteractionController touchObservingGestureRecognizer](self, "touchObservingGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    -[UIPreviewInteractionController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v6)
      goto LABEL_3;
    if ((_UIPreviewInteractionIsTextGestureRecognizer(v7) & 1) != 0)
      goto LABEL_12;
    -[UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v7)
      goto LABEL_12;
    v12 = 1;
    if ((objc_msgSend(v7, "_isGestureType:", 1) & 1) != 0)
      goto LABEL_13;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_3:
      -[UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 != v6)
      {
LABEL_4:
        v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      if ((_UIPreviewInteractionIsTextGestureRecognizer(v7) & 1) != 0)
      {
LABEL_12:
        v12 = 1;
        goto LABEL_13;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_4;
    }
    v12 = objc_msgSend(v9, "previewInteractionController:shouldStartPreviewingSimultaneouslyWithGestureRecognizer:", self, v7);
    goto LABEL_13;
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[UIPreviewInteractionController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
  -[UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend((id)UIApp, "_gestureEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v7, v9);

  }
}

- (void)interactionProgressDidUpdate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  -[UIPreviewInteractionController interactionProgressForCommit](self, "interactionProgressForCommit");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v13;
  if (v4 == v13)
  {
    objc_msgSend(v13, "percentComplete");
    v7 = v6;
    -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_canCommitPresentation");

    if (v7 >= 1.0 && v9)
    {
      -[UIPreviewInteractionController setInteractionProgressForCommit:](self, "setInteractionProgressForCommit:", 0);
      -[UIPreviewInteractionController commitInteractivePreview](self, "commitInteractivePreview");
    }
    else
    {
      objc_msgSend(v13, "percentComplete");
      if (v10 > 1.0)
        v10 = 1.0;
      v11 = fmax(v10, 0.0);
      -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "transitionToState:updated:", CFSTR("commit"), v11);

    }
    v5 = v13;
  }

}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIPreviewInteractionController interactionProgressForCommit](self, "interactionProgressForCommit");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6 && v4)
    -[UIPreviewInteractionController commitInteractivePreview](self, "commitInteractivePreview");
}

- (void)forcePresentationTransitionWillBegin:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[UIPreviewInteractionController interactionProgressForPresentation](self, "interactionProgressForPresentation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPreviewInteractionController location](self, "location");
  v6 = v5;
  v8 = v7;
  -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_revealContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPreviewInteractionController configureRevealTransformWithInteractionProgress:forLocation:inView:containerView:](self, "configureRevealTransformWithInteractionProgress:forLocation:inView:containerView:", v12, v10, v11, v6, v8);
}

- (void)forcePresentationControllerWillDismiss:(id)a3
{
  void *v4;
  void *v5;

  -[UIPreviewInteractionController _resetCustomPresentationHooks](self, "_resetCustomPresentationHooks", a3);
  -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPanningGestureRecognizer:", 0);

  -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  if (!-[UIPreviewInteractionController _usesPreviewPresentationController](self, "_usesPreviewPresentationController")
    && !-[UIPreviewInteractionController statusBarWasHidden](self, "statusBarWasHidden"))
  {
    -[UIPreviewInteractionController _setStatusBarHidden:](self, "_setStatusBarHidden:", 0);
  }
}

- (void)forcePresentationControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[_UIStatistics previewInteractionPeekDuration](_UIStatistics, "previewInteractionPeekDuration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordTimingForObject:", v5);

  _UIPowerLogPeekEnded();
  -[UIPreviewInteractionController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewInteractionController:didDismissViewController:committing:", self, v6, self->_isCommitting);

  }
  -[UIPreviewInteractionController _finalizeInteractivePreview](self, "_finalizeInteractivePreview");

}

- (void)forcePresentationController:(id)a3 didSelectMenuItem:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[UIPreviewInteractionController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "previewInteractionController:didSelectMenuItem:", self, v6);

}

- (void)initGestureRecognizers
{
  _UIRevealGestureRecognizer *v3;
  _UIPreviewInteractionTouchObservingGestureRecognizer *v4;
  _UIPreviewGestureRecognizer *v5;
  UIPreviewForceInteractionProgress *v6;
  void *v7;
  UIPreviewForceInteractionProgress *v8;

  v3 = objc_alloc_init(_UIRevealGestureRecognizer);
  -[UIGestureRecognizer setName:](v3, "setName:", CFSTR("Reveal mk1"));
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v3, "setMinimumPressDuration:", 0.1);
  -[UILongPressGestureRecognizer setAllowableMovement:](v3, "setAllowableMovement:", 15.0);
  -[UIGestureRecognizer setRequiredPreviewForceState:](v3, "setRequiredPreviewForceState:", 1);
  -[UIGestureRecognizer setAllowedTouchTypes:](v3, "setAllowedTouchTypes:", &unk_1E1A94628);
  -[_UIRevealGestureRecognizer setDelegate:](v3, "setDelegate:", self);
  -[UIGestureRecognizer addTarget:action:](v3, "addTarget:action:", self, sel__handleRevealGesture_);
  -[UIPreviewInteractionController setRevealGestureRecognizer:](self, "setRevealGestureRecognizer:", v3);

  v4 = objc_alloc_init(_UIPreviewInteractionTouchObservingGestureRecognizer);
  -[UIGestureRecognizer setName:](v4, "setName:", CFSTR("TouchObserver mk1"));
  -[UIGestureRecognizer setAllowedTouchTypes:](v4, "setAllowedTouchTypes:", &unk_1E1A94628);
  -[UIGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
  -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", self);
  -[UIGestureRecognizer addTarget:action:](v4, "addTarget:action:", self, sel__handleTouchObservingGesture_);
  -[UIPreviewInteractionController setTouchObservingGestureRecognizer:](self, "setTouchObservingGestureRecognizer:", v4);

  v5 = objc_alloc_init(_UIPreviewGestureRecognizer);
  -[UIGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E1A94628);
  -[UIGestureRecognizer setRequiredPreviewForceState:](v5, "setRequiredPreviewForceState:", 2);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v5, "setMinimumPressDuration:", 0.1);
  -[UILongPressGestureRecognizer setAllowableMovement:](v5, "setAllowableMovement:", 15.0);
  -[UIGestureRecognizer setDelegate:](v5, "setDelegate:", self);
  -[UIPreviewInteractionController setPreviewGestureRecognizer:](self, "setPreviewGestureRecognizer:", v5);

  if (!-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
  {
    v6 = [UIPreviewForceInteractionProgress alloc];
    -[UIPreviewInteractionController beginPreviewGestureRecognizer](self, "beginPreviewGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIPreviewForceInteractionProgress initWithGestureRecognizer:](v6, "initWithGestureRecognizer:", v7);

    -[UIPreviewForceInteractionProgress setCompletesAtTargetState:](v8, "setCompletesAtTargetState:", 1);
    -[UIPreviewInteractionController setInteractionProgressForPresentation:](self, "setInteractionProgressForPresentation:", v8);

  }
}

- (void)_handleRevealGesture:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "isEnabled"))
  {
    if (objc_msgSend(v8, "state") == 1)
    {
      if (!-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
      {
        if (-[UIPreviewInteractionController startInteractivePreviewWithGestureRecognizer:](self, "startInteractivePreviewWithGestureRecognizer:", v8))
        {
          -[UIPreviewInteractionController _turnOnFeedbackGenerator](self, "_turnOnFeedbackGenerator");
        }
        else
        {
          objc_msgSend(v8, "setEnabled:", 0);
          objc_msgSend(v8, "setEnabled:", 1);
          -[UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setEnabled:", 0);

          -[UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setEnabled:", 1);

        }
      }
    }
    else if ((objc_msgSend(v8, "state") == 3 || objc_msgSend(v8, "state") == 4 || objc_msgSend(v8, "state") == 5)
           && !-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
    {
      -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_canDismissPresentation");

      if (v5)
        -[UIPreviewInteractionController cancelInteractivePreview](self, "cancelInteractivePreview");
    }
  }

}

- (void)_handleTouchObservingGesture:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
  {
    if (objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2)
      -[UIPreviewInteractionController _activateFeedbackIfNeeded](self, "_activateFeedbackIfNeeded");
    if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
      -[UIPreviewInteractionController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
  }

}

- (void)_configureCommitInteractionProgressForView:(id)a3
{
  id v4;
  void *v5;
  UIPreviewForceInteractionProgress *v6;
  void *v7;
  UIPreviewForceInteractionProgress *v8;

  v4 = a3;
  -[UIPreviewInteractionController interactionProgressForCommit](self, "interactionProgressForCommit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeProgressObserver:", self);

  v6 = [UIPreviewForceInteractionProgress alloc];
  objc_msgSend(v4, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIPreviewForceInteractionProgress initWithView:targetState:](v6, "initWithView:targetState:", v7, 3);
  -[UIPreviewForceInteractionProgress setCompletesAtTargetState:](v8, "setCompletesAtTargetState:", 0);
  -[UIInteractionProgress addProgressObserver:](v8, "addProgressObserver:", self);
  -[UIPreviewInteractionController setInteractionProgressForCommit:](self, "setInteractionProgressForCommit:", v8);

}

- (void)_setStatusBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend((id)UIApp, "statusBar");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isHidden") != v3)
    objc_msgSend(v4, "setHidden:animated:", v3, 1);

}

- (id)_transitionDelegateForPreviewViewController:(id)a3 atPosition:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  _UIPreviewTransitionDelegate *v15;
  _UIPreviewTransitionDelegate *v16;
  int has_internal_diagnostics;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  unint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  void *v31;
  uint64_t v32;

  y = a4.y;
  x = a4.x;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[UIPreviewInteractionController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitioningDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_1EDE32CD0);

  if (v13)
  {
    objc_msgSend(v9, "transitioningDelegate");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "previewInteractionController:transitioningDelegateForPreviewingAtPosition:inView:", self, v10, x, y);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = (_UIPreviewTransitionDelegate *)v14;
    if (v14)
      goto LABEL_7;
  }
  v15 = objc_alloc_init(_UIPreviewTransitionDelegate);
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (has_internal_diagnostics)
    {
      if (v18)
      {
LABEL_10:
        -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPreviewTransitionDelegate setFeedbackGenerator:](v16, "setFeedbackGenerator:", v19);

        goto LABEL_11;
      }
      __UIFaultDebugAssertLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

        goto LABEL_10;
      }
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v26;
      _os_log_fault_impl(&dword_185066000, v24, OS_LOG_TYPE_FAULT, "The feedbackGenerator in %@ should not be nil!", (uint8_t *)&v30, 0xCu);
    }
    else
    {
      if (v18)
        goto LABEL_10;
      v27 = _transitionDelegateForPreviewViewController_atPosition_inView____s_category;
      if (!_transitionDelegateForPreviewViewController_atPosition_inView____s_category)
      {
        v27 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v27, (unint64_t *)&_transitionDelegateForPreviewViewController_atPosition_inView____s_category);
      }
      v28 = *(NSObject **)(v27 + 8);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v24 = v28;
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v26;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_ERROR, "The feedbackGenerator in %@ should not be nil!", (uint8_t *)&v30, 0xCu);
    }

    goto LABEL_24;
  }
LABEL_11:
  -[UIPreviewInteractionController interactionProgressForPresentation](self, "interactionProgressForPresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "didEnd") & 1) != 0 || (objc_msgSend(v20, "percentComplete"), v21 >= 1.0))
  {
    -[_UIPreviewTransitionDelegate setInteractionProgressForPresentation:](v15, "setInteractionProgressForPresentation:", 0);
  }
  else
  {
    -[UIPreviewInteractionController interactionProgressForPresentation](self, "interactionProgressForPresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewTransitionDelegate setInteractionProgressForPresentation:](v15, "setInteractionProgressForPresentation:", v22);

  }
  return v15;
}

- (void)_previewPresentationControllerDidScheduleDismiss
{
  void *v3;
  id v4;

  if (!-[UIPreviewInteractionController didSendDelegateWillDismissViewController](self, "didSendDelegateWillDismissViewController"))
  {
    -[UIPreviewInteractionController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "previewInteractionController:willDismissViewController:", self, v3);

    }
    -[UIPreviewInteractionController setDidSendDelegateWillDismissViewController:](self, "setDidSendDelegateWillDismissViewController:", 1);

  }
}

- (void)_resetCustomPresentationHooks
{
  void *v3;
  id v4;

  -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverrideUseCustomPresentation:", 0);

  -[UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOverrideTransitioningDelegate:", 0);

}

- (void)_finalizeInteractivePreview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[UIPreviewInteractionController setDidSendDelegateWillDismissViewController:](self, "setDidSendDelegateWillDismissViewController:", 0);
  -[UIPreviewInteractionController windowForPreviewPresentation](self, "windowForPreviewPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDisablingInterfaceAutorotation");

  -[UIPreviewInteractionController setWindowForPreviewPresentation:](self, "setWindowForPreviewPresentation:", 0);
  -[UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  -[UIPreviewInteractionController windowForPreviewPresentation](self, "windowForPreviewPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setReachabilitySupported:forReason:", 1, CFSTR("UIPreviewInteractionController _finalizeInteractivePreview"));

  -[UIPreviewInteractionController _resetCustomPresentationHooks](self, "_resetCustomPresentationHooks");
  -[UIPreviewInteractionController setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", 0);
  -[UIPreviewInteractionController setCurrentPresentationController:](self, "setCurrentPresentationController:", 0);
  -[UIPreviewInteractionController setCurrentTransitionDelegate:](self, "setCurrentTransitionDelegate:", 0);
  -[UIPreviewInteractionController setInteractionProgressForCommit:](self, "setInteractionProgressForCommit:", 0);
  if (-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
    -[UIPreviewInteractionController setInteractionProgressForPresentation:](self, "setInteractionProgressForPresentation:", 0);
  -[UIPreviewInteractionController previewInteraction](self, "previewInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelInteraction");

  -[UIPreviewInteractionController modalPanGestureRecognizer](self, "modalPanGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIPreviewInteractionController modalPanGestureRecognizer](self, "modalPanGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPreviewInteractionController modalPanGestureRecognizer](self, "modalPanGestureRecognizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeGestureRecognizer:", v11);

    -[UIPreviewInteractionController setModalPanGestureRecognizer:](self, "setModalPanGestureRecognizer:", 0);
  }
  -[UIPreviewInteractionController _deactivateFeedbackIfNeeded](self, "_deactivateFeedbackIfNeeded");
}

- (void)_activateFeedbackIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  _UIDeepPressAnalyzer *deepPressAnalyzer;
  _UIDeepPressAnalyzer *v7;
  _UIDeepPressAnalyzer *v8;
  void *v9;
  id v10;

  if (!-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
  {
    -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isActive");

    if ((v4 & 1) == 0)
    {
      -[UIPreviewInteractionController touchObservingGestureRecognizer](self, "touchObservingGestureRecognizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      deepPressAnalyzer = self->_deepPressAnalyzer;
      v10 = v5;
      if (!deepPressAnalyzer)
      {
        v7 = objc_alloc_init(_UIDeepPressAnalyzer);
        v8 = self->_deepPressAnalyzer;
        self->_deepPressAnalyzer = v7;

        v5 = v10;
        deepPressAnalyzer = self->_deepPressAnalyzer;
      }
      objc_msgSend(v5, "touches");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDeepPressAnalyzer analyzeTouches:](deepPressAnalyzer, "analyzeTouches:", v9);

      if (-[_UIDeepPressAnalyzer isDeepPressLikely](self->_deepPressAnalyzer, "isDeepPressLikely"))
        -[UIPreviewInteractionController _activateFeedback](self, "_activateFeedback");

    }
  }
}

- (void)_activateFeedback
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _UIStatesFeedbackGenerator *v7;
  void *v8;
  _UIStatesFeedbackGenerator *v9;
  id v10;

  -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[_UIStatesFeedbackGeneratorPreviewConfiguration defaultConfiguration](_UIStatesFeedbackGeneratorPreviewConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("presentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIPreviewInteractionController touchObservingGestureRecognizer](self, "touchObservingGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [_UIStatesFeedbackGenerator alloc];
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIStatesFeedbackGenerator initWithConfiguration:view:](v7, "initWithConfiguration:view:", v5, v8);

    -[UIPreviewInteractionController setFeedbackGenerator:](self, "setFeedbackGenerator:", v9);
    v3 = v9;
  }
  v10 = v3;
  if ((objc_msgSend(v3, "isActive") & 1) == 0)
    objc_msgSend(v10, "activateWithCompletionBlock:", 0);

}

- (void)_deactivateFeedbackIfNeeded
{
  void *v3;
  id v4;

  -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && !-[UIPreviewInteractionController _usesPreviewInteraction](self, "_usesPreviewInteraction"))
  {
    -[UIPreviewInteractionController _turnOffFeedbackGenerator](self, "_turnOffFeedbackGenerator");
    -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isActive"))
      objc_msgSend(v4, "deactivate");

  }
}

- (void)_turnOnFeedbackGenerator
{
  void *v3;

  if (!self->_generatorTurnedOn)
  {
    -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_activateWithStyle:completionBlock:", 2, 0);

    self->_generatorTurnedOn = 1;
  }
}

- (void)_turnOffFeedbackGenerator
{
  void *v3;

  if (self->_generatorTurnedOn)
  {
    -[UIPreviewInteractionController feedbackGenerator](self, "feedbackGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deactivateWithStyle:", 2);

    self->_generatorTurnedOn = 0;
  }
}

- (BOOL)_usesPreviewInteraction
{
  return self->_previewInteraction != 0;
}

- (BOOL)_usesPreviewPresentationController
{
  void *v2;
  char isKindOfClass;

  -[UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a5;
  -[UIPreviewInteractionController interactionProgressForPresentation](self, "interactionProgressForPresentation", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setPercentComplete:", a4);
    if (v5)
      objc_msgSend(v7, "endInteraction:", 1);
  }

}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInCoordinateSpace:", v5);
  v7 = v6;
  v9 = v8;

  LOBYTE(self) = -[UIPreviewInteractionController startInteractivePreviewAtLocation:inView:](self, "startInteractivePreviewAtLocation:inView:", v5, v7, v9);
  return (char)self;
}

- (void)previewInteraction:(id)a3 didUpdateCommitTransition:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a5;
  -[UIPreviewInteractionController interactionProgressForCommit](self, "interactionProgressForCommit", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "setPercentComplete:", a4);
    if (v5)
      objc_msgSend(v7, "endInteraction:", 1);
  }

}

- (UIPreviewInteractionControllerDelegate)delegate
{
  return (UIPreviewInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIPreviewInteraction)previewInteraction
{
  return self->_previewInteraction;
}

- (void)setPreviewInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteraction, a3);
}

- (UIInteractionProgress)interactionProgressForCommit
{
  return self->_interactionProgressForCommit;
}

- (void)setInteractionProgressForCommit:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgressForCommit, a3);
}

- (_UIRevealGestureRecognizer)revealGestureRecognizer
{
  return self->_revealGestureRecognizer;
}

- (void)setRevealGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_revealGestureRecognizer, a3);
}

- (_UIPreviewGestureRecognizer)previewGestureRecognizer
{
  return self->_previewGestureRecognizer;
}

- (void)setPreviewGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_previewGestureRecognizer, a3);
}

- (UIPanGestureRecognizer)modalPanGestureRecognizer
{
  return self->_modalPanGestureRecognizer;
}

- (void)setModalPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_modalPanGestureRecognizer, a3);
}

- (_UITouchesObservingGestureRecognizer)touchObservingGestureRecognizer
{
  return self->_touchObservingGestureRecognizer;
}

- (void)setTouchObservingGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_touchObservingGestureRecognizer, a3);
}

- (_UIDeepPressAnalyzer)deepPressAnalyzer
{
  return self->_deepPressAnalyzer;
}

- (void)setDeepPressAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_deepPressAnalyzer, a3);
}

- (UIViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (void)setCurrentPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreviewViewController, a3);
}

- (UIForcePresentationController)currentPresentationController
{
  return self->_currentPresentationController;
}

- (void)setCurrentPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresentationController, a3);
}

- (UIForceTransitioningDelegate)currentTransitionDelegate
{
  return self->_currentTransitionDelegate;
}

- (void)setCurrentTransitionDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransitionDelegate, a3);
}

- (UIWindow)windowForPreviewPresentation
{
  return self->_windowForPreviewPresentation;
}

- (void)setWindowForPreviewPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_windowForPreviewPresentation, a3);
}

- (BOOL)statusBarWasHidden
{
  return self->_statusBarWasHidden;
}

- (void)setStatusBarWasHidden:(BOOL)a3
{
  self->_statusBarWasHidden = a3;
}

- (id)currentCommitTransition
{
  return self->_currentCommitTransition;
}

- (void)setCurrentCommitTransition:(id)a3
{
  objc_storeStrong(&self->_currentCommitTransition, a3);
}

- (BOOL)didSendDelegateWillDismissViewController
{
  return self->_didSendDelegateWillDismissViewController;
}

- (void)setDidSendDelegateWillDismissViewController:(BOOL)a3
{
  self->_didSendDelegateWillDismissViewController = a3;
}

- (UIViewControllerPreviewing_Internal)previewingContext
{
  return (UIViewControllerPreviewing_Internal *)objc_loadWeakRetained((id *)&self->_previewingContext);
}

- (void)setPreviewingContext:(id)a3
{
  objc_storeWeak((id *)&self->_previewingContext, a3);
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (UIInteractionProgress)interactionProgressForPresentation
{
  return self->_interactionProgressForPresentation;
}

- (void)setInteractionProgressForPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_interactionProgressForPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgressForPresentation, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_previewingContext);
  objc_storeStrong(&self->_currentCommitTransition, 0);
  objc_storeStrong((id *)&self->_windowForPreviewPresentation, 0);
  objc_storeStrong((id *)&self->_currentTransitionDelegate, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_storeStrong((id *)&self->_deepPressAnalyzer, 0);
  objc_storeStrong((id *)&self->_touchObservingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_modalPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_revealGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactionProgressForCommit, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_delegate);
}

void __59___UIPreviewInteractionController_commitInteractivePreview__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "previewInteractionController:didDismissViewController:committing:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(v2, "previewInteractionController:commitViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __59___UIPreviewInteractionController_commitInteractivePreview__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPerformingCommitTransition:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentCommitTransition:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeAfterPreviewViewControllerPresentation");
}

void __99___UIPreviewInteractionController__preparePreviewViewControllerPresentationFromPreviewInteraction___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setPerformingPreviewTransition:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 40), "_hasAppeared");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = objc_msgSend(v3, "commitTransitionScheduled");
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "commitInteractivePreview");
    }
    else
    {
      objc_msgSend(v5, "previewActionsController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "flashScrollAffordance");

    }
  }
  else
  {
    objc_msgSend(v3, "_finalizeAfterPreviewViewControllerPresentation");
  }
}

uint64_t __87___UIPreviewInteractionController__dismissPreviewViewControllerIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "previewInteractionController:didDismissViewController:committing:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 40), "_finalizeAfterPreviewViewControllerPresentation");
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "setDismissingPreview:", 0);
}

void __61___UIPreviewInteractionController__preparedInteractionEffect__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "currentPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateFromInteractionEffect:", v3);

}

void __84___UIPreviewInteractionController__preferredNavigationControllerForCommitTransition__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v4 = a2;
  v5 = v4;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v7 = v4;
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v5 = v7;
    }
  }

}

void __64___UIPreviewInteractionController__handlePreviewActionsGesture___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dismissPreviewViewControllerIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "previewInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelInteraction");

}

void __90___UIPreviewInteractionController_previewActionsController_didCompleteWithSelectedAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

@end
