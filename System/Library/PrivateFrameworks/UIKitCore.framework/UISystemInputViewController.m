@implementation UISystemInputViewController

+ (BOOL)canUseSystemInputViewControllerForResponder:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE22B80)
    || (objc_msgSend(v3, "_disableAutomaticKeyboardUI") & 1) != 0
    || (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_isHardwareKeyboardAvailable"),
        v4,
        (v5 & 1) != 0))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v3, "_responderWindow");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "screen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "traitCollection");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = objc_msgSend(v10, "userInterfaceIdiom") == 2;

  }
  return v6;
}

+ (void)setKeyboardInteractionModel:(unint64_t)a3
{
  id v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestedInteractionModel:", a3);

}

+ (id)systemInputViewControllerForResponder:(id)a3 editorView:(id)a4
{
  return (id)objc_msgSend(a1, "systemInputViewControllerForResponder:editorView:containingResponder:", a3, a4, a3);
}

+ (id)systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "_disableAutomaticKeyboardUI");
  v12 = objc_msgSend(v8, "conformsToProtocol:", &unk_1EDE22B80);
  if (v11
    && v12
    && (objc_msgSend(v9, "window"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v10, "traitCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(v10, "_responderWindow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "screen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v15 ? 0 : v11;
      if (v18 == 1)
      {
        +[UIScreen mainScreen](UIScreen, "mainScreen");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "traitCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    v20 = objc_msgSend(v15, "userInterfaceIdiom");
    v21 = 0;
    switch(v20)
    {
      case 0:
      case 1:
        objc_msgSend(a1, "_iOS_systemInputViewControllerForResponder:editorView:containingResponder:traitCollection:", v8, v9, v10, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
      case 8:
        objc_msgSend(a1, "_tvOS_systemInputViewControllerForResponder:editorView:containingResponder:traitCollection:", v8, v9, v10, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend(a1, "_carPlay_systemInputViewControllerForResponder:editorView:containingResponder:traitCollection:", v8, v9, v10, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        break;
    }
    v14 = v21;

  }
  return v14;
}

+ (id)_carPlay_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  UIKBFocusVCView *v21;
  UIKBFocusVCView *v22;
  void *v23;
  UIViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  UIKBStackViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "userInterfaceIdiom") == 3)
  {
    v14 = objc_msgSend(v12, "_disableAutomaticKeyboardUI");
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EDE22B80))
      v15 = v10;
    else
      v15 = 0;
    v16 = v15;
    v17 = objc_msgSend(objc_alloc((Class)a1), "initWithNibName:bundle:", 0, 0);
    objc_msgSend((id)v17, "setSupportsTouchInput:", objc_msgSend(v13, "primaryInteractionModel") & 1);
    objc_msgSend((id)v17, "setPersistentDelegate:", v16);
    objc_msgSend((id)v17, "setWillUpdateBackgroundEffectOnInputModeChange:", 0);
    objc_msgSend((id)v17, "setIsAutomaticResponderTransition:", __automaticNextFocusResponder == (_QWORD)v10);
    *(_BYTE *)(v17 + 1017) = v14 ^ 1;
    *(_QWORD *)(v17 + 992) = v12;
    v45 = v16;
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v16);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "setTextInputTraits:");
    objc_msgSend((id)v17, "textInputTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "keyboardAppearance");

    if ((unint64_t)(v19 - 1) > 9)
      v20 = 1000;
    else
      v20 = qword_18667FAE0[v19 - 1];
    objc_msgSend((id)v17, "setBlurEffectStyle:", v20);
    v21 = [UIKBFocusVCView alloc];
    v22 = -[UIView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    objc_msgSend((id)v17, "setView:", v22);
    objc_msgSend((id)v17, "setContainingView:", v22);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v11);
      v24 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v24 = -[UIViewController initWithNibName:bundle:]([UIViewController alloc], "initWithNibName:bundle:", 0, 0);
        -[UIViewController setView:](v24, "setView:", v11);
      }
      +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:](UIKBSystemLayoutViewController, "systemLayoutViewControllerWithViewController:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setVerticalLayoutType:", 4);
      if ((objc_msgSend((id)v17, "supportsTouchInput") | v14) == 1)
      {
        if ((v14 & 1) == 0)
          objc_msgSend(v25, "setMinimumInsets:", 0.0, 0.0, 32.0, 0.0);
        objc_msgSend((id)v17, "setEditorVC:", v25);
      }
      else
      {
        objc_msgSend(v25, "setHorizontalLayoutType:", 3);
        objc_msgSend(v46, "addObject:", v25);
      }

    }
    v44 = v11;
    objc_msgSend(v45, "inputView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "inputViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27 && v26)
    {
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)v17, "setInputVC:", v27);
    objc_msgSend((id)v17, "populateCoreHierarchy");
    objc_msgSend((id)v17, "updateViewConstraints");
    if ((v14 & 1) == 0 && objc_msgSend(v46, "count"))
    {
      v41 = v12;
      v42 = v10;
      v28 = -[UIViewController initWithNibName:bundle:]([UIKBStackViewController alloc], "initWithNibName:bundle:", 0, 0);
      -[UIKBStackViewController stackView](v28, "stackView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setAxis:", 1);

      -[UIKBStackViewController stackView](v28, "stackView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAlignment:", 0);

      -[UIKBStackViewController stackView](v28, "stackView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDistribution:", 0);

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v32 = v46;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v48 != v35)
              objc_enumerationMutation(v32);
            -[UIKBStackViewController addChildViewController:](v28, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i), v41, v42);
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v34);
      }

      objc_msgSend((id)v17, "setAccessoryViewController:forEdge:", v28, 3);
      v12 = v41;
      v10 = v42;
    }
    objc_msgSend((id)v17, "contentLayoutView", v41, v42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "keyboardVC");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bringSubviewToFront:", v39);

    v11 = v44;
  }
  else
  {
    v17 = 0;
  }

  return (id)v17;
}

