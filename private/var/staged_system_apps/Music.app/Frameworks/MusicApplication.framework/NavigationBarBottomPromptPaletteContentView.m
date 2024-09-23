@implementation NavigationBarBottomPromptPaletteContentView

- (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView *result;

  v4 = OBJC_IVAR____TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView_textLabel;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_3B8BBC();

  result = (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/NavigationController.swift", 43, 2, 639, 0);
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView_textLabel];
  objc_msgSend(v2, "bounds", v6.receiver, v6.super_class);
  Width = CGRectGetWidth(v7);
  objc_msgSend(v2, "bounds");
  objc_msgSend(v3, "sizeThatFits:", CGRectGetWidth(v8), 0.0);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, Width, v5);

}

- (_TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView)initWithFrame:(CGRect)a3
{
  sub_2EA80C((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicApplication.NavigationBarBottomPromptPaletteContentView", 60);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication43NavigationBarBottomPromptPaletteContentView_textLabel));
}

@end
