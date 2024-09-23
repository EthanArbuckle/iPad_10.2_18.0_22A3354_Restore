@implementation _UIContextMenuUIController

- (_UIContextMenuUIController)initWithConfiguration:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  _UIContextMenuUIController *v8;
  _UIContextMenuUIController *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = -[_UIContextMenuUIController init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[_UIContextMenuUIController setMenuConfiguration:](v8, "setMenuConfiguration:", v6);
    -[_UIContextMenuUIController setMenuStyle:](v9, "setMenuStyle:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__keyboardWillShow_, CFSTR("UIKeyboardWillShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__keyboardWillHide_, CFSTR("UIKeyboardWillHideNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__sceneWillDeactivate_, CFSTR("UISceneWillDeactivateNotification"), 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  if (!-[_UIContextMenuUIController _dragWasCanceled](self, "_dragWasCanceled"))
    -[_UIContextMenuUIController _cleanUpDragViews](self, "_cleanUpDragViews");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("UIKeyboardWillShowNotification");
  v6[1] = CFSTR("UIKeyboardWillHideNotification");
  v6[2] = CFSTR("UISceneWillDeactivateNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIContextMenuUIController;
  -[_UIContextMenuUIController dealloc](&v5, sel_dealloc);
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UIContextMenuPanController *v20;
  void *v21;
  void *v22;
  _UIContextMenuPanController *v23;
  void *v24;
  UITapGestureRecognizer *v25;
  _UIContextMenuActionScrubbingHandoffGestureRecognizer *v26;
  int64_t v27;
  void *v28;
  int v29;
  _UIContextMenuLayoutArbiter *v30;
  void *v31;
  _UIContextMenuLayoutArbiter *v32;
  void *v33;
  void *v34;
  id v35;

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerView");
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourcePreview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_window");
    v35 = (id)objc_claimAutoreleasedReturnValue();

  }
  _UIContextMenuGetPlatformMetrics(-[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerViewProvider");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sourcePreview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "menu");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, void *))v9)[2](v9, v35, v11, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v35 = (id)v14;
  }
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  objc_msgSend(v15, "setFrame:");
  objc_msgSend(v15, "setAutoresizingMask:", 18);
  objc_msgSend(v15, "setUserInteractionEnabled:", 1);
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPassesBackgroundViewTouchesThrough:", objc_msgSend(v16, "_backgroundInteractionStyle") == 1);

  objc_msgSend(v35, "addSubview:", v15);
  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "menu");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v18, "metadata") & 0x1000000) != 0)
  {
    -[_UIContextMenuUIController _createMenuViewIfNecessaryForMenu:](self, "_createMenuViewIfNecessaryForMenu:", v18);
    -[_UIContextMenuUIController menuView](self, "menuView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "displayMenu:updateType:alongsideAnimations:", v18, 0, 0);

  }
  v20 = [_UIContextMenuPanController alloc];
  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuView](self, "menuView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_UIContextMenuPanController initWithContainerView:platterView:menuView:](v20, "initWithContainerView:platterView:menuView:", v15, v21, v22);
  -[_UIContextMenuUIController setPlatterPanController:](self, "setPlatterPanController:", v23);

  -[_UIContextMenuUIController platterPanController](self, "platterPanController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", self);

  v25 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleDismissalTapGesture_);
  -[UIGestureRecognizer setName:](v25, "setName:", CFSTR("com.apple.UIKit.ContextMenuDismissalTap"));
  -[UIGestureRecognizer setDelegate:](v25, "setDelegate:", self);
  objc_msgSend(v15, "addGestureRecognizer:", v25);
  -[_UIContextMenuUIController setDismissalTapGestureRecognizer:](self, "setDismissalTapGestureRecognizer:", v25);
  -[_UIContextMenuUIController menuView](self, "menuView");
  v26 = (_UIContextMenuActionScrubbingHandoffGestureRecognizer *)objc_claimAutoreleasedReturnValue();
  if (!-[_UIContextMenuActionScrubbingHandoffGestureRecognizer scrubbingEnabled](v26, "scrubbingEnabled"))
    goto LABEL_13;
  v27 = -[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom");

  if (v27 != 6)
  {
    v26 = -[_UIContextMenuActionScrubbingHandoffGestureRecognizer initWithTarget:action:]([_UIContextMenuActionScrubbingHandoffGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleActionHandoffGesture_);
    -[UIGestureRecognizer setDelegate:](v26, "setDelegate:", self);
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_allowsImmediateSelection");

    if (v29)
      -[_UIContextMenuActionScrubbingHandoffGestureRecognizer setHysteresis:](v26, "setHysteresis:", 0.0);
    objc_msgSend(v15, "addGestureRecognizer:", v26);
    -[_UIContextMenuUIController setActionScrubbingHandoffGestureRecognizer:](self, "setActionScrubbingHandoffGestureRecognizer:", v26);
LABEL_13:

  }
  -[_UIContextMenuUIController _updatePlatterContainerViewTraitCollection](self, "_updatePlatterContainerViewTraitCollection");
  v30 = [_UIContextMenuLayoutArbiter alloc];
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[_UIContextMenuLayoutArbiter initWithContainerView:layout:](v30, "initWithContainerView:layout:", v15, objc_msgSend(v31, "preferredLayout"));
  -[_UIContextMenuUIController setLayoutArbiter:](self, "setLayoutArbiter:", v32);

  -[_UIContextMenuUIController setState:](self, "setState:", 1);
  objc_msgSend(v15, "_focusSystemSceneComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuView](self, "menuView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pushPreferredFocusEnvironmentOverride:", v34);

}

- (void)presentationTransitionDidEnd
{
  -[_UIContextMenuUIController setState:](self, "setState:", 2);
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusSystemSceneComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuView](self, "menuView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePreferredFocusEnvironmentOverride:", v5);

  -[_UIContextMenuUIController setState:](self, "setState:", 0);
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[_UIContextMenuUIController _platformMetrics](self, "_platformMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preDismissalHandler");
  v11 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v8);

  }
  -[_UIContextMenuUIController platterPanController](self, "platterPanController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

}

- (void)dismissalTransitionDidEnd
{
  void *v3;
  void *v4;
  void (**v5)(id, void *);

  -[_UIContextMenuUIController _platformMetrics](self, "_platformMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postDismissalHandler");
  v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v4);

  }
}

- (void)platterPanControllerDidTearOff:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "panGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_allActiveTouches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuUIController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuUIController:didBeginDragWithTouch:", self, v7);

}

- (void)platterPanControllerDidSwipeDown:(id)a3
{
  id v4;

  -[_UIContextMenuUIController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 2, 0, 0);

}

- (void)platterPanInteractionBegan:(id)a3 allowSwipeToDismiss:(BOOL *)a4
{
  id v6;

  -[_UIContextMenuUIController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v6, "contextMenuUIControllerShouldAllowSwipeToDismissForBeginningPanInteraction:", self);

}

