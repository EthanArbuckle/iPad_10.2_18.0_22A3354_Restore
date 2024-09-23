@implementation UIInputLayoutHostingItem

- (UIInputLayoutHostingItem)initWithContainer:(id)a3
{
  id v4;
  UIInputLayoutHostingItem *v5;
  UIInputLayoutHostingItem *v6;
  uint64_t v7;
  UIView *containerView;
  UILayoutGuide *v9;
  UILayoutGuide *belowInputLayoutGuide;
  UILayoutGuide *v11;
  UILayoutGuide *inputViewLayoutGuide;
  UILayoutGuide *v13;
  UILayoutGuide *assistantLayoutGuide;
  UILayoutGuide *v15;
  UILayoutGuide *accessoryLayoutGuide;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIInputLayoutHostingItem;
  v5 = -[UIInputWindowControllerHostingItem initWithContainer:](&v18, sel_initWithContainer_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIInputWindowControllerHostingItem hostView](v5, "hostView");
    v7 = objc_claimAutoreleasedReturnValue();
    containerView = v6->_containerView;
    v6->_containerView = (UIView *)v7;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeWeak((id *)&v6->_hosting, v4);
    v9 = objc_alloc_init(UILayoutGuide);
    belowInputLayoutGuide = v6->_belowInputLayoutGuide;
    v6->_belowInputLayoutGuide = v9;

    -[UILayoutGuide setIdentifier:](v6->_belowInputLayoutGuide, "setIdentifier:", CFSTR("belowInputLayoutGuide"));
    v11 = objc_alloc_init(UILayoutGuide);
    inputViewLayoutGuide = v6->_inputViewLayoutGuide;
    v6->_inputViewLayoutGuide = v11;

    -[UILayoutGuide setIdentifier:](v6->_inputViewLayoutGuide, "setIdentifier:", CFSTR("inputViewLayoutGuide"));
    v13 = objc_alloc_init(UILayoutGuide);
    assistantLayoutGuide = v6->_assistantLayoutGuide;
    v6->_assistantLayoutGuide = v13;

    -[UILayoutGuide setIdentifier:](v6->_assistantLayoutGuide, "setIdentifier:", CFSTR("assistantLayoutGuide"));
    v15 = objc_alloc_init(UILayoutGuide);
    accessoryLayoutGuide = v6->_accessoryLayoutGuide;
    v6->_accessoryLayoutGuide = v15;

    -[UILayoutGuide setIdentifier:](v6->_accessoryLayoutGuide, "setIdentifier:", CFSTR("accessoryLayoutGuide"));
  }

  return v6;
}

- (UIInputLayoutHostingItem)initWithInputViewSet:(id)a3 container:(id)a4
{
  id v6;
  id v7;
  UIInputLayoutHostingItem *v8;
  UIInputLayoutHostingItem *v9;
  uint64_t v10;
  UIView *containerView;
  UILayoutGuide *v12;
  UILayoutGuide *belowInputLayoutGuide;
  UILayoutGuide *v14;
  UILayoutGuide *inputViewLayoutGuide;
  UILayoutGuide *v16;
  UILayoutGuide *assistantLayoutGuide;
  UILayoutGuide *v18;
  UILayoutGuide *accessoryLayoutGuide;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIInputLayoutHostingItem;
  v8 = -[UIInputWindowControllerHostingItem initWithContainer:](&v21, sel_initWithContainer_, v7);
  v9 = v8;
  if (v8)
  {
    -[UIInputWindowControllerHostingItem hostView](v8, "hostView");
    v10 = objc_claimAutoreleasedReturnValue();
    containerView = v9->_containerView;
    v9->_containerView = (UIView *)v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_storeWeak((id *)&v9->_hosting, v7);
    v12 = objc_alloc_init(UILayoutGuide);
    belowInputLayoutGuide = v9->_belowInputLayoutGuide;
    v9->_belowInputLayoutGuide = v12;

    -[UILayoutGuide setIdentifier:](v9->_belowInputLayoutGuide, "setIdentifier:", CFSTR("belowInputLayoutGuide"));
    v14 = objc_alloc_init(UILayoutGuide);
    inputViewLayoutGuide = v9->_inputViewLayoutGuide;
    v9->_inputViewLayoutGuide = v14;

    -[UILayoutGuide setIdentifier:](v9->_inputViewLayoutGuide, "setIdentifier:", CFSTR("inputViewLayoutGuide"));
    v16 = objc_alloc_init(UILayoutGuide);
    assistantLayoutGuide = v9->_assistantLayoutGuide;
    v9->_assistantLayoutGuide = v16;

    -[UILayoutGuide setIdentifier:](v9->_assistantLayoutGuide, "setIdentifier:", CFSTR("assistantLayoutGuide"));
    v18 = objc_alloc_init(UILayoutGuide);
    accessoryLayoutGuide = v9->_accessoryLayoutGuide;
    v9->_accessoryLayoutGuide = v18;

    -[UILayoutGuide setIdentifier:](v9->_accessoryLayoutGuide, "setIdentifier:", CFSTR("accessoryLayoutGuide"));
    -[UIInputLayoutHostingItem updateInputViewSet:](v9, "updateInputViewSet:", v6);
  }

  return v9;
}

