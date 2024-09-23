@implementation RTLockAssertion

- (RTLockAssertion)init
{
  RTLockAssertion *v2;
  NSObject *v3;
  void *v4;
  RTLockAssertion *v5;
  objc_super v7;
  uint8_t buf[4];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)RTLockAssertion;
  v2 = -[RTLockAssertion init](&v7, sel_init);
  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "acquiring lock assertion", buf, 2u);
    }

    v9 = CFSTR("MKBAssertionKey");
    v10[0] = CFSTR("SBTransient");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_lockAssertion = (__MKBAssertion *)MKBDeviceLockAssertion();

  }
  v5 = v2;

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (self->_lockAssertion)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "releasing lock assertion", buf, 2u);
    }

    CFRelease(self->_lockAssertion);
    self->_lockAssertion = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RTLockAssertion;
  -[RTLockAssertion dealloc](&v4, sel_dealloc);
}

@end
