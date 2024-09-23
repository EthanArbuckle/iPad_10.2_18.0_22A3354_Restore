@implementation CRLShapeItem

- (void)p_onBoard:(id)a3 setPositionerCalculatedSize:(CGSize)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  id v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_TtC8Freeform12CRLShapeItem;
  -[CRLBoardItem p_onBoard:setPositionerCalculatedSize:](&v19, "p_onBoard:setPositionerCalculatedSize:", a3, a4.width, a4.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeItem pathSource](self, "pathSource"));
  objc_msgSend(v5, "naturalSize");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeItem pathSource](self, "pathSource"));
    v17 = objc_msgSend(v16, "copy");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemBase geometry](self, "geometry"));
    objc_msgSend(v18, "size");
    objc_msgSend(v17, "setNaturalSize:");

    -[CRLShapeItem setPathSource:](self, "setPathSource:", v17);
  }
}

- (BOOL)isSelectable
{
  return 1;
}

- (Class)layoutClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013FA700, off_1012299C8);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, &qword_1013FA6F8, off_1012299D8);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, (unint64_t *)&qword_1013F2E80, off_1012299C0);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (BOOL)allowedToBeDragAndDropped
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  _TtC8Freeform12CRLShapeItem *v4;
  uint64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 312);
  v4 = self;
  v5 = swift_retain(v2);
  LOBYTE(v3) = v3(v5);

  swift_release(v2);
  return (v3 & 1) == 0;
}

- (BOOL)supportsResize
{
  _TtC8Freeform12CRLShapeItem *v2;
  char v3;

  v2 = self;
  v3 = sub_100923164();

  return v3 & 1;
}

- (CRLShadow)shadow
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLShapeItem *v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4C0);
  v3 = self;
  if ((v2() & 1) != 0)
  {

    v4 = 0;
  }
  else
  {
    v5 = *(uint64_t *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
    v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 384);
    v7 = swift_retain(v5);
    v4 = (void *)v6(v7);

    swift_release(v5);
  }
  return (CRLShadow *)v4;
}

- (void)setShadow:(id)a3
{
  uint64_t (*v4)(void);
  _TtC8Freeform12CRLShapeItem *v5;
  id v6;

  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4C0);
  v6 = a3;
  v5 = self;
  if ((v4() & 1) != 0)
  {
    sub_100757E04(&_mh_execute_header, (uint64_t)"shadow", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeItem.swift", 83, 2, 65, "Should not try to set a shadow on a shape in a freehand drawing.", 64, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1004F5394((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"shadow", 6, 2u, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeItem.swift", 83, 2u, 65, (uint64_t)"Should not try to set a shadow on a shape in a freehand drawing.", 64, 2u);
  }
  else
  {
    sub_100776C40(v6);
  }

}

- (NSString)localizedName
{
  return (NSString *)sub_1009257B4(self, (uint64_t)a2, (SEL *)&selRef_inferredAccessibilityDescriptionNoShapeNames, (void (*)(uint64_t, _QWORD))sub_1007776BC);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_1009257B4(self, (uint64_t)a2, (SEL *)&selRef_inferredLocalizedAccessibilityDescriptionPlaceholder, (void (*)(uint64_t, _QWORD))sub_100777BC0);
}

- (NSString)crlaxLocalizedName
{
  return (NSString *)sub_1009257B4(self, (uint64_t)a2, (SEL *)&selRef_inferredAccessibilityDescription, (void (*)(uint64_t, _QWORD))sub_1007776BC);
}

- (CRLPathSource)pathSource
{
  _QWORD *v3;
  uint64_t v4;
  CRLPathSource *result;
  uint64_t (*v6)(uint64_t);
  _TtC8Freeform12CRLShapeItem *v7;
  uint64_t v8;
  void *v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v4 = *v3;
  result = (CRLPathSource *)swift_conformsToProtocol2(*v3, &protocol descriptor for CRLAbstractShapeItemDataProtocol);
  if (result)
  {
    v6 = *(uint64_t (**)(uint64_t))(v4 + 704);
    v7 = self;
    v8 = swift_retain(v3);
    v9 = (void *)v6(v8);

    swift_release(v3);
    return (CRLPathSource *)v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setPathSource:(id)a3
{
  id v4;
  _TtC8Freeform12CRLShapeItem *v5;

  v4 = a3;
  v5 = self;
  sub_10092345C((uint64_t)v4);

}

- (BOOL)isLine
{
  return sub_100925A04(self, (uint64_t)a2, (SEL *)&selRef_isLineSegment);
}

- (BOOL)isOpenPath
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLShapeItem *v3;
  void *v5;
  unsigned __int8 v6;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x490);
  v3 = self;
  if ((v2() & 1) != 0)
  {

    return 1;
  }
  else
  {
    v5 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.super.super.super.isa) + 0x478))();
    v6 = objc_msgSend(v5, "isClosed");

    return v6 ^ 1;
  }
}

