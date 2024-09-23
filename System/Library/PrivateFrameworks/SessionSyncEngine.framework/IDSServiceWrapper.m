@implementation IDSServiceWrapper

- (_TtC17SessionSyncEngine17IDSServiceWrapper)init
{
  _TtC17SessionSyncEngine17IDSServiceWrapper *result;

  result = (_TtC17SessionSyncEngine17IDSServiceWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1C1292C70((uint64_t)self + OBJC_IVAR____TtC17SessionSyncEngine17IDSServiceWrapper_delegate);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _TtC17SessionSyncEngine17IDSServiceWrapper *v18;

  v8 = a6;
  if (!a5)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = sub_1C12B545C();
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = sub_1C12B5480();
  v8 = v14;
LABEL_6:
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = self;
  sub_1C1291FCC(a3, v12, v13, (uint64_t)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC17SessionSyncEngine17IDSServiceWrapper *v17;

  if (a5)
  {
    v11 = sub_1C12B5480();
    v13 = v12;
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = self;
  sub_1C1292934(v11, v13, (uint64_t)a7);

  swift_bridgeObjectRelease();
}

@end
