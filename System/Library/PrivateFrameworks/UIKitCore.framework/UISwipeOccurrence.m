@implementation UISwipeOccurrence

- (UISwipeOccurrence)initWithController:(id)a3 indexPath:(id)a4 defaultStyle:(unint64_t)a5
{
  id v9;
  id v10;
  UISwipeOccurrence *v11;
  UISwipeOccurrence *v12;
  char v13;
  void *v15;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeOccurrence.m"), 111, CFSTR("Index path must not be nil"));

  }
  v16.receiver = self;
  v16.super_class = (Class)UISwipeOccurrence;
  v11 = -[UISwipeOccurrence init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_controller, v9);
    -[UISwipeOccurrence setIndexPath:](v12, "setIndexPath:", v10);
    v12->_defaultStyle = a5;
    if (objc_msgSend(v9, "_prefersRTL"))
      v13 = 16;
    else
      v13 = 0;
    *(_BYTE *)&v12->_flags = *(_BYTE *)&v12->_flags & 0xEF | v13;
    -[UISwipeOccurrence setupManipulatorWithController:](v12, "setupManipulatorWithController:", v9);
    -[UISwipeOccurrence updateSwipedView](v12, "updateSwipedView");
  }

  return v12;
}

- (void)setupManipulatorWithController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  _UIDefaultSwipeViewManipulator *v7;
  _UISwipeViewManipulator *manipulator;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "_internalSwipeActionHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (objc_msgSend(v9, "_internalSwipeActionHost"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "swipeViewManipulatorForSwipeActionController:", v9),
        v7 = (_UIDefaultSwipeViewManipulator *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v7 = objc_alloc_init(_UIDefaultSwipeViewManipulator);
  }
  manipulator = self->_manipulator;
  self->_manipulator = (_UISwipeViewManipulator *)v7;

}

- (unint64_t)_styleForConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t *p_defaultStyle;
  unint64_t v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "_swipeActionsStyle");
    p_defaultStyle = (unint64_t *)((char *)&unk_1866841A8 + 8 * v6 - 8);
    if ((unint64_t)(v6 - 1) >= 3)
      p_defaultStyle = &self->_defaultStyle;
  }
  else
  {
    p_defaultStyle = &self->_defaultStyle;
  }
  v8 = *p_defaultStyle;

  return v8;
}

- ($A7B7FA971CD029BAA4A09478E9E1AEDA)prepareWithSwipeDirection:(SEL)a3 configuration:(unint64_t)a4
{
  id v9;
  double v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  char v33;
  double v34;
  double v35;
  double v36;
  $A7B7FA971CD029BAA4A09478E9E1AEDA *result;
  SEL v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a4)
  {
    self->_direction = a4 == 2;
    self->_style = -[UISwipeOccurrence _styleForConfiguration:](self, "_styleForConfiguration:", v9);
    if (v9)
      objc_msgSend(v9, "_roundedStyleCornerRadius");
    else
      v10 = 0.0;
    self->_roundedStyleCornerRadius = v10;
    -[UISwipeOccurrence _pullViewForSwipeDirection:](self, "_pullViewForSwipeDirection:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    -[UISwipeOccurrence _removeAndResetPullViewImmediately:](self, "_removeAndResetPullViewImmediately:", self->_leadingPullView);
    -[UISwipeOccurrence _removeAndResetPullViewImmediately:](self, "_removeAndResetPullViewImmediately:", self->_trailingPullView);
    self->_configuredDirection = 0;
    objc_msgSend(v9, "actions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(v16, "setAutosizesButtons:", objc_msgSend(v9, "_autosizesButtons"));
      objc_msgSend(v16, "configureWithSwipeActions:", v17);
      if (self->_swipedView)
      {
        v38 = a3;
        WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(WeakRetained, "_internalSwipeActionHost");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_opt_respondsToSelector();

        if ((v20 & 1) == 0)
        {
          -[_UISwipedView superview](self->_swipedView, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addSubview:", v16);
          goto LABEL_20;
        }
        v21 = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(v21, "_internalSwipeActionHost");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_loadWeakRetained((id *)&self->_controller);
        v24 = objc_msgSend(v22, "swipeActionController:insertActionsView:forItemAtIndexPath:", v23, v16, self->_indexPath);

        if (v24)
        {
          objc_msgSend(v16, "superview");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
LABEL_21:
            objc_msgSend(v16, "primarySwipeAction");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v9, "performsFirstActionWithFullSwipe"))
            {
              objc_msgSend(v30, "_menu");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v31 == 0;

            }
            else
            {
              v32 = 0;
            }
            v33 = objc_msgSend(v30, "isDestructive");
            objc_msgSend(v16, "openThreshold");
            v35 = v34;
            objc_msgSend(v16, "confirmationThreshold");
            retstr->var0 = a4;
            retstr->var1 = v33;
            retstr->var2 = v32;
            *(_DWORD *)(&retstr->var2 + 1) = 0;
            *(_WORD *)(&retstr->var2 + 5) = 0;
            retstr->var3 = v35;
            retstr->var4 = v36;
            self->_configuredDirection = a4;
            self->_styleFromConfiguration = objc_msgSend(v9, "_swipeActionsStyle");
            -[UISwipeOccurrence _updatePullView:](self, "_updatePullView:", v16);
            -[UISwipeOccurrence setActive:](self, "setActive:", 1);
            -[UISwipeOccurrence _updateSwipedStateOnSwipedView:](self, "_updateSwipedStateOnSwipedView:", 1);
            if (-[_UISwipedView isUserInteractionEnabled](self->_swipedView, "isUserInteractionEnabled"))
            {
              -[_UISwipedView _resignIfContainsFirstResponder](self->_swipedView, "_resignIfContainsFirstResponder");
              if (-[UISwipeOccurrence active](self, "active"))
              {
                *(_BYTE *)&self->_flags |= 8u;
                -[_UISwipedView setUserInteractionEnabled:](self->_swipedView, "setUserInteractionEnabled:", 0);
              }
            }

            if (!-[UISwipeOccurrence active](self, "active"))
            {
              -[UISwipeOccurrence _removeAndResetPullViewImmediately:](self, "_removeAndResetPullViewImmediately:", v16);
              self->_styleFromConfiguration = 0;
            }
            goto LABEL_29;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_swipeActionController_insertActionsView_forItemAtIndexPath_);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_loadWeakRetained((id *)&self->_controller);
          objc_msgSend(v28, "swipeActionHost");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v38, self, CFSTR("UISwipeOccurrence.m"), 187, CFSTR("Actions view not added to view hierarchy after calling -%@ on %@"), v27, v29);

LABEL_20:
          goto LABEL_21;
        }
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    NSStringFromSelector(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUISwipeDirection(0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: -%@ was called with a swipe direction of %@.", buf, 0x16u);
  }
  else
  {
    v11 = prepareWithSwipeDirection_configuration____s_category;
    if (!prepareWithSwipeDirection_configuration____s_category)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&prepareWithSwipeDirection_configuration____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v13 = v12;
    NSStringFromSelector(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromUISwipeDirection(0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: -%@ was called with a swipe direction of %@.", buf, 0x16u);
  }

LABEL_10:
LABEL_11:
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
LABEL_30:

  return result;
}

- (void)resetWhilePreparing
{
  -[UISwipeOccurrence setActive:](self, "setActive:", 0);
}

- (void)setOffset:(double)a3
{
  _BOOL8 v5;
  double springStiffness;
  void *v8;
  __int128 v9;
  char v10;
  _BYTE v11[7];
  double v12;
  uint64_t v13;
  double v14;

  if (self->_state == 2)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeOccurrence.m"), 256, CFSTR("Manually modifyng the offset is only allowed while in .tracking state."));

    v5 = self->_state == 2;
  }
  v9 = *(_OWORD *)&self->_currentSwipeInfo.direction;
  *(_DWORD *)v11 = *(_DWORD *)(&self->_currentSwipeInfo.animated + 1);
  *(_DWORD *)&v11[3] = *((_DWORD *)&self->_currentSwipeInfo.animated + 1);
  springStiffness = self->_currentSwipeInfo.springStiffness;
  v10 = 0;
  v12 = a3;
  v13 = 0;
  v14 = springStiffness;
  -[UISwipeOccurrence updateOffsetWithSwipeInfo:isTracking:completion:](self, "updateOffsetWithSwipeInfo:isTracking:completion:", &v9, v5, 0);
}

- (double)velocity
{
  return self->_currentSwipeInfo.initialSpringVelocity;
}

- (void)beginSwipeTracking:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (self->_swipedView)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UISwipeViewManipulator removeAnimationsFromSwipedView:atIndexPath:](self->_manipulator, "removeAnimationsFromSwipedView:atIndexPath:", self->_swipedView, self->_indexPath);
    -[UISwipeOccurrence _freezeSwipedViewInsets](self, "_freezeSwipedViewInsets");
  }
  -[UISwipeActionPullView freeze](self->_leadingPullView, "freeze");
  -[UISwipeActionPullView freeze](self->_trailingPullView, "freeze");
  if (v3)
    -[UISwipeOccurrence _transitionToState:](self, "_transitionToState:", 2);
}

