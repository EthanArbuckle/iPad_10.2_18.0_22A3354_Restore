@implementation SBFUserAuthenticationModelSEP

- (BOOL)isTemporarilyBlocked
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[SBFUserAuthenticationModelSEP timeUntilUnblockedSinceReferenceDate](self, "timeUntilUnblockedSinceReferenceDate");
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  return self->_unblockTime;
}

- (BOOL)isPermanentlyBlocked
{
  return self->_permanentlyBlocked;
}

- (id)_initWithKeyBag:(id)a3 profileConnection:(id)a4
{
  id v6;
  id v7;
  SBFUserAuthenticationModelSEP *v8;
  SBFUserAuthenticationModelSEP *v9;
  SBFMobileKeyBag *v10;
  SBFMobileKeyBag *keybag;
  SBSecurityDefaults *v12;
  SBSecurityDefaults *securityDefaults;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBFUserAuthenticationModelSEP;
  v8 = -[SBFUserAuthenticationModelSEP init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_profileConnection, a4);
    if (v6)
    {
      v10 = (SBFMobileKeyBag *)v6;
    }
    else
    {
      +[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance");
      v10 = (SBFMobileKeyBag *)objc_claimAutoreleasedReturnValue();
    }
    keybag = v9->_keybag;
    v9->_keybag = v10;

    v12 = objc_alloc_init(SBSecurityDefaults);
    securityDefaults = v9->_securityDefaults;
    v9->_securityDefaults = v12;

    -[SBFUserAuthenticationModelSEP _refreshStateAndNotify:](v9, "_refreshStateAndNotify:", 1);
  }

  return v9;
}

- (SBFUserAuthenticationModelSEP)initWithKeyBag:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBFUserAuthenticationModelSEP *v7;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBFUserAuthenticationModelSEP _initWithKeyBag:profileConnection:](self, "_initWithKeyBag:profileConnection:", v5, v6);

  return v7;
}

- (void)synchronize
{
  NSObject *v2;

  SBLogAuthenticationModel();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode synchronize].cold.1();

}

- (void)notePasscodeEntryBegan
{
  NSObject *v2;

  SBLogAuthenticationModel();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryBegan].cold.1();

  MKBPrewarmSPS();
}

- (void)notePasscodeEntryCancelled
{
  NSObject *v2;

  SBLogAuthenticationModel();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryCancelled].cold.1();

}

- (void)notePasscodeUnlockSucceeded
{
  NSObject *v3;

  SBLogAuthenticationModel();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockSucceeded].cold.1();

  -[SBFUserAuthenticationModelSEP _refreshStateForMkbState:notify:](self, "_refreshStateForMkbState:notify:", 0, 1);
}

- (void)notePasscodeUnlockFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  SBLogAuthenticationModel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockFailedWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(v4, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.springboardfoundation.mkb")))
  {
    if (objc_msgSend(v4, "code") == -14)
    {

LABEL_8:
      -[SBFUserAuthenticationModelSEP _refreshStateAndNotify:](self, "_refreshStateAndNotify:", 1);
      goto LABEL_9;
    }
    v13 = objc_msgSend(v4, "code");

    if (v13 == -13)
      goto LABEL_8;
  }
  else
  {

  }
LABEL_9:

}

- (void)performPasswordTest:(id)a3
{
  void (**v3)(id, _BYTE *);
  NSObject *v4;
  char v5;

  v3 = (void (**)(id, _BYTE *))a3;
  SBLogAuthenticationModel();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode performPasswordTest:].cold.1();

  v5 = 0;
  v3[2](v3, &v5);

}

- (void)clearBlockedState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "clearBlockedState", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)refreshBlockedState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "refreshBlockedState", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)noteNewMkbDeviceLockState:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  SBLogAuthenticationModel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode noteNewMkbDeviceLockState:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[SBFUserAuthenticationModelSEP _refreshStateForMkbState:notify:](self, "_refreshStateForMkbState:notify:", v4, 1);
}

- (BOOL)isUserRequestedEraseEnabled
{
  return self->_userRequestedEraseEnabled;
}

