@implementation MacButton

- (_TtC23ShelfKitCollectionViews9MacButton)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC23ShelfKitCollectionViews9MacButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_usesBoundsForBaselineGuide) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_touchInsets;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton____lazy_storage___layoutView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_progressView) = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews9MacButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/MacButton.swift", 39, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MacButton();
  v2 = v4.receiver;
  -[MacButton tintColorDidChange](&v4, "tintColorDidChange");
  sub_F46C0(v3);

}

- (BOOL)isHighlighted
{
  return sub_F4C04(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MacButton();
  v4 = v5.receiver;
  -[MacButton setHighlighted:](&v5, "setHighlighted:", v3);
  sub_F49D8();

}

- (BOOL)isEnabled
{
  return sub_F4C04(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  unsigned int v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MacButton();
  v4 = v7.receiver;
  -[MacButton setEnabled:](&v7, "setEnabled:", v3);
  v5 = objc_msgSend(v4, "isEnabled", v7.receiver, v7.super_class);
  v6 = 0.5;
  if (v5)
    v6 = 1.0;
  objc_msgSend(v4, "setAlpha:", v6);

}

- (unsigned)viewForLastBaselineLayout
{
  int v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;

  v1 = a1[OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_usesBoundsForBaselineGuide];
  v2 = a1;
  if (v1 == 1)
  {
    v3 = (unsigned __int8 *)sub_F4E2C();

    v2 = v3;
  }
  return v2;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = -1.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC23ShelfKitCollectionViews9MacButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_F529C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[MacButton intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)accessibilityButtonIsTextStyle
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_style) == 4;
}

- (_TtC23ShelfKitCollectionViews9MacButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews9MacButton *result;

  result = (_TtC23ShelfKitCollectionViews9MacButton *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.MacButton", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_F40B8(*(id *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_glyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton____lazy_storage___layoutView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_progressView));
}

@end
