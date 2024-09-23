@implementation IMViewControllerTransitionContext

+ (id)_associatedTransitionContextForObject:(id)a3
{
  return objc_getAssociatedObject(a3, &unk_30D688);
}

- (IMViewControllerTransitionContext)init
{
  NSMapTable *v3;
  NSMapTable *trackedAnimations;
  objc_super v6;

  self->_previousPercentComplete = 0.0;
  self->__completionCurve = 0;
  self->__completionVelocity = 1.0;
  self->_presentationStyle = -1;
  *(_BYTE *)&self->_transitionContextFlags |= 8u;
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  trackedAnimations = self->_trackedAnimations;
  self->_trackedAnimations = v3;

  v6.receiver = self;
  v6.super_class = (Class)IMViewControllerTransitionContext;
  return -[IMViewControllerTransitionContext init](&v6, "init");
}

- (void)dealloc
{
  objc_super v3;

  -[IMViewControllerTransitionContext setBk_containerView:](self, "setBk_containerView:", 0);
  -[IMViewControllerTransitionContext _setInteractiveUpdateHandler:](self, "_setInteractiveUpdateHandler:", 0);
  -[IMViewControllerTransitionContext _setPostInteractiveCompletionHandler:](self, "_setPostInteractiveCompletionHandler:", 0);
  -[IMViewControllerTransitionContext _setWillCompleteHandler:](self, "_setWillCompleteHandler:", 0);
  -[IMViewControllerTransitionContext _setCompletionHandler:](self, "_setCompletionHandler:", 0);
  -[IMViewControllerTransitionContext _setAuxContext:](self, "_setAuxContext:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMViewControllerTransitionContext;
  -[IMViewControllerTransitionContext dealloc](&v3, "dealloc");
}

- (UIView)containerView
{
  return -[IMViewControllerTransitionContext bk_containerView](self, "bk_containerView");
}

- (void)_setAnimator:(id)a3
{
  UIViewControllerAnimatedTransitioning *v4;
  UIViewControllerAnimatedTransitioning *animator;
  UIViewControllerAnimatedTransitioning *v6;

  v4 = (UIViewControllerAnimatedTransitioning *)a3;
  animator = self->_animator;
  if (animator != v4)
  {
    v6 = v4;
    if (animator)
    {
      objc_setAssociatedObject(animator, &unk_30D688, 0, (char *)&dword_0 + 1);
      v4 = v6;
    }
    self->_animator = v4;
    if (v4)
    {
      objc_setAssociatedObject(v4, &unk_30D688, self, (char *)&dword_0 + 1);
      v4 = v6;
    }
  }

}

- (void)_setInteractor:(id)a3
{
  UIViewControllerInteractiveTransitioning *v4;
  UIViewControllerInteractiveTransitioning *interactor;
  char v6;
  UIViewControllerInteractiveTransitioning *object;

  v4 = (UIViewControllerInteractiveTransitioning *)a3;
  interactor = self->_interactor;
  if (interactor != v4)
  {
    object = v4;
    if (interactor)
    {
      objc_setAssociatedObject(interactor, &unk_30D688, 0, (char *)&dword_0 + 1);
      v4 = object;
    }
    self->_interactor = v4;
    if (v4)
    {
      *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xFE | objc_opt_respondsToSelector(v4, "completionSpeed") & 1;
      if ((objc_opt_respondsToSelector(object, "completionCurve") & 1) != 0)
        v6 = 2;
      else
        v6 = 0;
      *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xFD | v6;
      -[IMViewControllerTransitionContext _setInitiallyInteractive:](self, "_setInitiallyInteractive:", 1);
      -[IMViewControllerTransitionContext _setIsCurrentlyInteractive:](self, "_setIsCurrentlyInteractive:", 1);
      objc_setAssociatedObject(object, &unk_30D688, self, (char *)&dword_0 + 1);
      v4 = object;
    }
  }

}

- (id)_transitionCoordinator
{
  id auxContext;
  IMViewControllerTransitionCoordinator *v3;

  auxContext = self->__auxContext;
  if (auxContext)
    v3 = (IMViewControllerTransitionCoordinator *)auxContext;
  else
    v3 = -[IMViewControllerTransitionCoordinator initWithMainContext:]([IMViewControllerTransitionCoordinator alloc], "initWithMainContext:", self);
  return v3;
}

- (double)_previousPercentComplete
{
  return self->_previousPercentComplete;
}

- (void)_setPreviousPercentComplete:(double)a3
{
  self->_previousPercentComplete = a3;
}

- (void)_updateInteractiveTransitionWithoutTrackingPercentComplete:(double)a3
{
  void *v5;

  if (-[IMViewControllerTransitionContext initiallyInteractive](self, "initiallyInteractive"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler"));

    if (v5)
    {
      *(_BYTE *)&self->_transitionContextFlags &= ~8u;
      (*((void (**)(double))self->__interactiveUpdateHandler + 2))(a3);
    }
  }
}

- (void)updateInteractiveTransition:(double)a3
{
  void *v5;
  double previousPercentComplete;
  id interactiveUpdateHandler;
  double v8;

  if ((char *)-[IMViewControllerTransitionContext _state](self, "_state") == (char *)&dword_0 + 1)
  {
    if (-[IMViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler"));
      if (v5)
      {
        previousPercentComplete = self->_previousPercentComplete;

        if (previousPercentComplete != a3)
        {
          *(_BYTE *)&self->_transitionContextFlags &= ~8u;
          self->_previousPercentComplete = a3;
          interactiveUpdateHandler = self->__interactiveUpdateHandler;
          -[IMViewControllerTransitionContext _percentOffset](self, "_percentOffset");
          (*((void (**)(id, _QWORD, _QWORD, IMViewControllerTransitionContext *, double))interactiveUpdateHandler
           + 2))(interactiveUpdateHandler, 0, 0, self, v8 + a3);
        }
      }
    }
  }
}

- (void)finishInteractiveTransition
{
  char transitionContextFlags;
  double v4;
  void *v5;

  if ((char *)-[IMViewControllerTransitionContext _state](self, "_state") == (char *)&dword_0 + 1)
  {
    transitionContextFlags = (char)self->_transitionContextFlags;
    *(_BYTE *)&self->_transitionContextFlags = transitionContextFlags & 0xF3 | 8;
    if ((transitionContextFlags & 1) != 0)
    {
      -[UIViewControllerInteractiveTransitioning completionSpeed](self->_interactor, "completionSpeed");
      self->__completionVelocity = v4;
      if (v4 < 0.0)
        self->__completionVelocity = 1.0;
    }
    if ((*(_BYTE *)&self->_transitionContextFlags & 2) != 0)
      self->__completionCurve = (int64_t)-[UIViewControllerInteractiveTransitioning completionCurve](self->_interactor, "completionCurve");
    if (-[IMViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler"));

      if (v5)
        (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
    }
    -[IMViewControllerTransitionContext _interactivityDidChange:](self, "_interactivityDidChange:", 0);
  }
  else
  {
    -[IMViewControllerTransitionContext _setState:](self, "_setState:", 3);
  }
}

- (void)cancelInteractiveTransition
{
  char transitionContextFlags;
  double v4;
  double v5;
  BOOL v6;
  double v7;
  void *v8;

  if ((char *)-[IMViewControllerTransitionContext _state](self, "_state") == (char *)&dword_0 + 1)
  {
    transitionContextFlags = (char)self->_transitionContextFlags;
    *(_BYTE *)&self->_transitionContextFlags = transitionContextFlags | 0xC;
    if ((transitionContextFlags & 1) != 0)
    {
      -[UIViewControllerInteractiveTransitioning completionSpeed](self->_interactor, "completionSpeed");
      v5 = -v4;
      v6 = v4 < 0.0;
      v7 = -1.0;
      if (!v6)
        v7 = v5;
      self->__completionVelocity = v7;
    }
    if ((*(_BYTE *)&self->_transitionContextFlags & 2) != 0)
      self->__completionCurve = (int64_t)-[UIViewControllerInteractiveTransitioning completionCurve](self->_interactor, "completionCurve");
    if (-[IMViewControllerTransitionContext isCurrentlyInteractive](self, "isCurrentlyInteractive"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionContext _interactiveUpdateHandler](self, "_interactiveUpdateHandler"));

      if (v8)
        (*((void (**)(double))self->__interactiveUpdateHandler + 2))(self->_previousPercentComplete);
    }
    -[IMViewControllerTransitionContext _interactivityDidChange:](self, "_interactivityDidChange:", 0);
  }
  else
  {
    -[IMViewControllerTransitionContext _setState:](self, "_setState:", 2);
  }
}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  void (**willCompleteHandler)(id, IMViewControllerTransitionContext *, BOOL);
  void (**completionHandler)(id, IMViewControllerTransitionContext *, _BOOL8);

  v3 = a3;
  willCompleteHandler = (void (**)(id, IMViewControllerTransitionContext *, BOOL))self->__willCompleteHandler;
  if (willCompleteHandler)
    willCompleteHandler[2](willCompleteHandler, self, a3);
  completionHandler = (void (**)(id, IMViewControllerTransitionContext *, _BOOL8))self->__completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, self, v3);
  -[IMViewControllerTransitionContext _runAlongsideCompletions](self, "_runAlongsideCompletions");
}

- (id)viewControllerForKey:(id)a3
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@ is an abstract class!"), objc_opt_class(self));
  return 0;
}

- (id)viewForKey:(id)a3
{
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@ is an abstract class!"), objc_opt_class(self));
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

- (CGRect)initialFrameForViewController:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)transitionWasCancelled
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 2) & 1;
}

