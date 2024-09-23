@implementation WelcomeView.TitleGroup

- (_TtCC8StocksUI11WelcomeView10TitleGroup)initWithFrame:(CGRect)a3
{
  return (_TtCC8StocksUI11WelcomeView10TitleGroup *)sub_1DC299F14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8StocksUI11WelcomeView10TitleGroup)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtCC8StocksUI11WelcomeView10TitleGroup *result;

  v5 = OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_appIcon;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3890]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtCC8StocksUI11WelcomeView10TitleGroup *)sub_1DC409838();
  __break(1u);
  return result;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel), sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtCC8StocksUI11WelcomeView10TitleGroup *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel);
  v3 = self;
  v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1DC408A4C();

    v6 = (void *)sub_1DC408A1C();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel));
}

@end