- (void)_forceTeardown
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    *(_BYTE *)&self->_flags |= 2u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "swipeOccurrence:willFinishWithDeletion:", self, 0);

  }
  -[UISwipeOccurrence endSwipe](self, "endSwipe");
  self->_styleFromConfiguration = 0;
}

- (void)endSwipe
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    -[UISwipeOccurrence _unfreezeSwipedViewInsets](self, "_unfreezeSwipedViewInsets");
    *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity = 0u;
    *(_OWORD *)&self->_currentSwipeInfo.animated = 0u;
    *(_OWORD *)&self->_currentSwipeInfo.direction = 0u;
    *(_BYTE *)&self->_flags |= 4u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "swipeOccurrenceDidFinish:", self);

  }
}

- (void)updateOffsetWithSwipeInfo:(id *)a3 isTracking:(BOOL)a4 completion:(id)a5
{
  id v8;
  _BOOL8 var2;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v8 = a5;
  if (a3->var3 != 0.0 || a4)
  {
    v13 = *(_OWORD *)&a3->var2;
    v14 = *(_OWORD *)&a3->var0;
    v15 = v13;
    v16 = *(_OWORD *)&a3->var4;
    -[UISwipeOccurrence _moveItemWithSwipeInfo:alongsideAnimations:completion:](self, "_moveItemWithSwipeInfo:alongsideAnimations:completion:", &v14, 0, v8);
    if (a4)
    {
      v12 = 2;
      goto LABEL_7;
    }
  }
  else
  {
    var2 = a3->var2;
    v10 = *(_OWORD *)&a3->var2;
    v11 = *(_OWORD *)&a3->var4;
    v14 = *(_OWORD *)&a3->var0;
    v15 = v10;
    v16 = v11;
    -[UISwipeOccurrence _resetItemWithSwipeInfo:animated:deletion:completion:](self, "_resetItemWithSwipeInfo:animated:deletion:completion:", &v14, var2, 0, v8);
  }
  v12 = a3->var3 != 0.0;
LABEL_7:
  -[UISwipeOccurrence _transitionToState:](self, "_transitionToState:", v12);

}

