@implementation PGGraphEntityTaggingServiceClient

- (PGGraphEntityTaggingServiceClient)initWithSupportedTagsAsStrings:(id)a3 log:(id)a4 error:(id *)a5
{
  uint64_t v6;

  v6 = sub_1CA85B984();
  return (PGGraphEntityTaggingServiceClient *)EntityTaggingServiceClient.init(supportedTagsAsStrings:log:)(v6, a4);
}

- (void)entityTagsForPersonWithPersonLocalIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  PGGraphEntityTaggingServiceClient *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED872E00);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1CA85B8E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF9587C8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF94B660;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1CA47A6E8((uint64_t)v9, (uint64_t)&unk_1EF958100, (uint64_t)v14);
  swift_release();
}

- (PGGraphEntityTaggingServiceClient)init
{
  PGGraphEntityTaggingServiceClient *result;

  result = (PGGraphEntityTaggingServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PGGraphEntityTaggingServiceClient_personView;
  v4 = sub_1CA85B228();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end
