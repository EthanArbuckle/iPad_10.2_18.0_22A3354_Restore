@implementation UIScrollToDismissSupport

- (void)completedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  UISplitKeyboardSource *v7;
  UISplitKeyboardSource *v8;
  id v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  _BOOL4 v13;
  UISplitKeyboardSource *v14;

  v7 = (UISplitKeyboardSource *)a5;
  v8 = v7;
  if (self->super._controller == v7)
  {
    v14 = v7;
    v9 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UIScrollToDismissSupport finishScrollViewTransition](self, "finishScrollViewTransition");
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "responder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "_requiresKeyboardWhenFirstResponder")
        && !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
      {
        if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
          objc_msgSend(v11, "_setIgnoresPinning:allowImmediateReload:", 1, 0);
        objc_msgSend(v12, "resignFirstResponder");
        if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
          objc_msgSend(v11, "_setIgnoresPinning:allowImmediateReload:", 0, 0);
      }

      goto LABEL_12;
    }
    v13 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
    v8 = v14;
    if (v13)
    {
      -[UISplitKeyboardSource removeMatchMoveAnimationIfNeeded](v14, "removeMatchMoveAnimationIfNeeded");
LABEL_12:
      v8 = v14;
    }
  }

}

- (BOOL)isFinishingDismissTransition
{
  return self->_scrollViewTransitionFinishing;
}

- (void)updateScrollViewContentInsetBottom:(double)a3
{
  if (-[UIScrollView updateInsetBottomDuringKeyboardDismiss](self->_scrollViewForTransition, "updateInsetBottomDuringKeyboardDismiss"))
  {
    -[UIScrollView contentInset](self->_scrollViewForTransition, "contentInset");
    -[UIScrollView setContentInset:](self->_scrollViewForTransition, "setContentInset:");
  }
}

- (void)hideScrollViewHorizontalScrollIndicator:(BOOL)a3
{
  _BOOL4 v3;
  UIScrollView **p_scrollViewForTransition;

  v3 = a3;
  if (a3)
  {
    p_scrollViewForTransition = &self->_scrollViewForTransition;
    if (!-[UIScrollView showsHorizontalScrollIndicator](self->_scrollViewForTransition, "showsHorizontalScrollIndicator"))return;
    self->_scrollViewShowsHorizontalScrollIndicator = 1;
  }
  else
  {
    if (!self->_scrollViewShowsHorizontalScrollIndicator)
      return;
    self->_scrollViewShowsHorizontalScrollIndicator = 0;
    p_scrollViewForTransition = &self->_scrollViewForTransition;
  }
  -[UIScrollView setShowsHorizontalScrollIndicator:](*p_scrollViewForTransition, "setShowsHorizontalScrollIndicator:", !v3);
}

- (void)finishScrollViewTransition
{
  UIInputViewSetNotificationInfo *scrollViewNotificationInfo;
  UIScrollView *scrollViewForTransition;

  self->_scrollViewTransitionFinishing = 0;
  -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 0);
  -[UIScrollToDismissSupport hideScrollViewHorizontalScrollIndicator:](self, "hideScrollViewHorizontalScrollIndicator:", 0);
  scrollViewNotificationInfo = self->_scrollViewNotificationInfo;
  self->_scrollViewNotificationInfo = 0;

  scrollViewForTransition = self->_scrollViewForTransition;
  self->_scrollViewForTransition = 0;

}