- (CGRect)swipedViewRestingFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UISwipeViewManipulator restingFrameForSwipedView:atIndexPath:](self->_manipulator, "restingFrameForSwipedView:atIndexPath:", self->_swipedView, self->_indexPath);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_moveItemWithSwipeInfo:(id *)a3 alongsideAnimations:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  id v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  _UISwipeViewManipulator *manipulator;
  _UISwipedView *swipedView;
  NSIndexPath *indexPath;
  __int128 v16;
  void *v17;
  double var3;
  double v19;
  _QWORD v20[4];
  id v21;
  _OWORD v22[3];

  v8 = (void (**)(_QWORD))a4;
  v9 = a5;
  self->_offset = a3->var3;
  if (self->_swipedView)
  {
    v10 = *(_OWORD *)&a3->var0;
    v11 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity = *(_OWORD *)&a3->var4;
    *(_OWORD *)&self->_currentSwipeInfo.animated = v11;
    *(_OWORD *)&self->_currentSwipeInfo.direction = v10;
    if (a3->var2)
    {
      +[_UISwipeAnimationFactory animatorForMoveWithOccurrence:](_UISwipeAnimationFactory, "animatorForMoveWithOccurrence:", self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    if ((*(_BYTE *)&self->_flags & 0x60) == 0)
    {
      manipulator = self->_manipulator;
      swipedView = self->_swipedView;
      indexPath = self->_indexPath;
      v16 = *(_OWORD *)&a3->var2;
      v22[0] = *(_OWORD *)&a3->var0;
      v22[1] = v16;
      v22[2] = *(_OWORD *)&a3->var4;
      -[_UISwipeViewManipulator moveSwipedView:atIndexPath:withSwipeInfo:animator:](manipulator, "moveSwipedView:atIndexPath:withSwipeInfo:animator:", swipedView, indexPath, v22, v12);
    }
    if (a3->var0)
    {
      -[UISwipeOccurrence _pullViewForSwipeDirection:](self, "_pullViewForSwipeDirection:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setState:", a3->var1);
      var3 = a3->var3;
      -[UISwipeOccurrence _extraOffsetForOffset:withDirection:](self, "_extraOffsetForOffset:withDirection:", a3->var0, var3);
      objc_msgSend(v17, "moveToOffset:extraOffset:animator:usingSpringWithStiffness:initialVelocity:", v12, var3, v19, a3->var5, a3->var4);

    }
    if (v12)
    {
      if (v8)
        objc_msgSend(v12, "addAnimations:", v8);
      if (v9)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __75__UISwipeOccurrence__moveItemWithSwipeInfo_alongsideAnimations_completion___block_invoke;
        v20[3] = &unk_1E16BDBD8;
        v21 = v9;
        objc_msgSend(v12, "addCompletion:", v20);

      }
      objc_msgSend(v12, "startAnimation");
    }
    else
    {
      if (v8)
        v8[2](v8);
      if (v9)
        (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
    }

  }
}

uint64_t __75__UISwipeOccurrence__moveItemWithSwipeInfo_alongsideAnimations_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (void)resetAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _BOOL8 v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v6 = a4;
  if (v4)
  {
    v10 = UISwipeInfoNoneAnimated;
    v11 = unk_186684180;
    v12 = xmmword_186684190;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  if (-[UISwipeOccurrence state](self, "state") == 4)
  {
    -[UISwipeOccurrence currentAction](self, "currentAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "style") == 1;

  }
  else
  {
    v8 = 0;
  }
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  -[UISwipeOccurrence _resetItemWithSwipeInfo:animated:deletion:completion:](self, "_resetItemWithSwipeInfo:animated:deletion:completion:", v9, v4, v8, v6);

}

- (void)resetForReconfiguration
{
  _OWORD v2[3];

  memset(v2, 0, sizeof(v2));
  -[UISwipeOccurrence _resetItemWithSwipeInfo:animated:deletion:completion:](self, "_resetItemWithSwipeInfo:animated:deletion:completion:", v2, 0, 0, 0);
}

- (void)_resetItemWithSwipeInfo:(id *)a3 animated:(BOOL)a4 deletion:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  int v11;
  UIContextualAction *currentAction;
  UIContextualAction *v13;
  uint64_t v14;
  UISwipeActionPullView *v15;
  UISwipeActionPullView *v16;
  UISwipeActionPullView *v17;
  UISwipeActionPullView *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  _BOOL4 v25;
  void *v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  UISwipeActionPullView *v31;
  UISwipeActionPullView *v32;
  id v33;
  BOOL v34;
  _QWORD aBlock[6];

  v6 = a5;
  v7 = a4;
  v10 = a6;
  -[UISwipeOccurrence setActive:](self, "setActive:", 0);
  if (self->_configuredDirection)
  {
    if (v7)
    {
      if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 4)
        v11 = *(_BYTE *)&self->_flags & 1;
      else
        v11 = 1;
      v25 = v11;
    }
    else
    {
      v25 = 0;
    }
    currentAction = self->_currentAction;
    if (currentAction)
    {
      -[UIContextualAction cancel](currentAction, "cancel");
      v13 = self->_currentAction;
      self->_currentAction = 0;

    }
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke;
    aBlock[3] = &unk_1E16B1B28;
    aBlock[4] = self;
    v26 = _Block_copy(aBlock);
    v15 = self->_leadingPullView;
    v16 = self->_trailingPullView;
    v30[0] = v14;
    v30[1] = 3221225472;
    v30[2] = __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke_2;
    v30[3] = &unk_1E16E3318;
    v30[4] = self;
    v17 = v15;
    v31 = v17;
    v18 = v16;
    v32 = v18;
    v34 = v6;
    v33 = v10;
    v19 = _Block_copy(v30);
    v28 = 0u;
    v29 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "swipeHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "currentSwipeConfig");
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
    }

    if (!a3->var0)
    {
      a3->var2 = v25;
      a3->var0 = v28;
      if (v25)
        *(_OWORD *)&a3->var4 = xmmword_18666F250;
      a3->var3 = 0.0;
    }
    self->_configuredDirection = 0;
    *(_BYTE *)&self->_flags |= 2u;
    v23 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v23, "swipeOccurrence:willFinishWithDeletion:", self, v6);

    if (v6)
      -[UISwipeOccurrence endSwipe](self, "endSwipe");
    v24 = *(_OWORD *)&a3->var2;
    v27[0] = *(_OWORD *)&a3->var0;
    v27[1] = v24;
    v27[2] = *(_OWORD *)&a3->var4;
    -[UISwipeOccurrence _moveItemWithSwipeInfo:alongsideAnimations:completion:](self, "_moveItemWithSwipeInfo:alongsideAnimations:completion:", v27, v26, v19);

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

uint64_t __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 8) & 8) != 0)
  {
    objc_msgSend(*(id *)(v2 + 136), "setUserInteractionEnabled:", 1);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v2, "_updateSwipedStateOnSwipedView:", 0);
}

uint64_t __74__UISwipeOccurrence__resetItemWithSwipeInfo_animated_deletion_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "active") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_removeAndResetPullViewImmediately:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_removeAndResetPullViewImmediately:", *(_QWORD *)(a1 + 48));
    if (!*(_BYTE *)(a1 + 64))
      objc_msgSend(*(id *)(a1 + 32), "endSwipe");
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (int64_t)_styleFromConfiguration
{
  return self->_styleFromConfiguration;
}

- (void)updateLayout
{
  if (!self->_currentAction)
    -[UISwipeOccurrence _updateLayoutUsingCurrentSwipeInfo:](self, "_updateLayoutUsingCurrentSwipeInfo:", 0);
}

