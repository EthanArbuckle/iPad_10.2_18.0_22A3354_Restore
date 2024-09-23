@implementation SROSmartRepliesSuggestionRequest

- (SROSmartRepliesSuggestionRequest)initWithType:(unint64_t)a3 receivedMessages:(id)a4
{
  id v6;
  SROSmartRepliesSuggestionRequest *v7;
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *v8;
  void *v9;
  uint64_t v10;
  _TtC12SmartReplies31SRSmartRepliesSuggestionRequest *underlyingRequest;
  SROSmartRepliesSuggestionRequest *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SROSmartRepliesSuggestionRequest;
  v7 = -[SROSmartRepliesSuggestionRequest init](&v14, sel_init);
  if (v7)
  {
    v8 = [_TtC12SmartReplies31SRSmartRepliesSuggestionRequest alloc];
    objc_msgSend((id)objc_opt_class(), "_unwrappedMessagesForWrappedMessages:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SRSmartRepliesSuggestionRequest initWithType:receivedMessages:](v8, "initWithType:receivedMessages:", a3, v9);
    underlyingRequest = v7->_underlyingRequest;
    v7->_underlyingRequest = (_TtC12SmartReplies31SRSmartRepliesSuggestionRequest *)v10;

    v12 = v7;
  }

  return v7;
}

- (unint64_t)type
{
  return -[SRSmartRepliesSuggestionRequest type](self->_underlyingRequest, "type");
}

- (NSArray)receivedMessages
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[SRSmartRepliesSuggestionRequest receivedMessages](self->_underlyingRequest, "receivedMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_wrappedMessagesForUnwrappedMessages:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setReceivedMessages:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_unwrappedMessagesForWrappedMessages:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SRSmartRepliesSuggestionRequest setReceivedMessages:](self->_underlyingRequest, "setReceivedMessages:", v5);
}

- (NSArray)senderMessages
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[SRSmartRepliesSuggestionRequest senderMessages](self->_underlyingRequest, "senderMessages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_wrappedMessagesForUnwrappedMessages:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setSenderMessages:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_unwrappedMessagesForWrappedMessages:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SRSmartRepliesSuggestionRequest setSenderMessages:](self->_underlyingRequest, "setSenderMessages:", v5);
}

- (BOOL)includeLowConfidenceSuggestions
{
  return -[SRSmartRepliesSuggestionRequest includeLowConfidenceSuggestions](self->_underlyingRequest, "includeLowConfidenceSuggestions");
}

- (void)setIncludeLowConfidenceSuggestions:(BOOL)a3
{
  -[SRSmartRepliesSuggestionRequest setIncludeLowConfidenceSuggestions:](self->_underlyingRequest, "setIncludeLowConfidenceSuggestions:", a3);
}

- (NSString)context
{
  return -[SRSmartRepliesSuggestionRequest context](self->_underlyingRequest, "context");
}

- (void)setContext:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SRSmartRepliesSuggestionRequest setContext:](self->_underlyingRequest, "setContext:", v4);

}

- (NSString)languageCode
{
  return -[SRSmartRepliesSuggestionRequest languageCode](self->_underlyingRequest, "languageCode");
}

- (void)setLanguageCode:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[SRSmartRepliesSuggestionRequest setLanguageCode:](self->_underlyingRequest, "setLanguageCode:", v4);

}

- (NSDate)languageLastChangedDate
{
  return -[SRSmartRepliesSuggestionRequest languageLastChangedDate](self->_underlyingRequest, "languageLastChangedDate");
}

- (void)setLanguageLastChangedDate:(id)a3
{
  -[SRSmartRepliesSuggestionRequest setLanguageLastChangedDate:](self->_underlyingRequest, "setLanguageLastChangedDate:", a3);
}

- (BOOL)includesDynamicSuggestions
{
  return -[SRSmartRepliesSuggestionRequest includesDynamicSuggestions](self->_underlyingRequest, "includesDynamicSuggestions");
}

- (void)setIncludesDynamicSuggestions:(BOOL)a3
{
  -[SRSmartRepliesSuggestionRequest setIncludesDynamicSuggestions:](self->_underlyingRequest, "setIncludesDynamicSuggestions:", a3);
}

- (NSDate)requestDate
{
  return -[SRSmartRepliesSuggestionRequest requestDate](self->_underlyingRequest, "requestDate");
}

- (void)setRequestDate:(id)a3
{
  -[SRSmartRepliesSuggestionRequest setRequestDate:](self->_underlyingRequest, "setRequestDate:", a3);
}

+ (id)_wrappedMessagesForUnwrappedMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SROSmartRepliesMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v11 = objc_alloc_init(SROSmartRepliesMessage);
        objc_msgSend(v10, "title", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");
        -[SROSmartRepliesMessage setTitle:](v11, "setTitle:", v13);

        objc_msgSend(v10, "senderIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copy");
        -[SROSmartRepliesMessage setSenderIdentifier:](v11, "setSenderIdentifier:", v15);

        objc_msgSend(v10, "summary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copy");
        -[SROSmartRepliesMessage setSummary:](v11, "setSummary:", v17);

        -[SROSmartRepliesMessage setTapBack:](v11, "setTapBack:", objc_msgSend(v10, "isTapBack"));
        -[SROSmartRepliesMessage setEmote:](v11, "setEmote:", objc_msgSend(v10, "isEmote"));
        -[SROSmartRepliesMessage setRead:](v11, "setRead:", objc_msgSend(v10, "isRead"));
        objc_msgSend(v10, "dateSent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SROSmartRepliesMessage setDateSent:](v11, "setDateSent:", v18);

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_unwrappedMessagesForWrappedMessages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _TtC12SmartReplies21SRSmartRepliesMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v11 = objc_alloc_init(_TtC12SmartReplies21SRSmartRepliesMessage);
        objc_msgSend(v10, "title", (_QWORD)v20);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copy");
        -[SRSmartRepliesMessage setTitle:](v11, "setTitle:", v13);

        objc_msgSend(v10, "senderIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "copy");
        -[SRSmartRepliesMessage setSenderIdentifier:](v11, "setSenderIdentifier:", v15);

        objc_msgSend(v10, "summary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copy");
        -[SRSmartRepliesMessage setSummary:](v11, "setSummary:", v17);

        -[SRSmartRepliesMessage setIsTapBack:](v11, "setIsTapBack:", objc_msgSend(v10, "isTapBack"));
        -[SRSmartRepliesMessage setIsEmote:](v11, "setIsEmote:", objc_msgSend(v10, "isEmote"));
        -[SRSmartRepliesMessage setIsRead:](v11, "setIsRead:", objc_msgSend(v10, "isRead"));
        objc_msgSend(v10, "dateSent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRSmartRepliesMessage setDateSent:](v11, "setDateSent:", v18);

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)skipPopulatingMetadata
{
  return self->_skipPopulatingMetadata;
}

- (void)setSkipPopulatingMetadata:(BOOL)a3
{
  self->_skipPopulatingMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

@end
