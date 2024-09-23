@implementation AddressSearchingModel

- (_TtC9PassKitUI21AddressSearchingModel)init
{
  _TtC9PassKitUI21AddressSearchingModel *result;

  result = (_TtC9PassKitUI21AddressSearchingModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__isMatchingContact;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494370);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__mapsOnly, v4);

  v6 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__contactResults;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4B03F0);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__mapsResults, v7);
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel_contactMatchHandler));
  v9 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AddressSearchingModel__searchText;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4A9E90);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
}

- (void)contactsSearchUpdated:(id)a3
{
  id v4;
  _TtC9PassKitUI21AddressSearchingModel *v5;

  v4 = a3;
  v5 = self;
  sub_19D688B90(v4, (uint64_t)&unk_1E3E4B840, (uint64_t)sub_19D689440, (uint64_t)&block_descriptor_21_6);

}

- (void)mapSearchUpdated:(id)a3
{
  id v4;
  _TtC9PassKitUI21AddressSearchingModel *v5;

  v4 = a3;
  v5 = self;
  sub_19D688B90(v4, (uint64_t)&unk_1E3E4B7F0, (uint64_t)sub_19D6893F0, (uint64_t)&block_descriptor_9_7);

}

- (void)selectedAddress:(id)a3 withError:(id)a4
{
  id v7;
  _TtC9PassKitUI21AddressSearchingModel *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a4;
  sub_19D689174(a3);

}

@end
