@implementation MFNullAnimationTransitionCoordinator

- (BOOL)isAnimated
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

- (BOOL)isInterruptible
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
  return -[MFNullAnimationTransitionCoordinator animateAlongsideTransitionInView:animation:completion:](self, "animateAlongsideTransitionInView:animation:completion:", 0, a3, a4);
}

- (BOOL)animateAlongsideTransitionInView:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 transitionIsInFlight;
  BOOL v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  transitionIsInFlight = self->_transitionIsInFlight;
  if (v9 && !self->_transitionIsInFlight)
    -[MFNullAnimationTransitionCoordinator _addAlongsideAnimation:](self, "_addAlongsideAnimation:", v9);
  if (v10)
    -[MFNullAnimationTransitionCoordinator _addAlongsideCompletion:](self, "_addAlongsideCompletion:", v10);
  if (v9)
    v12 = !transitionIsInFlight;
  else
    v12 = 1;
  v13 = v12;

  return v13;
}

- (void)_addAlongsideAnimation:(id)a3
{
  id v4;
  NSMutableArray *alongsideAnimations;
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  v4 = a3;
  alongsideAnimations = self->_alongsideAnimations;
  v10 = v4;
  if (alongsideAnimations)
  {
    v6 = objc_retainBlock(v4);
    -[NSMutableArray addObject:](alongsideAnimations, "addObject:", v6);
  }
  else
  {
    v7 = objc_alloc((Class)NSMutableArray);
    v6 = objc_retainBlock(v10);
    v8 = (NSMutableArray *)objc_msgSend(v7, "initWithObjects:", v6, 0);
    v9 = self->_alongsideAnimations;
    self->_alongsideAnimations = v8;

  }
}

- (void)_addAlongsideCompletion:(id)a3
{
  id v4;
  NSMutableArray *alongsideCompletions;
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  v4 = a3;
  alongsideCompletions = self->_alongsideCompletions;
  v10 = v4;
  if (alongsideCompletions)
  {
    v6 = objc_retainBlock(v4);
    -[NSMutableArray addObject:](alongsideCompletions, "addObject:", v6);
  }
  else
  {
    v7 = objc_alloc((Class)NSMutableArray);
    v6 = objc_retainBlock(v10);
    v8 = (NSMutableArray *)objc_msgSend(v7, "initWithObjects:", v6, 0);
    v9 = self->_alongsideCompletions;
    self->_alongsideCompletions = v8;

  }
}

- (id)_alongsideAnimations
{
  NSMutableArray *v3;
  NSMutableArray *alongsideAnimations;

  v3 = self->_alongsideAnimations;
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

  return v3;
}

- (id)_alongsideCompletions
{
  NSMutableArray *v3;
  NSMutableArray *alongsideCompletions;

  v3 = self->_alongsideCompletions;
  alongsideCompletions = self->_alongsideCompletions;
  self->_alongsideCompletions = 0;

  return v3;
}

- (void)_runAlongsideAnimations
{
  void *v3;
  uint64_t v4;
  NSMutableArray *alongsideAnimations;
  id v7;

  v3 = 0;
  self->_transitionIsInFlight = 1;
  v4 = -2;
  do
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MFNullAnimationTransitionCoordinator _alongsideAnimations](self, "_alongsideAnimations"));

    if (!v7)
      break;
    -[MFNullAnimationTransitionCoordinator _applyBlocks:](self, "_applyBlocks:");
    v3 = v7;
  }
  while (!__CFADD__(v4++, 1));
  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

  self->_transitionIsInFlight = 0;
}

- (void)_runAlongsideCompletionsAfterCommit
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100197C2C;
  v2[3] = &unk_10051AA98;
  v2[4] = self;
  objc_msgSend(UIApp, "_performBlockAfterCATransactionCommits:", v2);
}

- (void)_applyBlocks:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6));
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

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
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
}

@end
