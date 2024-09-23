@implementation PKIdentityDataReleaseConfiguration

- (NSSet)recognizedElements
{
  _TtC9PassKitUI34PKIdentityDataReleaseConfiguration *v2;
  void *v3;

  v2 = self;
  PKIdentityDataReleaseConfiguration.recognizedElements.getter();

  sub_19D6C6FAC();
  sub_19D1A03D8(&qword_1EE4B17A0, (uint64_t (*)(uint64_t))sub_19D6C6FAC, MEMORY[0x1E0DEFCF8]);
  v3 = (void *)sub_19DE88008();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)initWithDocumentType:(id)a3 elements:(id)a4 relyingPartyName:(id)a5 relyingPartyLogo:(CGImage *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGImage *v14;

  v8 = sub_19DE87BF4();
  v10 = v9;
  sub_19D6C6FAC();
  sub_19D1A03D8(&qword_1EE4B17A0, (uint64_t (*)(uint64_t))sub_19D6C6FAC, MEMORY[0x1E0DEFCF8]);
  v11 = sub_19DE88014();
  if (a5)
  {
    a5 = (id)sub_19DE87BF4();
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  v14 = a6;
  return (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration *)PKIdentityDataReleaseConfiguration.init(documentType:elements:relyingPartyName:relyingPartyLogo:)(v8, v10, v11, (uint64_t)a5, v13, a6);
}

- (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration)init
{
  _TtC9PassKitUI34PKIdentityDataReleaseConfiguration *result;

  result = (_TtC9PassKitUI34PKIdentityDataReleaseConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI34PKIdentityDataReleaseConfiguration_elementCategoryGroups;
  v4 = sub_19DE85368();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_19D1A9DC0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI34PKIdentityDataReleaseConfiguration_relyingParty, &qword_1EE4B1708);
}

@end
