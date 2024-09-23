@implementation ActivityDispatcher

+ (id)getExecQ
{
  if (getExecQ_onceToken != -1)
    dispatch_once(&getExecQ_onceToken, &__block_literal_global);
  return (id)getExecQ__execQ;
}

void __30__ActivityDispatcher_getExecQ__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_BACKGROUND, -32768);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("PSE_BG_Q_for_collectors", v2);
  v1 = (void *)getExecQ__execQ;
  getExecQ__execQ = (uint64_t)v0;

}

+ (id)getErrorNoCollectorDefinitionsToRun
{
  if (getErrorNoCollectorDefinitionsToRun_onceToken != -1)
    dispatch_once(&getErrorNoCollectorDefinitionsToRun_onceToken, &__block_literal_global_3);
  return (id)getErrorNoCollectorDefinitionsToRun_kErrorNoCollectorDefinitionsToRun;
}

void __57__ActivityDispatcher_getErrorNoCollectorDefinitionsToRun__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PostSiriEngagement"), -1, &unk_24DA4C680);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getErrorNoCollectorDefinitionsToRun_kErrorNoCollectorDefinitionsToRun;
  getErrorNoCollectorDefinitionsToRun_kErrorNoCollectorDefinitionsToRun = v0;

}

+ (id)getErrorFailedCollectors:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v9 = CFSTR("failed_collectors");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PostSiriEngagement"), -10, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runCollectorsDefinedInParameters:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  ActivityDispatcher *v9;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  specialized ActivityDispatcher.runCollectorsDefinedIn(parameters:completion:)(v6, v8, v9, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

@end
