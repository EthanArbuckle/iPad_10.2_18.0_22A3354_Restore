@implementation QPQueryParserManager

+ (QPQueryParserManager)defaultManager
{
  if (+[QPQueryParserManager defaultManager]::defaultOnceToken != -1)
    dispatch_once(&+[QPQueryParserManager defaultManager]::defaultOnceToken, &__block_literal_global_14);
  return (QPQueryParserManager *)(id)+[QPQueryParserManager defaultManager]::__DefaultManager;
}

void __38__QPQueryParserManager_defaultManager__block_invoke()
{
  QPQueryParserManager *v0;
  void *v1;
  __CFDictionary *v2;

  v2 = QPQueryParserCopyDefaultOptionsForContext(CFSTR("com.apple.QueryParser"));
  v0 = -[QPQueryParserManager initWithOptions:]([QPQueryParserManager alloc], "initWithOptions:", v2);
  v1 = (void *)+[QPQueryParserManager defaultManager]::__DefaultManager;
  +[QPQueryParserManager defaultManager]::__DefaultManager = (uint64_t)v0;

}

+ (id)spotlightManager
{
  if (+[QPQueryParserManager spotlightManager]::spotlightOnceToken != -1)
    dispatch_once(&+[QPQueryParserManager spotlightManager]::spotlightOnceToken, &__block_literal_global_32);
  return (id)+[QPQueryParserManager spotlightManager]::__SpotlightManager;
}

void __40__QPQueryParserManager_spotlightManager__block_invoke()
{
  QPQueryParserManager *v0;
  void *v1;
  __CFDictionary *v2;

  v2 = QPQueryParserCopyDefaultOptionsForContext(CFSTR("com.apple.Spotlight"));
  v0 = -[QPQueryParserManager initWithOptions:]([QPQueryParserManager alloc], "initWithOptions:", v2);
  v1 = (void *)+[QPQueryParserManager spotlightManager]::__SpotlightManager;
  +[QPQueryParserManager spotlightManager]::__SpotlightManager = (uint64_t)v0;

}

+ (id)remindersParserManager
{
  if (+[QPQueryParserManager remindersParserManager]::reminderParserOnceToken != -1)
    dispatch_once(&+[QPQueryParserManager remindersParserManager]::reminderParserOnceToken, &__block_literal_global_35);
  return (id)+[QPQueryParserManager remindersParserManager]::__RemindersParserManager;
}

void __46__QPQueryParserManager_remindersParserManager__block_invoke()
{
  QPQueryParserManager *v0;
  void *v1;
  __CFDictionary *v2;

  v2 = QPQueryParserCopyDefaultOptionsForContext(CFSTR("com.apple.Reminders.Parser"));
  v0 = -[QPQueryParserManager initWithOptions:]([QPQueryParserManager alloc], "initWithOptions:", v2);
  v1 = (void *)+[QPQueryParserManager remindersParserManager]::__RemindersParserManager;
  +[QPQueryParserManager remindersParserManager]::__RemindersParserManager = (uint64_t)v0;

}

+ (id)photosParserManager
{
  if (+[QPQueryParserManager photosParserManager]::photosOnceToken != -1)
    dispatch_once(&+[QPQueryParserManager photosParserManager]::photosOnceToken, &__block_literal_global_38);
  return (id)+[QPQueryParserManager photosParserManager]::__PhotosParserManager;
}

void __43__QPQueryParserManager_photosParserManager__block_invoke()
{
  QPQueryParserManager *v0;
  void *v1;
  __CFDictionary *v2;

  v2 = QPQueryParserCopyDefaultOptionsForContext(CFSTR("com.apple.Photos.Parser"));
  v0 = -[QPQueryParserManager initWithOptions:]([QPQueryParserManager alloc], "initWithOptions:", v2);
  v1 = (void *)+[QPQueryParserManager photosParserManager]::__PhotosParserManager;
  +[QPQueryParserManager photosParserManager]::__PhotosParserManager = (uint64_t)v0;

}

+ (id)notesManager
{
  if (+[QPQueryParserManager notesManager]::notesOnceToken != -1)
    dispatch_once(&+[QPQueryParserManager notesManager]::notesOnceToken, &__block_literal_global_41);
  return (id)+[QPQueryParserManager notesManager]::__NotesManager;
}

