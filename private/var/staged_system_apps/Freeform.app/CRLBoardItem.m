@implementation CRLBoardItem

- (CGRect)visibleBoundsForPositioning
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  CGRect result;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x4010000000;
  v20 = &unk_1010E66AB;
  v21 = 0u;
  v22 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItem geometry](self, "geometry"));
  objc_msgSend(v3, "boundsBeforeRotation");
  *(_QWORD *)&v21 = v4;
  *((_QWORD *)&v21 + 1) = v5;
  *(_QWORD *)&v22 = v6;
  *((_QWORD *)&v22 + 1) = v7;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004178F4;
  v16[3] = &unk_1012374B0;
  v16[4] = &v17;
  -[CRLBoardItem withTemporaryLayoutPerform:](self, "withTemporaryLayoutPerform:", v16);
  v8 = v18[4];
  v9 = v18[5];
  v10 = v18[6];
  v11 = v18[7];
  _Block_object_dispose(&v17, 8);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)p_onBoard:(id)a3 setPositionerCalculatedSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v10;

  height = a4.height;
  width = a4.width;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItem geometry](self, "geometry", a3));
  v10 = objc_msgSend(v7, "mutableCopy");

  if (width < 0.0 && (fabs(width) < 0.001 || width == 0.0))
    width = 0.0;
  if (height < 0.0 && (fabs(height) < 0.001 || height == 0.0))
    height = 0.0;
  objc_msgSend(v10, "setSize:", width, height);
  -[CRLBoardItem setGeometry:](self, "setGeometry:", v10);

}

- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
  if (v11 != width || v12 != height)
  {
    v14 = v12;
    if (v11 <= 0.0)
    {
      v15 = 0.0;
      if (width != 0.0)
      {
        v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C628);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E31E0C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C648);
        v17 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEA91C(v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 56, 0, "Desired size is an impossible multiple of current size.");

      }
    }
    else
    {
      v15 = width / v11;
    }
    if (v14 <= 0.0)
    {
      v20 = 0.0;
      if (height != 0.0)
      {
        v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C668);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E31D8C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C688);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DEA91C(v22, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 62, 0, "Desired size is an impossible multiple of current size.");

      }
    }
    else
    {
      v20 = height / v14;
    }
    memset(&v44, 0, sizeof(v44));
    CGAffineTransformMakeScale(&v44, v15, v20);
    memset(&v43, 0, sizeof(v43));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItem geometry](self, "geometry"));
    objc_msgSend(v25, "angle");
    CGAffineTransformMakeRotation(&v42, v26 * 0.0174532925);
    v41 = v44;
    sub_100079650(&v41, &v42, &v43);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItem geometry](self, "geometry"));
    objc_msgSend(v27, "size");
    v30 = v28 * v43.c + v43.a * v29;
    v31 = v28 * v43.d + v43.b * v29;

    -[CRLBoardItem p_onBoard:setPositionerCalculatedSize:](self, "p_onBoard:setPositionerCalculatedSize:", v10, v30, v31);
  }
  -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
  if (v32 != x || v33 != y)
  {
    v35 = v32;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItem geometry](self, "geometry"));
    v37 = objc_msgSend(v36, "mutableCopy");

    v38 = sub_1000603B8(x, y, v35);
    objc_msgSend(v37, "position");
    objc_msgSend(v37, "setPosition:", sub_1000603D0(v39, v40, v38));
    -[CRLBoardItem setGeometry:](self, "setGeometry:", v37);

  }
}

- (_TtC8Freeform12CRLGroupItem)containingGroup
{
  uint64_t Strong;
  void *v4;
  uint64_t v5;
  id v6;
  _TtC8Freeform12CRLBoardItem *v7;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = type metadata accessor for CRLGroupItem(0);
    v6 = (id)swift_dynamicCastClass(v4, v5);
    if (!v6)
    {
      v7 = self;
      v6 = objc_msgSend(v4, "containingGroup");

    }
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8Freeform12CRLGroupItem *)v6;
}

