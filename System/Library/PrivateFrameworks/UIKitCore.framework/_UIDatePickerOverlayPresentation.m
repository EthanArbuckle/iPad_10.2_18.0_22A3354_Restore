@implementation _UIDatePickerOverlayPresentation

- (_UIDatePickerOverlayPresentation)initWithSourceView:(id)a3
{
  id v4;
  _UIDatePickerOverlayPresentation *v5;
  _UIDatePickerOverlayPresentation *v6;
  CGSize v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDatePickerOverlayPresentation;
  v5 = -[_UIDatePickerOverlayPresentation init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceView, v4);
    *(_OWORD *)&v6->_alignment = xmmword_18666E9A0;
    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v6->_sourceRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v6->_sourceRect.size = v7;
  }

  return v6;
}

- (BOOL)isPresentingOverlay
{
  void *v2;
  BOOL v3;

  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isBeingDismissedOrPresented
{
  void *v4;
  char v5;

  if (-[_UIDatePickerOverlayPresentation isPresentingContainerViewController](self, "isPresentingContainerViewController"))
  {
    return 1;
  }
  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBeingDismissed");

  return v5;
}

- (CGRect)resolvedSourceRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  -[_UIDatePickerOverlayPresentation sourceRect](self, "sourceRect");
  if (CGRectIsNull(v20))
  {
    -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

  }
  else
  {
    -[_UIDatePickerOverlayPresentation sourceRect](self, "sourceRect");
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  v16 = v5;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)resolvedSourceBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (-[_UIDatePickerOverlayPresentation overlayAnchor](self, "overlayAnchor") == 2)
  {
    -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)presentDatePicker:(id)a3 onDismiss:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _UIDatePickerOverlayPresentation *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_storeWeak((id *)&self->_activeDatePicker, v6);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64___UIDatePickerOverlayPresentation_presentDatePicker_onDismiss___block_invoke;
  v10[3] = &unk_1E16E9420;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[_UIDatePickerOverlayPresentation _prepareDatePickerPresentationWithCompletion:](self, "_prepareDatePickerPresentationWithCompletion:", v10);

}

- (void)activateEmptyPresentationWithMode:(int64_t)a3 onDismiss:(id)a4
{
  int64_t activeMode;
  BOOL v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a4;
  activeMode = self->_activeMode;
  if (activeMode)
    v7 = activeMode == a3;
  else
    v7 = 1;
  if (!v7)
  {
    -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 1);

    }
  }
  -[_UIDatePickerOverlayPresentation setActiveMode:](self, "setActiveMode:", a3);
  -[_UIDatePickerOverlayPresentation setDismissHandler:](self, "setDismissHandler:", v10);

}

