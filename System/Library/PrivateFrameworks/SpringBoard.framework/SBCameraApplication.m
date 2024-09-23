@implementation SBCameraApplication

- (void)preHeatForUserLaunchIfNecessaryWithAbsoluteTime:(unint64_t)a3 andContinuousTime:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t v13[8];
  objc_super v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBCameraApplication;
  -[SBApplication preHeatForUserLaunchIfNecessaryWithAbsoluteTime:andContinuousTime:](&v14, sel_preHeatForUserLaunchIfNecessaryWithAbsoluteTime_andContinuousTime_);
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Prewarming Camera for icon touch.", v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C8A078];
  v11 = *MEMORY[0x1E0C8A0B8];
  v15[0] = *MEMORY[0x1E0C8A0A0];
  v15[1] = v11;
  v16[0] = v10;
  v16[1] = v8;
  v15[2] = *MEMORY[0x1E0C8A0C8];
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AVCapturePrewarmWithOptions();
  self->_hasPreHeatInFlight = 1;

}

- (BOOL)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  BOOL result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCameraApplication;
  result = -[SBApplication icon:launchFromLocation:context:](&v7, sel_icon_launchFromLocation_context_, a3, a4, a5);
  self->_hasPreHeatInFlight = 0;
  return result;
}

- (void)_cancelPreheatForUserLaunchIfNecessary
{
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (self->_hasPreHeatInFlight)
  {
    v4 = *MEMORY[0x1E0C8A0A0];
    v5[0] = *MEMORY[0x1E0C8A078];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1D17E1D28](CFSTR("com.apple.camera"), v3);

    self->_hasPreHeatInFlight = 0;
  }
}

- (BOOL)hasPreHeatInFlight
{
  return self->_hasPreHeatInFlight;
}

- (void)setHasPreHeatInFlight:(BOOL)a3
{
  self->_hasPreHeatInFlight = a3;
}

@end
