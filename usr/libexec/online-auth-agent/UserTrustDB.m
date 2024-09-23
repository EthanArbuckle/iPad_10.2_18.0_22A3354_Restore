@implementation UserTrustDB

- (BOOL)setupSchema
{
  _TtC17online_auth_agent11UserTrustDB *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10000E9E4();

  return v3 & 1;
}

- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  _TtC17online_auth_agent11UserTrustDB *v13;
  objc_super v15;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v12 = (objc_class *)type metadata accessor for UserTrustDB();
  v15.receiver = self;
  v15.super_class = v12;
  v13 = -[SQLDB initWithDatabaseURL:](&v15, "initWithDatabaseURL:", v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (_TtC17online_auth_agent11UserTrustDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSURL *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  _TtC17online_auth_agent11UserTrustDB *v15;
  objc_super v17;

  v4 = a4;
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for UserTrustDB();
  v17.receiver = self;
  v17.super_class = v14;
  v15 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v17, "initWithDatabaseURL:asReadOnly:", v13, v4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (void)setupPermissions
{
  _TtC17online_auth_agent11UserTrustDB *v2;

  v2 = self;
  sub_1000230C4();

}

- (_TtC17online_auth_agent11UserTrustDB)init
{
  _TtC17online_auth_agent11UserTrustDB *result;

  result = (_TtC17online_auth_agent11UserTrustDB *)_swift_stdlib_reportUnimplementedInitializer("online_auth_agent.UserTrustDB", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
