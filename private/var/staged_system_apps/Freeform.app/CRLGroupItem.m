@implementation CRLGroupItem

- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  id v55;
  double v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[8];
  _BYTE v70[46];
  _BYTE v71[128];

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v10 = a3;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLGroupItem allNestedChildrenItemsIncludingGroups](self, "allNestedChildrenItemsIncludingGroups"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v65;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i), "geometry"));
        if (!objc_msgSend(v15, "widthValid") || (objc_msgSend(v15, "heightValid") & 1) == 0)
        {

          -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
          goto LABEL_65;
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
      if (v12)
        continue;
      break;
    }
  }

  -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
  v18 = v16;
  v19 = v17;
  if (v16 != width || v17 != height)
  {
    if (v16 <= 0.0)
    {
      v20 = 0.0;
      if (width != 0.0)
      {
        v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C728);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E32204();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C748);
        v22 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E3215C(v22, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 195, 0, "Desired size is an impossible multiple of current size.");

      }
    }
    else
    {
      v20 = width / v16;
    }
    if (v19 <= 0.0)
    {
      v25 = 0.0;
      if (height != 0.0)
      {
        v26 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C768);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E320DC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10125C788);
        v27 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E32034(v27, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 201, 0, "Desired size is an impossible multiple of current size.");

      }
    }
    else
    {
      v25 = height / v19;
    }
    if (v20 == 0.0)
    {
      v20 = v25;
    }
    else if (v25 == 0.0)
    {
      v25 = v20;
    }
    if (v25 != v20 && vabdd_f64(v25, v20) >= 0.00999999978)
    {
      v30 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C7A8);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v30;
        *(_WORD *)v70 = 2082;
        *(_QWORD *)&v70[2] = "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]";
        *(_WORD *)&v70[10] = 2082;
        *(_QWORD *)&v70[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m";
        *(_WORD *)&v70[20] = 1024;
        *(_DWORD *)&v70[22] = 208;
        *(_WORD *)&v70[26] = 2048;
        *(double *)&v70[28] = v25;
        *(_WORD *)&v70[36] = 2048;
        *(double *)&v70[38] = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d group resize is off-scale (%f vs %f)", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125C7C8);
      v32 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E31F8C(v32, v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 208, 0, "group resize is off-scale (%f vs %f)", *(_QWORD *)&v25, *(_QWORD *)&v20);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)v70 = buf;
    *(_QWORD *)&v70[8] = 0x3010000000;
    *(_QWORD *)&v70[16] = &unk_1010E66AB;
    *(CGSize *)&v70[24] = CGSizeZero;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100418E40;
    v63[3] = &unk_1012374B0;
    v63[4] = buf;
    -[CRLBoardItem withTemporaryLayoutPerform:](self, "withTemporaryLayoutPerform:", v63);
    v35 = *(double *)(*(_QWORD *)v70 + 32);
    v36 = *(double *)(*(_QWORD *)v70 + 40);
    if (height < v36 || (v36 = height, width < v35))
    {
      v37 = v36 / v19;
      if (width >= v35)
        v35 = width;
      v25 = fmax(v37, v35 / v18);
      v20 = v25;
    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupItem childrenToPosition](self, "childrenToPosition"));
    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v40)
    {
      v41 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v40; j = (char *)j + 1)
        {
          if (*(_QWORD *)v60 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
          objc_opt_class(_TtC8Freeform12CRLBoardItem, v39);
          v45 = sub_100221D0C(v44, v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          objc_msgSend(v46, "visibleBoundsForPositioning");
          objc_msgSend(v46, "crl_onBoard:moveItemToPosition:size:", v10, v20 * v47, v25 * v48, v20 * v49, v25 * v50);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      }
      while (v40);
    }

    _Block_object_dispose(buf, 8);
  }
LABEL_65:
  -[CRLBoardItem visibleBoundsForPositioning](self, "visibleBoundsForPositioning");
  v53 = v52;
  if (v52 != x || v51 != y)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
    v55 = objc_msgSend(v54, "mutableCopy");

    v56 = sub_1000603B8(x, y, v53);
    objc_msgSend(v55, "position");
    objc_msgSend(v55, "setPosition:", sub_1000603D0(v57, v58, v56));
    -[CRLBoardItemBase setGeometry:](self, "setGeometry:", v55);

  }
}

