@implementation ATLHardwareCapabilities

- (BOOL)supportsTypeAExpress
{
  return self->_supportsTypeAExpress;
}

- (void)setSupportsTypeAExpress:(BOOL)a3
{
  self->_supportsTypeAExpress = a3;
}

- (BOOL)supportsQuickModeToGenericAFallback
{
  return self->_supportsQuickModeToGenericAFallback;
}

- (void)setSupportsQuickModeToGenericAFallback:(BOOL)a3
{
  self->_supportsQuickModeToGenericAFallback = a3;
}

@end
