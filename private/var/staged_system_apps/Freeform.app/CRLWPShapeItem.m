@implementation CRLWPShapeItem

- (_TtC8Freeform12CRLWPStorage)textStorage
{
  return (_TtC8Freeform12CRLWPStorage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage));
}

- (void)setTextStorage:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform12CRLWPStorage)text
{
  _TtC8Freeform12CRLWPStorage *result;

  result = *(_TtC8Freeform12CRLWPStorage **)((char *)&self->super.super.super.super.super.isa
                                           + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (BOOL)textIsVertical
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textIsVertical);
}

- (void)setTextIsVertical:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textIsVertical) = a3;
}

- (BOOL)hasVisibleContents
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10084AA98();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isAutogrowingTextBox
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10084AC78();

  return v3 & 1;
}

- (BOOL)shouldBeDeletedWhenEndEditing
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_10084AF04();

  return v3;
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC8Freeform14CRLWPShapeItem *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  uint64_t v17;

  v3 = type metadata accessor for UTType(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_10084AA98();
  if ((v8 & 1) != 0)
  {
    v9 = sub_1004B804C((uint64_t *)&unk_1013DFC30);
    v10 = swift_allocObject(v9, 48, 7);
    *(_OWORD *)(v10 + 16) = xmmword_100EF5E40;
    v11 = static UTType.utf8PlainText.getter(v10);
    v12 = UTType.identifier.getter(v11);
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    *(_QWORD *)(v10 + 32) = v12;
    *(_QWORD *)(v10 + 40) = v14;
  }

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)promisedStringForCopy
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10084B10C();
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
  return v5;
}

- (NSString)localizedName
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_10084B7F4);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_10084BA08);
}

- (void)prepareBoardItemForConnectorModeDuplication
{
  void *v2;
  _TtC8Freeform14CRLWPShapeItem *v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  int64_t v7;
  id v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v2)
  {
    v3 = self;
    v8 = v2;
    v4 = objc_msgSend(v8, "range");
    v6 = __OFADD__(v4, v5);
    v7 = (int64_t)v4 + v5;
    if (v6)
    {
      __break(1u);
    }
    else if (v7 >= (uint64_t)v4)
    {
      sub_1007D876C((uint64_t)v4, v7, 0, 0xE000000000000000, 1);

      return;
    }
    __break(1u);
  }
  __break(1u);
}

- (float)textInset
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform14CRLWPShapeItem *v9;
  uint64_t v10;
  float v11;
  _DWORD v13[4];

  v3 = type metadata accessor for CRLWPShapeItemCRDTData(0);
  __chkstk_darwin(v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v7 = type metadata accessor for CRLWPShapeItemData(0);
  v8 = swift_dynamicCastClassUnconditional(v6, v7, 0, 0, 0);
  (*(void (**)(void))(*(_QWORD *)v8 + 760))();
  v9 = self;
  swift_retain(v6);
  v10 = sub_1004B804C(&qword_1013F55A0);
  CRRegister.wrappedValue.getter(v10);
  v11 = *(float *)&v13[3];
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLWPShapeItemCRDTData);

  swift_release(v6);
  return v11;
}

- (void)setTextInset:(float)a3
{
  _TtC8Freeform14CRLWPShapeItem *v4;

  v4 = self;
  sub_10084BF58(a3);

}

- (int64_t)verticalAlignment
{
  uint64_t v3;
  uint64_t v4;
  _TtC8Freeform14CRLWPShapeItem *v5;
  int64_t v6;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v4 = type metadata accessor for CRLWPShapeItemData(0);
  swift_dynamicCastClassUnconditional(v3, v4, 0, 0, 0);
  v5 = self;
  swift_retain(v3);
  v6 = sub_1005603D8();

  swift_release(v3);
  return v6;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  _TtC8Freeform14CRLWPShapeItem *v4;

  v4 = self;
  sub_10084C27C(a3);

}

