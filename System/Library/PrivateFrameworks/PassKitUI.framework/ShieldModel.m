@implementation ShieldModel

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel_coordinator);
  v5 = self;
  v6 = v4;
  sub_19DE8439C();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[ShieldModel dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel_coordinator));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel___observationRegistrar;
  v4 = sub_19DE83EC8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)appProtectionCoordinatorDidGainAccess
{
  _TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel *v2;

  v2 = self;
  sub_19D632A9C();

}

- (void)appProtectionCoordinatorDidFailAccess
{
  _TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel *v3;

  swift_getKeyPath();
  sub_19D1A03D8(&qword_1EE4AE870, (uint64_t (*)(uint64_t))type metadata accessor for ShieldModel, (uint64_t)&unk_19DEFFA34);
  v3 = self;
  sub_19DE83E8C();

  swift_release();
}

- (_TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel)init
{
  _TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel *result;

  result = (_TtC9PassKitUIP33_81D0147D6FAEBFC2E9CB6EB898C8034D11ShieldModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
