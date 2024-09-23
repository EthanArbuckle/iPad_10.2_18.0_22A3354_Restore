@implementation PFMediaStreamedAssetCache

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___PFMediaStreamedAssetCache_sourceURL;
  v4 = sub_1A93F726C();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  v5((char *)self + OBJC_IVAR___PFMediaStreamedAssetCache_cacheLocation, v4);
  swift_bridgeObjectRelease();
  swift_release();
}

- (PFMediaStreamedAssetCache)initWithSourceURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  void (*v14)(char *, uint64_t);
  PFMediaStreamedAssetCache *v15;
  uint64_t v17;

  v4 = sub_1A93F726C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v17 - v9;
  sub_1A93F7200();
  v11 = (void *)sub_1A93F71A0();
  v12 = objc_msgSend((id)objc_opt_self(), sel_streamedMediaAssetURL);
  sub_1A93F7200();

  v13 = (void *)sub_1A93F71A0();
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v7, v4);
  v15 = -[PFMediaStreamedAssetCache initWithSourceURL:cacheLocation:purgeability:](self, sel_initWithSourceURL_cacheLocation_purgeability_, v11, v13, 512);

  v14(v10, v4);
  return v15;
}

- (PFMediaStreamedAssetCache)initWithSourceURL:(id)a3 cacheLocation:(id)a4 purgeability:(int)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v6 = sub_1A93F726C();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v13 - v10;
  sub_1A93F7200();
  sub_1A93F7200();
  return (PFMediaStreamedAssetCache *)MediaStreamedAssetCache.init(sourceURL:cacheLocation:purgeability:)((uint64_t)v11, (uint64_t)v8, a5);
}

- (id)cachedAssetURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PFMediaStreamedAssetCache *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2AD3D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  MediaStreamedAssetCache.cachedAssetURL()((uint64_t)v5);

  v7 = sub_1A93F726C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A93F71A0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return v9;
}

- (NSURL)sourceURL
{
  return (NSURL *)(id)sub_1A93F71A0();
}

- (NSString)pathExtension
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)cacheLocation
{
  return (NSURL *)(id)sub_1A93F71A0();
}

- (int)purgeability
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_purgeability);
}

- (id)streamCacheURLAndReturnError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  PFMediaStreamedAssetCache *v11;
  void *v12;
  _BYTE v14[16];
  PFMediaStreamedAssetCache *v15;

  v4 = sub_1A93F726C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_phase);
  v15 = self;
  v9 = v8 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v8 + 16);
  v10 = (os_unfair_lock_s *)(v8 + ((*(unsigned int *)(*(_QWORD *)v8 + 48) + 3) & 0x1FFFFFFFCLL));
  v11 = self;
  os_unfair_lock_lock(v10);
  sub_1A91C8E28(v9, v7);
  os_unfair_lock_unlock(v10);

  v12 = (void *)sub_1A93F71A0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v12;
}

- (BOOL)completeAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  PFMediaStreamedAssetCache *v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PFMediaStreamedAssetCache_phase);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x1E0DEC528] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_1A91C8E10(v4);
  os_unfair_lock_unlock(v5);

  return 1;
}

- (id)persistentFileURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  PFMediaStreamedAssetCache *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  uint64_t v14;

  v3 = sub_1A93F726C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - v8;
  v10 = self;
  sub_1A93F71B8();
  sub_1A93F71C4();
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v6, v3);

  v12 = (void *)sub_1A93F71A0();
  v11(v9, v3);
  return v12;
}

- (PFMediaStreamedAssetCache)init
{
  PFMediaStreamedAssetCache *result;

  result = (PFMediaStreamedAssetCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
