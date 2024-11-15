@implementation _SBStatusBarChanges

- (BOOL)statusBarStyleChanged
{
  return self->_statusBarStyleChanged;
}

- (BOOL)statusBarPartStyleChanged
{
  return self->_statusBarPartStyleChanged;
}

- (void)invalidate
{
  NSString *statusBarPartIdentifier;

  *(_WORD *)&self->_statusBarStyleChanged = 0;
  self->_statusBarStyle = 0;
  self->_statusBarPartStyle = 0;
  statusBarPartIdentifier = self->_statusBarPartIdentifier;
  self->_statusBarPartIdentifier = 0;

}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (int64_t)statusBarPartStyle
{
  return self->_statusBarPartStyle;
}

- (NSString)statusBarPartIdentifier
{
  return self->_statusBarPartIdentifier;
}

- (void)setStatusBarPartStyle:(int64_t)a3 forPartWithIdentifier:(id)a4
{
  self->_statusBarPartStyleChanged = 1;
  self->_statusBarPartStyle = a3;
  objc_storeStrong((id *)&self->_statusBarPartIdentifier, a4);
}

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyleChanged = 1;
  self->_statusBarStyle = a3;
}

- (void)setStatusBarStyleChanged:(BOOL)a3
{
  self->_statusBarStyleChanged = a3;
}

- (void)setStatusBarPartStyleChanged:(BOOL)a3
{
  self->_statusBarPartStyleChanged = a3;
}

- (void)setStatusBarPartStyle:(int64_t)a3
{
  self->_statusBarPartStyle = a3;
}

- (void)setStatusBarPartIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarPartIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarPartIdentifier, 0);
}

@end
