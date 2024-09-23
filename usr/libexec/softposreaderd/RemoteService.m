@implementation RemoteService

- (void)copyBuildDateWithReply:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (**v9)(void *, Class);
  void *v10;
  _TtC14softposreaderd13RemoteService *v11;
  id v12;
  id v13;
  Class isa;
  uint64_t v15;

  v5 = type metadata accessor for Date(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void (**)(void *, Class))_Block_copy(a3);
  v10 = (void *)objc_opt_self(SPRMeta);
  v11 = self;
  v12 = objc_msgSend(v10, "current");
  v13 = objc_msgSend(v12, "buildDate");

  static Date._unconditionallyBridgeFromObjectiveC(_:)(v13);
  isa = Date._bridgeToObjectiveC()().super.isa;
  v9[2](v9, isa);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  _Block_release(v9);

}

- (void)sharedPrimerProxyWithReply:(id)a3
{
  void *v4;
  _TtC14softposreaderd13RemoteService *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000BC94((void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)primerProxyWithConfiguration:(id)a3 reply:(id)a4
{
  void *v6;
  _TtC14softposreaderd12RemoteReader *v7;
  _TtC14softposreaderd13RemoteService *v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = _Block_copy(a4);
  v7 = (_TtC14softposreaderd12RemoteReader *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  _Block_copy(v6);
  v8 = self;
  sub_10000BF78((uint64_t)v7, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v7, v9, v10, v11, v12, v13, v14, v15);
}

- (_TtC14softposreaderd13RemoteService)init
{
  return (_TtC14softposreaderd13RemoteService *)sub_10000AD1C(self, (uint64_t)a2, type metadata accessor for RemoteService);
}

@end
