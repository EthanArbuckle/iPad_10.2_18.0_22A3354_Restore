@implementation PLPowerAssertion

+ (void)performNoTimeoutPowerAssertionTaskWithName:(id)a3 humanReadableReason:(id)a4 block:(id)a5
{
  void (**v8)(_QWORD);
  uint64_t v9;

  v8 = (void (**)(_QWORD))a5;
  v9 = objc_msgSend(a1, "takePowerAssertionWithName:humanReadableReason:timeout:timeoutAction:", a3, a4, CFSTR("TimeoutActionLog"), 0.0);
  v8[2](v8);

  objc_msgSend(a1, "removePowerAssertionForAssertionID:", v9);
}

+ (void)performPowerAssertionTaskWithName:(id)a3 humanReadableReason:(id)a4 timeout:(double)a5 timeoutAction:(__CFString *)a6 block:(id)a7
{
  void (**v12)(_QWORD);
  uint64_t v13;

  v12 = (void (**)(_QWORD))a7;
  v13 = objc_msgSend(a1, "takePowerAssertionWithName:humanReadableReason:timeout:timeoutAction:", a3, a4, a6, a5);
  v12[2](v12);

  objc_msgSend(a1, "removePowerAssertionForAssertionID:", v13);
}

+ (unsigned)takePowerAssertionWithName:(id)a3 humanReadableReason:(id)a4 timeout:(double)a5 timeoutAction:(__CFString *)a6
{
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  IOReturn v15;
  NSObject *v16;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  AssertionID = 0;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a3;
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_INFO, "%{public}@ taking power assertion: +🔌", buf, 0xCu);

  }
  v14 = PLBundleIdentifier();
  v15 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), v10, v14, v9, 0, a5, a6, &AssertionID);

  if (v15)
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v15;
      _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "Failed to create power assertion for migration. Result code: %d", buf, 8u);
    }

  }
  return AssertionID;
}

+ (void)removePowerAssertionForAssertionID:(unsigned int)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  IOReturn v7;
  IOReturn v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_199DF7000, v4, OS_LOG_TYPE_INFO, "%{public}@ Removing power assertion: -🔌", (uint8_t *)&v10, 0xCu);

    }
    v7 = IOPMAssertionRelease(a3);
    if (v7)
    {
      v8 = v7;
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 67109120;
        LODWORD(v11) = v8;
        _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Failed to release power assertion for migration. Result code: %d", (uint8_t *)&v10, 8u);
      }

    }
  }
}

@end
