@implementation SUICVoiceSelectionVoiceCollection

- (SUICVoiceSelectionVoiceCollection)initWithLanguageCode:(id)a3 dialectLanguageCodes:(id)a4 currentVoice:(id)a5 alternativeVoices:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SUICVoiceSelectionVoiceCollection *v14;
  uint64_t v15;
  NSString *languageCode;
  uint64_t v17;
  NSArray *dialectLanguageCodes;
  uint64_t v19;
  AFVoiceInfo *currentVoice;
  uint64_t v21;
  NSSet *alternativeVoices;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SUICVoiceSelectionVoiceCollection;
  v14 = -[SUICVoiceSelectionVoiceCollection init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    languageCode = v14->_languageCode;
    v14->_languageCode = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    dialectLanguageCodes = v14->_dialectLanguageCodes;
    v14->_dialectLanguageCodes = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    currentVoice = v14->_currentVoice;
    v14->_currentVoice = (AFVoiceInfo *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", v13, 1);
    alternativeVoices = v14->_alternativeVoices;
    v14->_alternativeVoices = (NSSet *)v21;

  }
  return v14;
}

- (id)randomVoice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[NSSet allObjects](self->_alternativeVoices, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_currentVoice)
    objc_msgSend(v5, "addObject:");
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", (int)arc4random_uniform(objc_msgSend(v5, "count")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
      -[SUICVoiceSelectionVoiceCollection randomVoice].cold.1((uint64_t)self, v7);
    v6 = 0;
  }

  return v6;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSArray)dialectLanguageCodes
{
  return self->_dialectLanguageCodes;
}

- (AFVoiceInfo)currentVoice
{
  return self->_currentVoice;
}

- (NSSet)alternativeVoices
{
  return self->_alternativeVoices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeVoices, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_dialectLanguageCodes, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

- (void)randomVoice
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SUICVoiceSelectionVoiceCollection randomVoice]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1A3752000, a2, OS_LOG_TYPE_ERROR, "%s Zero voices in this collection %@", (uint8_t *)&v2, 0x16u);
}

@end