- (void)platterPanInteractionEnded:(id)a3
{
  id v4;

  -[_UIContextMenuUIController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuUIControllerDidEndPanInteraction:", self);

}

- (id)livePreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double Width;
  void *v17;
  double v18;
  CGFloat v19;
  UIDragPreviewTarget *v20;
  void *v21;
  UIDragPreviewTarget *v22;
  void *v23;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform location;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  CGRect v49;

  v4 = a4;
  v6 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__201;
  v47 = __Block_byref_object_dispose__201;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v38 = -1;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke;
  v30[3] = &unk_1E16E52C0;
  v32 = &v43;
  v8 = v6;
  v31 = v8;
  v33 = &v39;
  v34 = &v35;
  -[_UIContextMenuUIController _enumeratePlatterViewsWithBlock:](self, "_enumeratePlatterViewsWithBlock:", v30);
  if (!v44[5])
  {
    -[_UIContextMenuUIController flocker](self, "flocker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "secondaryPlatterViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (!v11)
    {
      -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v44[5];
      v44[5] = v12;

      *((_BYTE *)v40 + 24) = 1;
      v36[3] = 0;
    }
  }
  v14 = (void *)v44[5];
  if (v14)
  {
    if (*((_BYTE *)v40 + 24))
    {
      -[_UIContextMenuUIController _primaryPlatterDragPreviewForDragItem:preferringFullSize:](self, "_primaryPlatterDragPreviewForDragItem:preferringFullSize:", v8, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)&location, self);
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_2;
      v28[3] = &unk_1E16B3F40;
      objc_copyWeak(&v29, (id *)&location);
      objc_msgSend(v15, "set_fenceHandler:", v28);
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)&location);
    }
    else
    {
      memset(&location, 0, sizeof(location));
      objc_msgSend(v14, "transform");
      objc_msgSend((id)v44[5], "bounds");
      Width = CGRectGetWidth(v49);
      objc_msgSend((id)v44[5], "collapsedPreview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v19 = Width / v18;

      v25 = location;
      CGAffineTransformScale(&v26, &v25, v19, v19);
      location = v26;
      v20 = [UIDragPreviewTarget alloc];
      objc_msgSend((id)v44[5], "superview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v44[5], "center");
      v26 = location;
      v22 = -[UIPreviewTarget initWithContainer:center:transform:](v20, "initWithContainer:center:transform:", v21, &v26);

      objc_msgSend(v8, "_targetedLiftPreview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "retargetedPreviewWithTarget:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "_setApplyTargetTransformToFlock:", 1);
    }
    objc_msgSend(v15, "_setPreferredStackOrder:", v36[3]);
  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  return v15;
}

- (id)_primaryPlatterDragPreviewForDragItem:(id)a3 preferringFullSize:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _UIContextMenuDragContainerView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  UITargetedDragPreview *v29;
  _UIPlatterView *v30;
  void *v31;
  _UIPlatterView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;

  v6 = a3;
  objc_msgSend(v6, "_setDeferPreviewUpdates:", 1);
  objc_msgSend(v6, "previewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = 0;
LABEL_6:
    objc_msgSend(v6, "_targetedLiftPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_previewProviderForType:", 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
    goto LABEL_7;
  }
  objc_msgSend(v6, "_previewProviderForType:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v8, "preview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v9, "_setPreventAfterScreenUpdatesSnapshot:", 1);
  objc_msgSend(v8, "_duiPreview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isMultiItemMenu") & 1) != 0 || objc_msgSend(v11, "isOversized"))
  {

LABEL_10:
    objc_msgSend(v11, "scaledSize");
    v14 = v13;
    v16 = v15;
    v17 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v11, "scaleFactor");
  v43 = v42;

  if (v43 < 1.0 && !a4)
    goto LABEL_10;
  objc_msgSend(v11, "unscaledSize");
  v14 = v44;
  v16 = v45;
  v17 = 0;
LABEL_11:
  v47 = v9;
  if (v11)
  {
    objc_msgSend(v11, "liftTransform");
    v18 = *((double *)&v51 + 1);
    v19 = *(double *)&v51;
    v20 = *((double *)&v52 + 1);
    v21 = *(double *)&v52;
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v51 = 0u;
    v20 = 0.0;
    v18 = 0.0;
    v21 = 0.0;
    v19 = 0.0;
  }
  v22 = v16 * v21 + v14 * v19;
  v23 = -[UIView initWithFrame:]([_UIContextMenuDragContainerView alloc], "initWithFrame:", 0.0, 0.0, v22, v16 * v20 + v14 * v18);
  -[_UIContextMenuUIController set_dragContainerView:](self, "set_dragContainerView:", v23);
  -[_UIContextMenuUIController _installViewsIntoDragContainerView:](self, "_installViewsIntoDragContainerView:", v23);
  if ((_DWORD)v17)
  {
    objc_msgSend(v11, "scaledSize");
    v25 = v24;
    objc_msgSend(v11, "unscaledSize");
    v27 = v25 / v26 * 33.0;
  }
  else
  {
    v27 = 33.0;
  }
  objc_msgSend(v11, "setAvoidAnimation:", 1);
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "_setPreviewMode:", 3);
  v29 = -[UITargetedPreview initWithView:parameters:]([UITargetedDragPreview alloc], "initWithView:parameters:", v23, v28);
  -[UITargetedDragPreview setLiftAnchorPoint:](v29, "setLiftAnchorPoint:", v22 * 0.5, v27);

  v30 = [_UIPlatterView alloc];
  objc_msgSend(v8, "imageComponent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[_UIPlatterView initWithDUIPreview:imageComponent:](v30, "initWithDUIPreview:imageComponent:", v11, v31);

  -[_UIPlatterView setConstrainSize:](v32, "setConstrainSize:", v17);
  -[_UIPlatterView setLifted:](v32, "setLifted:", 1);
  -[_UIPlatterView setShadowVisible:](v32, "setShadowVisible:", 0);
  -[_UIPlatterView setTransformAppliedExternally:](v32, "setTransformAppliedExternally:", 1);
  -[_UIPlatterView setAppliesOriginalRotation:](v32, "setAppliesOriginalRotation:", 1);
  -[_UIContextMenuUIController set_destinationPlatterView:](self, "set_destinationPlatterView:", v32);
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setAlpha:", 0.0);
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v34 = v8;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "window");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "insertSubview:atIndex:", v33, 0);

  -[_UIContextMenuUIController set_subterraneanViewContainer:](self, "set_subterraneanViewContainer:", v33);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke;
  v48[3] = &unk_1E16B1B50;
  v49 = v6;
  v50 = v47;
  v37 = v47;
  v38 = v6;
  -[_UIContextMenuUIController set_postMorphDragItemUpdate:](self, "set_postMorphDragItemUpdate:", v48);
  -[_UIContextMenuUIController flocker](self, "flocker");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview view](v29, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "badgeLocationInView:", v40);
  -[UITargetedDragPreview _setInitialBadgeLocation:](v29, "_setInitialBadgeLocation:");

  return v29;
}

