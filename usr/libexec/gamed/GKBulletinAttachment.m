@implementation GKBulletinAttachment

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t v5;

  sub_1001AFCC0();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3, v5);
  return (NSString *)v4;
}

- (NSURL)url
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSURL *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1001AFD80((uint64_t)v5);
  URL._bridgeToObjectiveC()(v6);
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v8;
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return sub_1001AFDE4() & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKBulletinAttachment)initWithIdentifier:(id)a3 url:(id)a4 hiddenFromDefaultExpandedView:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v8 = type metadata accessor for URL(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (GKBulletinAttachment *)sub_1001AFDFC(v11, v13, (uint64_t)v10, a5);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  GKBulletinAttachment *v5;

  v4 = a3;
  v5 = self;
  sub_1001AFF50(v4);

}

- (GKBulletinAttachment)initWithCoder:(id)a3
{
  return (GKBulletinAttachment *)sub_1001B0090(a3);
}

- (GKBulletinAttachment)init
{
  sub_1001B03BC();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->identifier[OBJC_IVAR___GKBulletinAttachment_identifier], a2);
  v3 = (char *)self + OBJC_IVAR___GKBulletinAttachment_url;
  v4 = sub_10019FB28();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
