@implementation UIWindowController

+ (void)windowWillBeDeallocated:(id)a3
{
  objc_msgSend((id)__windowToWindowControllerMapTable, "removeObjectForKey:", a3);
}

+ (id)windowControllerForWindow:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UIWindowController *v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)__windowToWindowControllerMapTable;
    if (!__windowToWindowControllerMapTable)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)__windowToWindowControllerMapTable;
      __windowToWindowControllerMapTable = v5;

      v4 = (void *)__windowToWindowControllerMapTable;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v7 = (UIWindowController *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(UIWindowController);
      -[UIWindowController setWindow:](v7, "setWindow:", v3);
      objc_msgSend((id)__windowToWindowControllerMapTable, "setObject:forKey:", v7, v3);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  UITransitionView *transitionView;
  void *v4;
  void *v5;
  objc_super v6;

  transitionView = self->_transitionView;
  if (transitionView)
  {
    -[UIViewController view](self->_fromViewController, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_toViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindowController transitionViewDidComplete:fromView:toView:removeFromView:](self, "transitionViewDidComplete:fromView:toView:removeFromView:", transitionView, v4, v5, 1);

  }
  v6.receiver = self;
  v6.super_class = (Class)UIWindowController;
  -[UIWindowController dealloc](&v6, sel_dealloc);
}

- (CGPoint)_originForViewController:(id)a3 orientation:(int64_t)a4 actualStatusBarHeight:(double)a5 fullScreenLayout:(BOOL)a6 inWindow:(id)a7
{
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id WeakRetained;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;

  v11 = a3;
  v12 = a7;
  if (a6)
  {
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[UIWindowController window](self, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultStatusBarHeightInOrientation:", a4);
    v18 = v17;

    if (v12)
      objc_msgSend(v12, "screen");
    else
      +[UIScreen mainScreen](UIScreen, "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:", a4, v18);
    v13 = v20;
    v14 = v21;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  objc_msgSend(WeakRetained, "convertPoint:fromWindow:", 0, v13, v14);
  v24 = v23;
  v26 = v25;

  v27 = v24;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (CGSize)_flipSize:(CGSize)a3
{
  CGFloat width;
  double height;
  double v5;
  CGSize result;

  width = a3.width;
  height = a3.height;
  v5 = width;
  result.height = v5;
  result.width = height;
  return result;
}

- (CGRect)_boundsForViewController:(id)a3 transition:(int)a4 orientation:(int64_t)a5 fullScreenLayout:(BOOL)a6 inWindow:(id)a7
{
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id WeakRetained;
  char v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect result;

  v11 = a3;
  v12 = a7;
  v13 = v12;
  if (!v12)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_window);
    v23 = objc_msgSend(WeakRetained, "_isHostedInAnotherProcess");

    if ((v23 & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)&self->_window);
      objc_msgSend(v24, "bounds");
      v15 = v25;
      v17 = v26;
      v19 = v27;
      v21 = v28;

      goto LABEL_17;
    }
    if (a6)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_11:
    -[UIWindowController window](self, "window");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "defaultStatusBarHeightInOrientation:", a5);
    v38 = v37;

    if (v13)
      objc_msgSend(v13, "screen");
    else
      +[UIScreen mainScreen](UIScreen, "mainScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:", a5, v38);
    v19 = v40;
    v21 = v41;

    v15 = *MEMORY[0x1E0C9D538];
    v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    goto LABEL_15;
  }
  if ((objc_msgSend(v12, "_isHostedInAnotherProcess") & 1) != 0)
  {
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    goto LABEL_17;
  }
  if (!a6)
    goto LABEL_11;
  objc_msgSend(v13, "screen");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v30 = v29;
  objc_msgSend(v29, "bounds");
  v15 = v31;
  v17 = v32;
  v19 = v33;
  v21 = v34;

LABEL_15:
  if ((unint64_t)(a5 - 3) <= 1)
  {
    -[UIWindowController _flipSize:](self, "_flipSize:", v19, v21);
    v19 = v42;
    v21 = v43;
  }
LABEL_17:

  v44 = v15;
  v45 = v17;
  v46 = v19;
  v47 = v21;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (void)_prepareKeyboardForTransition:(int)a3 fromView:(id)a4
{
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "durationForTransition:", v4);
  v6 = v5;
  objc_msgSend(v12, "keyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UIKeyboardAutomaticIsOffScreen() & 1) == 0)
  {
    objc_msgSend(v7, "responder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "_containsResponder:", v8);

    if (v9)
    {
      objc_msgSend(v7, "_beginIgnoringReloadInputViews");
      objc_msgSend(v7, "setAutomaticAppearanceInternalEnabled:", 0);
      objc_msgSend(v12, "endEditing:", 1);
      objc_msgSend(v7, "setAutomaticAppearanceInternalEnabled:", 1);
      objc_msgSend(v7, "_endIgnoringReloadInputViews");
      v10 = +[UIViewController _keyboardDirectionForTransition:](UIViewController, "_keyboardDirectionForTransition:", v4);
      if (objc_msgSend(v7, "currentState") != 2)
        objc_msgSend(v7, "forceOrderOutAutomaticToDirection:withDuration:", v10, v6);
    }
  }
  if ((_DWORD)v4)
  {
    +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", 1, +[UIViewController _keyboardDirectionForTransition:](UIViewController, "_keyboardDirectionForTransition:", v4), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushAnimationStyle:", v11);

  }
}

- (void)_transplantView:(id)a3 toSuperview:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "keyboardSceneDelegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutomaticAppearanceInternalEnabled:", 0);
  objc_opt_self();
  ++__disablePromoteDescendantToFirstResponderCount;
  objc_msgSend(v7, "insertSubview:atIndex:", v8, a5);

  objc_opt_self();
  if (__disablePromoteDescendantToFirstResponderCount)
    --__disablePromoteDescendantToFirstResponderCount;
  objc_msgSend(v9, "setAutomaticAppearanceInternalEnabled:", 1);

}

- (void)_transition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7
{
  -[UIWindowController _transition:fromViewController:toViewController:target:didFinish:animation:](self, "_transition:fromViewController:toViewController:target:didFinish:animation:", *(_QWORD *)&a3, a4, a5, a6, a7, 0);
}

