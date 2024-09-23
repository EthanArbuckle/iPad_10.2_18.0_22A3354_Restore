@implementation TextButton

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)init
{
  return (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *)sub_67D5B8();
}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton_hasExcessiveHeightCharacters) = 0;
  v4 = a3;

  result = (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/DetailHeaderView.swift", 39, 2, 1686, 0);
  __break(1u);
  return result;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *v9;

  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  sub_67D9E8(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (CGSize)intrinsicContentSize
{
  _TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v2 = self;
  v3 = -[TextButton titleLabel](v2, "titleLabel");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "intrinsicContentSize");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v13.receiver = v2;
    v13.super_class = (Class)type metadata accessor for TextButton();
    -[TextButton intrinsicContentSize](&v13, "intrinsicContentSize");
    v6 = v9;
    v8 = v10;

  }
  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  void *v4;
  double Width;
  double v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TextButton();
  v2 = v7.receiver;
  -[TextButton layoutSubviews](&v7, "layoutSubviews");
  v3 = objc_msgSend(v2, "titleLabel", v7.receiver, v7.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "frame");
    Width = CGRectGetWidth(v8);
    objc_msgSend(v2, "frame");
    v6 = CGRectGetWidth(v9);
    if (Width > v6)
      v6 = Width;
    objc_msgSend(v4, "setPreferredMaxLayoutWidth:", v6);

    v2 = v4;
  }

}

- (_TtC16MusicApplicationP33_A13DD19D58D33EBE9EDF18CE691179B710TextButton)initWithFrame:(CGRect)a3
{
  sub_2EA80C((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicApplication.TextButton", 27);
}

@end