- (void)setDelegate:(id)a3
{
  SBFUserAuthenticationModelDelegate *v4;
  SBFUserAuthenticationModelDelegate *v5;

  v4 = (SBFUserAuthenticationModelDelegate *)a3;
  if (self->_delegate != v4)
  {
    self->_delegate = v4;
    if (self->_pendingWipe)
    {
      v5 = v4;
      -[SBFUserAuthenticationModelDelegate deviceLockModelRequestsDeviceWipe:](v4, "deviceLockModelRequestsDeviceWipe:", self);
      v4 = v5;
    }
  }

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[SBFUserAuthenticationModelSEP descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)descriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_unblockTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("unblockTime"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_permanentlyBlocked, CFSTR("permanentlyBlocked"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_pendingWipe, CFSTR("pendingWipe"));
  return v3;
}

- (void)_refreshStateAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SBFMobileKeyBag state](self->_keybag, "state");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFUserAuthenticationModelSEP _refreshStateForMkbState:notify:](self, "_refreshStateForMkbState:notify:", v5, v3);

}

- (BOOL)_isDeviceWipePreferenceEnabled
{
  return -[SBSecurityDefaults isDeviceWipeEnabled](self->_securityDefaults, "isDeviceWipeEnabled");
}

- (void)_refreshStateForMkbState:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;
  SBFUserAuthenticationModelSEP *v6;
  NSObject *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  int v16;
  void *v17;
  BOOL v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  int v25;
  SBFUserAuthenticationModelSEP *v26;
  __int16 v27;
  SBFUserAuthenticationModelSEP *v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = (SBFUserAuthenticationModelSEP *)a3;
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v25 = 138543618;
    v26 = v6;
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_INFO, "Refreshing state from MKB state %{public}@. Current state = %@", (uint8_t *)&v25, 0x16u);
  }

  v8 = -[SBFUserAuthenticationModelSEP failedAttemptCount](v6, "failedAttemptCount");
  if (v8 < 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  v9 = v8;
  v10 = -[SBFMobileKeyBag maxUnlockAttempts](self->_keybag, "maxUnlockAttempts");
  v11 = -[MCProfileConnection effectiveBoolValueForSetting:](self->_profileConnection, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FE8]);
  v12 = v11 != 2;
  if (v9 < v10)
  {
    v13 = 0;
    v14 = 0;
LABEL_14:
    v15 = v12;
    goto LABEL_15;
  }
  v16 = v11;
  -[MCProfileConnection valueRestrictionForFeature:](self->_profileConnection, "valueRestrictionForFeature:", *MEMORY[0x1E0D470B8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == 2)
  {
    if (v17)
    {
      v14 = 0;
      v15 = 0;
      v13 = 1;
      goto LABEL_15;
    }
LABEL_13:
    v13 = 0;
    v14 = 1;
    goto LABEL_14;
  }
  v18 = -[SBFUserAuthenticationModelSEP _isDeviceWipePreferenceEnabled](self, "_isDeviceWipePreferenceEnabled");
  v14 = 0;
  v13 = 1;
  v15 = 1;
  if (!v18 && !v17)
    goto LABEL_13;
LABEL_15:
  self->_pendingWipe = v13;
  self->_permanentlyBlocked = v14;
  self->_userRequestedEraseEnabled = v15;
  -[SBFUserAuthenticationModelSEP backOffTime](v6, "backOffTime");
  if (v14 || (v20 = v19, v19 <= 0.0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    v23 = v20 + v22;
  }
  self->_unblockTime = v23;

  if (self->_pendingWipe)
    -[SBFUserAuthenticationModelDelegate deviceLockModelRequestsDeviceWipe:](self->_delegate, "deviceLockModelRequestsDeviceWipe:", self);
  if (v4)
    -[SBFUserAuthenticationModelDelegate deviceLockStateMayHaveChangedForModel:](self->_delegate, "deviceLockStateMayHaveChangedForModel:", self);
  SBLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_18AB69000, v24, OS_LOG_TYPE_INFO, "New MKB state = %@", (uint8_t *)&v25, 0xCu);
  }

}

- (SBFUserAuthenticationModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_securityDefaults, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end
