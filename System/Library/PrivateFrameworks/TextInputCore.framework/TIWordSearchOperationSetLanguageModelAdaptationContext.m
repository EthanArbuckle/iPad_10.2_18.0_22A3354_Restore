@implementation TIWordSearchOperationSetLanguageModelAdaptationContext

- (TIWordSearchOperationSetLanguageModelAdaptationContext)initWithWordSearch:(id)a3 adaptationContext:(id)a4
{
  id v6;
  id v7;
  TIWordSearchOperationSetLanguageModelAdaptationContext *v8;
  uint64_t v9;
  TIMecabraWrapper *mecabraWrapper;
  uint64_t v11;
  TILanguageModelAdaptationContext *adaptationContext;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIWordSearchOperationSetLanguageModelAdaptationContext;
  v8 = -[TIWordSearchOperationSetLanguageModelAdaptationContext init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "mecabraWrapper");
    v9 = objc_claimAutoreleasedReturnValue();
    mecabraWrapper = v8->_mecabraWrapper;
    v8->_mecabraWrapper = (TIMecabraWrapper *)v9;

    v11 = objc_msgSend(v7, "copy");
    adaptationContext = v8->_adaptationContext;
    v8->_adaptationContext = (TILanguageModelAdaptationContext *)v11;

  }
  return v8;
}

- (void)perform
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[TIWordSearchOperationSetLanguageModelAdaptationContext mecabraWrapper](self, "mecabraWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mecabraRef");

  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        -[TIWordSearchOperationSetLanguageModelAdaptationContext adaptationContext](self, "adaptationContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%s Set dynamic language model with context %@"), "-[TIWordSearchOperationSetLanguageModelAdaptationContext perform]", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v10;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIWordSearchOperationSetLanguageModelAdaptationContext adaptationContext](self, "adaptationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MecabraSetDynamicLanguageModelAppContext();

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

- (TILanguageModelAdaptationContext)adaptationContext
{
  return self->_adaptationContext;
}

- (void)setAdaptationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptationContext, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
