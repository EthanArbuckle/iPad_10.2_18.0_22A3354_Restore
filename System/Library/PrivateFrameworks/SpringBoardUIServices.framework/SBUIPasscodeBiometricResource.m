@implementation SBUIPasscodeBiometricResource

- (SBUIPasscodeBiometricResource)initWithBiometricResource:(id)a3 overrideMatchingAssertionFactory:(id)a4
{
  id v7;
  id v8;
  SBUIPasscodeBiometricResource *v9;
  SBUIPasscodeBiometricResource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIPasscodeBiometricResource;
  v9 = -[SBUIPasscodeBiometricResource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometricResource, a3);
    objc_storeStrong((id *)&v10->_overrideMatchingAssertionFactory, a4);
  }

  return v10;
}

- (BOOL)hasEnrolledIdentities
{
  return -[SBUIBiometricResource hasEnrolledIdentities](self->_biometricResource, "hasEnrolledIdentities");
}

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  return -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled");
}

- (BOOL)isFingerOn
{
  return -[SBUIBiometricResource isFingerOn](self->_biometricResource, "isFingerOn");
}

- (BOOL)isFingerDetectEnabled
{
  return -[SBUIBiometricResource isFingerDetectEnabled](self->_biometricResource, "isFingerDetectEnabled");
}

- (BOOL)hasMesaSupport
{
  return -[SBUIBiometricResource hasMesaSupport](self->_biometricResource, "hasMesaSupport");
}

- (BOOL)hasPoseidonSupport
{
  return -[SBUIBiometricResource hasPoseidonSupport](self->_biometricResource, "hasPoseidonSupport");
}

- (BOOL)hasPearlSupport
{
  return -[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport");
}

- (BOOL)isPearlDetectEnabled
{
  return -[SBUIBiometricResource isPearlDetectEnabled](self->_biometricResource, "isPearlDetectEnabled");
}

- (BOOL)isMatchingAllowed
{
  return -[SBUIBiometricResource isMatchingAllowed](self->_biometricResource, "isMatchingAllowed");
}

- (BOOL)isMatchingEnabled
{
  return -[SBUIBiometricResource isMatchingEnabled](self->_biometricResource, "isMatchingEnabled");
}

- (unint64_t)biometricLockoutState
{
  return -[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState");
}

- (BOOL)isPeriocularMatchingEnabled
{
  return -[SBUIBiometricResource isPeriocularMatchingEnabled](self->_biometricResource, "isPeriocularMatchingEnabled");
}

- (void)addObserver:(id)a3
{
  -[SBUIBiometricResource addObserver:](self->_biometricResource, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[SBUIBiometricResource removeObserver:](self->_biometricResource, "removeObserver:", a3);
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3
{
  return -[SBUIBiometricResource acquireFingerDetectionWantedAssertionForReason:](self->_biometricResource, "acquireFingerDetectionWantedAssertionForReason:", a3);
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3 HIDEventsOnly:(BOOL)a4
{
  return -[SBUIBiometricResource acquireFingerDetectionWantedAssertionForReason:HIDEventsOnly:](self->_biometricResource, "acquireFingerDetectionWantedAssertionForReason:HIDEventsOnly:", a3, a4);
}

- (id)acquireFaceDetectionWantedAssertionForReason:(id)a3
{
  return -[SBUIBiometricResource acquireFaceDetectionWantedAssertionForReason:](self->_biometricResource, "acquireFaceDetectionWantedAssertionForReason:", a3);
}

- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4
{
  void *overrideMatchingAssertionFactory;

  overrideMatchingAssertionFactory = self->_overrideMatchingAssertionFactory;
  if (!overrideMatchingAssertionFactory)
    overrideMatchingAssertionFactory = self->_biometricResource;
  objc_msgSend(overrideMatchingAssertionFactory, "acquireMatchingAssertionWithMode:reason:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)acquireSimulatedLockoutAssertionWithLockoutState:(unint64_t)a3 forReason:(id)a4
{
  return -[SBUIBiometricResource acquireSimulatedLockoutAssertionWithLockoutState:forReason:](self->_biometricResource, "acquireSimulatedLockoutAssertionWithLockoutState:forReason:", a3, a4);
}

- (void)refreshMatchMode
{
  -[SBUIBiometricResource refreshMatchMode](self->_biometricResource, "refreshMatchMode");
}

- (void)resumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4
{
  -[SBUIBiometricResource resumeMatchingForAssertion:advisory:](self->_biometricResource, "resumeMatchingForAssertion:advisory:", a3, a4);
}

- (void)resumeMatchingAdvisory:(BOOL)a3
{
  -[SBUIBiometricResource resumeMatchingAdvisory:](self->_biometricResource, "resumeMatchingAdvisory:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMatchingAssertionFactory, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

@end