- (id)previewForCancellingDragItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  UITargetedDragPreview *v7;
  void *v8;
  UITargetedDragPreview *v9;

  -[_UIContextMenuUIController _postMorphDragItemUpdate](self, "_postMorphDragItemUpdate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIContextMenuUIController set_postMorphDragItemUpdate:](self, "set_postMorphDragItemUpdate:", 0);
    -[_UIContextMenuUIController set_dragWasCanceled:](self, "set_dragWasCanceled:", 1);
    -[_UIContextMenuUIController _subterraneanViewContainer](self, "_subterraneanViewContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController _dragContainerView](self, "_dragContainerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    v7 = [UITargetedDragPreview alloc];
    -[_UIContextMenuUIController _dragContainerView](self, "_dragContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UITargetedDragPreview initWithView:](v7, "initWithView:", v8);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_didBeginMorphToDragPreview
{
  id v2;

  -[_UIContextMenuUIController _dragContainerView](self, "_dragContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

- (void)_didCompleteMorphToDragPreview
{
  void *v3;
  void *v4;
  id v5;

  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[_UIContextMenuUIController _postMorphDragItemUpdate](self, "_postMorphDragItemUpdate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController set_postMorphDragItemUpdate:](self, "set_postMorphDragItemUpdate:", 0);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (void)dragWillCancelWithAnimator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke;
  v9[3] = &unk_1E16B1B28;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v4, "addAnimations:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke_2;
  v8[3] = &unk_1E16B42D0;
  v8[4] = self;
  objc_msgSend(v4, "addCompletion:", v8);

}

- (void)_installViewsIntoDragContainerView:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v4 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v14 = _UIInternalPreference_ClickUIDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
    {
      while (v4 >= v14)
      {
        _UIInternalPreferenceSync(v4, &_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v14 = _UIInternalPreference_ClickUIDebugEnabled;
        if (v4 == _UIInternalPreference_ClickUIDebugEnabled)
          goto LABEL_4;
      }
      if (byte_1EDDA7D7C)
      {
        +[UIColor yellowColor](UIColor, "yellowColor");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = objc_msgSend(v15, "CGColor");
        objc_msgSend(v19, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBorderColor:", v16);

        objc_msgSend(v19, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setBorderWidth:", 3.0);

      }
    }
  }
LABEL_4:
  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "freezeExpandedPreview");

  -[_UIContextMenuUIController platterTransitionView](self, "platterTransitionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v19);
  -[_UIContextMenuUIController platterPanController](self, "platterPanController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "panGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v7);
  objc_msgSend(v19, "setCenter:");

  objc_msgSend(v6, "center");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v19, "addSubview:", v6);
  objc_msgSend(v7, "convertPoint:toView:", v19, v11, v13);
  objc_msgSend(v6, "setCenter:");

}

- (void)_cleanUpDragViews
{
  id v3;

  -[UIView removeFromSuperview](self->_platterContainerView, "removeFromSuperview");
  -[_UIContextMenuUIController _subterraneanViewContainer](self, "_subterraneanViewContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (id)windowSceneActivationPreview
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIPreviewTarget *v15;
  UIPreviewTarget *v16;
  uint64_t v18;

  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "alwaysCompact"))
    {
      objc_msgSend(v3, "collapsedPreview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "expandedPreview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_continuousCornerRadius");
      v7 = v6;
      objc_msgSend(v4, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setContinuousCornerRadius:", v7);

    }
    objc_msgSend(v3, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "center");
    objc_msgSend(v10, "convertPoint:toView:", v9);
    v12 = v11;
    v14 = v13;

    v15 = [UIPreviewTarget alloc];
    objc_msgSend(v3, "transform");
    v16 = -[UIPreviewTarget initWithContainer:center:transform:](v15, "initWithContainer:center:transform:", v9, &v18, v12, v14);
    objc_msgSend(v4, "retargetedPreviewWithTarget:", v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  void *v18;
  id v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  CGPoint v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  v4 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "allowsUserInteractionInExpandedPreview"))
    {
      -[_UIContextMenuUIController dismissalTapGestureRecognizer](self, "dismissalTapGestureRecognizer");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        objc_msgSend(v6, "bounds");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        objc_msgSend(v4, "locationInView:", v6);
        v41.x = v16;
        v41.y = v17;
        v43.origin.x = v9;
        v43.origin.y = v11;
        v43.size.width = v13;
        v43.size.height = v15;
        *((_BYTE *)v38 + 24) = !CGRectContainsPoint(v43, v41);
      }
    }
  }
  if (*((_BYTE *)v38 + 24))
  {
    -[_UIContextMenuUIController menuView](self, "menuView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[_UIContextMenuUIController dismissalTapGestureRecognizer](self, "dismissalTapGestureRecognizer");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (v19 == v4)
      {
        objc_msgSend(v18, "bounds");
        v21 = v20;
        v23 = v22;
        v25 = v24;
        v27 = v26;
        objc_msgSend(v4, "locationInView:", v18);
        v42.x = v28;
        v42.y = v29;
        v44.origin.x = v21;
        v44.origin.y = v23;
        v44.size.width = v25;
        v44.size.height = v27;
        *((_BYTE *)v38 + 24) = !CGRectContainsPoint(v44, v42);
      }
    }

  }
  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "accessoryViews");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __59___UIContextMenuUIController_gestureRecognizerShouldBegin___block_invoke;
  v34[3] = &unk_1E16E52E8;
  v32 = v4;
  v35 = v32;
  v36 = &v37;
  objc_msgSend(v31, "enumerateObjectsUsingBlock:", v34);

  LOBYTE(v30) = *((_BYTE *)v38 + 24);
  _Block_object_dispose(&v37, 8);

  return (char)v30;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  -[_UIContextMenuUIController actionScrubbingHandoffGestureRecognizer](self, "actionScrubbingHandoffGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v10 = 1;
  }
  else
  {
    -[_UIContextMenuUIController actionScrubbingHandoffGestureRecognizer](self, "actionScrubbingHandoffGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v6;

  }
  return v10;
}

- (void)_handleDismissalTapGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_UIContextMenuUIController _isPresented](self, "_isPresented") && objc_msgSend(v5, "state") == 3)
  {
    -[_UIContextMenuUIController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 0, 0, 0);

  }
}

- (void)_handlePlatterActionTapGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_UIContextMenuUIController _isPresented](self, "_isPresented") && objc_msgSend(v7, "state") == 3)
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previewAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performWithSender:target:", v6, 0);

  }
}

- (void)_handleActionHandoffGesture:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  CGPoint v16;
  CGRect v17;

  v15 = a3;
  if (objc_msgSend(v15, "state") >= 1 && objc_msgSend(v15, "state") <= 2)
  {
    -[_UIContextMenuUIController menuView](self, "menuView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v15, "locationInView:", v4);
    v16.x = v13;
    v16.y = v14;
    v17.origin.x = v6;
    v17.origin.y = v8;
    v17.size.width = v10;
    v17.size.height = v12;
    if (CGRectContainsPoint(v17, v16) && objc_msgSend(v4, "kickstartActionScrubbingWithGesture:", v15))
    {
      objc_msgSend(v15, "setEnabled:", 0);
      objc_msgSend(v15, "setEnabled:", 1);
    }

  }
}

- (void)viewTraitCollectionDidChange
{
  void *v3;
  void *v4;

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_parentTraitEnvironmentForUserInterfaceStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UIContextMenuUIController _updatePlatterContainerViewTraitCollection](self, "_updatePlatterContainerViewTraitCollection");
}

- (void)_updatePlatterContainerViewTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom") != 6)
  {
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_parentTraitEnvironmentForUserInterfaceStyle");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v11;
    if (v11)
    {
      -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_traitCollectionForChildEnvironment:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "userInterfaceStyle");
      -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _internalTraitOverrides](v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7)
        objc_msgSend(v9, "setUserInterfaceStyle:", v7);
      else
        objc_msgSend(v9, "_removeTraitToken:", 0x1E1A994B0);

      v4 = v11;
    }

  }
}

- (void)previewSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  height = a3.height;
  width = a3.width;
  -[_UIContextMenuUIController previewSize](self, "previewSize");
  if (width != v7 || height != v6)
  {
    -[_UIContextMenuUIController setPreviewSize:](self, "setPreviewSize:", width, height);
    -[_UIContextMenuUIController setPreviewSizeDidChange:](self, "setPreviewSizeDidChange:", 1);
    -[_UIContextMenuUIController _updatePlatterAndActionViewLayoutForce:updateAttachment:](self, "_updatePlatterAndActionViewLayoutForce:updateAttachment:", 0, 1);
  }
}

- (BOOL)shouldMaintainKeyboardAssertionForFirstResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __79___UIContextMenuUIController_shouldMaintainKeyboardAssertionForFirstResponder___block_invoke;
  v12 = &unk_1E16E52E8;
  v13 = v4;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v9);

  if (!*((_BYTE *)v16 + 24))
  {

    _Block_object_dispose(&v15, 8);
LABEL_5:
    -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 0, v9, v10, v11, v12);
    v7 = 1;
    goto LABEL_6;
  }
  -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 1, v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
  v7 = 0;
