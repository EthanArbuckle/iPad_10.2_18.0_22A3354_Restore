@implementation PGMusicMaestroWrapper

+ (id)curateMusicForNormalizedSupportedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return sub_1CA322BF8((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1CA322FA0);
}

+ (id)curateMusicForNormalizedKeywordsByAssetCollectionLocalIdentifier:(id)a3 keywordsDataFrame:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  return sub_1CA322BF8((uint64_t)a1, (uint64_t)a2, a3, a4, a5, (uint64_t)a6, (uint64_t (*)(id, id, id))sub_1CA323434);
}

- (PGMusicMaestroWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[PGMusicMaestroWrapper init](&v3, sel_init);
}

@end
