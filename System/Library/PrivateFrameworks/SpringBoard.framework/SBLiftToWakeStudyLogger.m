@implementation SBLiftToWakeStudyLogger

- (SBLiftToWakeStudyLogger)initWithController:(id)a3
{
  id v5;
  void *v6;
  char v7;
  SBLiftToWakeStudyLogger *v8;
  SBLiftToWakeStudyLogger *v9;
  uint64_t v10;
  SLGLog *logger;
  objc_super v13;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  if ((v7 & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBLiftToWakeStudyLogger;
    v8 = -[SBLiftToWakeStudyLogger init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_controller, a3);
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v10 = objc_claimAutoreleasedReturnValue();
      logger = v9->_logger;
      v9->_logger = (SLGLog *)v10;

      objc_msgSend(v5, "addObserver:", v9);
    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBLiftToWakeController removeObserver:](self->_controller, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBLiftToWakeStudyLogger;
  -[SBLiftToWakeStudyLogger dealloc](&v3, sel_dealloc);
}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  SLGLog *logger;
  _QWORD v6[6];

  logger = self->_logger;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__SBLiftToWakeStudyLogger_liftToWakeController_didObserveTransition_deviceOrientation___block_invoke;
  v6[3] = &__block_descriptor_48_e5__8__0l;
  v6[4] = a4;
  v6[5] = a5;
  -[SLGLog logBlock:domain:](logger, "logBlock:domain:", v6, CFSTR("com.apple.SpringBoard.liftToWake"));
}

id __87__SBLiftToWakeStudyLogger_liftToWakeController_didObserveTransition_deviceOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[2];
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("liftToWake");
  v7[0] = CFSTR("transition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("deviceOrientation");
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