void __36__QPQueryParserManager_notesManager__block_invoke()
{
  QPQueryParserManager *v0;
  void *v1;
  __CFDictionary *v2;

  v2 = QPQueryParserCopyDefaultOptionsForContext(CFSTR("com.apple.Notes"));
  v0 = -[QPQueryParserManager initWithOptions:]([QPQueryParserManager alloc], "initWithOptions:", v2);
  v1 = (void *)+[QPQueryParserManager notesManager]::__NotesManager;
  +[QPQueryParserManager notesManager]::__NotesManager = (uint64_t)v0;

}

+ (id)visualGenerationManager
{
  if (+[QPQueryParserManager visualGenerationManager]::visualGenerationOnceToken != -1)
    dispatch_once(&+[QPQueryParserManager visualGenerationManager]::visualGenerationOnceToken, &__block_literal_global_44);
  return (id)+[QPQueryParserManager visualGenerationManager]::__VisualGenerationManager;
}

void __47__QPQueryParserManager_visualGenerationManager__block_invoke()
{
  NSObject *v0;
  __CFDictionary *v1;
  QPQueryParserManager *v2;
  void *v3;
  uint8_t v4[16];

  if (queryParserManagerLogger(void)::token != -1)
    dispatch_once(&queryParserManagerLogger(void)::token, &__block_literal_global_166);
  v0 = queryParserManagerLogger(void)::log;
  if (os_log_type_enabled((os_log_t)queryParserManagerLogger(void)::log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218E10000, v0, OS_LOG_TYPE_DEFAULT, "QueryParserManager: initializing a visualGenerationManager", v4, 2u);
  }
  v1 = QPQueryParserCopyDefaultOptionsForContext(CFSTR("com.apple.visual-generation"));
  v2 = -[QPQueryParserManager initWithOptions:]([QPQueryParserManager alloc], "initWithOptions:", v1);
  v3 = (void *)+[QPQueryParserManager visualGenerationManager]::__VisualGenerationManager;
  +[QPQueryParserManager visualGenerationManager]::__VisualGenerationManager = (uint64_t)v2;

}

+ (id)availableLanguages
{
  return &unk_24DA34C98;
}

- (QPQueryParserManager)initWithOptions:(id)a3
{
  const __CFDictionary *v4;
  QPQueryParserManager *v5;
  QPQueryParserManager *v6;
  QPDataDetectorsParser *v7;
  QPDataDetectorsParser *dateParser;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  QPQueryParserManager *v12;
  uint64_t v13;
  NSDate *originalDate;
  uint64_t v15;
  NSLocale *originalLocale;
  uint64_t v17;
  NSArray *originalPreferredLocales;
  uint64_t v19;
  NSURL *originalCustomResourceDirectory;
  const __CFLocale *v21;
  CFTypeRef Value;
  NSLocale *v23;
  _QWORD block[4];
  QPQueryParserManager *v26;
  objc_super v27;
  uint8_t buf[4];
  CFTypeRef v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (const __CFDictionary *)a3;
  v27.receiver = self;
  v27.super_class = (Class)QPQueryParserManager;
  v5 = -[QPQueryParserManager init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_modelIsLoaded = 0;
    v5->_parser = (void *)QPQueryParserCreate(v4);
    v7 = objc_alloc_init(QPDataDetectorsParser);
    dateParser = v6->_dateParser;
    v6->_dateParser = v7;

    v9 = dispatch_queue_create("com.apple.QueryParser.Manager", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    v11 = v6->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__QPQueryParserManager_initWithOptions___block_invoke;
    block[3] = &unk_24DA24858;
    v12 = v6;
    v26 = v12;
    dispatch_async(v11, block);
    QPQueryParserGetReferenceDate((uint64_t)v6->_parser);
    v13 = objc_claimAutoreleasedReturnValue();
    originalDate = v12->_originalDate;
    v12->_originalDate = (NSDate *)v13;

    QPQueryParserGetLocale((uint64_t)v6->_parser);
    v15 = objc_claimAutoreleasedReturnValue();
    originalLocale = v12->_originalLocale;
    v12->_originalLocale = (NSLocale *)v15;

    QPQueryParserGetPreferredLanguages((uint64_t)v6->_parser);
    v17 = objc_claimAutoreleasedReturnValue();
    originalPreferredLocales = v12->_originalPreferredLocales;
    v12->_originalPreferredLocales = (NSArray *)v17;

    QPQueryParserGetCustomResourceDirectory((uint64_t)v6->_parser);
    v19 = objc_claimAutoreleasedReturnValue();
    originalCustomResourceDirectory = v12->_originalCustomResourceDirectory;
    v12->_originalCustomResourceDirectory = (NSURL *)v19;

    v21 = (const __CFLocale *)v12->_originalLocale;
    if (v21)
    {
      Value = CFLocaleGetValue(v21, (CFLocaleKey)*MEMORY[0x24BDBD418]);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = Value;
        _os_log_impl(&dword_218E10000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "QueryParserManager: loaded %@", buf, 0xCu);
      }
      v23 = v12->_originalLocale;
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong((id *)&v12->_currentLocale, v23);
    v6->_modelIsLoaded = -[QPQueryParserManager available](v12, "available");

  }
  return v6;
}

void __40__QPQueryParserManager_initWithOptions___block_invoke(uint64_t a1)
{
  QPQueryParserEnumerateParses(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &stru_24DA27910, 0);
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  NSObject *v5;
  void *parser;
  objc_super v7;
  _QWORD block[5];

  queue = self->_queue;
  if (!queue
    || (dispatch_get_current_queue(),
        v4 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue(),
        v4,
        queue == v4))
  {
    parser = self->_parser;
    if (parser)
      CFRelease(parser);
  }
  else
  {
    v5 = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__QPQueryParserManager_dealloc__block_invoke;
    block[3] = &unk_24DA24858;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)QPQueryParserManager;
  -[QPQueryParserManager dealloc](&v7, sel_dealloc);
}

void __31__QPQueryParserManager_dealloc__block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v1)
    CFRelease(v1);
}

