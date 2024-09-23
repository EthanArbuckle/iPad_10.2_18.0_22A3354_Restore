@implementation PKSharingChannelHandle_Client

+ (id)createHandleForDescriptor:(id)a3 queue:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = a4;
  v7 = -[PKSharingChannelHandle_Client _initWithQueue:]([PKSharingChannelHandle_Client alloc], "_initWithQueue:", v6);
  objc_msgSend(v7, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PKSharingChannelHandle_Client_createHandleForDescriptor_queue___block_invoke;
  v13[3] = &unk_1E2AC4070;
  v13[4] = &v14;
  objc_msgSend(v8, "configureHandleWithDescriptor:completion:", v5, v13);
  if (*((_BYTE *)v15 + 24))
  {
    objc_msgSend(v7, "_fetchTransportIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v7[16];
    v7[16] = v9;

    v11 = v7;
  }
  else
  {
    objc_msgSend(v7, "invalidate");
    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)_initWithQueue:(id)a3
{
  _DWORD *v3;
  id *v4;
  PKXPCService *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKSharingChannelHandle_Client;
  v3 = -[PKSharingChannelHandle _initWithQueue:](&v11, sel__initWithQueue_, a3);
  v4 = (id *)v3;
  if (v3)
  {
    v3[30] = 0;
    v5 = [PKXPCService alloc];
    PDSharingChannelServiceInterface_Server();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKSharingChannelServiceInterface_Client();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v5, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.sharing-channel"), v6, v7, v4);
    v9 = v4[14];
    v4[14] = (id)v8;

    objc_msgSend(v4[14], "setDelegate:", v4);
  }
  return v4;
}

- (void)pingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke;
    v11[3] = &unk_1E2AD9270;
    v11[4] = self;
    v7 = v4;
    v13 = v7;
    v12 = v5;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __52__PKSharingChannelHandle_Client_pingWithCompletion___block_invoke_3;
    v9[3] = &unk_1E2ABDAE0;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "pingWithCompletion:", v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)attachWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke;
    v11[3] = &unk_1E2AD9270;
    v11[4] = self;
    v7 = v4;
    v13 = v7;
    v12 = v5;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __54__PKSharingChannelHandle_Client_attachWithCompletion___block_invoke_3;
    v9[3] = &unk_1E2ABDAE0;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "attachWithCompletion:", v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke;
    v14[3] = &unk_1E2AD9270;
    v14[4] = self;
    v10 = v7;
    v16 = v10;
    v15 = v8;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __56__PKSharingChannelHandle_Client_sendMessage_completion___block_invoke_3;
    v12[3] = &unk_1E2ABDAE0;
    v12[4] = self;
    v13 = v10;
    objc_msgSend(v11, "sendMessage:completion:", v6, v12);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)closeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke;
    v11[3] = &unk_1E2AD9270;
    v11[4] = self;
    v7 = v4;
    v13 = v7;
    v12 = v5;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __53__PKSharingChannelHandle_Client_closeWithCompletion___block_invoke_3;
    v9[3] = &unk_1E2ABDAE0;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "closeWithCompletion:", v9);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)relinquishWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke;
    v11[3] = &unk_1E2AD9270;
    v11[4] = self;
    v7 = v4;
    v13 = v7;
    v12 = v5;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __58__PKSharingChannelHandle_Client_relinquishWithCompletion___block_invoke_3;
    v9[3] = &unk_1E2ABDAE0;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "relinquishWithCompletion:", v9);

  }
  else if (v4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)markMessageAsHandled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PKSharingChannelHandle_Client_markMessageAsHandled___block_invoke;
    v12[3] = &unk_1E2AC0EF0;
    v8 = v5;
    v13 = v8;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __54__PKSharingChannelHandle_Client_markMessageAsHandled___block_invoke_2;
    v10[3] = &unk_1E2ABE120;
    v11 = v8;
    objc_msgSend(v9, "markMessageAsHandled:completion:", v4, v10);

  }
}

- (void)invalidateWithRemoteWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke;
  v11[3] = &unk_1E2ABD9C8;
  v6 = v4;
  v12 = v6;
  -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __68__PKSharingChannelHandle_Client_invalidateWithRemoteWithCompletion___block_invoke_2;
  v9[3] = &unk_1E2ABD9A0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "invalidateFromRemoteWithReply:", v9);

}

