@implementation SBPressGestureStateInfo

- (SBPressGestureStateInfo)init
{
  SBPressGestureStateInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPressGestureStateInfo;
  result = -[SBPressGestureStateInfo init](&v3, sel_init);
  if (result)
  {
    result->_isCoalescing = 0;
    result->_expirationTime = -1.0;
  }
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isCoalescing
{
  return self->_isCoalescing;
}

- (void)setIsCoalescing:(BOOL)a3
{
  self->_isCoalescing = a3;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (int64_t)stateUponExpiration
{
  return self->_stateUponExpiration;
}

- (void)setStateUponExpiration:(int64_t)a3
{
  self->_stateUponExpiration = a3;
}

@end