- (void)dismissPresentationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIDatePickerOverlayPlatterView *platterView;
  UIView *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UIDatePickerOverlayPlatterView *v19;
  void *v20;
  _UIDatePickerContainerViewController *containerViewController;
  uint64_t v22;
  void (**v23)(_QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD aBlock[6];
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  _UIDatePickerOverlayPlatterView *v48;
  _QWORD v49[5];
  id v50;

  v3 = a3;
  -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0);

    -[_UIDatePickerOverlayPresentation setDismissHandler:](self, "setDismissHandler:", 0);
  }
  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIDatePickerOverlayPresentation activeDatePicker](self, "activeDatePicker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resignFirstResponder");

    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = __Block_byref_object_copy__227;
    v49[4] = __Block_byref_object_dispose__227;
    -[_UIDatePickerOverlayPresentation activeDatePicker](self, "activeDatePicker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_style");
    v50 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__227;
    v47 = __Block_byref_object_dispose__227;
    v48 = self->_platterView;
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__227;
    v41 = __Block_byref_object_dispose__227;
    v42 = 0;
    platterView = self->_platterView;
    if (platterView)
    {
      v12 = [UIView alloc];
      objc_msgSend(v10, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frame");
      v14 = -[UIView initWithFrame:](v12, "initWithFrame:");
      v15 = (void *)v38[5];
      v38[5] = v14;

      objc_msgSend(v10, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "transform");
      }
      else
      {
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
      }
      v20 = (void *)v38[5];
      v33[0] = v34;
      v33[1] = v35;
      v33[2] = v36;
      objc_msgSend(v20, "setTransform:", v33);

      objc_msgSend((id)v38[5], "setUserInteractionEnabled:", 0);
      objc_msgSend((id)v44[5], "setUserInteractionEnabled:", 0);
      v19 = self->_platterView;
    }
    else
    {
      v19 = 0;
    }
    self->_platterView = 0;

    containerViewController = self->_containerViewController;
    self->_containerViewController = 0;

    objc_storeWeak((id *)&self->_activeDatePicker, 0);
    -[_UIDatePickerOverlayPresentation setActiveMode:](self, "setActiveMode:", 0);
    if (platterView)
    {
      v22 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke;
      aBlock[3] = &unk_1E16C2E60;
      aBlock[4] = v49;
      aBlock[5] = &v43;
      v23 = (void (**)(_QWORD))_Block_copy(aBlock);
      v31[0] = v22;
      v31[1] = 3221225472;
      v31[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_2;
      v31[3] = &unk_1E16E9448;
      v31[4] = &v37;
      v24 = _Block_copy(v31);
      objc_msgSend(v10, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v38[5]);

      objc_msgSend((id)v38[5], "addSubview:", v44[5]);
      objc_msgSend(v10, "presentingViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dismissViewControllerAnimated:completion:", 0, 0);

      if (v3)
      {
        if (_AXSReduceMotionEnabled())
        {
          v30[0] = v22;
          v30[1] = 3221225472;
          v30[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_3;
          v30[3] = &unk_1E16B14C0;
          v30[4] = &v43;
          v28[0] = v22;
          v28[1] = 3221225472;
          v28[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_4;
          v28[3] = &unk_1E16B1BA0;
          v29 = v24;
          -[_UIDatePickerOverlayPresentation animateReducedMotionTransitionWithAnimations:completion:](self, "animateReducedMotionTransitionWithAnimations:completion:", v30, v28);

        }
        else
        {
          -[_UIDatePickerOverlayPresentation animateDismissalWithAnimations:completion:](self, "animateDismissalWithAnimations:completion:", v23, v24);
        }
      }
      else
      {
        v23[2](v23);
        (*((void (**)(void *, uint64_t, _QWORD))v24 + 2))(v24, 1, 0);
      }

    }
    else
    {
      objc_msgSend(v10, "presentingViewController");
      v23 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dismissViewControllerAnimated:completion:", 0, 0);
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(v49, 8);
  }
  else
  {
    -[_UIDatePickerOverlayPresentation setActiveMode:](self, "setActiveMode:", 0);
  }
}

- (void)_prepareDatePickerPresentationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UIDatePickerContainerViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**containerPresentCompletion)(id, _QWORD, uint64_t);
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];

  v4 = a3;
  -[_UIDatePickerOverlayPresentation activeDatePicker](self, "activeDatePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v7 = (_UIDatePickerContainerViewController *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_viewControllerForAncestor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[_UIDatePickerContainerViewController initWithPresentation:]([_UIDatePickerContainerViewController alloc], "initWithPresentation:", self);
    -[UIViewController presentationController](v7, "presentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContainerIgnoresDirectTouchEvents:", 1);

    -[UIViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", objc_msgSend(v6, "datePickerModalPresentationStyle"));
  }
  -[_UIDatePickerOverlayPresentation setContainerViewController:](self, "setContainerViewController:", v7);
  -[UIViewController presentingViewController](v7, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (-[_UIDatePickerOverlayPresentation isPresentingContainerViewController](self, "isPresentingContainerViewController"))
    {
      containerPresentCompletion = (void (**)(id, _QWORD, uint64_t))self->_containerPresentCompletion;
      if (containerPresentCompletion)
        containerPresentCompletion[2](containerPresentCompletion, 0, 1);
      v13 = _Block_copy(v4);
      v14 = self->_containerPresentCompletion;
      self->_containerPresentCompletion = v13;
    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
      v14 = self->_containerPresentCompletion;
      self->_containerPresentCompletion = 0;
    }

    goto LABEL_16;
  }
  objc_msgSend(v9, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isBeingDismissed");

    if ((v17 & 1) != 0)
      goto LABEL_12;
    objc_msgSend(v9, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissPresentationAnimated:", 1);

  }
LABEL_12:
  v19 = _Block_copy(v4);
  v20 = self->_containerPresentCompletion;
  self->_containerPresentCompletion = v19;

  if (!-[_UIDatePickerOverlayPresentation isPresentingContainerViewController](self, "isPresentingContainerViewController"))
  {
    -[_UIDatePickerOverlayPresentation setPresentingContainerViewController:](self, "setPresentingContainerViewController:", 1);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __81___UIDatePickerOverlayPresentation__prepareDatePickerPresentationWithCompletion___block_invoke;
    v21[3] = &unk_1E16B1B28;
    v21[4] = self;
    objc_msgSend(v9, "presentViewController:animated:completion:", v7, 0, v21);
  }
LABEL_16:

}

- (void)setAlignment:(int64_t)a3
{
  void *v4;

  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[_UIDatePickerOverlayPresentation platterView](self, "platterView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[_UIDatePickerOverlayPresentation _transitionToDatePicker:](self, "_transitionToDatePicker:", 0);
  }
}

- (void)setActiveMode:(int64_t)a3
{
  id v5;

  if (self->_activeMode != a3)
  {
    self->_activeMode = a3;
    -[_UIDatePickerOverlayPresentation delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_datePickerPresentation:didChangeActiveMode:", self, a3);

  }
}

- (void)setDefersAutomaticKeyboardAvoidanceAdjustments:(BOOL)a3
{
  id v3;

  if (self->_defersAutomaticKeyboardAvoidanceAdjustments != a3)
  {
    self->_defersAutomaticKeyboardAvoidanceAdjustments = a3;
    -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didChangeKeyboardAvoidanceAdjustmentDeferral");

  }
}

- (void)setAccessoryViewIgnoresDefaultInsets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_accessoryViewIgnoresDefaultInsets = a3;
  -[_UIDatePickerOverlayPresentation platterView](self, "platterView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessoryViewIgnoresDefaultInsets:", v3);

}

- (void)_presentNewDatePicker:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  _UIDatePickerOverlayPlatterView *v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGPoint origin;
  CGSize size;
  double Height;
  double v20;
  __int128 v21;
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
  void *v32;
  CGFloat width;
  CGFloat v34;
  CGFloat x;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  double v40;
  void *v41;
  uint64_t v42;
  _UIDatePickerOverlayPlatterView *v43;
  void *v44;
  _UIDatePickerOverlayPlatterView *v45;
  CGFloat y;
  CGFloat rect_8;
  double rect_16;
  double rect_24;
  double v50;
  _QWORD v51[4];
  _UIDatePickerOverlayPlatterView *v52;
  _QWORD v53[4];
  _UIDatePickerOverlayPlatterView *v54;
  id v55;
  _QWORD aBlock[4];
  _UIDatePickerOverlayPlatterView *v57;
  CGRect v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _OWORD v64[3];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  CGRect v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v4 = a3;
  -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0);

    -[_UIDatePickerOverlayPresentation setDismissHandler:](self, "setDismissHandler:", 0);
  }
  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_UIDatePickerOverlayPlatterView initWithDatePicker:accessoryView:]([_UIDatePickerOverlayPlatterView alloc], "initWithDatePicker:accessoryView:", v4, self->_accessoryView);
  -[_UIDatePickerOverlayPlatterView setAccessoryViewIgnoresDefaultInsets:](v9, "setAccessoryViewIgnoresDefaultInsets:", -[_UIDatePickerOverlayPresentation accessoryViewIgnoresDefaultInsets](self, "accessoryViewIgnoresDefaultInsets"));
  objc_msgSend(v8, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  objc_storeStrong((id *)&self->_platterView, v9);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  memset(&v70, 0, sizeof(v70));
  -[_UIDatePickerOverlayPresentation _computedLayoutForPlatterView:](self, "_computedLayoutForPlatterView:", v9);
  -[UIView setCenter:](v9, "setCenter:", v71);
  -[_UIDatePickerOverlayPlatterView setContentBounds:](v9, "setContentBounds:", *(_OWORD *)&v70.origin, *(_OWORD *)&v70.size);
  -[_UIDatePickerOverlayPresentation activeDatePicker](self, "activeDatePicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "overlayPlatterInitialScale");
  v14 = v13;
  CGAffineTransformMakeScale(&v69, v13, v13);
  v68 = v69;
  -[UIView setTransform:](v9, "setTransform:", &v68);
  objc_msgSend(v12, "overlayPlatterInitialHeight");
  v16 = v15;
  origin = v70.origin;
  size = v70.size;
  Height = CGRectGetHeight(v70);
  if (Height >= v16 / v14)
    v20 = v16 / v14;
  else
    v20 = Height;
  v76.origin = origin;
  v76.size = size;
  -[UIView setBounds:](v9, "setBounds:", 0.0, 0.0, CGRectGetWidth(v76), v20);
  -[UIView setCenter:](v9, "setCenter:", v71);
  -[UIView setAlpha:](v9, "setAlpha:", 0.0);
  v21 = v72;
  -[UIView layer](v9, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAnchorPoint:", v21);

  -[UIView layoutIfNeeded](v9, "layoutIfNeeded");
  v65 = v73;
  v66 = v74;
  v67 = v75;
  objc_msgSend(v8, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v65;
  v64[1] = v66;
  v64[2] = v67;
  objc_msgSend(v23, "setTransform:", v64);

  objc_msgSend(v8, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v8, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  y = v77.origin.y;
  width = v77.size.width;
  v34 = v77.size.height;
  x = v77.origin.x;
  rect_8 = v77.origin.x;
  MinY = CGRectGetMinY(v77);
  v78.origin.x = v25;
  v78.origin.y = v27;
  v78.size.width = v29;
  v78.size.height = v31;
  v50 = MinY - CGRectGetMinY(v78);
  v79.origin.x = x;
  v79.origin.y = y;
  v79.size.width = width;
  v79.size.height = v34;
  MinX = CGRectGetMinX(v79);
  v80.origin.x = v25;
  v80.origin.y = v27;
  v80.size.width = v29;
  v80.size.height = v31;
  rect_24 = MinX - CGRectGetMinX(v80);
  v81.origin.x = v25;
  v81.origin.y = v27;
  v81.size.width = v29;
  v81.size.height = v31;
  MaxY = CGRectGetMaxY(v81);
  v82.origin.x = rect_8;
  v82.origin.y = y;
  v82.size.width = width;
  v82.size.height = v34;
  rect_16 = MaxY - CGRectGetMaxY(v82);
  v83.origin.x = v25;
  v83.origin.y = v27;
  v83.size.width = v29;
  v83.size.height = v31;
  MaxX = CGRectGetMaxX(v83);
  v84.origin.x = rect_8;
  v84.origin.y = y;
  v84.size.width = width;
  v84.size.height = v34;
  v40 = MaxX - CGRectGetMaxX(v84);

  objc_msgSend(v8, "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setHitTestInsets:", -v50, -rect_24, -rect_16, -v40);

  v42 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke;
  aBlock[3] = &unk_1E16E9470;
  v43 = v9;
  v60 = v72;
  v61 = v73;
  v62 = v74;
  v63 = v75;
  v58 = v70;
  v57 = v43;
  v59 = v71;
  v44 = _Block_copy(aBlock);
  if (_AXSReduceMotionEnabled())
  {
    v53[0] = v42;
    v53[1] = 3221225472;
    v53[2] = __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_2;
    v53[3] = &unk_1E16B2F48;
    v55 = v44;
    v45 = v43;
    v54 = v45;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v53);
    v51[0] = v42;
    v51[1] = 3221225472;
    v51[2] = __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_3;
    v51[3] = &unk_1E16B1B28;
    v52 = v45;
    -[_UIDatePickerOverlayPresentation animateReducedMotionTransitionWithAnimations:completion:](self, "animateReducedMotionTransitionWithAnimations:completion:", v51, 0);

  }
  else
  {
    -[_UIDatePickerOverlayPresentation animatePresentWithAnimations:completion:](self, "animatePresentWithAnimations:completion:", v44, 0);
  }

}

- (void)_transitionToDatePicker:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD aBlock[6];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__227;
  v47 = __Block_byref_object_dispose__227;
  -[_UIDatePickerOverlayPresentation platterView](self, "platterView");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__227;
  v41[4] = __Block_byref_object_dispose__227;
  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v42 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v44[5], "prepareDatePickerTransitionWithDatePicker:", v4);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  -[_UIDatePickerOverlayPresentation _computedLayoutForPlatterView:](self, "_computedLayoutForPlatterView:", v44[5]);
  objc_msgSend((id)v44[5], "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend((id)v44[5], "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAnchorPoint:", 0.0, 0.0);

  objc_msgSend((id)v44[5], "setFrame:", v7, v9, v11, v13);
  objc_msgSend((id)v44[5], "setContentBounds:", (unsigned __int128)0, (unsigned __int128)0);
  -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_UIDatePickerOverlayPresentation dismissHandler](self, "dismissHandler");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v16[2](v16, 1);

  }
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke;
  aBlock[3] = &unk_1E16E9498;
  v31 = v38;
  v32 = v39;
  v33 = v40;
  v27 = v34;
  v28 = v35;
  v29 = v36;
  v30 = v37;
  aBlock[4] = v41;
  aBlock[5] = &v43;
  v18 = _Block_copy(aBlock);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_2;
  v25[3] = &unk_1E16E9448;
  v25[4] = &v43;
  v19 = _Block_copy(v25);
  if (_AXSReduceMotionEnabled())
  {
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_3;
    v24[3] = &unk_1E16B14C0;
    v24[4] = &v43;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_4;
    v20[3] = &unk_1E16E94C0;
    v20[4] = self;
    v21 = v18;
    v23 = &v43;
    v22 = v19;
    -[_UIDatePickerOverlayPresentation animateReducedMotionTransitionWithAnimations:completion:](self, "animateReducedMotionTransitionWithAnimations:completion:", v24, v20);

  }
  else
  {
    -[_UIDatePickerOverlayPresentation animateTransitionWithAnimations:completion:](self, "animateTransitionWithAnimations:completion:", v18, v19);
  }
  objc_storeStrong((id *)&self->_platterView, (id)v44[5]);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

}

