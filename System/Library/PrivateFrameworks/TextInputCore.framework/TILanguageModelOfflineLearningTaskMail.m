@implementation TILanguageModelOfflineLearningTaskMail

- (TILanguageModelOfflineLearningTaskMail)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  TILanguageModelOfflineLearningTaskMail *v4;
  uint64_t v5;
  TILinguisticDataSource *dataSource;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TILanguageModelOfflineLearningTaskMail;
  v4 = -[TILanguageModelOfflineLearningTask initWithClientIdentifier:oneTimeTask:](&v8, sel_initWithClientIdentifier_oneTimeTask_, a3, a4);
  if (v4)
  {
    +[TILanguageModelOfflineLearningTaskMail dataSourceForTask](TILanguageModelOfflineLearningTaskMail, "dataSourceForTask");
    v5 = objc_claimAutoreleasedReturnValue();
    dataSource = v4->_dataSource;
    v4->_dataSource = (TILinguisticDataSource *)v5;

  }
  return v4;
}

- (id)linePaddingCharacters
{
  NSCharacterSet *linePaddingCharacters;
  void *v4;
  void *v5;
  NSCharacterSet *v6;
  NSCharacterSet *v7;

  linePaddingCharacters = self->_linePaddingCharacters;
  if (!linePaddingCharacters)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "addCharactersInString:", CFSTR("\u200E\u200F"));
    v6 = (NSCharacterSet *)objc_msgSend(v5, "copy");
    v7 = self->_linePaddingCharacters;
    self->_linePaddingCharacters = v6;

    linePaddingCharacters = self->_linePaddingCharacters;
  }
  return linePaddingCharacters;
}

- (id)forwardedMessageSeparators
{
  NSSet *forwardedMessageSeparators;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  forwardedMessageSeparators = self->_forwardedMessageSeparators;
  if (!forwardedMessageSeparators)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TextInput"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("ForwardedMessageSeparators"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
        v8 = self->_forwardedMessageSeparators;
        self->_forwardedMessageSeparators = v7;

      }
    }

    forwardedMessageSeparators = self->_forwardedMessageSeparators;
  }
  return forwardedMessageSeparators;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_forwardedMessageSeparators, 0);
  objc_storeStrong((id *)&self->_linePaddingCharacters, 0);
}

+ (id)dataSourceForTask
{
  id v2;
  NSObject *v3;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(NSClassFromString(CFSTR("TIMailDataSource")));
  if (!v2)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to load TIMailDataSource"), "+[TILanguageModelOfflineLearningTaskMail dataSourceForTask]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  return v2;
}

@end
