@implementation PKAuthenticatorEvaluationRequest

- (PKAuthenticatorEvaluationRequest)init
{
  return -[PKAuthenticatorEvaluationRequest initWithPolicy:](self, "initWithPolicy:", 0);
}

- (PKAuthenticatorEvaluationRequest)initWithPolicy:(int64_t)a3
{
  PKAuthenticatorEvaluationRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAuthenticatorEvaluationRequest;
  result = -[PKAuthenticatorEvaluationRequest init](&v5, sel_init);
  if (result)
  {
    result->_policy = a3;
    result->_maxBiometryFailures = *MEMORY[0x24BE6F1A8];
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAuthenticatorEvaluationRequest;
  -[PKAuthenticatorEvaluationRequest dealloc](&v2, sel_dealloc);
}

- (void)setInitialAuthenticatorState:(unint64_t)a3
{
  self->_initialAuthenticatorState = a3;
  self->_hasInitialAuthenticatorState = 1;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)PINTitle
{
  return self->_PINTitle;
}

- (void)setPINTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)PINLength
{
  return self->_PINLength;
}

- (void)setPINLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
  objc_storeStrong((id *)&self->_externalizedContext, a3);
}

- (__SecAccessControl)accessControlRef
{
  return self->_accessControlRef;
}

- (void)setAccessControlRef:(__SecAccessControl *)a3
{
  self->_accessControlRef = a3;
}

- (BOOL)useStockAuthInterface
{
  return self->_useStockAuthInterface;
}

- (void)setUseStockAuthInterface:(BOOL)a3
{
  self->_useStockAuthInterface = a3;
}

- (NSString)physicalButtonTitle
{
  return self->_physicalButtonTitle;
}

- (void)setPhysicalButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)passcodeTitle
{
  return self->_passcodeTitle;
}

- (void)setPasscodeTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)fallbackOptionTitle
{
  return self->_fallbackOptionTitle;
}

- (void)setFallbackOptionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)hasInitialAuthenticatorState
{
  return self->_hasInitialAuthenticatorState;
}

- (void)setHasInitialAuthenticatorState:(BOOL)a3
{
  self->_hasInitialAuthenticatorState = a3;
}

- (unint64_t)initialAuthenticatorState
{
  return self->_initialAuthenticatorState;
}

- (BOOL)assumeUserIntentAvailable
{
  return self->_assumeUserIntentAvailable;
}

- (void)setAssumeUserIntentAvailable:(BOOL)a3
{
  self->_assumeUserIntentAvailable = a3;
}

- (BOOL)assumeBiometricOrPasscodeAvailable
{
  return self->_assumeBiometricOrPasscodeAvailable;
}

- (void)setAssumeBiometricOrPasscodeAvailable:(BOOL)a3
{
  self->_assumeBiometricOrPasscodeAvailable = a3;
}

- (BOOL)passcodeOnly
{
  return self->_passcodeOnly;
}

- (void)setPasscodeOnly:(BOOL)a3
{
  self->_passcodeOnly = a3;
}

- (unint64_t)maxBiometryFailures
{
  return self->_maxBiometryFailures;
}

- (void)setMaxBiometryFailures:(unint64_t)a3
{
  self->_maxBiometryFailures = a3;
}

- (BOOL)useLegacyAuthenticator
{
  return self->_useLegacyAuthenticator;
}

- (void)setUseLegacyAuthenticator:(BOOL)a3
{
  self->_useLegacyAuthenticator = a3;
}

- (BOOL)useLocationBasedAuthorization
{
  return self->_useLocationBasedAuthorization;
}

- (void)setUseLocationBasedAuthorization:(BOOL)a3
{
  self->_useLocationBasedAuthorization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackOptionTitle, 0);
  objc_storeStrong((id *)&self->_passcodeTitle, 0);
  objc_storeStrong((id *)&self->_physicalButtonTitle, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
  objc_storeStrong((id *)&self->_PINLength, 0);
  objc_storeStrong((id *)&self->_PINTitle, 0);
  objc_storeStrong((id *)&self->_processIdentifier, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
