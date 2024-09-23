@implementation FMR1GlyphButton

- (_TtC10TVRemoteUI15FMR1GlyphButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FMR1GlyphButton.init(coder:)();
}

- (void)dealloc
{
  _TtC10TVRemoteUI15FMR1GlyphButton *v2;

  v2 = self;
  FMR1GlyphButton.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_style));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_normalBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_ringDisplayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_ringPerimiterAnimationSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10TVRemoteUI15FMR1GlyphButton_ringFadeAnimationSpring));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  @objc FMR1GlyphButton.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))FMR1GlyphButton.touchesBegan(_:with:));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  @objc FMR1GlyphButton.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))FMR1GlyphButton.touchesEnded(_:with:));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  @objc FMR1GlyphButton.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))FMR1GlyphButton.touchesCancelled(_:with:));
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  @objc FMR1GlyphButton.touchesBegan(_:with:)(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))FMR1GlyphButton.touchesMoved(_:with:));
}

- (void)ringDisplayLinkUpdateWithDisplaylink:(id)a3
{
  id v4;
  _TtC10TVRemoteUI15FMR1GlyphButton *v5;

  v4 = a3;
  v5 = self;
  FMR1GlyphButton.ringDisplayLinkUpdate(displaylink:)(v4);

}

- (void)drawRect:(CGRect)a3
{
  _TtC10TVRemoteUI15FMR1GlyphButton *v3;

  v3 = self;
  specialized FMR1GlyphButton.draw(_:)();

}

- (BOOL)isUserInteractionEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMR1GlyphButton();
  return -[FMR1GlyphButton isUserInteractionEnabled](&v3, sel_isUserInteractionEnabled);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _TtC10TVRemoteUI15FMR1GlyphButton *v4;

  v4 = self;
  FMR1GlyphButton.isUserInteractionEnabled.setter(a3);

}

- (_TtC10TVRemoteUI15FMR1GlyphButton)initWithFrame:(CGRect)a3
{
  _TtC10TVRemoteUI15FMR1GlyphButton *result;

  result = (_TtC10TVRemoteUI15FMR1GlyphButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
