@implementation SBAlwaysOnBrightnessCurveController

- (SBAlwaysOnBrightnessCurveController)init
{
  id v3;
  SBAlwaysOnBrightnessCurveController *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D15710]);
  v4 = -[SBAlwaysOnBrightnessCurveController initWithBrightnessSystemClient:](self, "initWithBrightnessSystemClient:", v3);

  return v4;
}

- (SBAlwaysOnBrightnessCurveController)initWithBrightnessSystemClient:(id)a3
{
  id v5;
  SBAlwaysOnBrightnessCurveController *v6;
  SBAlwaysOnBrightnessCurveController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAlwaysOnBrightnessCurveController;
  v6 = -[SBAlwaysOnBrightnessCurveController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_brightnessSystemClient, a3);
    v7->_lock_useAlwaysOnBrightnessCurve = 0;
    -[SBAlwaysOnBrightnessCurveController setUseAlwaysOnBrightnessCurve:withRampDuration:](v7, "setUseAlwaysOnBrightnessCurve:withRampDuration:", 0, 0.25);
  }

  return v7;
}

- (BOOL)isUsingAlwaysOnBrightnessCurve
{
  SBAlwaysOnBrightnessCurveController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_useAlwaysOnBrightnessCurve;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUseAlwaysOnBrightnessCurve:(BOOL)a3 withRampDuration:(double)a4
{
  _BOOL4 v5;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  double v14;
  __int16 v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v5 = a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_useAlwaysOnBrightnessCurve = v5;
  os_unfair_lock_unlock(p_lock);
  v17[0] = CFSTR("AOTState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("AOTTransitionTime");
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SBLogBacklight();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109634;
    v12[1] = v5;
    v13 = 2048;
    v14 = a4;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "setUseAlwaysOnBrightnessCurve:%{BOOL}u duration:%.2fs set to %{public}@", (uint8_t *)v12, 0x1Cu);
  }

  -[BrightnessSystemClient setProperty:forKey:](self->_brightnessSystemClient, "setProperty:forKey:", v10, CFSTR("CBAOTStateUpdate"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
}

@end
