@implementation FMLostModeSummaryEntryView

- (_TtC6FindMy26FMLostModeSummaryEntryView)init
{
  uint64_t v3;
  id v4;
  _TtC6FindMy26FMLostModeSummaryEntryView *v5;
  uint64_t v6;
  _TtC6FindMy26FMLostModeSummaryEntryView *v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_platter;
  v4 = objc_allocWithZone((Class)UIView);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)objc_msgSend(v4, "init");
  v6 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_footer;
  *(Class *)((char *)&v5->super.super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for FMLostModeSummaryEntryView();
  v7 = -[FMLostModeSummaryEntryView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1003891B4();

  return v7;
}

- (_TtC6FindMy26FMLostModeSummaryEntryView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy26FMLostModeSummaryEntryView *result;

  v5 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_platter;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_footer;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UILabel), "init");

  result = (_TtC6FindMy26FMLostModeSummaryEntryView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMLostModeSummaryEntryView.swift", 39, 2, 36, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy26FMLostModeSummaryEntryView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy26FMLostModeSummaryEntryView *result;

  result = (_TtC6FindMy26FMLostModeSummaryEntryView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMLostModeSummaryEntryView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_platter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMLostModeSummaryEntryView_footer));
}

@end
