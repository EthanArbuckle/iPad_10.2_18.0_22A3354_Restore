@implementation UnpreventableHoverGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (_TtC23ShelfKitCollectionViews35UnpreventableHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  __n128 v6;
  uint64_t v7;
  _OWORD v9[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v7, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  return (_TtC23ShelfKitCollectionViews35UnpreventableHoverGestureRecognizer *)sub_143750((uint64_t)v9, (uint64_t)a4);
}

@end
