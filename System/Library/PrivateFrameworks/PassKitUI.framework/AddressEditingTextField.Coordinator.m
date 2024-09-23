@implementation AddressEditingTextField.Coordinator

- (void)textFieldDidBeginEditing:(id)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  id v7;
  _TtCV9PassKitUI23AddressEditingTextField11Coordinator *v8;
  _OWORD v9[7];
  uint64_t v10;

  v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 72];
  v9[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 56];
  v9[5] = v4;
  v9[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 88];
  v10 = *(_QWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 104];
  v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent);
  v9[1] = v5;
  v6 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 40];
  v9[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 24];
  v9[3] = v6;
  v7 = a3;
  v8 = self;
  sub_19D5D1438((uint64_t)v9);
  sub_19D5D0A4C();
  sub_19D5D1500((uint64_t)v9);

}

- (void)textFieldDidEndEditing:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4947B0);
  sub_19DE87564();
}

- (void)textFieldDidChangeWithTextField:(id)a3
{
  id v4;
  _TtCV9PassKitUI23AddressEditingTextField11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_19D5D0BF4(v4);

}

- (_TtCV9PassKitUI23AddressEditingTextField11Coordinator)init
{
  _TtCV9PassKitUI23AddressEditingTextField11Coordinator *result;

  result = (_TtCV9PassKitUI23AddressEditingTextField11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v2;

  v2 = *(void **)&self->parent[OBJC_IVAR____TtCV9PassKitUI23AddressEditingTextField11Coordinator_parent + 64];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
}

@end
