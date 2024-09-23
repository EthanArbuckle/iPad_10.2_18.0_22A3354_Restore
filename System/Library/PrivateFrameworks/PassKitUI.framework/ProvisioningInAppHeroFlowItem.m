@implementation ProvisioningInAppHeroFlowItem

- (_TtC9PassKitUI29ProvisioningInAppHeroFlowItem)init
{
  _TtC9PassKitUI29ProvisioningInAppHeroFlowItem *result;

  result = (_TtC9PassKitUI29ProvisioningInAppHeroFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_delegate);
  swift_bridgeObjectRelease();

}

- (uint64_t)heroViewControllerDidSelectContinue:(void *)a3
{
  char *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t ObjectType;
  id v9;
  char *v10;

  v5 = &a1[OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_delegate];
  result = MEMORY[0x1A1AE6A68](&a1[OBJC_IVAR____TtC9PassKitUI29ProvisioningInAppHeroFlowItem_delegate]);
  if (result)
  {
    v7 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v9 = a3;
    v10 = a1;
    sub_19D789E94((uint64_t)v10, (uint64_t)&off_1E3E315C8, ObjectType, v7);

    return swift_unknownObjectRelease();
  }
  return result;
}

@end
