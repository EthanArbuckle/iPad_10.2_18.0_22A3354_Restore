@implementation ApplyControllerModel

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v5;
  _TtC9PassKitUI20ApplyControllerModel *v6;

  v5 = a3;
  v6 = self;
  sub_19D3C2E34(a3);

}

- (_TtC9PassKitUI20ApplyControllerModel)init
{
  return (_TtC9PassKitUI20ApplyControllerModel *)sub_19D3C3018();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel__nextView;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4A0CF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel__accountError;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE49FDB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI20ApplyControllerModel__hasFieldsSubmitted;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE4A0CE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);

}

@end
