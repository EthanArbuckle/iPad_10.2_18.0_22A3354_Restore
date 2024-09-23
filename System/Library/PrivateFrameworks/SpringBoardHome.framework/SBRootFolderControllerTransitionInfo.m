@implementation SBRootFolderControllerTransitionInfo

- (int64_t)sourcePageState
{
  return self->_sourcePageState;
}

- (void)setSourcePageState:(int64_t)a3
{
  self->_sourcePageState = a3;
}

- (int64_t)destinationPageState
{
  return self->_destinationPageState;
}

- (void)setDestinationPageState:(int64_t)a3
{
  self->_destinationPageState = a3;
}

@end
