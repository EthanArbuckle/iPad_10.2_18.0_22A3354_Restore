@implementation PKIdentityDataReleaseTransactionConfiguration

- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)initWithDocumentType:(id)a3 elements:(id)a4 transactionSource:(unint64_t)a5 passName:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = sub_19DE87BF4();
  v9 = v8;
  sub_19D6C6FAC();
  sub_19D1A03D8(&qword_1EE4B17A0, (uint64_t (*)(uint64_t))sub_19D6C6FAC, MEMORY[0x1E0DEFCF8]);
  v10 = sub_19DE88014();
  v11 = sub_19DE87BF4();
  return (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *)PKIdentityDataReleaseTransactionConfiguration.init(documentType:elements:transactionSource:passName:)(v7, v9, v10, a5, v11, v12);
}

- (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration)init
{
  _TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *result;

  result = (_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration_elementCategoryGroups;
  v4 = sub_19DE85368();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration_presentmentSource;
  v6 = sub_19DE85344();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
}

@end
