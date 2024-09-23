@implementation MarketingHeaderUpsellShelf

- (_TtC9SeymourUI26MarketingHeaderUpsellShelf)init
{
  _TtC9SeymourUI26MarketingHeaderUpsellShelf *result;

  result = (_TtC9SeymourUI26MarketingHeaderUpsellShelf *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  _QWORD v5[21];

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_identifier;
  v4 = sub_22BA799E0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_22B16F588((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_row, (uint64_t)v5);
  sub_22B1621A0(v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22B161D38);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_marketingItemProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_subscriptionCache);
  swift_release();
  sub_22B653160((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingHeaderUpsellShelf_offer);
}

@end