- (void)retargetCurrentPresentationToSourceView
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  -[_UIDatePickerOverlayPresentation platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  -[_UIDatePickerOverlayPresentation _computedLayoutForPlatterView:](self, "_computedLayoutForPlatterView:", v3);
  objc_msgSend(v3, "setContentBounds:", v4, v5);
  objc_msgSend(v3, "setBounds:", v4, v5);
  objc_msgSend(v3, "setCenter:", v6);
  objc_msgSend(v3, "layoutIfNeeded");

}

- (_UIDatePickerOverlayPlatterLayout)_computedLayoutForPlatterView:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  _UIContextMenuLayoutArbiter *v9;
  void *v10;
  void *v11;
  _UIContextMenuLayoutArbiter *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UIPreviewParameters *v29;
  void *v30;
  UIView *v31;
  UIPreviewTarget *v32;
  id WeakRetained;
  UIPreviewTarget *v34;
  UITargetedPreview *v35;
  UITargetedPreview *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  double v77;
  double v78;
  double v79;
  __int128 v80;
  _UIDatePickerOverlayPlatterLayout *result;
  CGAffineTransform v82;
  CGRect v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  CGAffineTransform v90;
  CGAffineTransform v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  CGRect v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[6];
  CGRect v111;
  CGRect v112;

  v6 = a4;
  -[_UIDatePickerOverlayPresentation activeDatePicker](self, "activeDatePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [_UIContextMenuLayoutArbiter alloc];
  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_UIContextMenuLayoutArbiter initWithContainerView:layout:](v9, "initWithContainerView:layout:", v11, 1);

  v13 = (void *)objc_opt_new();
  -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertRect:toView:", v24, v15, v17, v19, v21);
  v26 = v25;
  v28 = v27;

  v29 = objc_alloc_init(UIPreviewParameters);
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v15, v17, v19, v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPreviewParameters setVisiblePath:](v29, "setVisiblePath:", v30);

  if (-[_UIDatePickerOverlayPresentation overlayAnchor](self, "overlayAnchor") == 2)
  {
    v31 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v15, v17, v19, v21);
    v32 = [UIPreviewTarget alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    v34 = -[UIPreviewTarget initWithContainer:center:](v32, "initWithContainer:center:", WeakRetained, v15 + v19 * 0.5, v17 + v21 * 0.5);

    v35 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", v31, v29, v34);
    objc_msgSend(v13, "setSourcePreview:", v35);

  }
  else
  {
    v36 = [UITargetedPreview alloc];
    v31 = (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
    v34 = -[UITargetedPreview initWithView:parameters:](v36, "initWithView:parameters:", v31, v29);
    objc_msgSend(v13, "setSourcePreview:", v34);
  }

  objc_msgSend(v13, "setShouldUpdateAttachment:", 1);
  objc_msgSend(v13, "setPreferredPreviewSize:", v26, v28);
  objc_msgSend(v6, "preferredPlatterSize");
  v38 = v37;
  v40 = v39;

  objc_msgSend(v13, "setPreferredMenuSize:", v38, v40);
  objc_msgSend(v8, "overlayPlatterDefaultSpacing");
  objc_msgSend(v13, "setPreferredContentSpacing:");
  v41 = -[_UIDatePickerOverlayPresentation _overlayAlignmentEdge](self, "_overlayAlignmentEdge");
  -[_UIDatePickerOverlayPresentation _layoutArbiterAnchorAlignmentOffset](self, "_layoutArbiterAnchorAlignmentOffset");
  v110[0] = 0x7FFFFFFFFFFFFFFFLL;
  v110[1] = v41;
  v110[2] = 0;
  v110[3] = v42;
  v110[4] = 1;
  objc_msgSend(v13, "setPreferredAnchor:", v110);
  -[_UIContextMenuLayoutArbiter computedLayoutWithInput:](v12, "computedLayoutWithInput:", v13);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    objc_msgSend(v43, "menu");
  }
  else
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    memset(&v103, 0, sizeof(v103));
  }
  _UIContextMenuItemFrameFromLayout(&v103);
  v46 = v45;
  v48 = v47;
  objc_msgSend(v13, "preferredMenuSize");
  -[_UIDatePickerOverlayPresentation _adjustedFrameForInputSize:outputFrame:](self, "_adjustedFrameForInputSize:outputFrame:");
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  if (v44)
  {
    objc_msgSend(v44, "anchor");
    v57 = *((_QWORD *)&v100 + 1);
    objc_msgSend(v44, "menu");
    v58 = *((double *)&v95 + 1);
    v59 = *(double *)&v96;
  }
  else
  {
    v57 = 0;
    v100 = 0u;
    v101 = 0u;
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v59 = 0.0;
    v58 = 0.0;
    v102 = 0;
  }
  -[_UIDatePickerOverlayPresentation _adjustedAnchorPointForFrame:alignment:anchorPoint:](self, "_adjustedAnchorPointForFrame:alignment:anchorPoint:", v57, v50, v52, v54, v56, v58, v59);
  v61 = v60;
  v63 = v62;
  objc_msgSend(v13, "preferredMenuSize");
  v65 = v46 / v64;
  objc_msgSend(v13, "preferredMenuSize");
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tx = 0u;
  retstr->var0.size.width = v54;
  retstr->var0.size.height = v56;
  v67 = fmin(v65, v48 / v66);
  retstr->var2.x = v61;
  retstr->var2.y = v63;
  -[_UIDatePickerOverlayPresentation _normalizedSourcePointForAnchorPoint:menuFrame:](self, "_normalizedSourcePointForAnchorPoint:menuFrame:", v61, v63, v50, v52, v54, v56);
  retstr->var1.x = v68;
  retstr->var1.y = v69;
  if (v67 >= 1.0)
  {
    v74 = MEMORY[0x1E0C9BAA8];
    v75 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->var3.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->var3.c = v75;
    v76 = *(_OWORD *)(v74 + 32);
  }
  else
  {
    memset(&v91, 0, sizeof(v91));
    CGAffineTransformMakeScale(&v91, v67, v67);
    v90 = v91;
    v111.origin.x = v50;
    v111.origin.y = v52;
    v111.size.width = v54;
    v111.size.height = v56;
    v112 = CGRectApplyAffineTransform(v111, &v90);
    v70 = v50 + (v54 - v112.size.width) * 0.5;
    v71 = v52 + (v56 - v112.size.height) * 0.5;
    objc_msgSend(v13, "setPreferredMenuSize:", v112.size.width);
    -[_UIContextMenuLayoutArbiter computedLayoutWithInput:](v12, "computedLayoutWithInput:", v13);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72)
    {
      objc_msgSend(v72, "menu");
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      memset(&v83, 0, sizeof(v83));
    }
    v77 = _UIContextMenuItemFrameFromLayout(&v83);
    v79 = v78;

    v82 = v91;
    CGAffineTransformTranslate(&v90, &v82, v77 - v70, v79 - v71);
    v80 = *(_OWORD *)&v90.c;
    v76 = *(_OWORD *)&v90.tx;
    v91 = v90;
    *(_OWORD *)&retstr->var3.a = *(_OWORD *)&v90.a;
    *(_OWORD *)&retstr->var3.c = v80;
  }
  *(_OWORD *)&retstr->var3.tx = v76;

  return result;
}

