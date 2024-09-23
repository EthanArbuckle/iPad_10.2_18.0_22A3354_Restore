@implementation WPResourceRequestOptions

- (BOOL)afterUpdates
{
  return self->_afterUpdates;
}

- (void)setAfterUpdates:(BOOL)a3
{
  self->_afterUpdates = a3;
}

@end
