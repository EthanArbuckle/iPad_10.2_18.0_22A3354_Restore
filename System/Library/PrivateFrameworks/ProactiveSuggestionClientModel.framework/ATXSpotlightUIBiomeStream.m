@implementation ATXSpotlightUIBiomeStream

- (NSString)identifier
{
  return (NSString *)CFSTR("spotlightUI");
}

- (ATXSpotlightUIBiomeStream)init
{
  return -[ATXSpotlightUIBiomeStream initWithStoreConfig:](self, "initWithStoreConfig:", 0);
}

- (ATXSpotlightUIBiomeStream)initWithStoreConfig:(id)a3
{
  id v4;
  ATXSpotlightUIBiomeStream *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BMStoreStream *inner;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXSpotlightUIBiomeStream;
  v5 = -[ATXSpotlightUIBiomeStream init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D024C0], "atx_storeConfig");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", CFSTR("spotlightUI"), v6, objc_opt_class());
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;

  }
  return v5;
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[ATXSpotlightUIBiomeStream source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEvent:", v4);

  __atxlog_handle_metrics();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXSpotlightUIBiomeStream sendEvent:].cold.1(v4, v6);

}

- (id)publisherFromStartTime:(double)a3
{
  return (id)-[BMStoreStream publisherFromStartTime:](self->_inner, "publisherFromStartTime:", a3);
}

- (id)source
{
  return (id)-[BMStoreStream source](self->_inner, "source");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inner, 0);
}

- (void)sendEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[ATXSpotlightUIEvent stringForATXSpotlightUIEventType:](ATXSpotlightUIEvent, "stringForATXSpotlightUIEventType:", objc_msgSend(a1, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "eventType");
  objc_msgSend(a1, "suggestionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionUniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionSubtype");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413570;
  v11 = v4;
  v12 = 2048;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2112;
  v17 = v7;
  v18 = 2112;
  v19 = v8;
  v20 = 2112;
  v21 = v9;
  _os_log_debug_impl(&dword_1AA841000, a2, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXSpotlightUIEvent\n\teventType: %lu\n\tsuggestionType: %@\n\tsuggestionUniqueId: %@\n\tsuggestionSubtype: %@\n\tsuggestionContext: %@", (uint8_t *)&v10, 0x3Eu);

}

@end