LABEL_6:

  return v7;
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && -[_UIContextMenuUIController _needsToAvoidKeyboardForResponder:](self, "_needsToAvoidKeyboardForResponder:", v5))
  {
    objc_msgSend(v7, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController _adjustViewForKeyboardVisibility:keyboardInfo:](self, "_adjustViewForKeyboardVisibility:keyboardInfo:", 1, v6);

  }
}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[_UIContextMenuUIController _isAnimatingPresentation](self, "_isAnimatingPresentation")
    && -[_UIContextMenuUIController didAvoidKeyboard](self, "didAvoidKeyboard"))
  {
    objc_msgSend(v5, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController _adjustViewForKeyboardVisibility:keyboardInfo:](self, "_adjustViewForKeyboardVisibility:keyboardInfo:", 0, v4);

  }
}

- (void)_adjustViewForKeyboardVisibility:(BOOL)a3 keyboardInfo:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[5];

  v4 = a3;
  v6 = a4;
  -[_UIContextMenuUIController setDidAvoidKeyboard:](self, "setDidAvoidKeyboard:", v4);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  if (-[_UIContextMenuUIController _isAnimatingPresentation](self, "_isAnimatingPresentation"))
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.35);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_2;
    v18[3] = &unk_1E16B1BF8;
    v19 = v8;
    v10 = v8;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v9, 0, v18, 0);

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationDurationUserInfoKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UIKeyboardAnimationCurveUserInfoKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_3;
    v16[3] = &unk_1E16B1BF8;
    v17 = v8;
    v9 = v8;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v15, v16, 0, v13, 0.0);
    v10 = v17;
  }

}

- (BOOL)_needsToAvoidKeyboardForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (-[_UIContextMenuUIController _isPresented](self, "_isPresented"))
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(v5, "_layoutAllowsPreview");
      if (v8)
        v8 = objc_msgSend(v5, "hasInteractivePreview");
      *((_BYTE *)v17 + 24) = v8;
      if (!v8)
        goto LABEL_8;
    }
    else if (!*((_BYTE *)v17 + 24))
    {
LABEL_8:
      -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessoryViews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64___UIContextMenuUIController__needsToAvoidKeyboardForResponder___block_invoke;
      v13[3] = &unk_1E16E52E8;
      v14 = v4;
      v15 = &v16;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

    }
  }
  v11 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (_UIContextMenuLayoutArbiterOutput)currentLayout
{
  _UIContextMenuLayoutArbiterOutput *currentLayout;

  currentLayout = self->_currentLayout;
  if (!currentLayout)
  {
    -[_UIContextMenuUIController _updateLayoutAndAttachment:](self, "_updateLayoutAndAttachment:", 1);
    currentLayout = self->_currentLayout;
  }
  return currentLayout;
}

- (void)_updateLayoutAndAttachment:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _UIContextMenuLayoutArbiterOutput *v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double MaxY;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _UIContextMenuLayoutArbiterOutput *currentLayout;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[2];
  CGRect v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _OWORD v61[2];
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CGAffineTransform v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _OWORD v115[2];
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  void *v123;
  _QWORD v124[3];
  CGRect v125;
  CGRect v126;

  v3 = a3;
  v124[2] = *MEMORY[0x1E0C80C00];
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "preferredAttachmentEdge");

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v122 = 0;
    v120 = 0u;
    v121 = 0u;
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "_preferredAnchor");
    }
    else
    {
      v122 = 0;
      v120 = 0u;
      v121 = 0u;
    }

    *(_QWORD *)&v120 = v7;
    v119 = v122;
    v117 = v120;
    v118 = v121;
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = v117;
    v115[1] = v118;
    v116 = v119;
    objc_msgSend(v10, "set_preferredAnchor:", v115);

  }
  -[_UIContextMenuUIController _layoutWithUpdatedAttachment:concealedMenu:](self, "_layoutWithUpdatedAttachment:concealedMenu:", v3, -[_UIContextMenuUIController menuIsConcealed](self, "menuIsConcealed"));
  v11 = (_UIContextMenuLayoutArbiterOutput *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "ignoresDefaultSizingRules");

  if (v13)
  {
    -[_UIContextMenuUIController previewSize](self, "previewSize");
    v15 = v14;
    if (v11)
    {
      -[_UIContextMenuLayoutArbiterOutput preview](v11, "preview");
      v17 = *((_QWORD *)&v107 + 1);
      v16 = v107;
      v19 = *((_QWORD *)&v108 + 1);
      v18 = v108;
    }
    else
    {
      v114 = 0u;
      v113 = 0u;
      v112 = 0u;
      v111 = 0u;
      v110 = 0u;
      v109 = 0u;
      v19 = 0;
      v18 = 0;
      v17 = 0;
      v16 = 0;
      v107 = 0u;
      v108 = 0u;
    }
    v20 = v15 / CGRectGetWidth(*(CGRect *)&v16);
    if (v20 >= 1.0)
      v21 = v20;
    else
      v21 = 1.0;
    if (v11)
    {
      -[_UIContextMenuLayoutArbiterOutput preview](v11, "preview");
    }
    else
    {
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
    }
    CGAffineTransformMakeScale(&v98, v21, v21);
    -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v22);
    v24 = v23;
    -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    UIRoundToViewScale(v25);
    -[_UIContextMenuUIController setPreviewSize:](self, "setPreviewSize:", v24, v26);

  }
  if (v11)
  {
    -[_UIContextMenuLayoutArbiterOutput menu](v11, "menu");
    v27 = *((double *)&v93 + 1);
    v28 = *(double *)&v94;
  }
  else
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v28 = 0.0;
    v27 = 0.0;
    v90 = 0u;
    v91 = 0u;
  }
  -[_UIContextMenuUIController menuView](self, "menuView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAnchorPoint:", v27, v28);

  if (v11)
  {
    -[_UIContextMenuLayoutArbiterOutput menu](v11, "menu");
    v31 = *((double *)&v83 + 1);
    v32 = *(double *)&v83;
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v31 = 0.0;
    v32 = 0.0;
    v82 = 0u;
    v83 = 0u;
  }
  -[_UIContextMenuUIController menuView](self, "menuView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setVisibleContentSize:", v32, v31);

  -[_UIContextMenuUIController platterPanController](self, "platterPanController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v11)
  {
    -[_UIContextMenuLayoutArbiterOutput preview](v11, "preview");
    objc_msgSend(v35, "setOriginalPlatterCenter:", v76);
    -[_UIContextMenuLayoutArbiterOutput menu](v11, "menu");
    objc_msgSend(v35, "setOriginalMenuCenter:", v68);
    -[_UIContextMenuLayoutArbiterOutput anchor](v11, "anchor");
  }
  else
  {
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(v34, "setOriginalPlatterCenter:", 0.0, 0.0);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v35, "setOriginalMenuCenter:", 0.0, 0.0);
    v65 = 0;
    v63 = 0u;
    v64 = 0u;
  }
  v61[0] = v63;
  v61[1] = v64;
  v62 = v65;
  objc_msgSend(v35, "setMenuAnchor:", v61);
  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "accessoryViews");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAccessoryViews:", v37);

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPlatterPivotRotationEnabled:", objc_msgSend(v38, "isMultiItemMenu") ^ 1);

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "preferredLayout");

  if ((v40 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (-[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom") != 6)
      objc_msgSend(v35, "setRubberbandingEdges:", 11);
    if (v11)
    {
      -[_UIContextMenuLayoutArbiterOutput menu](v11, "menu");
    }
    else
    {
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      memset(&v54, 0, sizeof(v54));
    }
    v125.origin.x = _UIContextMenuItemFrameFromLayout(&v54);
    MaxY = CGRectGetMaxY(v125);
    -[_UIContextMenuLayoutArbiterOutput contentBounds](v11, "contentBounds");
    v42 = MaxY - CGRectGetMaxY(v126);
    if (v42 < 0.0)
      v42 = 0.0;
    if (fabs(v42) <= 2.22044605e-16)
    {
      v51 = *MEMORY[0x1E0C9D538];
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v51, "{CGPoint=dd}");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v53[0] = 0;
      *(double *)&v53[1] = -v42;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v53, "{CGPoint=dd}");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v124[0] = v43;
      v52 = *MEMORY[0x1E0C9D538];
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v52, "{CGPoint=dd}");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v124[1] = v44;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v35, "setDetents:", v45);

  }
  if (v11)
  {
    -[_UIContextMenuLayoutArbiterOutput anchor](v11, "anchor");
    v46 = v48;
  }
  else
  {
    v46 = 0;
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
  }
  -[_UIContextMenuUIController _updateActionsViewReversesOrderForAttachment:](self, "_updateActionsViewReversesOrderForAttachment:", v46, v48, v49, v50);
  currentLayout = self->_currentLayout;
  self->_currentLayout = v11;

}