- (void)_transition:(int)a3 fromViewController:(id)a4 toViewController:(id)a5 target:(id)a6 didFinish:(int64_t)a7 animation:(id)a8
{
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _UIViewControllerOneToOneTransitionContext *v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  char v24;
  _BOOL4 presenting;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  int isKindOfClass;
  void *v31;
  UIViewController *v32;
  _BOOL4 v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  _QWORD *v39;
  UIViewController *v40;
  uint64_t v41;
  void *v42;
  char v43;
  UIViewController *v44;
  uint64_t v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  BOOL v52;
  _BOOL4 v53;
  void *v54;
  BOOL v55;
  int v56;
  _BOOL4 v57;
  UIViewController *v58;
  void *v59;
  BOOL v60;
  int v61;
  id v62;
  _BOOL4 v63;
  _BOOL4 v64;
  _BOOL4 v65;
  _BOOL4 v66;
  _BOOL4 v67;
  _BOOL4 v68;
  _BOOL4 v69;
  int v70;
  uint64_t v71;
  id v72;
  id v73;
  UIViewController *v74;
  void *v75;
  UIViewController *v76;
  void *v77;
  _BOOL4 v78;
  void *v79;
  _BOOL4 v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  UITransitionView *v89;
  UITransitionView *transitionView;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  int v98;
  int v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat width;
  double v106;
  CGFloat height;
  int v108;
  void *v109;
  _BOOL4 v110;
  void *v111;
  uint64_t v112;
  id v113;
  void *v114;
  char v115;
  __int128 v116;
  UITransitionView *v117;
  char v118;
  UIViewController *v119;
  id v120;
  id v121;
  void (**v122)(void);
  void *v123;
  void *v124;
  double v125;
  double v126;
  int v127;
  _BOOL4 v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  void *v134;
  double v135;
  void *v136;
  BOOL v137;
  uint64_t v138;
  void *v139;
  double *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  void (**v156)(void);
  id v157;
  _UIViewControllerOneToOneTransitionContext *v158;
  id v159;
  id v160;
  void *v161;
  void *v162;
  char v163;
  __int128 v164;
  __int128 v165;
  _BOOL4 v166;
  _BOOL4 v167;
  __int128 v168;
  id v169;
  UIViewController *v171;
  _BOOL4 v172;
  int v173;
  _BOOL4 v174;
  int v175;
  id v176;
  id val;
  void (**v178)(void);
  _BOOL4 v179;
  char v180;
  unint64_t v181;
  id v182;
  _QWORD *v183;
  _BOOL4 v184;
  _BOOL4 v185;
  int v186;
  void *v187;
  int v188;
  _BOOL4 v189;
  _UIViewControllerOneToOneTransitionContext *v190;
  UIViewController *v192;
  UIViewController *v193;
  _QWORD v194[5];
  id v195;
  _UIViewControllerOneToOneTransitionContext *v196;
  UIViewController *v197;
  UIViewController *v198;
  id v199;
  id v200;
  id v201;
  void (**v202)(void);
  double v203;
  int64_t v204;
  int v205;
  BOOL v206;
  char v207;
  char v208;
  BOOL v209;
  BOOL v210;
  BOOL v211;
  _QWORD v212[5];
  id v213;
  id v214;
  _QWORD *v215;
  id v216;
  char v217;
  char v218;
  _QWORD v219[4];
  void (**v220)(void);
  _QWORD aBlock[5];
  UIViewController *v222;
  id v223;
  id v224;
  id v225;
  id v226;
  CGAffineTransform *v227;
  uint64_t v228;
  void *v229;
  double v230;
  double v231;
  CGFloat v232;
  CGFloat v233;
  CGAffineTransform v234;
  int v235;
  char v236;
  char v237;
  char v238;
  char v239;
  char v240;
  _OWORD v241[3];
  _OWORD v242[3];
  CGAffineTransform v243;
  CGAffineTransform v244;
  CGAffineTransform v245;
  CGAffineTransform v246;
  CGAffineTransform v247;
  __CFString *v248;
  _QWORD v249[4];
  CGRect v250;
  CGRect v251;

  v249[1] = *MEMORY[0x1E0C80C00];
  v193 = (UIViewController *)a4;
  v192 = (UIViewController *)a5;
  v176 = a6;
  v178 = (void (**)(void))a8;
  if (self->_currentTransition)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIWindowController.m"), 237, CFSTR("Attempting to begin a modal transition from %@ to %@ while a transition is already in progress. Wait for viewDidAppear/viewDidDisappear to know the current transition has completed"), v193, v192);

    if (self->_fromViewController == v193 && self->_toViewController == v192)
      goto LABEL_239;
  }
  v14 = -[UIViewController modalPresentationStyle](v192, "modalPresentationStyle");
  v15 = -[UIViewController modalPresentationStyle](v193, "modalPresentationStyle");
  v16 = -[UIViewController interfaceOrientation](v193, "interfaceOrientation");
  if (!a3 && v14 != 4)
  {
    v190 = 0;
    v173 = 0;
    v17 = 0;
LABEL_11:
    v180 = 0;
    v21 = 0;
    goto LABEL_12;
  }
  -[UIWindowController _transitionController](self, "_transitionController");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v190 = 0;
    v173 = 0;
    goto LABEL_11;
  }
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
  -[_UIViewControllerTransitionContext _setAnimator:](v20, "_setAnimator:", v17);
  v190 = v20;
  if (v18 == v19)
  {
    -[_UIViewControllerTransitionContext _setCompletionCurve:](v20, "_setCompletionCurve:", 7);
    v180 = 0;
    v21 = 0;
    v173 = 1;
  }
  else
  {
    v173 = 1;
    v21 = 4;
    v180 = 1;
  }
LABEL_12:
  v22 = 3;
  if (v14 != 15)
    v22 = v14;
  if (v22 == 4)
    v22 = v21;
  if (v15 == 4)
    v23 = v21;
  else
    v23 = v15;
  self->_toModalStyle = v22;
  v187 = (void *)v22;
  v181 = v23;
  val = v17;
  if (self->_presenting)
  {
    if (v22 != 3 && v22 != 18)
    {
      v24 = 0;
      presenting = 1;
LABEL_26:
      v184 = presenting;
      goto LABEL_27;
    }
LABEL_25:
    -[UIViewController view](v193, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "superview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = objc_opt_isKindOfClass() ^ 1;

    presenting = self->_presenting;
    goto LABEL_26;
  }
  if (v23 == 18 || v23 == 3)
    goto LABEL_25;
  v184 = 0;
  v24 = 0;
LABEL_27:
  -[UIWindowController window](self, "window");
  v28 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_delegateViewController");
  v171 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  if (self->_presenting)
  {
    -[UIViewController presentingViewController](v193, "presentingViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      isKindOfClass = 0;
      v31 = v187;
    }
    else
    {
      -[UIViewController _rootAncestorViewController](v193, "_rootAncestorViewController");
      v32 = (UIViewController *)objc_claimAutoreleasedReturnValue();
      if (v171 == v32)
      {
        isKindOfClass = 0;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
      }
      v31 = v187;

    }
  }
  else
  {
    isKindOfClass = v171 == v193;
    v31 = v187;
  }
  v188 = v24 & 1;
  v33 = !(v24 & 1);
  if (v184)
    v33 = 1;
  v167 = v33;
  if (!v33)
  {
    v34 = -[UIViewController definesPresentationContext](v192, "definesPresentationContext");
    if (v31 == (void *)3 && v34)
      -[UIViewController setDefinesPresentationContext:](v193, "setDefinesPresentationContext:", -[UIViewController _isPresentationContextByDefault](v193, "_isPresentationContextByDefault"));
  }
  if ((isKindOfClass & 1) != 0)
  {
    if (v184)
    {
      if (!v31)
      {
        -[UIViewController _existingView](v193, "_existingView");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "superview");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "frame");
        v38 = v37;

        if (v38 != 0.0)
        {
          objc_msgSend(v28, "_delegateViewController");
          v39 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "_addRotationViewController:", v39);
          if (v192)
            objc_storeWeak((id *)&v192->_previousRootViewController, v39);
          objc_msgSend(v28, "_setDelegateViewController:", v192);
          v39[46] &= ~0x100uLL;
          *(_QWORD *)&v192->_viewControllerFlags |= 0x100uLL;
LABEL_55:

        }
      }
    }
    else if (!v181)
    {
      -[UIViewController _previousRootViewController]((id *)&v193->super.super.isa);
      v39 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v28, "_removeRotationViewController:", v39);
        objc_msgSend(v28, "_setDelegateViewController:", v39);
        v40 = v39;

        *(_QWORD *)&v40->_viewControllerFlags |= 0x100uLL;
        v171 = v40;
      }
      *(_QWORD *)&v193->_viewControllerFlags &= ~0x100uLL;
      goto LABEL_55;
    }
  }
  v41 = objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", v28);
  if ((v24 & 1) == 0
    && ((-[UIViewController _ancestorViewControllerIsInPopover](v193, "_ancestorViewControllerIsInPopover") | isKindOfClass) & 1) != 0)
  {
    v16 = v41;
  }
  objc_msgSend(v28, "screen");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "_isEmbeddedScreen");

  if ((v43 & 1) != 0)
  {
    v44 = v192;
    v45 = -[UIViewController _preferredInterfaceOrientationForPresentationInWindow:fromInterfaceOrientation:](v192, v28, v16);
    if ((isKindOfClass & 1) == 0)
      goto LABEL_66;
  }
  else
  {
    v45 = objc_msgSend((id)UIApp, "_statusBarOrientationForWindow:", v28);
    v44 = v192;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_66;
  }
  if ((objc_msgSend(v28, "_shouldAutorotateToInterfaceOrientation:", v45) & 1) == 0)
  {
    v45 = v16;
    if (v44)
    {
      v44->_lastKnownInterfaceOrientation = v16;
      v45 = v16;
    }
  }