- (void)updateInputViewSet:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIPinchGestureRecognizer *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  id v38;

  v38 = a3;
  -[UIInputLayoutHostingItem constrainGuidesIfNeeded](self, "constrainGuidesIfNeeded");
  -[UIInputLayoutHostingItem createPlatterBackdropView](self, "createPlatterBackdropView");
  v4 = v38;
  if (v38)
  {
    v5 = objc_msgSend(v38, "isEmpty");
    v4 = v38;
    if ((v5 & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E0D156E0];
      -[UIInputLayoutHostingItem inputSetConstraints](self, "inputSetConstraints");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deactivateConstraints:", v7);

      -[UIInputLayoutHostingItem setInputViewSet:](self, "setInputViewSet:", v38);
      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem pinchGesture](self, "pinchGesture");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeGestureRecognizer:", v9);

      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

      -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeFromSuperview");

      -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeFromSuperview");

      objc_msgSend(v38, "inputView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem setInputLayoutView:](self, "setInputLayoutView:", v13);

      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("inputLayoutView"));

      objc_msgSend(v38, "inputAssistantView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem setInputLayoutAssistantView:](self, "setInputLayoutAssistantView:", v16);

      -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("inputLayoutAssistantView"));

      objc_msgSend(v38, "inputAccessoryView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem setInputLayoutAccessoryView:](self, "setInputLayoutAccessoryView:", v19);

      -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("inputLayoutAccessoryView"));

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addSubview:", v25);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addSubview:", v27);

      -[UIInputLayoutHostingItem pinchGesture](self, "pinchGesture");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v29 = -[UIGestureRecognizer initWithTarget:action:]([UIPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel_trackPinch_);
        -[UIInputLayoutHostingItem setPinchGesture:](self, "setPinchGesture:", v29);

      }
      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem pinchGesture](self, "pinchGesture");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addGestureRecognizer:", v31);

      if (objc_msgSend(v38, "isInputViewPlaceholder"))
      {
        -[UIInputLayoutHostingItem hideBackdrop:](self, "hideBackdrop:", 1);
      }
      else
      {
        -[UIInputLayoutHostingItem hideBackdrop:](self, "hideBackdrop:", 0);
        objc_msgSend(v38, "inputViewController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "traitCollection");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "userInterfaceIdiom") == 1)
        {
          objc_msgSend(v38, "inputViewController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "traitCollection");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "horizontalSizeClass") != 1;

        }
        else
        {
          v36 = 1;
        }

        -[UIInputLayoutHostingItem pillView](self, "pillView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setHidden:", v36);

      }
      -[UIInputLayoutHostingItem constrainViewsToGuidesIfNeeded](self, "constrainViewsToGuidesIfNeeded");
      v4 = v38;
    }
  }

}

- (void)hideBackdrop:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", v3);

  }
  -[UIInputLayoutHostingItem platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v3);

  }
}