- (int64_t)_overlayAlignment
{
  int64_t v3;
  unsigned int *v4;
  unint64_t v5;

  v3 = 1;
  switch(-[_UIDatePickerOverlayPresentation alignment](self, "alignment"))
  {
    case 1:
      v3 = 0;
      break;
    case 2:
      v3 = 2;
      break;
    case 4:
      -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
      v4 = (unsigned int *)objc_claimAutoreleasedReturnValue();
      v5 = (unint64_t)v4[30] >> 18;
      goto LABEL_6;
    case 5:
      -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
      v4 = (unsigned int *)objc_claimAutoreleasedReturnValue();
      LODWORD(v5) = ~(v4[30] >> 18);
LABEL_6:
      v3 = v5 & 2;

      break;
    default:
      return v3;
  }
  return v3;
}

- (unint64_t)_overlayAlignmentEdge
{
  int64_t v2;
  unint64_t v3;

  v2 = -[_UIDatePickerOverlayPresentation _overlayAlignment](self, "_overlayAlignment");
  v3 = 2;
  if (v2 == 2)
    v3 = 8;
  if (v2 == 1)
    return 0;
  else
    return v3;
}

- (CGRect)_adjustedFrameForInputSize:(CGSize)a3 outputFrame:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double width;
  double height;
  CGRect result;

  v4 = (a3.width - a4.size.width) * 0.5;
  if (a4.size.width == a3.width)
  {
    v5 = 0.0;
  }
  else
  {
    a4.size.width = a3.width;
    v5 = v4;
  }
  v6 = a4.origin.x - v5;
  v7 = (a3.height - a4.size.height) * 0.5;
  if (a4.size.height == a3.height)
  {
    v8 = 0.0;
  }
  else
  {
    a4.size.height = a3.height;
    v8 = v7;
  }
  v9 = a4.origin.y - v8;
  width = a4.size.width;
  height = a4.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v9;
  result.origin.x = v6;
  return result;
}