LABEL_66:
  if (v41 == v45 || v187 && v181 <= 0x10 && ((1 << v181) & 0x10006) != 0)
  {
    v46 = 0;
  }
  else if (-[UIViewController _ignoreAppSupportedOrientations](v44, "_ignoreAppSupportedOrientations"))
  {
    v46 = 1;
  }
  else
  {
    -[UIViewController _rootAncestorViewController](v193, "_rootAncestorViewController");
    v58 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    v46 = v171 == v58;

    v44 = v192;
  }
  objc_msgSend(v28, "_setRotatableClient:toOrientation:updateStatusBar:duration:force:isRotating:", v44, v45, v46, 0, 0, 0.0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = CFSTR("_UIWindowContentWillRotateOrientationUserInfoKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v45);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v249[0] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v249, &v248, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "postNotificationName:object:userInfo:", 0x1E1764C40, v28, v49);

  if ((isKindOfClass & 1) != 0)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "userInterfaceIdiom");

    v52 = (v51 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    v52 = 0;
  }
  if (!self->_presenting)
  {
    v186 = 0;
    goto LABEL_90;
  }
  if (-[UIViewController _isModalSheet](v192, "_isModalSheet"))
  {
    v53 = 1;
LABEL_80:
    v186 = v53;
    goto LABEL_90;
  }
  if (v52)
  {
    v53 = v187 == 0;
    goto LABEL_80;
  }
  -[UIViewController _popoverController](v193, "_popoverController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
    v55 = v187 == 0;
  else
    v55 = 0;
  v56 = v55;
  v186 = v56;

LABEL_90:
  if (v184)
  {
    v175 = 0;
    goto LABEL_105;
  }
  if (-[UIViewController _isModalSheet](v193, "_isModalSheet"))
  {
    v57 = 1;
LABEL_96:
    v175 = v57;
    goto LABEL_105;
  }
  if (v52)
  {
    v57 = v181 == 0;
    goto LABEL_96;
  }
  -[UIViewController _popoverController](v192, "_popoverController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    v60 = v181 == 0;
  else
    v60 = 0;
  v61 = v60;
  v175 = v61;

LABEL_105:
  v62 = 0;
  v63 = !v184;
  v64 = self->_presenting;
  v65 = v187 == (void *)17;
  v66 = v181 == 17 && !v184;
  v174 = v66;
  v67 = v187 == (void *)18;
  v68 = v181 != 18 || v184;
  v166 = v68;
  if (!self->_presenting)
  {
    v65 = 0;
    v67 = 0;
  }
  v172 = v67;
  v69 = self->_presenting && v187 == (void *)4;
  if (v181 != 4)
    v63 = 0;
  v185 = v63;
  v179 = v65;
  v70 = v186 | v65;
  v189 = v69;
  if (((v186 | v65) & 1) == 0 && !v69)
  {
    -[UIViewController _visibleView](v193, "_visibleView");
    v62 = (id)objc_claimAutoreleasedReturnValue();

    v64 = self->_presenting;
  }
  if (v187 != (void *)3 && v64 && v181 == 3)
  {

    v62 = 0;
  }
  if (v188)
  {
    -[UIViewController view](v193, "view");
    v71 = objc_claimAutoreleasedReturnValue();

    v62 = (id)v71;
  }
  if ((v186 & 1) != 0 || !v62)
  {
    -[UIViewController view](v193, "view");
    v72 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "window");
    v73 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v62, "superview");
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v73 = v72;
  }

  if (v185 || v189)
  {
    if (self->_presenting)
      v74 = v193;
    else
      v74 = v192;
    -[UIViewController customTransitioningView](v74, "customTransitioningView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "superview");
    v182 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_presenting)
      v76 = v193;
    else
      v76 = v192;
    -[UIViewController customTransitioningView](v76, "customTransitioningView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_transitionView, v77);

  }
  else
  {
    v182 = v73;
  }
  v78 = (!v186
      || -[UIViewController _preferredInterfaceOrientationGivenCurrentOrientation:](v193, "_preferredInterfaceOrientationGivenCurrentOrientation:", v45) != v45)&& v16 != v45;
  -[UIWindowController _interactionController](self, "_interactionController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79 == 0;

  if (v80)
    objc_msgSend((id)UIApp, "beginIgnoringInteractionEvents");
  objc_msgSend(v182, "bounds");
  if (!self->_transitionView)
  {
    v85 = v81;
    v86 = v82;
    v87 = v83;
    v88 = v84;
    v89 = -[UITransitionView initWithFrame:]([UITransitionView alloc], "initWithFrame:", v81, v82, v83, v84);
    transitionView = self->_transitionView;
    self->_transitionView = v89;

    -[UITransitionView setBounds:](self->_transitionView, "setBounds:", v85, v86, v87, v88);
    -[UITransitionView setDelegate:](self->_transitionView, "setDelegate:", self);
    if (v188)
    {
      if (-[UIViewController _isModalSheet](v193, "_isModalSheet")
        || -[UIViewController _isModalSheet](v192, "_isModalSheet"))
      {
        -[UIView layer](self->_transitionView, "layer");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIViewController view](v193, "view");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "layer");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "cornerRadius");
        objc_msgSend(v91, "setCornerRadius:");

        -[UIViewController view](v193, "view");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "layer");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setMasksToBounds:", objc_msgSend(v95, "masksToBounds"));

      }
    }
  }
  -[UIWindowController _interactionController](self, "_interactionController");
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
    -[UITransitionView setIgnoresInteractionEvents:](self->_transitionView, "setIgnoresInteractionEvents:", 0);
  -[UITransitionView setShouldNotifyDidCompleteImmediately:](self->_transitionView, "setShouldNotifyDidCompleteImmediately:", 1);
  switch(v45)
  {
    case 1:
      v97 = 0.0;
      break;
    case 3:
      v97 = 1.57079633;
      break;
    case 4:
      v97 = -1.57079633;
      break;
    case 2:
      v97 = 3.14159265;
      break;
    default:
      v97 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v246, v97);
  *(float64x2_t *)&v246.a = vrndaq_f64(*(float64x2_t *)&v246.a);
  *(float64x2_t *)&v246.c = vrndaq_f64(*(float64x2_t *)&v246.c);
  *(float64x2_t *)&v246.tx = vrndaq_f64(*(float64x2_t *)&v246.tx);
  v247 = v246;
  v98 = objc_msgSend(v28, "_isHostedInAnotherProcess");
  v99 = v45 == 1 || v78;
  -[UIView bounds](self->_transitionView, "bounds");
  v101 = v100;
  v103 = v102;
  width = v104;
  height = v106;
  v108 = (v189 || v185) | v98 | v99;
  if (((v108 | v188) & 1) == 0)
  {
    memset(&v245, 0, sizeof(v245));
    +[UIScreen transformForScreenOriginRotation:](UIScreen, "transformForScreenOriginRotation:", v97);
    v244 = v245;
    v250.origin.x = v101;
    v250.origin.y = v103;
    v250.size.width = width;
    v250.size.height = height;
    v251 = CGRectApplyAffineTransform(v250, &v244);
    width = v251.size.width;
    height = v251.size.height;
    -[UITransitionView setBounds:](self->_transitionView, "setBounds:", v101, v103);
    v243 = v247;
    -[UIView setTransform:](self->_transitionView, "setTransform:", &v243);
    if (v28)
    {
      if (!v28[63])
        v28[63] = v45;
    }
  }
  -[UIView superview](self->_transitionView, "superview");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109 == 0;

  if (v110)
  {
    if (v70)
    {
      objc_msgSend(v182, "addSubview:", self->_transitionView);
    }
    else
    {
      objc_msgSend(v182, "subviews");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v111, "indexOfObjectIdenticalTo:", v62);

      objc_msgSend(v182, "insertSubview:atIndex:", self->_transitionView, v112);
    }
  }
  if (((v175 | v174) & 1) != 0)
  {
    v113 = 0;
  }
  else
  {
    -[UIViewController _visibleView](v192, "_visibleView");
    v113 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v167 || v185)
  {
    -[UIViewController view](v192, "view");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_182;
  }
  if (v187 == (void *)3 && !v184 && v181 != 3)
  {
    v114 = 0;
LABEL_182:

    goto LABEL_184;
  }
  v114 = v113;
