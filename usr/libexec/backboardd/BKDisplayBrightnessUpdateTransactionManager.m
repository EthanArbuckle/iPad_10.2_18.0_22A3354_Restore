@implementation BKDisplayBrightnessUpdateTransactionManager

- (id)_initWithBrightnessController:(id)a3
{
  id v5;
  BKDisplayBrightnessUpdateTransactionManager *v6;
  BKDisplayBrightnessUpdateTransactionManager *v7;
  void *v8;
  void *v9;
  float v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKDisplayBrightnessUpdateTransactionManager;
  v6 = -[BKDisplayBrightnessUpdateTransactionManager init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)&v6->_lock._os_unfair_lock_opaque = 0;
    v6->_commitPending = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](BKSDefaults, "externalDefaults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "springBoardDefaults"));
    objc_msgSend(v9, "brightness");
    v7->_systemDisplayBrightness = v10;

    objc_storeStrong((id *)&v7->_brightnessController, a3);
  }

  return v7;
}

- (void)synchronizeALSPreferencesAndSystemDisplayBrightness
{
  os_unfair_lock_s *p_lock;
  double v4;
  float v5;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  *(float *)&v4 = self->_systemDisplayBrightness;
  -[BKDisplayBrightnessController setBrightnessLevel:reason:options:](self->_brightnessController, "setBrightnessLevel:reason:options:", CFSTR("synchronizeALSPreferencesAndDisplayBrightness"), 2, v4);
  if (sub_10007A3A8())
  {
    -[BKDisplayBrightnessController brightnessLevel](self->_brightnessController, "brightnessLevel");
    self->_systemDisplayBrightness = v5;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setDisplayBrightness:(float)a3 permanently:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  double v8;
  int numPendingTransactions;
  uint64_t v10;
  const __CFString *v11;

  v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  numPendingTransactions = self->_numPendingTransactions;
  if (numPendingTransactions)
    v10 = 2;
  else
    v10 = 3;
  if (v4)
    v11 = CFSTR("setDisplayBrightness (permanent)");
  else
    v11 = CFSTR("setDisplayBrightness (transient)");
  *(float *)&v8 = a3;
  -[BKDisplayBrightnessController setBrightnessLevel:reason:options:](self->_brightnessController, "setBrightnessLevel:reason:options:", v11, v10, v8);
  if (!v4 && self->_systemDisplayBrightness >= 0.0)
  {
    self->_shouldRestoreSystemBrightness = 1;
    if (numPendingTransactions)
      goto LABEL_10;
LABEL_12:
    -[BKDisplayBrightnessUpdateTransactionManager _lock_commitDisplayBrightness](self, "_lock_commitDisplayBrightness");
    goto LABEL_13;
  }
  self->_systemDisplayBrightness = a3;
  if (!numPendingTransactions)
    goto LABEL_12;
LABEL_10:
  self->_commitPending = 1;
LABEL_13:
  os_unfair_lock_unlock(p_lock);
}

- (float)systemDisplayBrightness
{
  os_unfair_lock_s *p_lock;
  float systemDisplayBrightness;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  systemDisplayBrightness = self->_systemDisplayBrightness;
  os_unfair_lock_unlock(p_lock);
  return systemDisplayBrightness;
}

- (void)restoreSystemDisplayBrightness
{
  os_unfair_lock_s *p_lock;
  float systemDisplayBrightness;
  BKDisplayBrightnessController *brightnessController;
  NSString *v7;
  void *v8;
  double v9;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_shouldRestoreSystemBrightness)
  {
    systemDisplayBrightness = self->_systemDisplayBrightness;
    if (systemDisplayBrightness >= 0.0)
    {
      self->_shouldRestoreSystemBrightness = 0;
      brightnessController = self->_brightnessController;
      v7 = NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(float *)&v9 = systemDisplayBrightness;
      -[BKDisplayBrightnessController setBrightnessLevel:reason:options:](brightnessController, "setBrightnessLevel:reason:options:", v8, 10, v9);

      sub_10007A3A8();
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_beginUpdateTransaction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int numPendingTransactions;
  BSInvalidatable *v8;
  BSInvalidatable *suppressBrightnessNotifications;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  id v14;
  __int16 v15;
  int v16;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  numPendingTransactions = self->_numPendingTransactions;
  self->_numPendingTransactions = numPendingTransactions + 1;
  if (!numPendingTransactions)
  {
    v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(-[BKDisplayBrightnessController suppressBrightnessNotificationsForReason:](self->_brightnessController, "suppressBrightnessNotificationsForReason:", CFSTR("update-transaction")));
    suppressBrightnessNotifications = self->_suppressBrightnessNotifications;
    self->_suppressBrightnessNotifications = v8;

  }
  v10 = BKLogBacklight(v5, v6);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = self->_numPendingTransactions;
    v13 = 138543618;
    v14 = v4;
    v15 = 1024;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Begin transaction: %{public}@; %d now exist",
      (uint8_t *)&v13,
      0x12u);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_endUpdateTransaction:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int numPendingTransactions;
  int v11;
  BSInvalidatable *suppressBrightnessNotifications;
  void *v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  BKDisplayBrightnessUpdateTransactionManager *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;

  v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  --self->_numPendingTransactions;
  v8 = BKLogBacklight(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    numPendingTransactions = self->_numPendingTransactions;
    v20 = 138543618;
    v21 = v5;
    v22 = 1024;
    LODWORD(v23) = numPendingTransactions;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ending transaction: %{public}@; %d remain",
      (uint8_t *)&v20,
      0x12u);
  }

  v11 = self->_numPendingTransactions;
  if (v11 < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("There shouldn't be a negative number of pending transactions")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v17 = (objc_class *)objc_opt_class(self, v16);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = 138544642;
      v21 = v15;
      v22 = 2114;
      v23 = v19;
      v24 = 2048;
      v25 = self;
      v26 = 2114;
      v27 = CFSTR("BKDisplayBrightnessUpdateTransactionManager.m");
      v28 = 1024;
      v29 = 292;
      v30 = 2114;
      v31 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v20, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
    __break(0);
    JUMPOUT(0x100078878);
  }
  if (!v11)
  {
    -[BSInvalidatable invalidate](self->_suppressBrightnessNotifications, "invalidate");
    suppressBrightnessNotifications = self->_suppressBrightnessNotifications;
    self->_suppressBrightnessNotifications = 0;

    -[BKDisplayBrightnessUpdateTransactionManager _lock_commitDisplayBrightness](self, "_lock_commitDisplayBrightness");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_lock_commitDisplayBrightness
{
  float v3;
  float v4;
  void *v5;
  void *v6;
  double v7;

  if (self->_commitPending)
  {
    -[BKDisplayBrightnessController brightnessLevel](self->_brightnessController, "brightnessLevel");
    v4 = v3;
    -[BKDisplayBrightnessController setBrightnessLevel:reason:options:](self->_brightnessController, "setBrightnessLevel:reason:options:", CFSTR("commitDisplayBrightness"), 7);
    if (vabds_f32(self->_systemDisplayBrightness, v4) < 0.0001)
    {
      sub_10007A300();
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKSDefaults externalDefaults](BKSDefaults, "externalDefaults"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "springBoardDefaults"));
      *(float *)&v7 = v4;
      objc_msgSend(v6, "setBrightness:", v7);

    }
    self->_commitPending = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessController, 0);
  objc_storeStrong((id *)&self->_suppressBrightnessNotifications, 0);
}

+ (BKDisplayBrightnessUpdateTransactionManager)sharedInstance
{
  if (qword_100117548 != -1)
    dispatch_once(&qword_100117548, &stru_1000EC0E8);
  return (BKDisplayBrightnessUpdateTransactionManager *)(id)qword_100117540;
}

@end