+ (id)_tvOS_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  UIKBFocusVCView *v21;
  UIKBFocusVCView *v22;
  UIVisualEffectView *v23;
  void *v24;
  void *v25;
  UIViewController *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  UIViewController *v35;
  void *v36;
  void *v37;
  UITapGestureRecognizer *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  UILabel *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  UIKBStackViewController *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  int v73;
  void *v74;
  void *v75;
  UIFocusGuide *v76;
  void *v77;
  void *v78;
  void **v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  UIFocusGuide *v86;
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
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  UIFocusGuide *v107;
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
  UIFocusGuide *v125;
  void *v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[4];
  void *v143;
  _QWORD v144[4];
  void *v145;
  void *v146;
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "userInterfaceIdiom") == 2 || objc_msgSend(v13, "userInterfaceIdiom") == 8)
  {
    v133 = v13;
    v14 = objc_msgSend(v12, "_disableAutomaticKeyboardUI");
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EDE22B80))
      v15 = v10;
    else
      v15 = 0;
    v16 = v15;
    v17 = objc_msgSend(objc_alloc((Class)a1), "initWithNibName:bundle:", 0, 0);
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v16);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "setTextInputTraits:");
    objc_msgSend((id)v17, "setPersistentDelegate:", v16);
    objc_msgSend((id)v17, "setWillPresentFullscreen:", v14 ^ 1u);
    objc_msgSend((id)v17, "setWillUpdateBackgroundEffectOnInputModeChange:", 0);
    objc_msgSend((id)v17, "setIsAutomaticResponderTransition:", __automaticNextFocusResponder == (_QWORD)v10);
    *(_BYTE *)(v17 + 1017) = v14 ^ 1;
    *(_QWORD *)(v17 + 992) = v12;
    *(_BYTE *)(v17 + 1019) = 1;
    objc_msgSend((id)v17, "textInputTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "keyboardAppearance");

    if ((unint64_t)(v19 - 1) > 9)
      v20 = 1000;
    else
      v20 = qword_18667FAE0[v19 - 1];
    objc_msgSend((id)v17, "setBlurEffectStyle:", v20);
    v131 = v12;
    if ((v14 & 1) != 0)
    {
      v21 = [UIKBFocusVCView alloc];
      v22 = -[UIView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend((id)v17, "setView:", v22);
      objc_msgSend((id)v17, "setContainingView:", v22);
    }
    else
    {
      objc_msgSend((id)v17, "setModalPresentationStyle:", 5);
      objc_msgSend((id)v17, "setModalTransitionStyle:", 2);
      v23 = [UIVisualEffectView alloc];
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", objc_msgSend((id)v17, "blurEffectStyle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[UIVisualEffectView initWithEffect:](v23, "initWithEffect:", v24);

      -[UIKBFocusVCView _setGroupName:](v22, "_setGroupName:", CFSTR("UIKBBackdropGroupName"));
      objc_msgSend((id)v17, "setView:", v22);
      -[UIKBFocusVCView contentView](v22, "contentView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "setContainingView:", v25);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", v11);
      v26 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        v26 = -[UIViewController initWithNibName:bundle:]([UIViewController alloc], "initWithNibName:bundle:", 0, 0);
        -[UIViewController setView:](v26, "setView:", v11);
      }
      +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:](UIKBSystemLayoutViewController, "systemLayoutViewControllerWithViewController:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setVerticalLayoutType:", 4);
      if ((objc_msgSend((id)v17, "supportsTouchInput") | v14) == 1)
      {
        if ((v14 & 1) == 0)
          objc_msgSend(v27, "setMinimumInsets:", 0.0, 0.0, 32.0, 0.0);
        objc_msgSend((id)v17, "setEditorVC:", v27);
      }
      else
      {
        objc_msgSend(v27, "setHorizontalLayoutType:", 3);
        objc_msgSend(v137, "addObject:", v27);
      }

    }
    objc_msgSend(v16, "inputView");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputViewController");
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29 && v28)
    {
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v130 = (void *)v28;
    v136 = (void *)v29;
    objc_msgSend((id)v17, "setInputVC:", v29);
    objc_msgSend((id)v17, "populateCoreHierarchy");
    if ((v14 & 1) != 0)
    {
      v134 = 0;
      goto LABEL_36;
    }
    objc_msgSend((id)v17, "findNextInputDelegate");
    +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "doneButtonStringForCurrentInputDelegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setTitle:forState:", v31, 0);

    objc_msgSend(v30, "addTarget:action:forControlEvents:", v17, sel__returnButtonPressed, 0x2000);
    if (v19 == 2)
    {
      v32 = 4005;
    }
    else
    {
      if ((v19 & 0xFFFFFFFFFFFFFFF7) != 1)
      {
LABEL_32:
        v35 = -[UIViewController initWithNibName:bundle:]([UIViewController alloc], "initWithNibName:bundle:", 0, 0);
        -[UIViewController setView:](v35, "setView:", v30);
        if (objc_msgSend((id)v17, "supportsTouchInput"))
        {
          objc_msgSend((id)v17, "setAccessoryViewController:forEdge:", v35, 2);
          objc_msgSend((id)v17, "_accessoryViewControllerForEdge:", 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setMinimumInsets:", -112.0, 0.0, 0.0, 0.0);

          objc_msgSend(v30, "_setSpeedBumpEdges:", 1);
          v134 = 0;
        }
        else
        {
          +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:](UIKBSystemLayoutViewController, "systemLayoutViewControllerWithViewController:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setVerticalLayoutType:", 3);
          objc_msgSend(v37, "setMinimumInsets:", -112.0, 0.0, 0.0, 0.0);
          v134 = v37;
          objc_msgSend(v137, "addObject:", v37);
        }
        v38 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v17, sel__returnButtonPressed);
        -[UITapGestureRecognizer setAllowedPressTypes:](v38, "setAllowedPressTypes:", &unk_1E1A93878);
        -[UIGestureRecognizer setAllowedTouchTypes:](v38, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
        objc_msgSend((id)v17, "view");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addGestureRecognizer:", v38);

        objc_msgSend((id)v17, "setDoneButton:", v30);
LABEL_36:
        objc_msgSend(v16, "inputAccessoryView");
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "inputAccessoryViewController");
        v41 = objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          v42 = (void *)v41;
          v43 = 0;
          goto LABEL_38;
        }
        if (v40)
          v46 = 1;
        else
          v46 = v14;
        if ((v46 & 1) != 0)
        {
          v43 = 0;
          if (!v40)
            goto LABEL_65;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v40 = 0;
            goto LABEL_65;
          }
          objc_msgSend(v16, "_defaultPromptString");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v58 != 0;
          if (v58)
          {
            v59 = objc_msgSend(v133, "userInterfaceStyle");
            v60 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, 0.0, 300.0, 70.0);
            v61 = 0;
            switch(objc_msgSend(v132, "keyboardAppearance"))
            {
              case 1:
              case 9:
                goto LABEL_60;
              case 2:
                goto LABEL_59;
              case 10:
                if (v59 > 1)
                {
LABEL_60:
                  +[UIColor lightTextColor](UIColor, "lightTextColor");
                  v62 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
LABEL_59:
                  +[UIColor darkTextColor](UIColor, "darkTextColor");
                  v62 = objc_claimAutoreleasedReturnValue();
                }
                v61 = (void *)v62;
                break;
              default:
                break;
            }
            -[UILabel setTextColor:](v60, "setTextColor:", v61);
            -[UIView setOpaque:](v60, "setOpaque:", 0);
            -[UIView setBackgroundColor:](v60, "setBackgroundColor:", 0);
            -[UILabel setText:](v60, "setText:", v58);
            objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleTitle2"));
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            -[UILabel setFont:](v60, "setFont:", v63);

            -[UIView sizeToFit](v60, "sizeToFit");
            objc_msgSend((id)v17, "set_promptLabel:", v60);

            v40 = (uint64_t)v60;
          }
          else
          {
            v40 = 0;
          }

          if (!v40)
          {
LABEL_65:
            v135 = (void *)v40;
            objc_msgSend((id)v17, "updateViewConstraints");
            v55 = 0;
            v42 = 0;
            v44 = 0;
            if ((v14 & 1) != 0)
            {
LABEL_90:
              objc_msgSend((id)v17, "contentLayoutView");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v17, "keyboardVC");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "view");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "bringSubviewToFront:", v96);

              v12 = v131;
              v13 = v133;
              goto LABEL_91;
            }
LABEL_66:
            if (objc_msgSend(v137, "count"))
            {
              v128 = v10;
              v129 = v11;
              v64 = -[UIViewController initWithNibName:bundle:]([UIKBStackViewController alloc], "initWithNibName:bundle:", 0, 0);
              -[UIKBStackViewController stackView](v64, "stackView");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setAxis:", 1);

              -[UIKBStackViewController stackView](v64, "stackView");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "setAlignment:", 0);

              -[UIKBStackViewController stackView](v64, "stackView");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setDistribution:", 0);

              v140 = 0u;
              v141 = 0u;
              v138 = 0u;
              v139 = 0u;
              v68 = v137;
              v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
              if (v69)
              {
                v70 = v69;
                v71 = *(_QWORD *)v139;
                do
                {
                  for (i = 0; i != v70; ++i)
                  {
                    if (*(_QWORD *)v139 != v71)
                      objc_enumerationMutation(v68);
                    -[UIKBStackViewController addChildViewController:](v64, "addChildViewController:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i));
                  }
                  v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v138, v147, 16);
                }
                while (v70);
              }

              objc_msgSend((id)v17, "setAccessoryViewController:forEdge:", v64, 3);
              v73 = objc_msgSend((id)v17, "supportsTouchInput");
              objc_msgSend((id)v17, "_accessoryViewControllerForEdge:", 3);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v74;
              if (v73)
              {
                objc_msgSend(v74, "setMinimumInsets:", 0.0, -300.0, 0.0, 0.0);

                objc_msgSend((id)v17, "_accessoryViewControllerForEdge:", 3);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setCenteredOffsets:", 0.0, -140.0);
              }
              else
              {
                objc_msgSend(v74, "setMinimumInsets:", 0.0, -292.0, 0.0, 0.0);
              }

              v10 = v128;
              v11 = v129;
              if ((objc_msgSend((id)v17, "supportsTouchInput") & 1) == 0 && ((v135 == 0) & ~v55) == 0)
              {
                v76 = objc_alloc_init(UIFocusGuide);
                if (v44)
                  v77 = v44;
                else
                  v77 = v42;
                objc_msgSend(v77, "view");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                if (v135)
                {
                  v146 = v135;
                  v79 = &v146;
                }
                else
                {
                  v145 = v42;
                  v79 = &v145;
                }
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 1);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIFocusGuide setPreferredFocusEnvironments:](v76, "setPreferredFocusEnvironments:", v80);

                objc_msgSend((id)v17, "view");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "addLayoutGuide:", v76);

                v110 = (void *)MEMORY[0x1E0D156E0];
                -[UILayoutGuide leadingAnchor](v76, "leadingAnchor");
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v17, "keyboardVC");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v126, "focusSafeAreaLayoutGuide");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "trailingAnchor");
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v122, "constraintEqualToAnchor:", v118);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v144[0] = v116;
                -[UILayoutGuide trailingAnchor](v76, "trailingAnchor");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v17, "view");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "trailingAnchor");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v112, "constraintEqualToAnchor:", v108);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                v144[1] = v106;
                -[UILayoutGuide topAnchor](v76, "topAnchor");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "topAnchor");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "constraintEqualToAnchor:", v102);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v144[2] = v100;
                v125 = v76;
                -[UILayoutGuide bottomAnchor](v76, "bottomAnchor");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v124 = v78;
                objc_msgSend(v78, "bottomAnchor");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "constraintEqualToAnchor:", v83);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v144[3] = v84;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 4);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "activateConstraints:", v85);

                v86 = objc_alloc_init(UIFocusGuide);
                if (v134)
                  objc_msgSend(v134, "view");
                else
                  objc_msgSend((id)v17, "doneButton");
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v17, "doneButton");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v143 = v87;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v143, 1);
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIFocusGuide setPreferredFocusEnvironments:](v86, "setPreferredFocusEnvironments:", v88);

                objc_msgSend((id)v17, "view");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "addLayoutGuide:", v86);

                v109 = (void *)MEMORY[0x1E0D156E0];
                -[UILayoutGuide leadingAnchor](v86, "leadingAnchor");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v17, "keyboardVC");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v123, "focusSafeAreaLayoutGuide");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "trailingAnchor");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "constraintEqualToAnchor:", v117);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v142[0] = v115;
                -[UILayoutGuide trailingAnchor](v86, "trailingAnchor");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v17, "view");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "trailingAnchor");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "constraintEqualToAnchor:", v105);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                v142[1] = v103;
                -[UILayoutGuide topAnchor](v86, "topAnchor");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "topAnchor");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "constraintEqualToAnchor:", v99);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v142[2] = v98;
                -[UILayoutGuide bottomAnchor](v86, "bottomAnchor");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "bottomAnchor");
                v107 = v86;
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "constraintEqualToAnchor:", v91);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v142[3] = v92;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v142, 4);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "activateConstraints:", v93);

                v11 = v129;
              }

            }
            goto LABEL_90;
          }
        }
        +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
