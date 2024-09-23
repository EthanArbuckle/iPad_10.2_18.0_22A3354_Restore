@implementation PFFairPlayAsset

- (NSString)description
{
  PFFairPlayAsset *v2;
  void *v3;

  v2 = self;
  FairPlayAsset.description.getter();

  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PFFairPlayAsset)initWithAdamID:(int64_t)a3 avAsset:(id)a4
{
  id v5;
  PFFairPlayAsset *v6;

  v5 = a4;
  v6 = (PFFairPlayAsset *)sub_1A9276FA0(a3, v5);

  return v6;
}

- (BOOL)isOfflineAsset
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  PFFairPlayAsset *v8;
  id v9;
  uint64_t v11;

  v3 = sub_1A93F726C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFFairPlayAsset_avAsset);
  v8 = self;
  v9 = objc_msgSend(v7, sel_URL);
  sub_1A93F7200();

  LOBYTE(v9) = sub_1A93F7140();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v9 & 1;
}

- (PFFairPlayAsset)init
{
  PFFairPlayAsset *result;

  result = (PFFairPlayAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