- (id)_layoutWithUpdatedAttachment:(BOOL)a3 concealedMenu:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double Height;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  void *v47;
  _BOOL4 v49;
  _QWORD v50[4];
  id v51;
  _OWORD v52[2];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _OWORD v57[2];
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  CGRect v65;

  v49 = a4;
  v4 = a3;
  -[_UIContextMenuUIController layoutArbiter](self, "layoutArbiter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "preferredAttachmentEdge");

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v64 = 0;
    v62 = 0u;
    v63 = 0u;
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "_preferredAnchor");
    }
    else
    {
      v64 = 0;
      v62 = 0u;
      v63 = 0u;
    }

    *(_QWORD *)&v62 = v9;
    v61 = v64;
    v59 = v62;
    v60 = v63;
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v59;
    v57[1] = v60;
    v58 = v61;
    objc_msgSend(v12, "set_preferredAnchor:", v57);

  }
  v13 = (void *)objc_opt_new();
  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourcePreview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourcePreview:", v15);

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "preferredEdgeInsets");
  objc_msgSend(v13, "setPreferredEdgeInsets:");

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "_preferredAnchor");
  }
  else
  {
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
  }
  v52[0] = v54;
  v52[1] = v55;
  v53 = v56;
  objc_msgSend(v13, "setPreferredAnchor:", v52);

  -[_UIContextMenuUIController previewSize](self, "previewSize");
  objc_msgSend(v13, "setPreferredPreviewSize:");
  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "ignoresDefaultSizingRules");

  if (v20)
    objc_msgSend(v13, "setPreferredPreviewFittingStrategy:", 1);
  -[_UIContextMenuUIController menuView](self, "menuView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "hierarchyStyle") == 2)
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "menu");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = ((unint64_t)objc_msgSend(v23, "metadata") >> 16) & 1;

  }
  else
  {
    LODWORD(v24) = 0;
  }

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "menu");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = ((unint64_t)objc_msgSend(v26, "metadata") >> 8) & 1;

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "menu");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = ((unint64_t)objc_msgSend(v29, "metadata") >> 32) & 1;

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_preferredMenuWidth");
  v33 = v32;

  v34 = _UIContextMenuActionsViewWidth(v7, v27, v24, v30, -[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom"));
  if (v33 < v34)
    v33 = v34;
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v65);
  -[_UIContextMenuUIController menuView](self, "menuView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "preferredContentSizeWithinContainerSize:", v33, Height);
  objc_msgSend(v13, "setPreferredMenuSize:");

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_preferredMenuAttachmentPoint");
  objc_msgSend(v13, "setPreferredMenuAttachmentPoint:");

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "accessoryViews");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessoryViews:", v39);

  objc_msgSend(v13, "setShouldUpdateAttachment:", v4);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShouldAvoidInputViews:", objc_msgSend(v40, "isOnScreen"));

  objc_msgSend(v13, "setShouldConcealMenu:", v49);
  objc_msgSend(v7, "traitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v41, "userInterfaceIdiom"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "menuMaximumHeight");
  v44 = v43;

  objc_msgSend(v13, "setMaximumMenuHeight:", v44);
  -[_UIContextMenuUIController menuView](self, "menuView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __73___UIContextMenuUIController__layoutWithUpdatedAttachment_concealedMenu___block_invoke;
  v50[3] = &unk_1E16B4780;
  v51 = v45;
  v46 = v45;
  objc_msgSend(v13, "setComputePreferredScrollTruncationDetentForHeight:", v50);
  objc_msgSend(v6, "computedLayoutWithInput:", v13);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (void)_updateActionsViewReversesOrderForAttachment:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  if (a3 == 1)
    v5 = 4;
  else
    v5 = 1;
  -[_UIContextMenuUIController menuView](self, "menuView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttachmentEdge:", v5);

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_orderMenuBasedOnPriority");

  if (a3 == 1)
  {
    if (v8)
    {
      -[_UIContextMenuUIController menuView](self, "menuView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setReversesActionOrder:", 1);

    }
  }
}

- (void)_updatePlatterAndActionViewLayoutForce:(BOOL)a3 updateAttachment:(BOOL)a4
{
  -[_UIContextMenuUIController _updatePlatterAndActionViewLayoutForce:updateAttachment:adjustDetent:](self, "_updatePlatterAndActionViewLayoutForce:updateAttachment:adjustDetent:", a3, a4, 0);
}

- (void)_updatePlatterAndActionViewLayoutForce:(BOOL)a3 updateAttachment:(BOOL)a4 adjustDetent:(BOOL)a5
{
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD aBlock[5];
  BOOL v18;
  BOOL v19;

  if (-[_UIContextMenuUIController _isPresented](self, "_isPresented"))
  {
    -[_UIContextMenuUIController layoutArbiter](self, "layoutArbiter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (a3 || -[_UIContextMenuUIController previewSizeDidChange](self, "previewSizeDidChange"))
      {
        v10 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke;
        aBlock[3] = &unk_1E16B70C0;
        aBlock[4] = self;
        v18 = a4;
        v19 = a5;
        v11 = (void (**)(_QWORD))_Block_copy(aBlock);
        if (-[_UIContextMenuUIController _isAnimatingPresentation](self, "_isAnimatingPresentation")
          && +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled")
          && !+[UIView _isInRetargetableAnimationBlock](UIView, "_isInRetargetableAnimationBlock"))
        {
          if (+[UIView _isInRetargetableAnimationBlock](UIView, "_isInRetargetableAnimationBlock")
            || !+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
          {
            v15[0] = v10;
            v15[1] = 3221225472;
            v15[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_3;
            v15[3] = &unk_1E16B1BF8;
            v16 = v11;
            +[UIView _animateByRetargetingAnimations:completion:](UIView, "_animateByRetargetingAnimations:completion:", v15, 0);
            v12 = v16;
          }
          else
          {
            v13[0] = v10;
            v13[1] = 3221225472;
            v13[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_4;
            v13[3] = &unk_1E16B1BF8;
            v14 = v11;
            dispatch_async(MEMORY[0x1E0C80D38], v13);
            v12 = v14;
          }

        }
        else
        {
          v11[2](v11);
        }

      }
    }
  }
}

- (void)_createMenuViewIfNecessaryForMenu:(id)a3
{
  _UIContextMenuView *v4;
  _UIContextMenuView *v5;
  _UIContextMenuView *menuView;
  void *v7;
  void *v8;
  _BOOL8 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  if ((objc_msgSend(a3, "metadata") & 0x1000000) != 0)
  {
    -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 0);
    v4 = [_UIContextMenuView alloc];
    v5 = -[_UIContextMenuView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    menuView = self->_menuView;
    self->_menuView = v5;

    -[_UIContextMenuView setHierarchyStyle:](self->_menuView, "setHierarchyStyle:", -[_UIContextMenuUIController _preferredSubmenuHierarchyStyle](self, "_preferredSubmenuHierarchyStyle"));
    -[_UIContextMenuView setDelegate:](self->_menuView, "setDelegate:", self);
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "_preferredAnchor");
      if ((_QWORD)v10 == 1)
        -[_UIContextMenuUIController _updateActionsViewReversesOrderForAttachment:](self, "_updateActionsViewReversesOrderForAttachment:", 1);
    }
    else
    {
      v12 = 0;
      v10 = 0u;
      v11 = 0u;
    }
    -[_UIContextMenuView setShouldAvoidInputViews:](self->_menuView, "setShouldAvoidInputViews:", objc_msgSend(v8, "_shouldAvoidInputViews", v10, v11, v12));
    v9 = objc_msgSend(v8, "preferredLayout") == 1 || objc_msgSend(v8, "preferredLayout") == 3;
    -[_UIContextMenuView setScrubbingEnabled:](self->_menuView, "setScrubbingEnabled:", v9);
    -[_UIContextMenuView setAllowsBackgroundViewInteraction:](self->_menuView, "setAllowsBackgroundViewInteraction:", objc_msgSend(v8, "_backgroundInteractionStyle") != 0);

  }
}

- (void)displayMenu:(id)a3 inPlaceOfMenu:(id)a4
{
  if (a4)
    -[_UIContextMenuUIController _replaceVisibleMenu:withMenu:](self, "_replaceVisibleMenu:withMenu:", a4, a3);
  else
    -[_UIContextMenuUIController _displayMenu:updateType:](self, "_displayMenu:updateType:", a3, 3);
}

- (void)retargetDismissingMenuToPreview:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  _QWORD v7[11];

  if (!a3)
  {
    v7[9] = v3;
    v7[10] = v4;
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62___UIContextMenuUIController_retargetDismissingMenuToPreview___block_invoke;
    v7[3] = &unk_1E16B1B28;
    v7[4] = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v6, 0, v7, 0);

  }
}

- (void)didSelectCancelActionInContextMenuView:(id)a3
{
  id v4;

  -[_UIContextMenuUIController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 0, 0, 0);

}

- (void)contextMenuView:(id)a3 didSelectElement:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  _QWORD aBlock[4];
  id v11;
  _UIContextMenuUIController *v12;
  id v13;

  v5 = a4;
  -[_UIContextMenuUIController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_isLeaf"))
  {
    v7 = v5;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63___UIContextMenuUIController_contextMenuView_didSelectElement___block_invoke;
    aBlock[3] = &unk_1E16B47A8;
    v8 = v6;
    v11 = v8;
    v12 = self;
    v13 = v7;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v7, "keepsMenuPresented"))
      v9[2](v9);
    else
      objc_msgSend(v8, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 1, v9, 0);

  }
  else
  {
    -[_UIContextMenuUIController _displayMenu:updateType:](self, "_displayMenu:updateType:", v5, 1);
  }

}