- (_TtC8Freeform16CRLContainerItem)parentContainerItem
{
  void *Strong;
  void *v3;
  uint64_t v4;

  Strong = (void *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  if (Strong)
  {
    v3 = Strong;
    v4 = type metadata accessor for CRLContainerItem(0);
    Strong = (void *)swift_dynamicCastClass(v3, v4);
    if (!Strong)
    {

      Strong = 0;
    }
  }
  return (_TtC8Freeform16CRLContainerItem *)Strong;
}

- (NSUUID)id
{
  NSUUID *result;

  result = (NSUUID *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 132, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLBoardItem)parentItem
{
  return (_TtC8Freeform12CRLBoardItem *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
}

- (int64_t)compareUsingUUIDTo:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(void);
  _QWORD *v13;
  _TtC8Freeform12CRLBoardItem *v14;
  Class isa;
  uint64_t (*v16)(char *, uint64_t);
  uint64_t v17;
  Class v18;
  id v19;
  uint64_t v21;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v21 - v10;
  v12 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v13 = a3;
  v14 = self;
  v12();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v16 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v17 = v16(v11, v5);
  (*(void (**)(uint64_t))((swift_isaMask & *v13) + 0x88))(v17);
  v18 = UUID._bridgeToObjectiveC()().super.isa;
  v16(v9, v5);
  v19 = -[objc_class crl_compare:](isa, "crl_compare:", v18);

  return (int64_t)v19;
}

- (NSUUID)parentUUID
{
  NSUUID *result;

  result = (NSUUID *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 148, 0);
  __break(1u);
  return result;
}

- (NSString)localizedName
{
  return (NSString *)sub_1007791E0(self, (uint64_t)a2, (void (*)(uint64_t, _QWORD))sub_1007776BC);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_1007791E0(self, (uint64_t)a2, (void (*)(uint64_t, _QWORD))sub_100777BC0);
}

- (CRLCanvasInfoGeometry)geometry
{
  CRLCanvasInfoGeometry *result;

  result = (CRLCanvasInfoGeometry *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 175, 0);
  __break(1u);
  return result;
}

- (void)setGeometry:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 176, 0);
  __break(1u);
}

- (BOOL)locked
{
  BOOL result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 180, 0);
  __break(1u);
  return result;
}

- (void)setLocked:(BOOL)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 181, 0);
  __break(1u);
}

- (BOOL)canBeGrouped
{
  BOOL result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 185, 0);
  __break(1u);
  return result;
}

- (BOOL)aspectRatioLocked
{
  BOOL result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 189, 0);
  __break(1u);
  return result;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 190, 0);
  __break(1u);
}

- (NSString)accessibilityDescription
{
  NSString *result;

  result = (NSString *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 194, 0);
  __break(1u);
  return result;
}

- (void)setAccessibilityDescription:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 195, 0);
  __break(1u);
}

- (CRLShadow)shadow
{
  CRLShadow *result;

  result = (CRLShadow *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 199, 0);
  __break(1u);
  return result;
}

- (void)setShadow:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 200, 0);
  __break(1u);
}

- (BOOL)enableDefaultFloatingEffect
{
  BOOL result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 212, 0);
  __break(1u);
  return result;
}

- (NSURL)hyperlinkURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  _BYTE v14[24];

  v3 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL;
  swift_beginAccess(v6, v14, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, &qword_1013E04D0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v10;
}

- (void)setHyperlinkURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8Freeform12CRLBoardItem *v11;
  _BYTE v13[24];

  v5 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL, v13, 33, 0);
  v11 = self;
  sub_100582338((uint64_t)v7, (uint64_t)v10, &qword_1013E04D0);
  swift_endAccess(v13);

}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (NSString)suggestedNameWhenDraggingSingleBoardItem
{
  _TtC8Freeform12CRLBoardItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100772BE0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem
{
  return 0;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC8Freeform12CRLBoardItem *v10;
  uint64_t v12;

  v5 = type metadata accessor for UTType(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3;
  v10 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)(a3);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return 0;
}

- (id)promisedStringForCopy
{
  return 0;
}

- (BOOL)shouldBeIgnoredWhenCopying
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLBoardItem *v3;
  char v4;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xF8);
  v3 = self;
  if ((v2() & 1) != 0)
    v4 = 1;
  else
    v4 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.isa) + 0x1D8))();

  return v4 & 1;
}

