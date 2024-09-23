@implementation SROSmartRepliesObjCCompatibilityUtils

+ (id)wrappedMessageForMessage:(id)a3
{
  id v3;
  SROSmartRepliesMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(SROSmartRepliesMessage);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[SROSmartRepliesMessage setTitle:](v4, "setTitle:", v6);

  objc_msgSend(v3, "senderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[SROSmartRepliesMessage setSenderIdentifier:](v4, "setSenderIdentifier:", v8);

  objc_msgSend(v3, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[SROSmartRepliesMessage setSummary:](v4, "setSummary:", v10);

  -[SROSmartRepliesMessage setTapBack:](v4, "setTapBack:", objc_msgSend(v3, "isTapBack"));
  -[SROSmartRepliesMessage setEmote:](v4, "setEmote:", objc_msgSend(v3, "isEmote"));
  -[SROSmartRepliesMessage setRead:](v4, "setRead:", objc_msgSend(v3, "isRead"));
  objc_msgSend(v3, "dateSent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SROSmartRepliesMessage setDateSent:](v4, "setDateSent:", v11);
  return v4;
}

+ (id)messageForWrappedMessage:(id)a3
{
  id v3;
  _TtC12SmartReplies21SRSmartRepliesMessage *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(_TtC12SmartReplies21SRSmartRepliesMessage);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[SRSmartRepliesMessage setTitle:](v4, "setTitle:", v6);

  objc_msgSend(v3, "senderIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[SRSmartRepliesMessage setSenderIdentifier:](v4, "setSenderIdentifier:", v8);

  objc_msgSend(v3, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[SRSmartRepliesMessage setSummary:](v4, "setSummary:", v10);

  -[SRSmartRepliesMessage setIsTapBack:](v4, "setIsTapBack:", objc_msgSend(v3, "isTapBack"));
  -[SRSmartRepliesMessage setIsEmote:](v4, "setIsEmote:", objc_msgSend(v3, "isEmote"));
  -[SRSmartRepliesMessage setIsRead:](v4, "setIsRead:", objc_msgSend(v3, "isRead"));
  objc_msgSend(v3, "dateSent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRSmartRepliesMessage setDateSent:](v4, "setDateSent:", v11);
  return v4;
}

+ (id)wrappedMessagesForMessages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "wrappedMessageForMessage:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)messagesForWrappedMessages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "messageForWrappedMessage:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)wrappedSuggestionForSuggestion:(id)a3
{
  id v4;
  id v5;
  SROSmartRepliesActionSuggestion *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SROSmartRepliesActionSuggestion *v13;
  SROSmartRepliesSuggestion *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = [SROSmartRepliesActionSuggestion alloc];
    v7 = objc_msgSend(v5, "type");
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attribution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isRichSuggestion");
    objc_msgSend(v5, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "wrappedMetadataForMetadata:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SROSmartRepliesActionSuggestion initWithType:title:attribution:isRichSuggestion:metadata:](v6, "initWithType:title:attribution:isRichSuggestion:metadata:", v7, v8, v9, v10, v12);

  }
  else
  {
    v14 = [SROSmartRepliesSuggestion alloc];
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SROSmartRepliesSuggestion initWithTitle:isDynamicSuggestion:](v14, "initWithTitle:isDynamicSuggestion:", v8, objc_msgSend(v4, "isDynamicSuggestion"));
  }

  return v13;
}

+ (id)suggestionForWrappedSuggestion:(id)a3
{
  id v4;
  id v5;
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _TtC12SmartReplies30SRSmartRepliesActionSuggestion *v13;
  _TtC12SmartReplies24SRSmartRepliesSuggestion *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = [_TtC12SmartReplies30SRSmartRepliesActionSuggestion alloc];
    v7 = objc_msgSend(v5, "type");
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attribution");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isRichSuggestion");
    objc_msgSend(v5, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "metadataForWrappedMetadata:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SRSmartRepliesActionSuggestion initWithType:title:attribution:isRichSuggestion:metadata:](v6, "initWithType:title:attribution:isRichSuggestion:metadata:", v7, v8, v9, v10, v12);

  }
  else
  {
    v14 = [_TtC12SmartReplies24SRSmartRepliesSuggestion alloc];
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SRSmartRepliesSuggestion initWithTitle:isDynamicSuggestion:](v14, "initWithTitle:isDynamicSuggestion:", v8, objc_msgSend(v4, "isDynamicSuggestion"));
  }

  return v13;
}

+ (id)wrappedSuggestionsForSuggestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "wrappedSuggestionForSuggestion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)suggestionsForWrappedSuggestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "suggestionForWrappedSuggestion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)wrappedResponseForResponse:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  SROSmartRepliesSuggestionResponse *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "suggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "wrappedSuggestionForSuggestion:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[SROSmartRepliesSuggestionResponse initWithSuggestions:]([SROSmartRepliesSuggestionResponse alloc], "initWithSuggestions:", v5);
  return v12;
}

+ (id)responseForWrappedResponse:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _TtC12SmartReplies32SRSmartRepliesSuggestionResponse *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "suggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "suggestionForWrappedSuggestion:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[SRSmartRepliesSuggestionResponse initWithSuggestions:]([_TtC12SmartReplies32SRSmartRepliesSuggestionResponse alloc], "initWithSuggestions:", v5);
  return v12;
}

