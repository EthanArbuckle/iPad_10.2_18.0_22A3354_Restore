@implementation BCMAssetWrapper

+ (id)assetWithData:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v4 = (void *)_s8BookCore13MAssetWrapperC5asset4withSo8BFMAsset_pSgSDys11AnyHashableVypG_tFZ_0(v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

+ (id)actionTextForType:(int64_t)a3 withAsset:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;

  v6 = type metadata accessor for MAsset(0);
  if (swift_dynamicCastClass(a4, v6)
    && (swift_unknownObjectRetain(a4), MAsset.actionText(for:)(a3), v8 = v7, swift_unknownObjectRelease(a4), v8))
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)htmlStrippedStandardNotesForAsset:(id)a3
{
  return sub_18A50C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))MAsset.htmlStrippedStandardNotes.getter);
}

+ (id)htmlStrippedStandardDescriptionForAsset:(id)a3
{
  return sub_18A50C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))MAsset.htmlStrippedStandardDescription.getter);
}

+ (id)nameForResourceType:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  uint64_t v13;

  v4 = type metadata accessor for MResourceType(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MResourceType.init(_:)(a3);
  MResourceType.name.getter(v8);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (BCMAssetWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAssetWrapper();
  return -[BCMAssetWrapper init](&v3, "init");
}

@end
