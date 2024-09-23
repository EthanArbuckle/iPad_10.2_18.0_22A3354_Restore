@implementation CRLUnknownItem

- (BOOL)isSelectable
{
  return 0;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLUnknownLayout();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLUnknownRep();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

@end
