@implementation LaunchWarningDB

- (_TtC3mis15LaunchWarningDB)initWithDatabaseURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  objc_class *v9;
  _TtC3mis15LaunchWarningDB *v10;
  objc_super v12;

  v4 = sub_1DF331F44();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331F20();
  v8 = (void *)sub_1DF331F08();
  v9 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[SQLDB initWithDatabaseURL:](&v12, sel_initWithDatabaseURL_, v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

- (_TtC3mis15LaunchWarningDB)initWithDatabaseURL:(id)a3 asReadOnly:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  objc_class *v11;
  _TtC3mis15LaunchWarningDB *v12;
  objc_super v14;

  v4 = a4;
  v6 = sub_1DF331F44();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331F20();
  v10 = (void *)sub_1DF331F08();
  v11 = (objc_class *)type metadata accessor for LaunchWarningDB();
  v14.receiver = self;
  v14.super_class = v11;
  v12 = -[SQLDB initWithDatabaseURL:asReadOnly:](&v14, sel_initWithDatabaseURL_asReadOnly_, v10, v4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)setupSchema
{
  _TtC3mis15LaunchWarningDB *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1DF314DE0();

  return v3 & 1;
}

- (void)setupPermissions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC3mis15LaunchWarningDB *v7;
  NSURL *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = sub_1DF331F44();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[SQLDB dbURL](v7, sel_dbURL);
  sub_1DF331F20();

  sub_1DF331F2C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v9 = sub_1DF332058();
  swift_bridgeObjectRelease();
  sub_1DF3318F4((const char *)(v9 + 32));

  swift_release();
}

- (_TtC3mis15LaunchWarningDB)init
{
  _TtC3mis15LaunchWarningDB *result;

  result = (_TtC3mis15LaunchWarningDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
