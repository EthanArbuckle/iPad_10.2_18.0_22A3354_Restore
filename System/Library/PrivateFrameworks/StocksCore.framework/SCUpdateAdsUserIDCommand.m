@implementation SCUpdateAdsUserIDCommand

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SCUpdateAdsUserIDCommand *v5;

  v4 = a3;
  v5 = self;
  sub_1ABE11B54(v4);

}

- (SCUpdateAdsUserIDCommand)initWithCoder:(id)a3
{
  return (SCUpdateAdsUserIDCommand *)sub_1ABE11CC8(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateAdsUserIDCommand)init
{
  SCUpdateAdsUserIDCommand *result;

  result = (SCUpdateAdsUserIDCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___SCUpdateAdsUserIDCommand_userIDCreatedDate;
  v4 = sub_1ABF30760();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)executeWithZone:(id)a3
{
  SCUpdateAdsUserIDCommand *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SCUpdateAdsUserIDCommand *v10;
  _QWORD v11[6];

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1ABF31780();
  v7 = (void *)sub_1ABF31780();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  v11[4] = sub_1ABE12404;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1ABD29B8C;
  v11[3] = &block_descriptor_13;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

@end
