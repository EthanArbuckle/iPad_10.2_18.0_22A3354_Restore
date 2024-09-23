@implementation MPModelLibraryResponse

- (id)navigationHandlerForItemAt:(id)a3 sourceViewController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  MPModelLibraryResponse *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[5];
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a3;
  v12 = a4;
  v13 = self;
  v14 = sub_4F3C00((uint64_t)v10, v12);
  v16 = v15;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v14)
  {
    aBlock[4] = v14;
    v19 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_42D124;
    aBlock[3] = &block_descriptor_3_3;
    v14 = _Block_copy(aBlock);
    swift_release(v19);
  }
  return v14;
}

@end
