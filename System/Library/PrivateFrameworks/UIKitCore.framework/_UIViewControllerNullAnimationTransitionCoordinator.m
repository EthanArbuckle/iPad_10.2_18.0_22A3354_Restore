@implementation _UIViewControllerNullAnimationTransitionCoordinator

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[_UIViewControllerNullAnimationTransitionCoordinator _animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:](self, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", 0, 0, 0, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

- (void)_runAlongsideCompletionsAfterCommit
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __90___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletionsAfterCommit__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  objc_msgSend((id)UIApp, "_performBlockAfterCATransactionCommits:", v2);
}

- (void)setContainerView:(id)a3
{
  self->_containerView = (UIView *)a3;
}

- (BOOL)_animateAlongsideTransitionInView:(id)a3 systemAnimation:(BOOL)a4 systemCompletion:(BOOL)a5 animation:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  _BOOL4 transitionIsInFlight;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  transitionIsInFlight = self->_transitionIsInFlight;
  if (v11 && !self->_transitionIsInFlight)
  {
    -[_UIViewControllerNullAnimationTransitionCoordinator _alongsideAnimations:](self, "_alongsideAnimations:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = _Block_copy(v11);
    objc_msgSend(v14, "addObject:", v15);

  }
  if (v12)
  {
    -[_UIViewControllerNullAnimationTransitionCoordinator _alongsideCompletions:](self, "_alongsideCompletions:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = _Block_copy(v12);
    objc_msgSend(v16, "addObject:", v17);

  }
  if (v11)
    v18 = !transitionIsInFlight;
  else
    v18 = 1;
  v19 = v18;

  return v19;
}

- (void)_runAlongsideCompletions
{
  void *v3;
  _QWORD v4[5];

  -[_UIViewControllerNullAnimationTransitionCoordinator _alongsideCompletions:](self, "_alongsideCompletions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideCompletions__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  -[_UIViewControllerNullAnimationTransitionCoordinator _applyBlocks:releaseBlocks:](self, "_applyBlocks:releaseBlocks:", v3, v4);

}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v6, "count"))
  {
    v7[2](v7);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v8);
          v11 = _Block_copy(*(const void **)(*((_QWORD *)&v15 + 1) + 8 * v13));

          (*((void (**)(void *, _UIViewControllerNullAnimationTransitionCoordinator *))v11 + 2))(v11, self);
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);

    }
  }

}

- (id)_alongsideCompletions:(BOOL)a3
{
  NSMutableArray *alongsideCompletions;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  alongsideCompletions = self->_alongsideCompletions;
  if (alongsideCompletions)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_alongsideCompletions;
    self->_alongsideCompletions = v6;

    alongsideCompletions = self->_alongsideCompletions;
  }
  return alongsideCompletions;
}

- (void)_runAlongsideAnimations
{
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  NSMutableArray *alongsideAnimations;
  id v9;
  _QWORD v10[5];

  v3 = 0;
  v4 = 0;
  self->_transitionIsInFlight = 1;
  v5 = MEMORY[0x1E0C809B0];
  do
  {
    v6 = v4;
    v7 = v3;
    -[_UIViewControllerNullAnimationTransitionCoordinator _alongsideAnimations:](self, "_alongsideAnimations:", 0, v9);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __78___UIViewControllerNullAnimationTransitionCoordinator__runAlongsideAnimations__block_invoke;
    v10[3] = &unk_1E16B1B28;
    v10[4] = self;
    -[_UIViewControllerNullAnimationTransitionCoordinator _applyBlocks:releaseBlocks:](self, "_applyBlocks:releaseBlocks:", v9, v10);
    v4 = v9;
    v3 = 1;
  }
  while ((v7 & 1) == 0);
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

}

- (id)_alongsideAnimations:(BOOL)a3
{
  NSMutableArray *alongsideAnimations;
  BOOL v5;
  NSMutableArray *v6;
  NSMutableArray *v7;

  alongsideAnimations = self->_alongsideAnimations;
  if (alongsideAnimations)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_alongsideAnimations;
    self->_alongsideAnimations = v6;

    alongsideAnimations = self->_alongsideAnimations;
  }
  return alongsideAnimations;
}

- (BOOL)isAnimated
{
  return 0;
}

- (id)_mainContext
{
  return 0;
}

- (int64_t)presentationStyle
{
  return -1;
}

- (BOOL)initiallyInteractive
{
  return 1;
}

- (BOOL)isInteractive
{
  return 0;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (BOOL)isCancelled
{
  return 0;
}

- (double)transitionDuration
{
  return 0.0;
}

- (double)percentComplete
{
  return 0.0;
}

- (double)completionVelocity
{
  return 1.0;
}

- (int64_t)completionCurve
{
  return 0;
}

- (id)viewControllerForKey:(id)a3
{
  return 0;
}

- (id)viewForKey:(id)a3
{
  return 0;
}

- (BOOL)isRotating
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

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  return -[_UIViewControllerNullAnimationTransitionCoordinator _animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:](self, "_animateAlongsideTransitionInView:systemAnimation:systemCompletion:animation:completion:", a3, 0, 0, a4, a5);
}

- (void)_runAlongsideCompletionsAndClearAlongsideAnimations
{
  NSMutableArray *alongsideAnimations;

  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

  -[_UIViewControllerNullAnimationTransitionCoordinator _runAlongsideCompletions](self, "_runAlongsideCompletions");
}

- (UIView)containerView
{
  return self->_containerView;
}

@end
