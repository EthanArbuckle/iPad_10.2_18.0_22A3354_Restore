@implementation _UIViewServiceImplicitAnimationEncodingProxy

+ (id)proxyEncodingAnimationsForTarget:(id)a3 controlMessageTarget:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____UIViewServiceImplicitAnimationEncodingProxy;
  objc_msgSendSuper2(&v10, sel_proxyWithTarget_, a3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  id controlMessageTarget;
  void *v7;
  objc_super v8;

  v4 = a3;
  if (pthread_main_np() == 1)
  {
    +[UIView _currentAnimationAttributes](UIView, "_currentAnimationAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      controlMessageTarget = self->_controlMessageTarget;
      if (controlMessageTarget)
      {
        NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(controlMessageTarget, "__animateNextInvocationOfSelector:withAnimationAttributes:animationsEnabled:", v7, v5, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));

      }
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)_UIViewServiceImplicitAnimationEncodingProxy;
  -[_UITargetedProxy forwardInvocation:](&v8, sel_forwardInvocation_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_controlMessageTarget, 0);
}

@end
