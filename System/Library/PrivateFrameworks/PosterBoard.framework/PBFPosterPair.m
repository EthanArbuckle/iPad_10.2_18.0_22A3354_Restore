@implementation PBFPosterPair

- (PBFPosterPair)initWithConfiguration:(id)a3 associatedConfiguration:(id)a4
{
  id v5;
  id v6;
  PBFPosterPair *v7;
  PBFPosterPair *v8;

  v5 = a3;
  v6 = a4;
  sub_1CBB6BBE4(v5, a4);
  v8 = v7;

  return v8;
}

- (NSString)localizedTitle
{
  void *v2;

  if (*(_QWORD *)&self->id[OBJC_IVAR___PBFPosterPair_localizedTitle])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1CBB824A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setLocalizedTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  if (a3)
  {
    v4 = sub_1CBB824CC();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___PBFPosterPair_localizedTitle);
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease();
}

- (NSUUID)configurationUUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  PBFPosterPair *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED89A0B0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PosterPair.configurationUUID.getter((uint64_t)v5);

  v7 = sub_1CBB8225C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1CBB8222C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (NSString)description
{
  PBFPosterPair *v2;
  void *v3;

  v2 = self;
  PosterPair.description.getter();

  v3 = (void *)sub_1CBB824A8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PBFPosterPair)init
{
  PBFPosterPair *result;

  result = (PBFPosterPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
