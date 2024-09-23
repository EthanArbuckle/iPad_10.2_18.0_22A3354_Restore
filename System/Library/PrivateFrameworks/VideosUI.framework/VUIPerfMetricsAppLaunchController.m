@implementation VUIPerfMetricsAppLaunchController

- (void)recordAppLaunchEventWithEventType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7 * 1000.0;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtad_u64_f64(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIPerfMetricsAppLaunchController _setAppLaunchFieldWithData:](self, "_setAppLaunchFieldWithData:", v10);
}

- (void)_setAppLaunchFieldWithData:(id)a3
{
  id v4;
  VUIPerfMetricsAppLaunchController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[VUIPerfMetricsAppLaunchController appLaunchData](v5, "appLaunchData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v12 = CFSTR("isAppLaunch");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPerfMetricsAppLaunchController setAppLaunchData:](v5, "setAppLaunchData:", v8);

  }
  -[VUIPerfMetricsAppLaunchController appLaunchData](v5, "appLaunchData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "addEntriesFromDictionary:", v4);
  v11 = (void *)objc_msgSend(v10, "copy");
  -[VUIPerfMetricsAppLaunchController setAppLaunchData:](v5, "setAppLaunchData:", v11);

  objc_sync_exit(v5);
}

- (NSDictionary)appLaunchData
{
  return self->_appLaunchData;
}

- (void)setAppLaunchData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VUIPerfMetricsAppLaunchController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, block);
  return (id)sharedInstance_sharedInstance_9;
}

void __51__VUIPerfMetricsAppLaunchController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_9;
  sharedInstance_sharedInstance_9 = (uint64_t)v1;

}

- (VUIPerfMetricsAppLaunchController)init
{
  VUIPerfMetricsAppLaunchController *v2;
  NSObject *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint8_t v8[8];
  size_t v9;
  objc_super v10;
  const __CFString *v11;
  void *v12;
  _OWORD v13[40];
  int v14[2];
  int v15;
  pid_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VUIPerfMetricsAppLaunchController;
  v2 = -[VUIPerfMetricsAppLaunchController init](&v10, sel_init);
  if (v2)
  {
    *(_QWORD *)v14 = 0xE00000001;
    v15 = 1;
    v16 = getpid();
    memset(v13, 0, 512);
    v9 = 648;
    if (sysctl(v14, 4u, v13, &v9, 0, 0))
    {
      VUIDefaultLogObject();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "Could not read processStartTime", v8, 2u);
      }

      v4 = 0;
    }
    else
    {
      v4 = (unint64_t)(((double)SDWORD2(v13[0]) / 1000000.0 + (double)*(uint64_t *)&v13[0]) * 1000.0);
    }
    v11 = CFSTR("processStartTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIPerfMetricsAppLaunchController _setAppLaunchFieldWithData:](v2, "_setAppLaunchFieldWithData:", v6);

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchData, 0);
}

@end
