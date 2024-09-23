@implementation UserTrustAgentOperations

- (BOOL)createUserTrustedProfileEntryWithUuid:(id)a3 teamId:(id)a4 signature:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _TtC17online_auth_agent24UserTrustAgentOperations *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _TtC17online_auth_agent24UserTrustAgentOperations *v22;
  uint64_t v24;

  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (!a4)
  {
    v14 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v22 = self;
    v19 = 0;
    v21 = 0xF000000000000000;
    goto LABEL_6;
  }
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  a4 = v15;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v16 = a5;
  v24 = v11;
  v17 = v16;
  v18 = self;
  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = v20;

  v11 = v24;
LABEL_6:
  UserTrustAgentOperations.createUserTrustedProfileEntry(uuid:teamId:signature:)((uint64_t)v13, v14, (uint64_t)a4, v19, v21);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  sub_10000F2D8(v19, v21);
  swift_bridgeObjectRelease(a4);
  return 1;
}

- (BOOL)deleteTrustedProfileWithUuid:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC17online_auth_agent24UserTrustAgentOperations *v10;
  uint64_t v12;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_100022644((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return 1;
}

- (_TtC17online_auth_agent24UserTrustAgentOperations)init
{
  uint64_t v3;
  _TtC17online_auth_agent24UserTrustAgentOperations *v4;
  char v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC17online_auth_agent24UserTrustAgentOperations_utdb;
  type metadata accessor for UserTrustDB();
  v4 = self;
  v5 = sub_1000132E8();
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100022E74(v5 & 1);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for UserTrustAgentOperations();
  return -[UserTrustAgentOperations init](&v7, "init");
}

- (void).cxx_destruct
{

}

@end
