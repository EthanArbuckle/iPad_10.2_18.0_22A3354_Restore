@implementation SCUpdateUpsellAppLaunchCountCommand

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  SCUpdateUpsellAppLaunchCountCommand *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SCUpdateUpsellAppLaunchCountCommand_upsellAppLaunchCount);
  v5 = a3;
  v6 = self;
  v7 = (id)sub_1ABF31780();
  objc_msgSend(v5, sel_encodeInt64_forKey_, v4, v7);

}

- (SCUpdateUpsellAppLaunchCountCommand)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  SCUpdateUpsellAppLaunchCountCommand *v7;
  void *v8;
  objc_class *v9;
  SCUpdateUpsellAppLaunchCountCommand *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1ABF31780();
  v9 = (objc_class *)objc_msgSend(v6, sel_decodeInt64ForKey_, v8);

  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___SCUpdateUpsellAppLaunchCountCommand_upsellAppLaunchCount) = v9;
  v12.receiver = v7;
  v12.super_class = ObjectType;
  v10 = -[SCUpdateUpsellAppLaunchCountCommand init](&v12, sel_init);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCUpdateUpsellAppLaunchCountCommand)init
{
  SCUpdateUpsellAppLaunchCountCommand *result;

  result = (SCUpdateUpsellAppLaunchCountCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)executeWithZone:(id)a3
{
  SCUpdateUpsellAppLaunchCountCommand *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SCUpdateUpsellAppLaunchCountCommand *v10;
  _QWORD v11[6];

  swift_unknownObjectRetain();
  v5 = self;
  v6 = (void *)sub_1ABF31780();
  v7 = (void *)sub_1ABF31780();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  v11[4] = sub_1ABD98734;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1ABD29B8C;
  v11[3] = &block_descriptor_0;
  v9 = _Block_copy(v11);
  v10 = v5;
  swift_release();
  objc_msgSend(a3, sel_createOrUpdateRecordWithName_recordType_modifyBlock_, v6, v7, v9);
  _Block_release(v9);
  swift_unknownObjectRelease();

}

@end