- (void)changeOnScreen:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void (**v8)(void *, uint64_t);
  void (**v9)(void *, uint64_t);
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v16[4];
  void (**v17)(void *, uint64_t);
  _QWORD v18[4];
  void (**v19)(void *, uint64_t);
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke;
  aBlock[3] = &unk_1E16B3FD8;
  aBlock[4] = self;
  v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (-[UIInputLayoutHostingItem isOnScreen](self, "isOnScreen") || !v5)
  {
    if (!-[UIInputLayoutHostingItem isOnScreen](self, "isOnScreen") || v5)
    {
      if (-[UIInputLayoutHostingItem isOnScreen](self, "isOnScreen")
        || -[UIInputLayoutHostingItem isFloating](self, "isFloating"))
      {
        -[UIInputLayoutHostingItem onscreenConstraints](self, "onscreenConstraints");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isActive");

        if ((v12 & 1) != 0)
          goto LABEL_16;
LABEL_13:
        v8[2](v8, 1);
        goto LABEL_16;
      }
      -[UIInputLayoutHostingItem offscreenConstraints](self, "offscreenConstraints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isActive");

      if ((v15 & 1) != 0)
        goto LABEL_16;
    }
    else if (v4)
    {
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_4;
      v16[3] = &unk_1E16B1BF8;
      v17 = v8;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 458752, v16, &__block_literal_global_20_7, 0.25, 0.0);
      v9 = v17;
      goto LABEL_9;
    }
    v8[2](v8, 0);
    goto LABEL_16;
  }
  if (!v4)
    goto LABEL_13;
  v18[0] = v7;
  v18[1] = 3221225472;
  v18[2] = __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_2;
  v18[3] = &unk_1E16B1BF8;
  v19 = v8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 458752, v18, &__block_literal_global_631, 0.25, 0.0);
  v9 = v19;
LABEL_9:

LABEL_16:
  -[UIInputLayoutHostingItem setIsOnScreen:](self, "setIsOnScreen:", v5);

}

uint64_t __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D156E0];
  v4 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v4, "offscreenConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateConstraints:", v5);

    v6 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(*(id *)(a1 + 32), "onscreenConstraints");
  }
  else
  {
    objc_msgSend(v4, "onscreenConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivateConstraints:", v7);

    v6 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(*(id *)(a1 + 32), "offscreenConstraints");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v8);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "layoutIfNeeded");
}

