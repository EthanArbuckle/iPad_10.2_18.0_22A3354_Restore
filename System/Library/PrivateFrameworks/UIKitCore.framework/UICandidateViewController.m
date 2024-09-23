@implementation UICandidateViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  void *v4;
  char v5;
  void *v7;
  char v8;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_showsScribbleIconsInAssistantView");

  if ((v5 & 1) != 0)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowCandidateBar");

  return v8;
}

+ (double)preferredCandidateBarHeightForTraitCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  uint64_t SafeDeviceIdiom;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v14;
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
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v3 = a3;
  if (!+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "interfaceOrientation");

    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v11, v10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (SafeDeviceIdiom == -1)
      SafeDeviceIdiom = objc_msgSend(v4, "idiom");
    v12 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, SafeDeviceIdiom, 0);
    if ((unint64_t)(v12 - 23) < 4 || v12 == 1)
    {
      +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v3);
      v7 = v14;
      goto LABEL_11;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "candidateController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "screenTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "idiom") != 1)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "candidateController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "screenTraits");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "idiom") == 24)
      {

      }
      else
      {
        v42 = v21;
        v43 = v20;
        v44 = v19;
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "candidateController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "screenTraits");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "idiom") != 25)
        {
          v38 = v24;
          v39 = v23;
          v41 = v22;
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "candidateController");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "screenTraits");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "idiom") == 26)
          {
            v40 = 0;
          }
          else
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "candidateController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "screenTraits");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v27, "idiom") != 23;

          }
          if (v40)
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "candidateController");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "candidateBarHeight");
            v31 = v30;
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "candidateController");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "candidateBarEdgeInsetsForOrientation:", v10);
            v7 = v31 + v34;

            goto LABEL_11;
          }
          goto LABEL_18;
        }

      }
    }

LABEL_18:
    v7 = 42.0;
    goto LABEL_11;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateBarHeight");
  v7 = v6;

LABEL_11:
  return v7;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  double result;

  +[UICandidateViewController preferredCandidateBarHeightForTraitCollection:](UICandidateViewController, "preferredCandidateBarHeightForTraitCollection:", a3);
  return result;
}

- (BOOL)hidesExpandableButton
{
  return 1;
}

- (NSArray)displayedCandidates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "candidateController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateResultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (void)loadView
{
  UIView *v3;
  UIView *v4;

  v3 = [UIView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIViewController setView:](self, "setView:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "loadCandidateBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICandidateViewController setCandidateView:](self, "setCandidateView:", v5);

  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICandidateViewController candidateView](self, "candidateView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

}

- (int64_t)overrideUserInterfaceStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "lightKeyboard"))
    v4 = 1;
  else
    v4 = 2;

  return v4;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateController");
  v44 = (id)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  width = v11;
  v14 = v13;

  v45.origin.x = v8;
  v45.origin.y = v10;
  v45.size.width = width;
  v45.size.height = v14;
  if (!CGRectIsNull(v45))
  {
    v46.origin.x = v8;
    v46.origin.y = v10;
    v46.size.width = width;
    v46.size.height = v14;
    if (!CGRectIsEmpty(v46))
    {
      objc_msgSend(v44, "candidateBarEdgeInsetsForOrientation:", objc_msgSend(v5, "orientation"));
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v23 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 && v23)
      {
        +[UIKeyboardPopoverContainer extraWidth](UIKeyboardPopoverContainer, "extraWidth");
        if (v24 > 0.0)
        {
          v22 = v24 * -0.5;
          v18 = v24 * -0.5;
        }
      }
      if (objc_msgSend(v5, "idiom") || (unint64_t)(objc_msgSend(v5, "orientation") - 3) > 1)
      {
        v14 = v14 - v16 - v20;
      }
      else
      {
        objc_msgSend(v5, "currentKeyplane");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "keyUnionPaddedFrame");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v47.origin.x = v27;
        v47.origin.y = v29;
        v47.size.width = v31;
        v47.size.height = v33;
        v48 = CGRectIntegral(v47);
        width = v48.size.width;
      }
      v34 = width - v18 - v22;
      -[UIViewController view](self, "view");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "bounds");
      v37 = (v36 - v34) * 0.5;

      -[UICandidateViewController candidateView](self, "candidateView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setFrame:", v37, v16, v34, v14);

      -[UICandidateViewController candidateView](self, "candidateView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "superview");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIViewController view](self, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40 != v41)
      {
        -[UIViewController view](self, "view");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[UICandidateViewController candidateView](self, "candidateView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addSubview:", v43);

      }
    }
  }

}

- (UIView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
  objc_storeStrong((id *)&self->_candidateView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateView, 0);
}

@end