- (BOOL)_transitionIsInFlight
{
  return (char *)-[IMViewControllerTransitionContext _state](self, "_state") == (char *)&dword_0 + 1;
}

- (void)_setTransitionIsInFlight:(BOOL)a3
{
  -[IMViewControllerTransitionContext _setState:](self, "_setState:");
}

- (BOOL)_transitionIsCompleting
{
  return (*(_BYTE *)&self->_transitionContextFlags >> 3) & 1;
}

- (void)_setTransitionIsCompleting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_transitionContextFlags = *(_BYTE *)&self->_transitionContextFlags & 0xF7 | v3;
}

- (void)_runAlongsideCompletions
{
  id auxContext;
  void *v4;
  _QWORD v5[5];

  auxContext = self->__auxContext;
  if (auxContext)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->__auxContext, "_alongsideCompletions"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6032C;
    v5[3] = &unk_28B960;
    v5[4] = self;
    objc_msgSend(auxContext, "_applyBlocks:releaseBlocks:", v4, v5);

  }
}

- (void)_interactivityDidChange:(BOOL)a3
{
  id auxContext;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[IMViewControllerTransitionContext _setIsCurrentlyInteractive:](self, "_setIsCurrentlyInteractive:", a3);
  auxContext = self->__auxContext;
  if (auxContext)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(auxContext, "_interactiveChangeHandlers"));
    if (v5)
    {
      v6 = self->__auxContext;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_603C0;
      v7[3] = &unk_28B960;
      v7[4] = self;
      objc_msgSend(v6, "_applyBlocks:releaseBlocks:", v5, v7);
    }

  }
}