- (void)setInterfaceAutorotationDisabled:(BOOL)a3 forController:(id)a4
{
  _BOOL4 v4;
  UISplitKeyboardSource *v6;
  BSSimpleAssertion *interfaceAutorotationDisabledAssertion;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  UIScrollToDismissSupport *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  UISplitKeyboardSource *v17;
  objc_class *v18;
  void *v19;
  __CFString *v20;
  BSSimpleAssertion *v21;
  void *v22;
  UIScrollToDismissSupport *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  BSSimpleAssertion *v29;
  BSSimpleAssertion *v30;
  _QWORD v31[4];
  id v32;
  id location;

  v4 = a3;
  v6 = (UISplitKeyboardSource *)a4;
  if (self->super._controller == v6)
  {
    interfaceAutorotationDisabledAssertion = self->_interfaceAutorotationDisabledAssertion;
    if (interfaceAutorotationDisabledAssertion)
      LODWORD(interfaceAutorotationDisabledAssertion) = -[BSSimpleAssertion isValid](interfaceAutorotationDisabledAssertion, "isValid");
    if (!v4 || (interfaceAutorotationDisabledAssertion & 1) != 0)
    {
      if (!v4 && ((interfaceAutorotationDisabledAssertion ^ 1) & 1) == 0)
      {
        -[BSSimpleAssertion invalidate](self->_interfaceAutorotationDisabledAssertion, "invalidate");
        v21 = self->_interfaceAutorotationDisabledAssertion;
        self->_interfaceAutorotationDisabledAssertion = 0;

      }
    }
    else
    {
      -[UIView window](self->_scrollViewForTransition, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "beginDisablingInterfaceAutorotation");
        v10 = 0x1E0CB3000uLL;
        v11 = (void *)MEMORY[0x1E0CB3940];
        v12 = self;
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v14, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v17 = v6;
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p>"), v19, v17);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v10 = 0x1E0CB3000;
        }
        else
        {
          v20 = CFSTR("(nil)");
        }
        v22 = *(void **)(v10 + 2368);
        v23 = v12;
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@: %p>"), v25, v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringWithFormat:", CFSTR("Scroll to dismiss disabling autorotation for window on behalf of controller. scrollToDismiss=%@; controller=%@; window=%@"),
          v15,
          v20,
          v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, v9);
        v28 = objc_alloc(MEMORY[0x1E0D01868]);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __75__UIScrollToDismissSupport_setInterfaceAutorotationDisabled_forController___block_invoke;
        v31[3] = &unk_1E16B7FF8;
        objc_copyWeak(&v32, &location);
        v29 = (BSSimpleAssertion *)objc_msgSend(v28, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("UIScrollToDismissSupport.windowDisableInterfaceAutorotation"), v27, v31);
        v30 = self->_interfaceAutorotationDisabledAssertion;
        self->_interfaceAutorotationDisabledAssertion = v29;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);

      }
    }
  }

}

void __75__UIScrollToDismissSupport_setInterfaceAutorotationDisabled_forController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endDisablingInterfaceAutorotation");

}

- (void)finishScrollViewTransitionForController:(id)a3
{
  if (self->super._controller == a3)
    -[UIScrollToDismissSupport finishScrollViewTransition](self, "finishScrollViewTransition");
}