- (void)setOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v8;
    if (v6)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__QPQueryParserManager_setOptions___block_invoke;
      block[3] = &unk_24DA26A38;
      block[4] = self;
      v10 = v8;
      dispatch_sync(queue, block);

      v5 = v8;
    }
  }

}

uint64_t __35__QPQueryParserManager_setOptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithOptions:", *(_QWORD *)(a1 + 40));
}

- (id)locale
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__QPQueryParserManager_locale__block_invoke;
  v5[3] = &unk_24DA24880;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__QPQueryParserManager_locale__block_invoke(uint64_t a1)
{
  uint64_t Locale;
  uint64_t v3;
  void *v4;

  Locale = QPQueryParserGetLocale(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = Locale;

}

- (BOOL)available
{
  BOOL v2;
  NSLocale *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!self->_modelIsLoaded)
  {
    v4 = self->_currentLocale;
    -[NSLocale languageCode](v4, "languageCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (objc_msgSend((id)objc_opt_class(), "availableLanguages"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "containsObject:", v5),
          v6,
          (v7 & 1) != 0))
    {
      if (QPQueryParserAvailableForLocale((_BOOL8)v4))
      {
        v2 = 1;
        self->_modelIsLoaded = 1;
LABEL_10:

        return v2;
      }
      if (QPQueryParserIsAvailable((QP::QueryParserEngine *)self->_parser)
        && QPQueryParserIsParsingAvailable((QP::QueryParserEngine *)self->_parser))
      {
        v2 = 1;
        goto LABEL_10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        -[QPQueryParserManager available].cold.2((uint64_t)v5);
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[QPQueryParserManager available].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    v2 = 0;
    goto LABEL_10;
  }
  return 1;
}

- (void)updateWithOptions:(id)a3
{
  id v4;
  const __CFURL *v5;
  NSLocale *v6;
  NSLocale *originalLocale;
  NSArray *v8;
  NSArray *originalPreferredLocales;
  void *parser;
  void *v11;
  const __CFURL *v12;
  NSURL *v13;
  NSURL *originalCustomResourceDirectory;
  const __CFDate *v15;
  NSDate *v16;
  NSDate *originalDate;
  void *v18;
  uint8_t buf[4];
  const __CFURL *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    QPQueryParserGetLocale((uint64_t)self->_parser);
    v6 = (NSLocale *)objc_claimAutoreleasedReturnValue();
    originalLocale = self->_originalLocale;
    self->_originalLocale = v6;

    QPQueryParserGetPreferredLanguages((uint64_t)self->_parser);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    originalPreferredLocales = self->_originalPreferredLocales;
    self->_originalPreferredLocales = v8;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_218E10000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "QueryParserManager: updating locale %@", buf, 0xCu);
    }
    parser = self->_parser;
    -[__CFURL languageCode](v5, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    QPQueryParserSetLocale((uint64_t)parser, v5, (const __CFArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1));

    objc_storeStrong((id *)&self->_currentLocale, v5);
    self->_modelIsLoaded = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", kQPQueryParserOptionCustomResourceDirectoryKey);
  v12 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    QPQueryParserGetCustomResourceDirectory((uint64_t)self->_parser);
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originalCustomResourceDirectory = self->_originalCustomResourceDirectory;
    self->_originalCustomResourceDirectory = v13;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl(&dword_218E10000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "QueryParserManager: updating resource directory %@", buf, 0xCu);
    }
    QPQueryParserSetCustomResourceDirectory((QP::ParserConfiguration *)self->_parser, v12);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceDate"));
  v15 = (const __CFDate *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    QPQueryParserGetReferenceDate((uint64_t)self->_parser);
    v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    originalDate = self->_originalDate;
    self->_originalDate = v16;

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v15;
      _os_log_impl(&dword_218E10000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "QueryParserManager: updating date %@", buf, 0xCu);
    }
    QPQueryParserSetReferenceDate((uint64_t)self->_parser, v15);
  }
  QPQueryParserSetOptions((uint64_t)self->_parser, (CFDictionaryRef)v4);

}