uint64_t __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__UIInputLayoutHostingItem_changeOnScreen_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGRect)visibleFrame
{
  UIView *inputLayoutView;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  inputLayoutView = self->_inputLayoutView;
  if (inputLayoutView)
  {
    -[UIView bounds](inputLayoutView, "bounds");
  }
  else
  {
    v3 = 0.0;
    v6 = 280.0;
    v5 = 320.0;
    v4 = 0.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)inputView
{
  return self->_inputLayoutView;
}

- (id)inputAssistantView
{
  return self->_inputLayoutAssistantView;
}

- (id)inputAccessoryView
{
  return self->_inputLayoutAccessoryView;
}

- (void)updateVisibilityConstraintsForPlacement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[UIInputLayoutHostingItem inputViewSet](self, "inputViewSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[UIInputWindowControllerHostingItem owner](self, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputViewSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem updateInputViewSet:](self, "updateInputViewSet:", v6);

  }
  if (objc_msgSend(v8, "isVisible") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!objc_msgSend(v8, "isVisible"))
      goto LABEL_7;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  -[UIInputLayoutHostingItem changeOnScreen:animated:](self, "changeOnScreen:animated:", v7, 1);
LABEL_7:

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)constrainGuidesIfNeeded
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  _QWORD v140[3];
  void *v141;
  _QWORD v142[2];
  _QWORD v143[3];
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[6];

  v146[4] = *MEMORY[0x1E0C80C00];
  -[UIInputLayoutHostingItem bottomConstraint](self, "bottomConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v8);

    }
    v107 = (void *)MEMORY[0x1E0D156E0];
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "topAnchor");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "topAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "constraintEqualToAnchor:", v126);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v146[0] = v122;
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "leadingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "constraintEqualToAnchor:", v108);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v146[1] = v106;
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v146[2] = v11;
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v146[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "activateConstraints:", v17);

    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "owningView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addLayoutGuide:", v21);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addLayoutGuide:", v23);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addLayoutGuide:", v25);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem accessoryLayoutGuide](self, "accessoryLayoutGuide");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addLayoutGuide:", v27);

    }
    v139 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIInputLayoutHostingItem accessoryLayoutGuide](self, "accessoryLayoutGuide");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "leadingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "leadingAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "constraintEqualToAnchor:", v123);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v145[0] = v119;
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "topAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem accessoryLayoutGuide](self, "accessoryLayoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v145[1] = v30;
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem accessoryLayoutGuide](self, "accessoryLayoutGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v145[2] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "addObjectsFromArray:", v36);

    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "topAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "bottomAnchor");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "constraintEqualToAnchor:", v124);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v120;
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "leadingAnchor");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v39;
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v144[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "addObjectsFromArray:", v45);

    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "safeAreaLayoutGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v50);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v51) = 1144750080;
    objc_msgSend(v137, "setPriority:", v51);
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "topAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "bottomAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "constraintEqualToAnchor:", v121);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v143[0] = v117;
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "leadingAnchor");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v143[1] = v54;
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v143[2] = v59;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 3);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "addObjectsFromArray:", v60);

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64, 0.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setBottomConstraint:](self, "setBottomConstraint:", v65);

    -[UIInputLayoutHostingItem bottomConstraint](self, "bottomConstraint");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setIdentifier:", CFSTR("inputViewLayoutGuide.bottomAnchor"));

    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v70, 0.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setLeftConstraint:](self, "setLeftConstraint:", v71);

    -[UIInputLayoutHostingItem leftConstraint](self, "leftConstraint");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setIdentifier:", CFSTR("inputViewLayoutGuide.leadingAnchor"));

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setRightConstraint:](self, "setRightConstraint:", v77);

    -[UIInputLayoutHostingItem rightConstraint](self, "rightConstraint");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setIdentifier:", CFSTR("inputViewLayoutGuide.trailingAnchor"));

    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "widthAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bounds");
    objc_msgSend(v80, "constraintEqualToConstant:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setKeyplaneWidthConstraint:](self, "setKeyplaneWidthConstraint:", v83);

    -[UIInputLayoutHostingItem keyplaneWidthConstraint](self, "keyplaneWidthConstraint");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setIdentifier:", CFSTR("inputViewLayoutGuide.widthAnchor"));

    -[UIInputLayoutHostingItem leftConstraint](self, "leftConstraint");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v85;
    -[UIInputLayoutHostingItem rightConstraint](self, "rightConstraint");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v86;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 2);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "addObjectsFromArray:", v87);

    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "topAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "bottomAnchor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v92;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v141, 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setOffscreenConstraints:](self, "setOffscreenConstraints:", v93);

    -[UIInputWindowControllerHostingItem ownerView](self, "ownerView");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "safeAreaLayoutGuide");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "bottomAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintGreaterThanOrEqualToAnchor:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = v99;
    v140[1] = v137;
    -[UIInputLayoutHostingItem bottomConstraint](self, "bottomConstraint");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v140[2] = v100;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v140, 3);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setOnscreenConstraints:](self, "setOnscreenConstraints:", v101);

    v102 = (void *)MEMORY[0x1E0D156E0];
    -[UIInputLayoutHostingItem offscreenConstraints](self, "offscreenConstraints");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "activateConstraints:", v103);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v139);
    -[UIInputLayoutHostingItem setGuideConstraints:](self, "setGuideConstraints:", v139);

  }
}