- (BOOL)shrinkToFit
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8Freeform14CRLWPShapeItem *v9;
  uint64_t v10;
  char v11;
  _BYTE v13[16];

  v3 = type metadata accessor for CRLWPShapeItemCRDTData(0);
  __chkstk_darwin(v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v7 = type metadata accessor for CRLWPShapeItemData(0);
  v8 = swift_dynamicCastClassUnconditional(v6, v7, 0, 0, 0);
  (*(void (**)(void))(*(_QWORD *)v8 + 760))();
  type metadata accessor for CRLWPShapeItemCRDTData.WPShapeStyleData(0);
  v9 = self;
  swift_retain(v6);
  v10 = sub_1004B804C((uint64_t *)&unk_1013F5590);
  CRRegister.wrappedValue.getter(v10);
  v11 = v13[15];
  sub_1004B84A4((uint64_t)v5, type metadata accessor for CRLWPShapeItemCRDTData);

  swift_release(v6);
  return v11;
}

- (void)setShrinkToFit:(BOOL)a3
{
  _TtC8Freeform14CRLWPShapeItem *v4;

  v4 = self;
  sub_10084C6E8(a3);

}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 dynamicallyDraggedLayout:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform14CRLWPShapeItem *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10084CB0C(v6, v7);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _TtC8Freeform14CRLWPShapeItem *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = self;
  v9 = sub_10084CCBC(v7, width, height);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3 size:(id)a4
{
  double height;
  double width;
  id v9;
  _TtC8Freeform14CRLWPShapeItem *v10;
  CGAffineTransform *result;
  __int128 v12;
  __int128 v13;
  _OWORD v14[3];

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = self;
  sub_10084CE14(v9, v14, width, height);

  v12 = v14[1];
  v13 = v14[2];
  *(_OWORD *)&retstr->a = v14[0];
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = v13;
  return result;
}

- (BOOL)allowsChangeShape
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10084D164();

  return v3 & 1;
}

- (Class)layoutClass
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_10084D33C();

  return (Class)swift_getObjCClassFromMetadata(v3, v4);
}

- (Class)repClass
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_10084D394();

  if (v3)
    return (Class)swift_getObjCClassFromMetadata(v3, v4);
  else
    return 0;
}

- (Class)editorClass
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_10084D4DC();

  return (Class)swift_getObjCClassFromMetadata(v3, v4);
}

- (NSArray)stringContentForSearch
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  Class isa;

  v2 = self;
  sub_100850084();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage));
}

- (NSArray)childInfos
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  Class isa;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v2)
  {
    v3 = sub_1004B804C((uint64_t *)&unk_1013E4180);
    v4 = swift_allocObject(v3, 40, 7);
    *(_OWORD *)(v4 + 16) = xmmword_100EEF400;
    *(_QWORD *)(v4 + 32) = v2;
    specialized Array._endMutation()(v4);
  }
  v5 = v2;
  sub_1004B804C(&qword_1013E0670);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (id)infoForSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform14CRLWPShapeItem *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100850468(v4);

  return v6;
}

- (id)childEnumerator
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  Class isa;
  id v8;
  id v9;

  v2 = self;
  v3 = -[CRLWPShapeItem childInfos](v2, "childInfos");
  v4 = sub_1004B804C(&qword_1013E0670);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  sub_100521380(v5);
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone((Class)NSArray);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v8 = objc_msgSend(v6, "initWithArray:", isa, swift_bridgeObjectRelease().n128_f64[0]);

  v9 = objc_msgSend(v8, "objectEnumerator");
  return v9;
}

- (id)childEnumeratorForUserSearch
{
  _TtC8Freeform14CRLWPShapeItem *v2;
  id v3;

  v2 = self;
  v3 = sub_100850754();

  return v3;
}

- (BOOL)isGEnerativePlaygroundImageItem
{
  return 0;
}

- (id)generativePlaygroundStringsFor:(id)a3
{
  id v4;
  _TtC8Freeform14CRLWPShapeItem *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  sub_100D53A6C(v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

@end
