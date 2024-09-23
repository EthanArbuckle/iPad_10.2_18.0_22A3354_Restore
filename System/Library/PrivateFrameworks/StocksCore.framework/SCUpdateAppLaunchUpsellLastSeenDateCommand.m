@implementation SCUpdateAppLaunchUpsellLastSeenDateCommand

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SCUpdateAppLaunchUpsellLastSeenDateCommand *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1ABF306D0();
  v7 = (id)sub_1ABF31780();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (SCUpdateAppLaunchUpsellLastSeenDateCommand)initWithCoder:(id)a3
{
  return (SCUpdateAppLaunchUpsellLastSeenDateCommand *)sub_1ABE71FAC(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateAppLaunchUpsellLastSeenDateCommand)init
{
  SCUpdateAppLaunchUpsellLastSeenDateCommand *result;

  result = (SCUpdateAppLaunchUpsellLastSeenDateCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SCUpdateAppLaunchUpsellLastSeenDateCommand_appLaunchUpsellLastSeenDate;
  v3 = sub_1ABF30760();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (void)executeWithZone:(id)a3
{
  SCUpdateAppLaunchUpsellLastSeenDateCommand *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SCUpdateAppLaunchUpsellLastSeenDateCommand *v10;
  _QWORD v11[6];

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1ABF31780();
  v7 = (void *)sub_1ABF31780();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  v11[4] = sub_1ABE724A8;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1ABD29B8C;
  v11[3] = &block_descriptor_25;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

@end
