@implementation _TUIInteractiveBasePressAnimationDelegate

- (_TUIInteractiveBasePressAnimationDelegate)initWithCompletion:(id)a3
{
  id v4;
  _TUIInteractiveBasePressAnimationDelegate *v5;
  id v6;
  id completion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIInteractiveBasePressAnimationDelegate;
  v5 = -[_TUIInteractiveBasePressAnimationDelegate init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    completion = v5->_completion;
    v5->_completion = v6;

  }
  return v5;
}

- (void)_decrementCount
{
  unint64_t animationCount;
  unint64_t v4;
  void (**completion)(id, SEL);
  id v6;

  animationCount = self->_animationCount;
  if (animationCount)
  {
    v4 = animationCount - 1;
    self->_animationCount = v4;
    if (!v4)
    {
      completion = (void (**)(id, SEL))self->_completion;
      if (completion)
      {
        completion[2](completion, a2);
        v6 = self->_completion;
        self->_completion = 0;

      }
    }
  }
}

- (void)animationDidStart:(id)a3
{
  ++self->_animationCount;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[_TUIInteractiveBasePressAnimationDelegate _decrementCount](self, "_decrementCount", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
