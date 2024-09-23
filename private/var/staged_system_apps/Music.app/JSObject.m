@implementation JSObject

- (void)dealloc
{
  _TtC11MusicJSCore8JSObject *v3;
  uint64_t v4;
  _TtC11MusicJSCore8JSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  objc_super v11;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSObject_isNativeOnly) == 1)
  {
    v3 = self;
  }
  else
  {
    v4 = qword_1011E7348;
    v5 = self;
    if (v4 != -1)
      swift_once(&qword_1011E7348, sub_100CF45BC);
    v6 = (void *)static JSBridge.shared;
    v8 = *(uint64_t *)((char *)&v5->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier);
    v7 = *(_QWORD *)&v5->nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier];
    sub_1000A9B84();
    v9 = (_QWORD *)swift_allocObject(&unk_101119B88, 40, 7);
    v9[2] = v6;
    v9[3] = v8;
    v9[4] = v7;
    swift_bridgeObjectRetain_n(v7, 2);
    v10 = v6;
    static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_100D3BEAC, (uint64_t)v9);
    swift_bridgeObjectRelease();
    swift_release();
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for JSObject();
  -[JSObject dealloc](&v11, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier]);
}

- (int64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  _TtC11MusicJSCore8JSObject *v4;
  int64_t v5;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier);
  v3 = *(_QWORD *)&self->nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore8JSObject_nativeBridgeIdentifier];
  v4 = self;
  v5 = String.hashValue.getter(v2, v3);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11MusicJSCore8JSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MusicJSCore8JSObject *v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v11, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = JSObject.isEqual(_:)((uint64_t)v11);

  sub_1002293F8((uint64_t)v11);
  return v9 & 1;
}

- (_TtC11MusicJSCore8JSObject)init
{
  _TtC11MusicJSCore8JSObject *result;

  result = (_TtC11MusicJSCore8JSObject *)_swift_stdlib_reportUnimplementedInitializer("MusicJSCore.JSObject", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
