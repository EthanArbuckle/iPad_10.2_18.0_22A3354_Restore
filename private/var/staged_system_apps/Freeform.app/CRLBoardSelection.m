@implementation CRLBoardSelection

- (BOOL)isEqual:(id)a3
{
  _TtC8Freeform17CRLBoardSelection *v5;
  uint64_t v6;
  _TtC8Freeform17CRLBoardSelection *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  _BYTE v13[24];
  uint64_t v14;
  _OWORD v15[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v15, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v7 = self;
  }
  sub_1004F370C((uint64_t)v15, (uint64_t)v13);
  if (!v14)
  {
    sub_1004D28EC((uint64_t)v13);
    goto LABEL_8;
  }
  v8 = type metadata accessor for CRLBoardSelection();
  if ((swift_dynamicCast(&v12, v13, (char *)&type metadata for Any + 8, v8, 6) & 1) == 0)
  {
LABEL_8:

    v10 = 0;
    goto LABEL_9;
  }
  v9 = v12;

  v10 = 1;
LABEL_9:
  sub_1004D28EC((uint64_t)v15);
  return v10;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  objc_class *ObjCClassFromMetadata;
  _TtC8Freeform17CRLBoardSelection *v6;
  NSString *v7;
  unint64_t v8;
  int64_t v9;

  v3 = type metadata accessor for CRLBoardSelection();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3, v4);
  v6 = self;
  v7 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);

  v8 = sub_1004D292C();
  v9 = StringProtocol.hash.getter(&type metadata for String, v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC8Freeform17CRLBoardSelection)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLBoardSelection();
  return -[CRLBoardSelection init](&v3, "init");
}

@end