LABEL_38:
          v135 = (void *)v40;
          if (objc_msgSend((id)v17, "supportsTouchInput"))
          {
            objc_msgSend((id)v17, "setAccessoryViewController:forEdge:", v42, 0);
            v44 = 0;
            if (v43)
            {
              objc_msgSend((id)v17, "_accessoryViewControllerForEdge:", 0);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setMinimumInsets:", 0.0, 0.0, 70.0, 0.0);

              v44 = 0;
            }
          }
          else
          {
            +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:](UIKBSystemLayoutViewController, "systemLayoutViewControllerWithViewController:", v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setHorizontalLayoutType:", 1);
            objc_msgSend(v44, "setVerticalLayoutType:", 3);
            objc_msgSend(v44, "setMinimumInsets:", 0.0, 0.0, 20.0, 0.0);
            objc_msgSend(v137, "insertObject:atIndex:", v44, 0);
          }
          objc_msgSend(v42, "view");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_opt_respondsToSelector();

          if ((v48 & 1) != 0)
          {
            objc_msgSend(v136, "view");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "_alignmentOffset");
            v51 = v50;
            v53 = v52;
            objc_msgSend((id)v17, "alignmentConstraintForAxis:", 0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setConstant:", v51);

            v55 = 1;
            objc_msgSend((id)v17, "alignmentConstraintForAxis:", 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setConstant:", v53);

            objc_msgSend((id)v17, "view");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setNeedsLayout");

            if ((v14 & 1) != 0)
              goto LABEL_90;
          }
          else
          {
            v55 = 1;
            if ((v14 & 1) != 0)
              goto LABEL_90;
          }
          goto LABEL_66;
        }
        goto LABEL_65;
      }
      v32 = 4000;
    }
    +[UIBlurEffect _effectWithStyle:invertAutomaticStyle:](UIBlurEffect, "_effectWithStyle:invertAutomaticStyle:", v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_contentBackdropView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setEffect:", v33);

    goto LABEL_32;
  }
  v17 = 0;
LABEL_91:
  +[_UIKeyboardUsageTracking keyboardSupportsTouch:](_UIKeyboardUsageTracking, "keyboardSupportsTouch:", objc_msgSend((id)v17, "supportsTouchInput"));

  return (id)v17;
}

+ (id)_iOS_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  char v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIKBFocusVCView *v25;
  UIKBFocusVCView *v26;
  UIVisualEffectView *v27;
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
  id v39;
  id v40;
  id v41;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v11, "userInterfaceIdiom") && objc_msgSend(v11, "userInterfaceIdiom") != 1)
  {
    v17 = 0;
  }
  else
  {
    v40 = v11;
    v12 = objc_msgSend(v10, "_disableAutomaticKeyboardUI");
    v13 = v12;
    v14 = v12 ^ 1u;
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EDE22B80))
      v15 = v9;
    else
      v15 = 0;
    v16 = v15;
    v17 = objc_msgSend(objc_alloc((Class)a1), "initWithNibName:bundle:", 0, 0);
    *(_BYTE *)(v17 + 1016) = 1;
    objc_msgSend((id)v17, "setPersistentDelegate:", v16);
    objc_msgSend((id)v17, "setWillPresentFullscreen:", v14);
    objc_msgSend((id)v17, "setWillUpdateBackgroundEffectOnInputModeChange:", 1);
    objc_msgSend((id)v17, "setIsAutomaticResponderTransition:", __automaticNextFocusResponder == (_QWORD)v9);
    *(_BYTE *)(v17 + 1017) = 1;
    v41 = v10;
    *(_QWORD *)(v17 + 992) = v10;
    +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v16);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "setTextInputTraits:", v18);
    objc_msgSend((id)v17, "textInputTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "keyboardAppearance");

    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentInputMode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderConfig configForAppearance:inputMode:traitEnvironment:](UIKBRenderConfig, "configForAppearance:inputMode:traitEnvironment:", v20, v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "blurEffectStyle");

    objc_msgSend((id)v17, "setBlurEffectStyle:", v24);
    if ((v13 & 1) != 0)
    {
      v25 = [UIKBFocusVCView alloc];
      v26 = -[UIView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend((id)v17, "setView:", v26);
      objc_msgSend((id)v17, "setContainingView:", v26);
    }
    else
    {
      objc_msgSend((id)v17, "setModalPresentationStyle:", 5);
      objc_msgSend((id)v17, "setModalTransitionStyle:", 2);
      v27 = [UIVisualEffectView alloc];
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", objc_msgSend((id)v17, "blurEffectStyle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[UIVisualEffectView initWithEffect:](v27, "initWithEffect:", v28);

      -[UIKBFocusVCView _setGroupName:](v26, "_setGroupName:", CFSTR("UIKBBackdropGroupName"));
      objc_msgSend((id)v17, "setView:", v26);
      -[UIKBFocusVCView contentView](v26, "contentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v17, "setContainingView:", v29);

    }
    objc_msgSend(v16, "inputView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31 && v30)
    {
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)v17, "setInputVC:", v31);
    objc_msgSend((id)v17, "populateCoreHierarchy");
    objc_msgSend(v16, "inputAccessoryView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputAccessoryViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33 && v32)
    {
      +[UICompatibilityInputViewController inputViewControllerWithView:](UICompatibilityInputViewController, "inputViewControllerWithView:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = v9;
    v34 = (void *)v18;
    if (v33)
    {
      if (objc_msgSend((id)v17, "supportsTouchInput"))
        objc_msgSend((id)v17, "setAccessoryViewController:forEdge:", v33, 0);
    }
    else
    {
      objc_msgSend((id)v17, "updateViewConstraints");
    }
    objc_msgSend((id)v17, "contentLayoutView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "keyboardVC");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bringSubviewToFront:", v37);

    v11 = v40;
    v10 = v41;
    v9 = v39;
  }

  return (id)v17;
}

- (int64_t)resolvedKeyboardStyle
{
  self->_resolvedKeyboardStyle = 0;
  return 0;
}

- (void)_restoreKeyboardIfNecessary
{
  void *v3;
  UISystemInputViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UISystemInputViewController keyboardVC](self, "keyboardVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentViewController");
  v4 = (UISystemInputViewController *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController keyboard](self, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDeferredSystemView:", v6);

    -[UISystemInputViewController _addChildInputViewController](self, "_addChildInputViewController");
    -[UISystemInputViewController updateViewConstraints](self, "updateViewConstraints");
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bringSubviewToFront:", v8);

  }
}

- (void)populateCoreHierarchy
{
  UIView *v3;
  void *v4;
  UIView *v5;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = [UIView alloc];
  -[UISystemInputViewController containingView](self, "containingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  -[UISystemInputViewController setContentLayoutView:](self, "setContentLayoutView:", v5);

  -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOpaque:", 0);

  -[UISystemInputViewController containingView](self, "containingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[UISystemInputViewController _addChildInputViewController](self, "_addChildInputViewController");
  -[UISystemInputViewController editorVC](self, "editorVC");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UISystemInputViewController editorVC](self, "editorVC");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController _addAccessoryViewController:](self, "_addAccessoryViewController:", v11);

  }
  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen"))
  {
    -[UISystemInputViewController updateAlignmentConstraints](self, "updateAlignmentConstraints");
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D156E0];
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController containingView](self, "containingView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 3, 0, v28, 3, 1.0, 0.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    v13 = (void *)MEMORY[0x1E0D156E0];
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController containingView](self, "containingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 4, 0, v14, 4, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v15;
    v16 = (void *)MEMORY[0x1E0D156E0];
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController containingView](self, "containingView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 1, 0, v18, 1, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v19;
    v20 = (void *)MEMORY[0x1E0D156E0];
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController containingView](self, "containingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 2, 0, v22, 2, 1.0, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISystemInputViewController containingView](self, "containingView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addConstraints:", v24);

  }
}

- (id)_traitCollectionForUserInterfaceStyle
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen"))
  {
    -[UITraitEnvironment traitCollection](self->_containingResponder, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UISystemInputViewController;
      -[UIViewController traitCollection](&v13, sel_traitCollection);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;

    -[UISystemInputViewController textInputTraits](self, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "keyboardAppearance");

    switch(v9)
    {
      case 9:
        v10 = 1000;
        break;
      case 2:
        v10 = 1;
        break;
      case 1:
        v10 = 2;
        break;
      default:
        v10 = objc_msgSend(v7, "userInterfaceStyle");
        break;
    }
    objc_msgSend(v7, "_traitCollectionByReplacingNSIntegerValue:forTraitToken:", v10, 0x1E1A994B0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UISystemInputViewController;
    -[UIViewController traitCollection](&v12, sel_traitCollection);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_setNonInputViewVisibility:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *accessoryViewControllers;
  _QWORD v11[4];
  BOOL v12;

  v3 = a3;
  -[UISystemInputViewController editorVC](self, "editorVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UISystemInputViewController editorVC](self, "editorVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", !v3);

  }
  -[UISystemInputViewController doneButton](self, "doneButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UISystemInputViewController doneButton](self, "doneButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", !v3);

  }
  accessoryViewControllers = self->_accessoryViewControllers;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__UISystemInputViewController__setNonInputViewVisibility___block_invoke;
  v11[3] = &__block_descriptor_33_e43_v32__0__NSNumber_8__UIViewController_16_B24l;
  v12 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accessoryViewControllers, "enumerateKeysAndObjectsUsingBlock:", v11);
}

void __58__UISystemInputViewController__setNonInputViewVisibility___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _BOOL8 v3;
  id v4;

  v3 = *(_BYTE *)(a1 + 32) == 0;
  objc_msgSend(a3, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (BOOL)keyboardCanBecomeFocusedWithZeroAlpha
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEligibleForFocusWithZeroAlpha");

  return v6;
}

- (void)setKeyboardCanBecomeFocusedWithZeroAlpha:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsEligibleForFocusWithZeroAlpha:", v3);

  }
}

