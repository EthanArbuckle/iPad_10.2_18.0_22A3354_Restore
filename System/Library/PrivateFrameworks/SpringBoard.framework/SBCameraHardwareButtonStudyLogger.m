@implementation SBCameraHardwareButtonStudyLogger

- (SBCameraHardwareButtonStudyLogger)init
{
  void *v3;
  char v4;
  SBCameraHardwareButtonStudyLogger *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SLGNotificationActivatedLogger *logger;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if ((v4 & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBCameraHardwareButtonStudyLogger;
    v5 = -[SBCameraHardwareButtonStudyLogger init](&v13, sel_init);
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0DAFEC8]);
      v7 = objc_alloc(MEMORY[0x1E0DAFEB8]);
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithLogger:", v8);
      v10 = objc_msgSend(v6, "initWithLogger:", v9);
      logger = v5->_logger;
      v5->_logger = (SLGNotificationActivatedLogger *)v10;

      -[SLGNotificationActivatedLogger addBeginNotification:endNotification:](v5->_logger, "addBeginNotification:endNotification:", CFSTR("SBStudyLogBeginCameraButtonLogging"), CFSTR("SBStudyLogEndCameraButtonLogging"));
      -[SLGNotificationActivatedLogger setActivationHandler:](v5->_logger, "setActivationHandler:", &__block_literal_global_302);
      -[SLGNotificationActivatedLogger setDeactivationHandler:](v5->_logger, "setDeactivationHandler:", &__block_literal_global_18_5);
      -[SBCameraHardwareButtonStudyLogger _startProcessMonitor](v5, "_startProcessMonitor");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t __41__SBCameraHardwareButtonStudyLogger_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logBlock:domain:", &__block_literal_global_7_1, CFSTR("com.apple.SpringBoard.cameraButton"));
}

id __41__SBCameraHardwareButtonStudyLogger_init__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v0 = objc_msgSend((id)SBApp, "rawDeviceOrientationIgnoringOrientationLocks");
  objc_msgSend((id)SBApp, "orientationAggregator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "activeInterfaceOrientation");

  v10 = CFSTR("orientation");
  v8[0] = CFSTR("interfaceOrientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("deviceOrientation");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __41__SBCameraHardwareButtonStudyLogger_init__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logBlock:domain:", &__block_literal_global_19_3, CFSTR("com.apple.SpringBoard.cameraButton"));
}

const __CFString *__41__SBCameraHardwareButtonStudyLogger_init__block_invoke_4()
{
  return CFSTR("cameraButtonLoggingTimeout");
}

- (void)logButtonEvent:(__IOHIDEvent *)a3
{
  SLGNotificationActivatedLogger *logger;
  _QWORD v6[5];

  -[SLGNotificationActivatedLogger setActive:](self->_logger, "setActive:", 1);
  logger = self->_logger;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SBCameraHardwareButtonStudyLogger_logButtonEvent___block_invoke;
  v6[3] = &__block_descriptor_40_e5__8__0l;
  v6[4] = a3;
  -[SLGNotificationActivatedLogger logBlock:domain:](logger, "logBlock:domain:", v6, CFSTR("com.apple.SpringBoard.cameraButton"));
}

id __52__SBCameraHardwareButtonStudyLogger_logButtonEvent___block_invoke()
{
  _BOOL8 v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v0 = IOHIDEventGetIntegerValue() != 0;
  v1 = objc_msgSend((id)SBApp, "rawDeviceOrientationIgnoringOrientationLocks");
  objc_msgSend((id)SBApp, "orientationAggregator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeInterfaceOrientation");

  v12 = CFSTR("cameraButtonEvent");
  v10[0] = CFSTR("down");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("interfaceOrientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("deviceOrientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)logPocketState:(int64_t)a3
{
  SLGNotificationActivatedLogger *logger;
  _QWORD v4[5];

  logger = self->_logger;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SBCameraHardwareButtonStudyLogger_logPocketState___block_invoke;
  v4[3] = &__block_descriptor_40_e5__8__0l;
  v4[4] = a3;
  -[SLGNotificationActivatedLogger logBlock:domain:](logger, "logBlock:domain:", v4, CFSTR("com.apple.SpringBoard.cameraButton"));
}

id __52__SBCameraHardwareButtonStudyLogger_logPocketState___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("pocketState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SLGNotificationActivatedLogger invalidate](self->_logger, "invalidate");
  -[SBCameraHardwareButtonStudyLogger _stopProcessMonitor](self, "_stopProcessMonitor");
  v3.receiver = self;
  v3.super_class = (Class)SBCameraHardwareButtonStudyLogger;
  -[SBCameraHardwareButtonStudyLogger dealloc](&v3, sel_dealloc);
}

- (void)_handleApplicationProcessStateDidChangeNotification:(id)a3
{
  void *v4;
  SLGNotificationActivatedLogger *logger;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isForeground"))
  {
    logger = self->_logger;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__SBCameraHardwareButtonStudyLogger__handleApplicationProcessStateDidChangeNotification___block_invoke;
    v7[3] = &unk_1E8E9E6B0;
    v8 = v6;
    -[SLGNotificationActivatedLogger logBlock:domain:](logger, "logBlock:domain:", v7, CFSTR("com.apple.SpringBoard.cameraButton"));

  }
}

id __89__SBCameraHardwareButtonStudyLogger__handleApplicationProcessStateDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("frontmostApp");
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_startProcessMonitor
{
  id v3;

  if (!self->_monitoringProcesses)
  {
    self->_monitoringProcesses = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationProcessStateDidChangeNotification_, CFSTR("SBApplicationProcessStateDidChange"), 0);

  }
}

- (void)_stopProcessMonitor
{
  id v3;

  if (self->_monitoringProcesses)
  {
    self->_monitoringProcesses = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