LABEL_184:
  v115 = v108 ^ 1;
  if ((v115 & 1) != 0 || v188)
  {
    v116 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v242[0] = *MEMORY[0x1E0C9BAA8];
    v168 = v242[0];
    v164 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v165 = v116;
    v242[1] = v116;
    v242[2] = v164;
    objc_msgSend(v62, "setTransform:", v242);
    v117 = self->_transitionView;
    objc_msgSend(v62, "center");
    -[UIView convertPoint:fromView:](v117, "convertPoint:fromView:", v182);
    objc_msgSend(v62, "setCenter:");
    v241[0] = v168;
    v241[1] = v165;
    v241[2] = v164;
    objc_msgSend(v114, "setTransform:", v241);
  }
  v245.a = 0.0;
  *(_QWORD *)&v245.b = &v245;
  *(_QWORD *)&v245.c = 0x2020000000;
  LOBYTE(v245.d) = 1;
  if (v62)
    v118 = v185;
  else
    v118 = 1;
  if ((v118 & 1) == 0)
    -[UIWindowController _transplantView:toSuperview:atIndex:](self, "_transplantView:toSuperview:atIndex:", v62, self->_transitionView, 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke;
  aBlock[3] = &unk_1E16C2808;
  aBlock[4] = self;
  v227 = &v245;
  v236 = v186;
  v237 = v115;
  v238 = v188;
  v228 = v45;
  v229 = v187;
  v119 = v192;
  v222 = v119;
  v120 = v62;
  v223 = v120;
  v121 = v114;
  v224 = v121;
  v235 = a3;
  v230 = v101;
  v231 = v103;
  v232 = width;
  v233 = height;
  v169 = v182;
  v225 = v169;
  v183 = v28;
  v226 = v183;
  v239 = v98;
  v234 = v247;
  v240 = v180;
  v122 = (void (**)(void))_Block_copy(aBlock);
  v122[2]();
  -[UIView window](self->_transitionView, "window");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "statusBarHeight");
  v126 = v125;

  self->_needsDidDisappear = 0;
  v127 = a3 == 13 || v172;
  if ((((v186 | v189) | v179) & 1) == 0 && (v127 & 1) == 0)
  {
    -[UIViewController beginAppearanceTransition:animated:](v193, "beginAppearanceTransition:animated:", 0, a3 != 0);
    self->_needsDidDisappear = 1;
  }
  self->_needsDidAppear = 0;
  v128 = a3 != 14 && v166;
  if ((v185 | v175 | v174) != 1 && v128)
  {
    -[UIViewController beginAppearanceTransition:animated:](v119, "beginAppearanceTransition:animated:", 1, a3 != 0);
    self->_needsDidAppear = 1;
  }
  -[UIView window](self->_transitionView, "window");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "statusBarHeight");
  v132 = v131;

  if (v126 != v132)
  {
    ((void (*)(void (**)(void)))v122[2])(v122);
    -[UIView window](self->_transitionView, "window");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "statusBarHeight");
    v126 = v135;

  }
  if ((v188 & 1) == 0 && (objc_msgSend((id)UIApp, "_hasApplicationCalledLaunchDelegate") & 1) == 0)
    objc_msgSend(v183, "_updateToInterfaceOrientation:duration:force:", v45, 0, 0.0);
  -[UIWindowController _interactionController](self, "_interactionController");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v136 != 0;

  v138 = (a3 != 14) & (((v189 || v179) | v127) ^ 1u);
  if (v173)
  {
    -[UIWindowController _setInteractiveTransition:](self, "_setInteractiveTransition:", 0);
    if (v136)
      -[UIWindowController _setInteractiveTransition:](self, "_setInteractiveTransition:", 1);
    if (v184)
      v139 = v187;
    else
      v139 = (void *)v181;
    if ((v180 & 1) == 0)
    {
      objc_msgSend(val, "setToView:", v121);
      objc_msgSend(val, "setFromView:", v120);
      objc_msgSend(val, "setRemoveFromView:", v138);
    }
    -[_UIViewControllerTransitionContext _setPresentationStyle:](v190, "_setPresentationStyle:", v139);
    -[_UIViewControllerTransitionContext _setIsPresentation:](v190, "_setIsPresentation:", v189);
    -[_UIViewControllerTransitionContext _setIsAnimated:](v190, "_setIsAnimated:", a3 != 0);
    -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v190, "_setFromViewController:", v193);
    -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v190, "_setToViewController:", v119);
    -[_UIViewControllerTransitionContext _setContainerView:](v190, "_setContainerView:", self->_transitionView);
    v140 = (double *)MEMORY[0x1E0C9D648];
    if (v189)
    {
      v141 = *MEMORY[0x1E0C9D648];
      v142 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v143 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v144 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      -[UIViewController view](v119, "view");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "frame");
    }
    -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v190, "_setToEndFrame:", v141, v142, v143, v144);
    if (!v189)

    -[UIViewController view](v193, "view");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "frame");
    -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v190, "_setFromStartFrame:");

    v146 = *v140;
    v147 = v140[1];
    v148 = v140[2];
    v149 = v140[3];
    -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v190, "_setToStartFrame:", *v140, v147, v148, v149);
    if ((v138 & 1) == 0)
    {
      -[UIViewController view](v193, "view");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "frame");
      v146 = v150;
      v147 = v151;
      v148 = v152;
      v149 = v153;
    }
    -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v190, "_setFromEndFrame:", v146, v147, v148, v149);
    if ((v138 & 1) == 0)

    -[UIWindowController _interactionController](self, "_interactionController");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIViewControllerTransitionContext _setInteractor:](v190, "_setInteractor:", v154);

    objc_msgSend(v183, "beginDisablingInterfaceAutorotation");
    if (v178)
    {
      -[_UIViewControllerTransitionContext _transitionCoordinator](v190, "_transitionCoordinator");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v219[0] = MEMORY[0x1E0C809B0];
      v219[1] = 3221225472;
      v219[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_2;
      v219[3] = &unk_1E16B1CC8;
      v220 = v178;
      objc_msgSend(v155, "animateAlongsideTransition:completion:", v219, 0);

    }
    objc_initWeak((id *)&v244, val);
    v212[0] = MEMORY[0x1E0C809B0];
    v212[1] = 3221225472;
    v212[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_3;
    v212[3] = &unk_1E16C2830;
    v217 = v180;
    v212[4] = self;
    v213 = v120;
    v214 = v121;
    v218 = v138;
    objc_copyWeak(&v216, (id *)&v244);
    v215 = v183;
    -[_UIViewControllerTransitionContext _setCompletionHandler:](v190, "_setCompletionHandler:", v212);
    if (v136)
    {
      -[_UIViewControllerTransitionContext _setInteractiveUpdateHandler:](v190, "_setInteractiveUpdateHandler:", &__block_literal_global_143);
      -[_UIViewControllerTransitionContext _setTransitionIsCompleting:](v190, "_setTransitionIsCompleting:", 0);
    }

    objc_destroyWeak(&v216);
    objc_destroyWeak((id *)&v244);
  }
  else if (v178)
  {
    v178[2]();
  }
  v194[0] = MEMORY[0x1E0C809B0];
  v194[1] = 3221225472;
  v194[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_5;
  v194[3] = &unk_1E16C2858;
  v205 = a3;
  v194[4] = self;
  v203 = v126;
  v156 = v122;
  v202 = v156;
  v157 = val;
  v195 = v157;
  v158 = v190;
  v196 = v158;
  v206 = v189;
  v197 = v119;
  v198 = v193;
  v207 = v138;
  v199 = v176;
  v204 = a7;
  v159 = v121;
  v200 = v159;
  v208 = v180;
  v209 = v137;
  v160 = v120;
  v201 = v160;
  v210 = v179;
  v211 = v172;
  v161 = _Block_copy(v194);
  v162 = v161;
  v163 = v173 ^ 1;
  if ((a3 & 0xFFFFFFFE) == 0xA)
    v163 = 0;
  if ((v163 & 1) != 0)
    (*((void (**)(void *))v161 + 2))(v161);
  else
    objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v161);

  _Block_object_dispose(&v245, 8);
LABEL_239:

}