- (void)reset
{
  NSLocale *originalLocale;
  NSLocale *v4;
  NSDate *originalDate;
  NSDate *v6;
  NSURL *originalCustomResourceDirectory;
  NSURL *v8;

  originalLocale = self->_originalLocale;
  if (originalLocale)
  {
    objc_storeStrong((id *)&self->_currentLocale, originalLocale);
    self->_modelIsLoaded = 0;
    QPQueryParserSetLocale((uint64_t)self->_parser, (const __CFLocale *)self->_originalLocale, (const __CFArray *)self->_originalPreferredLocales);
    QPQueryParserSetUseSystemLocale((QP::QueryParserEngine *)self->_parser, (const __CFBoolean *)*MEMORY[0x24BDBD270]);
    v4 = self->_originalLocale;
    self->_originalLocale = 0;

    self->_modelIsLoaded = -[QPQueryParserManager available](self, "available");
  }
  originalDate = self->_originalDate;
  if (originalDate)
  {
    QPQueryParserSetReferenceDate((uint64_t)self->_parser, (const __CFDate *)originalDate);
    v6 = self->_originalDate;
    self->_originalDate = 0;

  }
  originalCustomResourceDirectory = self->_originalCustomResourceDirectory;
  if (originalCustomResourceDirectory)
  {
    QPQueryParserSetCustomResourceDirectory((QP::ParserConfiguration *)self->_parser, (const __CFURL *)originalCustomResourceDirectory);
    v8 = self->_originalCustomResourceDirectory;
    self->_originalCustomResourceDirectory = 0;

  }
}

- (id)dateFromParseAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPDateDisplay"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPDateType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPDateModifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPDateComponents"));
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPStartDateComponents"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPEndDateComponents"));
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kQPFrequencyDateComponents"));
    v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("kQPDateDisplay"));
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("kQPDateType"));
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("kQPDateModifier"));
    if (v8)
    {
      dateComponentsForDate(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("kQPDateComponents"));

    }
    if (v9)
    {
      dateComponentsForDate(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("kQPStartDateComponents"));

    }
    if (v10)
    {
      dateComponentsForDate(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("kQPEndDateComponents"));

    }
    if (v11)
    {
      dateComponentsForDate(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("kQPFrequencyDateComponents"));

    }
  }

  return v4;
}

- (void)enumerateDateParseResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD, char *);
  QPDataDetectorsParser *dateParser;
  char v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD, char *))a5;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__12;
  v18 = __Block_byref_object_dispose__12;
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);
  dateParser = self->_dateParser;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __77__QPQueryParserManager_enumerateDateParseResultsForString_options_withBlock___block_invoke;
  v13[3] = &unk_24DA26A60;
  v13[4] = self;
  v13[5] = &v14;
  -[QPDataDetectorsParser enumerateDatesInString:options:withBlock:](dateParser, "enumerateDatesInString:options:withBlock:", v8, v9, v13);
  v12 = 0;
  v10[2](v10, v15[5], MEMORY[0x24BDBD1B8], &v12);
  _Block_object_dispose(&v14, 8);

}

void __77__QPQueryParserManager_enumerateDateParseResultsForString_options_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dateFromParseAttributes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v11 = CFSTR("kQPDate");
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributes:range:", v10, a3, a4);

}

