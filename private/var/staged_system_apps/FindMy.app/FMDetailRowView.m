@implementation FMDetailRowView

- (_TtC6FindMy15FMDetailRowView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001F9528();
}

- (_TtC6FindMy15FMDetailRowView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy15FMDetailRowView *result;

  result = (_TtC6FindMy15FMDetailRowView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMDetailRowView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy15FMDetailRowView_identifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMDetailRowView_horizontalStackView));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy15FMDetailRowView_activityIndicatorShowingContraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy15FMDetailRowView_activityIndicatorHiddenConstraints));
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy15FMDetailRowView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR____TtC6FindMy15FMDetailRowView_detailText]);
}

@end
