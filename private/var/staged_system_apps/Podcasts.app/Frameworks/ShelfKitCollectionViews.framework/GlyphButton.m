@implementation GlyphButton

- (_TtC23ShelfKitCollectionViews11GlyphButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s23ShelfKitCollectionViews11GlyphButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)tintColorDidChange
{
  _TtC23ShelfKitCollectionViews11GlyphButton *v2;

  v2 = self;
  sub_1E5174();

}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews11GlyphButton *v2;

  v2 = self;
  sub_1E5278();

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GlyphButton(0);
  return -[GlyphButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC23ShelfKitCollectionViews11GlyphButton *v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  objc_super v10;
  objc_super v11;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for GlyphButton(0);
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  v7 = -[GlyphButton isHighlighted](&v11, "isHighlighted");
  v10.receiver = v6;
  v10.super_class = v5;
  -[GlyphButton setHighlighted:](&v10, "setHighlighted:", v3);
  if (v7 != -[GlyphButton isHighlighted](v6, "isHighlighted"))
  {
    v8 = -[GlyphButton isHighlighted](v6, "isHighlighted");
    v9 = 1.0;
    if (v8)
      v9 = 0.5;
    -[GlyphButton setAlpha:](v6, "setAlpha:", v9);
  }

}

- (_TtC23ShelfKitCollectionViews11GlyphButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews11GlyphButton *result;

  result = (_TtC23ShelfKitCollectionViews11GlyphButton *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.GlyphButton", 35, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_badgeSymbolName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_customTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fillMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_platterFillColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_glyphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fillView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_badgeImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_previousPlatterFillColor));
  sub_1E7E94(*(void **)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout), *(void **)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout], *(void **)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout + 8], self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_layout + 16]);
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_glyph;
  v4 = type metadata accessor for Glyph(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_customOverlay));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fadeUpdateBlock), *(_QWORD *)&self->super.super.fontUseCase[OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_fadeUpdateBlock]);
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_color, (uint64_t *)&unk_3D4C90);
}

- (UIImageView)accessibilityGlyphView
{
  return (UIImageView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                                                                + OBJC_IVAR____TtC23ShelfKitCollectionViews11GlyphButton_glyphView));
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews11GlyphButton *v8;
  __n128 v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10 = (void *)_s23ShelfKitCollectionViews11GlyphButtonC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0kH0C_So0K6RegionCtF_0(v6, v9);

  return v10;
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  sub_1E64A4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, _s23ShelfKitCollectionViews11GlyphButtonC18pointerInteraction_8willExit8animatorySo09UIPointerH0C_So0L6RegionCSo0lH9Animating_ptF_0);
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  sub_1E64A4(self, (uint64_t)a2, a3, a4, (uint64_t)a5, _s23ShelfKitCollectionViews11GlyphButtonC18pointerInteraction_9willEnter8animatorySo09UIPointerH0C_So0L6RegionCSo0lH9Animating_ptF_0);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

@end