- (double)_layoutArbiterAnchorAlignmentOffset
{
  void *v3;
  void *v4;
  int64_t v5;
  double v6;
  double MinX;
  double v8;
  double v9;
  void *v10;
  double v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double MidX;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  -[_UIDatePickerOverlayPresentation activeDatePicker](self, "activeDatePicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[_UIDatePickerOverlayPresentation _overlayAlignment](self, "_overlayAlignment");
  if (v5 == 2)
  {
    -[_UIDatePickerOverlayPresentation resolvedSourceBounds](self, "resolvedSourceBounds");
    MaxX = CGRectGetMaxX(v25);
    -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
    v13 = MaxX - CGRectGetMaxX(v26);
    objc_msgSend(v4, "overlayPlatterDefaultSpacing");
    v6 = v13 - v14;
    if (-[_UIDatePickerOverlayPresentation overlayAnchor](self, "overlayAnchor") == 1)
    {
      -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "layoutMargins");
      v6 = v6 - v15;
      goto LABEL_8;
    }
  }
  else
  {
    if (v5 == 1)
    {
      -[_UIDatePickerOverlayPresentation resolvedSourceBounds](self, "resolvedSourceBounds");
      MidX = CGRectGetMidX(v27);
      -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
      v6 = MidX - CGRectGetMidX(v28);
      goto LABEL_10;
    }
    v6 = 0.0;
    if (!v5)
    {
      -[_UIDatePickerOverlayPresentation resolvedSourceBounds](self, "resolvedSourceBounds");
      MinX = CGRectGetMinX(v23);
      -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
      v8 = MinX - CGRectGetMinX(v24);
      objc_msgSend(v4, "overlayPlatterDefaultSpacing");
      v6 = v8 + v9;
      if (-[_UIDatePickerOverlayPresentation overlayAnchor](self, "overlayAnchor") == 1)
      {
        -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layoutMargins");
        v6 = v6 + v11;
LABEL_8:

      }
    }
  }
LABEL_10:
  -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayScale");
  UIRoundToScale(v6, v19);
  v21 = v20;

  return v21;
}