- (void)_addChildInputViewController
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;

  -[UISystemInputViewController recentsVC](self, "recentsVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIViewController childViewControllers](self, "childViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    if ((v6 & 1) == 0)
    {
      -[UISystemInputViewController recentsVC](self, "recentsVC");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v15 = (void *)v7;
      -[UISystemInputViewController _addAccessoryViewController:](self, "_addAccessoryViewController:", v7);

    }
  }
  else
  {
    -[UISystemInputViewController inputVC](self, "inputVC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIViewController childViewControllers](self, "childViewControllers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController inputVC](self, "inputVC");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "containsObject:", v10);

      if ((v11 & 1) == 0)
      {
        -[UISystemInputViewController inputVC](self, "inputVC");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else
    {
      -[UISystemInputViewController _createKeyboardIfNecessary](self, "_createKeyboardIfNecessary");
      -[UIViewController childViewControllers](self, "childViewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController keyboardVC](self, "keyboardVC");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "containsObject:", v13);

      if ((v14 & 1) == 0)
      {
        -[UISystemInputViewController keyboardVC](self, "keyboardVC");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
  }
  -[UISystemInputViewController _setNonInputViewVisibility:](self, "_setNonInputViewVisibility:", v3 == 0);
  -[UISystemInputViewController _updateRemoteTextEditingSession](self, "_updateRemoteTextEditingSession");
}

- (id)_remoteInputSessionIdentifier
{
  NSUUID *remoteInputSessionIdentifier;
  NSUUID *v4;
  NSUUID *v5;

  remoteInputSessionIdentifier = self->_remoteInputSessionIdentifier;
  if (!remoteInputSessionIdentifier)
  {
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v5 = self->_remoteInputSessionIdentifier;
    self->_remoteInputSessionIdentifier = v4;

    remoteInputSessionIdentifier = self->_remoteInputSessionIdentifier;
  }
  return remoteInputSessionIdentifier;
}

- (void)_createKeyboardIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  id v20;

  -[UISystemInputViewController keyboard](self, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[UIKeyboard initLazily]([UIKeyboard alloc], "initLazily");
    -[UISystemInputViewController setKeyboard:](self, "setKeyboard:", v4);

    -[UISystemInputViewController keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setDisableTouchInput:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput") ^ 1);

    -[UISystemInputViewController keyboard](self, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setUseLinearLayout:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput"));

    v7 = -[UISystemInputViewController requestedInteractionModel](self, "requestedInteractionModel");
    -[UISystemInputViewController keyboard](self, "keyboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequestedInteractionModel:", v7);

    -[UISystemInputViewController keyboard](self, "keyboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[UISystemInputViewController keyboard](self, "keyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICompatibilityInputViewController deferredInputModeControllerWithKeyboard:](UICompatibilityInputViewController, "deferredInputModeControllerWithKeyboard:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setKeyboardVC:](self, "setKeyboardVC:", v11);

  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferencesActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "currentInputModeSupportsCrescendo");

  if ((v14 & 1) == 0)
  {
    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1148846080;
    objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 1, v17);

    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1148846080;
    objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);

  }
}

- (void)_windowWillBecomeApplicationKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  -[UIResponder _responderWindow](self, "_responderWindow");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v8 || v5 == v11)
    goto LABEL_6;
  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFirstResponder");

  if (v10 && v7 != 3)
  {
    objc_msgSend(v11, "firstResponder");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resignFirstResponder");
LABEL_6:

  }
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIResponder _responderWindow](self, "_responderWindow");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v4)
  {
    -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFirstResponder");

    if (v6)
      -[UISystemInputViewController _restoreKeyboardIfNecessary](self, "_restoreKeyboardIfNecessary");
  }
  else
  {

  }
}

- (void)setRequestedInteractionModel:(unint64_t)a3
{
  void *v5;
  id v6;

  if (self->_requestedInteractionModel != a3)
  {
    self->_requestedInteractionModel = a3;
    self->_supportsTouchInput = a3 < 2;
    -[UISystemInputViewController keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UISystemInputViewController keyboard](self, "keyboard");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRequestedInteractionModel:", a3);

    }
  }
}

- (void)setInputVC:(id)a3
{
  UIViewController *v5;
  UIViewController **p_inputVC;
  UIViewController *inputVC;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  UIViewController *v15;

  v5 = (UIViewController *)a3;
  p_inputVC = &self->_inputVC;
  inputVC = self->_inputVC;
  if (inputVC != v5)
  {
    v15 = v5;
    if (inputVC)
    {
      -[UIViewController childViewControllers](self, "childViewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", *p_inputVC);

      v5 = v15;
      if (v9)
      {
        -[UISystemInputViewController _removeAccessoryViewController:](self, "_removeAccessoryViewController:", *p_inputVC);
        v5 = v15;
      }
    }
    if (v5)
    {
      if (self->_keyboardVC)
      {
        -[UIViewController childViewControllers](self, "childViewControllers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", self->_keyboardVC);

        if (v11)
          -[UISystemInputViewController _removeAccessoryViewController:](self, "_removeAccessoryViewController:", self->_keyboardVC);
      }
    }
    objc_storeStrong((id *)&self->_inputVC, a3);
    -[UISystemInputViewController _addChildInputViewController](self, "_addChildInputViewController");
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UISystemInputViewController updateViewConstraints](self, "updateViewConstraints");
      -[UISystemInputViewController updateAlignmentConstraints](self, "updateAlignmentConstraints");
    }
    else
    {
      -[UIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsUpdateConstraints");

    }
    v5 = v15;
  }

}

- (void)setRecentsVC:(id)a3
{
  UIRecentsInputViewController *v5;
  UIRecentsInputViewController **p_recentsVC;
  UIRecentsInputViewController *recentsVC;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  UIRecentsInputViewController *v15;

  v5 = (UIRecentsInputViewController *)a3;
  p_recentsVC = &self->_recentsVC;
  recentsVC = self->_recentsVC;
  if (recentsVC != v5)
  {
    v15 = v5;
    if (recentsVC)
    {
      -[UIViewController childViewControllers](self, "childViewControllers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", *p_recentsVC);

      v5 = v15;
      if (v9)
      {
        -[UISystemInputViewController _removeAccessoryViewController:](self, "_removeAccessoryViewController:", *p_recentsVC);
        v5 = v15;
      }
    }
    if (v5)
    {
      if (self->_keyboardVC)
      {
        -[UIViewController childViewControllers](self, "childViewControllers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", self->_keyboardVC);

        if (v11)
          -[UISystemInputViewController _removeAccessoryViewController:](self, "_removeAccessoryViewController:", self->_keyboardVC);
      }
    }
    objc_storeStrong((id *)&self->_recentsVC, a3);
    -[UISystemInputViewController _addChildInputViewController](self, "_addChildInputViewController");
    -[UIViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UISystemInputViewController updateViewConstraints](self, "updateViewConstraints");
      -[UISystemInputViewController updateAlignmentConstraints](self, "updateAlignmentConstraints");
    }
    else
    {
      -[UIViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNeedsUpdateConstraints");

    }
    v5 = v15;
  }

}

- (void)didSelectRecentInput
{
  void *v3;
  char v4;
  id v5;

  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen"))
  {
    -[UISystemInputViewController _returnButtonPressed](self, "_returnButtonPressed");
  }
  else
  {
    -[UISystemInputViewController systemInputViewControllerDelegate](self, "systemInputViewControllerDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[UISystemInputViewController systemInputViewControllerDelegate](self, "systemInputViewControllerDelegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemInputViewControllerDidAcceptRecentInput:", self);

    }
  }
}

- (void)switchToKeyboard
{
  -[UISystemInputViewController setRecentsVC:](self, "setRecentsVC:", 0);
  -[UISystemInputViewController notifyDelegateWithAccessoryVisibility:](self, "notifyDelegateWithAccessoryVisibility:", 1);
  -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 1);
}

- (UITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setSupportsRecentInputsIntegration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_supportsRecentInputsIntegration = a3;
  if (a3)
  {
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_9:
      -[UISystemInputViewController configureRecentsVCIfNecessary](self, "configureRecentsVCIfNecessary");
      return;
    }
    if (self->_supportsRecentInputsIntegration)
    {

      return;
    }
    v7 = v5;
  }
  -[UISystemInputViewController recentsVC](self, "recentsVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  if (v6)
    goto LABEL_9;
}

- (void)configureRecentsVCIfNecessary
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
  UIRecentsInputViewController *v12;

  if (-[UISystemInputViewController willShowRecentsList](self, "willShowRecentsList"))
  {
    if (!-[UISystemInputViewController didDisplayRecents](self, "didDisplayRecents"))
    {
      v12 = -[UITableViewController initWithStyle:]([UIRecentsInputViewController alloc], "initWithStyle:", 0);
      -[UISystemInputViewController textInputTraits](self, "textInputTraits");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIRecentsInputViewController setCanManageList:](v12, "setCanManageList:", objc_msgSend(v3, "manageRecentInputs"));

      -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recentsAccessoryView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIRecentsInputViewController setCustomHeaderView:](v12, "setCustomHeaderView:", v5);

      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", -[UISystemInputViewController blurEffectStyle](self, "blurEffectStyle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITraitEnvironment traitCollection](self->_containingResponder, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "effectForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIRecentsInputViewController setContainingEffectStyle:](v12, "setContainingEffectStyle:", objc_msgSend(v8, "_style"));
      -[UISystemInputViewController setRecentsVC:](self, "setRecentsVC:", v12);
      -[UISystemInputViewController recentsVC](self, "recentsVC");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRecentInputDelegate:", self);

      -[UISystemInputViewController cachedRecents](self, "cachedRecents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController recentsVC](self, "recentsVC");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRecentInputs:", v10);

      -[UISystemInputViewController setDidDisplayRecents:](self, "setDidDisplayRecents:", 1);
      -[UISystemInputViewController notifyDelegateWithAccessoryVisibility:](self, "notifyDelegateWithAccessoryVisibility:", 0);

    }
  }
}