- (id)cancelNotificationsForMode:(unint64_t)a3
{
  UIInputViewSetNotificationInfo *scrollViewNotificationInfo;
  UIInputViewSetNotificationInfo *v4;
  UIInputViewSetNotificationInfo *v5;
  void *v6;

  scrollViewNotificationInfo = self->_scrollViewNotificationInfo;
  if (scrollViewNotificationInfo)
  {
    v4 = scrollViewNotificationInfo;
  }
  else
  {
    -[UISplitKeyboardSource constructNotificationInfoForScrollWithMode:](self->super._controller, "constructNotificationInfoForScrollWithMode:", a3);
    v4 = (UIInputViewSetNotificationInfo *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[UIInputViewSetNotificationInfo inverseInfo](v4, "inverseInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)completeKeyboardDismiss:(unint64_t)a3 withDuration:(double)a4
{
  double v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __objc2_class **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  self->_scrollViewTransitionFinishing = 1;
  -[UISplitKeyboardSource positionConstraintConstant](self->super._controller, "positionConstraintConstant");
  +[_UIInputViewSetPlacementDragToDismiss placementWithOffset:dismissKeyboardOnly:](_UIInputViewSetPlacementDragToDismiss, "placementWithOffset:dismissKeyboardOnly:", a3 & 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISplitKeyboardSource placement](self->super._controller, "placement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((a3 & 1) != 0)
  {
    v11 = objc_msgSend(v9, "accessoryViewWillAppear");
    v12 = off_1E167A9C8;
    if (v11)
      v12 = off_1E167A998;
  }
  else
  {
    if (!a3)
      goto LABEL_8;
    v12 = off_1E167A9C8;
  }
  -[__objc2_class placement](*v12, "placement");
  v13 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v13;
LABEL_8:
  -[UIScrollToDismissSupport hideScrollViewHorizontalScrollIndicator:](self, "hideScrollViewHorizontalScrollIndicator:", 1);
  v14 = (void *)MEMORY[0x1E0C99E08];
  v24[0] = CFSTR("_UIScrollKeyboardPlacementFrom");
  v24[1] = CFSTR("_UIScrollKeyboardPlacementTo");
  v25[0] = v8;
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithDictionary:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 0.0)
  {
    -[UIInputViewSetNotificationInfo duration](self->_scrollViewNotificationInfo, "duration");
    a4 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("_UIScrollKeyboardDuration"));

  }
  if (self->_scrollViewNotificationInfo
    && +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIScrollToDismissSupport _infoForMatchMove](self, "_infoForMatchMove");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEntriesFromDictionary:", v19);

  }
  -[UIScrollToDismissSupport _updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:](self, "_updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), a4);
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__UIScrollToDismissSupport_completeKeyboardDismiss_withDuration___block_invoke;
  v22[3] = &unk_1E16D6240;
  v23 = v16;
  v21 = v16;
  objc_msgSend(v20, "performOnDistributedControllers:", v22);

}

uint64_t __65__UIScrollToDismissSupport_completeKeyboardDismiss_withDuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", CFSTR("_UIScrollKeyboard"), *(_QWORD *)(a1 + 32));
}

- (void)scrollView:(id)a3 didPanWithGesture:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIScrollView *scrollViewForTransition;
  char v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  void *v55;
  UIInputViewSetNotificationInfo *v56;
  UIInputViewSetNotificationInfo *scrollViewNotificationInfo;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  id v66;
  _QWORD v67[4];
  id v68;
  CGPoint v69;
  CGRect v70;
  CGRect v71;

  v66 = a3;
  v7 = a4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "displaysCandidates"))
  {
    objc_msgSend(v8, "candidateController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "activeCandidateViewType") & 4) == 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    v10 = objc_msgSend(v7, "state");

    if (v10 == 1)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAutocorrectPromptAndCandidateList");
      goto LABEL_5;
    }
  }
