@implementation _UILabelMarqueeAnimationDelegate

- (_UILabelMarqueeAnimationDelegate)initWithLabel:(id)a3
{
  id v4;
  _UILabelMarqueeAnimationDelegate *v5;
  _UILabelMarqueeAnimationDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UILabelMarqueeAnimationDelegate;
  v5 = -[_UILabelMarqueeAnimationDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_label, v4);

  return v6;
}

- (void)animationDidStart:(id)a3
{
  _BOOL4 started;
  BOOL *p_started;
  void *v6;
  id *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  p_started = &self->_started;
  started = self->_started;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id *)(p_started + 8);
  if (started)
  {
    v8 = _UILabelMarqueeUpdatedNotification;
    WeakRetained = objc_loadWeakRetained(v7);
    v32 = _UILabelMarqueeNotificationDurationKey;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = WeakRetained;
    objc_msgSend(v11, "textSizeForWidth:", 3.40282347e38);
    v13 = v12;
    objc_msgSend(v11, "marqueeLoopPadding");
    v15 = (v13 + v14) / 30.0;
    v16 = -[UILabel _maximumMarqueeTextWidth](v11);
    objc_msgSend(v11, "marqueeLoopPadding");
    objc_msgSend(v10, "numberWithDouble:", v15 + 1.5 + (v16 + v17) / 30.0 - v15 + 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", v8, v11, v19);

    p_started = &self->_updated;
  }
  else
  {
    v20 = _UILabelMarqueeStartedNotification;
    v21 = objc_loadWeakRetained(v7);
    v34 = _UILabelMarqueeNotificationDurationKey;
    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v21;
    objc_msgSend(v23, "textSizeForWidth:", 3.40282347e38);
    v25 = v24;
    objc_msgSend(v23, "marqueeLoopPadding");
    v27 = (v25 + v26) / 30.0;
    v28 = -[UILabel _maximumMarqueeTextWidth](v23);
    objc_msgSend(v23, "marqueeLoopPadding");
    objc_msgSend(v22, "numberWithDouble:", v27 + 1.5 + (v28 + v29) / 30.0 - v27 + 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", v20, v23, v31);

  }
  *p_started = 1;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _UILabelMarqueeAnimationDelegate *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD block[5];

  if (self->_suppressEnded)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    v5 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    self->_suppressEnded = 0;

  }
  else
  {
    v6 = a4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _UILabelMarqueeEndedNotification;
    WeakRetained = objc_loadWeakRetained((id *)&self->_label);
    objc_msgSend(v7, "postNotificationName:object:userInfo:", v8, WeakRetained, 0);

    v10 = objc_loadWeakRetained((id *)&self->_label);
    objc_setAssociatedObject(v10, &__marqueeAnimationDelegateKey, 0, (void *)1);

    if (v6)
    {
      v11 = objc_loadWeakRetained((id *)&self->_label);
      v12 = objc_msgSend(v11, "marqueeRepeatCount");

      if (v12)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __62___UILabelMarqueeAnimationDelegate_animationDidStop_finished___block_invoke_2;
        v13[3] = &unk_1E16B1B28;
        v13[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v13);
      }
    }
  }
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (BOOL)suppressEnded
{
  return self->_suppressEnded;
}

- (void)setSuppressEnded:(BOOL)a3
{
  self->_suppressEnded = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
}

@end
