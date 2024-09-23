@implementation LegacyHeadUnitPairingFlowItem

- (_TtC9PassKitUI29LegacyHeadUnitPairingFlowItem)init
{
  _TtC9PassKitUI29LegacyHeadUnitPairingFlowItem *result;

  result = (_TtC9PassKitUI29LegacyHeadUnitPairingFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_delegate);
  swift_bridgeObjectRelease();

}

- (void)headUnitPairingPrompt:(id)a3 didFinishWithResult:(BOOL)a4
{
  char *v6;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  _TtC9PassKitUI29LegacyHeadUnitPairingFlowItem *v10;

  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI29LegacyHeadUnitPairingFlowItem_delegate, a2, a3, a4))
  {
    v7 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType();
    v9 = a3;
    v10 = self;
    sub_19D789E94((uint64_t)v10, (uint64_t)&off_1E3E5AC58, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

@end
