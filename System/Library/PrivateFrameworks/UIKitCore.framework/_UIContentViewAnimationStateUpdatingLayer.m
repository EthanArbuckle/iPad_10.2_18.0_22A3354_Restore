@implementation _UIContentViewAnimationStateUpdatingLayer

+ (id)layerForView:(id)a3 withUpdateHandler:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  _QWORD v31[4];
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIContentViewShared.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateHandler != NULL"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIContentViewShared.m"), 233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler != NULL"));

LABEL_3:
  v32.receiver = a1;
  v32.super_class = (Class)&OBJC_METACLASS____UIContentViewAnimationStateUpdatingLayer;
  objc_msgSendSuper2(&v32, sel_layer);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 1;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94___UIContentViewAnimationStateUpdatingLayer_layerForView_withUpdateHandler_completionHandler___block_invoke;
    aBlock[3] = &unk_1E16EA038;
    v28 = v30;
    v29 = v31;
    v26 = v10;
    v27 = v12;
    v14 = _Block_copy(aBlock);
    v15 = (void *)v13[4];
    v13[4] = v14;

    objc_msgSend(v13, "setFrame:", -1.0, -1.0, 1.0, 1.0);
    objc_msgSend(v9, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v13);

    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("progress"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFromValue:", &unk_1E1A96310);
    objc_msgSend(v17, "setToValue:", &unk_1E1A96320);
    objc_msgSend(v17, "setRemovedOnCompletion:", 0);
    +[UIView _currentViewAnimationState](UIView, "_currentViewAnimationState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAnimationAttributes:skipDelegateAssignment:customCurve:", v17, 0, 0);
    if (+[UIView _shouldTrackAnimationsWithAnimator](UIView, "_shouldTrackAnimationsWithAnimator"))
    {
      +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:forLayer:forKey:](UIViewPropertyAnimator, "_trackNonAdditiveAnimationWithAnimator:forLayer:forKey:", v17, v13, CFSTR("progress"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "toValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_setOriginalToValue:forKey:inLayer:", v20, CFSTR("progress"), v13);

    }
    else if (+[UIView _isAnimationTracking](UIView, "_isAnimationTracking"))
    {
      objc_msgSend(v18, "_trackAnimation:withAnimationKey:forKeyPath:inLayer:", v17, CFSTR("progress"), CFSTR("progress"), v13);
    }
    objc_msgSend(v17, "keyPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v17, v21);

    v13[5] = 0x3FF0000000000000;
    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v31, 8);
  }

  return v13;
}

- (_UIContentViewAnimationStateUpdatingLayer)initWithLayer:(id)a3
{
  _QWORD *v5;
  _UIContentViewAnimationStateUpdatingLayer *v6;
  _UIContentViewAnimationStateUpdatingLayer *v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  id progressHandler;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContentViewShared.m"), 282, CFSTR("Unexpected layer class: %@"), v5);

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIContentViewAnimationStateUpdatingLayer;
  v6 = -[_UIContentViewAnimationStateUpdatingLayer initWithLayer:](&v14, sel_initWithLayer_, v5);
  v7 = v6;
  if (v6)
  {
    v6->_progress = (double)v5[5];
    v8 = (void *)v5[4];
    v9 = v5;
    v10 = objc_msgSend(v8, "copy");
    progressHandler = v7->_progressHandler;
    v7->_progressHandler = (id)v10;

  }
  return v7;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("progress")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____UIContentViewAnimationStateUpdatingLayer;
    v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  -[_UIContentViewAnimationStateUpdatingLayer _updateWithAnimationProgress:completed:]((uint64_t)self, 0, self->_progress);
}

- (void)_updateWithAnimationProgress:(double)a3 completed:
{
  void *v5;
  id v6;

  if (a1)
  {
    v5 = _Block_copy(*(const void **)(a1 + 32));
    if (v5)
    {
      v6 = v5;
      (*((void (**)(void *, uint64_t, double))v5 + 2))(v5, a2, a3);
      v5 = v6;
    }

  }
}

- (void)animationCompletedWithPosition:(int64_t)a3
{
  double v4;
  id progressHandler;

  v4 = 0.0;
  if (!a3)
    v4 = 1.0;
  self->_progress = v4;
  -[_UIContentViewAnimationStateUpdatingLayer _updateWithAnimationProgress:completed:]((uint64_t)self, 1, v4);
  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  -[_UIContentViewAnimationStateUpdatingLayer removeFromSuperlayer](self, "removeFromSuperlayer");
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
