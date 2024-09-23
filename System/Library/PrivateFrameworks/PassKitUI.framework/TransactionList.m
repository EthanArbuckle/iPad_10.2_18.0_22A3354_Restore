@implementation TransactionList

- (void)transactionsChanged:(id)a3
{
  uint64_t v4;
  _TtC9PassKitUI15TransactionList *v5;

  sub_19D1A9ED4(0, (unint64_t *)&qword_1EE4AA970);
  v4 = sub_19DE87E10();
  v5 = self;
  sub_19D59D610(v4);

  swift_bridgeObjectRelease();
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  uint64_t v5;
  _TtC9PassKitUI15TransactionList *v6;

  v5 = *(_WORD *)&a4 & 0x101;
  swift_unknownObjectRetain();
  v6 = self;
  sub_19D59F0A0(v5);
  swift_unknownObjectRelease();

}

- (_TtC9PassKitUI15TransactionList)init
{
  _TtC9PassKitUI15TransactionList *result;

  result = (_TtC9PassKitUI15TransactionList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI15TransactionList__rows;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4AA978);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI15TransactionList__yearlyGroups;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4AA980);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();

  v7 = (char *)self + OBJC_IVAR____TtC9PassKitUI15TransactionList__filter;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE4AA988);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

@end
