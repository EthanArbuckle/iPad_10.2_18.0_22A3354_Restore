@implementation IMViewControllerNullAnimationTransitionCoordinator

- (BOOL)isAnimated
{
  return 0;
}

- (BOOL)isInterruptible
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
  __int128 v3;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (BOOL)animateAlongsideTransition:(id)a3 completion:(id)a4
{
  return -[IMViewControllerNullAnimationTransitionCoordinator animateAlongsideTransitionInView:animation:completion:](self, "animateAlongsideTransitionInView:animation:completion:", 0, a3, a4);
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_alongsideAnimations;
    self->_alongsideAnimations = v6;

    alongsideAnimations = self->_alongsideAnimations;
  }
  return alongsideAnimations;
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
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_alongsideCompletions;
    self->_alongsideCompletions = v6;

    alongsideCompletions = self->_alongsideCompletions;
  }
  return alongsideCompletions;
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 transitionIsInFlight;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  transitionIsInFlight = self->_transitionIsInFlight;
  if (v9 && !self->_transitionIsInFlight)
  {
    v12 = objc_msgSend(v9, "copy");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerNullAnimationTransitionCoordinator _alongsideAnimations:](self, "_alongsideAnimations:", 1));
    v14 = objc_retainBlock(v12);
    objc_msgSend(v13, "addObject:", v14);

  }
  if (v10)
  {
    v15 = objc_msgSend(v10, "copy");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerNullAnimationTransitionCoordinator _alongsideCompletions:](self, "_alongsideCompletions:", 1));
    v17 = objc_retainBlock(v15);
    objc_msgSend(v16, "addObject:", v17);

  }
  if (v9)
    v18 = !transitionIsInFlight;
  else
    v18 = 1;
  v19 = v18;

  return v19;
}

- (void)_runAlongsideAnimations
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSMutableArray *alongsideAnimations;
  _QWORD v8[5];

  v3 = 0;
  self->_transitionIsInFlight = 1;
  v4 = -2;
  do
  {
    v5 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerNullAnimationTransitionCoordinator _alongsideAnimations:](self, "_alongsideAnimations:", 0));

    if (!v3)
      break;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_11E150;
    v8[3] = &unk_28B960;
    v8[4] = self;
    -[IMViewControllerNullAnimationTransitionCoordinator _applyBlocks:releaseBlocks:](self, "_applyBlocks:releaseBlocks:", v3, v8);
  }
  while (!__CFADD__(v4++, 1));
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

}

- (void)_runAlongsideCompletionsAfterCommit
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerNullAnimationTransitionCoordinator _alongsideCompletions:](self, "_alongsideCompletions:", 0));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_11E1D8;
  v4[3] = &unk_28B960;
  v4[4] = self;
  -[IMViewControllerNullAnimationTransitionCoordinator _applyBlocks:releaseBlocks:](self, "_applyBlocks:releaseBlocks:", v3, v4);

}

- (void)_applyBlocks:(id)a3 releaseBlocks:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

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
          v11 = objc_retainBlock(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v13));

          (*((void (**)(id, IMViewControllerNullAnimationTransitionCoordinator *))v11 + 2))(v11, self);
          v13 = (char *)v13 + 1;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);

    }
  }

}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  self->_containerView = (UIView *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

@end
