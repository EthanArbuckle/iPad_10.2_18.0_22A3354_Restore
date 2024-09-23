@implementation AccountBalanceHistory

- (void)accountChanged:(id)a3
{
  id v5;
  _TtC9PassKitUI21AccountBalanceHistory *v6;

  v5 = a3;
  v6 = self;
  sub_19D1A77BC(a3);

}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  __int16 v5;
  _TtC9PassKitUI21AccountBalanceHistory *v6;

  v5 = *(_WORD *)&a4 & 0x101;
  swift_unknownObjectRetain();
  v6 = self;
  sub_19D1A9F70(v5);
  swift_unknownObjectRelease();

}

- (_TtC9PassKitUI21AccountBalanceHistory)init
{
  _TtC9PassKitUI21AccountBalanceHistory *result;

  result = (_TtC9PassKitUI21AccountBalanceHistory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AccountBalanceHistory__balances;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE496270);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI21AccountBalanceHistory__dateRange;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE496278);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

}

@end
