@implementation UIInputViewAnimationControllerViewControllerContext

- (UIInputViewAnimationControllerViewControllerContext)initWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5 transitionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UIInputViewAnimationControllerViewControllerContext *v15;
  UIInputViewAnimationControllerViewControllerContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIView *v28;
  void *v29;
  UIView *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  UIView *v40;
  void *v41;
  uint64_t v42;
  UIView *from;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  uint64_t v54;
  UIInputViewSet *preservedInputViewSet;
  void *v56;
  void *v57;
  uint64_t v58;
  UIView *to;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  uint64_t v64;
  UIKBViewTreeSnapshotter *kbSnapshotter;
  uint64_t v66;
  UIView *v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  UIView *v76;
  id v77;
  __CFRunLoop *Current;
  const void *v79;
  __CFRunLoop *v80;
  id v82;
  _QWORD block[4];
  id v84;
  id location;
  objc_super v86;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v86.receiver = self;
  v86.super_class = (Class)UIInputViewAnimationControllerViewControllerContext;
  v15 = -[UIInputViewAnimationControllerViewControllerContext init](&v86, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_host, a3);
    objc_storeStrong((id *)&v16->_context, a6);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "showsInputViews"))
    {
      v82 = v14;
      objc_msgSend(v11, "updateToPlacement:withNormalAnimationsAndNotifications:", v12, 0);
      objc_msgSend(v11, "transitioningView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "inputViewSnapshotOfView:afterScreenUpdates:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "viewForTransitionScreenSnapshot");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitioningView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertPoint:toView:", v21, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v23 = v22;
      v25 = v24;

      v26 = -v23;
      v27 = -v25;
      objc_msgSend(v19, "frame");
      objc_msgSend(v19, "setFrame:", v26, v27);
      v28 = [UIView alloc];
      objc_msgSend(v11, "viewForTransitionScreenSnapshot");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "frame");
      v30 = -[UIView initWithFrame:](v28, "initWithFrame:");

      -[UIView setClipsToBounds:](v30, "setClipsToBounds:", 1);
      -[UIView addSubview:](v30, "addSubview:", v19);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "keyboardWindowSnapshot");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (objc_msgSend(v17, "preservingInputViews"))
        {
          objc_msgSend(v31, "keyboardWindowSnapshot");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPreservedKeyboardWindowSnapshot:", v33);

        }
        objc_msgSend(v19, "frame");
        v35 = v34;
        v37 = v36;
        objc_msgSend(v31, "keyboardWindowSnapshot");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setFrame:", v26, v27, v35, v37);

        objc_msgSend(v31, "keyboardWindowSnapshot");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView addSubview:](v30, "addSubview:", v39);

        objc_msgSend(v31, "clearKeyboardWindowSnapshot");
        +[UIKeyboard forceKeyboardAlpha:](UIKeyboard, "forceKeyboardAlpha:", 0.0);
        objc_msgSend(v11, "setKeyboardWindowSnapshotOn:", 1);
      }
      v40 = [UIView alloc];
      objc_msgSend(v11, "transitioningView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "frame");
      v42 = -[UIView initWithFrame:](v40, "initWithFrame:");
      from = v16->_from;
      v16->_from = (UIView *)v42;

      -[UIView setUserInteractionEnabled:](v16->_from, "setUserInteractionEnabled:", 0);
      -[UIView addSubview:](v16->_from, "addSubview:", v30);
      objc_msgSend(v11, "transitioningFrame");
      v16->_fromRect.origin.x = v44;
      v16->_fromRect.origin.y = v45;
      v16->_fromRect.size.width = v46;
      v16->_fromRect.size.height = v47;
      objc_msgSend(v11, "transitioningView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "superview");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addSubview:", v16->_from);

      v14 = v82;
    }
    if (objc_msgSend(v13, "showsInputViews"))
    {
      if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
        && !v16->_preservedInputViewSet)
      {
        objc_msgSend(v17, "preservedKeyboardWindowSnapshot");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {

        }
        else
        {
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "currentInputMode");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isExtensionInputMode");

          if ((v53 & 1) == 0)
          {
            -[UIInputViewAnimationHost inputViewSet](v16->_host, "inputViewSet");
            v54 = objc_claimAutoreleasedReturnValue();
            preservedInputViewSet = v16->_preservedInputViewSet;
            v16->_preservedInputViewSet = (UIInputViewSet *)v54;

            +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "loadLocalKeyboardForHost:", v16->_host);

            +[UIKeyboard forceKeyboardAlpha:](UIKeyboard, "forceKeyboardAlpha:", 0.0);
          }
        }
      }
      if (objc_msgSend(v17, "restoringInputViews"))
        objc_msgSend(v17, "setTakingSnapshot:", 1);
      objc_msgSend(v17, "preservedKeyboardWindowSnapshot");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend(v17, "preservedKeyboardWindowSnapshot");
        v58 = objc_claimAutoreleasedReturnValue();
        to = v16->_to;
        v16->_to = (UIView *)v58;

        objc_msgSend(v17, "setPreservedKeyboardWindowSnapshot:", 0);
      }
      else if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
             || (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), v60 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v60, "currentInputMode"), v61 = (void *)objc_claimAutoreleasedReturnValue(), v62 = objc_msgSend(v61, "isExtensionInputMode"), v61, v60, (v62 & 1) == 0))
      {
        objc_msgSend(v11, "updateToPlacement:withNormalAnimationsAndNotifications:", v13, 0);
        objc_msgSend(v11, "transitioningView");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKBViewTreeSnapshotter snapshotterForKeyboardView:afterScreenUpdates:](UIKBViewTreeSnapshotter, "snapshotterForKeyboardView:afterScreenUpdates:", v63, 1);
        v64 = objc_claimAutoreleasedReturnValue();
        kbSnapshotter = v16->_kbSnapshotter;
        v16->_kbSnapshotter = (UIKBViewTreeSnapshotter *)v64;

        -[UIKBViewTreeSnapshotter snapshotView](v16->_kbSnapshotter, "snapshotView");
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = v16->_to;
        v16->_to = (UIView *)v66;

      }
      objc_msgSend(v11, "transitioningFrame");
      v16->_toRect.origin.x = v68;
      v16->_toRect.origin.y = v69;
      v16->_toRect.size.width = v70;
      v16->_toRect.size.height = v71;
      objc_msgSend(v11, "transitioningView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "superview");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "addSubview:", v16->_to);

      if ((objc_msgSend(MEMORY[0x1E0CD28B0], "currentState") & 8) != 0)
      {
        -[UIView window](v16->_to, "window");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v74;
        if (v74 && objc_msgSend(v74, "_isHostedInAnotherProcess"))
        {
          v76 = v16->_to;
          v77 = objc_initWeak(&location, v76);
          -[UIView setAlpha:](v76, "setAlpha:", 0.0);

          Current = CFRunLoopGetCurrent();
          v79 = (const void *)*MEMORY[0x1E0C9B270];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __114__UIInputViewAnimationControllerViewControllerContext_initWithHost_startPlacement_endPlacement_transitionContext___block_invoke;
          block[3] = &unk_1E16B3F40;
          objc_copyWeak(&v84, &location);
          CFRunLoopPerformBlock(Current, v79, block);
          v80 = CFRunLoopGetCurrent();
          CFRunLoopWakeUp(v80);
          objc_destroyWeak(&v84);
          objc_destroyWeak(&location);
        }

      }
    }
    objc_msgSend(v11, "setInputViewsHidden:", 1);

  }
  return v16;
}

