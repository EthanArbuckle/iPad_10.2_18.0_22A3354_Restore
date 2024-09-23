@implementation UserTrustOperations

- (id)getAuxiliarySignatureWithTeamId:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC3mis19UserTrustOperations *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  id result;

  v5 = sub_1DF332040();
  v7 = v6;
  v8 = self;
  v11 = sub_1DF3118B8(v5, v7);
  v13 = v12;
  v14 = v9;
  v15 = v10;
  if (v12)
  {
    sub_1DF311874(v9, v10);
    v16 = (void *)sub_1DF331F74();
    sub_1DF311830(v14, v15);
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(objc_allocWithZone((Class)MISUserTrustSignature), sel_initWithSignature_, v16);

  if (v17)
  {
    sub_1DF3123D0(v11, v13, v14, v15);
    swift_bridgeObjectRelease();

    return v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)getUserTrustedUUIDsAndReturnError:(id *)a3
{
  _TtC3mis19UserTrustOperations *v3;
  void *v4;

  v3 = self;
  sub_1DF311F98();

  v4 = (void *)sub_1DF332088();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)profileEntryExistsWithUuidString:(id)a3 error:(id *)a4
{
  _TtC3mis19UserTrustOperations *v5;
  void *v6;

  sub_1DF332040();
  v5 = self;
  v6 = (void *)sub_1DF31A748();
  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC3mis19UserTrustOperations)init
{
  uint64_t v3;
  _TtC3mis19UserTrustOperations *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC3mis19UserTrustOperations_utdb;
  type metadata accessor for UserTrustDB();
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1DF311368(1);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for UserTrustOperations();
  return -[UserTrustOperations init](&v6, sel_init);
}

- (void).cxx_destruct
{

}

@end