- (void)constrainViewsToGuidesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", v11);

      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v13);

    }
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIInputLayoutHostingItem inputLayoutView](self, "inputLayoutView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem constraintsForView:embeddedInGuide:](self, "constraintsForView:embeddedInGuide:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObjectsFromArray:", v16);

    -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[UIInputLayoutHostingItem inputLayoutAssistantView](self, "inputLayoutAssistantView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem constraintsForView:embeddedInGuide:](self, "constraintsForView:embeddedInGuide:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObjectsFromArray:", v20);

      -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "heightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToConstant:", 55.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v23);

    }
    -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[UIInputLayoutHostingItem inputLayoutAccessoryView](self, "inputLayoutAccessoryView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem accessoryLayoutGuide](self, "accessoryLayoutGuide");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem constraintsForView:embeddedInGuide:](self, "constraintsForView:embeddedInGuide:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObjectsFromArray:", v27);

    }
    -[UIInputWindowControllerHostingItem dockView](self, "dockView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[UIInputLayoutHostingItem containerView](self, "containerView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputWindowControllerHostingItem dockView](self, "dockView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "addSubview:", v30);

      -[UIInputWindowControllerHostingItem dockView](self, "dockView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem constraintsForView:embeddedInGuide:](self, "constraintsForView:embeddedInGuide:", v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObjectsFromArray:", v33);

    }
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v35);
    -[UIInputLayoutHostingItem setInputSetConstraints:](self, "setInputSetConstraints:", v35);
    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layoutIfNeeded");

  }
}

- (void)trackPinch:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    _MergedGlobals_5_16 = v6;

    qword_1ECD7AC18 = 0x4079000000000000;
    -[UIInputLayoutHostingItem keyplaneWidthConstraint](self, "keyplaneWidthConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "widthAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToConstant:", *(double *)&_MergedGlobals_5_16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputLayoutHostingItem setKeyplaneWidthConstraint:](self, "setKeyplaneWidthConstraint:", v10);

    }
    v11 = *(double *)&_MergedGlobals_5_16;
    -[UIInputLayoutHostingItem keyplaneWidthConstraint](self, "keyplaneWidthConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v11);

    -[UIInputLayoutHostingItem keyplaneWidthConstraint](self, "keyplaneWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 1);

    -[UIInputLayoutHostingItem rightConstraint](self, "rightConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 0);

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintGreaterThanOrEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem setRightConstraint:](self, "setRightConstraint:", v19);

    -[UIInputLayoutHostingItem rightConstraint](self, "rightConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIdentifier:", CFSTR("inputViewLayoutGuide.trailingAnchor"));

    -[UIInputLayoutHostingItem rightConstraint](self, "rightConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);
LABEL_15:

    goto LABEL_16;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    v22 = *(double *)&_MergedGlobals_5_16 - *(double *)&qword_1ECD7AC18;
    objc_msgSend(v4, "scale");
    v24 = v22 * v23 + *(double *)&qword_1ECD7AC18;
    if (v24 <= *(double *)&_MergedGlobals_5_16)
      v25 = v24;
    else
      v25 = *(double *)&_MergedGlobals_5_16;
    -[UIInputLayoutHostingItem keyplaneWidthConstraint](self, "keyplaneWidthConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConstant:", v25);

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v27);
    v29 = v28;
    v31 = v30;

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    v34 = v33 - v31;
    -[UIInputLayoutHostingItem bottomConstraint](self, "bottomConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setConstant:", v34);

    v36 = v29 + v25 * -0.5;
    if (v25 + v36 > *(double *)&_MergedGlobals_5_16)
      v36 = *(double *)&_MergedGlobals_5_16 - v25;
    if (v36 >= 0.0)
      v37 = v36;
    else
      v37 = 0.0;
    -[UIInputLayoutHostingItem leftConstraint](self, "leftConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setConstant:", v37);
    goto LABEL_15;
  }
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "scale");
    if (v38 <= 1.0)
    {
      objc_msgSend(v4, "scale");
      if (v39 < 1.0)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __39__UIInputLayoutHostingItem_trackPinch___block_invoke_2;
        v40[3] = &unk_1E16B1B50;
        v40[4] = self;
        v41 = v4;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 458752, v40, 0, 0.2, 0.0);

      }
    }
    else
    {
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __39__UIInputLayoutHostingItem_trackPinch___block_invoke;
      v42[3] = &unk_1E16B1B28;
      v42[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 458752, v42, 0, 0.2, 0.0);
    }
  }
LABEL_16:

}

void __39__UIInputLayoutHostingItem_trackPinch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "bottomConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "leftConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "keyplaneWidthConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  objc_msgSend(*(id *)(a1 + 32), "rightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputViewLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setRightConstraint:", v10);

  objc_msgSend(*(id *)(a1 + 32), "rightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutIfNeeded");

}

