@implementation SBFDeviceBlockTimer

- (SBFDeviceBlockTimer)initWithDeviceBlockStatusProvider:(id)a3
{
  id v4;
  SBFDeviceBlockTimer *v5;
  SBFDeviceBlockTimer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBFDeviceBlockTimer;
  v5 = -[SBFDeviceBlockTimer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SBFDeviceBlockTimer _setBlockStatusProvider:](v5, "_setBlockStatusProvider:", v4);
    -[SBFDeviceBlockTimer _scheduleTimerIfNecessaryAndUpdateState](v6, "_scheduleTimerIfNecessaryAndUpdateState");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SBFDeviceBlockTimer _clearTimer](self, "_clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)SBFDeviceBlockTimer;
  -[SBFDeviceBlockTimer dealloc](&v3, sel_dealloc);
}

- (void)start
{
  self->_enabled = 1;
  -[SBFDeviceBlockTimer _scheduleTimerIfNecessaryAndUpdateState](self, "_scheduleTimerIfNecessaryAndUpdateState");
}

- (void)invalidate
{
  self->_enabled = 0;
  -[SBFDeviceBlockTimer _clearTimer](self, "_clearTimer");
}

- (void)_clearTimer
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_scheduleTimerIfNecessaryAndUpdateState
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**handler)(void);
  id v23;
  void *v24;
  NSTimer *v25;
  NSTimer *timer;
  void *v27;
  id v28;
  id v29;

  if ((-[SBFBlockStatusProvider isPermanentlyBlocked](self->_blockStatusProvider, "isPermanentlyBlocked") & 1) != 0)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_ITUNES"), &stru_1E2010FC0, CFSTR("DeviceBlock"));
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v4 = 0.0;
LABEL_6:

      v15 = v28;
      goto LABEL_8;
    }
  }
  else
  {
    -[SBFBlockStatusProvider timeIntervalUntilUnblockedSinceReferenceDate](self->_blockStatusProvider, "timeIntervalUntilUnblockedSinceReferenceDate");
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v8 = v6 - v7;
    if (v8 > 0.0)
    {
      v9 = v8 / 60.0;
      v10 = ceil(v9);
      v4 = (v9 - (double)(uint64_t)(vcvtpd_s64_f64(v9) - 1)) * 60.0;
      v3 = objc_alloc_init(MEMORY[0x1E0CB3570]);
      objc_msgSend(v3, "setUnitsStyle:", 3);
      objc_msgSend(v3, "stringFromTimeInterval:", (double)(uint64_t)v10 * 60.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFDeviceBlockTimer setTimeoutText:](self, "setTimeoutText:", v11);
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN_AFTER_TIMEOUT"), &stru_1E2010FC0, CFSTR("DeviceBlock"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v11);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
  }
  v15 = 0;
  v4 = 0.0;
LABEL_8:
  v29 = v15;
  -[SBFDeviceBlockTimer setSubtitleText:](self, "setSubtitleText:");
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DEVICE_BLOCKED"), &stru_1E2010FC0, CFSTR("DeviceBlock"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedProductName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFDeviceBlockTimer setTitleText:](self, "setTitleText:", v21);

  -[SBFDeviceBlockTimer setUserRequestedEraseEnabled:](self, "setUserRequestedEraseEnabled:", -[SBFBlockStatusProvider isUserRequestedEraseEnabled](self->_blockStatusProvider, "isUserRequestedEraseEnabled"));
  handler = (void (**)(void))self->_handler;
  if (handler)
    handler[2]();
  -[SBFDeviceBlockTimer _clearTimer](self, "_clearTimer");
  if (v4 > 0.0 && self->_enabled)
  {
    v23 = objc_alloc(MEMORY[0x1E0C99E88]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (NSTimer *)objc_msgSend(v23, "initWithFireDate:interval:target:selector:userInfo:repeats:", v24, self, sel__scheduleTimerIfNecessaryAndUpdateState, 0, 0, 0.0);
    timer = self->_timer;
    self->_timer = v25;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addTimer:forMode:", self->_timer, *MEMORY[0x1E0C99860]);

  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)timeoutText
{
  return self->_timeoutText;
}

- (void)setTimeoutText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isUserRequestedEraseEnabled
{
  return self->_userRequestedEraseEnabled;
}

- (void)setUserRequestedEraseEnabled:(BOOL)a3
{
  self->_userRequestedEraseEnabled = a3;
}

- (NSString)primaryActionButtonText
{
  return self->_primaryActionButtonText;
}

- (void)setPrimaryActionButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SBFBlockStatusProvider)blockStatusProvider
{
  return self->_blockStatusProvider;
}

- (void)_setBlockStatusProvider:(id)a3
{
  objc_storeStrong((id *)&self->_blockStatusProvider, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)_setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)_isEnabled
{
  return self->_enabled;
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_blockStatusProvider, 0);
  objc_storeStrong((id *)&self->_primaryActionButtonText, 0);
  objc_storeStrong((id *)&self->_timeoutText, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