- (void)enumerateParseResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  unsigned __int8 v17;
  _QWORD block[4];
  id v19;
  QPQueryParserManager *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && self->_parser && objc_msgSend(v8, "length"))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__12;
    v40 = __Block_byref_object_dispose__12;
    v41 = (id)objc_opt_new();
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__12;
    v34 = __Block_byref_object_dispose__12;
    v35 = (id)objc_opt_new();
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke;
    block[3] = &unk_24DA26AB0;
    v19 = v9;
    v20 = self;
    v23 = &v26;
    v21 = v8;
    v12 = v10;
    v22 = v12;
    v24 = &v36;
    v25 = &v30;
    dispatch_sync(queue, block);
    if (*((_BYTE *)v27 + 24))
    {
      v13 = 0;
      v17 = 0;
      do
      {
        if (v13 >= objc_msgSend((id)v37[5], "count"))
          break;
        objc_msgSend((id)v37[5], "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v31[5], "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void *, unsigned __int8 *))v12 + 2))(v12, v14, v15, &v17);
        v16 = v17;

        ++v13;
      }
      while (!v16);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }

}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  __CFDictionary *v16;
  _QWORD v17[5];
  __int128 v18;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forTesting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "updateWithOptions:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "available");
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v5)
      __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
    v14 = *(_QWORD *)(a1 + 40);
    v13 = *(const __CFString **)(a1 + 48);
    v15 = *(_QWORD *)(v14 + 8);
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_115;
    v17[3] = &unk_24DA26A88;
    v17[4] = v14;
    v18 = *(_OWORD *)(a1 + 72);
    QPQueryParserEnumerateParses(v15, v13, (uint64_t)v17);
    if (v3)
LABEL_7:
      objc_msgSend(*(id *)(a1 + 40), "reset");
  }
  else
  {
    if (v5)
      __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    v16 = QPQueryParserCopyOptions(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(*(id *)(a1 + 40), "enumerateDateParseResultsForString:options:withBlock:", *(_QWORD *)(a1 + 48), v16, *(_QWORD *)(a1 + 56));

    if (v3)
      goto LABEL_7;
  }
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_115(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_msgSend(a2, "objectForKey:", kQPParseResultAttributedParseKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v5 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v3, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v5, "initWithString:", v6);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_2;
  v7[3] = &unk_24DA26A60;
  v7[4] = a1[4];
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  if (objc_msgSend((id)v9[5], "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v9[5]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", MEMORY[0x24BDBD1B8]);
  }
  _Block_object_dispose(&v8, 8);

}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromParseAttributes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = CFSTR("kQPDate");
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributes:range:", v13, a3, a4);

  }
  else if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAttributes:range:", v7, a3, a4);
  }

}

- (void)enumerateSpotlightResultsForString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  _QWORD block[4];
  id v13;
  QPQueryParserManager *v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && self->_parser && objc_msgSend(v8, "length"))
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke;
    block[3] = &unk_24DA26B00;
    v13 = v9;
    v14 = self;
    v17 = v18;
    v15 = v8;
    v16 = v10;
    dispatch_sync(queue, block);

    _Block_object_dispose(v18, 8);
  }

}

void __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, _BYTE *);
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forTesting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "updateWithOptions:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "available");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v15 = 0;
    v4 = *(const __CFString **)(a1 + 48);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke_2;
    v11 = &unk_24DA26AD8;
    v12 = *(id *)(a1 + 56);
    v13 = v14;
    QPQueryParserEnumerateParses(v5, v4, (uint64_t)&v8);

    _Block_object_dispose(v14, 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forTesting"), v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "reset");
}

