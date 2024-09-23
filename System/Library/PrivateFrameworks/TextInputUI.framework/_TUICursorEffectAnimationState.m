@implementation _TUICursorEffectAnimationState

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (CABasicAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_animation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);
}

@end
