@implementation ICThumbnailCache

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7;
  id v8;
  ICThumbnailCache *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  ThumbnailCache.subscript.setter(a3, v8);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  ICThumbnailCache *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1AC7C4AF8(v4);

  return v6;
}

+ (ICThumbnailCache)shared
{
  if (qword_1ED6E8348 != -1)
    swift_once();
  return (ICThumbnailCache *)(id)qword_1ED6E8038;
}

- (id)creationDateFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  ICThumbnailCache *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED6E80C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = ((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = a3;
  v9 = self;
  ThumbnailCache.creationDate(for:)(v8, v7);

  v10 = sub_1ACA3F9C0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = 0;
  if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    v12 = (void *)sub_1ACA3F954();
    (*(void (**)(NSObject *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v12;
}

- (void)invalidateForObjectIdentifiers:(id)a3
{
  uint64_t v4;
  ICThumbnailCache *v5;

  v4 = sub_1ACA42348();
  v5 = self;
  sub_1AC97D23C(v4);

  swift_bridgeObjectRelease();
}

- (ICThumbnailCache)init
{
  ICThumbnailCache *result;

  result = (ICThumbnailCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICThumbnailCache____lazy_storage___cacheKeyQueueQos, &qword_1ED6E84E8);

  swift_bridgeObjectRelease();
}

@end
