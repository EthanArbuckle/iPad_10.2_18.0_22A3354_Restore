@implementation SBDeviceOrientationUpdateManager

- (BOOL)isCurrentlyDeferringOrientationUpdates
{
  return -[NSHashTable count](self->_deferralAssertions, "count") != 0;
}

- (void)_endDeferringOrientationUpdatesForAssertion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t lastUpdatedDeviceOrientation;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BKLogOrientationGlobal();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Resuming device orientation updates for reason: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  lastUpdatedDeviceOrientation = self->_lastUpdatedDeviceOrientation;
  v8 = -[NSHashTable containsObject:](self->_deferralAssertions, "containsObject:", v4);
  -[NSHashTable removeObject:](self->_deferralAssertions, "removeObject:", v4);

  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")))
  {
    if (v8 && !-[NSHashTable count](self->_deferralAssertions, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("SBDeviceOrientationUpdateManager-HasNoActiveDeferralAssertions"), 0);

    }
  }
  else if (v8
         && -[SBDeviceOrientationUpdateManager _deviceOrientationUpdateNeededForOrientation:](self, "_deviceOrientationUpdateNeededForOrientation:", lastUpdatedDeviceOrientation))
  {
    BKLogOrientationDevice();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BSDeviceOrientationDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v5;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "%{public}@ was the last reason, schdeuling update to: %{public}@.", (uint8_t *)&v12, 0x16u);

    }
    -[SBDeviceOrientationUpdateManager _enqueueOrientationUpdateToDeviceOrientation:](self, "_enqueueOrientationUpdateToDeviceOrientation:", lastUpdatedDeviceOrientation);
  }

}

- (id)deviceOrientationUpdateDeferralAssertionWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  SBDeviceOrientationUpdateDeferralAssertion *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BKLogOrientationGlobal();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Deferring device orientation updates for reason: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v6 = -[SBDeviceOrientationUpdateDeferralAssertion initWithReason:]([SBDeviceOrientationUpdateDeferralAssertion alloc], "initWithReason:", v4);
  -[SBDeviceOrientationUpdateDeferralAssertion _setHackyBackReference:](v6, "_setHackyBackReference:", self);
  -[NSHashTable addObject:](self->_deferralAssertions, "addObject:", v6);
  if (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBDeviceOrientationUpdateManager-DeferralAssertionAcquired"), 0);

  }
  return v6;
}

- (SBDeviceOrientationUpdateManager)init
{
  SBDeviceOrientationUpdateManager *v2;
  uint64_t v3;
  NSHashTable *deferralAssertions;
  id v5;
  uint64_t v6;
  BSInvalidatable *stateCaptureHandle;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBDeviceOrientationUpdateManager;
  v2 = -[SBDeviceOrientationUpdateManager init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    deferralAssertions = v2->_deferralAssertions;
    v2->_deferralAssertions = (NSHashTable *)v3;

    objc_initWeak(&location, v2);
    v5 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v9, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v6 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v2->_stateCaptureHandle;
    v2->_stateCaptureHandle = (BSInvalidatable *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __40__SBDeviceOrientationUpdateManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceOrientationUpdateManager;
  -[SBDeviceOrientationUpdateManager dealloc](&v3, sel_dealloc);
}

- (void)setLastUpdatedDeviceOrientation:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSHashTable *deferralAssertions;
  NSObject *v8;
  void *v9;
  NSHashTable *v10;
  int v11;
  void *v12;
  __int16 v13;
  NSHashTable *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_lastUpdatedDeviceOrientation != a3)
  {
    self->_lastUpdatedDeviceOrientation = a3;
    self->_deviceOrientationIsDirty = 1;
    if (-[SBDeviceOrientationUpdateManager _deviceOrientationUpdateNeededForOrientation:](self, "_deviceOrientationUpdateNeededForOrientation:"))
    {
      -[SBDeviceOrientationUpdateManager _enqueueOrientationUpdateToDeviceOrientation:](self, "_enqueueOrientationUpdateToDeviceOrientation:", a3);
    }
    else
    {
      BKLogOrientationDevice();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        BSDeviceOrientationDescription();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        deferralAssertions = self->_deferralAssertions;
        v11 = 138543618;
        v12 = v6;
        v13 = 2114;
        v14 = deferralAssertions;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Deferring device orientation update to %{public}@ because: %{public}@.", (uint8_t *)&v11, 0x16u);

      }
      BKLogOrientationDevice();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        BSDeviceOrientationDescription();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = self->_deferralAssertions;
        v11 = 138543618;
        v12 = v9;
        v13 = 2114;
        v14 = v10;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_DEFERRED", "Deferring device orientation update to %{public}@ because: %{public}@.", (uint8_t *)&v11, 0x16u);

      }
    }
  }
}

- (BOOL)_deviceOrientationUpdateNeededForOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;

  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUserLocked"))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "orientation");

    v8 = objc_msgSend(v5, "userLockOrientation");
    v9 = v7 != v8 && v8 == a3;
  }
  else
  {
    if (!self->_deviceOrientationIsDirty)
    {
      v10 = 0;
      goto LABEL_11;
    }
    v9 = -[NSHashTable count](self->_deferralAssertions, "count") == 0;
  }
  v10 = v9;
