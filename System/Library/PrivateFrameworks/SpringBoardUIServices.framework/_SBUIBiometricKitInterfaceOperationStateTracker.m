@implementation _SBUIBiometricKitInterfaceOperationStateTracker

- (_SBUIBiometricKitInterfaceOperationStateTracker)init
{
  return -[_SBUIBiometricKitInterfaceOperationStateTracker initWithState:](self, "initWithState:", 0);
}

- (_SBUIBiometricKitInterfaceOperationStateTracker)initWithState:(int64_t)a3
{
  _SBUIBiometricKitInterfaceOperationStateTracker *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBUIBiometricKitInterfaceOperationStateTracker;
  result = -[_SBUIBiometricKitInterfaceOperationStateTracker init](&v5, sel_init);
  if (result)
    result->_state = a3;
  return result;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end
