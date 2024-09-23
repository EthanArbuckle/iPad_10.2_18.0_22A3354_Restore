@implementation _AnimationManagerRunner

- (_AnimationManagerRunner)initWithAnimationManager:(void *)a3
{
  _AnimationManagerRunner *v4;
  _AnimationManagerRunner *v5;
  _AnimationManagerRunner *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_AnimationManagerRunner;
  v4 = -[_AnimationManagerRunner init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_animationManager = a3;
    v6 = v4;
  }

  return v5;
}

- (void)animationDidStop:(id)a3
{
  (*(void (**)(void *, id))(*(_QWORD *)self->_animationManager + 32))(self->_animationManager, a3);
}

- (void)animationDidResume:(id)a3
{
  (*(void (**)(void *, id))(*(_QWORD *)self->_animationManager + 40))(self->_animationManager, a3);
}

@end
