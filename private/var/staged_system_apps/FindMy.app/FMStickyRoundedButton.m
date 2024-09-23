@implementation FMStickyRoundedButton

- (_TtC6FindMy21FMStickyRoundedButton)initWithCoder:(id)a3
{
  _TtC6FindMy21FMStickyRoundedButton *result;

  result = (_TtC6FindMy21FMStickyRoundedButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMStickyRoundedButton.swift", 34, 2, 44, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC6FindMy21FMStickyRoundedButton *v6;
  uint64_t v7;
  _TtC6FindMy21FMStickyRoundedButton *v8;

  v4 = qword_1005D1C70;
  v5 = a3;
  v6 = self;
  v8 = v6;
  if (v4 != -1)
  {
    swift_once(&qword_1005D1C70, sub_100189878);
    v6 = v8;
  }
  -[FMStickyRoundedButton setTitleColor:forState:](v6, "setTitleColor:forState:", qword_1005F5088, 0);
  v7 = qword_1005F5078;
  -[FMStickyRoundedButton setTitleColor:forState:](v8, "setTitleColor:forState:", qword_1005F5078, 1);
  -[FMStickyRoundedButton setTitleColor:forState:](v8, "setTitleColor:forState:", v7, 4);

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double v4;
  double v5;
  double v6;
  _TtC6FindMy21FMStickyRoundedButton *v7;

  height = a3.size.height;
  v7 = self;
  sub_100189D10(v4, v5, v6, height);

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMStickyRoundedButton();
  return -[FMStickyRoundedButton isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMStickyRoundedButton();
  v4 = v5.receiver;
  -[FMStickyRoundedButton setSelected:](&v5, "setSelected:", v3);
  objc_msgSend(v4, "setNeedsDisplay", v5.receiver, v5.super_class);

}

- (_TtC6FindMy21FMStickyRoundedButton)initWithFrame:(CGRect)a3
{
  _TtC6FindMy21FMStickyRoundedButton *result;

  result = (_TtC6FindMy21FMStickyRoundedButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMStickyRoundedButton", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
