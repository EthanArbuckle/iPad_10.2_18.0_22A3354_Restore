@implementation SXPhoneNumberActionActivityProvider

- (SXPhoneNumberActionActivityProvider)initWithHost:(id)a3 messagePresenter:(id)a4 deviceCapabilities:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXPhoneNumberActionActivityProvider *v12;
  SXPhoneNumberActionActivityProvider *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXPhoneNumberActionActivityProvider;
  v12 = -[SXPhoneNumberActionActivityProvider init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_host, a3);
    objc_storeStrong((id *)&v13->_messagePresenter, a4);
    objc_storeStrong((id *)&v13->_deviceCapabilities, a5);
  }

  return v13;
}

- (id)activityGroupForAction:(id)a3
{
  id v4;
  SXActionActivityGroup *v5;
  void *v6;
  SXActionActivityGroup *v7;
  void *v8;
  int v9;
  uint64_t v10;
  SXBlockActionActivity *v11;
  void *v12;
  void *v13;
  SXBlockActionActivity *v14;
  SXBlockActionActivity *v15;
  void *v16;
  void *v17;
  id v18;
  SXBlockActionActivity *v19;
  void *v20;
  SXBlockActionActivity *v21;
  void *v22;
  void *v23;
  SXBlockActionActivity *v24;
  SXPasteboardActionActivity *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SXPasteboardActionActivity *v30;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;

  v4 = a3;
  v5 = [SXActionActivityGroup alloc];
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SXActionActivityGroup initWithTitle:](v5, "initWithTitle:", v6);

  -[SXPhoneNumberActionActivityProvider deviceCapabilities](self, "deviceCapabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasCellularTelephonyCapabilities");

  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    v11 = [SXBlockActionActivity alloc];
    SXBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Call"), &stru_24D68E0F8, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v10;
    v38[1] = 3221225472;
    v38[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke;
    v38[3] = &unk_24D6875A0;
    v38[4] = self;
    v39 = v4;
    v36[0] = v10;
    v36[1] = 3221225472;
    v36[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_2;
    v36[3] = &unk_24D6875A0;
    v36[4] = self;
    v37 = v39;
    v14 = -[SXBlockActionActivity initWithLabel:type:immediateBlock:userSelectedBlock:](v11, "initWithLabel:type:immediateBlock:userSelectedBlock:", v13, 0, v38, v36);
    -[SXActionActivityGroup addActivity:](v7, "addActivity:", v14);

  }
  v15 = [SXBlockActionActivity alloc];
  SXBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FaceTime Audio"), &stru_24D68E0F8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v10;
  v34[1] = 3221225472;
  v34[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_3;
  v34[3] = &unk_24D6875A0;
  v34[4] = self;
  v18 = v4;
  v35 = v18;
  v19 = -[SXBlockActionActivity initWithLabel:type:block:](v15, "initWithLabel:type:block:", v17, 1, v34);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v19);

  -[SXPhoneNumberActionActivityProvider messagePresenter](self, "messagePresenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v20, "canPresentMessage");

  if ((_DWORD)v16)
  {
    v21 = [SXBlockActionActivity alloc];
    SXBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Send Message"), &stru_24D68E0F8, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    v32[1] = 3221225472;
    v32[2] = __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_4;
    v32[3] = &unk_24D6875A0;
    v32[4] = self;
    v33 = v18;
    v24 = -[SXBlockActionActivity initWithLabel:type:block:](v21, "initWithLabel:type:block:", v23, 1, v32);
    -[SXActionActivityGroup addActivity:](v7, "addActivity:", v24);

  }
  v25 = [SXPasteboardActionActivity alloc];
  SXBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_24D68E0F8, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "phoneNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SXPasteboardActionActivity initWithLabel:type:pasteboard:string:](v25, "initWithLabel:type:pasteboard:string:", v27, 1, v28, v29);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v30);

  return v7;
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "call:showDialog:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "call:showDialog:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "faceTime:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__SXPhoneNumberActionActivityProvider_activityGroupForAction___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "message:", *(_QWORD *)(a1 + 40));
}

- (void)call:(id)a3 showDialog:(BOOL)a4
{
  _BOOL8 v4;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a4;
  v6 = (objc_class *)MEMORY[0x24BEB4950];
  v7 = a3;
  v16 = objc_alloc_init(v6);
  objc_msgSend(v16, "providersPassingTest:", &__block_literal_global_100);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x24BEB49E8]);
  objc_msgSend(v7, "phoneNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithType:value:", 2, v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49D0]), "initWithProvider:", v9);
  objc_msgSend(v13, "setVideo:", 0);
  objc_msgSend(v13, "setHandle:", v12);
  objc_msgSend(v13, "setShowUIPrompt:", v4);
  -[SXPhoneNumberActionActivityProvider host](self, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "openURL:completion:", v15, 0);

}

uint64_t __55__SXPhoneNumberActionActivityProvider_call_showDialog___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTelephonyProvider");
}

- (void)faceTime:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x24BEB4950];
  v5 = a3;
  v14 = objc_alloc_init(v4);
  objc_msgSend(v14, "providersPassingTest:", &__block_literal_global_17_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BEB49E8]);
  objc_msgSend(v5, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithType:value:", 2, v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49D0]), "initWithProvider:", v7);
  objc_msgSend(v11, "setVideo:", 0);
  objc_msgSend(v11, "setHandle:", v10);
  -[SXPhoneNumberActionActivityProvider host](self, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "openURL:completion:", v13, 0);

}

uint64_t __48__SXPhoneNumberActionActivityProvider_faceTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFaceTimeProvider");
}

- (void)message:(id)a3
{
  id v4;
  SXPresentableMessage *v5;
  void *v6;
  void *v7;
  SXPresentableMessage *v8;

  v4 = a3;
  v5 = [SXPresentableMessage alloc];
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXPresentableMessage initWithRecipient:message:](v5, "initWithRecipient:message:", v6, 0);
  -[SXPhoneNumberActionActivityProvider messagePresenter](self, "messagePresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentMessage:", v8);

}

- (void)copy:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDF6C40];
  v4 = a3;
  objc_msgSend(v3, "generalPasteboard");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setString:", v5);
}

- (SXHost)host
{
  return self->_host;
}

- (SXMessagePresenter)messagePresenter
{
  return self->_messagePresenter;
}

- (SXDeviceCapabilities)deviceCapabilities
{
  return self->_deviceCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilities, 0);
  objc_storeStrong((id *)&self->_messagePresenter, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
