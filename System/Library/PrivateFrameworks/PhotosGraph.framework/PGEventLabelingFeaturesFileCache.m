@implementation PGEventLabelingFeaturesFileCache

+ (id)cacheForMomentGraphRebuildWithGraphServiceURL:(id)a3 graph:(id)a4 error:(id *)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _QWORD *v11;
  uint64_t v13;

  v6 = sub_1CA85A424();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CA85A3F4();
  v10 = a4;
  v11 = sub_1CA2A3144((uint64_t)v9, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v11;
}

- (BOOL)writeFeaturesForMomentNode:(id)a3 assetFetchResult:(id)a4 photoLibrary:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGEventLabelingFeaturesFileCache *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_1CA2A35FC(v11, v12);

  return 1;
}

- (BOOL)clearCacheWithError:(id *)a3
{
  PGEventLabelingFeaturesFileCache *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = self;
  EventLabelingFeaturesFileCache.clearCache()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1CA85A358();

      v7 = v6;
      *a3 = v6;
    }
    else
    {

    }
  }
  return v5 == 0;
}

- (BOOL)isCacheEmptyAtGraphServiceURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  PGEventLabelingFeaturesFileCache *v9;
  id v10;
  void *v11;
  uint64_t v13;

  v4 = sub_1CA85A424();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CA85A3F4();
  v8 = objc_allocWithZone(MEMORY[0x1E0CB3620]);
  v9 = self;
  v10 = objc_msgSend(v8, sel_init);
  sub_1CA85A400();
  v11 = (void *)sub_1CA85B510();
  swift_bridgeObjectRelease();
  LOBYTE(v8) = objc_msgSend(v10, sel_fileExistsAtPath_, v11);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8 ^ 1;
}

- (PGEventLabelingFeaturesFileCache)init
{
  PGEventLabelingFeaturesFileCache *result;

  result = (PGEventLabelingFeaturesFileCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PGEventLabelingFeaturesFileCache_cacheFileURL;
  v4 = sub_1CA85A424();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