void __114__UIInputViewAnimationControllerViewControllerContext_initWithHost_startPlacement_endPlacement_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);

}

- (void)dealloc
{
  UIInputViewSet *preservedInputViewSet;
  void *v4;
  UIInputViewSet *v5;
  objc_super v6;

  preservedInputViewSet = self->_preservedInputViewSet;
  if (preservedInputViewSet)
  {
    +[UIInputViewSet inputSetWithOriginalInputSet:duplicateInputView:duplicateInputAccessoryView:duplicateInputAssistantView:](UIInputViewSet, "inputSetWithOriginalInputSet:duplicateInputView:duplicateInputAccessoryView:duplicateInputAssistantView:", preservedInputViewSet, 1, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewAnimationHost changeToInputViewSet:](self->_host, "changeToInputViewSet:", v4);
    v5 = self->_preservedInputViewSet;
    self->_preservedInputViewSet = 0;

  }
  +[UIKeyboard forceKeyboardAlpha:](UIKeyboard, "forceKeyboardAlpha:", 1.0);
  -[UIInputViewAnimationHost setInputViewsHidden:](self->_host, "setInputViewsHidden:", 0);
  -[UIInputViewAnimationHost setKeyboardWindowSnapshotOn:](self->_host, "setKeyboardWindowSnapshotOn:", 0);
  -[UIView removeFromSuperview](self->_from, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_to, "removeFromSuperview");
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewAnimationControllerViewControllerContext;
  -[UIInputViewAnimationControllerViewControllerContext dealloc](&v6, sel_dealloc);
}

+ (id)contextWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  UIInputViewAnimationControllerViewControllerContext *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[UIInputViewAnimationControllerViewControllerContext initWithHost:startPlacement:endPlacement:transitionContext:]([UIInputViewAnimationControllerViewControllerContext alloc], "initWithHost:startPlacement:endPlacement:transitionContext:", v12, v11, v10, v9);

  return v13;
}

- (UIViewControllerContextTransitioning)mainContext
{
  return (UIViewControllerContextTransitioning *)self->_context;
}

- (UIView)fromKeyboard
{
  return self->_from;
}

- (CGRect)fromKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_fromRect.origin.x;
  y = self->_fromRect.origin.y;
  width = self->_fromRect.size.width;
  height = self->_fromRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIView)toKeyboard
{
  return self->_to;
}

- (CGRect)toKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_toRect.origin.x;
  y = self->_toRect.origin.y;
  width = self->_toRect.size.width;
  height = self->_toRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preservedInputViewSet, 0);
  objc_storeStrong((id *)&self->_kbSnapshotter, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