uint64_t __77__QPQueryParserManager_enumerateSpotlightResultsForString_options_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateParseResultsForStartDateString:(id)a3 startDateContext:(id)a4 endDateString:(id)a5 endDateContext:(id)a6 options:(id)a7 withBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, void *, _BYTE *);
  uint64_t v20;
  NSObject *queue;
  unint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  unsigned __int8 v27;
  _QWORD block[4];
  id v29;
  QPQueryParserManager *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *, void *, _BYTE *))a8;
  if (v14)
  {
    if (self->_parser)
    {
      v20 = objc_msgSend(v14, "length");
      if (v16)
      {
        if (v20 && objc_msgSend(v16, "length"))
        {
          v26 = v15;
          v48 = 0;
          v49 = &v48;
          v50 = 0x3032000000;
          v51 = __Block_byref_object_copy__12;
          v52 = __Block_byref_object_dispose__12;
          v53 = (id)objc_opt_new();
          v42 = 0;
          v43 = &v42;
          v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__12;
          v46 = __Block_byref_object_dispose__12;
          v47 = (id)objc_opt_new();
          v38 = 0;
          v39 = &v38;
          v40 = 0x2020000000;
          v41 = 0;
          queue = self->_queue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke;
          block[3] = &unk_24DA26B28;
          v29 = v18;
          v30 = self;
          v35 = &v38;
          v31 = v14;
          v32 = v15;
          v33 = v16;
          v34 = v17;
          v36 = &v48;
          v37 = &v42;
          dispatch_sync(queue, block);
          if (*((_BYTE *)v39 + 24))
          {
            v22 = 0;
            v27 = 0;
            do
            {
              if (v22 >= objc_msgSend((id)v49[5], "count", v26))
                break;
              objc_msgSend((id)v49[5], "objectAtIndexedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v43[5], "objectAtIndexedSubscript:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v19[2](v19, v23, v24, &v27);
              v25 = v27;

              ++v22;
            }
            while (!v25);
            v15 = v26;
          }

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(&v42, 8);

          _Block_object_dispose(&v48, 8);
        }
      }
    }
  }

}

void __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const __CFString *v8;
  const __CFDictionary *v9;
  void *v10;
  int v11;
  _QWORD v12[5];
  __int128 v13;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forTesting"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "updateWithOptions:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "available");
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(const __CFString **)(a1 + 48);
    v6 = *(_QWORD *)(v5 + 8);
    v7 = *(const __CFDictionary **)(a1 + 56);
    v8 = *(const __CFString **)(a1 + 64);
    v9 = *(const __CFDictionary **)(a1 + 72);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_2;
    v12[3] = &unk_24DA26A88;
    v12[4] = v5;
    v13 = *(_OWORD *)(a1 + 88);
    QPQueryParserEnumerateParsesForStartAndEndDates(v6, v4, v7, v8, v9, (uint64_t)v12);
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("forTesting"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    objc_msgSend(*(id *)(a1 + 40), "reset");
}

void __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_msgSend(a2, "objectForKey:", kQPParseResultAttributedParseKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v5 = objc_alloc(MEMORY[0x24BDD1688]);
  objc_msgSend(v3, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v5, "initWithString:", v6);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_3;
  v7[3] = &unk_24DA26A60;
  v7[4] = a1[4];
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0, v7);
  if (objc_msgSend((id)v9[5], "length"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v9[5]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", MEMORY[0x24BDBD1B8]);
  }
  _Block_object_dispose(&v8, 8);

}

void __128__QPQueryParserManager_enumerateParseResultsForStartDateString_startDateContext_endDateString_endDateContext_options_withBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("kQPDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromParseAttributes:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v14 = CFSTR("kQPDate");
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributes:range:", v13, a3, a4);

  }
  else if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAttributes:range:", v7, a3, a4);
  }

}

- (id)embeddingForString:(id)a3
{
  __CFString *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  void *v7;

  v4 = (__CFString *)a3;
  if (-[__CFString length](v4, "length")
    && (v5 = QPQueryParserCopyInputAttributes((uint64_t)self->_parser, v4, 0), (v6 = v5) != 0))
  {
    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("embeddingResultKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)preheat
{
  void *parser;

  parser = self->_parser;
  if (parser)
    QPQueryParserPreheat((uint64_t)parser);
}

- (void)cooldown
{
  QP::Embedder *parser;

  parser = (QP::Embedder *)self->_parser;
  if (parser)
    QPQueryParserCooldown(parser);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCustomResourceDirectory, 0);
  objc_storeStrong((id *)&self->_originalPreferredLocales, 0);
  objc_storeStrong((id *)&self->_originalLocale, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dateParser, 0);
}

- (void)available
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_218E10000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "QueryParserManager: resources unavailable for %@", (uint8_t *)&v1, 0xCu);
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_218E10000, MEMORY[0x24BDACB70], a3, "QueryParserManager: default date parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __73__QPQueryParserManager_enumerateParseResultsForString_options_withBlock___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_218E10000, MEMORY[0x24BDACB70], a3, "QueryParserManager: nlp parsing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
