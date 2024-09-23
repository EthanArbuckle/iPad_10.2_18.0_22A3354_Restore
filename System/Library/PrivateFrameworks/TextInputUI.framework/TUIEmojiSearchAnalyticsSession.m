@implementation TUIEmojiSearchAnalyticsSession

- (TUIEmojiSearchAnalyticsSession)initWithLocale:(id)a3
{
  id v5;
  TUIEmojiSearchAnalyticsSession *v6;
  TUIEmojiSearchAnalyticsSession *v7;
  uint64_t v8;
  NSString *initialInputModeIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIEmojiSearchAnalyticsSession;
  v6 = -[TUIEmojiSearchAnalyticsSession init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    objc_msgSend((id)objc_opt_class(), "currentInputModeIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    initialInputModeIdentifier = v7->_initialInputModeIdentifier;
    v7->_initialInputModeIdentifier = (NSString *)v8;

  }
  return v7;
}

- (void)beginSessionWithInitialSearchQuery:(id)a3
{
  NSString *v4;
  NSString *trackedSearchQuery;
  NSString *v6;
  unint64_t v7;

  v4 = (NSString *)a3;
  objc_msgSend((id)objc_opt_class(), "registerEventSpecIfNecessary");
  trackedSearchQuery = self->_trackedSearchQuery;
  self->_trackedSearchQuery = v4;
  v6 = v4;

  v7 = -[NSString length](v6, "length");
  self->_numberOfInitialCharacters = v7;
  -[TUIAnalyticsSession beginSession](self, "beginSession");
}

- (void)emojiInserted:(id)a3
{
  ++self->_numberOfEmojiInserted;
}

- (void)searchQueryWasChangedTo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  NSString *trackedSearchQuery;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 - -[NSString length](self->_trackedSearchQuery, "length");
  if (v6 < 1)
  {
    if ((v6 & 0x8000000000000000) == 0)
      goto LABEL_5;
    v7 = 64;
    v8 = (objc_class *)(self->_numberOfCharactersDeleted - v6);
  }
  else
  {
    v7 = 56;
    v8 = (objc_class *)(self->_numberOfCharactersInserted + v6);
  }
  *(Class *)((char *)&self->super.super.isa + v7) = v8;
LABEL_5:
  trackedSearchQuery = self->_trackedSearchQuery;
  self->_trackedSearchQuery = (NSString *)v4;

}

- (void)clearButtonPressed
{
  ++self->_numberOfClearActions;
}

- (void)endSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[TUIAnalyticsSession isSessionActive](self, "isSessionActive"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "emojiSearchFieldSpecTuples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v9, "key");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIEmojiSearchAnalyticsSession valueForKey:](self, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(v9, "key");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUIEmojiSearchAnalyticsSession setValue:forKey:](self, "setValue:forKey:", &unk_1E2517248, v12);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }
    v13 = self->_initialInputModeIdentifier;
    objc_msgSend((id)objc_opt_class(), "preferredEventName:", CFSTR("emojiSearchSession"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dispatchEventWithName:values:inputMode:", v14, v3, v13);

  }
  v16.receiver = self;
  v16.super_class = (Class)TUIEmojiSearchAnalyticsSession;
  -[TUIAnalyticsSession endSession](&v16, sel_endSession);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialInputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_trackedSearchQuery, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (id)emojiSearchFieldSpecTuples
{
  if (emojiSearchFieldSpecTuples_onceToken != -1)
    dispatch_once(&emojiSearchFieldSpecTuples_onceToken, &__block_literal_global_1307);
  return (id)emojiSearchFieldSpecTuples_tuples;
}

+ (void)registerEventSpecIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__TUIEmojiSearchAnalyticsSession_registerEventSpecIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerEventSpecIfNecessary_onceToken != -1)
    dispatch_once(&registerEventSpecIfNecessary_onceToken, block);
}

void __62__TUIEmojiSearchAnalyticsSession_registerEventSpecIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "emojiSearchFieldSpecTuples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allFieldSpecs");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "preferredEventName:", CFSTR("emojiSearchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB18], "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("emojiSearchSession"), 1, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerEventSpec:", v4);

  v6 = (void *)registerEventSpecIfNecessary_eventSpec;
  registerEventSpecIfNecessary_eventSpec = v4;

}

void __60__TUIEmojiSearchAnalyticsSession_emojiSearchFieldSpecTuples__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("emojiInserted"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[FieldSpecTuple tupleWithKey:eventSpec:](FieldSpecTuple, "tupleWithKey:eventSpec:", CFSTR("numberOfEmojiInserted"), v13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v0;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("initialCharacters"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[FieldSpecTuple tupleWithKey:eventSpec:](FieldSpecTuple, "tupleWithKey:eventSpec:", CFSTR("numberOfInitialCharacters"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v2;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("charactersInserted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FieldSpecTuple tupleWithKey:eventSpec:](FieldSpecTuple, "tupleWithKey:eventSpec:", CFSTR("numberOfCharactersInserted"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v4;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("charactersDeleted"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FieldSpecTuple tupleWithKey:eventSpec:](FieldSpecTuple, "tupleWithKey:eventSpec:", CFSTR("numberOfCharactersDeleted"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("clearActions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FieldSpecTuple tupleWithKey:eventSpec:](FieldSpecTuple, "tupleWithKey:eventSpec:", CFSTR("numberOfClearActions"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "orderedSetWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)emojiSearchFieldSpecTuples_tuples;
  emojiSearchFieldSpecTuples_tuples = v10;

}

@end
