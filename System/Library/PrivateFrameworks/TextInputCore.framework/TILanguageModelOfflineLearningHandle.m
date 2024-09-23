@implementation TILanguageModelOfflineLearningHandle

- (TILanguageModelOfflineLearningHandle)initWithInputMode:(id)a3
{
  id v4;
  TILanguageModelOfflineLearningHandle *v5;
  uint64_t v6;
  TIInputMode *inputMode;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TILanguageModelOfflineLearningHandle;
  v5 = -[TILanguageModelOfflineLearningHandle init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    inputMode = v5->_inputMode;
    v5->_inputMode = (TIInputMode *)v6;

  }
  return v5;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (NSDate)lastAdaptationDate
{
  return self->_lastAdaptationDate;
}

- (void)setLastAdaptationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TILanguageModelAdaptationContext)currentAdaptationContext
{
  return self->_currentAdaptationContext;
}

- (void)setCurrentAdaptationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAdaptationContext, 0);
  objc_storeStrong((id *)&self->_lastAdaptationDate, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

+ (id)handleForInputMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "normalizedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TICanonicalInputModeName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)TIInputManagerClassForInputMode();

  objc_msgSend(v6, "offlineLearningHandleForInputMode:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)handleForLanguageLikelihood
{
  TILanguageModelOfflineLearningHandleLanguageLikelihood *v2;

  v2 = -[TILanguageModelOfflineLearningHandle initWithInputMode:]([TILanguageModelOfflineLearningHandleLanguageLikelihood alloc], "initWithInputMode:", 0);
  -[TILanguageModelOfflineLearningHandle setValid:](v2, "setValid:", 1);
  return v2;
}

@end
