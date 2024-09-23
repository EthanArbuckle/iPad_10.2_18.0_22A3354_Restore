@implementation AccountDailyCash

- (void)transactionsChanged:(id)a3
{
  _TtC9PassKitUI16AccountDailyCash *v4;

  if (a3)
  {
    sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4AA970);
    sub_19DE87E10();
  }
  v4 = self;
  sub_19D5BDCD0();

  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI16AccountDailyCash)init
{
  _TtC9PassKitUI16AccountDailyCash *result;

  result = (_TtC9PassKitUI16AccountDailyCash *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI16AccountDailyCash__amount;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4AB3A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_19D255EB4((uint64_t)self + OBJC_IVAR____TtC9PassKitUI16AccountDailyCash_date);

}

@end
