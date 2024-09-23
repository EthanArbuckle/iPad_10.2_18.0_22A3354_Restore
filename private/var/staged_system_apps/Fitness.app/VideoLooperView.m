@implementation VideoLooperView

- (void)dealloc
{
  _TtC10FitnessApp15VideoLooperView *v2;

  v2 = self;
  sub_1005A9BC0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_observers));
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoLooperView(0);
  v2 = (char *)v5.receiver;
  -[VideoLooperView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp15VideoLooperView_playerLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (void)didMoveToWindow
{
  _TtC10FitnessApp15VideoLooperView *v2;

  v2 = self;
  sub_1005A9E34();

}

- (_TtC10FitnessApp15VideoLooperView)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp15VideoLooperView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_playerLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp15VideoLooperView_observers) = (Class)_swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC10FitnessApp15VideoLooperView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/VideoLooperView.swift", 32, 2, 69, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp15VideoLooperView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp15VideoLooperView *result;

  result = (_TtC10FitnessApp15VideoLooperView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.VideoLooperView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void)configurePlayer
{
  _TtC10FitnessApp15VideoLooperView *v2;

  v2 = self;
  sub_1005AA064();

}

- (void)teardownPlayer
{
  _TtC10FitnessApp15VideoLooperView *v2;

  v2 = self;
  sub_1005AA2E0();

}

@end
