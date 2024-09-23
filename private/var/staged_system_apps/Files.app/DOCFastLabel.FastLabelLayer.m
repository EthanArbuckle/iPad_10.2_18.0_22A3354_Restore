@implementation DOCFastLabel.FastLabelLayer

- (void).cxx_destruct
{
  _QWORD v3[25];

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_traitCollection));
  sub_100070EDC((uint64_t)self+ OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_labelInformation, (uint64_t)v3, (uint64_t *)&unk_100641310);
  sub_10044930C(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000786EC);
}

- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)init
{
  char *v3;
  _TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer *v4;
  objc_super v6;
  _BYTE v7[200];

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_labelInformation;
  sub_1000D07FC((uint64_t)v7);
  sub_100070EDC((uint64_t)v7, (uint64_t)v3, (uint64_t *)&unk_100641310);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = -[DOCFastLabel.FastLabelLayer init](&v6, "init");
  -[DOCFastLabel.FastLabelLayer setOpaque:](v4, "setOpaque:", 0);
  -[DOCFastLabel.FastLabelLayer setContentsFormat:](v4, "setContentsFormat:", kCAContentsFormatAutomatic);

  return v4;
}

- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer *)sub_100448050(a3);
}

- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer *)sub_10044813C(v5);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer *v5;

  v4 = a3;
  v5 = self;
  sub_100448330(v4);

}

@end
