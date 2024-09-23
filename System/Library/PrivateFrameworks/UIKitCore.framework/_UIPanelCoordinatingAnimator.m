@implementation _UIPanelCoordinatingAnimator

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[_UIPanelCoordinatingAnimator animateAlongsideTransitionInView:animation:completion:](self, "animateAlongsideTransitionInView:animation:completion:", 0, a3, a4);
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *lateAnimations;
  NSMutableArray *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *clientCompletions;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
    goto LABEL_6;
  if (self->_isInStartAnimation)
  {
    lateAnimations = self->_lateAnimations;
    if (!lateAnimations)
    {
      v12 = (NSMutableArray *)objc_opt_new();
      v13 = self->_lateAnimations;
      self->_lateAnimations = v12;

      lateAnimations = self->_lateAnimations;
    }
    v14 = _Block_copy(v9);
    -[NSMutableArray addObject:](lateAnimations, "addObject:", v14);

LABEL_6:
    if (!v10)
      goto LABEL_10;
    goto LABEL_7;
  }
  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __86___UIPanelCoordinatingAnimator_animateAlongsideTransitionInView_animation_completion___block_invoke;
  v20[3] = &unk_1E16C14D0;
  objc_copyWeak(&v22, &location);
  v21 = v9;
  -[UIViewPropertyAnimator addAnimations:](self, "addAnimations:", v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  if (!v10)
    goto LABEL_10;
LABEL_7:
  clientCompletions = self->_clientCompletions;
  if (!clientCompletions)
  {
    v16 = (NSMutableArray *)objc_opt_new();
    v17 = self->_clientCompletions;
    self->_clientCompletions = v16;

    clientCompletions = self->_clientCompletions;
  }
  v18 = _Block_copy(v10);
  -[NSMutableArray addObject:](clientCompletions, "addObject:", v18);

LABEL_10:
  return 1;
}

- (void)startAnimation
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[16];
  objc_super v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id location;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_isInStartAnimation = 1;
  v21.receiver = self;
  v21.super_class = (Class)_UIPanelCoordinatingAnimator;
  -[UIViewPropertyAnimator startAnimation](&v21, sel_startAnimation);
  if (-[NSMutableArray count](self->_lateAnimations, "count"))
  {
    objc_initWeak(&location, self);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = self->_lateAnimations;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v17;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v17 != v5)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v14[0] = v6;
          v14[1] = 3221225472;
          v14[2] = __46___UIPanelCoordinatingAnimator_startAnimation__block_invoke;
          v14[3] = &unk_1E16C14D0;
          objc_copyWeak(&v15, &location);
          v14[4] = v8;
          -[UIViewPropertyAnimator addAnimations:](self, "addAnimations:", v14);
          objc_destroyWeak(&v15);
        }
        v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v4);
    }

    -[NSMutableArray removeAllObjects](self->_lateAnimations, "removeAllObjects");
    v13.receiver = self;
    v13.super_class = (Class)_UIPanelCoordinatingAnimator;
    -[UIViewPropertyAnimator startAnimation](&v13, sel_startAnimation);
    if (-[NSMutableArray count](self->_lateAnimations, "count"))
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unexpected animations requested within second group of alongside animations. Abandoning.", buf, 2u);
        }

      }
      else
      {
        v9 = startAnimation___s_category;
        if (!startAnimation___s_category)
        {
          v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&startAnimation___s_category);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected animations requested within second group of alongside animations. Abandoning.", buf, 2u);
        }
      }
    }
    -[NSMutableArray removeAllObjects](self->_lateAnimations, "removeAllObjects");
    objc_destroyWeak(&location);
  }
  self->_isInStartAnimation = 0;
}

- (BOOL)isAnimated
{
  return 1;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (CGAffineTransform)targetTransform
{
  uint64_t v3;
  __int128 v4;

  v3 = MEMORY[0x1E0C9BAA8];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isCancelled
{
  return self->_wasCancelled;
}

- (double)percentComplete
{
  double result;

  result = 0.0;
  if (!self->_wasCancelled)
    return 1.0;
  return result;
}

- (double)completionVelocity
{
  double result;

  result = 0.0;
  if (!self->_wasCancelled)
    return 1.0;
  return result;
}

- (int64_t)completionCurve
{
  return 0;
}

- (void)_sendPanelCoordinationCompletions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_clientCompletions, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      v9 = v6;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 = _Block_copy(*(const void **)(*((_QWORD *)&v10 + 1) + 8 * v8));

        (*((void (**)(void *, _UIPanelCoordinatingAnimator *))v6 + 2))(v6, self);
        ++v8;
        v9 = v6;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);

  }
}

- (void)stopAnimation:(BOOL)a3
{
  objc_super v3;

  self->_wasCancelled = 1;
  v3.receiver = self;
  v3.super_class = (Class)_UIPanelCoordinatingAnimator;
  -[UIViewPropertyAnimator stopAnimation:](&v3, sel_stopAnimation_, a3);
}

- (void)_runCompletions:(int64_t)a3 finished:(BOOL)a4
{
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPanelCoordinatingAnimator;
  -[UIViewPropertyAnimator _runCompletions:finished:](&v7, sel__runCompletions_finished_, a3);
  v6 = !a4;
  if (self->_wasCancelled)
    v6 = 1;
  self->_wasCancelled = v6;
  -[_UIPanelCoordinatingAnimator _sendPanelCoordinationCompletions](self, "_sendPanelCoordinationCompletions");
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void)setContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_containerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_lateAnimations, 0);
  objc_storeStrong((id *)&self->_clientCompletions, 0);
}

@end
