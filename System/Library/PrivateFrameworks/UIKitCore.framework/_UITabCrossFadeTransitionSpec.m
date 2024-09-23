@implementation _UITabCrossFadeTransitionSpec

- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)regular
{
  return (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_regular);
}

- (void)setRegular:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_regular);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_regular) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec)compact
{
  return (_TtC5UIKit38_UITabCrossFadeTransitionAnimationSpec *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact);
}

- (void)setCompact:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UITabCrossFadeTransitionSpec_compact) = (Class)a3;
  v3 = a3;

}

- (id)specFor:(id)a3
{
  id v4;
  _TtC5UIKit29_UITabCrossFadeTransitionSpec *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = (id)sub_1855B6ACC(v4);

  return v6;
}

- (void)setDefaultValues
{
  _TtC5UIKit29_UITabCrossFadeTransitionSpec *v2;

  v2 = self;
  sub_1855B631C();

}

+ (id)settingsControllerModule
{
  id v2;

  sub_1855B6B30();
  return v2;
}

- (_TtC5UIKit29_UITabCrossFadeTransitionSpec)initWithDefaultValues
{
  return (_TtC5UIKit29_UITabCrossFadeTransitionSpec *)sub_1855B658C();
}

- (void).cxx_destruct
{

}

@end