- (BOOL)isSelectable
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;
  char v4;
  char v5;

  v2 = self;
  if ((sub_1004E3C64() & 1) != 0)
  {

    v3 = 0;
  }
  else
  {
    sub_1004E3DD4();
    v5 = v4;

    v3 = v5 ^ 1;
  }
  return v3 & 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013E0688, off_1012298D0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013E0680, off_1012298D8);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013E0678, off_1012298C8);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (void)prepareBoardItemForConnectorModeDuplication
{
  uint64_t v3;
  uint64_t v4;
  _TtC8Freeform12CRLGroupItem *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  void *v10;
  uint64_t v11;

  v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v5 = self;
  if (!v4)
  {
    sub_100740DA4();
    v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v3);
  }
  if (v4)
    v6 = v4;
  else
    v6 = (uint64_t)_swiftEmptyArrayStorage;
  if (!((unint64_t)v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v4);
    if (v7)
      goto LABEL_8;
LABEL_18:

    swift_bridgeObjectRelease(v6);
    return;
  }
  if (v6 < 0)
    v11 = v6;
  else
    v11 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  v7 = _CocoaArrayWrapper.endIndex.getter(v11);
  swift_bridgeObjectRelease(v6);
  if (!v7)
    goto LABEL_18;
LABEL_8:
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0)
        v9 = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v6);
      else
        v9 = *(id *)(v6 + 8 * i + 32);
      v10 = v9;
      (*(void (**)(void))((swift_isaMask & *v9) + 0x178))();

    }
    goto LABEL_18;
  }
  __break(1u);
}

- (BOOL)isFreehandDrawing
{
  return 0;
}

- (BOOL)isNonGroupedChild:(id)a3
{
  return 0;
}

- (NSArray)allNestedChildrenItemsIncludingGroups
{
  return (NSArray *)sub_1004E3A0C(self, (uint64_t)a2, (uint64_t (*)(void))sub_1004E36C0);
}

- (NSArray)allNestedChildrenItemsExcludingGroups
{
  return (NSArray *)sub_1004E3A0C(self, (uint64_t)a2, (uint64_t (*)(void))sub_1004E3864);
}

- (NSArray)allNestedNonGroupChildItemsTreatingFreehandDrawingAsLeafNode
{
  return (NSArray *)sub_1004E3A0C(self, (uint64_t)a2, (uint64_t (*)(void))sub_1004E3A60);
}

- (BOOL)isEffectivelyEmpty
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1004E3C64();

  return v3 & 1;
}

- (BOOL)containsUnknownContent
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1004E3DD4();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)requiresAdditionalBoardItemsForCopyImaging
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1004E3F90();

  return v3 & 1;
}

- (BOOL)shouldBeIgnoredWhenCopying
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1004E411C();

  return v3 & 1;
}

+ (CGSize)unscaledSizeForEmptyGroups
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)supportsParentRotation
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1004E42B8();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent
{
  return 0;
}

+ (id)groupGeometryFromChildrenInfos:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = type metadata accessor for CRLBoardItem(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  swift_getObjCClassMetadata(a1);
  v7 = (void *)sub_1004E4484(v6);
  swift_bridgeObjectRelease(v6);
  return v7;
}

+ (id)groupGeometryFromChildrenInfos:(id)a3 currentlyLaidOutWithLayoutController:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v6 = type metadata accessor for CRLBoardItem(0);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  v8 = a4;
  v9 = sub_1004E5A80(v7, v8);

  swift_bridgeObjectRelease(v7);
  return v9;
}

- (id)groupedGeometryForChildItem:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  _TtC8Freeform12CRLGroupItem *v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(uint64_t (**)(void))((*(_QWORD *)a3 & swift_isaMask) + 0xE0);
  v5 = a3;
  v6 = self;
  v7 = (void *)v4();
  v8 = *(uint64_t *)((char *)&v6->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v9 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 288);
  v10 = swift_retain(v8);
  v11 = (void *)v9(v10);
  swift_release(v8);
  v12 = objc_msgSend(v7, "geometryRelativeToGeometry:", v11);

  return v12;
}

- (id)ungroupedGeometryForChildItem:(id)a3
{
  _QWORD *v4;
  _TtC8Freeform12CRLGroupItem *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1004E4980(v4);

  return v6;
}

- (BOOL)makeChildGeometriesRelativeAndComputeOwnAbsoluteGeometryAndReturnError:(id *)a3
{
  _TtC8Freeform12CRLGroupItem *v3;

  v3 = self;
  sub_1004E4E94();

  return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1004E5298();

  return v3 & 1;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  _TtC8Freeform12CRLGroupItem *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1004E5440();
  v4 = v3;

  return v4 & 1;
}

- (NSArray)additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases
{
  _TtC8Freeform12CRLGroupItem *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  sub_1004E36C0();
  sub_10061EAC8(v3);

  type metadata accessor for CRLBoardItem(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  return (NSArray *)isa;
}

@end
