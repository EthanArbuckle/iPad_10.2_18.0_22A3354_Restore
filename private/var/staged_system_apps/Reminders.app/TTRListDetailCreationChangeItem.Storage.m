@implementation TTRListDetailCreationChangeItem.Storage

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v7[3];
  uint64_t v8;

  swift_retain();
  TTRListDetailCreationChangeItem.Storage.copy(with:)(v7);
  swift_release();
  v3 = v8;
  v4 = sub_10001413C(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_100027F10(v7);
  return v5;
}

@end
