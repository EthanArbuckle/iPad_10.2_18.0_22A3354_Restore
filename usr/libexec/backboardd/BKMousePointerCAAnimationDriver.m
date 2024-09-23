@implementation BKMousePointerCAAnimationDriver

- (BKMousePointerCAAnimationDriver)initWithRelativeTranslation:(CGPoint)a3 animationSettings:(id)a4
{
  double y;
  double x;
  id v7;
  BKMousePointerCAAnimationDriver *v8;
  BSAnimationSettings *v9;
  BSAnimationSettings *animationSettings;
  uint64_t v11;
  NSMutableDictionary *valueDictionary;
  CABasicAnimation *v13;
  double v14;
  CABasicAnimation *animation;
  CABasicAnimation *v16;
  CABasicAnimation *v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BKMousePointerCAAnimationDriver;
  v8 = -[BKMousePointerAnimationDriver initWithRelativeTranslation:](&v22, "initWithRelativeTranslation:", x, y);
  if (v8)
  {
    v9 = (BSAnimationSettings *)objc_msgSend(v7, "copy");
    animationSettings = v8->_animationSettings;
    v8->_animationSettings = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    valueDictionary = v8->_valueDictionary;
    v8->_valueDictionary = (NSMutableDictionary *)v11;

    if (-[BSAnimationSettings isSpringAnimation](v8->_animationSettings, "isSpringAnimation"))
    {
      v13 = (CABasicAnimation *)objc_alloc_init((Class)CASpringAnimation);
      -[BSAnimationSettings applyToCAAnimation:](v8->_animationSettings, "applyToCAAnimation:", v13);
      -[CABasicAnimation settlingDuration](v13, "settlingDuration");
      v8->_duration = v14;
      -[CABasicAnimation setDuration:](v13, "setDuration:");
      animation = v8->_animation;
      v8->_animation = v13;

    }
    else
    {
      v16 = (CABasicAnimation *)objc_alloc_init((Class)CABasicAnimation);
      v17 = v8->_animation;
      v8->_animation = v16;

      -[BSAnimationSettings applyToCAAnimation:](v8->_animationSettings, "applyToCAAnimation:", v8->_animation);
      -[BSAnimationSettings duration](v8->_animationSettings, "duration");
      v8->_duration = v18;
    }
    -[CABasicAnimation setBeginTime:](v8->_animation, "setBeginTime:", 0.0);
    -[CABasicAnimation setKeyPath:](v8->_animation, "setKeyPath:", CFSTR("value"));
    -[CABasicAnimation setRemovedOnCompletion:](v8->_animation, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v8->_animation, "setFillMode:", kCAFillModeBoth);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", CGPointZero.x, CGPointZero.y));
    -[CABasicAnimation setFromValue:](v8->_animation, "setFromValue:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", x, y));
    -[CABasicAnimation setToValue:](v8->_animation, "setToValue:", v20);

  }
  return v8;
}

- (void)applyForTime:(double)a3
{
  CGFloat v4;
  CGFloat v5;
  id v6;

  self->_elapsedTime = a3;
  -[CABasicAnimation applyForTime:presentationObject:modelObject:](self->_animation, "applyForTime:presentationObject:modelObject:", self->_valueDictionary, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_valueDictionary, "objectForKey:", CFSTR("value")));
  objc_msgSend(v6, "bs_CGPointValue");
  self->_currentTranslation.x = v4;
  self->_currentTranslation.y = v5;

}

- (BOOL)isComplete
{
  return BSFloatGreaterThanOrEqualToFloat(self->_elapsedTime, self->_duration);
}

- (CGPoint)currentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDictionary, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end
