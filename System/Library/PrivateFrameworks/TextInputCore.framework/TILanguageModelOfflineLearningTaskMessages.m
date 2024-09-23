@implementation TILanguageModelOfflineLearningTaskMessages

- (TILanguageModelOfflineLearningTaskMessages)initWithClientIdentifier:(id)a3 oneTimeTask:(BOOL)a4
{
  TILanguageModelOfflineLearningTaskMessages *v4;
  uint64_t v5;
  TILinguisticDataSource *dataSource;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TILanguageModelOfflineLearningTaskMessages;
  v4 = -[TILanguageModelOfflineLearningTask initWithClientIdentifier:oneTimeTask:](&v8, sel_initWithClientIdentifier_oneTimeTask_, a3, a4);
  if (v4)
  {
    +[TILanguageModelOfflineLearningTaskMessages dataSourceForTask](TILanguageModelOfflineLearningTaskMessages, "dataSourceForTask");
    v5 = objc_claimAutoreleasedReturnValue();
    dataSource = v4->_dataSource;
    v4->_dataSource = (TILinguisticDataSource *)v5;

  }
  return v4;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

+ (id)dataSourceForTask
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/TextInput/Plugins/MessagesDataKeyboardPlugin.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init((Class)objc_msgSend(v2, "classNamed:", CFSTR("MessagesTextInputModelDataSource")));
  if (!v3)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to load Messages plugin from %@"), "+[TILanguageModelOfflineLearningTaskMessages dataSourceForTask]", CFSTR("/System/Library/TextInput/Plugins/MessagesDataKeyboardPlugin.bundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

  return v3;
}

@end
