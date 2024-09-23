@implementation SBDisableSystemGestureAssertion

- (NSSet)exceptions
{
  return self->_exceptions;
}

- (void)setExceptions:(id)a3
{
  objc_storeStrong((id *)&self->_exceptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptions, 0);
}

@end