void __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  uint64_t v7;
  int64x2_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  char isKindOfClass;
  void *v54;
  double v55;
  double v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int v60;
  __int128 v61;
  uint64_t v62;
  _OWORD v63[3];

  objc_msgSend(*(id *)(a1 + 32), "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultStatusBarHeightInOrientation:", *(_QWORD *)(a1 + 88));
  v5 = v4;

  v6 = v5 != 0.0 && *(_BYTE *)(a1 + 188) == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v6;
  if (*(_BYTE *)(a1 + 189))
    v7 = 1;
  else
    v7 = *(_QWORD *)(a1 + 88);
  v8 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(*(_QWORD *)(a1 + 32) + 64) = v8;
  *(int64x2_t *)(*(_QWORD *)(a1 + 32) + 80) = v8;
  if (*(_BYTE *)(a1 + 190) || *(_QWORD *)(a1 + 96) == 4)
  {
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    v26 = *(void **)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "defaultStatusBarHeightInOrientation:", *(_QWORD *)(a1 + 88));
    v31 = v30;

    v32 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "window");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_originForViewController:orientation:actualStatusBarHeight:fullScreenLayout:inWindow:", v27, v7, v32, v33, v31);
    v9 = v34;
    v10 = v35;

  }
  if (!*(_QWORD *)(a1 + 56))
    return;
  if (*(_BYTE *)(a1 + 190) || *(_QWORD *)(a1 + 96) == 4)
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v36 = *(void **)(a1 + 32);
    v37 = *(_QWORD *)(a1 + 40);
    v38 = *(unsigned int *)(a1 + 184);
    v39 = *(_QWORD *)(a1 + 88);
    v40 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "window");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_boundsForViewController:transition:orientation:fullScreenLayout:inWindow:", v37, v38, v39, v40, v41);
    v11 = v42;
    v12 = v43;
    v14 = v44;
    v13 = v45;

  }
  v15 = *(_QWORD *)(a1 + 96);
  if (v15 == 4)
  {
    objc_msgSend(*(id *)(a1 + 56), "bounds");
    v11 = v16;
    v12 = v17;
    v14 = v18;
    v13 = v19;
    goto LABEL_29;
  }
  if (*(_BYTE *)(a1 + 190))
  {
    objc_msgSend(*(id *)(a1 + 48), "bounds");
    v11 = v20;
    v12 = v21;
    v14 = v22;
    v13 = v23;
    objc_msgSend(*(id *)(a1 + 48), "frame");
LABEL_18:
    v9 = v24;
    v10 = v25;
    goto LABEL_29;
  }
  if (v15 == 16 || v15 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "formSheetSize");
    v9 = v9 + (v14 - v51) * 0.5;
    v10 = v10 + (v13 - v52) * 0.5;
    v13 = v52;
    v14 = v51;
    goto LABEL_29;
  }
  if (v15 == 1)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "_referenceBounds");
    v48 = v47;

    if (v14 > v48)
    {
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "_referenceBounds");
      v14 = v50;

    }
    v9 = (*(double *)(a1 + 120) - v14) * 0.5;
    v10 = *(double *)(a1 + 128) - v13;
    goto LABEL_29;
  }
  if (!*(_BYTE *)(a1 + 188))
  {
    objc_msgSend(*(id *)(a1 + 64), "convertPoint:fromView:", *(_QWORD *)(a1 + 72), v9, v10);
    goto LABEL_18;
  }
LABEL_29:
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v54 = *(void **)(a1 + 56);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v54, "contentOffset");
    v11 = v55;
    v12 = v56;
    v54 = *(void **)(a1 + 56);
  }
  objc_msgSend(v54, "setBounds:", v11, v12, v14, v13);
  v57 = *(_QWORD *)(a1 + 32);
  *(double *)(v57 + 80) = v9;
  *(double *)(v57 + 88) = v10;
  objc_msgSend(*(id *)(a1 + 56), "setOrigin:", v9, v10);
  v58 = *(_DWORD *)(a1 + 184);
  if (v58 <= 0x14 && ((1 << v58) & 0x137E40) != 0)
  {
    v59 = *(_QWORD *)(a1 + 32);
    *(double *)(v59 + 64) = v9;
    *(double *)(v59 + 72) = v10;
  }
  if (!*(_BYTE *)(a1 + 189) && !*(_BYTE *)(a1 + 190) && !*(_BYTE *)(a1 + 191))
  {
    v61 = *(_OWORD *)(a1 + 152);
    v63[0] = *(_OWORD *)(a1 + 136);
    v63[1] = v61;
    v63[2] = *(_OWORD *)(a1 + 168);
    objc_msgSend(*(id *)(a1 + 56), "setTransform:", v63);
    v62 = *(_QWORD *)(a1 + 72);
    if (v62)
    {
      if (!*(_QWORD *)(v62 + 504))
        *(_QWORD *)(v62 + 504) = *(_QWORD *)(a1 + 88);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "frame");
  if (*(_BYTE *)(a1 + 192) || (v60 = *(_DWORD *)(a1 + 184), v60 <= 0x11) && ((1 << v60) & 0x32041) != 0)
    objc_msgSend(*(id *)(a1 + 56), "setFrame:", v9, v10);
}