- (BOOL)pathIsOpen
{
  return sub_100925A04(self, (uint64_t)a2, (SEL *)&selRef_isOpen);
}

- (CRLFill)fill
{
  _TtC8Freeform12CRLShapeItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100923670();

  return (CRLFill *)v3;
}

- (void)setFill:(id)a3
{
  id v5;
  _TtC8Freeform12CRLShapeItem *v6;

  v5 = a3;
  v6 = self;
  sub_100923950(a3);

}

- (BOOL)isFreehandDrawingShape
{
  _TtC8Freeform12CRLShapeItem *v2;

  v2 = self;
  sub_100923C48();

  return 0;
}

- (BOOL)isTreatedAsFillForFreehandDrawing
{
  _TtC8Freeform12CRLShapeItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100923D4C();

  return v3;
}

- (CRLLineEnd)headLineEnd
{
  _TtC8Freeform12CRLShapeItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100923FA0();

  return (CRLLineEnd *)v3;
}

- (void)setHeadLineEnd:(id)a3
{
  id v5;
  _TtC8Freeform12CRLShapeItem *v6;

  v5 = a3;
  v6 = self;
  sub_100924148(a3);

}

- (CRLLineEnd)tailLineEnd
{
  _TtC8Freeform12CRLShapeItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1009244F0();

  return (CRLLineEnd *)v3;
}

- (void)setTailLineEnd:(id)a3
{
  id v5;
  _TtC8Freeform12CRLShapeItem *v6;

  v5 = a3;
  v6 = self;
  sub_100924698(a3);

}

- (BOOL)isTailEndOnLeftBestGuess
{
  uint64_t v3;
  _TtC8Freeform12CRLShapeItem *v4;
  _BYTE v6[24];

  v3 = swift_allocObject(&unk_101288668, 17, 7);
  *(_BYTE *)(v3 + 16) = 0;
  v4 = self;
  swift_retain(v3);
  sub_10077454C((uint64_t)sub_10092835C, v3);
  swift_release(v3);
  swift_beginAccess(v3 + 16, v6, 0, 0);
  LOBYTE(self) = *(_BYTE *)(v3 + 16);

  swift_release(v3);
  return (char)self;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  _TtC8Freeform12CRLShapeItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10092320C();

  return v3 & 1;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  _TtC8Freeform12CRLShapeItem *v2;
  char v3;

  v2 = self;
  v3 = sub_1009232C8();

  return v3 & 1;
}

- (double)strokePatternOffsetDistance
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  double result;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, __n128);
  _TtC8Freeform12CRLShapeItem *v12;
  __n128 v13;
  uint64_t v14;
  float v15;
  _DWORD v16[4];

  v3 = type metadata accessor for CRLShapeItemCRDTData.ShapeStyleData(0);
  __chkstk_darwin(v3);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v7 = *v6;
  v8 = swift_conformsToProtocol2(*v6, &protocol descriptor for CRLAbstractShapeItemDataProtocol);
  if (v8)
  {
    v10 = v8;
    v11 = *(void (**)(uint64_t, uint64_t, __n128))(v8 + 16);
    v12 = self;
    v13 = swift_retain(v6);
    v11(v7, v10, v13);
    swift_release(v6);
    v14 = sub_1004B804C(&qword_1013F55A0);
    CRRegister.wrappedValue.getter(v14);
    v15 = *(float *)&v16[3];
    sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLShapeItemCRDTData.ShapeStyleData);

    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setStrokePatternOffsetDistance:(double)a3
{
  _TtC8Freeform12CRLShapeItem *v4;

  v4 = self;
  sub_100924AC8(a3);

}

- (BOOL)canCopyStyle
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLShapeItem *v3;
  int v5;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4C0);
  v3 = self;
  if ((v2() & 1) != 0)
  {

    return 0;
  }
  else
  {
    v5 = (*(unsigned __int8 (**)(void))((swift_isaMask & (uint64_t)v3->super.super.super.super.isa) + 0x440))();

    return v5 != 6;
  }
}

- (BOOL)supportsFill
{
  return 1;
}

- (BOOL)allowsChangeShape
{
  uint64_t (*v2)(void);
  _TtC8Freeform12CRLShapeItem *v3;
  uint64_t v5;
  id v6;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x490);
  v3 = self;
  if ((v2() & 1) != 0)
  {

    return 0;
  }
  else
  {
    v5 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.super.super.super.isa) + 0x478))();
    v6 = objc_msgSend((id)v5, "bezierPath");

    LOBYTE(v5) = objc_msgSend(v6, "isLineSegment");
    return v5 ^ 1;
  }
}

@end
