@implementation FMGlyphLabel

- (_TtC6FindMy12FMGlyphLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC6FindMy12FMGlyphLabel *result;

  v5 = OBJC_IVAR____TtC6FindMy12FMGlyphLabel_titleLabel;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy12FMGlyphLabel_iconView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");

  result = (_TtC6FindMy12FMGlyphLabel *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMGlyphLabel.swift", 25, 2, 30, 0);
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC6FindMy12FMGlyphLabel *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMGlyphLabel_titleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMGlyphLabel();
  v2 = (char *)v5.receiver;
  -[FMGlyphLabel layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy12FMGlyphLabel_titleLabel];
  objc_msgSend(v2, "frame", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setPreferredMaxLayoutWidth:", v4 * 0.8);

}

- (_TtC6FindMy12FMGlyphLabel)initWithFrame:(CGRect)a3
{
  _TtC6FindMy12FMGlyphLabel *result;

  result = (_TtC6FindMy12FMGlyphLabel *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMGlyphLabel", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->glyphName[OBJC_IVAR____TtC6FindMy12FMGlyphLabel_glyphName]);

}

@end