+ (id)wrappedRequestForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SROSmartRepliesSuggestionRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "receivedMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrappedMessagesForMessages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SROSmartRepliesSuggestionRequest initWithType:receivedMessages:]([SROSmartRepliesSuggestionRequest alloc], "initWithType:receivedMessages:", 0, v6);
  objc_msgSend(v4, "senderMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wrappedMessagesForMessages:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SROSmartRepliesSuggestionRequest setSenderMessages:](v7, "setSenderMessages:", v9);

  objc_msgSend(v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[SROSmartRepliesSuggestionRequest setContext:](v7, "setContext:", v11);

  objc_msgSend(v4, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[SROSmartRepliesSuggestionRequest setLanguageCode:](v7, "setLanguageCode:", v13);

  objc_msgSend(v4, "languageLastChangedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SROSmartRepliesSuggestionRequest setLanguageLastChangedDate:](v7, "setLanguageLastChangedDate:", v14);

  -[SROSmartRepliesSuggestionRequest setIncludesDynamicSuggestions:](v7, "setIncludesDynamicSuggestions:", objc_msgSend(v4, "includesDynamicSuggestions"));
  objc_msgSend(v4, "requestDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SROSmartRepliesSuggestionRequest setRequestDate:](v7, "setRequestDate:", v15);
  return v7;
}

+ (id)requestForWrappedRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "receivedMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messagesForWrappedMessages:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SRSmartRepliesSuggestionRequest initWithType:receivedMessages:]([_TtC12SmartReplies31SRSmartRepliesSuggestionRequest alloc], "initWithType:receivedMessages:", 0, v6);
  objc_msgSend(v4, "senderMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "messagesForWrappedMessages:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSmartRepliesSuggestionRequest setSenderMessages:](v7, "setSenderMessages:", v9);

  objc_msgSend(v4, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[SRSmartRepliesSuggestionRequest setContext:](v7, "setContext:", v11);

  objc_msgSend(v4, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  -[SRSmartRepliesSuggestionRequest setLanguageCode:](v7, "setLanguageCode:", v13);

  objc_msgSend(v4, "languageLastChangedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSmartRepliesSuggestionRequest setLanguageLastChangedDate:](v7, "setLanguageLastChangedDate:", v14);

  -[SRSmartRepliesSuggestionRequest setIncludesDynamicSuggestions:](v7, "setIncludesDynamicSuggestions:", objc_msgSend(v4, "includesDynamicSuggestions"));
  objc_msgSend(v4, "requestDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSmartRepliesSuggestionRequest setRequestDate:](v7, "setRequestDate:", v15);

  -[SRSmartRepliesSuggestionRequest setIncludeLowConfidenceSuggestions:](v7, "setIncludeLowConfidenceSuggestions:", objc_msgSend(v4, "includeLowConfidenceSuggestions"));
  v16 = objc_msgSend(v4, "skipPopulatingMetadata");

  -[SRSmartRepliesSuggestionRequest setSkipPopulatingMetadata:](v7, "setSkipPopulatingMetadata:", v16);
  return v7;
}

+ (id)wrappedMetadataForMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  SROSmartRepliesActionMetadata *v17;
  SROSmartRepliesActionMetadata *v19;

  v3 = a3;
  v19 = [SROSmartRepliesActionMetadata alloc];
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "hasRichActionType");
  objc_msgSend(v3, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationLatitude");
  v12 = v11;
  objc_msgSend(v3, "locationLongitude");
  v14 = v13;
  objc_msgSend(v3, "imageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "attributionSource");

  v17 = -[SROSmartRepliesActionMetadata initWithType:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:](v19, "initWithType:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:", v4, v5, v6, v7, v8, v9, v12, v14, v10, v15, objc_msgSend(a1, "_wrappedAttributionSourceForAttributionSource:", v16));
  return v17;
}

+ (id)metadataForWrappedMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v17;
  _TtC12SmartReplies28SRSmartRepliesActionMetadata *v19;

  v3 = a3;
  v19 = [_TtC12SmartReplies28SRSmartRepliesActionMetadata alloc];
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "hasRichActionType");
  objc_msgSend(v3, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationLatitude");
  v12 = v11;
  objc_msgSend(v3, "locationLongitude");
  v14 = v13;
  objc_msgSend(v3, "imageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "attributionSource");

  v17 = -[SRSmartRepliesActionMetadata initWithType:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:](v19, "initWithType:title:attribution:stringRepresentation:date:hasRichActionType:url:locationLatitude:locationLongitude:imageName:attributionSource:", v4, v5, v6, v7, v8, v9, v12, v14, v10, v15, objc_msgSend(a1, "_attributionSourceForWrappedAttributionSource:", v16));
  return v17;
}

+ (unint64_t)_wrappedAttributionSourceForAttributionSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 5)
    return 0;
  else
    return a3;
}

+ (int64_t)_attributionSourceForWrappedAttributionSource:(unint64_t)a3
{
  if (a3 - 1 >= 5)
    return 0;
  else
    return a3;
}

@end
