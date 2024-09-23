@implementation ActivitySetupThreeRingsOnboardingVideoView

- (_TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView)init
{
  _TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_playerLayer) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView();
  v2 = -[ActivitySetupThreeRingsOnboardingVideoView initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_1005CF660();

  return v2;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  _TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView *v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;
  CGRect v22;

  v3 = (void *)objc_opt_self(UIScreen);
  v4 = self;
  v5 = objc_msgSend(v3, "mainScreen");
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  v14 = CGRectGetWidth(v22) + -160.0;
  v15 = objc_msgSend(v3, "mainScreen");
  objc_msgSend(v15, "scale");
  v17 = v16;

  v18 = UIRoundToScale(v14 / 0.841584158, v17);
  v19 = v14;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySetupThreeRingsOnboardingVideoView();
  v2 = (char *)v5.receiver;
  -[ActivitySetupThreeRingsOnboardingVideoView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_playerLayer];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

    v2 = v4;
  }

}

- (_TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView)initWithCoder:(id)a3
{
  id v4;
  _TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_playerLayer) = 0;
  v4 = a3;

  result = (_TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/ActivitySetupThreeRingsOnboardingVideoView.swift", 59, 2, 79, 0);
  __break(1u);
  return result;
}

- (_TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView)initWithFrame:(CGRect)a3
{
  _TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView *result;

  result = (_TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySetupThreeRingsOnboardingVideoView", 53, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_player));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp42ActivitySetupThreeRingsOnboardingVideoView_playerLayer));
}

@end
