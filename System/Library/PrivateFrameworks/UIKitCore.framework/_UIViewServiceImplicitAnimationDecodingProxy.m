@implementation _UIViewServiceImplicitAnimationDecodingProxy

+ (id)proxyDecodingAnimationsForTarget:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____UIViewServiceImplicitAnimationDecodingProxy;
  objc_msgSendSuper2(&v4, sel_proxyWithTarget_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  _UIViewAnimationAttributes *v5;
  _UIViewAnimationAttributes *animationAttributes;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  _UIViewServiceImplicitAnimationDecodingProxy *v10;

  v4 = a3;
  if ((SEL)objc_msgSend(v4, "selector") == self->_implicitAnimationSelector && (v5 = self->_animationAttributes) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66___UIViewServiceImplicitAnimationDecodingProxy_forwardInvocation___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v9 = v4;
    v10 = self;
    +[UIView _animateWithAttributes:animations:completion:](UIView, "_animateWithAttributes:animations:completion:", v5, v8, 0);
    self->_implicitAnimationSelector = 0;
    animationAttributes = self->_animationAttributes;
    self->_animationAttributes = 0;

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIViewServiceImplicitAnimationDecodingProxy;
    -[_UITargetedProxy forwardInvocation:](&v7, sel_forwardInvocation_, v4);
  }

}

- (void)__animateNextInvocationOfSelector:(id)a3 withAnimationAttributes:(id)a4 animationsEnabled:(BOOL)a5
{
  NSString *v8;
  const char *v9;

  objc_storeStrong((id *)&self->_animationAttributes, a4);
  v8 = (NSString *)a3;
  self->_animationsEnabled = a5;
  v9 = NSSelectorFromString(v8);

  self->_implicitAnimationSelector = v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationAttributes, 0);
}

@end