- (id)contextMenuView:(id)a3 willDisplayMenu:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[_UIContextMenuUIController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuUIController:willDisplayMenu:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_displayMenu:(id)a3 updateType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  char v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;

  v6 = a3;
  -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 0);
  -[_UIContextMenuUIController menuView](self, "menuView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (a4 == 1)
    {
      -[_UIContextMenuUIController menuView](self, "menuView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "visibleMenus");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v6) ^ 1;

    }
    else
    {
      v10 = 0;
    }
    -[_UIContextMenuUIController menuView](self, "menuView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_4;
    v14[3] = &unk_1E16E5330;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "displayMenu:updateType:alongsideAnimations:", v6, a4, v14);
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke;
    v17[3] = &unk_1E16B1B50;
    v17[4] = self;
    v18 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v17);
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_2;
    v16[3] = &unk_1E16B1B28;
    v16[4] = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v12, 0, v16, 0);

    v13 = v18;
  }

}

- (void)_replaceVisibleMenu:(id)a3 withMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = a4;
  -[_UIContextMenuUIController menuView](self, "menuView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIContextMenuUIController menuView](self, "menuView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59___UIContextMenuUIController__replaceVisibleMenu_withMenu___block_invoke;
    v10[3] = &unk_1E16C3F48;
    v10[4] = self;
    objc_msgSend(v9, "replaceVisibleMenu:withMenu:alongsideAnimations:", v6, v7, v10);

  }
  else
  {
    -[_UIContextMenuUIController _displayMenu:updateType:](self, "_displayMenu:updateType:", v7, 0);
  }

}

- (void)_concealMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController menuView](self, "menuView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    -[_UIContextMenuUIController setMenuIsConcealed:](self, "setMenuIsConcealed:", 1);
    v10 = v6;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42___UIContextMenuUIController__concealMenu__block_invoke;
    v11[3] = &unk_1E16B1B28;
    v11[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42___UIContextMenuUIController__concealMenu__block_invoke_3;
    v9[3] = &unk_1E16B25B0;
    v9[4] = self;
    v7 = v6;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v5, 0, v11, v9);

  }
  else
  {
    -[_UIContextMenuUIController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 5, 0, 0);

  }
}

