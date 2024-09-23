@implementation NavigationBarBottomPromptPaletteContentView

- (_TtC5Music43NavigationBarBottomPromptPaletteContentView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC5Music43NavigationBarBottomPromptPaletteContentView *result;

  v4 = OBJC_IVAR____TtC5Music43NavigationBarBottomPromptPaletteContentView_textLabel;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_100864BAC();

  result = (_TtC5Music43NavigationBarBottomPromptPaletteContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E2B820, "Music/NavigationController.swift", 32, 2, 639, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 28.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double Width;
  double v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[NavigationBarBottomPromptPaletteContentView layoutSubviews](&v6, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Music43NavigationBarBottomPromptPaletteContentView_textLabel];
  objc_msgSend(v2, "bounds", v6.receiver, v6.super_class);
  Width = CGRectGetWidth(v7);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(v8), 0.0);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, Width, v5);

}

- (_TtC5Music43NavigationBarBottomPromptPaletteContentView)initWithFrame:(CGRect)a3
{
  sub_1000535F0((uint64_t)self, (uint64_t)a2, (uint64_t)"Music.NavigationBarBottomPromptPaletteContentView", 49);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music43NavigationBarBottomPromptPaletteContentView_textLabel));
}

@end