void __39__UIInputLayoutHostingItem_trackPinch___block_invoke_2(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;

  v2 = *(double *)&qword_1ECD7AC18;
  objc_msgSend(*(id *)(a1 + 32), "keyplaneWidthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11 - v9;
  objc_msgSend(*(id *)(a1 + 32), "bottomConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v12);

  v14 = v7 + *(double *)&qword_1ECD7AC18 * -0.5;
  if (*(double *)&qword_1ECD7AC18 + v14 > *(double *)&_MergedGlobals_5_16)
    v14 = *(double *)&_MergedGlobals_5_16 - *(double *)&qword_1ECD7AC18;
  if (v14 >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "leftConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v15);

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutIfNeeded");

}

- (void)createBackdropView
{
  void *v3;
  UIKBInputBackdropView *v4;
  UIKBInputBackdropView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = [UIKBInputBackdropView alloc];
    v5 = -[UIKBInputBackdropView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIInputLayoutHostingItem setStandardBackgroundView:](self, "setStandardBackgroundView:", v5);

    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setRenderConfig:", v8);

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSubview:atIndex:", v10, 0);

    -[UIInputLayoutHostingItem bottomConstraint](self, "bottomConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[UIInputLayoutHostingItem constrainGuidesIfNeeded](self, "constrainGuidesIfNeeded");
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 0.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v28;
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v23;
    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v13, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v14;
    -[UIInputLayoutHostingItem standardBackgroundView](self, "standardBackgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObjectsFromArray:", v20);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v33);
  }
}

- (void)createPlatterBackdropView
{
  void *v3;
  id v4;
  UIView *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  UIView *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _UIPopoverStandardChromeView *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _UIPopoverStandardChromeView *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  UIKBVisualEffectView *v48;
  void *v49;
  UIView *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _UIPopoverStandardChromeView *v108;
  UIKBVisualEffectView *v109;
  UIView *v110;
  void *v111;
  _QWORD v112[4];
  _QWORD v113[6];

  v113[4] = *MEMORY[0x1E0C80C00];
  -[UIInputLayoutHostingItem platterView](self, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(UIView);
    -[UIInputLayoutHostingItem setPlatterView:](self, "setPlatterView:", v5);

    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    +[UIKeyboardPopoverContainer shadowOffset](UIKeyboardPopoverContainer, "shadowOffset");
    v8 = v7;
    v10 = v9;
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowOffset:", v8, v10);

    +[UIKeyboardPopoverContainer shadowColor](UIKeyboardPopoverContainer, "shadowColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = objc_msgSend(v13, "CGColor");
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShadowColor:", v14);

    +[UIKeyboardPopoverContainer shadowOpacity](UIKeyboardPopoverContainer, "shadowOpacity");
    *(float *)&v8 = v17;
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = LODWORD(v8);
    objc_msgSend(v19, "setShadowOpacity:", v20);

    +[UIKeyboardPopoverContainer shadowRadius](UIKeyboardPopoverContainer, "shadowRadius");
    v22 = v21;
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShadowRadius:", v22);

    v25 = objc_alloc_init(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView layer](v25, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 1);

    +[UIKeyboardPopoverContainer cornerRadius](UIKeyboardPopoverContainer, "cornerRadius");
    v28 = v27;
    -[UIView layer](v25, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", v28);

    +[UIKeyboardPopoverContainer borderColor](UIKeyboardPopoverContainer, "borderColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = objc_msgSend(v30, "CGColor");
    -[UIView layer](v25, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setBorderColor:", v31);

    +[UIKeyboardPopoverContainer borderWidth](UIKeyboardPopoverContainer, "borderWidth");
    v34 = v33;
    -[UIView layer](v25, "layer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBorderWidth:", v34);

    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v25);

    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem constraintsForView:embeddedInView:insets:](self, "constraintsForView:embeddedInView:insets:", v25, v37, 0.0, 0.0, 0.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v38);

    v39 = [_UIPopoverStandardChromeView alloc];
    v40 = *MEMORY[0x1E0C9D648];
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v44 = -[_UIPopoverStandardChromeView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x1E0C9D648], v41, v42, v43);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIPopoverStandardChromeView setBackgroundStyle:](v44, "setBackgroundStyle:", 6);
    -[_UIPopoverStandardChromeView setArrowDirection:](v44, "setArrowDirection:", 0);
    -[UIView setAlpha:](v44, "setAlpha:", 1.0);
    -[UIView addSubview:](v25, "addSubview:", v44);
    v108 = v44;
    -[UIInputLayoutHostingItem constraintsForView:embeddedInView:insets:](self, "constraintsForView:embeddedInView:insets:", v44, v25, 0.0, 0.0, 0.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v4;
    objc_msgSend(v4, "addObjectsFromArray:", v45);

    +[UIKBRenderConfig defaultConfig](UIKBRenderConfig, "defaultConfig");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "backdropStyle");

    v48 = -[UIKBBackdropView initWithFrame:style:]([UIKBVisualEffectView alloc], "initWithFrame:style:", v47, v40, v41, v42, v43);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v110 = v25;
    -[UIView addSubview:](v25, "addSubview:", v48);
    -[UIInputLayoutHostingItem constraintsForView:embeddedInView:insets:](self, "constraintsForView:embeddedInView:insets:", v48, v25, 0.0, 0.0, 0.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v49);

    v50 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v40, v41, v42, v43);
    -[UIInputLayoutHostingItem setPillView:](self, "setPillView:", v50);

    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    +[UIKeyboardPopoverContainer pillColor](UIKeyboardPopoverContainer, "pillColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setBackgroundColor:", v52);

    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAlpha:", 1.0);

    +[UIKeyboardPopoverContainer pillCornerRadius](UIKeyboardPopoverContainer, "pillCornerRadius");
    v56 = v55;
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "layer");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setCornerRadius:", v56);

    -[UIVisualEffectView contentView](v48, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addSubview:", v60);

    +[UIKeyboardPopoverContainer pillSize](UIKeyboardPopoverContainer, "pillSize");
    v62 = v61;
    v64 = v63;
    v109 = v48;
    -[UIView bottomAnchor](v48, "bottomAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "bottomAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardPopoverContainer pillDistanceToEdge](UIKeyboardPopoverContainer, "pillDistanceToEdge");
    objc_msgSend(v104, "constraintEqualToAnchor:constant:", v102);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v100;
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "centerXAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v48, "centerXAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = v66;
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "widthAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToConstant:", v62);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v113[2] = v69;
    -[UIInputLayoutHostingItem pillView](self, "pillView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "heightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToConstant:", v64);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v113[3] = v72;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v113, 4);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObjectsFromArray:", v73);

    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setAllowsGroupBlending:", 0);

    -[UIView layer](v110, "layer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setAllowsGroupBlending:", 0);

    -[UIView layer](v109, "layer");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setAllowsGroupBlending:", 0);

    -[UIInputLayoutHostingItem containerView](self, "containerView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "addSubview:", v79);

    -[UIInputLayoutHostingItem bottomConstraint](self, "bottomConstraint");
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
      -[UIInputLayoutHostingItem constrainGuidesIfNeeded](self, "constrainGuidesIfNeeded");
    -[UIInputLayoutHostingItem assistantLayoutGuide](self, "assistantLayoutGuide");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "topAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "topAnchor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:constant:", v101, 0.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v99;
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "leadingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v93, 0.0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v92;
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem belowInputLayoutGuide](self, "belowInputLayoutGuide");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bottomAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:constant:", v82, 0.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v112[2] = v83;
    -[UIInputLayoutHostingItem platterView](self, "platterView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputLayoutHostingItem inputViewLayoutGuide](self, "inputViewLayoutGuide");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v87, 0.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v112[3] = v88;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 4);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "addObjectsFromArray:", v89);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v111);
  }
}

- (id)constraintsForView:(id)a3 embeddedInView:(id)a4 insets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v26[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v11, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v24, top);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v23;
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, left);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v14;
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, bottom);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v17;
  objc_msgSend(v10, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, right);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)constraintsForView:(id)a3 embeddedInGuide:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(v6, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  objc_msgSend(v6, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (UILayoutGuide)belowInputLayoutGuide
{
  return self->_belowInputLayoutGuide;
}

- (void)setBelowInputLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_belowInputLayoutGuide, a3);
}

