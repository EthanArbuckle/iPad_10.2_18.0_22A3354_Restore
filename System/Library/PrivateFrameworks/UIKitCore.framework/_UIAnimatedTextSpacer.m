@implementation _UIAnimatedTextSpacer

- (BOOL)isAnimating
{
  return self->_height != 0.0 || self->_targetHeight != 0.0;
}

- (_UIAnimatedTextSpacer)initWithSpringBehavior:(id)a3 delay:(double)a4 duration:(double)a5
{
  id v9;
  _UIAnimatedTextSpacer *v10;
  _UIAnimatedTextSpacer *v11;
  UIViewFloatAnimatableProperty *v12;
  UIViewFloatAnimatableProperty *heightAnimationProperty;
  void *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_UIAnimatedTextSpacer;
  v10 = -[_UIAnimatedTextSpacer init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_springBehavior, a3);
    v11->_delay = a4;
    v11->_duration = a5;
    v12 = objc_alloc_init(UIViewFloatAnimatableProperty);
    heightAnimationProperty = v11->_heightAnimationProperty;
    v11->_heightAnimationProperty = v12;

    objc_initWeak(&location, v11);
    v20[0] = v11->_heightAnimationProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63___UIAnimatedTextSpacer_initWithSpringBehavior_delay_duration___block_invoke;
    v16[3] = &unk_1E16B3F40;
    objc_copyWeak(&v17, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v14, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (_UIAnimatedTextSpacer)init
{
  return -[_UIAnimatedTextSpacer initWithSpringBehavior:delay:duration:](self, "initWithSpringBehavior:delay:duration:", 0, 0.0, 0.0);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_UIAnimatedTextSpacer;
  -[_UIAnimatedTextSpacer dealloc](&v2, sel_dealloc);
}

- (void)_clearAnimationState
{
  UIViewFloatAnimatableProperty *heightAnimationProperty;
  id completionHandler;

  self->_targetHeight = 0.0;
  heightAnimationProperty = self->_heightAnimationProperty;
  self->_heightAnimationProperty = 0;
  self->_height = 0.0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)_updateAnimation
{
  double v3;
  void (**layoutInvalidator)(void);

  -[UIViewFloatAnimatableProperty presentationValue](self->_heightAnimationProperty, "presentationValue");
  self->_height = v3;
  layoutInvalidator = (void (**)(void))self->_layoutInvalidator;
  if (layoutInvalidator)
    layoutInvalidator[2]();
}

- (void)_startAnimation
{
  UIViewSpringAnimationBehavior *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id location;

  -[UIViewFloatAnimatableProperty setValue:](self->_heightAnimationProperty, "setValue:", self->_height);
  v3 = self->_springBehavior;
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___UIAnimatedTextSpacer__startAnimation__block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __40___UIAnimatedTextSpacer__startAnimation__block_invoke_2;
  v10[3] = &unk_1E16B7008;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  v6 = _Block_copy(v10);
  v7 = v6;
  if (self->_springBehavior)
  {
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __40___UIAnimatedTextSpacer__startAnimation__block_invoke_3;
    v8[3] = &unk_1E16C0E38;
    v9 = v6;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v3, 0, v5, v8);

  }
  else
  {
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v5, v6, self->_duration, self->_delay);
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)animateHeightFromSource:(double)a3 destination:(double)a4
{
  if (!-[_UIAnimatedTextSpacer isAnimating](self, "isAnimating"))
  {
    self->_targetHeight = a4;
    self->_height = a3;
    if (self->_delay <= 0.0)
      -[_UIAnimatedTextSpacer _startAnimation](self, "_startAnimation");
    else
      -[_UIAnimatedTextSpacer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__startAnimation, 0);
  }
}

- (CGRect)presentationFrameForTextLayoutFragmentFrame:(CGRect)result
{
  double height;

  height = self->_height;
  result.size.height = height;
  return result;
}

- (double)verticalOffsetForSucceedingLayout
{
  return self->_height - self->_targetHeight;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSpringBehavior:delay:duration:", self->_springBehavior, self->_delay, self->_duration);
}

+ (BOOL)worksWithTextView:(id)a3
{
  return objc_msgSend(a3, "worksWithAnimatedTextSpacer");
}

- (id)synchronizedAnimationUpdater
{
  return self->_synchronizedAnimationUpdater;
}

- (void)setSynchronizedAnimationUpdater:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIViewFloatAnimatableProperty)heightAnimationProperty
{
  return self->_heightAnimationProperty;
}

- (void)setHeightAnimationProperty:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnimationProperty, a3);
}

- (double)height
{
  return self->_height;
}

- (id)layoutInvalidator
{
  return self->_layoutInvalidator;
}

- (void)setLayoutInvalidator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutInvalidator, 0);
  objc_storeStrong((id *)&self->_heightAnimationProperty, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_synchronizedAnimationUpdater, 0);
  objc_storeStrong((id *)&self->_springBehavior, 0);
}

@end