uint64_t __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(void);
  id WeakRetained;
  id v12;

  v12 = a2;
  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setTransitionController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setInteractionController:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_setInteractiveTransition:", 0);
  }
  v5 = *(_QWORD **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = v5[1];
  v8 = *(_QWORD *)(a1 + 48);
  if ((_DWORD)a3)
    objc_msgSend(v5, "transitionViewDidComplete:fromView:toView:removeFromView:", v7, v6, v8, *(unsigned __int8 *)(a1 + 73));
  else
    objc_msgSend(v5, "transitionViewDidCancel:fromView:toView:", v7, v6, v8);
  objc_msgSend(v12, "_postInteractiveCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v12, "_postInteractiveCompletionHandler");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

    objc_msgSend(v12, "_setPostInteractiveCompletionHandler:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "animationEnded:", a3);
  objc_msgSend(v12, "_setTransitionIsInFlight:", 0);
  objc_msgSend(v12, "_setInteractor:", 0);
  objc_msgSend(v12, "_setAnimator:", 0);
  objc_msgSend(*(id *)(a1 + 56), "endDisablingInterfaceAutorotation");

}

void __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_5(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  id v43;
  _QWORD v44[4];
  id v45;

  v2 = (*(_DWORD *)(a1 + 120) & 0xFFFFFFFE) == 10;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusBarHeight");
  v6 = v5;

  v7 = *(double *)(a1 + 104);
  if (v7 != v6 && (v7 == 0.0 || v6 == 0.0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    if (*(_QWORD *)(a1 + 40))
    {
      v8 = *(void **)(a1 + 48);
      v9 = *(unsigned __int8 *)(a1 + 124);
      v10 = (double *)MEMORY[0x1E0C9D648];
      if (*(_BYTE *)(a1 + 124))
      {
        v11 = *MEMORY[0x1E0C9D648];
        v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "view");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "frame");
      }
      objc_msgSend(v8, "_setToEndFrame:", v11, v12, v13, v14);
      if (!v9)

      v15 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 64), "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "frame");
      objc_msgSend(v15, "_setFromStartFrame:");

      v17 = *v10;
      v18 = v10[1];
      v19 = v10[2];
      v20 = v10[3];
      objc_msgSend(*(id *)(a1 + 48), "_setToStartFrame:", *v10, v18, v19, v20);
      v21 = *(void **)(a1 + 48);
      if (*(_BYTE *)(a1 + 125))
      {
        objc_msgSend(*(id *)(a1 + 48), "_setFromEndFrame:", v17, v18, v19, v20);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 64), "view");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "frame");
        objc_msgSend(v21, "_setFromEndFrame:");

      }
    }
    v2 = 1;
  }
  v23 = *(void **)(a1 + 32);
  v24 = *(unsigned int *)(a1 + 120);
  objc_msgSend(*(id *)(a1 + 64), "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_prepareKeyboardForTransition:fromView:", v24, v25);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_DWORD *)(a1 + 120);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 72));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 112);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 64));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 56));
  if (v2)
    objc_msgSend(*(id *)(a1 + 56), "_updateLayoutForStatusBarAndInterfaceOrientation");
  v26 = *(_DWORD *)(a1 + 120);
  if (!v26 || v26 == 14)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 1;
    goto LABEL_21;
  }
  if (v26 == 13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = 0;
LABEL_21:
    objc_msgSend(v27, "setUserInteractionEnabled:", v29);

    v26 = *(_DWORD *)(a1 + 120);
  }
  if (v26 == 17 || v26 == 13)
    objc_msgSend(*(id *)(a1 + 80), "layoutIfNeeded");
  v30 = *(void **)(a1 + 40);
  if (v30)
  {
    objc_msgSend(v30, "transitionDuration:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "_setDuration:");
    if (*(_BYTE *)(a1 + 126))
      objc_msgSend(*(id *)(a1 + 32), "transitionViewDidStart:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    if (*(_BYTE *)(a1 + 127))
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_6;
      v44[3] = &unk_1E16B1B28;
      v31 = &v45;
      v45 = *(id *)(a1 + 48);
      +[UIView _setAlongsideAnimations:](UIView, "_setAlongsideAnimations:", v44);
      objc_msgSend(*(id *)(a1 + 32), "_interactionController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "startInteractiveTransition:", *(_QWORD *)(a1 + 48));

    }
    else
    {
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_7;
      v42 = &unk_1E16B1B28;
      v31 = &v43;
      v43 = *(id *)(a1 + 48);
      +[UIView _setAlongsideAnimations:](UIView, "_setAlongsideAnimations:", &v39);
      objc_msgSend(*(id *)(a1 + 40), "animateTransition:", *(_QWORD *)(a1 + 48), v39, v40, v41, v42);
    }
    +[UIView _alongsideAnimations](UIView, "_alongsideAnimations");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(*(id *)(a1 + 48), "__runAlongsideAnimations");
      +[UIView _setAlongsideAnimations:](UIView, "_setAlongsideAnimations:", 0);
    }

    objc_msgSend(*(id *)(a1 + 48), "_animator");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
      objc_msgSend(*(id *)(a1 + 48), "_setTransitionIsInFlight:", 1);
  }
  else
  {
    v33 = *(unsigned int *)(a1 + 120);
    if (*(_BYTE *)(a1 + 128))
    {
      v34 = 0;
    }
    else
    {
      if (*(_BYTE *)(a1 + 129))
        v37 = 1;
      else
        v37 = (_DWORD)v33 == 13;
      v34 = !v37 && (_DWORD)v33 != 14;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "transition:fromView:toView:removeFromView:", v33, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 80), v34);
  }
}

uint64_t __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

uint64_t __97__UIWindowController__transition_fromViewController_toViewController_target_didFinish_animation___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
}

- (void)transitionViewDidStart:(id)a3
{
  if (self->_transitionView == a3
    && !-[UIViewController _containsFirstResponder](self->_toViewController, "_containsFirstResponder"))
  {
    -[UIResponder becomeFirstResponder](self->_toViewController, "becomeFirstResponder");
  }
}

