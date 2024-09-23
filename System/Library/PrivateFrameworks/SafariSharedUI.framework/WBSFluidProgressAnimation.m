@implementation WBSFluidProgressAnimation

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (double)initialPosition
{
  return self->_initialPosition;
}

- (void)setInitialPosition:(double)a3
{
  self->_initialPosition = a3;
}

- (double)destinationPosition
{
  return self->_destinationPosition;
}

- (void)setDestinationPosition:(double)a3
{
  self->_destinationPosition = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
