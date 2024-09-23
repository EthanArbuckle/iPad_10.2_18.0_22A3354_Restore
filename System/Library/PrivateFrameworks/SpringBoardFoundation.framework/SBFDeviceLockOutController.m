@implementation SBFDeviceLockOutController

- (BOOL)isLockedOut
{
  if (-[SBFDeviceLockOutController isBlocked](self, "isBlocked"))
    return 1;
  else
    return !-[SBFUserAuthenticationController isAuthenticated](self->_authenticationController, "isAuthenticated");
}

- (BOOL)isBlocked
{
  return -[SBFDeviceLockOutController deviceBlockStatus](self, "deviceBlockStatus") != 0;
}

- (unint64_t)deviceBlockStatus
{
  unint64_t v3;

  v3 = -[SBFDeviceLockOutController isPermanentlyBlocked](self, "isPermanentlyBlocked");
  if (-[SBFDeviceLockOutController isTemporarilyBlocked](self, "isTemporarilyBlocked"))
    v3 |= 2uLL;
  if (-[SBFDeviceLockOutController isThermallyBlocked](self, "isThermallyBlocked"))
    v3 |= 4uLL;
  if (-[SBFDeviceLockOutController isLiquidDetectionCriticalUIBlocked](self, "isLiquidDetectionCriticalUIBlocked"))
    return v3 | 8;
  else
    return v3;
}

- (BOOL)isThermallyBlocked
{
  return -[SBFThermalBlockProvider isThermalBlocked](self->_thermalProvider, "isThermalBlocked");
}

- (BOOL)isTemporarilyBlocked
{
  return -[SBFUserAuthenticationController _isTemporarilyBlocked](self->_authenticationController, "_isTemporarilyBlocked");
}

- (BOOL)isPermanentlyBlocked
{
  return -[SBFUserAuthenticationController _isPermanentlyBlocked](self->_authenticationController, "_isPermanentlyBlocked");
}

- (BOOL)isLiquidDetectionCriticalUIBlocked
{
  return -[SBFLiquidDetectionBlockProvider isLiquidDetectionBlocked](self->_liquidDetectionBlockProvider, "isLiquidDetectionBlocked");
}

- (SBFDeviceLockOutController)initWithThermalController:(id)a3 authenticationController:(id)a4
{
  id v7;
  id v8;
  SBFDeviceLockOutController *v9;
  SBFDeviceLockOutController *v10;
  SBFThermalBlockProvider *thermalProvider;
  SBFLiquidDetectionBlockProvider *liquidDetectionBlockProvider;
  SBFProximityReaderBlockProvider *proximityReaderBlockProvider;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBFDeviceLockOutController;
  v9 = -[SBFDeviceLockOutController init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_thermalProvider, a3);
    thermalProvider = v10->_thermalProvider;
    if (thermalProvider)
      -[SBFThermalBlockProvider addThermalObserver:](thermalProvider, "addThermalObserver:", v10);
    objc_storeStrong((id *)&v10->_authenticationController, a4);
    -[SBFUserAuthenticationController _addPrivateAuthenticationObserver:](v10->_authenticationController, "_addPrivateAuthenticationObserver:", v10);
    liquidDetectionBlockProvider = v10->_liquidDetectionBlockProvider;
    v10->_liquidDetectionBlockProvider = 0;

    proximityReaderBlockProvider = v10->_proximityReaderBlockProvider;
    v10->_proximityReaderBlockProvider = 0;

    v10->_lastBlockedStatus = 0;
    -[SBFDeviceLockOutController _noteLockedOutStateMayHaveChanged:](v10, "_noteLockedOutStateMayHaveChanged:", 1);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBFThermalBlockProvider removeThermalObserver:](self->_thermalProvider, "removeThermalObserver:", self);
  -[SBFLiquidDetectionBlockProvider removeLiquidDetectionObserver:](self->_liquidDetectionBlockProvider, "removeLiquidDetectionObserver:", self);
  -[SBFProximityReaderBlockProvider removeProximityReaderObserver:](self->_proximityReaderBlockProvider, "removeProximityReaderObserver:", self);
  -[SBFUserAuthenticationController _removePrivateAuthenticationObserver:](self->_authenticationController, "_removePrivateAuthenticationObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFDeviceLockOutController;
  -[SBFDeviceLockOutController dealloc](&v4, sel_dealloc);
}

- (void)setLiquidDetectionBlockProvider:(id)a3
{
  SBFLiquidDetectionBlockProvider *v5;
  SBFLiquidDetectionBlockProvider *liquidDetectionBlockProvider;
  SBFLiquidDetectionBlockProvider *v7;

  v5 = (SBFLiquidDetectionBlockProvider *)a3;
  liquidDetectionBlockProvider = self->_liquidDetectionBlockProvider;
  if (liquidDetectionBlockProvider != v5)
  {
    v7 = v5;
    if (liquidDetectionBlockProvider)
      -[SBFLiquidDetectionBlockProvider removeLiquidDetectionObserver:](liquidDetectionBlockProvider, "removeLiquidDetectionObserver:", self);
    objc_storeStrong((id *)&self->_liquidDetectionBlockProvider, a3);
    -[SBFLiquidDetectionBlockProvider addLiquidDetectionObserver:](self->_liquidDetectionBlockProvider, "addLiquidDetectionObserver:", self);
    v5 = v7;
  }

}

