@implementation DOCFastLabel

- (void).cxx_destruct
{

}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[25];
  _BYTE v11[200];
  _BYTE v12[24];
  double v13;
  double v14;
  _BYTE v15[200];
  uint64_t v16[25];
  CGRect result;

  sub_100070EDC(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer)+ OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_labelInformation, (uint64_t)v15, (uint64_t *)&unk_100641310);
  sub_100070EDC((uint64_t)v15, (uint64_t)v12, (uint64_t *)&unk_100641310);
  sub_100070EDC((uint64_t)v15, (uint64_t)v16, (uint64_t *)&unk_100641310);
  v4 = 0.0;
  v5 = 0.0;
  if (sub_1000A849C(v16) != 1)
  {
    v5 = v13;
    v4 = v14;
    sub_100070EDC((uint64_t)v12, (uint64_t)v10, (uint64_t *)&unk_100641310);
    sub_100070EDC((uint64_t)v15, (uint64_t)v11, (uint64_t *)&unk_100641310);
    sub_1000B2740((uint64_t)v11);
    sub_10044930C(v10, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000786EC);
  }
  v6 = 0.0;
  v7 = 0.0;
  v8 = v5;
  v9 = v4;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (_TtC5Files12DOCFastLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC5Files12DOCFastLabel *v10;
  _TtC5Files12DOCFastLabel *v11;
  id v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer;
  v9 = objc_allocWithZone((Class)type metadata accessor for DOCFastLabel.FastLabelLayer());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for DOCFastLabel();
  v11 = -[DOCFastLabel initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = -[DOCFastLabel layer](v11, "layer");
  objc_msgSend(v12, "addSublayer:", *(Class *)((char *)&v11->super.super.super.super.isa + OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer));

  return v11;
}

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCFastLabel();
  v2 = v9.receiver;
  v3 = -[DOCFastLabel text](&v9, "text");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setContentScaleFactor:(double)a3
{
  char *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCFastLabel();
  v4 = (char *)v12.receiver;
  -[DOCFastLabel setContentScaleFactor:](&v12, "setContentScaleFactor:", a3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer];
  v6 = objc_msgSend(v4, "layer", v12.receiver, v12.super_class);
  objc_msgSend(v6, "contentsScale");
  v8 = v7;

  objc_msgSend(v5, "setContentsScale:", v8);
  v9 = objc_msgSend(v4, "layer");
  objc_msgSend(v9, "rasterizationScale");
  v11 = v10;

  objc_msgSend(v5, "setRasterizationScale:", v11);
}

- (double)contentScaleFactor
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCFastLabel();
  -[DOCFastLabel contentScaleFactor](&v3, "contentScaleFactor");
  return result;
}

- (_TtC5Files12DOCFastLabel)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5Files12DOCFastLabel *result;

  v5 = OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer;
  v6 = objc_allocWithZone((Class)type metadata accessor for DOCFastLabel.FastLabelLayer());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC5Files12DOCFastLabel *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ALL, 0x8000000100535F80, "Files/DOCFastLabel.swift", 24, 2, 396, 0);
  __break(1u);
  return result;
}

- (void)setText:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000004BLL, 0x8000000100535F30, "Files/DOCFastLabel.swift", 24, 2, 424, 0);
  __break(1u);
}

- (NSAttributedString)attributedText
{
  _TtC5Files12DOCFastLabel *v2;
  id v3;

  v2 = self;
  v3 = sub_100448674();

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000055, 0x8000000100535ED0, "Files/DOCFastLabel.swift", 24, 2, 433, 0);
  __break(1u);
}

- (void)layoutSubviews
{
  _TtC5Files12DOCFastLabel *v2;

  v2 = self;
  sub_100448794();

}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCFastLabel();
  v2 = v4.receiver;
  -[DOCFastLabel didMoveToWindow](&v4, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v4.receiver, v4.super_class);

  if (v3)
    sub_100447FC4(objc_msgSend(v2, "traitCollection"));

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel();
  v4 = a3;
  v5 = v6.receiver;
  -[DOCFastLabel traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_100447FC4(objc_msgSend(v5, "traitCollection", v6.receiver, v6.super_class));

}

- (CGSize)doc_effectiveContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Files12DOCFastLabel_textLayer), "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

@end
