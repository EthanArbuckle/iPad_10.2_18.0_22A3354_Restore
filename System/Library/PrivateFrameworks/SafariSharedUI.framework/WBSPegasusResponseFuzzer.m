@implementation WBSPegasusResponseFuzzer

+ (WBSPegasusResponseFuzzer)sharedFuzzer
{
  if (sharedFuzzer_onceToken != -1)
    dispatch_once(&sharedFuzzer_onceToken, &__block_literal_global_32);
  return (WBSPegasusResponseFuzzer *)(id)sharedFuzzer_sharedFuzzer;
}

void __40__WBSPegasusResponseFuzzer_sharedFuzzer__block_invoke()
{
  WBSPegasusResponseFuzzer *v0;
  void *v1;

  v0 = objc_alloc_init(WBSPegasusResponseFuzzer);
  v1 = (void *)sharedFuzzer_sharedFuzzer;
  sharedFuzzer_sharedFuzzer = (uint64_t)v0;

}

+ (id)_protectedFields
{
  if (_protectedFields_onceToken != -1)
    dispatch_once(&_protectedFields_onceToken, &__block_literal_global_6);
  return (id)_protectedFields__protectedFields;
}

void __44__WBSPegasusResponseFuzzer__protectedFields__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithArray:", MEMORY[0x1E0C9AA60]);
  v2 = (void *)_protectedFields__protectedFields;
  _protectedFields__protectedFields = v1;

}

- (WBSPegasusResponseFuzzer)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  WBSParsecDSession *v10;
  WBSParsecDSession *v11;
  WBSPegasusResponseFuzzer *v12;
  WBSParsecDSession *v13;
  WBSParsecDSession *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arguments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v9, "safari_hasPrefix:", CFSTR("PegasusResponseFuzzer")) & 1) != 0
          || (objc_msgSend(v9, "safari_hasPrefix:", CFSTR("PegasusResponseRegression")) & 1) != 0)
        {
          v13 = [WBSParsecDSession alloc];
          +[WBSParsecDSession sharedPARSession](WBSParsecDSession, "sharedPARSession");
          v11 = (WBSParsecDSession *)objc_claimAutoreleasedReturnValue();
          v14 = -[WBSParsecDSession initWithParsecdSession:skipAutoFillDataUpdates:](v13, "initWithParsecdSession:skipAutoFillDataUpdates:", v11, 1);
          v12 = -[WBSPegasusResponseFuzzer initWithParsecSession:sampleResponsesPlistKey:](self, "initWithParsecSession:sampleResponsesPlistKey:", v14, v9);

          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = [WBSParsecDSession alloc];
  +[WBSParsecDSession sharedPARSession](WBSParsecDSession, "sharedPARSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSParsecDSession initWithParsecdSession:skipAutoFillDataUpdates:](v10, "initWithParsecdSession:skipAutoFillDataUpdates:", v4, 1);
  v12 = -[WBSPegasusResponseFuzzer initWithParsecSession:sampleResponsesPlistKey:](self, "initWithParsecSession:sampleResponsesPlistKey:", v11, &stru_1E5449658);
LABEL_12:

  return v12;
}

- (WBSPegasusResponseFuzzer)initWithParsecSession:(id)a3 sampleResponsesPlistKey:(id)a4
{
  id v7;
  id v8;
  WBSPegasusResponseFuzzer *v9;
  WBSPegasusResponseFuzzer *v10;
  uint64_t v11;
  NSArray *validJSONPARResponse;
  id v13;
  NSArray *v14;
  void *v15;
  uint64_t v16;
  WBSJSONMutator *jsonMutator;
  void *v18;
  NSArray *v19;
  void *v20;
  uint64_t v21;
  PARResponse *currentResponse;
  WBSPegasusResponseFuzzer *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSPegasusResponseFuzzer;
  v9 = -[WBSPegasusResponseFuzzer init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parsecSession, a3);
    v10->_indexOfCurrentResponse = 0;
    -[WBSPegasusResponseFuzzer _validPegasusResponseForKey:](v10, "_validPegasusResponseForKey:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    validJSONPARResponse = v10->_validJSONPARResponse;
    v10->_validJSONPARResponse = (NSArray *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D8A140]);
    v14 = v10->_validJSONPARResponse;
    +[WBSPegasusResponseFuzzer _protectedFields](WBSPegasusResponseFuzzer, "_protectedFields");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithSource:protectedFields:", v14, v15);
    jsonMutator = v10->_jsonMutator;
    v10->_jsonMutator = (WBSJSONMutator *)v16;

    v18 = (void *)MEMORY[0x1E0D177B8];
    v19 = v10->_validJSONPARResponse;
    -[WBSParsecDSession parsecdSession](v10->_parsecSession, "parsecdSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "responseFromJSON:session:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    currentResponse = v10->_currentResponse;
    v10->_currentResponse = (PARResponse *)v21;

    v10->_shouldAttachMutatedJSONToTestResultKeys = objc_msgSend(v8, "safari_hasPrefix:", CFSTR("PegasusResponseFuzzer"));
    v23 = v10;
  }

  return v10;
}

- (id)responseForQuery:(id)a3
{
  PARResponse *v5;
  void *v6;
  id lastSimulatedJSON;
  id v8;
  void *v9;
  void *v10;
  PARResponse *v11;
  PARResponse *currentResponse;

  v5 = self->_currentResponse;
  if (objc_msgSend(a3, "isEqualToString:", self->_query))
  {
    if (self->_shouldAttachMutatedJSONToTestResultKeys)
      -[WBSPegasusResponseFuzzer _recordMutatedPegasusResponseJSON](self, "_recordMutatedPegasusResponseJSON");
    -[WBSJSONMutator mutatedJSONProtectingRootObject:](self->_jsonMutator, "mutatedJSONProtectingRootObject:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    lastSimulatedJSON = self->_lastSimulatedJSON;
    self->_lastSimulatedJSON = v6;
    v8 = v6;

    v9 = (void *)MEMORY[0x1E0D177B8];
    -[WBSParsecDSession parsecdSession](self->_parsecSession, "parsecdSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "responseFromJSON:session:", v8, v10);
    v11 = (PARResponse *)objc_claimAutoreleasedReturnValue();
    currentResponse = self->_currentResponse;
    self->_currentResponse = v11;

  }
  return v5;
}

- (void)_recordMutatedPegasusResponseJSON
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Couldn't serialize mutated JSON for logging", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (id)_validPegasusResponseForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *query;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "safari_safariSharedBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("SafariPegasusResponseFuzzerSampleInputs"), CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("query"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  self->_query = v10;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sampleJSON"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v13, 0, &v21);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    if (v15)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WBSPegasusResponseFuzzer _validPegasusResponseForKey:].cold.2();
      v17 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
        v19 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v19;
      }
      objc_storeStrong(&self->_lastSimulatedJSON, v14);
      v14 = v14;
      v17 = v14;
    }

  }
  else
  {
    v18 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WBSPegasusResponseFuzzer _validPegasusResponseForKey:].cold.1();
    v17 = 0;
  }

  return v17;
}

- (WBSParsecDSession)parsecSession
{
  return self->_parsecSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSession, 0);
  objc_storeStrong(&self->_lastSimulatedJSON, 0);
  objc_storeStrong((id *)&self->_jsonMutator, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);
  objc_storeStrong((id *)&self->_validJSONPARResponse, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)_validPegasusResponseForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Couldn't retrieve JSON from file while trying to fuzz search results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_validPegasusResponseForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Couldn't serialize JSON while trying to fuzz search results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
