@implementation REMObjectID_Codable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMObjectID_Codable)initWithUUID:(id)a3 entityName:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  REMObjectID_Codable *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_1A46900FC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A46900F0();
  _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v10 = (void *)sub_1A46900D8();
  v11 = (void *)sub_1A469087C();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[REMObjectID initWithUUID:entityName:](&v14, sel_initWithUUID_entityName_, v10, v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end