- (void)_updateLayoutUsingCurrentSwipeInfo:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t direction;
  unint64_t targetSwipeState;
  double xOffset;
  void *v9;
  __int128 v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _OWORD v14[3];
  __int128 v15;
  _OWORD v16[2];
  __int128 v17;
  _DWORD v18[2];

  v3 = a3;
  if (!-[UISwipeOccurrence active](self, "active"))
    return;
  v5 = -[UISwipeOccurrence state](self, "state");
  if (v5 <= 5 && ((1 << v5) & 0x25) != 0
    || (v18[0] = 0, *(_DWORD *)((char *)v18 + 3) = 0, v17 = xmmword_186684160, v3))
  {
    direction = self->_currentSwipeInfo.direction;
    targetSwipeState = self->_currentSwipeInfo.targetSwipeState;
    v18[0] = *(_DWORD *)(&self->_currentSwipeInfo.animated + 1);
    *(_DWORD *)((char *)v18 + 3) = *((_DWORD *)&self->_currentSwipeInfo.animated + 1);
    xOffset = self->_currentSwipeInfo.xOffset;
    v17 = *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity;
    if (!direction)
      return;
    goto LABEL_5;
  }
  v15 = 0u;
  v16[0] = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "swipeHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "currentSwipeConfig");
  }
  else
  {
    v15 = 0u;
    v16[0] = 0u;
  }

  targetSwipeState = 0;
  direction = v15;
  xOffset = *(double *)v16;
  if ((_QWORD)v15)
  {
LABEL_5:
    -[UISwipeOccurrence _unfreezeSwipedViewInsets](self, "_unfreezeSwipedViewInsets");
    v15 = 0uLL;
    *(_OWORD *)((char *)v16 + 1) = unk_186684151;
    v16[1] = xmmword_186684160;
    LOBYTE(v16[0]) = 0;
    -[UISwipeOccurrence _moveItemWithSwipeInfo:alongsideAnimations:completion:](self, "_moveItemWithSwipeInfo:alongsideAnimations:completion:", &v15, 0, 0);
    -[UISwipeOccurrence _pullViewForSwipeDirection:](self, "_pullViewForSwipeDirection:", direction);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v14[0] = *MEMORY[0x1E0C9BAA8];
    v14[1] = v10;
    v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v9, "setTransform:", v14);
    -[UISwipeOccurrence _updatePullView:](self, "_updatePullView:", v9);
    -[UISwipeOccurrence _freezeSwipedViewInsets](self, "_freezeSwipedViewInsets");
    *(_QWORD *)&v15 = direction;
    *((_QWORD *)&v15 + 1) = targetSwipeState;
    LOBYTE(v16[0]) = 0;
    *(_DWORD *)((char *)v16 + 1) = v18[0];
    DWORD1(v16[0]) = *(_DWORD *)((char *)v18 + 3);
    *((double *)v16 + 1) = xOffset;
    v16[1] = v17;
    -[UISwipeOccurrence _moveItemWithSwipeInfo:alongsideAnimations:completion:](self, "_moveItemWithSwipeInfo:alongsideAnimations:completion:", &v15, 0, 0);

  }
}

- (void)updateSwipedView
{
  id WeakRetained;
  _UISwipedView *v4;
  _UISwipedView *swipedView;
  CGRect v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "_swipedViewForItemAtIndexPath:", self->_indexPath);
  v4 = (_UISwipedView *)objc_claimAutoreleasedReturnValue();
  swipedView = self->_swipedView;
  self->_swipedView = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UISwipedView frame](self->_swipedView, "frame");
    -[_UISwipeViewManipulator setSwipedViewRestingOffset:](self->_manipulator, "setSwipedViewRestingOffset:", CGRectGetMinX(v6));
  }
}

- (void)_updateSwipedStateOnSwipedView:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_UISwipedView _setSwiped:](self->_swipedView, "_setSwiped:", v3);
}

- (void)_freezeSwipedViewInsets
{
  -[_UISwipedView _setSafeAreaInsetsFrozen:](self->_swipedView, "_setSafeAreaInsetsFrozen:", 1);
  -[_UISwipedView _setDontUpdateInferredLayoutMargins:](self->_swipedView, "_setDontUpdateInferredLayoutMargins:", 1);
}

- (void)_unfreezeSwipedViewInsets
{
  -[_UISwipedView _setSafeAreaInsetsFrozen:](self->_swipedView, "_setSafeAreaInsetsFrozen:", 0);
  -[_UISwipedView _setDontUpdateInferredLayoutMargins:](self->_swipedView, "_setDontUpdateInferredLayoutMargins:", 0);
  -[_UISwipedView _updateInferredLayoutMargins](self->_swipedView, "_updateInferredLayoutMargins");
}

- (void)performPrimaryActionWithSwipeInfo:(id *)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  _OWORD v8[3];

  -[UISwipeOccurrence _pullViewForSwipeDirection:](self, "_pullViewForSwipeDirection:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primarySwipeAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a3->var4;
  -[UISwipeOccurrence _performSwipeAction:inPullView:swipeInfo:](self, "_performSwipeAction:inPullView:swipeInfo:", v6, v5, v8);

}

- (BOOL)shouldDismissWithTouchLocation:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v7;
  void *v8;
  UISwipeActionPullView **p_leadingPullView;
  void *v10;
  UISwipeActionPullView **p_trailingPullView;
  UISwipeActionPullView *trailingPullView;
  void *v13;
  int v14;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTest:withEvent:", 0, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  p_leadingPullView = &self->_leadingPullView;
  -[UIView window](self->_leadingPullView, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    trailingPullView = self->_trailingPullView;
    p_trailingPullView = &self->_trailingPullView;
    -[UIView window](trailingPullView, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      LOBYTE(v14) = 1;
      goto LABEL_5;
    }
    p_leadingPullView = p_trailingPullView;
  }
  v14 = objc_msgSend(v8, "isDescendantOfView:", *p_leadingPullView) ^ 1;
LABEL_5:

  return v14;
}

- (void)_transitionToState:(int64_t)a3
{
  char flags;
  int64_t state;
  id WeakRetained;
  int64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;

  flags = (char)self->_flags;
  *(_BYTE *)&self->_flags = flags | 1;
  state = self->_state;
  if ((state & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v7 = a3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR(".closed");
    v11 = CFSTR(".triggered");
    if (state != 4)
      v11 = CFSTR(".closed");
    if (state == 5)
      v11 = CFSTR(".cancelled");
    if ((unint64_t)(v7 - 1) <= 4)
      v10 = off_1E16E3388[v7 - 1];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeOccurrence.m"), 678, CFSTR("Transitioning from %@ to %@ is not a valid transition."), v11, v10);

    a3 = v7;
  }
  self->_state = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "swipeOccurrence:didChangeStateFrom:", self, state);

  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | flags & 1;
}

