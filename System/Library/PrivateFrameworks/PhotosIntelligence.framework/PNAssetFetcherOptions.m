@implementation PNAssetFetcherOptions

- (PNAssetFetcherOptions)initWithFetchOptions:(id)a3 limit:(int64_t)a4 sampleBatchSize:(int64_t)a5
{
  return (PNAssetFetcherOptions *)AssetFetcherOptions.init(fetchOptions:limit:sampleBatchSize:)((uint64_t)a3, a4, a5);
}

- (PNAssetFetcherOptions)initWithPhotoLibrary:(id)a3 limit:(int64_t)a4 sampleBatchSize:(int64_t)a5
{
  PNAssetFetcherOptions *result;

  AssetFetcherOptions.init(photoLibrary:limit:sampleBatchSize:)(a3, a4, a5);
  return result;
}

- (int64_t)limit
{
  return AssetFetcherOptions.limit.getter();
}

- (int64_t)sampleBatchSize
{
  return AssetFetcherOptions.sampleBatchSize.getter();
}

- (PHFetchOptions)fetchOptions
{
  return (PHFetchOptions *)AssetFetcherOptions.fetchOptions.getter();
}

- (NSArray)limiters
{
  void *v2;

  AssetFetcherOptions.limiters.getter();
  type metadata accessor for AssetFetcherLimiter();
  v2 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setLimiters:(id)a3
{
  uint64_t v4;
  PNAssetFetcherOptions *v5;

  type metadata accessor for AssetFetcherLimiter();
  v4 = sub_243F85120();
  v5 = self;
  AssetFetcherOptions.limiters.setter(v4);

}

- (unint64_t)seed
{
  unint64_t result;

  AssetFetcherOptions.seed.getter();
  return result;
}

- (void)setSeed:(unint64_t)a3
{
  AssetFetcherOptions.seed.setter(a3);
}

- (PFPseudoRandomNumberGenerator)randomGenerator
{
  PNAssetFetcherOptions *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_243D9F1A8();
  v4 = v3;

  return (PFPseudoRandomNumberGenerator *)v4;
}

- (CLSCurationContext)curationContext
{
  PNAssetFetcherOptions *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_243D9F334();
  v4 = v3;

  return (CLSCurationContext *)v4;
}

- (void)setCurationContext:(id)a3
{
  id v4;
  PNAssetFetcherOptions *v5;

  v4 = a3;
  v5 = self;
  sub_243D9FBDC((uint64_t)v4);

}

- (id)initFetchOptionsWithExcludeUUIDs:(id)a3 minimumSceneVersion:(signed __int16)a4 predicate:(id)a5
{
  unint64_t v8;
  id v9;
  PNAssetFetcherOptions *v10;
  void *v11;
  void *v12;

  v8 = sub_243F85120();
  v9 = a5;
  v10 = self;
  sub_243D9E914(v8, a4, a5);
  v12 = v11;

  swift_bridgeObjectRelease();
  return v12;
}

- (id)curationPredicate
{
  PNAssetFetcherOptions *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_243D9EF0C();
  v4 = v3;

  return v4;
}

- (PNAssetFetcherOptions)init
{
  AssetFetcherOptions.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSArray)fetchSources
{
  return (NSArray *)sub_243D9FFAC(self, (uint64_t)a2, (void (*)(void))AssetFetcherOptions.fetchSources.getter);
}

- (void)setFetchSources:(id)a3
{
  sub_243D9FDBC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))AssetFetcherOptions.fetchSources.setter);
}

- (NSArray)fetchFilters
{
  return (NSArray *)sub_243D9FFAC(self, (uint64_t)a2, (void (*)(void))AssetFetcherOptions.fetchFilters.getter);
}

- (void)setFetchFilters:(id)a3
{
  sub_243D9FDBC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))AssetFetcherOptions.fetchFilters.setter);
}

- (NSArray)fetchLimiters
{
  PNAssetFetcherOptions *v2;
  void *v3;

  v2 = self;
  AssetFetcherOptions.fetchLimiters.getter();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572FDB30);
  v3 = (void *)sub_243F85108();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)setFetchLimiters:(id)a3
{
  unint64_t v4;
  PNAssetFetcherOptions *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2572FDB30);
  v4 = sub_243F85120();
  v5 = self;
  AssetFetcherOptions.fetchLimiters.setter(v4);

}

@end
