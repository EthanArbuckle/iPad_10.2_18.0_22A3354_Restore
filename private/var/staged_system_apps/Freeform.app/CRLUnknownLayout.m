@implementation CRLUnknownLayout

- (BOOL)isSelectable
{
  return 0;
}

- (Class)repClassOverride
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLUnknownRep();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (_TtC8Freeform16CRLUnknownLayout)initWithInfo:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLUnknownLayout();
  return -[CRLCanvasLayout initWithInfo:](&v5, "initWithInfo:", a3);
}

@end