- (void)_setHasAmbiguousIndexPath
{
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (BOOL)_hasAmbiguousIndexPath
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_setDidReloadData
{
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (BOOL)_didReloadData
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unint64_t)_style
{
  return self->_style;
}

- (void)_executeLifecycleForPerformedAction:(id)a3 sourceView:(id)a4 completionHandler:(id)a5
{
  id v10;
  id v11;
  id v12;
  UISwipeOccurrence *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  NSObject *v29;
  os_signpost_id_t v30;
  os_signpost_id_t v31;
  void *v32;
  char v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  SEL v42;
  uint64_t v43;
  uint8_t buf[8];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  WeakRetained = objc_loadWeakRetained((id *)&v13->_controller);
  -[UISwipeOccurrence indexPath](v13, "indexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v13->_currentAction, a3);
  objc_msgSend(WeakRetained, "swipeActionHost");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "swipeActionHost");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "swipeActionController:willPerformAction:atIndexPath:", WeakRetained, v10, v15);

  }
  -[UISwipeOccurrence _transitionToState:](v13, "_transitionToState:", 3);
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v19 = v13->_actionExecutionCounter + 1;
  v13->_actionExecutionCounter = v19;
  v20 = _MergedGlobals_1230;
  if (!_MergedGlobals_1230)
  {
    v20 = __UILogCategoryGetNode("SwipeActions", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v20, (unint64_t *)&_MergedGlobals_1230);
  }
  v21 = *(id *)(v20 + 8);
  v22 = os_signpost_id_make_with_pointer(*(os_log_t *)(v20 + 8), v13);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v23 = v22;
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ExecuteSwipeActionHandler", ", buf, 2u);
    }
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __86__UISwipeOccurrence__executeLifecycleForPerformedAction_sourceView_completionHandler___block_invoke;
  v35[3] = &unk_1E16E3340;
  v40 = &v49;
  v35[4] = v13;
  v42 = a2;
  v43 = v19;
  v24 = v12;
  v39 = v24;
  v25 = v10;
  v36 = v25;
  v26 = WeakRetained;
  v37 = v26;
  v27 = v15;
  v38 = v27;
  v41 = &v45;
  objc_msgSend(v25, "executeHandlerWithView:completionHandler:", v11, v35);
  v28 = qword_1ECD80870;
  if (!qword_1ECD80870)
  {
    v28 = __UILogCategoryGetNode("SwipeActions", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v28, (unint64_t *)&qword_1ECD80870);
  }
  v29 = *(id *)(v28 + 8);
  v30 = os_signpost_id_make_with_pointer(*(os_log_t *)(v28 + 8), v13);
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v31 = v30;
    if (os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v29, OS_SIGNPOST_INTERVAL_END, v31, "ExecuteSwipeActionHandler", ", buf, 2u);
    }
  }

  objc_msgSend(v26, "swipeActionHost");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_opt_respondsToSelector();

  if ((v33 & 1) != 0)
  {
    objc_msgSend(v26, "swipeActionHost");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "swipeActionController:didPerformAction:atIndexPath:", v26, v25, v27);

  }
  *((_BYTE *)v46 + 24) = 1;
  if (*((_BYTE *)v50 + 24) && (v13->_state & 0xFFFFFFFFFFFFFFFELL) != 4)
    -[UISwipeOccurrence _transitionToState:](v13, "_transitionToState:", 5);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

}

void __86__UISwipeOccurrence__executeLifecycleForPerformedAction_sourceView_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32), CFSTR("UISwipeOccurrence.m"), 759, CFSTR("A UIContextualAction's completionHandler was called multiple times."));

    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  }
  *(_BYTE *)(v4 + 24) = 1;
  v5 = *(_QWORD **)(a1 + 32);
  if (v5[2] != *(_QWORD *)(a1 + 96))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    UIContextualActionAlertForOutdatedCompletionHandlerExecution(*(void **)(a1 + 40));
    goto LABEL_16;
  }
  if ((objc_msgSend(v5, "state") & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    if ((a2 & 1) != 0)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "style") != 1)
      {
        v6 = *(_QWORD **)(a1 + 32);
        v7 = 4;
        goto LABEL_14;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
        goto LABEL_15;
      v6 = *(_QWORD **)(a1 + 32);
      if (v6[15] != 3)
        goto LABEL_15;
    }
    else
    {
      v6 = *(_QWORD **)(a1 + 32);
    }
    v7 = 5;
LABEL_14:
    objc_msgSend(v6, "_transitionToState:", v7);
  }
LABEL_15:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_16:
  objc_msgSend(*(id *)(a1 + 48), "swipeActionHost");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "swipeActionHost");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "swipeActionController:didCompleteAction:cancelled:atIndexPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), a2 ^ 1u, *(_QWORD *)(a1 + 56));

  }
}

