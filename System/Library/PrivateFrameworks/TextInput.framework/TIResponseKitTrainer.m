@implementation TIResponseKitTrainer

+ (void)performTrainingForClient:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (performTrainingForClient_withCompletionHandler__onceToken != -1)
    dispatch_once(&performTrainingForClient_withCompletionHandler__onceToken, &__block_literal_global_7694);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.rdt"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A968);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  objc_msgSend(v6, "_setQueue:", performTrainingForClient_withCompletionHandler__xpcQueue);
  objc_msgSend(v6, "resume");
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6_7698);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "performTrainingForClient:withCompletionHandler:", v10, v5);

}

void __71__TIResponseKitTrainer_performTrainingForClient_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s sent a train request to the ResponseKitTrainer server but received error %@"), "+[TIResponseKitTrainer performTrainingForClient:withCompletionHandler:]_block_invoke_2", a2);
}

void __71__TIResponseKitTrainer_performTrainingForClient_withCompletionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.response-kit-trainer", v2);
  v1 = (void *)performTrainingForClient_withCompletionHandler__xpcQueue;
  performTrainingForClient_withCompletionHandler__xpcQueue = (uint64_t)v0;

}

@end