- (void)transitionViewDidCancel:(id)a3 fromView:(id)a4 toView:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIWindowController *v15;
  UITransitionView *transitionView;
  UIViewController *v17;
  UIViewController *v18;
  UIViewController *v19;
  id target;
  UIViewController *fromViewController;
  UIViewController *toViewController;
  _BOOL4 needsDidDisappear;
  _BOOL4 needsDidAppear;
  UIViewController *v25;
  UIViewController *v26;
  void *v27;
  id v28;

  v28 = a3;
  v7 = a4;
  objc_msgSend(v28, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindowController _transitionController](self, "_transitionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIWindowController _isInteractiveTransition](self, "_isInteractiveTransition"))
    goto LABEL_35;
  if (v9)
  {
    +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "presentationStyle") == 4;
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v11 = 0;
    v10 = 0;
    if (!v7)
      goto LABEL_8;
  }
  if (!v11)
  {
    objc_msgSend(v28, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObjectIdenticalTo:", v28);

    -[UIWindowController _transplantView:toSuperview:atIndex:](self, "_transplantView:toSuperview:atIndex:", v7, v8, v14);
  }
LABEL_8:
  if (v10)
    objc_msgSend(v10, "_setContainerView:", 0);
  -[UITransitionView delegate](self->_transitionView, "delegate");
  v15 = (UIWindowController *)objc_claimAutoreleasedReturnValue();

  if (v15 == self)
  {
    -[UITransitionView setDelegate:](self->_transitionView, "setDelegate:", 0);
    if (v11)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (!v11)
LABEL_12:
    objc_msgSend(v28, "removeFromSuperview");
LABEL_13:
  transitionView = self->_transitionView;
  self->_transitionView = 0;

  v17 = (UIViewController *)self->_target;
  v18 = self->_fromViewController;
  v19 = self->_toViewController;
  self->_currentTransition = 0;
  target = self->_target;
  self->_target = 0;

  fromViewController = self->_fromViewController;
  self->_didFinish = 0;
  self->_fromViewController = 0;

  toViewController = self->_toViewController;
  self->_toViewController = 0;

  if (v10)
  {
    if (v17)
    {
      if (objc_msgSend(v10, "_isPresentation"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[UIViewController _didCancelPresentTransition:](v17, "_didCancelPresentTransition:", v10);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[UIViewController _didCancelDismissTransition:](v17, "_didCancelDismissTransition:", v10);
      }
    }
    -[UIWindowController _setTransitionController:](self, "_setTransitionController:", 0);
    -[UIWindowController _setInteractionController:](self, "_setInteractionController:", 0);
    -[UIWindowController _setInteractiveTransition:](self, "_setInteractiveTransition:", 0);
  }
  needsDidDisappear = self->_needsDidDisappear;
  needsDidAppear = self->_needsDidAppear;
  *(_WORD *)&self->_needsDidAppear = 0;
  self->_presenting = 0;
  if (needsDidAppear)
  {
    if (v17 == v19)
      -[UIViewController setInAnimatedVCTransition:](v17, "setInAnimatedVCTransition:", 1);
    -[UIViewController setFinishingModalTransition:](v19, "setFinishingModalTransition:", 1);
    -[UIViewController cancelBeginAppearanceTransition](v19, "cancelBeginAppearanceTransition");
    -[UIViewController setFinishingModalTransition:](v19, "setFinishingModalTransition:", 0);
  }
  if (needsDidDisappear)
  {
    if (v17 == v18)
      -[UIViewController setInAnimatedVCTransition:](v17, "setInAnimatedVCTransition:", 1);
    -[UIViewController cancelBeginAppearanceTransition](v18, "cancelBeginAppearanceTransition");
  }
  if (objc_msgSend(v10, "_isPresentation"))
  {
    -[UIViewController _presentingViewControllerWillChange:](v19, "_presentingViewControllerWillChange:", 0);
    v25 = v19;
    v26 = 0;
  }
  else
  {
    -[UIViewController _presentingViewControllerWillChange:](v18, "_presentingViewControllerWillChange:", v19);
    v25 = v18;
    v26 = v19;
  }
  -[UIViewController _presentingViewControllerDidChange:](v25, "_presentingViewControllerDidChange:", v26);
  -[UIViewController setPerformingModalTransition:](v18, "setPerformingModalTransition:", 0);
  -[UIViewController setPerformingModalTransition:](v19, "setPerformingModalTransition:", 0);
  -[UIViewController _windowControllerTransitionDidCancel](v18, "_windowControllerTransitionDidCancel");
  objc_msgSend(v8, "keyboardSceneDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "popAnimationStyle");

LABEL_35:
}

- (void)transitionViewDidComplete:(id)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  UIWindowController *v25;
  void *v26;
  UITransitionView *transitionView;
  UIViewController *v28;
  int64_t didFinish;
  UIViewController *v30;
  UIViewController *v31;
  int currentTransition;
  void *v33;
  void (**v34)(void *, uint64_t);
  id target;
  UIViewController *fromViewController;
  UIViewController *toViewController;
  _BOOL4 needsDidDisappear;
  _BOOL4 needsDidAppear;
  _BOOL4 presenting;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CGAffineTransform v56;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[UIWindowController _transitionController](self, "_transitionController");
  v13 = objc_claimAutoreleasedReturnValue();
  v46 = v12;
  v45 = -[UIWindowController _isInteractiveTransition](self, "_isInteractiveTransition");
  if (v13)
  {
    +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:](_UIViewControllerTransitionContext, "_associatedTransitionContextForAnimationController:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "presentationStyle");
    objc_msgSend(v10, "superview");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 == 4)
    {
      v16 = 0;
      LOBYTE(v12) = 1;
      if (!v11)
        goto LABEL_27;
      goto LABEL_18;
    }
  }
  else
  {
    objc_msgSend(v10, "superview");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }
  if (v10)
  {
    objc_msgSend(v10, "transform");
    if (CGAffineTransformIsIdentity(&v56))
      goto LABEL_12;
    objc_msgSend(v10, "transform");
  }
  else
  {
    memset(&v56, 0, sizeof(v56));
    if (CGAffineTransformIsIdentity(&v56))
      goto LABEL_12;
    v54 = 0u;
    v55 = 0u;
    v53 = 0u;
  }
  v52[0] = v53;
  v52[1] = v54;
  v52[2] = v55;
  objc_msgSend(v12, "setTransform:", v52);
  objc_msgSend(v12, "center");
  objc_msgSend(v47, "convertPoint:fromView:", v10);
  objc_msgSend(v12, "setCenter:");
LABEL_12:
  if (!v12)
  {
    v16 = 0;
    if (!v11)
      goto LABEL_27;
    goto LABEL_18;
  }
  objc_msgSend(v10, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "subviews");
  v18 = objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend((id)v18, "indexOfObjectIdenticalTo:", v10);

  -[UIWindowController _transplantView:toSuperview:atIndex:](self, "_transplantView:toSuperview:atIndex:", v12, v47, v16);
  objc_msgSend(v10, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v18) = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    objc_msgSend(v10, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentView:", v12);

    -[UIViewController dropShadowView](self->_fromViewController, "dropShadowView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController setDropShadowView:](self->_toViewController, "setDropShadowView:", v21);

    -[UIViewController setDropShadowView:](self->_fromViewController, "setDropShadowView:", 0);
  }
  LOBYTE(v12) = 0;
  if (v11)
  {
LABEL_18:
    if (!v6
      && (-[UIViewController modalTransitionStyle](self->_toViewController, "modalTransitionStyle") == UIModalTransitionStylePartialCurl
       || -[UIViewController modalPresentationStyle](self->_toViewController, "modalPresentationStyle") == 18))
    {
      if (-[UIViewController modalTransitionStyle](self->_toViewController, "modalTransitionStyle") == UIModalTransitionStylePartialCurl)
        ++v16;
      if (v10)
      {
        objc_msgSend(v10, "transform");
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
        v49 = 0u;
      }
      v48[0] = v49;
      v48[1] = v50;
      v48[2] = v51;
      objc_msgSend(v11, "setTransform:", v48);
      -[UIWindowController _transplantView:toSuperview:atIndex:](self, "_transplantView:toSuperview:atIndex:", v11, v47, v16);
      objc_msgSend(v11, "center");
      objc_msgSend(v47, "convertPoint:fromView:", v10);
      objc_msgSend(v11, "setCenter:");
    }
  }
LABEL_27:
  -[UIViewController currentAction](self->_fromViewController, "currentAction");
  v22 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UITransitionView _curlUpRevealedHeight](self->_transitionView, "_curlUpRevealedHeight");
  if (v22)
    v22[4] = v23;

  if ((v12 & 1) == 0)
  {
    v24 = v10;
    goto LABEL_34;
  }
  if (v11 && v6)
  {
    v24 = v11;
LABEL_34:
    objc_msgSend(v24, "removeFromSuperview");
  }
  if (v14)
    objc_msgSend(v14, "_setContainerView:", 0);
  -[UITransitionView delegate](self->_transitionView, "delegate");
  v25 = (UIWindowController *)objc_claimAutoreleasedReturnValue();

  if (v25 == self)
    -[UITransitionView setDelegate:](self->_transitionView, "setDelegate:", 0);
  v44 = (void *)v13;
  v26 = v11;
  transitionView = self->_transitionView;
  self->_transitionView = 0;

  v43 = v14;
  if (v14)
  {
    -[UIWindowController _setTransitionController:](self, "_setTransitionController:", 0);
    -[UIWindowController _setInteractionController:](self, "_setInteractionController:", 0);
    -[UIWindowController _setInteractiveTransition:](self, "_setInteractiveTransition:", 0);
  }
  v28 = (UIViewController *)self->_target;
  didFinish = self->_didFinish;
  v30 = self->_fromViewController;
  v31 = self->_toViewController;
  currentTransition = self->_currentTransition;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIViewController _completionBlock](v28, "_completionBlock");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void (**)(void *, uint64_t))_Block_copy(v33);

  }
  else
  {
    v34 = 0;
  }
  self->_currentTransition = 0;
  target = self->_target;
  self->_target = 0;

  fromViewController = self->_fromViewController;
  self->_didFinish = 0;
  self->_fromViewController = 0;

  toViewController = self->_toViewController;
  self->_toViewController = 0;

  if (v28)
  {
    if (didFinish == 2)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIViewController _didFinishDismissTransition](v28, "_didFinishDismissTransition");
    }
    else if (didFinish == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIViewController _didFinishPresentTransition](v28, "_didFinishPresentTransition");
    }
  }
  needsDidDisappear = self->_needsDidDisappear;
  needsDidAppear = self->_needsDidAppear;
  presenting = self->_presenting;
  *(_WORD *)&self->_needsDidAppear = 0;
  self->_presenting = 0;
  if (needsDidAppear)
  {
    if (currentTransition && v28 == v31)
      -[UIViewController setInAnimatedVCTransition:](v28, "setInAnimatedVCTransition:", 1);
    -[UIViewController setFinishingModalTransition:](v31, "setFinishingModalTransition:", 1);
    -[UIViewController endAppearanceTransition](v31, "endAppearanceTransition");
    -[UIViewController setFinishingModalTransition:](v31, "setFinishingModalTransition:", 0);
  }
  if (needsDidDisappear)
  {
    if (currentTransition && v28 == v30)
      -[UIViewController setInAnimatedVCTransition:](v28, "setInAnimatedVCTransition:", 1);
    -[UIViewController endAppearanceTransition](v30, "endAppearanceTransition");
  }
  -[UIViewController setPerformingModalTransition:](v30, "setPerformingModalTransition:", 0);
  -[UIViewController setPerformingModalTransition:](v31, "setPerformingModalTransition:", 0);
  if (presenting)
  {
    -[UIViewController _presentingViewControllerDidChange:](v31, "_presentingViewControllerDidChange:", v30);
    -[UIViewController _modalPreservedFirstResponder]((id *)&v30->super.super.isa);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_becomeFirstResponderWhenPossible");

  }
  else
  {
    -[UIViewController _presentingViewControllerDidChange:](v30, "_presentingViewControllerDidChange:", 0);
  }
  if (v34)
    v34[2](v34, 1);
  objc_msgSend(v47, "keyboardSceneDelegate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "popAnimationStyle");

  if (!v45)
    objc_msgSend((id)UIApp, "endIgnoringInteractionEvents");

}

