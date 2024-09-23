@implementation SSUIServiceClient

- (SSUIServiceClient)init
{
  SSUIServiceClient *v2;
  uint64_t v3;
  FBSServiceFacilityClient *facilityClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUIServiceClient;
  v2 = -[SSUIServiceClient init](&v6, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE384F0]), "initWithConfigurator:", &__block_literal_global_1);
  facilityClient = v2->_facilityClient;
  v2->_facilityClient = (FBSServiceFacilityClient *)v3;

  return v2;
}

void __25__SSUIServiceClient_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BE384F0];
  v5 = a2;
  objc_msgSend(v2, "defaultShellEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndpoint:", v3);

  objc_msgSend(v5, "setIdentifier:", SSUIServiceIdentifier);
  objc_msgSend(MEMORY[0x24BE383D0], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setCalloutQueue:", MEMORY[0x24BDAC9B8]);
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  FBSServiceFacilityClient *facilityClient;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x24BE38518]);
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke;
  v15[3] = &unk_24D06BEC0;
  v10 = v6;
  v16 = v10;
  v11 = (void *)objc_msgSend(v8, "initWithMessagePacker:", v15);
  facilityClient = self->_facilityClient;
  if (v7)
  {
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke_2;
    v13[3] = &unk_24D06BEE8;
    v14 = v7;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](facilityClient, "sendMessage:withType:replyHandler:waitForReply:timeout:", v11, 0, v13, 0, 10.0);

  }
  else
  {
    -[FBSServiceFacilityClient sendMessage:withType:](facilityClient, "sendMessage:withType:", v11, 0);
  }

}

void __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BE0BEC8];
  v4 = a2;
  objc_msgSend(v3, "coder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("SSUIServiceRequest"));
  objc_msgSend(v6, "createMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(v4, "SSUIServiceRequest", v5);

}

uint64_t __48__SSUIServiceClient_sendRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facilityClient, 0);
}

@end