- (void)setSystemInputViewControllerDelegate:(id)a3
{
  id v4;

  if (self->_systemInputViewControllerDelegate != a3)
  {
    self->_systemInputViewControllerDelegate = (UISystemInputViewControllerDelegate *)a3;
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController notifyDelegateWithAccessoryVisibility:](self, "notifyDelegateWithAccessoryVisibility:", v4 == 0);

  }
}

- (void)notifyDelegateWithAccessoryVisibility:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v3 = a3;
  -[UISystemInputViewController systemInputViewControllerDelegate](self, "systemInputViewControllerDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[UISystemInputViewController systemInputViewControllerDelegate](self, "systemInputViewControllerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UISystemInputViewController systemInputViewControllerDelegate](self, "systemInputViewControllerDelegate");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemInputViewController:didChangeAccessoryVisibility:", self, v3);

    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen")
    && _UIPressesContainsPressType(v6, 5))
  {
    -[UIViewController _window](self, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v11.receiver = self;
      v11.super_class = (Class)UISystemInputViewController;
      -[UIResponder pressesBegan:withEvent:](&v11, sel_pressesBegan_withEvent_, v6, v7);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISystemInputViewController;
    -[UIResponder pressesBegan:withEvent:](&v10, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen")
    && _UIPressesContainsPressType(v6, 5))
  {
    -[UIViewController _window](self, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "_nonDestructivelyResignFirstResponder");
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UISystemInputViewController;
      -[UIResponder pressesEnded:withEvent:](&v11, sel_pressesEnded_withEvent_, v6, v7);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISystemInputViewController;
    -[UIResponder pressesEnded:withEvent:](&v10, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen")
    && _UIPressesContainsPressType(v6, 5))
  {
    -[UIViewController _window](self, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v11.receiver = self;
      v11.super_class = (Class)UISystemInputViewController;
      -[UIResponder pressesCancelled:withEvent:](&v11, sel_pressesCancelled_withEvent_, v6, v7);
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISystemInputViewController;
    -[UIResponder pressesCancelled:withEvent:](&v10, sel_pressesCancelled_withEvent_, v6, v7);
  }

}

- (void)_dismissSystemInputViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[UISystemInputViewController nextInputDelegate](self, "nextInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISystemInputViewController nextInputDelegate](self, "nextInputDelegate");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)__automaticNextFocusResponder;
    __automaticNextFocusResponder = v4;

    -[UISystemInputViewController setIsAutomaticResponderTransition:](self, "setIsAutomaticResponderTransition:", 1);
    -[UISystemInputViewController keyboard](self, "keyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisableInteraction:", 1);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__UISystemInputViewController__dismissSystemInputViewController__block_invoke;
    v9[3] = &unk_1E16B1B28;
    v9[4] = self;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v9);
    v7 = (void *)__automaticNextFocusResponder;
    __automaticNextFocusResponder = 0;

  }
  else
  {
    -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resignFirstResponder");

  }
}

void __64__UISystemInputViewController__dismissSystemInputViewController__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "persistentDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resignFirstResponder");

  objc_msgSend((id)__automaticNextFocusResponder, "becomeFirstResponder");
  if ((objc_msgSend((id)__automaticNextFocusResponder, "isFirstResponder") & 1) == 0)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDisableInteraction:", 0);

  }
}

- (void)_returnButtonPressed
{
  id v3;

  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "keyboardInput:shouldInsertText:isMarkedText:", v3, CFSTR("\n"), 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "sendActionsForControlEvents:", 0x80000);
  -[UISystemInputViewController _dismissSystemInputViewController](self, "_dismissSystemInputViewController");

}

- (UISystemInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UISystemInputViewController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISystemInputViewController;
  result = -[UIViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
  if (result)
    result->_supportsTouchInput = 1;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  UITextInput *v6;
  UITextInput *persistentDelegate;
  void *v8;
  UITextInput *nextInputDelegate;
  UITextInput *v10;
  objc_super v11;
  _QWORD v12[10];

  v12[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v12[1] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v12[2] = CFSTR("UIApplicationWillResignActiveNotification");
  v12[3] = CFSTR("UIApplicationDidBecomeActiveNotification");
  v12[4] = 0x1E1784AE0;
  v12[5] = 0x1E1784AC0;
  v12[6] = CFSTR("UITextInputCurrentInputModeDidChangeNotification");
  v12[7] = CFSTR("_UIWindowWillBecomeApplicationKeyNotification");
  v12[8] = CFSTR("_UIWindowDidBecomeApplicationKeyNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (UITextInput *)objc_claimAutoreleasedReturnValue();
  persistentDelegate = self->_persistentDelegate;

  if (v6 == persistentDelegate)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", 0);

  }
  self->_systemInputViewControllerDelegate = 0;
  nextInputDelegate = self->_nextInputDelegate;
  self->_nextInputDelegate = 0;

  v10 = self->_persistentDelegate;
  self->_persistentDelegate = 0;

  self->_containingResponder = 0;
  v11.receiver = self;
  v11.super_class = (Class)UISystemInputViewController;
  -[UIViewController dealloc](&v11, sel_dealloc);
}

- (void)prepareForRelease
{
  void *v3;
  UITextInput *v4;
  UITextInput *persistentDelegate;
  id v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (UITextInput *)objc_claimAutoreleasedReturnValue();
  persistentDelegate = self->_persistentDelegate;

  if (v4 == persistentDelegate)
  {
    if (self->_isVisible)
      -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", 0);

  }
}

- (void)resetContainingResponder
{
  self->_containingResponder = 0;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISystemInputViewController;
  -[UIViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  self->_isVisible = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _responderWindow](self, "_responderWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__windowWillBecomeApplicationKey_, CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), v5);

  -[UIResponder _responderWindow](self, "_responderWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__windowDidBecomeApplicationKey_, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), v6);

  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen"))
  {
    -[UIViewController presentationController](self, "presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_disableMenuPressForBackGesture");

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__UISystemInputViewController_viewDidAppear___block_invoke;
    v8[3] = &unk_1E16B1B28;
    v8[4] = self;
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v8);
  }

}

void __45__UISystemInputViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_responderWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusedView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isFocused"))
  {

LABEL_6:
    +[UIDictationController keyboardDidUpdateOnScreenStatus](UIDictationController, "keyboardDidUpdateOnScreenStatus");
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "cursorLocation");

  if (!v6 || !v8)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "keyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCursorLocation:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_setSystemInputInteractionActive:", 0);
LABEL_7:

}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[UISystemInputViewController recentsVC](self, "recentsVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v5 = (void **)v12;
  }
  else
  {
    -[UISystemInputViewController inputVC](self, "inputVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UISystemInputViewController inputVC](self, "inputVC");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v5 = &v11;
    }
    else
    {
      -[UISystemInputViewController keyboardVC](self, "keyboardVC");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        return MEMORY[0x1E0C9AA60];
      -[UISystemInputViewController keyboardVC](self, "keyboardVC");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      v5 = &v10;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1, v10, v11, v12[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISystemInputViewController;
  -[UIViewController didUpdateFocusInContext:withAnimationCoordinator:](&v6, sel_didUpdateFocusInContext_withAnimationCoordinator_, a3, a4);
  -[UISystemInputViewController _updateRemoteTextEditingSession](self, "_updateRemoteTextEditingSession");
  if (-[UISystemInputViewController notifyKeyboardOnScreenOnFocusOnly](self, "notifyKeyboardOnScreenOnFocusOnly"))
  {
    -[UISystemInputViewController keyboard](self, "keyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", objc_msgSend(v5, "isFocused"));

  }
}

- (UIEdgeInsets)unfocusedFocusGuideOutsets
{
  void *v2;
  double v3;
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
  UIEdgeInsets result;

  -[UISystemInputViewController keyboard](self, "keyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unfocusedFocusGuideOutsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  id v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UISystemInputViewController keyboard](self, "keyboard");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnfocusedFocusGuideOutsets:fromView:", v8, top, left, bottom, right);

}

- (id)viewForFocusHeading:(unint64_t)a3 fromView:(id)a4
{
  id v7;
  void *v8;
  _UIFocusMovementRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISystemInputViewController.m"), 1718, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

    if (a3)
      goto LABEL_3;
LABEL_8:
    v17 = v7;
    goto LABEL_9;
  }
  if (!a3)
    goto LABEL_8;
LABEL_3:
  +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_UIFocusMovementRequest initWithFocusSystem:]([_UIFocusMovementRequest alloc], "initWithFocusSystem:", v8);
  +[_UIFocusItemInfo infoWithView:](_UIFocusItemInfo, "infoWithView:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMovementRequest setFocusedItemInfo:](v9, "setFocusedItemInfo:", v10);

  +[_UIFocusMovementInfo _movementWithHeading:isInitial:](_UIFocusMovementInfo, "_movementWithHeading:isInitial:", a3, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusMovementRequest setMovementInfo:](v9, "setMovementInfo:", v11);

  objc_msgSend(v8, "_movementPerformer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contextForFocusMovement:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "nextFocusedView");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (void *)v14;
  else
    v16 = v7;
  v17 = v16;

LABEL_9:
  return v17;
}

- (void)findNextInputDelegate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UITextInput _responderWindow](self->_persistentDelegate, "_responderWindow");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_focusEventRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController viewForFocusHeading:fromView:](self, "viewForFocusHeading:fromView:", 16, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && v7 != v6 && objc_msgSend(v7, "conformsToProtocol:", &unk_1EDE22B80))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          if (objc_msgSend(v9, "isEditable"))
            -[UISystemInputViewController setNextInputDelegate:](self, "setNextInputDelegate:", v9);

        }
        else
        {
          -[UISystemInputViewController setNextInputDelegate:](self, "setNextInputDelegate:", v8);
        }
      }

    }
  }
}

