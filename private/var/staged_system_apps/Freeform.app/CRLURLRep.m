@implementation CRLURLRep

- (_TtC8Freeform9CRLURLRep)initWithLayout:(id)a3 canvas:(id)a4
{
  char *v5;
  id v6;
  _TtC8Freeform9CRLURLRep *result;

  v5 = (char *)a3;
  v6 = a4;
  sub_1005B18A8(v5, a4);
  return result;
}

- (void)willBeRemoved
{
  _TtC8Freeform9CRLURLRep *v2;

  v2 = self;
  sub_1005B1BB8();

}

- (void)processChangedProperty:(unint64_t)a3
{
  _TtC8Freeform9CRLURLRep *v4;

  v4 = self;
  sub_1005B20FC(a3);

}

- (_TtC8Freeform10CRLURLItem)item
{
  _TtC8Freeform9CRLURLRep *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1005B2820();
  v4 = v3;

  return (_TtC8Freeform10CRLURLItem *)v4;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)cancelReload:(id)a3
{
  _TtC8Freeform9CRLURLRep *v5;
  uint64_t v6;
  _TtC8Freeform9CRLURLRep *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1005B294C();

  sub_1004D28EC((uint64_t)v8);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Freeform9CRLURLRep_downloadObserverIdentifier;
  v3 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)enterPreviewMode
{
  _TtC8Freeform9CRLURLRep *v2;

  v2 = self;
  sub_100D469D4();

}

- (NSURL)previewItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC8Freeform9CRLURLRep *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  NSURL *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v3 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  CRLLinkViewHostingRep.item.getter();
  v8 = v7;
  v10 = v9;
  ObjectType = swift_getObjectType(v7);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(ObjectType, v10);

  swift_unknownObjectRelease(v8);
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v5, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v14);
    v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
  }
  return (NSURL *)v15;
}

- (NSString)previewItemTitle
{
  _TtC8Freeform9CRLURLRep *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v2 = self;
  CRLLinkViewHostingRep.item.getter();
  v4 = v3;
  v6 = v5;
  ObjectType = swift_getObjectType(v3);
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(ObjectType, v6);
  v9 = v8;

  swift_unknownObjectRelease(v4);
  if (v9)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

@end
