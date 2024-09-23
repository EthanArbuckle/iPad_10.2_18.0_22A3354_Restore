@implementation PPTopicStore

- (PPTopicStore)init
{
  PPTopicStore *v3;

  v3 = -[PPXPCTopicStore _init]([PPXPCTopicStore alloc], "_init");

  return v3;
}

- (id)_initFromSubclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPTopicStore;
  return -[PPTopicStore init](&v3, sel_init);
}

- (BOOL)iterRankedTopicsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  __break(1u);
  return (char)v10;
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5
{
  id v6;
  id result;

  v6 = a3;
  result = a4;
  __break(1u);
  return result;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v6;
  id result;

  v6 = a3;
  result = a4;
  __break(1u);
  return result;
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (id)topicExtractionsFromText:(id)a3 error:(id *)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  id v11;
  id v12;
  id v13;

  v11 = a3;
  v12 = a4;
  v13 = a8;
  __break(1u);
  return (char)v13;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v5;

  v5 = a3;
  __break(1u);
  return (char)v5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v5;

  v5 = a3;
  __break(1u);
  return (char)v5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  __break(1u);
  return (char)v11;
}

- (id)cachedTopicScores
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  -[PPTopicStore cachePath:](self, "cachePath:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    +[PPTopicUtils cachedTopicScoresAtPath:](PPTopicUtils, "cachedTopicScoresAtPath:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pp_topics_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_18BE3A000, v5, OS_LOG_TYPE_ERROR, "PPTopicStore: unable to recover cache path over XPC: %@", buf, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

- (void)setClientIdentifier:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __break(1u);
}

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PPTopicStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken12 != -1)
    dispatch_once(&defaultStore__pasOnceToken12, block);
  return (id)defaultStore__pasExprOnceResult_2317;
}

+ (double)decayValue:(double)a3 withDecayRate:(double)a4 forTimeElapsed:(double)a5
{
  double v5;

  v5 = a3;
  if (a5 >= 0.0)
    return exp(-(a4 * a5)) * a3;
  return v5;
}

void __28__PPTopicStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_2317;
  defaultStore__pasExprOnceResult_2317 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
