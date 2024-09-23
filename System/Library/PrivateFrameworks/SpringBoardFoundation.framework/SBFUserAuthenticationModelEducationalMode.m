@implementation SBFUserAuthenticationModelEducationalMode

- (SBFUserAuthenticationModelEducationalMode)initWithKeyBag:(id)a3
{
  id v4;
  SBFUserAuthenticationModelEducationalMode *v5;
  SBFMobileKeyBag *v6;
  SBFMobileKeyBag *keybag;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFUserAuthenticationModelEducationalMode;
  v5 = -[SBFUserAuthenticationModelEducationalMode init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (SBFMobileKeyBag *)v4;
    }
    else
    {
      +[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance");
      v6 = (SBFMobileKeyBag *)objc_claimAutoreleasedReturnValue();
    }
    keybag = v5->_keybag;
    v5->_keybag = v6;

    v8 = -[SBFUserAuthenticationModelEducationalMode _refreshStateAndNotify:](v5, "_refreshStateAndNotify:", 1);
  }

  return v5;
}

- (BOOL)isTemporarilyBlocked
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  -[SBFUserAuthenticationModelEducationalMode timeUntilUnblockedSinceReferenceDate](self, "timeUntilUnblockedSinceReferenceDate");
  return v4 < v5;
}

- (BOOL)isPermanentlyBlocked
{
  void *v3;
  char v4;

  if (self->_pendingWipe)
    return 1;
  -[SBFUserAuthenticationModelEducationalMode _refreshStateAndNotify:](self, "_refreshStateAndNotify:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "permanentlyBlocked");

  return v4;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[SBFUserAuthenticationModelEducationalMode _refreshStateAndNotify:](self, "_refreshStateAndNotify:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backOffTime");
  if (v3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v6 = v8;

  }
  else
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v6 = v4 + v5;
  }

  return v6;
}

- (BOOL)isUserRequestedEraseEnabled
{
  return 0;
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

- (void)synchronize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "synchronize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)notePasscodeEntryBegan
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "passcodeEntryBegan", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)notePasscodeEntryCancelled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "passcodeEntryCancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)notePasscodeUnlockSucceeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "passcodeUnlockSucceeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
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
  id v14;

  v4 = a3;
  SBLogAuthenticationModel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockFailedWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_msgSend(v4, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.springboardfoundation.mkb")))
  {
    v13 = objc_msgSend(v4, "code");

    if (v13 == -14)
      v14 = -[SBFUserAuthenticationModelEducationalMode _refreshStateAndNotify:](self, "_refreshStateAndNotify:", 1);
  }
  else
  {

  }
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

  -[SBFUserAuthenticationModelEducationalMode _refreshStateForMkbState:notify:](self, "_refreshStateForMkbState:notify:", v4, 1);
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

- (id)_refreshStateAndNotify:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[SBFMobileKeyBag state](self->_keybag, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFUserAuthenticationModelEducationalMode _refreshStateForMkbState:notify:](self, "_refreshStateForMkbState:notify:", v5, v3);
  return v5;
}

- (void)_refreshStateForMkbState:(id)a3 notify:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  if (objc_msgSend(a3, "shouldWipe"))
  {
    self->_pendingWipe = 1;
  }
  else if (!self->_pendingWipe)
  {
    goto LABEL_5;
  }
  -[SBFUserAuthenticationModelDelegate deviceLockModelRequestsDeviceWipe:](self->_delegate, "deviceLockModelRequestsDeviceWipe:", self);
LABEL_5:
  if (v4)
    -[SBFUserAuthenticationModelDelegate deviceLockStateMayHaveChangedForModel:](self->_delegate, "deviceLockStateMayHaveChangedForModel:", self);
}

- (SBFUserAuthenticationModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
}

- (void)notePasscodeUnlockFailedWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a2, a3, "passcodeUnlockFailed with error: %@", a5, a6, a7, a8, 2u);
}

- (void)noteNewMkbDeviceLockState:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_18AB69000, a2, a3, "noteNewMkbDeviceLockState: %@", a5, a6, a7, a8, 2u);
}

- (void)performPasswordTest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "performPasscodeTest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
