@implementation TUIAnimationBuilder

- (TUIAnimationBuilder)init
{
  TUIAnimationBuilder *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIAnimationBuilder;
  result = -[TUIAnimationBuilder init](&v3, "init");
  if (result)
    result->_error = 0;
  return result;
}

- (void)configureWithNode:(id)a3 attributes:(id)a4
{
  id v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  CGFloat v11;

  v6 = a4;
  objc_msgSend(v6, "floatForAttribute:node:", 66, a3.var0);
  self->_delay = v7;
  objc_msgSend(v6, "floatForAttribute:node:", 69, a3.var0);
  self->_duration = v8;
  self->_options = (unint64_t)objc_msgSend(v6, "animationCalculationModeAndCurveForNode:", a3.var0);
  if (v6)
  {
    objc_msgSend(v6, "springTimingParametersForAttribute:node:", 202, a3.var0);
  }
  else
  {
    v11 = 0.0;
    v9 = 0u;
    v10 = 0u;
  }
  *(_OWORD *)&self->_timing.mass = v9;
  *(_OWORD *)&self->_timing.damping = v10;
  self->_timing.initialVelocity.dy = v11;

}

- (void)addFromAnimationStep:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (self->_from || self->_keyFrames)
  {
    self->_error = 1019;
  }
  else
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_from, a3);
    v5 = v6;
  }

}

- (void)addToAnimationStep:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  if (*(_OWORD *)&self->_to == 0)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_to, a3);

  }
  else
  {
    self->_error = 1019;

  }
}

- (void)addKeyframeStep:(id)a3
{
  id v4;
  NSMutableArray *keyFrames;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (*(_OWORD *)&self->_from == 0)
  {
    keyFrames = self->_keyFrames;
    v8 = v4;
    if (!keyFrames)
    {
      v6 = objc_opt_new(NSMutableArray);
      v7 = self->_keyFrames;
      self->_keyFrames = v6;

      keyFrames = self->_keyFrames;
    }
    -[NSMutableArray addObject:](keyFrames, "addObject:", v8);
    v4 = v8;
  }
  else
  {
    self->_error = 1019;
  }

}

- (id)finalizeAnimationWithContext:(id)a3
{
  unint64_t error;
  TUIAnimation *v6;
  __int128 v7;
  _OWORD v8[2];
  CGFloat dy;

  error = self->_error;
  if (error)
  {
    objc_msgSend(a3, "reportError:", error);
    return 0;
  }
  else
  {
    v6 = objc_alloc_init(TUIAnimation);
    -[TUIAnimation setFrom:](v6, "setFrom:", self->_from);
    -[TUIAnimation setTo:](v6, "setTo:", self->_to);
    -[TUIAnimation setSteps:](v6, "setSteps:", self->_keyFrames);
    -[TUIAnimation setDelay:](v6, "setDelay:", self->_delay);
    -[TUIAnimation setDuration:](v6, "setDuration:", self->_duration);
    -[TUIAnimation setOptions:](v6, "setOptions:", self->_options | -[TUIAnimation options](v6, "options"));
    v7 = *(_OWORD *)&self->_timing.damping;
    v8[0] = *(_OWORD *)&self->_timing.mass;
    v8[1] = v7;
    dy = self->_timing.initialVelocity.dy;
    -[TUIAnimation setTiming:](v6, "setTiming:", v8);
    return v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFrames, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
}

@end
