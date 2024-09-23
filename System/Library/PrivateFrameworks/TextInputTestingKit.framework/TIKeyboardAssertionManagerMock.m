@implementation TIKeyboardAssertionManagerMock

- (BOOL)hasAssertions
{
  return 0;
}

- (BOOL)hasBackgroundActivityAssertions
{
  return 0;
}

- (TIKeyboardAssertionManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TIKeyboardAssertionManagerDelegate *)a3;
}

@end
