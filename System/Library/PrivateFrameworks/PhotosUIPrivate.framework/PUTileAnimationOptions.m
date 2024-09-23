@implementation PUTileAnimationOptions

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)springDampingRatio
{
  return self->_springDampingRatio;
}

- (void)setSpringDampingRatio:(double)a3
{
  self->_springDampingRatio = a3;
}

- (double)springMass
{
  return self->_springMass;
}

- (void)setSpringMass:(double)a3
{
  self->_springMass = a3;
}

- (double)springStiffness
{
  return self->_springStiffness;
}

- (void)setSpringStiffness:(double)a3
{
  self->_springStiffness = a3;
}

- (int64_t)springNumberOfOscillations
{
  return self->_springNumberOfOscillations;
}

- (void)setSpringNumberOfOscillations:(int64_t)a3
{
  self->_springNumberOfOscillations = a3;
}

- (PUDisplayVelocity)initialVelocity
{
  double x;
  double y;
  double scale;
  double rotation;
  PUDisplayVelocity result;

  x = self->_initialVelocity.x;
  y = self->_initialVelocity.y;
  scale = self->_initialVelocity.scale;
  rotation = self->_initialVelocity.rotation;
  result.rotation = rotation;
  result.scale = scale;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialVelocity:(PUDisplayVelocity)a3
{
  self->_initialVelocity = a3;
}

- (id)customViewAnimatorBlock
{
  return self->_customViewAnimatorBlock;
}

- (void)setCustomViewAnimatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (OS_dispatch_group)completionGroup
{
  return self->_completionGroup;
}

- (void)setCompletionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_completionGroup, a3);
}

- (BOOL)shouldFadeOutSnapshotAfterCompletionGroup
{
  return self->_shouldFadeOutSnapshotAfterCompletionGroup;
}

- (void)setShouldFadeOutSnapshotAfterCompletionGroup:(BOOL)a3
{
  self->_shouldFadeOutSnapshotAfterCompletionGroup = a3;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (BOOL)isSynchronizedWithTransition
{
  return self->_synchronizedWithTransition;
}

- (void)setSynchronizedWithTransition:(BOOL)a3
{
  self->_synchronizedWithTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionGroup, 0);
  objc_storeStrong(&self->_customViewAnimatorBlock, 0);
}

@end