LABEL_11:

  return v10;
}

- (void)_enqueueOrientationUpdateToDeviceOrientation:(int64_t)a3
{
  objc_class *v5;
  id v6;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")) & 1) == 0)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SBDeviceOrientationUpdateManager _legacy_enqueueOrientationUpdateToDeviceOrientation:source:](self, "_legacy_enqueueOrientationUpdateToDeviceOrientation:source:", a3, v6);

  }
}

- (void)_legacy_enqueueOrientationUpdateToDeviceOrientation:(int64_t)a3 source:(id)a4
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = ++_legacy_enqueueOrientationUpdateToDeviceOrientation_source____deviceOrientationChangeCount;
  v7 = a4;
  BKLogOrientationDevice();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    BSDeviceOrientationDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v18 = v6;
    v19 = 2114;
    v20 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_ENQUEUE", "change #%ld, deviceOrientation: %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D229B0];
  v12 = (void *)MEMORY[0x1E0CB3940];
  BSDeviceOrientationDescription();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Device Orientation Changed via %@ to %@"), v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__SBDeviceOrientationUpdateManager__legacy_enqueueOrientationUpdateToDeviceOrientation_source___block_invoke;
  v16[3] = &unk_1E8E9DF00;
  v16[5] = a3;
  v16[6] = v6;
  v16[4] = self;
  objc_msgSend(v11, "eventWithName:handler:", v14, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeOrAppendEvent:", v15);

}

void __95__SBDeviceOrientationUpdateManager__legacy_enqueueOrientationUpdateToDeviceOrientation_source___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")) & 1) != 0)
  {
LABEL_5:
    v3 = a1[6];
    v4 = _legacy_enqueueOrientationUpdateToDeviceOrientation_source____deviceOrientationChangeCount;
    BKLogOrientationDevice();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3 == v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "orientation");
        BSDeviceOrientationDescription();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        BSDeviceOrientationDescription();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v8;
        v22 = 2114;
        v23 = v9;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Setting device orientation for backboardd from: %{public}@ to: %{public}@", (uint8_t *)&v20, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOrientation:animated:", a1[5], objc_msgSend((id)SBApp, "isSuspended") ^ 1);

      *(_BYTE *)(a1[4] + 16) = 0;
      BKLogOrientationDevice();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v2))
      {
        v11 = (void *)a1[6];
        BSDeviceOrientationDescription();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 134218242;
        v21 = v11;
        v22 = 2114;
        v23 = v12;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_EXECUTE", "change #%ld, deviceOrientation: %{public}@", (uint8_t *)&v20, 0x16u);

      }
    }
    else
    {
      if (os_signpost_enabled(v5))
      {
        v13 = (void *)a1[6];
        v20 = 134217984;
        v21 = v13;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_VETO", "changeCount #%ld", (uint8_t *)&v20, 0xCu);
      }

      BKLogOrientationDevice();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Vetoing device change because another orientation event came in later and hasn't run yet.", (uint8_t *)&v20, 2u);
      }
    }
    goto LABEL_19;
  }
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEffectivelyLocked](v2, "isEffectivelyLocked")
    || -[NSObject effectiveLockedOrientation](v2, "effectiveLockedOrientation") == a1[5])
  {

    goto LABEL_5;
  }
  BKLogOrientationDevice();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BSDeviceOrientationDescription();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject effectiveLockedOrientation](v2, "effectiveLockedOrientation");
    BSDeviceOrientationDescription();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Ignoring device orientation to: %{public}@ because we're device orientation locked to: %{public}@.", (uint8_t *)&v20, 0x16u);

  }
  BKLogOrientationDevice();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v17))
  {
    v18 = (void *)a1[6];
    BSDeviceOrientationDescription();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218242;
    v21 = v18;
    v22 = 2114;
    v23 = v19;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ROTATION_DEVICE_ORIENTATION_UPDATE_IGNORE", "change #%ld, deviceOrientation: %{public}@", (uint8_t *)&v20, 0x16u);

  }
LABEL_19:

}

- (id)description
{
  return -[SBDeviceOrientationUpdateManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDeviceOrientationUpdateManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBDeviceOrientationUpdateManager isCurrentlyDeferringOrientationUpdates](self, "isCurrentlyDeferringOrientationUpdates"), CFSTR("isDeferring"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDeviceOrientationUpdateManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBDeviceOrientationUpdateManager *v11;

  v4 = a3;
  -[SBDeviceOrientationUpdateManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__SBDeviceOrientationUpdateManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __74__SBDeviceOrientationUpdateManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("deviceOrientationIsDirty"), 1);
  v3 = *(void **)(a1 + 32);
  BSDeviceOrientationDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("lastUpdatedDeviceOrientation"));

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v8, CFSTR("active deferral assertions"), v7, 1);

}

- (int64_t)lastUpdatedDeviceOrientation
{
  return self->_lastUpdatedDeviceOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_deferralAssertions, 0);
}

@end