- (id)doneButtonStringForCurrentInputDelegate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "returnKeyType");

  if (v4)
    v5 = v4;
  else
    v5 = 9;
  -[UISystemInputViewController nextInputDelegate](self, "nextInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 4;
  else
    v7 = v5;
  return UIKeyboardLocalizedReturnKeyName(v7);
}

- (void)setDoneButton:(id)a3
{
  UIButton *doneButton;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_doneButton, a3);
  doneButton = self->_doneButton;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (doneButton)
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_inputModeDidChange_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);
  else
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);

}

- (void)inputModeDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  -[UISystemInputViewController doneButton](self, "doneButton", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UISystemInputViewController doneButton](self, "doneButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController doneButtonStringForCurrentInputDelegate](self, "doneButtonStringForCurrentInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v6, 0);

  }
  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen")
    && -[UISystemInputViewController willUpdateBackgroundEffectOnInputModeChange](self, "willUpdateBackgroundEffectOnInputModeChange"))
  {
    -[UIViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UISystemInputViewController textInputTraits](self, "textInputTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "keyboardAppearance");
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentInputMode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderConfig configForAppearance:inputMode:traitEnvironment:](UIKBRenderConfig, "configForAppearance:inputMode:traitEnvironment:", v10, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "blurEffectStyle");

      -[UISystemInputViewController setBlurEffectStyle:](self, "setBlurEffectStyle:", v14);
      -[UIViewController view](self, "view");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", -[UISystemInputViewController blurEffectStyle](self, "blurEffectStyle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEffect:", v15);

    }
  }
}

- (void)reloadInputViewsForPersistentDelegate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIViewController _window](self, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 3)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "inputDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIWindowScene _keyWindowScene]();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "_responderWindow");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "screen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v10)
        {
          -[UIViewController _window](self, "_window");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "screen");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 != v10)
            objc_msgSend(v8, "resignFirstResponder");
        }
        else
        {

        }
      }

    }
  }
  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isFirstResponder");

  if (!v16)
  {
    -[UISystemInputViewController textInputTraits](self, "textInputTraits");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "forceSpellingDictation") & 1) == 0)
    {
      -[UISystemInputViewController textInputTraits](self, "textInputTraits");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!UIKeyboardTypeSupportsDictationSpelling(objc_msgSend(v28, "dictationKeyboardType")))
      {
        -[UISystemInputViewController textInputTraits](self, "textInputTraits");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isSecureTextEntry");

        if ((v31 & 1) == 0)
          goto LABEL_25;
        goto LABEL_24;
      }

    }
LABEL_24:
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "markKeyboardDidReset");

LABEL_25:
    -[UISystemInputViewController setupKeyboard](self, "setupKeyboard");
    -[UIViewController view](self, "view");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNeedsUpdateConstraints");

    return;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:", v18);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[UIViewController childViewControllers](self, "childViewControllers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v23);
        -[UISystemInputViewController keyboardVC](self, "keyboardVC");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 != v25)
        {
          -[UISystemInputViewController traitCollection](self, "traitCollection");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "traitCollectionDidChange:", v26);

        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v21);
  }

}

- (BOOL)willShowRecentsList
{
  void *v3;
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
  BOOL v14;

  -[UISystemInputViewController cachedRecents](self, "cachedRecents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UISystemInputViewController textInputTraits](self, "textInputTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSecureTextEntry");

    if ((v5 & 1) != 0)
      goto LABEL_5;
    v6 = (void *)MEMORY[0x1E0DBDD20];
    -[UISystemInputViewController textInputTraits](self, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitsForUITextInputTraits:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0DBDCB8];
    objc_msgSend(v3, "recentInputIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recentInputForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UILexicon _lexiconWithTILexicon:](UILexicon, "_lexiconWithTILexicon:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setCachedRecents:](self, "setCachedRecents:", v11);

  }
LABEL_5:
  -[UISystemInputViewController cachedRecents](self, "cachedRecents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    v14 = -[UISystemInputViewController supportsRecentInputsIntegration](self, "supportsRecentInputsIntegration");
  else
    v14 = 0;

  return v14;
}

- (id)constraintFromView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6
{
  return (id)objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, 0, a5, a6, 1.0, 0.0);
}

- (void)updateAlignmentConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (-[UISystemInputViewController willPresentFullscreen](self, "willPresentFullscreen"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController alignmentConstraintForAxis:](self, "alignmentConstraintForAxis:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = (void *)MEMORY[0x1E0D156E0];
      -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController containingView](self, "containingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, v6, 9, 1.0, 0.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      -[UISystemInputViewController setAlignmentConstraint:forAxis:](self, "setAlignmentConstraint:forAxis:", v3, 0);
      objc_msgSend(v22, "addObject:", v3);
    }
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[UIViewController childViewControllers](self, "childViewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController recentsVC](self, "recentsVC");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);

      if (v12)
      {
        -[UISystemInputViewController recentsVC](self, "recentsVC");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "view");
        v14 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v14;
      }
    }
    -[UISystemInputViewController alignmentConstraintForAxis:](self, "alignmentConstraintForAxis:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      objc_msgSend(v15, "firstItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == v7)
      {
LABEL_11:
        -[UISystemInputViewController containingView](self, "containingView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addConstraints:", v22);

        return;
      }
      -[UISystemInputViewController containingView](self, "containingView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeConstraint:", v16);

      -[UISystemInputViewController setAlignmentConstraint:forAxis:](self, "setAlignmentConstraint:forAxis:", 0, 1);
    }
    v19 = (void *)MEMORY[0x1E0D156E0];
    -[UISystemInputViewController containingView](self, "containingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 10, 0, v20, 10, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISystemInputViewController setAlignmentConstraint:forAxis:](self, "setAlignmentConstraint:forAxis:", v16, 1);
    objc_msgSend(v22, "addObject:", v16);
    goto LABEL_11;
  }
}

- (void)updateViewConstraints
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
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
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
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
  void *v82;
  int v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  objc_super v96;
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[4];
  _QWORD v100[4];
  _QWORD v101[2];
  _QWORD v102[3];
  _QWORD v103[5];

  v103[3] = *MEMORY[0x1E0C80C00];
  v96.receiver = self;
  v96.super_class = (Class)UISystemInputViewController;
  -[UIViewController updateViewConstraints](&v96, sel_updateViewConstraints);
  -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UISystemInputViewController recentsVC](self, "recentsVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDescendantOfView:", v3);

  v83 = v6;
  if (v6)
  {
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = v7;
    objc_msgSend(v7, "view");
    v15 = objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  -[UISystemInputViewController inputVC](self, "inputVC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDescendantOfView:", v3);

  if (v10)
  {
    -[UISystemInputViewController inputVC](self, "inputVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[UISystemInputViewController keyboardVC](self, "keyboardVC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isDescendantOfView:", v3);

  if (v13)
  {
    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v15 = 0;
LABEL_8:
  -[UISystemInputViewController editorVC](self, "editorVC");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "view");
  v17 = objc_claimAutoreleasedReturnValue();

  -[UISystemInputViewController _accessoryViewControllerForEdge:](self, "_accessoryViewControllerForEdge:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = objc_claimAutoreleasedReturnValue();

  -[UISystemInputViewController _accessoryViewControllerForEdge:](self, "_accessoryViewControllerForEdge:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = objc_claimAutoreleasedReturnValue();

  -[UISystemInputViewController _accessoryViewControllerForEdge:](self, "_accessoryViewControllerForEdge:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = objc_claimAutoreleasedReturnValue();

  -[UISystemInputViewController _accessoryViewControllerForEdge:](self, "_accessoryViewControllerForEdge:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = objc_claimAutoreleasedReturnValue();

  v88 = (void *)v19;
  if (v19)
    v26 = (void *)v19;
  else
    v26 = v3;
  if (v17)
    v26 = (void *)v17;
  v87 = v26;
  if (v87 == v3)
    v27 = 3;
  else
    v27 = 4;
  v93 = (void *)v23;
  if (v23)
    v28 = (void *)v23;
  else
    v28 = v3;
  if (v23)
    v29 = 2;
  else
    v29 = 1;
  v89 = v29;
  v86 = v28;
  v92 = (void *)v25;
  if (v25)
    v30 = (void *)v25;
  else
    v30 = v3;
  if (v25)
    v31 = 1;
  else
    v31 = 2;
  v85 = v30;
  if (v15)
    v32 = (void *)v15;
  else
    v32 = v3;
  v91 = v32;
  v94 = (void *)v21;
  if (v21)
    v33 = (void *)v21;
  else
    v33 = (void *)v15;
  v34 = v33;
  v35 = (void *)v15;
  v90 = v34;
  v95 = (void *)v17;
  if (v15)
  {
    -[UISystemInputViewController keyboardConstraints](self, "keyboardConstraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      -[UISystemInputViewController keyboardConstraints](self, "keyboardConstraints");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeConstraints:", v37);

    }
    if (v83)
    {
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 1, 1, v86, 1, 1.0, 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v35, 2, -1, v85, 2, 1.0, 0.0);
    }
    else
    {
      -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v35, 1, v86, v89);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v35, 2, v85, v31);
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v35, 3, v87, v27);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v38;
    v103[1] = v39;
    v103[2] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput"))
    {
      objc_msgSend(v35, "superview");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v35, 9, v42, 9);
      v43 = v38;
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "arrayByAddingObject:", v44);
      v45 = objc_claimAutoreleasedReturnValue();

      v38 = v43;
      v41 = (void *)v45;
    }
    if (!v94)
    {
      objc_msgSend(v3, "safeAreaLayoutGuide");
      v84 = v38;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "bottomAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bottomAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v84;
      objc_msgSend(v41, "arrayByAddingObject:", v49);
      v50 = objc_claimAutoreleasedReturnValue();

      v34 = v90;
      v41 = (void *)v50;
    }
    -[UISystemInputViewController setKeyboardConstraints:](self, "setKeyboardConstraints:", v41);
    -[UISystemInputViewController keyboardConstraints](self, "keyboardConstraints");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addConstraints:", v51);

    v17 = (uint64_t)v95;
  }
  if (v17)
  {
    -[UISystemInputViewController editorConstraints](self, "editorConstraints");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[UISystemInputViewController editorConstraints](self, "editorConstraints");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeConstraints:", v53);

    }
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v95, 1, v86, v89);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v95, 7, v91, 7);
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    if (v88)
    {
      v101[0] = v54;
      v101[1] = v55;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController setEditorConstraints:](self, "setEditorConstraints:", v57);
    }
    else
    {
      -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v95, 3, v3, 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v102[0] = v54;
      v102[1] = v56;
      v102[2] = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController setEditorConstraints:](self, "setEditorConstraints:", v58);

    }
    -[UISystemInputViewController editorConstraints](self, "editorConstraints");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addConstraints:", v59);

  }
  if (v88)
  {
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v88, 1, v86, v89);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v88, 7, v91, 7);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v88, 3, v3, 3);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
      v63 = v95;
    else
      v63 = v35;
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v88, 4, v63, 3);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v60;
    v100[1] = v61;
    v100[2] = v62;
    v100[3] = v64;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setConstraints:forEdge:](self, "setConstraints:forEdge:", v65, 0);

    v34 = v90;
  }
  v66 = v94;
  if (v94)
  {
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v94, 1, v86, v89);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v94, 7, v91, 7);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      v69 = v35;
    else
      v69 = v95;
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v94, 3, v69, 4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v94, 4, v3, 4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v67;
    v99[1] = v68;
    v99[2] = v70;
    v99[3] = v71;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setConstraints:forEdge:](self, "setConstraints:forEdge:", v72, 2);

    v34 = v90;
    v66 = v94;

  }
  v73 = v93;
  if (v93)
  {
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v93, 3, v3, 3);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v93, 4, v34, 4);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v93, 1, v3, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v74;
    v98[1] = v75;
    v98[2] = v76;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 3);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setConstraints:forEdge:](self, "setConstraints:forEdge:", v77, 1);

    v34 = v90;
    v73 = v93;

  }
  v78 = v92;
  if (v92)
  {
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v92, 3, v3, 3);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v92, 4, v34, 4);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController constraintFromView:attribute:toView:attribute:](self, "constraintFromView:attribute:toView:attribute:", v92, 2, v3, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v79;
    v97[1] = v80;
    v97[2] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 3);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setConstraints:forEdge:](self, "setConstraints:forEdge:", v82, 3);

    v34 = v90;
    v73 = v93;

    v78 = v92;
  }

}