- (_UIMorphingPlatterView)contentPlatterView
{
  _UIMorphingPlatterView *contentPlatterView;
  void *v4;
  void *v5;
  uint64_t v6;
  _UIMorphingPlatterView *v7;
  _UIMorphingPlatterView *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UITapGestureRecognizer *v19;
  void *v20;
  void *v21;
  _UIMorphingPlatterView *v22;
  void *v23;

  contentPlatterView = self->_contentPlatterView;
  if (!contentPlatterView)
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isMultiItemMenu");
    if ((v6 & 1) != 0 || objc_msgSend(v5, "_layoutAllowsPreview"))
    {
      v7 = (_UIMorphingPlatterView *)objc_opt_new();
      v8 = self->_contentPlatterView;
      self->_contentPlatterView = v7;

      -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _UIContextMenuGetPlatformMetrics(objc_msgSend(v10, "userInterfaceIdiom"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v6 & 1) != 0)
      {
        v12 = 1;
      }
      else if (objc_msgSend(v5, "preferredLayout") == 1)
      {
        objc_msgSend(v4, "previewViewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13 == 0;

      }
      else
      {
        v12 = 0;
      }
      -[_UIMorphingPlatterView setAlwaysCompact:](self->_contentPlatterView, "setAlwaysCompact:", v12);
      -[_UIMorphingPlatterView setAllowsUserInteractionInExpandedPreview:](self->_contentPlatterView, "setAllowsUserInteractionInExpandedPreview:", objc_msgSend(v5, "hasInteractivePreview"));
      -[_UIMorphingPlatterView setPreventPreviewRasterization:](self->_contentPlatterView, "setPreventPreviewRasterization:", objc_msgSend(v5, "preventPreviewRasterization"));
      -[_UIMorphingPlatterView setWantsEdgeAntialiasing:](self->_contentPlatterView, "setWantsEdgeAntialiasing:", v6);
      -[_UIMorphingPlatterView setCollapsedShadowStyle:](self->_contentPlatterView, "setCollapsedShadowStyle:", 1);
      if (v12)
        v14 = 1;
      else
        v14 = 2;
      -[_UIMorphingPlatterView setExpandedShadowStyle:](self->_contentPlatterView, "setExpandedShadowStyle:", v14);
      objc_msgSend(v11, "previewShadowSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingPlatterView setShadowSettings:](self->_contentPlatterView, "setShadowSettings:", v15);

      objc_msgSend(v11, "submenuSeparatedOptions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingPlatterView setSeparatedOptions:](self->_contentPlatterView, "setSeparatedOptions:", v16);

      objc_msgSend(v11, "shouldApplyClippingHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingPlatterView setShouldApplyClippingHandler:](self->_contentPlatterView, "setShouldApplyClippingHandler:", v17);

      if (objc_msgSend(v5, "ignoresDefaultSizingRules"))
        -[_UIMorphingPlatterView setPreferredMorphingAxis:](self->_contentPlatterView, "setPreferredMorphingAxis:", 1);
      objc_msgSend(v4, "previewAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePlatterActionTapGesture_);
        -[_UIContextMenuUIController setPlatterActionTapGestureRecognizer:](self, "setPlatterActionTapGestureRecognizer:", v19);

        -[_UIContextMenuUIController platterActionTapGestureRecognizer](self, "platterActionTapGestureRecognizer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setName:", CFSTR("com.apple.UIKit.ContextMenuPreviewActionTap"));

        -[_UIContextMenuUIController platterActionTapGestureRecognizer](self, "platterActionTapGestureRecognizer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDelegate:", self);

        v22 = self->_contentPlatterView;
        -[_UIContextMenuUIController platterActionTapGestureRecognizer](self, "platterActionTapGestureRecognizer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView addGestureRecognizer:](v22, "addGestureRecognizer:", v23);

      }
    }

    contentPlatterView = self->_contentPlatterView;
  }
  return contentPlatterView;
}

- (_UIFlocker)flocker
{
  void *v3;
  int v4;
  _UIFlocker *v5;
  void *v6;
  _UIFlocker *v7;
  _UIFlocker *flocker;
  void *v9;
  void *v10;

  if (!self->_flocker)
  {
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isMultiItemMenu");

    if (v4)
    {
      v5 = [_UIFlocker alloc];
      -[_UIContextMenuUIController platterTransitionView](self, "platterTransitionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[_UIFlocker initWithContainerView:](v5, "initWithContainerView:", v6);
      flocker = self->_flocker;
      self->_flocker = v7;

      -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFlocker setItemCount:](self->_flocker, "setItemCount:", objc_msgSend(v9, "representedItemCount"));

      -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFlocker setBadgeValue:](self->_flocker, "setBadgeValue:", objc_msgSend(v10, "badgeCount"));

    }
  }
  return self->_flocker;
}

- (UIView)platterTransitionView
{
  _UIContextMenuPlatterTransitionView *v3;
  UIView *v4;
  UIView *platterTransitionView;
  int v6;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (!self->_platterTransitionView)
  {
    v3 = [_UIContextMenuPlatterTransitionView alloc];
    v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    platterTransitionView = self->_platterTransitionView;
    self->_platterTransitionView = v4;

    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v6 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v8 = _UIInternalPreference_ClickUIDebugEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
      {
        while (v6 >= v8)
        {
          _UIInternalPreferenceSync(v6, &_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v8 = _UIInternalPreference_ClickUIDebugEnabled;
          if (v6 == _UIInternalPreference_ClickUIDebugEnabled)
            return self->_platterTransitionView;
        }
        if (byte_1EDDA7D7C)
        {
          +[UIColor magentaColor](UIColor, "magentaColor");
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v10 = objc_msgSend(v9, "CGColor");
          -[UIView layer](self->_platterTransitionView, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setBorderColor:", v10);

          -[UIView layer](self->_platterTransitionView, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBorderWidth:", 6.0);

        }
      }
    }
  }
  return self->_platterTransitionView;
}

- (UIView)platterContainerView
{
  UIView *platterContainerView;
  void *v4;
  _BOOL8 v5;
  _UIContextMenuContainerView *v6;
  UIView *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  UIView *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  platterContainerView = self->_platterContainerView;
  if (!platterContainerView)
  {
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_backgroundInteractionStyle") == 2;

    v6 = [_UIContextMenuContainerView alloc];
    v7 = -[_UIContextMenuContainerView initWithFrame:allowsBackgroundInteractionAcrossProccesses:](v6, "initWithFrame:allowsBackgroundInteractionAcrossProccesses:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke;
    v23[3] = &unk_1E16E5358;
    objc_copyWeak(&v24, &location);
    -[UIView setSubtreeTraitPropagationHandler:](v7, "setSubtreeTraitPropagationHandler:", v23);
    -[UIView traitCollection](v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    if (v10
      || (-[_UIContextMenuUIController menuStyle](self, "menuStyle"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "preferredLayout"),
          v11,
          v12 == 3))
    {
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_3;
      v21[3] = &unk_1E16B3F40;
      objc_copyWeak(&v22, &location);
      -[UIView setDismissalHandler:](v7, "setDismissalHandler:", v21);
      -[_UIContextMenuUIController platterTransitionView](self, "platterTransitionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setContentWrapperView:](v7, "setContentWrapperView:", v13);

      objc_destroyWeak(&v22);
    }
    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setAllowsDragEventsToPassthrough:](v7, "setAllowsDragEventsToPassthrough:", objc_msgSend(v14, "preferredLayout") == 3);

    -[_UIContextMenuUIController menuStyle](self, "menuStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "ignoresContainerSizeChange");

    if ((v16 & 1) == 0)
    {
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_4;
      v19[3] = &unk_1E16E5380;
      objc_copyWeak(&v20, &location);
      -[UIView setSizeChangeHandler:](v7, "setSizeChangeHandler:", v19);
      objc_destroyWeak(&v20);
    }
    v17 = self->_platterContainerView;
    self->_platterContainerView = v7;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    platterContainerView = self->_platterContainerView;
  }
  return platterContainerView;
}

- (UIVisualEffectView)backgroundEffectView
{
  UIVisualEffectView *backgroundEffectView;
  UIVisualEffectView *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *v6;

  backgroundEffectView = self->_backgroundEffectView;
  if (!backgroundEffectView)
  {
    v4 = [UIVisualEffectView alloc];
    v5 = -[UIVisualEffectView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_backgroundEffectView;
    self->_backgroundEffectView = v5;

    backgroundEffectView = self->_backgroundEffectView;
  }
  return backgroundEffectView;
}

- (id)dismissalPreviewForStyle:(unint64_t)a3 clientReturnedPreview:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  UIPreviewTarget *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIPreviewTarget *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UITargetedPreview *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  CATransform3D v41;
  CGAffineTransform v42;

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    -[_UIContextMenuUIController _destinationPlatterView](self, "_destinationPlatterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[_UIContextMenuUIController _dragContainerView](self, "_dragContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "center");
      v12 = v11;
      v14 = v13;
      -[_UIContextMenuUIController _subterraneanViewContainer](self, "_subterraneanViewContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "convertPoint:toView:", v15, v12, v14);
      v17 = v16;
      v19 = v18;

      -[_UIContextMenuUIController _subterraneanViewContainer](self, "_subterraneanViewContainer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addSubview:", v9);

      objc_msgSend(v9, "setCenter:", v17, v19);
      v21 = [UIPreviewTarget alloc];
      objc_msgSend(v9, "superview");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "center");
      v24 = v23;
      v26 = v25;
      objc_msgSend(v8, "targetTransform");
      CATransform3DGetAffineTransform(&v42, &v41);
      v27 = -[UIPreviewTarget initWithContainer:center:transform:](v21, "initWithContainer:center:transform:", v22, &v42, v24, v26);

      v28 = (void *)objc_opt_new();
      +[UIColor clearColor](UIColor, "clearColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setBackgroundColor:", v29);

      objc_msgSend(v8, "preview");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "outline");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setVisiblePath:", v31);

      objc_msgSend(v8, "preview");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "shadowPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setShadowPath:", v33);

      objc_msgSend(v28, "setAppliesShadow:", 1);
      v34 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", v8, v28, v27);
      objc_msgSend(v8, "preview");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "previewMode");

      if (v36 == 4)
        -[UITargetedPreview _setPreviewMode:](v34, "_setPreviewMode:", 4);

    }
    else
    {
      v34 = 0;
    }

  }
  else
  {
    -[_UIContextMenuUIController delegate](self, "delegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "contextMenuUIController:dismissalPreviewForItem:clientReturnedPreview:", self, v39, a4);
    v34 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();

  }
  return v34;
}

- (id)dismissalPreviewForSecondaryItem:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v9;

  v9 = 0;
  v5 = a3;
  -[_UIContextMenuUIController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextMenuUIController:dismissalPreviewForItem:clientReturnedPreview:", self, v5, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v12;
  if (v6 == v7)
  {
    if (-[_UIContextMenuUIController _isPresented](self, "_isPresented"))
    {
      -[_UIContextMenuUIController _platformMetrics](self, "_platformMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "shouldDismissMenuOnSceneDeactivation"))
      {
        -[_UIContextMenuUIController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 3, 0, 0);

      }
    }
    else
    {
      -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidesCollapsedSourceView:", 0);
    }

    v8 = v12;
  }

}

- (unint64_t)_preferredSubmenuHierarchyStyle
{
  void *v3;
  char v4;
  void *v5;
  double Width;
  void *v7;
  double v8;
  BOOL v9;
  CGRect v11;

  -[_UIContextMenuUIController menuStyle](self, "menuStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersStackedHierarchy");

  if ((v4 & 1) != 0 || !-[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom"))
    return 1;
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v11);
  -[_UIContextMenuUIController platterContainerView](self, "platterContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _UIContextMenuActionsViewWidth(v7, 0, 0, 0, -[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom"));
  v9 = Width > v8 + v8;

  if (v9)
    return 2;
  else
    return 1;
}

- (void)_enumeratePlatterViewsWithBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, uint64_t, uint64_t, _BYTE *))a3;
  v26 = 0;
  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_6;
  -[_UIContextMenuUIController contentPlatterView](self, "contentPlatterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContextMenuUIController flocker](self, "flocker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "itemCount") - 1;

  v9 = v8 >= 4 ? 4 : v8;
  v4[2](v4, v6, v9, 1, &v26);

  if (!v26)
  {
LABEL_6:
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[_UIContextMenuUIController flocker](self, "flocker", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secondaryPlatterViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v17, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "alpha");
          v20 = fabs(v19);

          if (v20 >= 2.22044605e-16)
          {
            objc_msgSend(v17, "view");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v21, v14, 0, &v26);

            if (v26)
              goto LABEL_16;
            ++v14;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }
LABEL_16:

  }
}

- (BOOL)_isPresented
{
  return -[_UIContextMenuUIController state](self, "state") != 0;
}

- (BOOL)_isAnimatingPresentation
{
  return -[_UIContextMenuUIController state](self, "state") == 1;
}

- (int64_t)_interfaceIdiom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[_UIContextMenuUIController menuConfiguration](self, "menuConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourcePreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  return v6;
}

- (id)_platformMetrics
{
  return _UIContextMenuGetPlatformMetrics(-[_UIContextMenuUIController _interfaceIdiom](self, "_interfaceIdiom"));
}

- (UIViewFloatAnimatableProperty)backgroundViewAnimationProgress
{
  UIViewFloatAnimatableProperty *backgroundViewAnimationProgress;
  UIViewFloatAnimatableProperty *v4;
  UIViewFloatAnimatableProperty *v5;

  backgroundViewAnimationProgress = self->_backgroundViewAnimationProgress;
  if (!backgroundViewAnimationProgress)
  {
    v4 = (UIViewFloatAnimatableProperty *)objc_opt_new();
    v5 = self->_backgroundViewAnimationProgress;
    self->_backgroundViewAnimationProgress = v4;

    backgroundViewAnimationProgress = self->_backgroundViewAnimationProgress;
  }
  return backgroundViewAnimationProgress;
}

- (void)_testing_dismissByTappingOutside
{
  id v3;

  -[_UIContextMenuUIController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", self, 0, 0, 0);

}

- (void)_testing_tapAnAction
{
  id v2;

  -[_UIContextMenuUIController menuView](self, "menuView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelector:", sel__testing_tapAnAction);

}

- (_UIContextMenuView)menuView
{
  return self->_menuView;
}

- (_UIContextMenuUIControllerDelegate)delegate
{
  return (_UIContextMenuUIControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIFulfilledContextMenuConfiguration)menuConfiguration
{
  return self->_menuConfiguration;
}

- (void)setMenuConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_menuConfiguration, a3);
}

- (_UIContextMenuStyle)menuStyle
{
  return self->_menuStyle;
}

- (void)setMenuStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UITapGestureRecognizer)platterActionTapGestureRecognizer
{
  return self->_platterActionTapGestureRecognizer;
}

