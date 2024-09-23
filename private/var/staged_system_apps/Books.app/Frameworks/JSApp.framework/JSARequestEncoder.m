@implementation JSARequestEncoder

- (JSARequestEncoder)initWithTokenService:(id)a3 bag:(id)a4 cookiesToSuppress:(id)a5
{
  objc_super v9;

  *(_QWORD *)&self->AMSMediaRequestEncoder_opaque[OBJC_IVAR___JSARequestEncoder_cookiesToSuppress] = static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RequestEncoder();
  return -[JSARequestEncoder initWithTokenService:bag:](&v9, "initWithTokenService:bag:", a3, a4);
}

- (id)requestByEncodingRequest:(id)a3 parameters:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  JSARequestEncoder *v11;
  uint64_t v12;
  JSARequestEncoder *v13;
  void *v14;
  void *v15;
  _OWORD v17[2];

  v7 = type metadata accessor for URLRequest(0, a2);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a4)
  {
    v11 = self;
    v12 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v17, v12);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v13 = self;
  }
  sub_42E70((uint64_t)v10, (uint64_t)v17);
  v15 = v14;

  sub_42ACC((uint64_t)v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (JSARequestEncoder)initWithTokenService:(id)a3 bag:(id)a4
{
  JSARequestEncoder *result;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  result = (JSARequestEncoder *)_swift_stdlib_reportUnimplementedInitializer("JSApp.RequestEncoder", 20, "init(tokenService:bag:)", 23, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->AMSMediaRequestEncoder_opaque[OBJC_IVAR___JSARequestEncoder_cookiesToSuppress]);
}

@end
