@implementation _UIViewMarkerLayer

- (NSString)label
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1865074D4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UIViewMarkerLayer *v7;

  v4 = sub_1865074F8();
  v6 = v5;
  v7 = self;
  sub_185756D50(v4, v6);

}

- (UIColor)alternateColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____UIViewMarkerLayer_alternateColor));
}

- (void)setAlternateColor:(id)a3
{
  void *v4;
  _UIViewMarkerLayer *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_alternateColor);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_alternateColor) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_185756E4C();
}

- (_UIViewMarkerLayer)init
{
  return (_UIViewMarkerLayer *)sub_185756F7C();
}

- (_UIViewMarkerLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_185757670();
}

- (_UIViewMarkerLayer)initWithLayer:(id)a3
{
  _UIViewMarkerLayer *v4;
  uint64_t v6;

  swift_unknownObjectRetain();
  sub_186507B1C();
  swift_unknownObjectRelease();
  v4 = -[_UIViewMarkerLayer init](self, sel_init);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v6);
  return v4;
}

- (void)layoutSublayers
{
  double v2;
  _UIViewMarkerLayer *v3;

  v3 = self;
  v2 = sub_1857573A4();
  objc_msgSend(*(id *)((char *)&v3->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_backgroundLayer), sel_setFrame_, 0.0, 0.0, v2, 16.0);
  objc_msgSend(*(id *)((char *)&v3->super.super.isa + OBJC_IVAR____UIViewMarkerLayer_labelLayer), sel_setFrame_, 2.0, 2.0, v2, 12.0);

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