- (BOOL)canCopyData
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLBoardItem *v3;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x1D8);
  v3 = self;
  LOBYTE(v2) = v2();

  return (v2 & 1) == 0;
}

- (BOOL)needsDownload
{
  return 0;
}

- (BOOL)placeHolderDataNeedsDownload
{
  return 1;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  void (*v4)(id);
  id v5;
  _TtC8Freeform12CRLBoardItem *v6;

  v4 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.isa) + 0x200);
  v5 = a3;
  v6 = self;
  v4(v5);

}

- (void)updateGeometryToReplaceBoardItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform12CRLBoardItem *v5;

  v4 = a3;
  v5 = self;
  sub_10077400C(v4);

}

- (CGPoint)centerForReplacingWithNewItem
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLBoardItem *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  v3 = self;
  v4 = (void *)v2();
  objc_msgSend(v4, "center");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 dynamicallyDraggedLayout:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = 0.0;
  v5 = 0.0;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)setParentInfo:(id)a3
{
  _TtC8Freeform12CRLBoardItem *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1007742F4((uint64_t)a3);

}

- (BOOL)isSelectable
{
  BOOL result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 347, 0);
  __break(1u);
  return result;
}

- (BOOL)isPreviewable
{
  return 0;
}

- (NSString)previewTooltip
{
  return (NSString *)0;
}

- (BOOL)isShareable
{
  return 0;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, (unint64_t *)&qword_1013FC960, off_101229810);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, (unint64_t *)&qword_1013E56B0, off_101229828);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, (unint64_t *)&qword_1013E5AE0, off_1012297D8);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (void)withTemporaryLayoutPerform:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8Freeform12CRLBoardItem *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10127C6B8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10077454C((uint64_t)sub_10077F5F8, v5);

  swift_release(v5);
}

- (BOOL)excludedFromMultiselectResizeInfo
{
  return 0;
}

- (BOOL)supportsResize
{
  return 1;
}

- (BOOL)supportsParentRotation
{
  return 1;
}

- (BOOL)isLockable
{
  _TtC8Freeform12CRLBoardItem *v2;
  _TtC8Freeform12CRLGroupItem *v3;

  v2 = self;
  v3 = -[CRLBoardItem containingGroup](v2, "containingGroup");

  if (v3)
  return v3 == 0;
}

- (BOOL)allowedToBeDragAndDropped
{
  uint64_t (*v1)(void);
  _QWORD *v2;

  v1 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0xF8);
  v2 = a1;
  LOBYTE(v1) = v1();

  return (v1 & 1) == 0;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLBoardItem *v3;
  void *v4;
  char v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  v3 = self;
  v4 = (void *)v2();
  objc_msgSend(v4, "transform");
  v8 = v11;
  v9 = v10;
  v7 = v12;

  v10 = v9;
  v11 = v8;
  v12 = v7;
  if (sub_100079330((double *)&v10, 0.0001))
  {
    if (((*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.isa) + 0x118))() & 1) != 0)
      v5 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.isa) + 0x290))();
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)isAllowedInFreehandDrawings
{
  return 0;
}

- (CGAffineTransform)computeFullTransform
{
  CGAffineTransform *result;

  sub_10077A5B4(self, (void (*)(_OWORD *__return_ptr))sub_100774698, retstr);
  return result;
}

- (CGAffineTransform)computeLayoutFullTransform
{
  _QWORD *v5;
  _TtC8Freeform12CRLBoardItem *v6;
  CGFloat v7;
  CGFloat v8;
  CGAffineTransform *result;
  __int128 v10;
  __int128 v11;
  _BYTE v12[24];

  v5 = (_QWORD *)swift_allocObject(&unk_10127C690, 64, 7);
  v5[2] = 0x3FF0000000000000;
  v5[3] = 0;
  v5[4] = 0;
  v5[6] = 0;
  v5[7] = 0;
  v5[5] = 0x3FF0000000000000;
  v6 = self;
  swift_retain(v5);
  sub_10077454C((uint64_t)sub_10077F5CC, (uint64_t)v5);
  swift_release(v5);
  swift_beginAccess(v5 + 2, v12, 0, 0);
  v10 = *((_OWORD *)v5 + 2);
  v11 = *((_OWORD *)v5 + 1);
  v7 = *((double *)v5 + 6);
  v8 = *((double *)v5 + 7);

  swift_release(v5);
  *(_OWORD *)&retstr->a = v11;
  *(_OWORD *)&retstr->c = v10;
  retstr->tx = v7;
  retstr->ty = v8;
  return result;
}

