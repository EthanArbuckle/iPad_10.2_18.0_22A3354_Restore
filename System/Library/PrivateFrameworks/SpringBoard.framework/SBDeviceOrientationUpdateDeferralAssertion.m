@implementation SBDeviceOrientationUpdateDeferralAssertion

- (void)invalidate
{
  id WeakRetained;
  void *v5;
  id v6;

  self->_invalidated = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hackyBackReference);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceOrientationUpdateManager.m"), 228, CFSTR("Invalidating an assert without a back-reference"));

    WeakRetained = 0;
  }
  objc_msgSend(WeakRetained, "_endDeferringOrientationUpdatesForAssertion:", self);

}

- (NSString)reason
{
  return self->_reason;
}

- (SBDeviceOrientationUpdateDeferralAssertion)initWithReason:(id)a3
{
  id v5;
  SBDeviceOrientationUpdateDeferralAssertion *v6;
  uint64_t v7;
  NSString *reason;
  void *v10;
  objc_super v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeviceOrientationUpdateManager.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBDeviceOrientationUpdateDeferralAssertion;
  v6 = -[SBDeviceOrientationUpdateDeferralAssertion init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    reason = v6->_reason;
    v6->_reason = (NSString *)v7;

  }
  return v6;
}

- (void)_setHackyBackReference:(id)a3
{
  objc_storeWeak((id *)&self->_hackyBackReference, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hackyBackReference);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
      NSLog(CFSTR("You should always invalidate this before deallocating it"));
    if (!self->_invalidated)
      -[SBDeviceOrientationUpdateDeferralAssertion invalidate](self, "invalidate");
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDeviceOrientationUpdateDeferralAssertion;
  -[SBDeviceOrientationUpdateDeferralAssertion dealloc](&v5, sel_dealloc);
}

- (SBDeviceOrientationUpdateDeferralAssertion)init
{

  return 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p reason='%@'>"), objc_opt_class(), self, self->_reason);
}

- (SBDeviceOrientationUpdateManager)hackyBackReference
{
  return (SBDeviceOrientationUpdateManager *)objc_loadWeakRetained((id *)&self->_hackyBackReference);
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

@end