- (void)__runAlongsideAnimations
{
  void *v3;
  uint64_t v4;
  void *v5;
  id auxContext;
  _QWORD v8[5];

  if (self->__auxContext)
  {
    v3 = 0;
    v4 = -2;
    do
    {
      v5 = v3;
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->__auxContext, "_alongsideAnimations"));

      if (!v3)
        break;
      auxContext = self->__auxContext;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_60498;
      v8[3] = &unk_28B960;
      v8[4] = self;
      objc_msgSend(auxContext, "_applyBlocks:releaseBlocks:", v3, v8);
    }
    while (!__CFADD__(v4++, 1));
    objc_msgSend(self->__auxContext, "_setAlongsideAnimations:", 0);

  }
}

- (void)_disableInteractionForViews:(id)a3
{
  id v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = a3;
  -[IMViewControllerTransitionContext _enableInteractionForDisabledViews](self, "_enableInteractionForDisabledViews");
  objc_storeStrong((id *)&self->_disabledViews, a3);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_disabledViews;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setUserInteractionEnabled:", 0, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_enableInteractionForDisabledViews
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSArray *disabledViews;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_disabledViews;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "setUserInteractionEnabled:", 1, (_QWORD)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  disabledViews = self->_disabledViews;
  self->_disabledViews = 0;

}

