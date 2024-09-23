@implementation _UIStatusBarStateStackInfo

- (int64_t)statusBarOrientationWithoutHost
{
  return self->_statusBarOrientationWithoutHost;
}

- (void)setStatusBarOrientationWithoutHost:(int64_t)a3
{
  self->_statusBarOrientationWithoutHost = a3;
}

- (double)statusBarHeightWithoutHost
{
  return self->_statusBarHeightWithoutHost;
}

- (void)setStatusBarHeightWithoutHost:(double)a3
{
  self->_statusBarHeightWithoutHost = a3;
}

- (int)hostPID
{
  return self->_hostPID;
}

- (void)setHostPID:(int)a3
{
  self->_hostPID = a3;
}

@end
