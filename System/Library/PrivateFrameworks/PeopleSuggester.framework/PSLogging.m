@implementation PSLogging

void __28___PSLogging_generalChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "general");
  v1 = (void *)generalChannel_generalChannel;
  generalChannel_generalChannel = (uint64_t)v0;

  if (!generalChannel_generalChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __28___PSLogging_generalChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35___PSLogging_messagePinningChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "messagePinning");
  v1 = (void *)messagePinningChannel_messagePinningChannel;
  messagePinningChannel_messagePinningChannel = (uint64_t)v0;

  if (!messagePinningChannel_messagePinningChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __35___PSLogging_messagePinningChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __38___PSLogging_familyRecommenderChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "family");
  v1 = (void *)familyRecommenderChannel_generalChannel;
  familyRecommenderChannel_generalChannel = (uint64_t)v0;

  if (!familyRecommenderChannel_generalChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __38___PSLogging_familyRecommenderChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __31___PSLogging_heuristicsChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "heuristic");
  v1 = (void *)heuristicsChannel_heuristicsChannel;
  heuristicsChannel_heuristicsChannel = (uint64_t)v0;

  if (!heuristicsChannel_heuristicsChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __31___PSLogging_heuristicsChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __33___PSLogging_coreBehaviorChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "CoreBehavior");
  v1 = (void *)coreBehaviorChannel_coreBehaviorChannel;
  coreBehaviorChannel_coreBehaviorChannel = (uint64_t)v0;

  if (!coreBehaviorChannel_coreBehaviorChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __33___PSLogging_coreBehaviorChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __24___PSLogging_knnChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "Knn");
  v1 = (void *)knnChannel_knnChannel;
  knnChannel_knnChannel = (uint64_t)v0;

  if (!knnChannel_knnChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __24___PSLogging_knnChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __29___PSLogging_feedbackChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "feedback");
  v1 = (void *)feedbackChannel_feedbackChannel;
  feedbackChannel_feedbackChannel = (uint64_t)v0;

  if (!feedbackChannel_feedbackChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __29___PSLogging_feedbackChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __35___PSLogging_shareExtensionChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "shareextension");
  v1 = (void *)shareExtensionChannel_shareExtensionChannel;
  shareExtensionChannel_shareExtensionChannel = (uint64_t)v0;

  if (!shareExtensionChannel_shareExtensionChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __35___PSLogging_shareExtensionChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __34___PSLogging_mediaAnalysisChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "mediaanalysis");
  v1 = (void *)mediaAnalysisChannel_mediaAnalysisChannel;
  mediaAnalysisChannel_mediaAnalysisChannel = (uint64_t)v0;

  if (!mediaAnalysisChannel_mediaAnalysisChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __34___PSLogging_mediaAnalysisChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __37___PSLogging_contactEmbeddingChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "contactEmbedding");
  v1 = (void *)contactEmbeddingChannel_contactEmbeddingChannel;
  contactEmbeddingChannel_contactEmbeddingChannel = (uint64_t)v0;

  if (!contactEmbeddingChannel_contactEmbeddingChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __37___PSLogging_contactEmbeddingChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __38___PSLogging_featureGenerationChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "featureGeneration");
  v1 = (void *)featureGenerationChannel_featureGenerationChannel;
  featureGenerationChannel_featureGenerationChannel = (uint64_t)v0;

  if (!featureGenerationChannel_featureGenerationChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __38___PSLogging_featureGenerationChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __28___PSLogging_rewriteChannel__block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.PeopleSuggester", "PeopleSuggesterRewrite");
  v1 = (void *)rewriteChannel_rewriteChannel;
  rewriteChannel_rewriteChannel = (uint64_t)v0;

  if (!rewriteChannel_rewriteChannel)
  {
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v2)
      __28___PSLogging_rewriteChannel__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __32___PSLogging_suggestionSignpost__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PeopleSuggester", "signpost");
  v1 = (void *)suggestionSignpost_suggestionSignpost;
  suggestionSignpost_suggestionSignpost = (uint64_t)v0;

}

void __28___PSLogging_generalChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t generalChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __35___PSLogging_messagePinningChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t messagePinningChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __38___PSLogging_familyRecommenderChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t familyrecommenderChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __31___PSLogging_heuristicsChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t heuristicsChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __33___PSLogging_coreBehaviorChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t coreBehaviorChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __24___PSLogging_knnChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t knnChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __29___PSLogging_feedbackChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t feedbackChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __35___PSLogging_shareExtensionChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t shareExtensionChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __34___PSLogging_mediaAnalysisChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t mediaanalysis", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __37___PSLogging_contactEmbeddingChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t contactEmbeddingChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __38___PSLogging_featureGenerationChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t featureGeneration", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __28___PSLogging_rewriteChannel__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Couldn't create os_log_t rewriteChannel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

@end
