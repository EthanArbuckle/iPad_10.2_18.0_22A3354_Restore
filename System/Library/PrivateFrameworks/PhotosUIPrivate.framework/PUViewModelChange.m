@implementation PUViewModelChange

- (void)setHasChanges
{
  self->_hasChanges = 1;
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

@end
