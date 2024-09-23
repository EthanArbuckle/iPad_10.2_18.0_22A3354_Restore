@implementation ConcreteIDSDependency

- (_TtC16ReplicatorEngine21ConcreteIDSDependency)init
{
  _TtC16ReplicatorEngine21ConcreteIDSDependency *result;

  result = (_TtC16ReplicatorEngine21ConcreteIDSDependency *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  sub_24525FFF8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ReplicatorEngine21ConcreteIDSDependency_lock_identityBlob), *(_QWORD *)&self->_accountsChanged[OBJC_IVAR____TtC16ReplicatorEngine21ConcreteIDSDependency_lock_identityBlob]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ReplicatorEngine21ConcreteIDSDependency_identityFetchQueue));
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5;
  _TtC16ReplicatorEngine21ConcreteIDSDependency *v6;

  v5 = a3;
  v6 = self;
  sub_24531B0F0();

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5;
  _TtC16ReplicatorEngine21ConcreteIDSDependency *v6;

  v5 = a3;
  v6 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744FEF8);
  sub_24526381C((unint64_t *)&unk_25744F658, &qword_25744FEF8, MEMORY[0x24BDB9CA8]);
  sub_245387890();

  swift_release();
}

@end
