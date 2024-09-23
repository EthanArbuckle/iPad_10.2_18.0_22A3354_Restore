@implementation _UIViewPropertyAnimatorTrackingGroup

- (_UIViewPropertyAnimatorTrackingGroup)initWithAnimators:(id)a3
{
  id v5;
  _UIViewPropertyAnimatorTrackingGroup *v6;
  _UIViewPropertyAnimatorTrackingGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewPropertyAnimatorTrackingGroup;
  v6 = -[_UIViewPropertyAnimatorTrackingGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_trackingAnimators, a3);

  return v7;
}

- (void)addAnimations:(id)a3
{
  NSArray *trackingAnimators;
  id v4;
  id v5;

  trackingAnimators = self->_trackingAnimators;
  v4 = a3;
  -[NSArray firstObject](trackingAnimators, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimations:", v4);

}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  id v6;
  NSArray *trackingAnimators;
  id v8;
  _QWORD v9[4];
  id v10;
  double v11;

  v6 = a3;
  trackingAnimators = self->_trackingAnimators;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93___UIViewPropertyAnimatorTrackingGroup_continueAnimationWithTimingParameters_durationFactor___block_invoke;
  v9[3] = &unk_1E16B46F8;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[NSArray enumerateObjectsUsingBlock:](trackingAnimators, "enumerateObjectsUsingBlock:", v9);

}

- (void)addCompletion:(id)a3
{
  NSArray *trackingAnimators;
  id v4;
  id v5;

  trackingAnimators = self->_trackingAnimators;
  v4 = a3;
  -[NSArray firstObject](trackingAnimators, "firstObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCompletion:", v4);

}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  -[NSArray firstObject](self->_trackingAnimators, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (BOOL)isRunning
{
  void *v2;
  char v3;

  -[NSArray firstObject](self->_trackingAnimators, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (BOOL)isReversed
{
  void *v2;
  char v3;

  -[NSArray firstObject](self->_trackingAnimators, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isReversed");

  return v3;
}

- (void)setReversed:(BOOL)a3
{
  NSArray *trackingAnimators;
  _QWORD v4[4];
  BOOL v5;

  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52___UIViewPropertyAnimatorTrackingGroup_setReversed___block_invoke;
  v4[3] = &__block_descriptor_33_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](trackingAnimators, "enumerateObjectsUsingBlock:", v4);
}

- (double)fractionComplete
{
  void *v2;
  double v3;
  double v4;

  -[NSArray firstObject](self->_trackingAnimators, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fractionComplete");
  v4 = v3;

  return v4;
}

- (void)setFractionComplete:(double)a3
{
  NSArray *trackingAnimators;
  _QWORD v4[5];

  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60___UIViewPropertyAnimatorTrackingGroup_setFractionComplete___block_invoke;
  v4[3] = &__block_descriptor_40_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  *(double *)&v4[4] = a3;
  -[NSArray enumerateObjectsUsingBlock:](trackingAnimators, "enumerateObjectsUsingBlock:", v4);
}

- (void)startAnimation
{
  -[NSArray enumerateObjectsUsingBlock:](self->_trackingAnimators, "enumerateObjectsUsingBlock:", &__block_literal_global_852);
}

- (void)startAnimationAfterDelay:(double)a3
{
  NSArray *trackingAnimators;
  _QWORD v4[5];

  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65___UIViewPropertyAnimatorTrackingGroup_startAnimationAfterDelay___block_invoke;
  v4[3] = &__block_descriptor_40_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  *(double *)&v4[4] = a3;
  -[NSArray enumerateObjectsUsingBlock:](trackingAnimators, "enumerateObjectsUsingBlock:", v4);
}

- (void)pauseAnimation
{
  -[NSArray enumerateObjectsUsingBlock:](self->_trackingAnimators, "enumerateObjectsUsingBlock:", &__block_literal_global_853);
}

- (void)stopAnimation:(BOOL)a3
{
  NSArray *trackingAnimators;
  _QWORD v4[4];
  BOOL v5;

  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54___UIViewPropertyAnimatorTrackingGroup_stopAnimation___block_invoke;
  v4[3] = &__block_descriptor_33_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  v5 = a3;
  -[NSArray enumerateObjectsUsingBlock:](trackingAnimators, "enumerateObjectsUsingBlock:", v4);
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  NSArray *trackingAnimators;
  _QWORD v4[5];

  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66___UIViewPropertyAnimatorTrackingGroup_finishAnimationAtPosition___block_invoke;
  v4[3] = &__block_descriptor_40_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  v4[4] = a3;
  -[NSArray enumerateObjectsUsingBlock:](trackingAnimators, "enumerateObjectsUsingBlock:", v4);
}

- (NSArray)trackingAnimators
{
  return self->_trackingAnimators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingAnimators, 0);
}

@end
