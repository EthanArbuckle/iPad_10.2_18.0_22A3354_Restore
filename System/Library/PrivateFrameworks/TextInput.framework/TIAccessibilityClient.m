@implementation TIAccessibilityClient

+ (void)requestLabelForProactiveCandidateWithSlotID:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  if (v5)
  {
    if (requestLabelForProactiveCandidateWithSlotID_completionHandler__onceToken != -1)
      dispatch_once(&requestLabelForProactiveCandidateWithSlotID_completionHandler__onceToken, &__block_literal_global_281);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.accessibility"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A700);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v7);

    objc_msgSend(v6, "_setQueue:", requestLabelForProactiveCandidateWithSlotID_completionHandler____xpc_queue);
    objc_msgSend(v6, "resume");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__TIAccessibilityClient_requestLabelForProactiveCandidateWithSlotID_completionHandler___block_invoke_2;
    v11[3] = &unk_1E243A720;
    v8 = v5;
    v12 = v8;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "requestLabelForProactiveCandidateWithSlotID:completionHandler:", v4, v8);
    else
      (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);

  }
}

uint64_t __87__TIAccessibilityClient_requestLabelForProactiveCandidateWithSlotID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("TextInput client sent an accessibility request to the accessibility server but received error %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__TIAccessibilityClient_requestLabelForProactiveCandidateWithSlotID_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.accessibility", v2);
  v1 = (void *)requestLabelForProactiveCandidateWithSlotID_completionHandler____xpc_queue;
  requestLabelForProactiveCandidateWithSlotID_completionHandler____xpc_queue = (uint64_t)v0;

}

@end
