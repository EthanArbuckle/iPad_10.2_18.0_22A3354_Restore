@implementation TIWordSearchOperationAdaptOffline

- (TIWordSearchOperationAdaptOffline)initWithWordSearch:(id)a3 paragraph:(id)a4 adaptationContext:(id)a5 timeStamp:(double)a6
{
  id v10;
  id v11;
  id v12;
  TIWordSearchOperationAdaptOffline *v13;
  uint64_t v14;
  TIMecabraWrapper *mecabraWrapper;
  uint64_t v16;
  NSString *paragraph;
  uint64_t v18;
  TILanguageModelAdaptationContext *adaptationContext;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TIWordSearchOperationAdaptOffline;
  v13 = -[TIWordSearchOperationAdaptOffline init](&v21, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "mecabraWrapper");
    v14 = objc_claimAutoreleasedReturnValue();
    mecabraWrapper = v13->_mecabraWrapper;
    v13->_mecabraWrapper = (TIMecabraWrapper *)v14;

    v16 = objc_msgSend(v11, "copy");
    paragraph = v13->_paragraph;
    v13->_paragraph = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    adaptationContext = v13->_adaptationContext;
    v13->_adaptationContext = (TILanguageModelAdaptationContext *)v18;

    v13->_timeStamp = a6;
  }

  return v13;
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
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[TIWordSearchOperationAdaptOffline mecabraWrapper](self, "mecabraWrapper");
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
        v7 = (void *)MEMORY[0x1E0CB3940];
        -[TIWordSearchOperationAdaptOffline paragraph](self, "paragraph");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%s [Offline adaptation] Adapting to paragraph: %@"), "-[TIWordSearchOperationAdaptOffline perform]", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIWordSearchOperationAdaptOffline paragraph](self, "paragraph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIWordSearchOperationAdaptOffline timeStamp](self, "timeStamp");
    MecabraAdaptToUntokenizedText();

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

- (NSString)paragraph
{
  return self->_paragraph;
}

- (void)setParagraph:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraph, 0);
  objc_storeStrong((id *)&self->_adaptationContext, 0);
  objc_storeStrong((id *)&self->_mecabraWrapper, 0);
}

@end
