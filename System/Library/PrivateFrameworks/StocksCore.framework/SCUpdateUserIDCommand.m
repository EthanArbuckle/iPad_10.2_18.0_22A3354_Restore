@implementation SCUpdateUserIDCommand

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SCUpdateUserIDCommand *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1ABF31780();
  v7 = (void *)sub_1ABF31780();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

  v8 = *((unsigned __int8 *)&v5->super.isa + OBJC_IVAR___SCUpdateUserIDCommand_overwrite);
  v9 = (id)sub_1ABF31780();
  objc_msgSend(v4, sel_encodeBool_forKey_, v8, v9);

}

- (SCUpdateUserIDCommand)initWithCoder:(id)a3
{
  return (SCUpdateUserIDCommand *)sub_1ABEAEA58(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateUserIDCommand)init
{
  SCUpdateUserIDCommand *result;

  result = (SCUpdateUserIDCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)executeWithZone:(id)a3
{
  SCUpdateUserIDCommand *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SCUpdateUserIDCommand *v10;
  _QWORD v11[6];

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1ABF31780();
  v7 = (void *)sub_1ABF31780();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  v11[4] = sub_1ABEAEEC4;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1ABD29B8C;
  v11[3] = &block_descriptor_33;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

@end