LABEL_6:
  -[UISplitKeyboardSource placement](self->super._controller, "placement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "showsKeyboard")
    || -[UISplitKeyboardSource isChangingPlacement](self->super._controller, "isChangingPlacement"))
  {

    goto LABEL_9;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "keyboardActive");

  if (!v13)
    goto LABEL_9;
  v14 = 1;
  v15 = 3;
  switch(objc_msgSend(v66, "keyboardDismissMode"))
  {
    case 1:
      break;
    case 2:
      v14 = 0;
      v15 = 5;
      break;
    case 3:
      v15 = 2;
      break;
    case 4:
      v14 = 0;
      v15 = 4;
      break;
    default:
      v15 = 0;
      v14 = 1;
      break;
  }
  -[UISplitKeyboardSource placement](self->super._controller, "placement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "inputViewWillAppear") & 1) == 0)
  {

    goto LABEL_9;
  }
  -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inputView");

  v18 = objc_msgSend(v7, "numberOfTouches");
  -[UISplitKeyboardSource view](self->super._controller, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v7, "locationOfTouch:inView:", 0, v19);
  else
    objc_msgSend(v7, "locationInView:", v19);
  v22 = v20;
  v23 = v21;

  if (objc_msgSend(v7, "state") == 1)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clearAnimations");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeTextChoicePromptAndAutocorrection");

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "containerRootController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "clearKeyboardSnapshot");

    if (self->_scrollViewForTransition)
      -[UIScrollToDismissSupport finishScrollViewTransition](self, "finishScrollViewTransition");
  }
  if ((v15 & 2) != 0)
  {
    if (!self->_scrollViewForTransition)
      goto LABEL_45;
  }
  else
  {
    -[UISplitKeyboardSource hostView](self->super._controller, "hostView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "frame");
    -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v66);
    v69.x = v22;
    v69.y = v23;
    if (CGRectContainsPoint(v70, v69))
    {
      scrollViewForTransition = self->_scrollViewForTransition;

      if (!scrollViewForTransition)
      {
LABEL_45:
        -[UISplitKeyboardSource constructNotificationInfoForScrollWithMode:](self->super._controller, "constructNotificationInfoForScrollWithMode:", v15);
        v56 = (UIInputViewSetNotificationInfo *)objc_claimAutoreleasedReturnValue();
        scrollViewNotificationInfo = self->_scrollViewNotificationInfo;
        self->_scrollViewNotificationInfo = v56;

        if (self->_scrollViewNotificationInfo)
        {
          objc_storeStrong((id *)&self->_scrollViewForTransition, a3);
          -[UISplitKeyboardSource setInterfaceAutorotationDisabled:](self->super._controller, "setInterfaceAutorotationDisabled:", 1);
          -[UIInputViewSetNotificationInfo beginFrame](self->_scrollViewNotificationInfo, "beginFrame");
          -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v66);
          -[UIScrollToDismissSupport updateScrollViewContentInsetBottom:](self, "updateScrollViewContentInsetBottom:", v23 - CGRectGetMinY(v71));
          self->_scrollViewTransitionPreviousPoint.x = v22;
          self->_scrollViewTransitionPreviousPoint.y = v23;
          -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "inputAccessoryView");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          if (v59)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "postNotificationName:object:", CFSTR("UITextSelectionWillInteractiveMove"), 0);

          }
          if ((v15 & 2) != 0)
            -[UIScrollToDismissSupport completeKeyboardDismiss:withDuration:](self, "completeKeyboardDismiss:withDuration:", v15, 0.0);
        }
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  if (self->_scrollViewForTransition)
    v30 = v14;
  else
    v30 = 1;
  if ((v30 & 1) == 0)
  {
    v65 = v22;
    -[UIInputViewSetNotificationInfo beginFrame](self->_scrollViewNotificationInfo, "beginFrame");
    v61 = v31;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v66);
    v39 = v38;
    -[UIInputViewSetNotificationInfo endFrame](self->_scrollViewNotificationInfo, "endFrame");
    v41 = v40;
    v43 = v42;
    -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v66);
    v63 = v23;
    v64 = v44;
    v45 = v23 - v39;
    v46 = v41 - v39;
    v62 = fmin(fmax(v45 / v46, 0.0), 1.0);
    -[UIScrollToDismissSupport hideScrollViewHorizontalScrollIndicator:](self, "hideScrollViewHorizontalScrollIndicator:", v62 > 0.01);
    v47 = fmax(v45, 0.0);
    if (v46 > v47)
      v46 = v47;
    -[UIScrollToDismissSupport _updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:](self, "_updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:", v43, v37 - v46, v61, v33, v35, v37, 0.0);
    +[UIInputViewSetPlacementUndocked infoWithPoint:](UIInputViewSetPlacementUndocked, "infoWithPoint:", 0.0, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "mutableCopy");

    -[UIScrollToDismissSupport _infoForMatchMove](self, "_infoForMatchMove");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addEntriesFromDictionary:", v50);

    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __57__UIScrollToDismissSupport_scrollView_didPanWithGesture___block_invoke;
    v67[3] = &unk_1E16D6240;
    v52 = v49;
    v68 = v52;
    objc_msgSend(v51, "performOnDistributedControllers:", v67);

    v53 = v63;
    if (v39 >= v63)
      v53 = v39;
    if (v64 <= v53)
      v54 = v64;
    else
      v54 = v53;
    if (v62 > 0.0)
    {
      -[UIScrollToDismissSupport updateScrollViewContentInsetBottom:](self, "updateScrollViewContentInsetBottom:", v54 - self->_scrollViewTransitionPreviousPoint.y, v64);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "postNotificationName:object:", CFSTR("UIKeyboardPrivateInteractiveDismissalDidBeginNotification"), 0);

    }
    self->_scrollViewTransitionPreviousPoint.x = v65;
    self->_scrollViewTransitionPreviousPoint.y = v54;

  }
LABEL_9:

}

uint64_t __57__UIScrollToDismissSupport_scrollView_didPanWithGesture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTransition:withInfo:", CFSTR("_UIScrollKeyboard"), *(_QWORD *)(a1 + 32));
}