- (CGPoint)_normalizedSourcePointForAnchorPoint:(CGPoint)a3 menuFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;
  CGRect v14;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a3.y;
  v7 = a4.origin.x + a4.size.width * 0.5;
  v8 = a4.origin.y + a4.size.height * 0.5;
  v9 = a3.x + -0.5;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = a4.size.width;
  v14.size.height = a4.size.height;
  v10 = v7 + v9 * CGRectGetWidth(v14);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = width;
  v15.size.height = height;
  v11 = v8 + (y + -0.5) * CGRectGetHeight(v15);
  v12 = v10;
  result.y = v11;
  result.x = v12;
  return result;
}

- (CGPoint)_adjustedAnchorPointForFrame:(CGRect)a3 alignment:(unint64_t)a4 anchorPoint:(CGPoint)a5
{
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat height;
  double width;
  CGPoint result;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  y = a5.y;
  x = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  v8 = a3.origin.y;
  v9 = a3.origin.x;
  -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
  v12 = v11;
  v14 = v13;
  -[_UIDatePickerOverlayPresentation resolvedSourceBounds](self, "resolvedSourceBounds");
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      v17 = v15;
      v18 = v16;
      v19 = v12 + v14 * 0.5;
      v20 = -[_UIDatePickerOverlayPresentation _overlayAlignment](self, "_overlayAlignment");
      switch(v20)
      {
        case 2:
          x = 1.0 - (v17 + v18 - v19) / width;
          break;
        case 1:
          x = (v19 - (v17 + v18 * 0.5)) / width + 0.5;
          break;
        case 0:
          x = (v19 - v17) / width;
          break;
      }
      break;
    case 2uLL:
    case 8uLL:
      -[_UIDatePickerOverlayPresentation containerViewController](self, "containerViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIDatePickerOverlayPresentation sourceView](self, "sourceView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerOverlayPresentation resolvedSourceRect](self, "resolvedSourceRect");
      objc_msgSend(v23, "convertPoint:toView:", v22, v25 + v24 * 0.5, v27 + v26 * 0.5);
      v29 = v28;
      v31 = v30;

      v39.origin.x = v9;
      v39.origin.y = v8;
      v39.size.width = width;
      v39.size.height = height;
      v32 = v29 - CGRectGetMinX(v39);
      v40.origin.x = v9;
      v40.origin.y = v8;
      v40.size.width = width;
      v40.size.height = height;
      x = v32 / CGRectGetWidth(v40);
      v41.origin.x = v9;
      v41.origin.y = v8;
      v41.size.width = width;
      v41.size.height = height;
      v33 = v31 - CGRectGetMinY(v41);
      v42.origin.x = v9;
      v42.origin.y = v8;
      v42.size.width = width;
      v42.size.height = height;
      y = v33 / CGRectGetHeight(v42);

      break;
    default:
      break;
  }
  v34 = fmax(fmin(x, 1.0), 0.0);
  v35 = fmax(fmin(y, 1.0), 0.0);
  result.y = v35;
  result.x = v34;
  return result;
}

