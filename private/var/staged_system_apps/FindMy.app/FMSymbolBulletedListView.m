@implementation FMSymbolBulletedListView

- (_TtC6FindMy24FMSymbolBulletedListView)init
{
  return (_TtC6FindMy24FMSymbolBulletedListView *)sub_1002FC2DC();
}

- (_TtC6FindMy24FMSymbolBulletedListView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC6FindMy24FMSymbolBulletedListView *result;

  v5 = OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_headerView;
  v6 = objc_allocWithZone((Class)type metadata accessor for FMSymbolBulletedListHeaderView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_bulletViews) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC6FindMy24FMSymbolBulletedListView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMSymbolBulletedListView.swift", 37, 2, 36, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMSymbolBulletedListView();
  v4 = a3;
  v5 = v11.receiver;
  -[FMSymbolBulletedListView traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  if (qword_1005D1D60 != -1)
    swift_once(&qword_1005D1D60, sub_10022D7E4);
  v6 = qword_1005F54B8;
  v7 = objc_allocWithZone((Class)UIFontMetrics);
  v8 = objc_msgSend(v7, "initForTextStyle:", v6, v11.receiver, v11.super_class);
  if (qword_1005D1EA0 != -1)
    swift_once(&qword_1005D1EA0, sub_1002FC2CC);
  objc_msgSend(v8, "scaledValueForValue:", *(double *)&qword_1005F5A08);
  v10 = v9;

  objc_msgSend(v5, "setSpacing:", v10);
}

- (_TtC6FindMy24FMSymbolBulletedListView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy24FMSymbolBulletedListView *result;

  result = (_TtC6FindMy24FMSymbolBulletedListView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSymbolBulletedListView", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_headerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy24FMSymbolBulletedListView_bulletViews));
}

@end
