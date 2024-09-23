@implementation PPNamedEntityStore

- (PPNamedEntityStore)init
{
  PPNamedEntityStore *v3;

  v3 = -[PPXPCNamedEntityStore _init]([PPXPCNamedEntityStore alloc], "_init");

  return v3;
}

- (id)_initFromSubclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPNamedEntityStore;
  return -[PPNamedEntityStore init](&v3, sel_init);
}

- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a5;
  __break(1u);
  return (char)v7;
}

- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  __break(1u);
  return (char)v4;
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 query:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  __break(1u);
  return (char)v7;
}

- (void)unloadMonitoringDelegate:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  __break(1u);
  return (char)v10;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  __break(1u);
  return (char)v8;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v5;

  v5 = a3;
  __break(1u);
  return (char)v5;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
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

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  __break(1u);
  return (char)v7;
}

- (id)mapItemForPlaceName:(id)a3 error:(id *)a4
{
  id result;

  result = a3;
  __break(1u);
  return result;
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  __break(1u);
  return (char)v4;
}

- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  __break(1u);
  return (char)v4;
}

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  __break(1u);
  return (char)v10;
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

+ (id)defaultStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PPNamedEntityStore_defaultStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStore__pasOnceToken12_8630 != -1)
    dispatch_once(&defaultStore__pasOnceToken12_8630, block);
  return (id)defaultStore__pasExprOnceResult_8631;
}

void __34__PPNamedEntityStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_8631;
  defaultStore__pasExprOnceResult_8631 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
