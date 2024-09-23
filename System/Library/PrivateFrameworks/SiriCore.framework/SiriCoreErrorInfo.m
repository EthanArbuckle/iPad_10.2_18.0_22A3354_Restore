@implementation SiriCoreErrorInfo

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)isPeerConnectionError
{
  return self->_isPeerConnectionError;
}

- (void)setIsPeerConnectionError:(BOOL)a3
{
  self->_isPeerConnectionError = a3;
}

- (BOOL)isPeerNotNearbyError
{
  return self->_isPeerNotNearbyError;
}

- (void)setIsPeerNotNearbyError:(BOOL)a3
{
  self->_isPeerNotNearbyError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