- (void)scrollView:(id)a3 didFinishPanGesture:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!self->_scrollViewTransitionFinishing && self->_scrollViewForTransition)
  {
    v8 = objc_msgSend(v6, "keyboardDismissMode");
    if ((unint64_t)(v8 - 1) > 3)
      v9 = 0;
    else
      v9 = qword_186681510[v8 - 1];
    -[UIInputViewSetNotificationInfo beginFrame](self->_scrollViewNotificationInfo, "beginFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIInputViewSetNotificationInfo endFrame](self->_scrollViewNotificationInfo, "endFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v24 = objc_msgSend(v7, "numberOfTouches");
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v7, "locationOfTouch:inView:", 0, v25);
    else
      objc_msgSend(v7, "locationInView:", v25);
    v27 = v26;

    v28 = fmin(fmax((v27 - v13) / (v19 - v13), 0.0), 1.0);
    -[UISplitKeyboardSource view](self->super._controller, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "velocityInView:", v29);
    v31 = v30;

    if (v31 <= 0.0)
    {
      self->_scrollViewTransitionFinishing = 1;
      -[UIInputViewSetNotificationInfo duration](self->_scrollViewNotificationInfo, "duration");
      v34 = v28 * v33;
      -[UIScrollToDismissSupport _updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:](self, "_updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:", v21, v23, v11, v13, v15, v17, v28 * v33);
      v44[0] = CFSTR("_UIScrollKeyboardDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = CFSTR("_UIScrollKeyboardCancelInfo");
      v45[0] = v35;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "mutableCopy");

      if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      {
        -[UIScrollToDismissSupport _infoForMatchMove](self, "_infoForMatchMove");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addEntriesFromDictionary:", v39);

      }
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __59__UIScrollToDismissSupport_scrollView_didFinishPanGesture___block_invoke;
      v42[3] = &unk_1E16D6240;
      v43 = v38;
      v41 = v38;
      objc_msgSend(v40, "performOnDistributedControllers:", v42);

    }
    else
    {
      -[UIInputViewSetNotificationInfo duration](self->_scrollViewNotificationInfo, "duration");
      -[UIScrollToDismissSupport completeKeyboardDismiss:withDuration:](self, "completeKeyboardDismiss:withDuration:", v9, v28 * v32);
    }
  }

}

uint64_t __59__UIScrollToDismissSupport_scrollView_didFinishPanGesture___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "completeTransition:withInfo:", CFSTR("_UIScrollKeyboard"), *(_QWORD *)(a1 + 32));
}

- (id)_infoForMatchMove
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t RenderId;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UISplitKeyboardSource scrollTrackingView](self->super._controller, "scrollTrackingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "contextId");

    objc_msgSend(v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    RenderId = CALayerGetRenderId();

    -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputAccessoryView");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v4, "bounds");
      v14 = v13;

      v15 = 0.0;
      if (v14 <= 0.0)
      {
LABEL_7:
        v24[0] = CFSTR("_UIKeyboardContextID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v19;
        v24[1] = CFSTR("_UIKeyboardLayerID");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", RenderId);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v20;
        v24[2] = CFSTR("_UIScrollKeyboardIAVOffset");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
        v22 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v22;
        return v3;
      }
      -[UISplitKeyboardSource inputViewSet](self->super._controller, "inputViewSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inputAccessoryViewBounds");
      v17 = v16;
      objc_msgSend(v4, "bounds");
      v15 = v17 / v18;
    }
    else
    {
      v15 = 0.0;
    }

    goto LABEL_7;
  }
  return v3;
}

- (CGRect)addPaddingToFrame:(CGRect)a3 inView:(id)a4
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a4, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardLayoutGuideScrollViewOffset");
  v10 = v9;

  v11 = y - fmax(v10, 0.0);
  v12 = -0.0;
  if (v10 > 0.0)
    v12 = v10;
  v13 = height + v12;
  v14 = x;
  v15 = width;
  result.size.height = v13;
  result.size.width = v15;
  result.origin.y = v11;
  result.origin.x = v14;
  return result;
}

