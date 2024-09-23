@implementation DOCTabBarVariableBlurBackgroundView

- (_TtC5Files35DOCTabBarVariableBlurBackgroundView)init
{
  _TtC5Files35DOCTabBarVariableBlurBackgroundView *result;

  sub_1002795AC();
  return result;
}

- (void)layoutSubviews
{
  _TtC5Files35DOCTabBarVariableBlurBackgroundView *v2;

  v2 = self;
  DOCTabBarVariableBlurBackgroundView.layoutSubviews()();

}

- (_TtC5Files35DOCTabBarVariableBlurBackgroundView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCTabBarVariableBlurBackgroundView", 41);
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->metrics[OBJC_IVAR____TtC5Files35DOCTabBarVariableBlurBackgroundView_metrics + 16];
  swift_bridgeObjectRelease(*(_QWORD *)&self->metrics[OBJC_IVAR____TtC5Files35DOCTabBarVariableBlurBackgroundView_metrics
                                                    + 24]);
  swift_bridgeObjectRelease(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files35DOCTabBarVariableBlurBackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files35DOCTabBarVariableBlurBackgroundView_gradientView));
}

@end