- (void)_performSwipeAction:(id)a3 inPullView:(id)a4 swipeInfo:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  unint64_t var0;
  unint64_t var1;
  BOOL var2;
  double var3;
  double var4;
  double var5;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  UISwipeOccurrence *v25;
  id v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  _BYTE v31[7];
  double v32;
  double v33;
  double v34;
  _DWORD v35[4];

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  -[UISwipeOccurrence indexPath](self, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_swipedViewForItemAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (-[UISwipeOccurrence state](self, "state") & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    objc_msgSend(v8, "executePreHandlerWithView:", v9);
    if (self->_direction)
      v13 = 2;
    else
      v13 = 1;
    -[UISwipeOccurrence _extraOffsetForOffset:withDirection:](self, "_extraOffsetForOffset:withDirection:", v13, self->_offset);
    objc_msgSend(v9, "_performAction:offset:extraOffset:", v8, self->_offset, v14);
    memset(v35, 0, 7);
    var0 = a5->var0;
    if (a5->var0)
    {
      var1 = a5->var1;
      var2 = a5->var2;
      v35[0] = *(_DWORD *)(&a5->var2 + 1);
      *(_DWORD *)((char *)v35 + 3) = *((_DWORD *)&a5->var2 + 1);
      var3 = a5->var3;
      var4 = a5->var4;
      var5 = a5->var5;
    }
    else
    {
      var0 = -[UISwipeOccurrence _swipeDirectionForPullView:](self, "_swipeDirectionForPullView:", v9);
      var5 = 1.0;
      var3 = 0.0;
      var2 = 1;
      var1 = 2;
      var4 = 0.0;
    }
    objc_msgSend(v9, "sourceViewForAction:", v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke;
    v22[3] = &unk_1E16E3368;
    v23 = WeakRetained;
    v24 = v8;
    v25 = self;
    v26 = v9;
    v27 = v12;
    v28 = var0;
    v29 = var1;
    v30 = var2;
    *(_DWORD *)v31 = v35[0];
    *(_DWORD *)&v31[3] = *(_DWORD *)((char *)v35 + 3);
    v32 = var3;
    v33 = var4;
    v34 = var5;
    -[UISwipeOccurrence _executeLifecycleForPerformedAction:sourceView:completionHandler:](self, "_executeLifecycleForPerformedAction:sourceView:completionHandler:", v24, v21, v22);

  }
}

void __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  char v33;

  objc_msgSend(*(id *)(a1 + 32), "swipeActionHost");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isDestructive"))
      v6 = a2 == 0;
    else
      v6 = 1;
    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_3;
      v21[3] = &unk_1E16B2B90;
      v22 = *(id *)(a1 + 32);
      v8 = *(id *)(a1 + 40);
      v25 = a2;
      v9 = *(_QWORD *)(a1 + 48);
      v23 = v8;
      v24 = v9;
      v10 = *(_OWORD *)(a1 + 88);
      v26 = *(_OWORD *)(a1 + 72);
      v27 = v10;
      v28 = *(_OWORD *)(a1 + 104);
      objc_msgSend(v7, "_resetItemWithSwipeInfo:animated:deletion:completion:", &v26, 1, 0, v21);

      v20 = v22;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "containerView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layoutIfNeeded");

      objc_msgSend(*(id *)(a1 + 48), "_updateLayoutUsingCurrentSwipeInfo:", 1);
      objc_msgSend(*(id *)(a1 + 56), "setAutoresizesSubviews:", 0);
      objc_msgSend(*(id *)(a1 + 56), "setClipsToBounds:", 1);
      objc_msgSend(*(id *)(a1 + 32), "swipeActionHost");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 64);
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "indexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_2;
      v29[3] = &unk_1E16BF810;
      v18 = *(void **)(a1 + 56);
      v29[4] = *(_QWORD *)(a1 + 48);
      v30 = v18;
      v31 = *(id *)(a1 + 32);
      v32 = *(id *)(a1 + 40);
      v33 = a2;
      v19 = *(_OWORD *)(a1 + 88);
      v26 = *(_OWORD *)(a1 + 72);
      v27 = v19;
      v28 = *(_OWORD *)(a1 + 104);
      objc_msgSend(v12, "swipeActionController:animateView:actionsView:forDestructiveAction:atIndexPath:withSwipeInfo:completion:", v15, v13, v14, v16, v17, &v26, v29);

      v20 = v30;
    }

  }
}

void __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _OWORD v12[3];

  v2 = *(void **)(a1 + 32);
  memset(v12, 0, sizeof(v12));
  objc_msgSend(v2, "_resetItemWithSwipeInfo:animated:deletion:completion:", v12, 0, 1, 0);
  objc_msgSend(*(id *)(a1 + 40), "setAutoresizesSubviews:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setClipsToBounds:", objc_msgSend(*(id *)(a1 + 40), "buttonsUnderlapSwipedView"));
  objc_msgSend(*(id *)(a1 + 48), "swipeActionHost");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "swipeActionHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_BYTE *)(a1 + 64) == 0;
    objc_msgSend(*(id *)(a1 + 32), "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "swipeActionController:didCompleteAnimationOfAction:canceled:atIndexPath:", v6, v7, v8, v9);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 144);
  *(_QWORD *)(v10 + 144) = 0;

}

void __62__UISwipeOccurrence__performSwipeAction_inPullView_swipeInfo___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "swipeActionHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "swipeActionHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_BYTE *)(a1 + 56) == 0;
    objc_msgSend(*(id *)(a1 + 48), "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "swipeActionController:didCompleteAnimationOfAction:canceled:atIndexPath:", v5, v6, v7, v8);

  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(v9 + 144);
  *(_QWORD *)(v9 + 144) = 0;

}

- (double)_extraOffsetForOffset:(double)a3 withDirection:(unint64_t)a4
{
  double result;
  double v6;
  double v7;

  result = 0.0;
  if (a4 == 2)
  {
    if (a3 > 0.0)
    {
      -[UISwipeOccurrence extraInsets](self, "extraInsets", 0.0);
      return v7;
    }
  }
  else if (a4 == 1 && a3 < 0.0)
  {
    -[UISwipeOccurrence extraInsets](self, "extraInsets", 0.0);
    return v6;
  }
  return result;
}

- (BOOL)_isSwipeDirectionExposingLeadingEdgePullView:(unint64_t)a3
{
  int v5;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  int v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    if (a3 - 3 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_3;
    __UIFaultDebugAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Attempted to request the pull view for an unsupported swipe direction (%ld)", (uint8_t *)&v11, 0xCu);
    }

LABEL_14:
    v5 = (*(_BYTE *)&self->_flags >> 4) & 1;
    return a3 == 1 && v5 != 0;
  }
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = _isSwipeDirectionExposingLeadingEdgePullView____s_category;
    if (!_isSwipeDirectionExposingLeadingEdgePullView____s_category)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&_isSwipeDirectionExposingLeadingEdgePullView____s_category);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 134217984;
      v12 = a3;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Attempted to request the pull view for an unsupported swipe direction (%ld)", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_3:
  v5 = (*(_BYTE *)&self->_flags >> 4) & 1;
  if (a3 == 2 && !v5)
    return 1;
  return a3 == 1 && v5 != 0;
}