- (id)constraintsForEdge:(int64_t)a3
{
  NSMutableDictionary *accessoryConstraints;
  void *v4;
  void *v5;

  accessoryConstraints = self->_accessoryConstraints;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessoryConstraints, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setConstraints:(id)a3 forEdge:(int64_t)a4
{
  void *v6;
  void *v7;
  NSMutableDictionary *accessoryConstraints;
  void *v9;
  id v10;

  v10 = a3;
  -[UISystemInputViewController constraintsForEdge:](self, "constraintsForEdge:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeConstraints:", v6);

  }
  accessoryConstraints = self->_accessoryConstraints;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSMutableDictionary setObject:forKey:](accessoryConstraints, "setObject:forKey:", v10, v9);

    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConstraints:", v10);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](accessoryConstraints, "removeObjectForKey:", v9);
  }

}

- (void)_addAccessoryViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v9 = a3;
    -[UIViewController addChildViewController:](self, "addChildViewController:", v9);
    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bringSubviewToFront:", v8);

    objc_msgSend(v9, "didMoveToParentViewController:", self);
  }
}

- (void)_removeAccessoryViewController:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(v4, "removeFromParentViewController");
  }
}

- (unint64_t)_verticalLayoutTypeForEdge:(int64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 3;
  else
    return 1;
}

- (unint64_t)_horizontalLayoutTypeForEdge:(int64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    return 1;
  else
    return 3;
}

- (id)_accessoryViewControllerForEdge:(int64_t)a3
{
  NSMutableDictionary *accessoryViewControllers;
  void *v4;
  void *v5;

  accessoryViewControllers = self->_accessoryViewControllers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accessoryViewControllers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessoryViewControllerForEdge:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[UISystemInputViewController _accessoryViewControllerForEdge:](self, "_accessoryViewControllerForEdge:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAccessoryViewController:(id)a3 forEdge:(int64_t)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *accessoryViewControllers;
  NSMutableDictionary *v8;
  NSMutableDictionary *accessoryConstraints;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  if (!self->_accessoryViewControllers)
  {
    v6 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    accessoryViewControllers = self->_accessoryViewControllers;
    self->_accessoryViewControllers = v6;

    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    accessoryConstraints = self->_accessoryConstraints;
    self->_accessoryConstraints = v8;

  }
  -[UISystemInputViewController _accessoryViewControllerForEdge:](self, "_accessoryViewControllerForEdge:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputViewController _removeAccessoryViewController:](self, "_removeAccessoryViewController:", v10);
  if (v15)
  {
    +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:](UIKBSystemLayoutViewController, "systemLayoutViewControllerWithViewController:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVerticalLayoutType:", -[UISystemInputViewController _verticalLayoutTypeForEdge:](self, "_verticalLayoutTypeForEdge:", a4));
    objc_msgSend(v11, "setHorizontalLayoutType:", -[UISystemInputViewController _horizontalLayoutTypeForEdge:](self, "_horizontalLayoutTypeForEdge:", a4));
    v12 = self->_accessoryViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);

    -[UISystemInputViewController _addAccessoryViewController:](self, "_addAccessoryViewController:", v11);
  }
  else
  {
    v14 = self->_accessoryViewControllers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v11);
  }

  -[UISystemInputViewController updateViewConstraints](self, "updateViewConstraints");
}

- (id)alignmentConstraintArrayForAxis:(int64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[UISystemInputViewController verticalAlignments](self, "verticalAlignments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[UISystemInputViewController horizontalAlignments](self, "horizontalAlignments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setAlignmentConstraintArray:(id)a3 forAxis:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = v6;
    -[UISystemInputViewController setVerticalAlignments:](self, "setVerticalAlignments:", v6);
    goto LABEL_5;
  }
  if (!a4)
  {
    v7 = v6;
    -[UISystemInputViewController setHorizontalAlignments:](self, "setHorizontalAlignments:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (id)alignmentConstraintForAxis:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 == 1)
  {
    -[UISystemInputViewController verticalAlignments](self, "verticalAlignments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v5 = 0;
      return v5;
    }
    -[UISystemInputViewController horizontalAlignments](self, "horizontalAlignments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAlignmentConstraint:(id)a3 forAxis:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 == 1)
  {
    if (!v6)
    {
      -[UISystemInputViewController setVerticalAlignments:](self, "setVerticalAlignments:", 0);
      goto LABEL_10;
    }
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setVerticalAlignments:](self, "setVerticalAlignments:", v8);
LABEL_7:

    goto LABEL_10;
  }
  if (!a4)
  {
    if (!v6)
    {
      -[UISystemInputViewController setHorizontalAlignments:](self, "setHorizontalAlignments:", 0);
      goto LABEL_10;
    }
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController setHorizontalAlignments:](self, "setHorizontalAlignments:", v8);
    goto LABEL_7;
  }
LABEL_10:

}

- (void)setPersistentDelegate:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  objc_storeStrong((id *)&self->_persistentDelegate, a3);
  if ((v6 & 1) != 0 || objc_msgSend(v9, "isFirstResponder"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v8);

  }
}

- (void)_resetDelegate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextInputChangesIgnored:", 1);

  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFirstResponder");

  if ((v5 & 1) == 0)
  {
    -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "becomeFirstResponder");

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextInputChangesIgnored:", 0);

  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDelegate:", v13);

    }
  }
}

