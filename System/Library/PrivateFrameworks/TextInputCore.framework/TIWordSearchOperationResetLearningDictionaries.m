@implementation TIWordSearchOperationResetLearningDictionaries

- (TIWordSearchOperationResetLearningDictionaries)initWithMecabraWrapper:(id)a3
{
  id v5;
  TIWordSearchOperationResetLearningDictionaries *v6;
  TIWordSearchOperationResetLearningDictionaries *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIWordSearchOperationResetLearningDictionaries;
  v6 = -[TIWordSearchOperationResetLearningDictionaries init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mecabraWrapper, a3);

  return v7;
}

- (void)perform
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TIWordSearchOperationResetLearningDictionaries mecabraWrapper](self, "mecabraWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = (void *)MEMORY[0x1E0CB37E8];
        -[TIWordSearchOperationResetLearningDictionaries mecabraWrapper](self, "mecabraWrapper");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v10, "inputMethodType"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%s Reset learning dictionaries for input method type %@"), "-[TIWordSearchOperationResetLearningDictionaries perform]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIWordSearchOperationResetLearningDictionaries mecabraWrapper](self, "mecabraWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMethodType");
    v6 = (void *)MEMORY[0x1E0C99E98];
    UIKeyboardUserDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    MecabraResetLearningDictionaries();

  }
}

- (TIMecabraWrapper)mecabraWrapper
{
  return self->_mecabraWrapper;
}

- (void)setMecabraWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_mecabraWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
