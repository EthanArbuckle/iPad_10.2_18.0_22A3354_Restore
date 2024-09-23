@implementation TIAutofill

+ (void)sendAutofillCredentialCandidate:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (sendAutofillCredentialCandidate_completionHandler__onceToken != -1)
      dispatch_once(&sendAutofillCredentialCandidate_completionHandler__onceToken, &__block_literal_global_6889);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.autofill-server"), 4096);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A908);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "_setQueue:", sendAutofillCredentialCandidate_completionHandler____xpc_queue);
    objc_msgSend(v7, "resume");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__TIAutofill_sendAutofillCredentialCandidate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E243A720;
    v9 = (void (**)(_QWORD))v6;
    v13 = v9;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "reportSelectedAutofillCredential:completionHandler:", v5, v9);
    else
      v9[2](v9);

  }
}

uint64_t __64__TIAutofill_sendAutofillCredentialCandidate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("App reported candidate selection index to autofill server but received error %@"), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__TIAutofill_sendAutofillCredentialCandidate_completionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.autofill-request", v2);
  v1 = (void *)sendAutofillCredentialCandidate_completionHandler____xpc_queue;
  sendAutofillCredentialCandidate_completionHandler____xpc_queue = (uint64_t)v0;

}

@end