- (void)setPlatterActionTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_platterActionTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)dismissalTapGestureRecognizer
{
  return self->_dismissalTapGestureRecognizer;
}

- (void)setDismissalTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTapGestureRecognizer, a3);
}

- (_UIContextMenuActionScrubbingHandoffGestureRecognizer)actionScrubbingHandoffGestureRecognizer
{
  return self->_actionScrubbingHandoffGestureRecognizer;
}

- (void)setActionScrubbingHandoffGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_actionScrubbingHandoffGestureRecognizer, a3);
}

- (_UIContextMenuPanController)platterPanController
{
  return self->_platterPanController;
}

- (void)setPlatterPanController:(id)a3
{
  objc_storeStrong((id *)&self->_platterPanController, a3);
}

- (_UIContextMenuLayoutArbiter)layoutArbiter
{
  return self->_layoutArbiter;
}

- (void)setLayoutArbiter:(id)a3
{
  objc_storeStrong((id *)&self->_layoutArbiter, a3);
}

- (CGSize)previewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previewSize.width;
  height = self->_previewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  self->_previewSize = a3;
}

- (BOOL)previewSizeDidChange
{
  return self->_previewSizeDidChange;
}

- (void)setPreviewSizeDidChange:(BOOL)a3
{
  self->_previewSizeDidChange = a3;
}

- (BOOL)menuIsConcealed
{
  return self->_menuIsConcealed;
}

- (void)setMenuIsConcealed:(BOOL)a3
{
  self->_menuIsConcealed = a3;
}

- (BOOL)didAvoidKeyboard
{
  return self->_didAvoidKeyboard;
}

- (void)setDidAvoidKeyboard:(BOOL)a3
{
  self->_didAvoidKeyboard = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (_UIContextMenuSubterraneanContainerView)_subterraneanViewContainer
{
  return self->__subterraneanViewContainer;
}

- (void)set_subterraneanViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->__subterraneanViewContainer, a3);
}

- (_UIPlatterView)_destinationPlatterView
{
  return self->__destinationPlatterView;
}

- (void)set_destinationPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->__destinationPlatterView, a3);
}

- (UIView)_dragContainerView
{
  return self->__dragContainerView;
}

- (void)set_dragContainerView:(id)a3
{
  objc_storeStrong((id *)&self->__dragContainerView, a3);
}

- (id)_postMorphDragItemUpdate
{
  return self->__postMorphDragItemUpdate;
}

- (void)set_postMorphDragItemUpdate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)_dragWasCanceled
{
  return self->__dragWasCanceled;
}

- (void)set_dragWasCanceled:(BOOL)a3
{
  self->__dragWasCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__postMorphDragItemUpdate, 0);
  objc_storeStrong((id *)&self->__dragContainerView, 0);
  objc_storeStrong((id *)&self->__destinationPlatterView, 0);
  objc_storeStrong((id *)&self->__subterraneanViewContainer, 0);
  objc_storeStrong((id *)&self->_layoutArbiter, 0);
  objc_storeStrong((id *)&self->_platterPanController, 0);
  objc_storeStrong((id *)&self->_actionScrubbingHandoffGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_platterActionTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuStyle, 0);
  objc_storeStrong((id *)&self->_menuConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundViewAnimationProgress, 0);
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_flocker, 0);
  objc_storeStrong((id *)&self->_menuView, 0);
  objc_storeStrong((id *)&self->_contentPlatterView, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_platterTransitionView, 0);
  objc_storeStrong((id *)&self->_platterContainerView, 0);
}

@end
