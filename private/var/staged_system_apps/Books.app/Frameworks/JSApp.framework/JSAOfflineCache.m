@implementation JSAOfflineCache

+ (NSString)cachePath
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (BOOL)generateCache
{
  return sub_54EC4((uint64_t)a1, (uint64_t)a2, &qword_B8138, (unsigned __int8 *)&byte_B9200, (uint64_t)sub_54A50);
}

+ (void)setGenerateCache:(BOOL)a3
{
  sub_54FB4((uint64_t)a1, (uint64_t)a2, a3, &qword_B8138, &byte_B9200, (uint64_t)sub_54A50);
}

+ (BOOL)runFromCache
{
  return sub_54EC4((uint64_t)a1, (uint64_t)a2, &qword_B8140, (unsigned __int8 *)&byte_B9201, (uint64_t)sub_54C84);
}

+ (void)setRunFromCache:(BOOL)a3
{
  sub_54FB4((uint64_t)a1, (uint64_t)a2, a3, &qword_B8140, &byte_B9201, (uint64_t)sub_54C84);
}

+ (id)cacheFileCandidatesForHTTPPreLaunch
{
  return sub_558F4((uint64_t)a1, (uint64_t)a2, (uint64_t (*)(void))static OfflineCache.cacheFileCandidatesForHTTPPreLaunch());
}

+ (id)cacheDirCandidatesForHTTPPostLaunch
{
  return sub_55974((uint64_t)a1, (uint64_t)a2, (void *)0x800000000008A350);
}

+ (id)cacheFileCandidatesForBag
{
  _QWORD *v2;
  Class isa;

  v2 = _s5JSApp12OfflineCacheC25cacheFileCandidatesForBagSaySSGyFZ_0();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

+ (id)cacheFileCandidatesForTUIPreLaunch
{
  return sub_558F4((uint64_t)a1, (uint64_t)a2, (uint64_t (*)(void))static OfflineCache.cacheFileCandidatesForTUIPreLaunch());
}

+ (id)cacheDirCandidatesForTUIPostLaunch
{
  return sub_55974((uint64_t)a1, (uint64_t)a2, (void *)0x800000000008A2D0);
}

- (JSAOfflineCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OfflineCache();
  return -[JSAOfflineCache init](&v3, "init");
}

@end
