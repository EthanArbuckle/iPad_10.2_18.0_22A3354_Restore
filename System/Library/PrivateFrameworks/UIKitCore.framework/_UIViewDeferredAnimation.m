@implementation _UIViewDeferredAnimation

- (void)_finalize
{
  self->_finalized = 1;
}

- (double)repeatCount
{
  return self->_repeatCount;
}

- (id)initialValue
{
  return self->_initialValue;
}

- (void)calculateFrameValues:(id)a3 frameTimes:(id)a4 withFrameInterval:(double)a5 valueTransformer:(id)a6
{
  unint64_t v11;
  id v12;
  double duration;
  double v14;
  void *v15;
  unint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  double v21;

  v16 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a6;
  if (!self->_finalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2981, CFSTR("You can only calculate keyframes from animations that have been finalized"));

  }
  if (!-[_UIViewDeferredAnimation isEmpty](self, "isEmpty") && v16 | v11)
  {
    duration = self->_duration;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __95___UIViewDeferredAnimation_calculateFrameValues_frameTimes_withFrameInterval_valueTransformer___block_invoke;
    v17[3] = &unk_1E16EB238;
    v14 = a5 / duration;
    v20 = v12;
    v18 = (id)v16;
    v19 = (id)v11;
    v21 = v14;
    -[_UIViewDeferredAnimation _enumerateAnimationFramesForKeyframes:](self, "_enumerateAnimationFramesForKeyframes:", v17);

  }
}

- (BOOL)autoreverses
{
  return self->_autoreverses;
}

- (void)addAnimationFrameForValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  if (self->_finalized)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2960, CFSTR("You can only add values to animations that have not yet been finalized"));

    v5 = v8;
    if (v8)
      goto LABEL_3;
LABEL_5:
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2961, CFSTR("You must provide a value (key=%@)"), self->_key);

    v5 = v9;
    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:

}

- (void)setRepeatCount:(double)a3
{
  self->_repeatCount = a3;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setInitialValue:(id)a3
{
  objc_storeStrong(&self->_initialValue, a3);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setAutoreverses:(BOOL)a3
{
  self->_autoreverses = a3;
}

- (NSArray)animationFrames
{
  void *v5;

  if (!self->_finalized)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2954, CFSTR("You cannot get animation frames from an animation that has not been finalized"));

  }
  return (NSArray *)-[_UIViewDeferredAnimation _animationFrames](self, "_animationFrames");
}

- (void)animateFrameAtIndex:(int64_t)a3 animations:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  if (!self->_finalized)
  {
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2966, CFSTR("You can only add frames from animations that have been finalized"));

    v6 = v9;
    if (v9)
      goto LABEL_3;
LABEL_5:
    v10 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2967, CFSTR("animations must be non-nil"));

    v6 = v10;
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_5;
LABEL_3:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_initialValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)_animationFrames
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)_UIViewDeferredAnimation;
  -[_UIViewDeferredAnimation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ key=%@ duration=%f initialValue=%@"), v4, self->_key, *(_QWORD *)&self->_duration, self->_initialValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_finalized)
  {
    -[_UIViewDeferredAnimation _animationFrames](self, "_animationFrames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" animationFrames=%@"), v6);

  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (double)duration
{
  return self->_duration;
}

@end