- (void)trackAnimation:(id)a3 withLayer:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = objc_msgSend(a3, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMViewControllerTransitionContext trackedAnimations](self, "trackedAnimations"));
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (int64_t)_completionCurve
{
  return self->__completionCurve;
}

- (void)_setCompletionCurve:(int64_t)a3
{
  self->__completionCurve = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)_setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)_completionVelocity
{
  return self->__completionVelocity;
}

- (void)_setCompletionVelocity:(double)a3
{
  self->__completionVelocity = a3;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (int64_t)_state
{
  return self->__state;
}

- (void)_setState:(int64_t)a3
{
  self->__state = a3;
}

- (BOOL)isCurrentlyInteractive
{
  return self->_isCurrentlyInteractive;
}

- (void)_setIsCurrentlyInteractive:(BOOL)a3
{
  self->_isCurrentlyInteractive = a3;
}

- (BOOL)initiallyInteractive
{
  return self->_initiallyInteractive;
}

- (void)_setInitiallyInteractive:(BOOL)a3
{
  self->_initiallyInteractive = a3;
}

- (void)_setIsAnimated:(BOOL)a3
{
  self->_isAnimated = a3;
}

- (NSArray)_containerViews
{
  return self->__containerViews;
}

- (void)_setContainerViews:(id)a3
{
  objc_storeStrong((id *)&self->__containerViews, a3);
}

- (double)_percentOffset
{
  return self->__percentOffset;
}

- (void)_setPercentOffset:(double)a3
{
  self->__percentOffset = a3;
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (UIViewControllerInteractiveTransitioning)interactor
{
  return self->_interactor;
}

- (UIView)bk_containerView
{
  return self->_bk_containerView;
}

- (void)setBk_containerView:(id)a3
{
  self->_bk_containerView = (UIView *)a3;
}

- (id)_interactiveUpdateHandler
{
  return self->__interactiveUpdateHandler;
}

- (void)_setInteractiveUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)_postInteractiveCompletionHandler
{
  return self->__postInteractiveCompletionHandler;
}

- (void)_setPostInteractiveCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)_willCompleteHandler
{
  return self->__willCompleteHandler;
}

- (void)_setWillCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)_auxContext
{
  return self->__auxContext;
}

- (void)_setAuxContext:(id)a3
{
  objc_storeStrong(&self->__auxContext, a3);
}

- (NSMapTable)trackedAnimations
{
  return self->_trackedAnimations;
}

- (void)setTrackedAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_trackedAnimations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAnimations, 0);
  objc_storeStrong(&self->__auxContext, 0);
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__willCompleteHandler, 0);
  objc_storeStrong(&self->__postInteractiveCompletionHandler, 0);
  objc_storeStrong(&self->__interactiveUpdateHandler, 0);
  objc_storeStrong((id *)&self->__containerViews, 0);
  objc_storeStrong((id *)&self->_disabledViews, 0);
}

@end
