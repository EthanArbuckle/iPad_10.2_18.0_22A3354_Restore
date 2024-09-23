@implementation SRSSmartRepliesServerXPCServer

- (_TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer)init
{
  return (_TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer *)SRSSmartRepliesServerXPCServer.().init()();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (void)predictForMessage:(NSString *)a3 conversationTurns:(NSArray *)a4 language:(NSString *)a5 plistPath:(NSString *)a6 espressoModelPath:(NSString *)a7 vocabPath:(NSString *)a8 heads:(NSArray *)a9 completion:(id)a10
{
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  NSString *v25;
  NSArray *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  NSArray *v31;
  _TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer *v32;
  char *v33;
  NSArray *v34;

  v34 = a9;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v17);
  v33 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  v21 = type metadata accessor for TaskPriority();
  v22 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v33, 1, 1, v21);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &async function pointer to partial apply for @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
  v23[5] = v20;
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &_sIeghH_IeAgH_TRTATu;
  v24[5] = v23;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = v34;
  v32 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(v22, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v24);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer_xpcListener));
  swift_release();
}

@end
