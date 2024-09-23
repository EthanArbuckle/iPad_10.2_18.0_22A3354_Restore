@implementation BCCardStackTransitionAnimatorWrapper

- (BCCardStackTransitionAnimatorWrapper)initWithAnimator:(id)a3 context:(id)a4 waitUntilReadyBlock:(id)a5 setupBeforeAnimationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BCCardStackTransitionAnimatorWrapper *v15;
  BCCardStackTransitionAnimatorWrapper *v16;
  id v17;
  id waitUntilReadyBlock;
  id v19;
  id setupBeforeAnimationBlock;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCCardStackTransitionAnimatorWrapper;
  v15 = -[BCCardStackTransitionAnimatorWrapper init](&v22, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_animator, a3);
    objc_storeStrong((id *)&v16->_context, a4);
    v17 = objc_msgSend(v13, "copy");
    waitUntilReadyBlock = v16->_waitUntilReadyBlock;
    v16->_waitUntilReadyBlock = v17;

    v19 = objc_msgSend(v14, "copy");
    setupBeforeAnimationBlock = v16->_setupBeforeAnimationBlock;
    v16->_setupBeforeAnimationBlock = v19;

  }
  return v16;
}

- (void)waitUntilReady:(id)a3
{
  id waitUntilReadyBlock;
  void (**v5)(_QWORD);
  id v6;
  void (**v7)(void);

  waitUntilReadyBlock = self->_waitUntilReadyBlock;
  v5 = (void (**)(_QWORD))a3;
  v7 = (void (**)(void))objc_retainBlock(waitUntilReadyBlock);
  v6 = self->_waitUntilReadyBlock;
  self->_waitUntilReadyBlock = 0;

  if (v7)
    v7[2]();
  else
    v5[2](v5);

}

- (void)waitUntilReadyThenAnimate
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_29D28;
  v2[3] = &unk_28B960;
  v2[4] = self;
  -[BCCardStackTransitionAnimatorWrapper waitUntilReady:](self, "waitUntilReady:", v2);
}

- (void)_setupBeforeAnimationIfNeeded
{
  id v3;
  void *v4;
  id setupBeforeAnimationBlock;

  v3 = objc_retainBlock(self->_setupBeforeAnimationBlock);
  v4 = v3;
  if (v3)
    (*((void (**)(id))v3 + 2))(v3);

  setupBeforeAnimationBlock = self->_setupBeforeAnimationBlock;
  self->_setupBeforeAnimationBlock = 0;

}

- (void)animateTransition:(id)a3
{
  BCCardStackTransitionContext *v4;
  BCCardStackTransitionContext *context;
  void *v6;
  void *v7;
  BCCardStackTransitionContext *v8;
  id v9;
  _QWORD v10[5];

  v4 = (BCCardStackTransitionContext *)a3;
  context = self->_context;
  v8 = v4;
  if (context != v4)
  {
    -[BCCardStackTransitionContext setOuterContext:](context, "setOuterContext:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext containerView](v8, "containerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext viewForKey:](v8, "viewForKey:", UITransitionContextToViewKey));
    objc_msgSend(v6, "addSubview:", v7);

  }
  -[BCCardStackTransitionAnimatorWrapper _setupBeforeAnimationIfNeeded](self, "_setupBeforeAnimationIfNeeded", v8);
  if (-[BCCardStackTransitionContext isAnimated](self->_context, "isAnimated"))
  {
    -[BCCardStackTransitionAnimator animateTransition:](self->_animator, "animateTransition:", self->_context);
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_29E68;
    v10[3] = &unk_28B960;
    v10[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10);
  }

}

- (double)transitionDuration:(id)a3
{
  double result;

  if (!-[BCCardStackTransitionContext isAnimated](self->_context, "isAnimated", a3))
    return 0.0;
  -[BCCardStackTransitionAnimator transitionDuration:](self->_animator, "transitionDuration:", self->_context);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupBeforeAnimationBlock, 0);
  objc_storeStrong(&self->_waitUntilReadyBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

@end