- (void)setProximityReaderBlockProvider:(id)a3
{
  SBFProximityReaderBlockProvider *v5;
  SBFProximityReaderBlockProvider *proximityReaderBlockProvider;
  SBFProximityReaderBlockProvider *v7;

  v5 = (SBFProximityReaderBlockProvider *)a3;
  proximityReaderBlockProvider = self->_proximityReaderBlockProvider;
  if (proximityReaderBlockProvider != v5)
  {
    v7 = v5;
    if (proximityReaderBlockProvider)
      -[SBFProximityReaderBlockProvider removeProximityReaderObserver:](proximityReaderBlockProvider, "removeProximityReaderObserver:", self);
    objc_storeStrong((id *)&self->_proximityReaderBlockProvider, a3);
    -[SBFProximityReaderBlockProvider addProximityReaderObserver:](self->_proximityReaderBlockProvider, "addProximityReaderObserver:", self);
    v5 = v7;
  }

}

- (NSString)description
{
  return (NSString *)-[SBFDeviceLockOutController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFDeviceLockOutController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFDeviceLockOutController isLockedOut](self, "isLockedOut"), CFSTR("lockedOut"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isBlocked](self, "isBlocked"), CFSTR("blocked"), 1);
  v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isPermanentlyBlocked](self, "isPermanentlyBlocked"), CFSTR("permanentlyBlocked"), 1);
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isTemporarilyBlocked](self, "isTemporarilyBlocked"), CFSTR("temporarilyBlocked"), 1);
  v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBFDeviceLockOutController isThermallyBlocked](self, "isThermallyBlocked"), CFSTR("thermallyBlocked"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFDeviceLockOutController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBFDeviceLockOutController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_thermalProvider, CFSTR("thermalProvider"));
  return v4;
}

- (BOOL)isProximityReaderBlocked
{
  return -[SBFProximityReaderBlockProvider isProximityReaderBlocked](self->_proximityReaderBlockProvider, "isProximityReaderBlocked");
}

- (BOOL)isUserRequestedEraseEnabled
{
  return -[SBFUserAuthenticationController _isUserRequestedEraseEnabled](self->_authenticationController, "_isUserRequestedEraseEnabled");
}

- (double)timeIntervalUntilUnblockedSinceReferenceDate
{
  double v2;
  double v3;
  double v4;
  void *v5;
  double v6;

  -[SBFUserAuthenticationController _timeUntilUnblockedSinceReferenceDate](self->_authenticationController, "_timeUntilUnblockedSinceReferenceDate");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  if (v3 < v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v3 = v6;

  }
  return v3;
}

- (void)_noteLockedOutStateMayHaveChanged:(BOOL)a3
{
  _BOOL4 lockedOutCached;
  unint64_t v6;
  int v7;

  lockedOutCached = -[SBFDeviceLockOutController isLockedOut](self, "isLockedOut");
  v6 = -[SBFDeviceLockOutController deviceBlockStatus](self, "deviceBlockStatus");
  if (a3 || self->_lockedOutCached != lockedOutCached || v6 != self->_lastBlockedStatus)
  {
    self->_lockedOutCached = lockedOutCached;
    self->_lastBlockedStatus = v6;
    v7 = _noteLockedOutStateMayHaveChanged__token;
    if (_noteLockedOutStateMayHaveChanged__token == -1)
    {
      notify_register_check("com.apple.springboard.passcodeLockedOrBlocked", &_noteLockedOutStateMayHaveChanged__token);
      v7 = _noteLockedOutStateMayHaveChanged__token;
      if (_noteLockedOutStateMayHaveChanged__token == -1)
        return;
      lockedOutCached = self->_lockedOutCached;
    }
    notify_set_state(v7, lockedOutCached);
    notify_post("com.apple.springboard.passcodeLockedOrBlocked");
  }
}

- (void)_noteLockedOutReasonsMayHaveChanged
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBFDeviceBlockStateDidChangeNotification"), 0);

  -[SBFDeviceLockOutController _noteLockedOutStateMayHaveChanged:](self, "_noteLockedOutStateMayHaveChanged:", 0);
}

- (SBFLiquidDetectionBlockProvider)liquidDetectionBlockProvider
{
  return self->_liquidDetectionBlockProvider;
}

- (SBFProximityReaderBlockProvider)proximityReaderBlockProvider
{
  return self->_proximityReaderBlockProvider;
}

- (SBFUserAuthenticationController)_authenticationController
{
  return self->_authenticationController;
}

- (void)_setAuthenticationController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationController, a3);
}

- (SBFThermalBlockProvider)_thermalProvider
{
  return self->_thermalProvider;
}

- (void)_setThermalProvider:(id)a3
{
  objc_storeStrong((id *)&self->_thermalProvider, a3);
}

- (BOOL)_isLockedOutCached
{
  return self->_lockedOutCached;
}

- (void)_setLockedOutCached:(BOOL)a3
{
  self->_lockedOutCached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_proximityReaderBlockProvider, 0);
  objc_storeStrong((id *)&self->_liquidDetectionBlockProvider, 0);
  objc_storeStrong((id *)&self->_thermalProvider, 0);
}

@end
