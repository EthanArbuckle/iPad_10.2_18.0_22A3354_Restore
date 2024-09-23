@implementation CRLConnectionLineItem

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  _TtC8Freeform21CRLConnectionLineItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10086C0C4();

  return v3 & 1;
}

- (BOOL)supportsFill
{
  return 0;
}

- (BOOL)isTailEndOnLeftBestGuess
{
  _TtC8Freeform21CRLConnectionLineItem *v2;
  char v3;
  char v4;

  v2 = self;
  sub_10086C1C8();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)allowsChangeShape
{
  return 0;
}

- (Class)layoutClass
{
  _TtC8Freeform21CRLConnectionLineItem *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = self;
  v3 = sub_10086CEA4();

  return (Class)swift_getObjCClassFromMetadata(v3, v4);
}

- (Class)repClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, (unint64_t *)&unk_1013F6300, off_101229880);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (Class)editorClass
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1004B8930(0, (unint64_t *)&unk_101401450, off_101229858);
  return (Class)swift_getObjCClassFromMetadata(v2, v3);
}

- (BOOL)isLine
{
  return 1;
}

- (BOOL)hasOneArrowhead
{
  _TtC8Freeform21CRLConnectionLineItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10086D1BC();

  return v3 & 1;
}

- (BOOL)hasOneLineEnd
{
  _TtC8Freeform21CRLConnectionLineItem *v2;
  char v3;

  v2 = self;
  v3 = sub_10086DB4C();

  return v3 & 1;
}

+ (id)commandActionStringForConnectingFrom:(id)a3 oldConnectedFrom:(id)a4 newConnectedTo:(id)a5 oldConnectedTo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSString v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  sub_100873D4C(a3, a4, a5, a6);

  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)getConnectedFromWithBoardItemOwner:(id)a3
{
  return sub_100870C94(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, id, uint64_t))sub_100873448);
}

- (void)setConnectedFrom:(id)a3
{
  id v5;
  _TtC8Freeform21CRLConnectionLineItem *v6;

  v5 = a3;
  v6 = self;
  sub_100870894(a3);

}

- (id)getConnectedToWithBoardItemOwner:(id)a3
{
  return sub_100870C94(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, id, uint64_t))sub_100873700);
}

- (void)setConnectedTo:(id)a3
{
  id v5;
  _TtC8Freeform21CRLConnectionLineItem *v6;

  v5 = a3;
  v6 = self;
  sub_100870D00(a3);

}

- (BOOL)isConnectedWithBoardItem:(id)a3 boardItemOwner:(id)a4
{
  id v7;
  _TtC8Freeform21CRLConnectionLineItem *v8;
  char v9;

  swift_getObjectType(a4);
  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  v9 = sub_10087335C(v7, a4, (uint64_t)v8);

  swift_unknownObjectRelease(a4);
  return v9 & 1;
}

- (id)commandToConnectWithBoardItems:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _TtC8Freeform21CRLConnectionLineItem *v7;
  void *v8;
  void *v9;

  v5 = type metadata accessor for CRLBoardItem(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_100871170(v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (void)applyConnectionLineStylingsFromConnectionLineLayoutToUse:(id)a3
{
  id v5;
  _TtC8Freeform21CRLConnectionLineItem *v6;

  v5 = a3;
  v6 = self;
  sub_10087167C(a3);

}

- (CRLConnectionLinePathSource)connectionLinePathSource
{
  _QWORD *v3;
  uint64_t v4;
  CRLConnectionLinePathSource *result;
  uint64_t (*v6)(uint64_t);
  _TtC8Freeform21CRLConnectionLineItem *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v4 = *v3;
  result = (CRLConnectionLinePathSource *)swift_conformsToProtocol2(*v3, &protocol descriptor for CRLAbstractShapeItemDataProtocol);
  if (result)
  {
    v6 = *(uint64_t (**)(uint64_t))(v4 + 704);
    v7 = self;
    v8 = swift_retain(v3);
    v9 = (void *)v6(v8);
    swift_release(v3);
    v10 = objc_opt_self(CRLConnectionLinePathSource);
    v11 = (void *)swift_dynamicCastObjCClass(v9, v10);

    if (!v11)
    return (CRLConnectionLinePathSource *)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC8Freeform21CRLConnectionLineItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5 pathSource:(id)a6 stroke:(id)a7 headLineEnd:(id)a8 tailLineEnd:(id)a9
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;

  v15 = type metadata accessor for UUID(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  return (_TtC8Freeform21CRLConnectionLineItem *)sub_100872DA0((uint64_t)v18, (uint64_t)v17, v19, v20, a7, a8, a9);
}

@end