- (void)_clearCursorLocationIfNotFirstResponder
{
  void *v3;
  char v4;
  id v5;

  -[UISystemInputViewController persistentDelegate](self, "persistentDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if ((v4 & 1) == 0)
  {
    -[UISystemInputViewController keyboard](self, "keyboard");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCursorLocation:", 0);

  }
}

- (void)setupKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[UISystemInputViewController keyboard](self, "keyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setDisableTouchInput:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput") ^ 1);

  -[UISystemInputViewController keyboard](self, "keyboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setUseLinearLayout:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput"));

  -[UISystemInputViewController keyboard](self, "keyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setUseRecentsAlert:", -[UISystemInputViewController supportsRecentInputsIntegration](self, "supportsRecentInputsIntegration") ^ 1);

  -[UISystemInputViewController _resetDelegate](self, "_resetDelegate");
  -[UIViewController _window](self, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UISystemInputViewController keyboardVC](self, "keyboardVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertCurrentInputModeIfNecessary");

  }
  -[UISystemInputViewController configureRecentsVCIfNecessary](self, "configureRecentsVCIfNecessary");
  -[UISystemInputViewController keyboard](self, "keyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isActive");

  if ((v9 & 1) == 0)
  {
    -[UISystemInputViewController keyboard](self, "keyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activate");

    -[UIViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setNeedsLayout");

    -[UISystemInputViewController contentLayoutView](self, "contentLayoutView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

  }
  -[UISystemInputViewController _clearCursorLocationIfNotFirstResponder](self, "_clearCursorLocationIfNotFirstResponder");
  -[UISystemInputViewController keyboard](self, "keyboard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setDisableTouchInput:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput") ^ 1);

  -[UISystemInputViewController keyboard](self, "keyboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setUseRecentsAlert:", -[UISystemInputViewController supportsRecentInputsIntegration](self, "supportsRecentInputsIntegration") ^ 1);

  +[UIDictationController keyboardDidUpdateOnScreenStatus](UIDictationController, "keyboardDidUpdateOnScreenStatus");
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UISystemInputViewController;
  -[UIViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 needsSetupAgain;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UISystemInputViewController;
  -[UIViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  needsSetupAgain = self->_needsSetupAgain;
  if (self->_needsSetupAgain)
  {
    self->_needsSetupAgain = 0;
    -[UISystemInputViewController _addChildInputViewController](self, "_addChildInputViewController");
    -[UISystemInputViewController setupKeyboard](self, "setupKeyboard");
  }
  v5 = 1;
  self->_isVisible = 1;
  -[UISystemInputViewController recentsVC](self, "recentsVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIViewController childViewControllers](self, "childViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputViewController recentsVC](self, "recentsVC");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    v5 = v9 ^ 1;
  }

  if (-[UISystemInputViewController notifyKeyboardOnScreenOnFocusOnly](self, "notifyKeyboardOnScreenOnFocusOnly"))
  {
    -[UISystemInputViewController keyboard](self, "keyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFocused");

  }
  else
  {
    v11 = 1;
  }
  if (needsSetupAgain)
    v12 = v11;
  else
    v12 = 1;
  if ((v5 & v12) == 1)
    -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UISystemInputViewController;
  -[UIViewController viewWillDisappear:](&v13, sel_viewWillDisappear_, a3);
  -[UISystemInputViewController textInputTraits](self, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "forceSpellingDictation") & 1) == 0)
  {
    -[UISystemInputViewController textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!UIKeyboardTypeSupportsDictationSpelling(objc_msgSend(v5, "dictationKeyboardType")))
    {
      -[UISystemInputViewController textInputTraits](self, "textInputTraits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isSecureTextEntry");

      if ((v12 & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }

  }
LABEL_5:
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markKeyboardDidReset");

LABEL_6:
  self->_needsSetupAgain = 1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _responderWindow](self, "_responderWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("_UIWindowWillBecomeApplicationKeyNotification"), v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIResponder _responderWindow](self, "_responderWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("_UIWindowDidBecomeApplicationKeyNotification"), v10);

  self->_isVisible = 0;
  -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[UISystemInputViewController traitCollection](self, "traitCollection");

  v5.receiver = self;
  v5.super_class = (Class)UISystemInputViewController;
  -[UIViewController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);

}

- (void)_didSuspend:(id)a3
{
  void *v4;

  if (self->_isVisible)
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPauseUpdatingHelperMessage:", 1);

    -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 0);
  }
}

- (void)_willResume:(id)a3
{
  void *v4;
  char v5;
  char v6;
  void *v7;
  int v8;
  void *v9;

  if (-[UISystemInputViewController notifyKeyboardOnScreenOnFocusOnly](self, "notifyKeyboardOnScreenOnFocusOnly", a3))
  {
    -[UISystemInputViewController keyboard](self, "keyboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFocused");

    v6 = v5 ^ 1;
  }
  else
  {
    v6 = 0;
  }
  if (self->_isVisible && (v6 & 1) == 0)
  {
    -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 1);
    -[UISystemInputViewController _updateRemoteTextEditingSession](self, "_updateRemoteTextEditingSession");
  }
  -[UISystemInputViewController keyboard](self, "keyboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if (v8)
  {
    -[UISystemInputViewController _resetDelegate](self, "_resetDelegate");
    -[UISystemInputViewController keyboard](self, "keyboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activate");

    -[UISystemInputViewController _clearCursorLocationIfNotFirstResponder](self, "_clearCursorLocationIfNotFirstResponder");
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    self->_isVisible = 0;
    -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)UISystemInputViewController;
  -[UIViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v7, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);

}

- (void)_setSystemInputInteractionActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIInteraction *activeSystemInputInteraction;
  _UISystemInputActivityInteraction *v7;
  UIInteraction *v8;
  void *v9;
  UIInteraction *v10;
  void *v11;

  v3 = a3;
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardOnScreenNotifyKey:", v3);

  activeSystemInputInteraction = self->_activeSystemInputInteraction;
  if (v3)
  {
    if (!activeSystemInputInteraction)
    {
      v7 = objc_alloc_init(_UISystemInputActivityInteraction);
      v8 = self->_activeSystemInputInteraction;
      self->_activeSystemInputInteraction = (UIInteraction *)v7;

      -[UIViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addInteraction:", self->_activeSystemInputInteraction);

    }
  }
  else if (activeSystemInputInteraction)
  {
    -[UIViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeInteraction:", self->_activeSystemInputInteraction);

    v10 = self->_activeSystemInputInteraction;
    self->_activeSystemInputInteraction = 0;

  }
}

+ (id)_canonicalTraitsForResponder:(id)a3
{
  return +[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", a3);
}

- (BOOL)supportsTouchInput
{
  return self->_supportsTouchInput;
}

- (void)setSupportsTouchInput:(BOOL)a3
{
  self->_supportsTouchInput = a3;
}

- (BOOL)supportsRecentInputsIntegration
{
  return self->_supportsRecentInputsIntegration;
}

- (UISystemInputViewControllerDelegate)systemInputViewControllerDelegate
{
  return self->_systemInputViewControllerDelegate;
}

- (BOOL)isAutomaticResponderTransition
{
  return self->_isAutomaticResponderTransition;
}

- (void)setIsAutomaticResponderTransition:(BOOL)a3
{
  self->_isAutomaticResponderTransition = a3;
}

- (UITextInput)persistentDelegate
{
  return self->_persistentDelegate;
}

- (UIKeyboard)keyboard
{
  return self->_keyboard;
}

- (void)setKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_keyboard, a3);
}

- (NSArray)keyboardConstraints
{
  return self->_keyboardConstraints;
}

- (void)setKeyboardConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardConstraints, a3);
}

- (UICompatibilityInputViewController)keyboardVC
{
  return self->_keyboardVC;
}

- (void)setKeyboardVC:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardVC, a3);
}

- (NSArray)editorConstraints
{
  return self->_editorConstraints;
}

- (void)setEditorConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_editorConstraints, a3);
}

- (UIKBSystemLayoutViewController)editorVC
{
  return self->_editorVC;
}

- (void)setEditorVC:(id)a3
{
  objc_storeStrong((id *)&self->_editorVC, a3);
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UIViewController)inputVC
{
  return self->_inputVC;
}

- (UIRecentsInputViewController)recentsVC
{
  return self->_recentsVC;
}

- (NSArray)verticalAlignments
{
  return self->_verticalAlignments;
}

- (void)setVerticalAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_verticalAlignments, a3);
}

- (NSArray)horizontalAlignments
{
  return self->_horizontalAlignments;
}

- (void)setHorizontalAlignments:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalAlignments, a3);
}

- (UITextInput)nextInputDelegate
{
  return self->_nextInputDelegate;
}

- (void)setNextInputDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_nextInputDelegate, a3);
}

- (void)setTextInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTraits, a3);
}

- (UILexicon)cachedRecents
{
  return self->_cachedRecents;
}

- (void)setCachedRecents:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRecents, a3);
}

- (UILabel)_promptLabel
{
  return self->_promptLabel;
}

- (void)set_promptLabel:(id)a3
{
  objc_storeStrong((id *)&self->_promptLabel, a3);
}

- (BOOL)notifyKeyboardOnScreenOnFocusOnly
{
  return self->_notifyKeyboardOnScreenOnFocusOnly;
}

- (void)setNotifyKeyboardOnScreenOnFocusOnly:(BOOL)a3
{
  self->_notifyKeyboardOnScreenOnFocusOnly = a3;
}

- (void)setResolvedKeyboardStyle:(int64_t)a3
{
  self->_resolvedKeyboardStyle = a3;
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (BOOL)willPresentFullscreen
{
  return self->_willPresentFullscreen;
}

- (void)setWillPresentFullscreen:(BOOL)a3
{
  self->_willPresentFullscreen = a3;
}

- (BOOL)willUpdateBackgroundEffectOnInputModeChange
{
  return self->_willUpdateBackgroundEffectOnInputModeChange;
}

- (void)setWillUpdateBackgroundEffectOnInputModeChange:(BOOL)a3
{
  self->_willUpdateBackgroundEffectOnInputModeChange = a3;
}

- (BOOL)didDisplayRecents
{
  return self->_didDisplayRecents;
}

- (void)setDidDisplayRecents:(BOOL)a3
{
  self->_didDisplayRecents = a3;
}

- (UIView)containingView
{
  return self->_containingView;
}

- (void)setContainingView:(id)a3
{
  objc_storeStrong((id *)&self->_containingView, a3);
}

- (UIView)contentLayoutView
{
  return self->_contentLayoutView;
}

- (void)setContentLayoutView:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayoutView, a3);
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayoutView, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_cachedRecents, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_nextInputDelegate, 0);
  objc_storeStrong((id *)&self->_horizontalAlignments, 0);
  objc_storeStrong((id *)&self->_verticalAlignments, 0);
  objc_storeStrong((id *)&self->_recentsVC, 0);
  objc_storeStrong((id *)&self->_inputVC, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_editorVC, 0);
  objc_storeStrong((id *)&self->_editorConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardVC, 0);
  objc_storeStrong((id *)&self->_keyboardConstraints, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_persistentDelegate, 0);
  objc_storeStrong((id *)&self->_activeSystemInputInteraction, 0);
  objc_storeStrong((id *)&self->_remoteInputSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryViewControllers, 0);
}

@end
