@implementation CRLUSDZItem

+ (BOOL)isSupported
{
  return sub_1001E9750(0x2000000000000uLL);
}

- (BOOL)enableDefaultFloatingEffect
{
  return 0;
}

- (CRLBezierPath)tracedPath
{
  _TtC8Freeform11CRLUSDZItem *v2;
  id v3;

  v2 = self;
  v3 = sub_10065F864();

  return (CRLBezierPath *)v3;
}

- (CRLImageProvider)validatedPosterImageProvider
{
  _TtC8Freeform11CRLUSDZItem *v2;
  _TtC8Freeform11CRLUSDZItem *v3;
  _TtC8Freeform11CRLUSDZItem *v4;
  id v5;
  id v6;

  v2 = self;
  v3 = (_TtC8Freeform11CRLUSDZItem *)sub_10065FB20();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(CRLImageProviderPool), "sharedPool");
    v6 = objc_msgSend(v5, "providerForAsset:shouldValidate:", v4, 1);

    v2 = v4;
  }
  else
  {
    v6 = 0;
  }

  return (CRLImageProvider *)v6;
}

- (_TtC8Freeform8CRLAsset)posterAssetPayload
{
  _TtC8Freeform11CRLUSDZItem *v2;
  void *v3;

  v2 = self;
  v3 = sub_10065FB20();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (id)computeInfoGeometryForFittingIn:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC8Freeform11CRLUSDZItem *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_10065FEC0(x, y, width, height);

  return v8;
}

- (BOOL)canBeGrouped
{
  _TtC8Freeform11CRLUSDZItem *v3;
  char v4;
  _QWORD v6[5];

  v6[3] = &type metadata for CRLFeatureFlags;
  v6[4] = sub_1004DB6DC();
  LOBYTE(v6[0]) = 20;
  v3 = self;
  v4 = isFeatureEnabled(_:)(v6);
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v6);

  return (v4 & 1) == 0;
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLUSDZLayout();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLUSDZRep(0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for CRLUSDZEditor();
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  _TtC8Freeform11CRLUSDZItem *v2;
  double *v3;
  Class isa;

  v2 = self;
  v3 = sub_100662958();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform11CRLUSDZItem *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  Class isa;
  uint64_t v16;

  v5 = type metadata accessor for UTType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)(a3);

  v11 = sub_100A2CDFC((uint64_t)v8);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v13 >> 60 == 15)
    return 0;
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1004BE2FC(v11, v13);
  return isa;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (BOOL)aspectRatioLocked
{
  return 1;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  _TtC8Freeform11CRLUSDZItem *v3;

  v3 = self;
  sub_100757E04(&_mh_execute_header, (uint64_t)"aspectRatioLocked", 17, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZItem.swift", 82, 2, 269, "Should not try to set aspectRatioLocked of an item which returns false from canAspectRatioLockBeChangedByUser.", 110, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"aspectRatioLocked", 17, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZItem.swift", 82, 2u, 269, (uint64_t)"Should not try to set aspectRatioLocked of an item which returns false from canAspectRatioLockBeChangedByUser.", 110, 2u);

}

- (BOOL)placeHolderDataNeedsDownload
{
  _TtC8Freeform11CRLUSDZItem *v2;
  _TtC8Freeform11CRLUSDZItem *v3;
  _TtC8Freeform11CRLUSDZItem *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v2 = self;
  v3 = (_TtC8Freeform11CRLUSDZItem *)sub_10065FB20();
  if (v3)
  {
    v4 = v3;
    v5 = (char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage;
    v6 = *((_QWORD *)v5 + 3);
    v7 = *((_QWORD *)v5 + 4);
    sub_1004BB5A4(v5, v6);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);

    v2 = v4;
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

- (void).cxx_destruct
{

}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 1;
}

- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4
{
  id v5;
  _TtC8Freeform11CRLUSDZItem *v6;

  v5 = a4;
  v6 = self;
  sub_100663894();

}

@end
