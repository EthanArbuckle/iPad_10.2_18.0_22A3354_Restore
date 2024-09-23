@implementation BKSwitchAccountStorageController

- (BKSwitchAccountStorageController)init
{
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  BKSwitchAccountStorageController *v6;
  BKSwitchAccountStorageController *v7;
  objc_super v9;

  ObjectType = swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKSwitchAccountStorageController_cancellables) = (Class)&_swiftEmptySetSingleton;
  v4 = swift_allocObject(&unk_1008F6158, 24, 7);
  *(_QWORD *)(v4 + 16) = ObjectType;
  v5 = sub_10004CFD4(&qword_1009D44C8);
  swift_allocObject(v5, *(unsigned int *)(v5 + 48), *(unsigned __int16 *)(v5 + 52));
  v6 = self;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___BKSwitchAccountStorageController_accountsState) = (Class)Future.init(_:)(sub_100240550, v4);

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for SwitchAccountStorageController();
  v7 = -[BKSwitchAccountStorageController init](&v9, "init");
  sub_10023EBD8();

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BKSwitchAccountStorageController_cancellables));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKSwitchAccountStorageController_accountsState));
}

@end
