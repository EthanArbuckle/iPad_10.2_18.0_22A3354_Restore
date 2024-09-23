@implementation AnimationSlideParameters

+ (id)defaultParameters
{
  AnimationSlideParameters *v2;

  v2 = objc_alloc_init(AnimationSlideParameters);
  -[AnimationSlideParameters setParametersIn:](v2, "setParametersIn:", 0.5, 3.0, 1000.0, 500.0);
  -[AnimationSlideParameters setParametersOut:](v2, "setParametersOut:", 0.5, 3.0, 1000.0, 500.0);
  return v2;
}

+ (id)presentSmallerParameters
{
  AnimationSlideParameters *v2;

  v2 = objc_alloc_init(AnimationSlideParameters);
  -[AnimationSlideParameters setParametersIn:](v2, "setParametersIn:", 0.75, 3.0, 800.0, 100.0);
  -[AnimationSlideParameters setParametersOut:](v2, "setParametersOut:", 0.75, 3.0, 600.0, 100.0);
  -[AnimationSlideParameters setDeltaHeight:](v2, "setDeltaHeight:", 25.0);
  return v2;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)parametersIn
{
  double duration;
  double mass;
  double stiffness;
  double damping;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  duration = self->_parametersIn.duration;
  mass = self->_parametersIn.mass;
  stiffness = self->_parametersIn.stiffness;
  damping = self->_parametersIn.damping;
  result.var3 = damping;
  result.var2 = stiffness;
  result.var1 = mass;
  result.var0 = duration;
  return result;
}

- (void)setParametersIn:(id)a3
{
  self->_parametersIn = ($C39209D24F8C0E14F362D4CE5DC9A0EC)a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)parametersOut
{
  double duration;
  double mass;
  double stiffness;
  double damping;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  duration = self->_parametersOut.duration;
  mass = self->_parametersOut.mass;
  stiffness = self->_parametersOut.stiffness;
  damping = self->_parametersOut.damping;
  result.var3 = damping;
  result.var2 = stiffness;
  result.var1 = mass;
  result.var0 = duration;
  return result;
}

- (void)setParametersOut:(id)a3
{
  self->_parametersOut = ($C39209D24F8C0E14F362D4CE5DC9A0EC)a3;
}

- (double)deltaHeight
{
  return self->_deltaHeight;
}

- (void)setDeltaHeight:(double)a3
{
  self->_deltaHeight = a3;
}

@end
