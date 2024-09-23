@implementation ButtonWithCustomBackgroundColor

- (_TtC7Measure31ButtonWithCustomBackgroundColor)initWithCoder:(id)a3
{
  _TtC7Measure31ButtonWithCustomBackgroundColor *result;

  result = (_TtC7Measure31ButtonWithCustomBackgroundColor *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/ButtonWithCustomBackgroundColor.swift", 45, 2, 48, 0);
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ButtonWithCustomBackgroundColor();
  return -[ButtonWithCustomBackgroundColor isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  unsigned int v5;
  uint64_t *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ButtonWithCustomBackgroundColor();
  v4 = (char *)v7.receiver;
  -[ButtonWithCustomBackgroundColor setHighlighted:](&v7, "setHighlighted:", v3);
  v5 = objc_msgSend(v4, "isHighlighted", v7.receiver, v7.super_class);
  v6 = &OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorHighlighted;
  if (!v5)
    v6 = &OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorNormal;
  objc_msgSend(v4, "setBackgroundColor:", *(_QWORD *)&v4[*v6]);

}

- (void)layoutSubviews
{
  _TtC7Measure31ButtonWithCustomBackgroundColor *v2;

  v2 = self;
  sub_100039484();

}

- (_TtC7Measure31ButtonWithCustomBackgroundColor)initWithFrame:(CGRect)a3
{
  _TtC7Measure31ButtonWithCustomBackgroundColor *result;

  result = (_TtC7Measure31ButtonWithCustomBackgroundColor *)_swift_stdlib_reportUnimplementedInitializer("Measure.ButtonWithCustomBackgroundColor", 39, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorNormal));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure31ButtonWithCustomBackgroundColor_backgroundColorHighlighted));
}

@end
