@implementation _UIViewDeferredBasicAnimation

- (void)addAnimationFrameForValue:(id)a3
{
  id v4;
  _UIViewAnimationFrame *v5;
  _UIViewAnimationFrame *finalValue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIViewDeferredBasicAnimation;
  v4 = a3;
  -[_UIViewDeferredAnimation addAnimationFrameForValue:](&v7, sel_addAnimationFrameForValue_, v4);
  objc_msgSend((id)__currentViewAnimationState, "_updateAnimationFrameWithAnimationProperties:", self->_finalValue, v7.receiver, v7.super_class);
  v5 = (_UIViewAnimationFrame *)objc_claimAutoreleasedReturnValue();
  finalValue = self->_finalValue;
  self->_finalValue = v5;

  -[_UIViewAnimationFrame setValue:](self->_finalValue, "setValue:", v4);
}

- (id)_animationFrames
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_finalValue)
  {
    v4[0] = self->_finalValue;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4
{
  void (**v7)(id, _UIViewAnimationFrame *);
  void *v8;
  objc_super v9;

  v7 = (void (**)(id, _UIViewAnimationFrame *))a4;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewDeferredBasicAnimation;
  -[_UIViewDeferredAnimation animateFrameAtIndex:animations:](&v9, sel_animateFrameAtIndex_animations_, a3, v7);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 3041, CFSTR("frameIndex out of bounds"));

  }
  v7[2](v7, self->_finalValue);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalValue, 0);
}

- (BOOL)isEmpty
{
  return self->_finalValue == 0;
}

- (void)_enumerateAnimationFramesForKeyframes:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[_UIViewDeferredAnimation initialValue](self, "initialValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, double, double, double))a3 + 2))(v5, v6, 0.0, 0.0, 0.0);

  -[_UIViewAnimationFrame value](self->_finalValue, "value");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, double, double, double))a3 + 2))(v5, v7, 0.0, 1.0, 1.0);

}

@end
