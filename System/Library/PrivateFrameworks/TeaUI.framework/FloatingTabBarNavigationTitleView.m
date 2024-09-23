@implementation FloatingTabBarNavigationTitleView

- (_TtC5TeaUI33FloatingTabBarNavigationTitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  FloatingTabBarNavigationTitleView.init(coder:)();
}

- (NSString)description
{
  _TtC5TeaUI33FloatingTabBarNavigationTitleView *v2;
  void *v3;

  v2 = self;
  sub_1B14A98D0();

  v3 = (void *)sub_1B16B983C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)layoutSubviews
{
  _TtC5TeaUI33FloatingTabBarNavigationTitleView *v2;

  v2 = self;
  sub_1B14A9AE8();

}

- (_TtC5TeaUI33FloatingTabBarNavigationTitleView)initWithFrame:(CGRect)a3
{
  FloatingTabBarNavigationTitleView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI33FloatingTabBarNavigationTitleView_contentView));
}

- (double)contentAlpha
{
  _TtC5TeaUI33FloatingTabBarNavigationTitleView *v2;
  double v3;
  double v4;

  v2 = self;
  FloatingTabBarNavigationTitleView.contentAlpha.getter();
  v4 = v3;

  return v4;
}

- (void)setContentAlpha:(double)a3
{
  _TtC5TeaUI33FloatingTabBarNavigationTitleView *v3;

  v3 = self;
  FloatingTabBarNavigationTitleView.contentAlpha.setter();

}

- (double)verticalOffset
{
  return 0.0;
}

@end