- (id)_pullViewForSwipeDirection:(unint64_t)a3
{
  -[UISwipeOccurrence _pullViewForLeadingEdge:](self, "_pullViewForLeadingEdge:", -[UISwipeOccurrence _isSwipeDirectionExposingLeadingEdgePullView:](self, "_isSwipeDirectionExposingLeadingEdgePullView:", a3));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_swipeDirectionForPullView:(id)a3
{
  UISwipeActionPullView *v4;
  int has_internal_diagnostics;
  UISwipeActionPullView *trailingPullView;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  int v14;
  UISwipeActionPullView *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (UISwipeActionPullView *)a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  trailingPullView = self->_trailingPullView;
  if (has_internal_diagnostics)
  {
    if (trailingPullView != v4 && self->_leadingPullView != v4)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Attempted to request the swipe direction for an unknown pull view: %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else if (trailingPullView != v4 && self->_leadingPullView != v4)
  {
    v12 = _swipeDirectionForPullView____s_category;
    if (!_swipeDirectionForPullView____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&_swipeDirectionForPullView____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Attempted to request the swipe direction for an unknown pull view: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  v7 = 1;
  if (self->_leadingPullView == v4)
    v8 = 1;
  else
    v8 = 2;
  if (self->_leadingPullView == v4)
    v7 = 2;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v9 = v8;
  else
    v9 = v7;

  return v9;
}

- (id)_pullViewForLeadingEdge:(BOOL)a3
{
  _BOOL4 v3;
  UISwipeActionPullView *trailingPullView;
  UISwipeActionPullView **p_leadingPullView;
  id WeakRetained;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  UISwipeActionPullView *v33;
  double right;
  double left;
  UISwipeActionPullView **p_trailingPullView;
  CGRect v37;

  v3 = a3;
  if (!a3)
  {
    trailingPullView = self->_trailingPullView;
    if (!trailingPullView)
    {
      p_leadingPullView = &self->_leadingPullView;
      if (self->_leadingPullView)
        goto LABEL_12;
      goto LABEL_8;
    }
    return trailingPullView;
  }
  p_leadingPullView = &self->_leadingPullView;
  trailingPullView = self->_leadingPullView;
  if (trailingPullView)
    return trailingPullView;
  if (self->_trailingPullView)
    goto LABEL_12;
LABEL_8:
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "swipeActionHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  v11 = objc_loadWeakRetained((id *)&self->_controller);
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "swipeActionHost");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v13, "swipeActionController:extraInsetsForItemAtIndexPath:", v14, self->_indexPath);
    self->_extraInsets.top = v15;
    self->_extraInsets.left = v16;
    self->_extraInsets.bottom = v17;
    self->_extraInsets.right = v18;

  }
  else
  {
    objc_msgSend(v11, "containerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    self->_extraInsets.top = v19;
    self->_extraInsets.left = v20;
    self->_extraInsets.bottom = v21;
    self->_extraInsets.right = v22;
  }

LABEL_12:
  v23 = 2;
  if (v3)
    v24 = 8;
  else
    v24 = 2;
  if (!v3)
    v23 = 8;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v25 = v24;
  else
    v25 = v23;
  v26 = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(v26, "swipeActionHost");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    v29 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v29, "swipeActionHost");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(v30, "swipeActionController:backgroundColorForItemAtIndexPath:", v31, self->_indexPath);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }
  -[_UISwipedView bounds](self->_swipedView, "bounds");
  v33 = -[UISwipeActionPullView initWithFrame:cellEdge:style:]([UISwipeActionPullView alloc], "initWithFrame:cellEdge:style:", v25, self->_style, 0.0, 0.0, 0.0, CGRectGetHeight(v37));
  -[UISwipeActionPullView _setRoundedStyleCornerRadius:](v33, "_setRoundedStyleCornerRadius:", self->_roundedStyleCornerRadius);
  -[UISwipeActionPullView setBackgroundPullColor:](v33, "setBackgroundPullColor:", v32);
  -[UISwipeActionPullView setDelegate:](v33, "setDelegate:", self);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if (v3)
      goto LABEL_25;
LABEL_27:
    left = self->_extraInsets.left;
    right = 0.0;
    goto LABEL_28;
  }
  if (v3)
    goto LABEL_27;
LABEL_25:
  right = self->_extraInsets.right;
  left = 0.0;
LABEL_28:
  -[UISwipeActionPullView setContentInsets:](v33, "setContentInsets:", 0.0, left, 0.0, right);
  if (v3)
    p_trailingPullView = p_leadingPullView;
  else
    p_trailingPullView = &self->_trailingPullView;
  objc_storeStrong((id *)p_trailingPullView, v33);

  return v33;
}

- (void)_updatePullView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _UISwipedView *swipedView;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  double Width;
  double v30;
  double v31;
  double v32;
  _BOOL8 v33;
  double v34;
  void *v35;
  _BOOL8 v36;
  unint64_t v37;
  NSObject *v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  void *v48;
  double v49;
  double MinX;
  NSObject *v51;
  uint8_t v52[16];
  uint8_t buf[16];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      swipedView = self->_swipedView;
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "containerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwipeOccurrence _frameForPullView:inSwipedItem:withContainer:](self, "_frameForPullView:inSwipedItem:withContainer:", v5, swipedView, v9);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;

      objc_msgSend(v5, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "convertRect:fromView:", self->_swipedView, v11, v13, v15, v17);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      objc_msgSend(v5, "setFrame:", v20, v22, v24, v26);
      if (self->_style == 1)
      {
        v27 = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(v27, "containerView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "frame");
        Width = CGRectGetWidth(v54);
        -[_UISwipedView frame](self->_swipedView, "frame");
        v30 = Width - CGRectGetWidth(v55);

        v31 = -v30;
        if (v30 >= 0.0)
          v31 = v30;
        v32 = v31 * 0.5;
        v33 = v32 > 20.0;
        v34 = 0.0;
        if (v32 <= 20.0)
          v34 = v32;
        objc_msgSend(v5, "setContentInsets:", 0.0, v34, 0.0, 0.0);
        v35 = v5;
        v36 = v33;
      }
      else
      {
        objc_msgSend(v5, "superview");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UISwipedView bounds](self->_swipedView, "bounds");
        objc_msgSend(v39, "convertRect:fromView:", self->_swipedView);
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v47 = v46;

        if (self->_configuredDirection == 1)
        {
          objc_msgSend(v5, "superview");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "bounds");
          v49 = CGRectGetWidth(v56);
          v57.origin.x = v41;
          v57.origin.y = v43;
          v57.size.width = v45;
          v57.size.height = v47;
          MinX = v49 - CGRectGetMaxX(v57);

        }
        else
        {
          v58.origin.x = v41;
          v58.origin.y = v43;
          v58.size.width = v45;
          v58.size.height = v47;
          MinX = CGRectGetMinX(v58);
        }
        v36 = fmax(MinX, 0.0) > 2.22044605e-16;
        v35 = v5;
      }
      objc_msgSend(v35, "setButtonsUnderlapSwipedView:", v36);
    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v51, OS_LOG_TYPE_FAULT, "The pullView is not in a view hierarchy. This is a UIKit bug.", buf, 2u);
      }

    }
    else
    {
      v37 = _updatePullView____s_category;
      if (!_updatePullView____s_category)
      {
        v37 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v37, (unint64_t *)&_updatePullView____s_category);
      }
      v38 = *(NSObject **)(v37 + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_185066000, v38, OS_LOG_TYPE_ERROR, "The pullView is not in a view hierarchy. This is a UIKit bug.", v52, 2u);
      }
    }
  }

}

