@implementation IMTransition

+ (void)initialize
{
  uint64_t v2;

  objc_opt_class(a1, a2);
  objc_opt_class(IMTransition, v2);
}

+ (id)transition
{
  return objc_alloc_init((Class)a1);
}

+ (id)transitionWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithAnimations:completion:", v7, v6);

  return v8;
}

- (IMTransition)initWithAnimations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  IMTransition *v8;
  IMTransition *v9;
  id v10;
  id v11;
  id animationsBlock;
  id v13;
  id v14;
  id completion;

  v6 = a3;
  v7 = a4;
  v8 = -[IMTransition init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_shouldAllowInterfaceRotation = 0;
    if (v6)
    {
      v10 = objc_msgSend(v6, "copy");
      v11 = objc_retainBlock(v10);
      animationsBlock = v9->_animationsBlock;
      v9->_animationsBlock = v11;

    }
    else
    {
      v10 = v8->_animationsBlock;
      v8->_animationsBlock = 0;
    }

    if (v7)
    {
      v13 = objc_msgSend(v7, "copy");
      v14 = objc_retainBlock(v13);
      completion = v9->_completion;
      v9->_completion = v14;

    }
    else
    {
      v13 = v9->_completion;
      v9->_completion = 0;
    }

  }
  return v9;
}

- (IMTransition)init
{
  IMTransition *v2;
  IMTransition *v3;
  NSMutableSet *v4;
  NSMutableSet *animations;
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)IMTransition;
  v2 = -[IMTransition init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_animated = 1;
    v2->_animationsFinished = 1;
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    animations = v3->_animations;
    v3->_animations = v4;

    v3->_duration = 0.300000012;
    v6 = (objc_class *)objc_opt_class(v3);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (NSString *)objc_msgSend(v8, "copy");
    identifier = v3->_identifier;
    v3->_identifier = v9;

  }
  return v3;
}

- (void)dealloc
{
  id setup;
  id animationsBlock;
  id completion;
  objc_super v6;

  objc_storeWeak((id *)&self->_delegate, 0);
  setup = self->_setup;
  self->_setup = 0;

  animationsBlock = self->_animationsBlock;
  self->_animationsBlock = 0;

  completion = self->_completion;
  self->_completion = 0;

  v6.receiver = self;
  v6.super_class = (Class)IMTransition;
  -[IMTransition dealloc](&v6, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id WeakRetained;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setIdentifier:", self->_identifier);
    objc_msgSend(v5, "setParentViewController:", self->_parentViewController);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "setDelegate:", WeakRetained);

    objc_msgSend(v5, "setDuration:", self->_duration);
    objc_msgSend(v5, "setDelay:", self->_delay);
    objc_msgSend(v5, "setUseSnapshots:", self->_useSnapshots);
    objc_msgSend(v5, "setAnimated:", self->_animated);
    objc_msgSend(v5, "setSetup:", self->_setup);
    objc_msgSend(v5, "setAnimationsBlock:", self->_animationsBlock);
    objc_msgSend(v5, "setCompletion:", self->_completion);
    objc_msgSend(v5, "setMutableUserInfo:", self->_mutableUserInfo);
    objc_msgSend(v5, "setShouldAllowInterfaceRotation:", self->_shouldAllowInterfaceRotation);
  }
  return v5;
}

- (BOOL)_shouldUseTransactionForTransition
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "_supportsForceTouch");

  return v3;
}

- (void)_delayedBeginAnimation
{
  -[IMTransition beginAnimation](self, "beginAnimation");
  if (-[IMTransition _shouldUseTransactionForTransition](self, "_shouldUseTransactionForTransition"))
    +[CATransaction commit](CATransaction, "commit");
}

- (void)beginTransition
{
  void *v3;
  unsigned int v4;
  id v5;

  objc_msgSend((id)stopWatch, "reset");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_msgSend(v3, "isViewLoaded");

  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", NSRunLoopCommonModes, UITrackingRunLoopMode, 0);
    if (-[IMTransition _shouldUseTransactionForTransition](self, "_shouldUseTransactionForTransition"))
      +[CATransaction begin](CATransaction, "begin");
    -[IMTransition delay](self, "delay");
    -[IMTransition performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "_delayedBeginAnimation", self, v5);

  }
  else
  {
    -[IMTransition beginAnimation](self, "beginAnimation");
  }
}

