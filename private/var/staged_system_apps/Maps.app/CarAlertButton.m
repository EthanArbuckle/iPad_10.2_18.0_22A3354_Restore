@implementation CarAlertButton

- (id)accessibilityIdentifier
{
  return CFSTR("CarAlertButton");
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (BOOL)cancels
{
  return self->_cancels;
}

- (void)setCancels:(BOOL)a3
{
  self->_cancels = a3;
}

@end
