@implementation FMStatusBar

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMStatusBar();
  v2 = (char *)v5.receiver;
  -[FMStatusBar layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy11FMStatusBar_pillView];
  objc_msgSend(v3, "frame", v5.receiver, v5.super_class);
  objc_msgSend(v3, "_setContinuousCornerRadius:", v4 * 0.5);

}

- (_TtC6FindMy11FMStatusBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002CF5A0();
}

- (void)handleTapWithSender:(id)a3
{
  id v4;
  _TtC6FindMy11FMStatusBar *v5;

  v4 = a3;
  v5 = self;
  sub_1002CF760();

}

- (_TtC6FindMy11FMStatusBar)initWithFrame:(CGRect)a3
{
  _TtC6FindMy11FMStatusBar *result;

  result = (_TtC6FindMy11FMStatusBar *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMStatusBar", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy11FMStatusBar_mediator));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy11FMStatusBar_textLabelBottomConstraint));
}

@end
