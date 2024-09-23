@implementation DKPairSetupSession

- (void)start
{
  _TtC14dockaccessoryd18DKPairSetupSession *v2;

  v2 = self;
  sub_10009F97C();

}

- (void)stop
{
  _TtC14dockaccessoryd18DKPairSetupSession *v2;

  v2 = self;
  sub_10009FD30(0);

}

- (void)stopWithError:(id)a3
{
  _TtC14dockaccessoryd18DKPairSetupSession *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_10009FD30((uint64_t)a3);

}

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  id v6;
  _TtC14dockaccessoryd18DKPairSetupSession *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC14dockaccessoryd18DKPairSetupSession *v13;

  if (a3)
  {
    v6 = a4;
    v7 = self;
    v8 = a3;
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = v10;

  }
  else
  {
    v12 = a4;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_1000AC194(v9, v11);

  sub_10009E3A0(v9, v11);
}

- (void)generateSessionKeys
{
  _TtC14dockaccessoryd18DKPairSetupSession *v2;

  v2 = self;
  sub_1000A6BF4();

}

- (BOOL)isSecureSession
{
  _TtC14dockaccessoryd18DKPairSetupSession *v2;
  _QWORD v4[5];
  _BOOL8 v5;

  v4[2] = self;
  v2 = self;
  OS_dispatch_queue.sync<A>(execute:)(&v5, sub_1000AD014, v4, &type metadata for Bool);

  return v5;
}

- (id)getCertificate
{
  return Data._bridgeToObjectiveC()().super.isa;
}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  return sub_1000A8A18(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))sub_1000A778C);
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  return sub_1000A8A18(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, uint64_t, unint64_t))sub_1000A7D90);
}

- (_TtC14dockaccessoryd18DKPairSetupSession)init
{
  _TtC14dockaccessoryd18DKPairSetupSession *result;

  result = (_TtC14dockaccessoryd18DKPairSetupSession *)_swift_stdlib_reportUnimplementedInitializer("dockaccessoryd.DKPairSetupSession", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000AD02C((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_delegate);

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10009E3A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readKey), *(_QWORD *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readKey]);
  sub_10009E3A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeKey), *(_QWORD *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeKey]);
  sub_10009E3A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_sessionKey), *(_QWORD *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_sessionKey]);
  sub_10009B2C0((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_sharedSecret, &qword_10026C568);
  sub_10009B2C0((uint64_t)self + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_prover, (uint64_t *)&unk_10026C590);
  sub_10009B2FC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readNonce), *(_QWORD *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_readNonce]);
  sub_10009B2FC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeNonce), *(_QWORD *)&self->role[OBJC_IVAR____TtC14dockaccessoryd18DKPairSetupSession_writeNonce]);
}

@end
