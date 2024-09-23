@implementation LaunchWarningDB

- (_TtC17online_auth_agent15LaunchWarningDB)initWithDatabaseURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  _TtC17online_auth_agent15LaunchWarningDB *v13;
  objc_super v15;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  v12 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v15.receiver = self;
  v15.super_class = v12;
  v13 = -[SQLDB initWithDatabaseURL:](&v15, "initWithDatabaseURL:", v11);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (_TtC17online_auth_agent15LaunchWarningDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
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
  _TtC17online_auth_agent15LaunchWarningDB *v15;
  objc_super v17;

  v4 = a4;
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v17.receiver = self;
  v17.super_class = v14;
  v15 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v17, "initWithDatabaseURL:asReadOnly:", v13, v4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (BOOL)setupSchema
{
  _TtC17online_auth_agent15LaunchWarningDB *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100013540();

  return v3 & 1;
}

- (void)setupPermissions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC17online_auth_agent15LaunchWarningDB *v7;
  NSURL *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[SQLDB dbURL](v7, "dbURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v8);

  v9 = URL.path.getter();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v12 = String.utf8CString.getter(v9, v11);
  swift_bridgeObjectRelease(v11);
  sub_100003060((const char *)(v12 + 32));

  swift_release(v12);
}

- (_TtC17online_auth_agent15LaunchWarningDB)init
{
  _TtC17online_auth_agent15LaunchWarningDB *result;

  result = (_TtC17online_auth_agent15LaunchWarningDB *)_swift_stdlib_reportUnimplementedInitializer("online_auth_agent.LaunchWarningDB", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