- (void)_updateKeyboardLayoutGuideForScrollTransitionWithSize:(CGSize)a3 hostFrame:(CGRect)a4 duration:(double)a5
{
  double height;
  double y;
  double x;
  double v9;
  double width;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  void *v46;
  uint64_t v47;
  double v48;
  _QWORD v49[4];
  id v50;
  _QWORD aBlock[8];
  _QWORD v52[4];
  id v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.height;
  width = a3.width;
  +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", 1, a5, a3.height, a4.origin.x, a4.origin.y, a4.size.width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 > 0.0)
    objc_msgSend(v12, "setExtraOptions:", 0);
  v14 = y + height - v9;
  v15 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v48 = a5;
  v52[1] = 3221225472;
  v52[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke;
  v52[3] = &unk_1E16D7588;
  v54 = x;
  v55 = v14;
  v56 = width;
  v57 = v9;
  v58 = a5;
  v16 = v13;
  v53 = v16;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:](UIWindow, "_enumerateWindowsIncludingInternalWindows:onlyVisibleWindows:allowMutation:withBlock:", 1, 1, 0, v52);
  -[UISplitKeyboardSource containerView](self->super._controller, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v18, "screen");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v62.origin.x = v28;
  v62.origin.y = v29;
  v62.size.width = v30;
  v62.size.height = v31;
  v59.origin.x = v20;
  v59.origin.y = v22;
  v59.size.width = v24;
  v59.size.height = v26;
  v32 = CGRectEqualToRect(v59, v62);

  if (!v32)
  {
    objc_msgSend(v18, "screen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "coordinateSpace");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowScene");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "coordinateSpace");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "convertRect:toCoordinateSpace:", v36, x, v14, width, v9);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    objc_msgSend(v18, "bounds");
    v63.origin.x = v38;
    v63.origin.y = v40;
    v63.size.width = v42;
    v63.size.height = v44;
    v61 = CGRectIntersection(v60, v63);
    x = v61.origin.x;
    v14 = v61.origin.y;
    width = v61.size.width;
    v9 = v61.size.height;
  }
  aBlock[0] = v15;
  aBlock[1] = 3221225472;
  aBlock[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_3;
  aBlock[3] = &__block_descriptor_64_e5_v8__0l;
  *(double *)&aBlock[4] = x;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = width;
  *(double *)&aBlock[7] = v9;
  v45 = _Block_copy(aBlock);
  v46 = v45;
  if (v48 <= 0.0)
  {
    (*((void (**)(void *))v45 + 2))(v45);
  }
  else
  {
    v47 = objc_msgSend(v16, "extraOptions");
    v49[0] = v15;
    v49[1] = 3221225472;
    v49[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_5;
    v49[3] = &unk_1E16B1BF8;
    v50 = v46;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v47, v49, 0, v48, 0.0);

  }
}

void __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  CGFloat v18;
  CGFloat v19;
  double width;
  double height;
  void *v22;
  double v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v3 = a2;
  if (objc_msgSend(v3, "isTrackingKeyboard"))
  {
    objc_msgSend(v3, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateSpace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toCoordinateSpace:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v3, "frame");
    v29.origin.x = v16;
    v29.origin.y = v17;
    v29.size.width = v18;
    v29.size.height = v19;
    v27.origin.x = v9;
    v27.origin.y = v11;
    v27.size.width = v13;
    v27.size.height = v15;
    v28 = CGRectIntersection(v27, v29);
    width = v28.size.width;
    height = v28.size.height;
    objc_msgSend(v3, "_primaryKeyboardTrackingGuide", v28.origin.x, v28.origin.y);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v22, "changeSizingConstants:", width, height);

    if ((_DWORD)v5)
    {
      v23 = *(double *)(a1 + 72);
      if (v23 > 0.0)
      {
        v24 = objc_msgSend(*(id *)(a1 + 32), "extraOptions");
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_2;
        v25[3] = &unk_1E16B1B28;
        v26 = v3;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v24, v25, 0, v23, 0.0);

      }
    }
  }

}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutViewsForTrackedGuides");
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_3(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[4];
  __int128 v4;
  __int128 v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_4;
  v3[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
  v1 = *(_OWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v5 = v1;
  return +[UIKeyboardSceneDelegate performOnControllers:](UIKeyboardSceneDelegate, "performOnControllers:", v3);
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewNotificationInfo, 0);
  objc_storeStrong((id *)&self->_interfaceAutorotationDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_scrollViewForTransition, 0);
}

@end
