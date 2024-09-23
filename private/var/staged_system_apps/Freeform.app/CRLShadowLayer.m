@implementation CRLShadowLayer

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1009B162C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_1009B1674(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1009B162C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_1009B1674(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setBounds_);
}

- (double)cornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLShadowLayer();
  -[CRLShadowLayer cornerRadius](&v3, "cornerRadius");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for CRLShadowLayer();
  v4 = v16.receiver;
  -[CRLShadowLayer setCornerRadius:](&v16, "setCornerRadius:", a3);
  objc_msgSend(v4, "bounds", v16.receiver, v16.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "cornerRadius");
  v14 = objc_msgSend((id)objc_opt_self(CRLBezierPath), "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v6, v8, v10, v12, v13);
  v15 = objc_msgSend(v14, "CGPath");

  objc_msgSend(v4, "setShadowPath:", v15);
}

- (_TtC8Freeform14CRLShadowLayer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLShadowLayer();
  return -[CRLShadowLayer init](&v3, "init");
}

- (_TtC8Freeform14CRLShadowLayer)initWithLayer:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _TtC8Freeform14CRLShadowLayer *v8;
  objc_super v10;
  _QWORD v11[3];
  uint64_t v12;

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v11, a3);
  swift_unknownObjectRelease(a3);
  v5 = v12;
  v6 = sub_1004BB5A4(v11, v12);
  v7 = _bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLShadowLayer();
  v8 = -[CRLShadowLayer initWithLayer:](&v10, "initWithLayer:", v7);
  swift_unknownObjectRelease(v7);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v11);
  return v8;
}

- (_TtC8Freeform14CRLShadowLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform14CRLShadowLayer *)sub_1009B19CC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for CRLShadowLayer);
}

@end