- (void)fetchHandleTransferToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertionAllowWhileTransferring:](self, "createActionAssertionAllowWhileTransferring:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__PKSharingChannelHandle_Client_fetchHandleTransferToken___block_invoke;
    v13[3] = &unk_1E2AC0EF0;
    v8 = v5;
    v14 = v8;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __58__PKSharingChannelHandle_Client_fetchHandleTransferToken___block_invoke_2;
    v10[3] = &unk_1E2ABDFE0;
    v12 = v4;
    v11 = v8;
    objc_msgSend(v9, "fetchHandleTransferToken:", v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (void)remoteDeviceInformation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  -[PKSharingChannelHandle createActionAssertion](self, "createActionAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke;
    v11[3] = &unk_1E2AD9270;
    v11[4] = self;
    v7 = v4;
    v13 = v7;
    v12 = v5;
    -[PKSharingChannelHandle_Client _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __57__PKSharingChannelHandle_Client_remoteDeviceInformation___block_invoke_3;
    v9[3] = &unk_1E2AD9298;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "remoteDeviceInformation:", v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

- (id)transportIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSString copy](self->_transportIdentifier, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_fetchTransportIdentifier
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t v8[8];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[PKSharingChannelHandle_Client _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__125;
  v14 = __Block_byref_object_dispose__126;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PKSharingChannelHandle_Client__fetchTransportIdentifier__block_invoke;
  v9[3] = &unk_1E2AC3D58;
  v9[4] = &v10;
  objc_msgSend(v2, "transportIdentifierWithCompletion:", v9);
  v3 = (void *)v11[5];
  if (!v3)
  {
    PKLogFacilityTypeGetObject(0x21uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to get transport identifier!", v8, 2u);
    }

    v5 = (void *)v11[5];
    v11[5] = (uint64_t)CFSTR("UNKNOWN");

    v3 = (void *)v11[5];
  }
  v6 = v3;
  _Block_object_dispose(&v10, 8);

  return v6;
}

+ (void)descriptorsForAccountDevices:(id)a3
{
  id v3;
  PKSharingChannelHandle_Client *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a3;
  v4 = [PKSharingChannelHandle_Client alloc];
  v5 = -[PKSharingChannelHandle_Client _initWithQueue:](v4, "_initWithQueue:", MEMORY[0x1E0C80D38]);
  v6 = (void *)v5;
  if (v5)
  {
    v7 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = CFSTR("XPC-Helper");

    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke;
    v15[3] = &unk_1E2ABEB88;
    v9 = v6;
    v16 = v9;
    v10 = v3;
    v17 = v10;
    objc_msgSend(v9, "_remoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __62__PKSharingChannelHandle_Client_descriptorsForAccountDevices___block_invoke_3;
    v12[3] = &unk_1E2ABDE50;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v11, "descriptorsForAccountDevices:", v12);

  }
  else
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }

}

- (void)invalidateFromRemoteWithReply:(id)a3
{
  -[PKSharingChannelHandle invalidateWithSource:completion:](self, "invalidateWithSource:completion:", 1, a3);
}

- (void)didReceiveMessages:(id)a3 reply:(id)a4
{
  void (**v5)(_QWORD);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSharingChannelHandle_Client;
  v5 = (void (**)(_QWORD))a4;
  -[PKSharingChannelHandle didReceiveMessages:](&v6, sel_didReceiveMessages_, a3);
  v5[2](v5);

}

- (void)didReceiveUpdatedTransportIdentifier:(id)a3 reply:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  NSString *v8;
  NSString *transportIdentifier;
  void (**v10)(void);

  p_lock = &self->_lock;
  v10 = (void (**)(void))a4;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  v8 = (NSString *)objc_msgSend(v7, "copy");

  transportIdentifier = self->_transportIdentifier;
  self->_transportIdentifier = v8;

  os_unfair_lock_unlock(p_lock);
  v10[2]();

}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  -[PKSharingChannelHandle invalidateWithSource:completion:](self, "invalidateWithSource:completion:", 2, 0);
}

- (id)_remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