- (double)durationForTransition:(int)a3
{
  double result;

  +[UIViewController durationForTransition:](UIViewController, "durationForTransition:", *(_QWORD *)&a3);
  return result;
}

- (CGPoint)_adjustOrigin:(CGPoint)result givenOtherOrigin:(CGPoint)a4 forTransition:(int)a5
{
  double y;

  if ((a5 - 1) >= 2)
  {
    if (((1 << a5) & 0x1C1388) == 0)
      a4.x = result.x;
    if (a5 <= 0x14)
      result.x = a4.x;
    a4.y = result.y;
  }
  y = a4.y;
  result.y = y;
  return result;
}

- (void)transitionView:(id)a3 startCustomTransitionWithDuration:(double)a4
{
  id v6;
  int currentTransition;
  uint64_t v8;
  id v9;

  v6 = a3;
  currentTransition = self->_currentTransition;
  if (currentTransition == 17)
  {
    v9 = v6;
    v8 = 48;
    goto LABEL_5;
  }
  if (currentTransition == 16)
  {
    v9 = v6;
    v8 = 56;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "_startPresentCustomTransitionWithDuration:", a4);
    v6 = v9;
  }

}

- (CGPoint)transitionView:(id)a3 endOriginForFromView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double y;
  double x;
  uint64_t v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v8 = *(_QWORD *)&a5;
  objc_msgSend(a4, "frame", a3);
  -[UIWindowController _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", v8, x, y, v10, v11);
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)transitionView:(id)a3 beginOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  double x;
  double y;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  x = self->_beginOriginForToView.x;
  y = self->_beginOriginForToView.y;
  if (x == 1.79769313e308 && y == 1.79769313e308)
  {
    -[UIWindowController _adjustOrigin:givenOtherOrigin:forTransition:](self, "_adjustOrigin:givenOtherOrigin:forTransition:", *(_QWORD *)&a5, a4, a6.x, a6.y, self->_endOriginForToView.x, self->_endOriginForToView.y);
    x = v9;
    y = v10;
  }
  v11 = x;
  v12 = y;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)transitionView:(id)a3 endOriginForToView:(id)a4 forTransition:(int)a5 defaultOrigin:(CGPoint)a6
{
  CGFloat y;
  double x;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int64_t toModalStyle;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;
  CGRect v30;

  y = a6.y;
  x = a6.x;
  v9 = a3;
  objc_msgSend(v9, "keyboardSceneDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleFrameInView:", 0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  if (self->_endOriginForToView.x != 1.79769313e308 || self->_endOriginForToView.y != 1.79769313e308)
  {
    if (self->_presenting
      && ((toModalStyle = self->_toModalStyle, toModalStyle == 16) || toModalStyle == 2)
      && (v30.origin.x = v12, v30.origin.y = v14, v30.size.width = v16, v30.size.height = v18, !CGRectIsEmpty(v30))
      && (unint64_t)(-[UIViewController interfaceOrientation](self->_toViewController, "interfaceOrientation") - 3) <= 1)
    {
      objc_msgSend(v9, "bounds");
      v22 = v21;
      -[UIViewController formSheetSize](self->_toViewController, "formSheetSize");
      x = (v22 - v23) * 0.5;
      objc_msgSend(v9, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultStatusBarHeightInOrientation:", 1);
      y = v26;

    }
    else
    {
      x = self->_endOriginForToView.x;
      y = self->_endOriginForToView.y;
    }
  }

  v27 = x;
  v28 = y;
  result.y = v28;
  result.x = v27;
  return result;
}

- (BOOL)transitionViewShouldUseViewControllerCallbacks
{
  return 0;
}

- (UITransitionView)transitionView
{
  return self->_transitionView;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (UIViewControllerAnimatedTransitioning)_transitionController
{
  return self->_transitionController;
}

- (void)_setTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionController, a3);
}

- (UIViewControllerInteractiveTransitioning)_interactionController
{
  return self->_interactionController;
}

- (void)_setInteractionController:(id)a3
{
  objc_storeStrong((id *)&self->_interactionController, a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (BOOL)_isInteractiveTransition
{
  return self->__interactiveTransition;
}

- (void)_setInteractiveTransition:(BOOL)a3
{
  self->__interactiveTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_toViewController, 0);
  objc_storeStrong((id *)&self->_fromViewController, 0);
  objc_storeStrong(&self->_target, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_transitionView, 0);
}

@end
