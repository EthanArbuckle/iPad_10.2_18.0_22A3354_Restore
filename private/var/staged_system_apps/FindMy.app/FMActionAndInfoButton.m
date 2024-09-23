@implementation FMActionAndInfoButton

- (_TtC6FindMy21FMActionAndInfoButton)init
{
  return (_TtC6FindMy21FMActionAndInfoButton *)sub_10028B644();
}

- (_TtC6FindMy21FMActionAndInfoButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10028BD14();
}

- (void)updateConstraints
{
  _TtC6FindMy21FMActionAndInfoButton *v2;

  v2 = self;
  sub_10028B8E0();

}

- (_TtC6FindMy21FMActionAndInfoButton)initWithFrame:(CGRect)a3
{
  _TtC6FindMy21FMActionAndInfoButton *result;

  result = (_TtC6FindMy21FMActionAndInfoButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMActionAndInfoButton", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMActionAndInfoButton_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMActionAndInfoButton_detailLabel));
  swift_bridgeObjectRelease(*(_QWORD *)&self->activityIndicator[OBJC_IVAR____TtC6FindMy21FMActionAndInfoButton_detailText]);
}

@end
