@implementation TrendsSplashVideoView

- (CGSize)intrinsicContentSize
{
  void *v3;
  _TtC10FitnessApp21TrendsSplashVideoView *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Width;
  double v15;
  double v16;
  double v17;
  CGSize result;
  CGRect v19;

  v3 = (void *)objc_opt_self(UIScreen);
  v4 = self;
  v5 = objc_msgSend(v3, "mainScreen");
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  Width = CGRectGetWidth(v19);
  if (qword_10081DD70 != -1)
    swift_once(&qword_10081DD70, sub_1000071BC);
  v15 = UIRoundToScale(Width / 1.34894614, *(double *)&qword_10086AA00);

  v16 = Width;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)didMoveToWindow
{
  _TtC10FitnessApp21TrendsSplashVideoView *v2;

  v2 = self;
  sub_1000330B0();

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrendsSplashVideoView(0);
  v2 = (char *)v5.receiver;
  -[TrendsSplashVideoView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_playerLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (void)configurePlayer
{
  _TtC10FitnessApp21TrendsSplashVideoView *v2;

  v2 = self;
  sub_100033FC8();

}

- (_TtC10FitnessApp21TrendsSplashVideoView)initWithCoder:(id)a3
{
  uint64_t v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_playerLayer) = 0;
  v4 = type metadata accessor for TrendsSplashVideoView(0);
  swift_deallocPartialClassInstance(self, v4, *(unsigned int *)((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x30), *(unsigned __int16 *)((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x34));
  return 0;
}

- (_TtC10FitnessApp21TrendsSplashVideoView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp21TrendsSplashVideoView *result;

  result = (_TtC10FitnessApp21TrendsSplashVideoView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendsSplashVideoView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_playerLayer));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)teardownPlayer
{
  _TtC10FitnessApp21TrendsSplashVideoView *v2;

  v2 = self;
  sub_100160054();

}

@end
