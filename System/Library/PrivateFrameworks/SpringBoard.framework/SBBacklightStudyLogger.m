@implementation SBBacklightStudyLogger

- (SBBacklightStudyLogger)initWithController:(id)a3
{
  id v5;
  void *v6;
  char v7;
  SBBacklightStudyLogger *v8;
  SBBacklightStudyLogger *v9;
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
    v13.super_class = (Class)SBBacklightStudyLogger;
    v8 = -[SBBacklightStudyLogger init](&v13, sel_init);
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

  -[SBBacklightController removeObserver:](self->_controller, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBBacklightStudyLogger;
  -[SBBacklightStudyLogger dealloc](&v3, sel_dealloc);
}

- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  SLGLog *logger;
  _QWORD v6[4];
  float v7;

  logger = self->_logger;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__SBBacklightStudyLogger_backlightController_didAnimateBacklightToFactor_source___block_invoke;
  v6[3] = &__block_descriptor_36_e5__8__0l;
  v7 = a4;
  -[SLGLog logBlock:domain:](logger, "logBlock:domain:", v6, CFSTR("com.apple.SpringBoard.backlight"));
}

id __81__SBBacklightStudyLogger_backlightController_didAnimateBacklightToFactor_source___block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("backlightFactor");
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