- (void)animatePresentWithAnimations:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76___UIDatePickerOverlayPresentation_animatePresentWithAnimations_completion___block_invoke;
  v7[3] = &unk_1E16B1BF8;
  v8 = v5;
  v6 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v7, a4, 0.8, 0.32, 0.0, 0.0, 0.0, 0.0);

}

- (void)animateTransitionWithAnimations:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79___UIDatePickerOverlayPresentation_animateTransitionWithAnimations_completion___block_invoke;
  v7[3] = &unk_1E16B1BF8;
  v8 = v5;
  v6 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v7, a4, 1.0, 0.25, 0.0, 0.0, 0.0, 0.0);

}

- (void)animateDismissalWithAnimations:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78___UIDatePickerOverlayPresentation_animateDismissalWithAnimations_completion___block_invoke;
  v7[3] = &unk_1E16B1BF8;
  v8 = v5;
  v6 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v7, a4, 0.85, 0.35, 0.0, 0.0, 0.0, 0.0);

}

- (void)animateReducedMotionTransitionWithAnimations:(id)a3 completion:(id)a4
{
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 6, a3, a4, 0.3, 0.0);
}

- (int64_t)activeMode
{
  return self->_activeMode;
}

- (UIDatePicker)activeDatePicker
{
  return (UIDatePicker *)objc_loadWeakRetained((id *)&self->_activeDatePicker);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (BOOL)defersAutomaticKeyboardAvoidanceAdjustments
{
  return self->_defersAutomaticKeyboardAvoidanceAdjustments;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (int64_t)overlayAnchor
{
  return self->_overlayAnchor;
}

- (void)setOverlayAnchor:(int64_t)a3
{
  self->_overlayAnchor = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (BOOL)accessoryViewIgnoresDefaultInsets
{
  return self->_accessoryViewIgnoresDefaultInsets;
}

- (_UIDatePickerContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (BOOL)isPresentingContainerViewController
{
  return self->_presentingContainerViewController;
}

- (void)setPresentingContainerViewController:(BOOL)a3
{
  self->_presentingContainerViewController = a3;
}

- (_UIDatePickerOverlayPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (_UIDatePickerOverlayPresentationDelegate)delegate
{
  return (_UIDatePickerOverlayPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)ignoresPassthroughOnSourceView
{
  return self->_ignoresPassthroughOnSourceView;
}

- (void)setIgnoresPassthroughOnSourceView:(BOOL)a3
{
  self->_ignoresPassthroughOnSourceView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_activeDatePicker);
  objc_storeStrong(&self->_containerPresentCompletion, 0);
}

@end
