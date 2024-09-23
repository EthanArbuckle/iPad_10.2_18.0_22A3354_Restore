@implementation SmartRepliesXPCClient

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
  char *v32;
  NSArray *v33;

  v33 = a9;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v17);
  v32 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v22 = (uint64_t)v32;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v32, 1, 1, v21);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &async function pointer to partial apply for @objc closure #1 in SmartRepliesXPCClient.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
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
  v31 = v33;
  swift_retain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(v22, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v24);
  swift_release();
}

@end