- (CGRect)_frameForPullView:(id)a3 inSwipedItem:(id)a4 withContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  double Height;
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
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect result;
  CGRect v56;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "frame");
  Height = CGRectGetHeight(v51);
  v12 = Height;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "separatorStyle"))
  {
    objc_msgSend(v9, "_separatorHeight");
    v12 = Height - v13;
  }
  v14 = 0.0;
  if (self->_style == 1)
  {
    objc_msgSend(v10, "visibleBounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v10, "contentInset");
    objc_msgSend(v9, "convertRect:fromView:", v10, v16 + v26, v18 + v23, v20 - (v26 + v24), v22 - (v23 + v25));
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    objc_msgSend(v9, "bounds");
    v56.origin.x = v35;
    v56.origin.y = v36;
    v56.size.width = v37;
    v56.size.height = v38;
    v52.origin.x = v28;
    v52.origin.y = v30;
    v52.size.width = v32;
    v52.size.height = v34;
    v53 = CGRectIntersection(v52, v56);
    x = v53.origin.x;
    y = v53.origin.y;
    width = v53.size.width;
    v42 = v53.size.height;
    +[UISwipeActionCircularButton maximumButtonHeight](UISwipeActionCircularButton, "maximumButtonHeight");
    if (v12 >= v43)
      v12 = v43;
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = v42;
    CGRectGetMidY(v54);
    UIRoundToViewScale(v9);
    v45 = v44;
  }
  else
  {
    v45 = 0.0;
  }
  if (objc_msgSend(v8, "cellEdge") == 8)
  {
    objc_msgSend(v9, "frame");
    UIRoundToViewScale(v9);
    v14 = v46;
  }

  v47 = 0.0;
  v48 = v14;
  v49 = v45;
  v50 = v12;
  result.size.height = v50;
  result.size.width = v47;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (void)_removeAndResetPullViewImmediately:(id)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "_internalSwipeActionHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(v9, "_internalSwipeActionHost");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(v10, "swipeActionController:cleanupActionsView:forItemAtIndexPath:", v11, v17, self->_indexPath);

      objc_msgSend(v17, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_swipeActionController_cleanupActionsView_forItemAtIndexPath_);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(v15, "swipeActionHost");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeOccurrence.m"), 1113, CFSTR("Actions view not removed from view hierarchy after calling -%@ on %@"), v14, v16);

      }
    }
    else
    {
      objc_msgSend(v17, "removeFromSuperview");
    }
  }
  objc_msgSend(v17, "resetView");

}

- (id)_actionView
{
  -[UISwipeOccurrence currentSwipeInfo](self, "currentSwipeInfo");
  return 0;
}

- (id)lockActionViewForAnimation
{
  void *v2;

  -[UISwipeOccurrence _actionView](self, "_actionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutoresizesSubviews:", 0);
  objc_msgSend(v2, "setClipsToBounds:", 1);
  return v2;
}

- (void)unlockActionViewForAnimation:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwipeOccurrence.m"), 1151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pullView isKindOfClass:[UISwipeActionPullView class]]"));

  }
  objc_msgSend(v6, "setAutoresizesSubviews:", 1);
  objc_msgSend(v6, "setClipsToBounds:", objc_msgSend(v6, "buttonsUnderlapSwipedView"));

}

- (void)swipeActionPullView:(id)a3 tappedAction:(id)a4
{
  _OWORD v4[3];

  memset(v4, 0, sizeof(v4));
  -[UISwipeOccurrence _performSwipeAction:inPullView:swipeInfo:](self, "_performSwipeAction:inPullView:swipeInfo:", a4, a3, v4);
}

- (double)confirmationDistanceForPrimaryActionInSwipeActionPullView:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double result;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = -[UISwipeOccurrence _swipeDirectionForPullView:](self, "_swipeDirectionForPullView:", v4);
  v6 = objc_msgSend(v4, "primaryActionIsDestructive");

  if (v6)
  {
    -[_UISwipedView frame](self->_swipedView, "frame");
    v8 = v7;
    -[UISwipeOccurrence extraInsets](self, "extraInsets");
    result = v8 - v9 + -64.0;
    v12 = v8 - v11 + -29.0;
    if (v5 == 1)
      return v12;
  }
  else
  {
    -[_UISwipedView frame](self->_swipedView, "frame");
    return v13 * 0.525;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  unint64_t state;
  const __CFString *v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  state = self->_state;
  if (state > 5)
    v6 = CFSTR(".open");
  else
    v6 = off_1E16E33B0[state];
  v7 = CFSTR("right");
  if (!self->_direction)
    v7 = CFSTR("left");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; indexPath: %@, state: %@, direction: %@, offset: %g>"),
                       v4,
                       self,
                       self->_indexPath,
                       v6,
                       v7,
                       *(_QWORD *)&self->_offset);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)direction
{
  return self->_direction;
}

- (double)offset
{
  return self->_offset;
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)configuredDirection
{
  return self->_configuredDirection;
}

- (void)setConfiguredDirection:(unint64_t)a3
{
  self->_configuredDirection = a3;
}

- ($B18736ADBBD355D2E16F2B3CA0B0347D)currentSwipeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var5;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[4].var3;
  return self;
}

- (void)setCurrentSwipeInfo:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_currentSwipeInfo.initialSpringVelocity = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_currentSwipeInfo.animated = v4;
  *(_OWORD *)&self->_currentSwipeInfo.direction = v3;
}

- (UIEdgeInsets)extraInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_extraInsets.top;
  left = self->_extraInsets.left;
  bottom = self->_extraInsets.bottom;
  right = self->_extraInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setExtraInsets:(UIEdgeInsets)a3
{
  self->_extraInsets = a3;
}

- (_UISwipedView)swipedView
{
  return self->_swipedView;
}

- (void)setSwipedView:(id)a3
{
  objc_storeStrong((id *)&self->_swipedView, a3);
}

- (BOOL)swipedViewMaskWasRemoved
{
  return self->_swipedViewMaskWasRemoved;
}

- (void)setSwipedViewMaskWasRemoved:(BOOL)a3
{
  self->_swipedViewMaskWasRemoved = a3;
}

- (UIContextualAction)currentAction
{
  return self->_currentAction;
}

- (void)setCurrentAction:(id)a3
{
  objc_storeStrong((id *)&self->_currentAction, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_swipedView, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_manipulator, 0);
  objc_storeStrong((id *)&self->_trailingPullView, 0);
  objc_storeStrong((id *)&self->_leadingPullView, 0);
  objc_destroyWeak((id *)&self->_controller);
}

@end
