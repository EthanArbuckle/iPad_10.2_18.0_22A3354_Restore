@implementation SFAccessibilityClient

+ (void)requestLabelForActivityWithSlotID:(unsigned int)a3 completionHandler:(id)a4
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  if (v5)
  {
    v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFAccessibilityClient/requestLabelForActivityWithSlotID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    if (requestLabelForActivityWithSlotID_completionHandler__onceToken != -1)
      dispatch_once(&requestLabelForActivityWithSlotID_completionHandler__onceToken, &__block_literal_global_39);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sharing.accessibility"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBE08);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "_setQueue:", requestLabelForActivityWithSlotID_completionHandler____xpc_queue);
    objc_msgSend(v7, "resume");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __77__SFAccessibilityClient_requestLabelForActivityWithSlotID_completionHandler___block_invoke_2;
    v12[3] = &unk_1E482E490;
    v9 = v5;
    v13 = v9;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "requestLabelForActivityWithSlotID:completionHandler:", v4, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

    os_activity_scope_leave(&state);
  }

}

void __77__SFAccessibilityClient_requestLabelForActivityWithSlotID_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.sharing.accessibility", v2);
  v1 = (void *)requestLabelForActivityWithSlotID_completionHandler____xpc_queue;
  requestLabelForActivityWithSlotID_completionHandler____xpc_queue = (uint64_t)v0;

}

uint64_t __77__SFAccessibilityClient_requestLabelForActivityWithSlotID_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Sharing client sent an accessibility request to the accessibility server but received error %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
