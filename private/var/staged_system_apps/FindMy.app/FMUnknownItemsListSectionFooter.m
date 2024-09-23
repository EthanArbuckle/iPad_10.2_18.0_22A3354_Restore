@implementation FMUnknownItemsListSectionFooter

- (_TtC6FindMy31FMUnknownItemsListSectionFooter)init
{
  return (_TtC6FindMy31FMUnknownItemsListSectionFooter *)sub_100376A98();
}

- (_TtC6FindMy31FMUnknownItemsListSectionFooter)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  char *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  id v13;
  _TtC6FindMy31FMUnknownItemsListSectionFooter *result;

  v5 = OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_label;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_style;
  if (qword_1005D1F58 != -1)
    swift_once(&qword_1005D1F58, sub_100376A38);
  v9 = (char *)self + v8;
  v10 = (void *)qword_1005F5E08;
  v11 = unk_1005F5E10;
  v12 = unk_1005F5E20;
  *(_QWORD *)v9 = qword_1005F5E08;
  *(_OWORD *)(v9 + 8) = v11;
  *(_OWORD *)(v9 + 24) = v12;
  v13 = v10;

  result = (_TtC6FindMy31FMUnknownItemsListSectionFooter *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMUnknownItemsListSectionFooter.swift", 44, 2, 41, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy31FMUnknownItemsListSectionFooter)initWithFrame:(CGRect)a3
{
  _TtC6FindMy31FMUnknownItemsListSectionFooter *result;

  result = (_TtC6FindMy31FMUnknownItemsListSectionFooter *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMUnknownItemsListSectionFooter", 38, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMUnknownItemsListSectionFooter_style));
}

@end