- (UILayoutGuide)inputViewLayoutGuide
{
  return self->_inputViewLayoutGuide;
}

- (void)setInputViewLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewLayoutGuide, a3);
}

- (UILayoutGuide)assistantLayoutGuide
{
  return self->_assistantLayoutGuide;
}

- (void)setAssistantLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_assistantLayoutGuide, a3);
}

- (UILayoutGuide)accessoryLayoutGuide
{
  return self->_accessoryLayoutGuide;
}

- (void)setAccessoryLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryLayoutGuide, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)leftConstraint
{
  return self->_leftConstraint;
}

- (void)setLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftConstraint, a3);
}

- (NSLayoutConstraint)rightConstraint
{
  return self->_rightConstraint;
}

- (void)setRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightConstraint, a3);
}

- (NSLayoutConstraint)keyplaneWidthConstraint
{
  return self->_keyplaneWidthConstraint;
}

- (void)setKeyplaneWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_keyplaneWidthConstraint, a3);
}

- (NSArray)onscreenConstraints
{
  return self->_onscreenConstraints;
}

- (void)setOnscreenConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_onscreenConstraints, a3);
}

- (NSArray)offscreenConstraints
{
  return self->_offscreenConstraints;
}

- (void)setOffscreenConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_offscreenConstraints, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)inputLayoutView
{
  return self->_inputLayoutView;
}

