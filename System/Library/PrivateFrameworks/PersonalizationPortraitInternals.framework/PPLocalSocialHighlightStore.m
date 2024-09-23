@implementation PPLocalSocialHighlightStore

+ (id)defaultStore
{
  if (defaultStore__pasOnceToken2_16128 != -1)
    dispatch_once(&defaultStore__pasOnceToken2_16128, &__block_literal_global_16129);
  return (id)defaultStore__pasExprOnceResult_16130;
}

- (id)rankedHighlightsWithLimit:(unint64_t)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  return -[PPSocialHighlightStorage rankedHighlightsWithLimit:client:variant:applicationIdentifiers:error:](self->_storage, "rankedHighlightsWithLimit:client:variant:applicationIdentifiers:error:", a3, a4, a5, a6, a7);
}

- (PPLocalSocialHighlightStore)initWithStorage:(id)a3
{
  id v5;
  PPLocalSocialHighlightStore *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPLocalSocialHighlightStore;
  v6 = -[PPLocalSocialHighlightStore init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerMessagesConsumer:levelOfService:", v6, 1);

    objc_msgSend(MEMORY[0x1E0D80F70], "defaultCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerSafariConsumer:levelOfService:", v6, 1);

    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v6;
}

- (PPLocalSocialHighlightStore)init
{
  void *v3;
  PPLocalSocialHighlightStore *v4;

  v3 = (void *)objc_opt_new();
  if (v3)
  {
    self = -[PPLocalSocialHighlightStore initWithStorage:](self, "initWithStorage:", v3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)rankedHighlightsForSyncedItems:(id)a3 client:(id)a4 variant:(id)a5 applicationIdentifiers:(id)a6 error:(id *)a7
{
  return -[PPSocialHighlightStorage rankedHighlightsForSyncedItems:client:variant:applicationIdentifiers:error:](self->_storage, "rankedHighlightsForSyncedItems:client:variant:applicationIdentifiers:error:", a3, a4, a5, a6, a7);
}

- (id)attributionForIdentifier:(id)a3 error:(id *)a4
{
  return -[PPSocialHighlightStorage attributionForIdentifier:error:](self->_storage, "attributionForIdentifier:error:", a3, a4);
}

- (BOOL)feedbackForHighlight:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  pp_social_highlights_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 138413058;
    v17 = v11;
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_INFO, "PPLocalSocialHighlightStore: feedbackForHighlight: %@ type: %lu client: '%@' variant: '%@'", (uint8_t *)&v16, 0x2Au);
  }

  +[PPSocialHighlightMetrics logFeedbackForHighlight:type:client:](PPSocialHighlightMetrics, "logFeedbackForHighlight:type:client:", v11, a4, v12);
  -[PPSocialHighlightStorage saveFeedbackForHighlightIdentifier:feedbackType:client:variant:](self->_storage, "saveFeedbackForHighlightIdentifier:feedbackType:client:variant:", v11, a4, v12, v13);

  return 1;
}

- (BOOL)feedbackForAttribution:(id)a3 type:(unint64_t)a4 client:(id)a5 variant:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  pp_social_highlights_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 138413058;
    v17 = v11;
    v18 = 2048;
    v19 = a4;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_INFO, "PPLocalSocialHighlightStore: feedbackForAttribution: %@ type: %lu client: '%@' variant: '%@'", (uint8_t *)&v16, 0x2Au);
  }

  +[PPSocialHighlightMetrics logFeedbackForAttribution:type:client:](PPSocialHighlightMetrics, "logFeedbackForAttribution:type:client:", v11, a4, v12);
  -[PPSocialHighlightStorage saveAttributionFeedbackForAttributionIdentifier:feedbackType:client:variant:](self->_storage, "saveAttributionFeedbackForAttributionIdentifier:feedbackType:client:variant:", v11, a4, v12, v13);

  return 1;
}

- (id)consumerName
{
  return CFSTR("com.apple.proactive.PersonalizationPortrait.SocialHighlightStore");
}

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PPSocialHighlightStorage *storage;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0D70E68];
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isEqual:", v6);

  if ((_DWORD)v5)
  {
    v7 = *MEMORY[0x1E0D70E10];
    v26[0] = *MEMORY[0x1E0D70DF8];
    v26[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
          storage = self->_storage;
          v15 = objc_alloc(MEMORY[0x1E0D80FC0]);
          v16 = (void *)objc_msgSend(v15, "initWithBundleIdentifier:", v13, (_QWORD)v21);
          -[PPSocialHighlightStorage deleteDataDerivedFromContentMatchingRequest:](storage, "deleteDataDerivedFromContentMatchingRequest:", v16);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

  }
  else
  {
    v17 = (void *)*MEMORY[0x1E0D70E28];
    objc_msgSend(v4, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v17, "isEqual:", v18);

    if ((_DWORD)v17)
      -[PPSocialHighlightStorage deleteDataDerivedFromContentMatchingRequest:](self->_storage, "deleteDataDerivedFromContentMatchingRequest:", v4);
  }
  objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0, (_QWORD)v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)consumeSafariContentWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
}

- (id)consumeMessagesContentWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D80F78], "successWithNumberOfExtractions:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

void __43__PPLocalSocialHighlightStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_16130;
  defaultStore__pasExprOnceResult_16130 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