- (CGAffineTransform)transformInRoot
{
  CGAffineTransform *result;

  sub_10077A5B4(self, (void (*)(_OWORD *__return_ptr))sub_1007747D4, retstr);
  return result;
}

- (CGAffineTransform)fullTransformInRoot
{
  CGAffineTransform *result;

  sub_10077A5B4(self, (void (*)(_OWORD *__return_ptr))sub_100774920, retstr);
  return result;
}

- (BOOL)wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent
{
  return 0;
}

- (NSArray)additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases
{
  type metadata accessor for CRLBoardItem(0);
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

- (double)viewScaleToUseWhenRasterizingSingleBoardItemForCopy
{
  return 0.0;
}

- (BOOL)requiresAdditionalBoardItemsForCopyImaging
{
  return 0;
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  _QWORD *Strong;
  void *v4;
  uint64_t (*v5)(void);
  _TtC8Freeform12CRLBoardItem *v6;
  void *v7;

  Strong = (_QWORD *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  if (Strong)
  {
    v4 = Strong;
    v5 = *(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x2E8);
    v6 = self;
    v7 = (void *)v5();

  }
  else
  {
    v7 = 0;
  }
  return (_TtC8Freeform8CRLBoard *)v7;
}

- (BOOL)isInBoard
{
  _QWORD *Strong;
  void *v4;
  uint64_t (*v5)(void);
  _TtC8Freeform12CRLBoardItem *v6;
  char v7;

  Strong = (_QWORD *)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  if (Strong)
  {
    v4 = Strong;
    v5 = *(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x2F0);
    v6 = self;
    v7 = v5();

  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

- (BOOL)isTransactableEqualValue:(id)a3
{
  _TtC8Freeform12CRLBoardItem *v5;
  uint64_t v6;
  __n128 v7;
  _TtC8Freeform12CRLBoardItem *v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v6);
    v7 = swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = (*(uint64_t (**)(_OWORD *, __n128))((swift_isaMask & (uint64_t)self->super.isa) + 0x370))(v11, v7);

  sub_1004CB800((uint64_t)v11, &qword_1013E0230);
  return v9 & 1;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  id result;

  result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 555, 0);
  __break(1u);
  return result;
}

- (BOOL)isSupported
{
  BOOL result;

  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 565, 0);
  __break(1u);
  return result;
}

- (NSArray)stringContentForSearch
{
  NSArray *result;

  result = (NSArray *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 579, 0);
  __break(1u);
  return result;
}

- (BOOL)crl_isEqualValue:(id)a3
{
  _TtC8Freeform12CRLBoardItem *v4;
  uint64_t v5;
  _TtC8Freeform12CRLBoardItem *v6;
  BOOL result;
  _QWORD v8[4];

  if (a3)
  {
    v4 = self;
    v5 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v5);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v6 = self;
  }
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656469727265764FLL, 0xEE002E7369687420, "Freeform/CRLBoardItem.swift", 27, 2, 586, 0);
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLBoardItem)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLBoardItem_transactionContext) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLBoardItem(0);
  return -[CRLBoardItem init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLBoardItem_transactionContext));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem__parentItem);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL, &qword_1013E04D0);
}

- (BOOL)shouldBeDeletedWhenEndEditing
{
  return 0;
}

- (BOOL)canAdjustPositionInInspector
{
  return 1;
}

- (BOOL)canAdjustWidthInInspector
{
  return sub_100BDB014(self, (uint64_t)a2, (SEL *)&selRef_widthValid);
}

- (BOOL)canAdjustHeightInInspector
{
  return sub_100BDB014(self, (uint64_t)a2, (SEL *)&selRef_heightValid);
}

@end
