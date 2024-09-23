@implementation UITextEffectView

- (_TtC5UIKit16UITextEffectView)initWithCoder:(id)a3
{
  objc_class *v4;
  uint64_t v5;
  id v6;
  _TtC5UIKit16UITextEffectView *result;

  v4 = (objc_class *)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit16UITextEffectView_managedSubviews) = (Class)MEMORY[0x1E0DEE9E8];
  v5 = OBJC_IVAR____TtC5UIKit16UITextEffectView_textEffects;
  v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1856A19EC(MEMORY[0x1E0DEE9D8]);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit16UITextEffectView_sharedEffectViews) = v4;

  result = (_TtC5UIKit16UITextEffectView *)sub_186507E04();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  UIWindow *v2;
  _TtC5UIKit16UITextEffectView *v3;

  v3 = self;
  v2 = -[UIView window](v3, sel_window);

  if (!v2)
    sub_1856BD60C();

}

- (_TtC5UIKit16UITextEffectView)initWithFrame:(CGRect)a3
{
  _TtC5UIKit16UITextEffectView *result;

  result = (_TtC5UIKit16UITextEffectView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