- (void)prepareTransition
{
  id v3;
  void *v4;
  UIView *v5;
  UIView *view;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)UIView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentView](self, "parentView"));
  objc_msgSend(v4, "bounds");
  v5 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  view = self->_view;
  self->_view = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v7, "setClipsToBounds:", 1);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition parentView](self, "parentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v9, "addSubview:", v8);

}

- (void)performTransition
{
  -[IMTransition performNonAnimatedTransition](self, "performNonAnimatedTransition");
}

- (void)cleanupTransition
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition view](self, "view"));
  objc_msgSend(v2, "removeFromSuperview");

}

- (int)roleForViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));

  if (v6 == v4)
  {
    v7 = 3;
  }
  else if (v5)
  {
    v7 = -[IMTransition roleForViewController:](self, "roleForViewController:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition mutableUserInfoCreateIfNeeded:](self, "mutableUserInfoCreateIfNeeded:", 1));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)transitionDidStart
{
  objc_msgSend((id)stopWatch, "reportWithMarker:", CFSTR("transitionDidStart"));
  -[IMTransition setStarted:](self, "setStarted:", 1);
  -[IMTransition notifyTransitionDidStart](self, "notifyTransitionDidStart");
}

- (void)transitionDidEnd
{
  _BOOL8 v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[IMTransition setStarted:](self, "setStarted:", 0);
  v3 = -[IMTransition animationsFinished](self, "animationsFinished");
  -[IMTransition cleanupViewControllers](self, "cleanupViewControllers");
  -[IMTransition notifyTransitionDidEnd](self, "notifyTransitionDidEnd");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition completion](self, "completion"));

  if (v4)
  {
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IMTransition completion](self, "completion"));
    v5[2](v5, v3);

  }
  -[IMTransition setView:](self, "setView:", 0);
}

- (CGRect)transitionRect
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "transitionRectInView:transition:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentView](self, "parentView"));
    objc_msgSend(v3, "transitionRectInView:transition:", v4, self);
    x = v5;
    y = v7;
    width = v9;
    height = v11;

  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)performAnimatedTransition
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];
  _QWORD v6[5];

  -[IMTransition notifyTransitionWillStart](self, "notifyTransitionWillStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition setup](self, "setup"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IMTransition setup](self, "setup"));
    ((void (**)(_QWORD, IMTransition *))v4)[2](v4, self);

  }
  -[IMTransition prepareTransition](self, "prepareTransition");
  -[IMTransition prepareViewControllers](self, "prepareViewControllers");
  -[IMTransition duration](self, "duration");
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9E970;
  v6[3] = &unk_28B960;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_9E9F0;
  v5[3] = &unk_28D678;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5);
}

- (void)performNonAnimatedTransition
{
  -[IMTransition setAnimationsFinished:](self, "setAnimationsFinished:", 0);
  -[IMTransition transitionDidEnd](self, "transitionDidEnd");
}

- (void)prepareViewControllers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  objc_msgSend(v3, "prepareForTransition:", self);

}

- (void)cleanupViewControllers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  objc_msgSend(v3, "cleanupAfterTransition:", self);

}

- (void)beginAnimation
{
  if (-[IMTransition shouldPerformTransition](self, "shouldPerformTransition"))
  {
    if (-[IMTransition animated](self, "animated"))
      -[IMTransition performAnimatedTransition](self, "performAnimatedTransition");
    else
      -[IMTransition performNonAnimatedTransition](self, "performNonAnimatedTransition");
  }
}

- (BOOL)animated
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_msgSend(v3, "isViewLoaded");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }
  if (!self->_animated)
    return 0;
  -[IMTransition duration](self, "duration");
  return v9 > 0.0 && v8;
}

- (double)duration
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("TRANSITION_DURATION_MULTIPLIER")));

  objc_msgSend(v5, "floatValue");
  v7 = v6;
  v8 = v6 == 0.0;
  v9 = 1.0;
  if (!v8)
    v9 = v7;
  v10 = self->_duration * v9;

  return v10;
}

