@implementation LineProgressGradientView

- (_TtC11MusicCoreUI24LineProgressGradientView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC11MusicCoreUI24LineProgressGradientView *result;

  v5 = OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_gradientView;
  type metadata accessor for LineProgressGradientView.GradientView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_fillView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIView), "init");

  result = (_TtC11MusicCoreUI24LineProgressGradientView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003A4070, "MusicCoreUI/Utils.swift", 23, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LineProgressGradientView();
  v2 = v3.receiver;
  -[LineProgressGradientView layoutSubviews](&v3, "layoutSubviews");
  sub_1002B3890();

}

- (_TtC11MusicCoreUI24LineProgressGradientView)initWithFrame:(CGRect)a3
{
  _TtC11MusicCoreUI24LineProgressGradientView *result;

  result = (_TtC11MusicCoreUI24LineProgressGradientView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.LineProgressGradientView", 36, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_color));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24LineProgressGradientView_fillView));
}

@end
