@implementation DeliveryOptions

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("playSound: %d, forceAll: %d, isUserRequested: %d"), self->_playSound, self->_forceAll, self->_isUserRequested);
}

- (BOOL)playSound
{
  return self->_playSound;
}

- (void)setPlaySound:(BOOL)a3
{
  self->_playSound = a3;
}

- (BOOL)forceAll
{
  return self->_forceAll;
}

- (void)setForceAll:(BOOL)a3
{
  self->_forceAll = a3;
}

- (BOOL)isUserRequested
{
  return self->_isUserRequested;
}

- (void)setIsUserRequested:(BOOL)a3
{
  self->_isUserRequested = a3;
}

@end
