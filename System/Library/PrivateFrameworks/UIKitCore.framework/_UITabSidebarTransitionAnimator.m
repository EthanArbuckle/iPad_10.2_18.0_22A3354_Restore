@implementation _UITabSidebarTransitionAnimator

- (_UITabSidebarTransitionAnimator)initWithContainerView:(id)a3 duration:(double)a4
{
  id v6;
  _UITabSidebarTransitionAnimator *v7;
  _UITabSidebarTransitionAnimator *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITabSidebarTransitionAnimator;
  v7 = -[_UITabSidebarTransitionAnimator init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_containerView, v6);
    v8->_transitionDuration = a4;
  }

  return v8;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[_UITabSidebarTransitionAnimator animateAlongsideTransitionInView:animation:completion:](self, "animateAlongsideTransitionInView:animation:completion:", 0, a3, a4);
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  NSMutableArray *animationBlocks;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *completionBlocks;
  NSMutableArray *v17;
  void *v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    if (!self->_animationBlocks)
    {
      v11 = (NSMutableArray *)objc_opt_new();
      animationBlocks = self->_animationBlocks;
      self->_animationBlocks = v11;

    }
    objc_initWeak(&location, self);
    v13 = self->_animationBlocks;
    v14 = _Block_copy(v9);
    -[NSMutableArray addObject:](v13, "addObject:", v14);

    objc_destroyWeak(&location);
  }
  if (v10)
  {
    if (!self->_completionBlocks)
    {
      v15 = (NSMutableArray *)objc_opt_new();
      completionBlocks = self->_completionBlocks;
      self->_completionBlocks = v15;

    }
    objc_initWeak(&location, self);
    v17 = self->_completionBlocks;
    v18 = _Block_copy(v10);
    -[NSMutableArray addObject:](v17, "addObject:", v18);

    objc_destroyWeak(&location);
  }

  return 1;
}

- (void)runAnimations
{
  void *v3;
  NSMutableArray *animationBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_animationBlocks, "copy");
  animationBlocks = self->_animationBlocks;
  self->_animationBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)runCompletions
{
  void *v3;
  NSMutableArray *completionBlocks;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_completed = 1;
  v3 = (void *)-[NSMutableArray copy](self->_completionBlocks, "copy");
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isAnimated
{
  return 1;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (BOOL)initiallyInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isCancelled
{
  return 0;
}

- (double)percentComplete
{
  double result;

  result = 1.0;
  if (!self->_completed)
    return 0.0;
  return result;
}

- (double)completionVelocity
{
  return 0.0;
}

- (int64_t)completionCurve
{
  return 3;
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

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (UIView)containerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_containerView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_animationBlocks, 0);
}

@end
