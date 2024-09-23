@implementation CRLOutsideBorderPlatterLayer

- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)init
{
  uint64_t v3;
  id v4;
  _TtC8Freeform28CRLOutsideBorderPlatterLayer *v5;
  _TtC8Freeform28CRLOutsideBorderPlatterLayer *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_outsideBorderWidth) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_outsideBorderInsideCornerRadius) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_additionalOutsetForShadowPath) = 0;
  v3 = OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_borderPlatterSublayer;
  v4 = objc_allocWithZone((Class)CRLNoDefaultImplicitActionLayer);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for CRLOutsideBorderPlatterLayer();
  v6 = -[CRLOutsideBorderPlatterLayer init](&v8, "init");
  -[CRLOutsideBorderPlatterLayer setMasksToBounds:](v6, "setMasksToBounds:", 0);
  return v6;
}

- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)initWithLayer:(id)a3
{
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  return (_TtC8Freeform28CRLOutsideBorderPlatterLayer *)sub_100B5F340(v5);
}

- (_TtC8Freeform28CRLOutsideBorderPlatterLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform28CRLOutsideBorderPlatterLayer *)sub_100B5F5B0(a3);
}

- (void)layoutSublayers
{
  _TtC8Freeform28CRLOutsideBorderPlatterLayer *v2;

  v2 = self;
  sub_100B5F6AC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLOutsideBorderPlatterLayer_borderPlatterSublayer));
}

@end