- (void)setInputLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_inputLayoutView, a3);
}

- (UIView)inputLayoutAssistantView
{
  return self->_inputLayoutAssistantView;
}

- (void)setInputLayoutAssistantView:(id)a3
{
  objc_storeStrong((id *)&self->_inputLayoutAssistantView, a3);
}

- (UIView)inputLayoutAccessoryView
{
  return self->_inputLayoutAccessoryView;
}

- (void)setInputLayoutAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputLayoutAccessoryView, a3);
}

- (UIInputViewSet)inputViewSet
{
  return self->_inputViewSet;
}

- (void)setInputViewSet:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewSet, a3);
}

- (NSArray)guideConstraints
{
  return self->_guideConstraints;
}

- (void)setGuideConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_guideConstraints, a3);
}

- (NSArray)inputSetConstraints
{
  return self->_inputSetConstraints;
}

- (void)setInputSetConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_inputSetConstraints, a3);
}

- (UIInputWindowControllerHosting)hosting
{
  return (UIInputWindowControllerHosting *)objc_loadWeakRetained((id *)&self->_hosting);
}

- (void)setHosting:(id)a3
{
  objc_storeWeak((id *)&self->_hosting, a3);
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (void)setIsOnScreen:(BOOL)a3
{
  self->_isOnScreen = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (UIKBInputBackdropView)standardBackgroundView
{
  return self->_standardBackgroundView;
}

- (void)setStandardBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_standardBackgroundView, a3);
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UIView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (void)setPinchGesture:(id)a3
{
  objc_storeStrong((id *)&self->_pinchGesture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_standardBackgroundView, 0);
  objc_destroyWeak((id *)&self->_hosting);
  objc_storeStrong((id *)&self->_inputSetConstraints, 0);
  objc_storeStrong((id *)&self->_guideConstraints, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_inputLayoutAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputLayoutAssistantView, 0);
  objc_storeStrong((id *)&self->_inputLayoutView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_offscreenConstraints, 0);
  objc_storeStrong((id *)&self->_onscreenConstraints, 0);
  objc_storeStrong((id *)&self->_keyplaneWidthConstraint, 0);
  objc_storeStrong((id *)&self->_rightConstraint, 0);
  objc_storeStrong((id *)&self->_leftConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryLayoutGuide, 0);
  objc_storeStrong((id *)&self->_assistantLayoutGuide, 0);
  objc_storeStrong((id *)&self->_inputViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_belowInputLayoutGuide, 0);
}

@end