- (UIView)parentView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));

  return (UIView *)v3;
}

- (BOOL)shouldPerformTransition
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_opt_respondsToSelector(v3, "shouldPerformChildTransition:");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v6 = objc_msgSend(v5, "shouldPerformChildTransition:", self);

  return v6;
}

- (id)mutableUserInfoCreateIfNeeded:(BOOL)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *mutableUserInfo;

  if (a3 && !self->_mutableUserInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableUserInfo = self->_mutableUserInfo;
    self->_mutableUserInfo = v4;

  }
  return self->_mutableUserInfo;
}

- (NSDictionary)userInfo
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition mutableUserInfoCreateIfNeeded:](self, "mutableUserInfoCreateIfNeeded:", 0));
  v3 = objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (void)notifyTransitionWillStart
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_opt_respondsToSelector(v3, "childTransitionWillStart:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
    objc_msgSend(v5, "childTransitionWillStart:", self);

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "transitionWillStart:") & 1) != 0)
    objc_msgSend(v6, "transitionWillStart:", self);

}

- (void)notifyTransitionDidStart
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
  v4 = objc_opt_respondsToSelector(v3, "childTransitionDidStart:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](self, "parentViewController"));
    objc_msgSend(v5, "childTransitionDidStart:", self);

  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "transitionDidStart:") & 1) != 0)
    objc_msgSend(v6, "transitionDidStart:", self);

}

- (void)notifyTransitionDidEnd
{
  IMTransition *v2;
  _BOOL8 v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v2 = objc_retainAutorelease(self);
  v3 = -[IMTransition animationsFinished](v2, "animationsFinished");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](v2, "parentViewController"));
  v5 = objc_opt_respondsToSelector(v4, "childTransitionDidComplete:finished:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition parentViewController](v2, "parentViewController"));
    objc_msgSend(v6, "childTransitionDidComplete:finished:", v2, v3);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[IMTransition delegate](v2, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "transitionDidComplete:finished:") & 1) != 0)
    objc_msgSend(v8, "transitionDidComplete:finished:", v2, v3);
  v7 = (id)objc_opt_self(v2);

}

- (void)animationStarted:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition animations](self, "animations"));
  objc_msgSend(v5, "addObject:", v4);

  if (!-[IMTransition started](self, "started"))
    -[IMTransition transitionDidStart](self, "transitionDidStart");
}

- (void)animationEnded:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[IMTransition setAnimationsFinished:](self, "setAnimationsFinished:", -[IMTransition animationsFinished](self, "animationsFinished") & v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition animations](self, "animations"));
  objc_msgSend(v7, "removeObject:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMTransition animations](self, "animations"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    -[IMTransition cleanupTransition](self, "cleanupTransition");
    -[IMTransition transitionDidEnd](self, "transitionDidEnd");
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[IMTransition animationEnded:finished:](self, "animationEnded:finished:", a3, a4);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IMViewControllerContaining)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parentViewController, a3);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (IMTransitionDelegate)delegate
{
  return (IMTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)useSnapshots
{
  return self->_useSnapshots;
}

- (void)setUseSnapshots:(BOOL)a3
{
  self->_useSnapshots = a3;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (BOOL)shouldAllowInterfaceRotation
{
  return self->_shouldAllowInterfaceRotation;
}

- (void)setShouldAllowInterfaceRotation:(BOOL)a3
{
  self->_shouldAllowInterfaceRotation = a3;
}

- (NSMutableDictionary)mutableUserInfo
{
  return self->_mutableUserInfo;
}

- (void)setMutableUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mutableUserInfo, a3);
}

- (NSMutableSet)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_animations, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)animationsFinished
{
  return self->_animationsFinished;
}

- (void)setAnimationsFinished:(BOOL)a3
{
  self->_animationsFinished = a3;
}

- (id)setup
{
  return self->_setup;
}

- (void)setSetup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)animationsBlock
{
  return self->_animationsBlock;
}

- (void)setAnimationsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationsBlock, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_setup, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_mutableUserInfo, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
