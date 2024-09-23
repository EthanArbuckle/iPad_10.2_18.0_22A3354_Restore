@implementation PKTrustedDeviceEnrollmentInfoProvider

- (PKTrustedDeviceEnrollmentInfoProvider)init
{
  PKTrustedDeviceEnrollmentInfoProvider *v2;
  PKXPCService *v3;
  void *v4;
  uint64_t v5;
  PKXPCService *remoteService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKTrustedDeviceEnrollmentInfoProvider;
  v2 = -[PKTrustedDeviceEnrollmentInfoProvider init](&v8, sel_init);
  if (v2)
  {
    v3 = [PKXPCService alloc];
    PDTrustedDeviceEnrollmentInfoProviderExportedInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v3, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.trusted-device-enrollment-info-provider"), v4, 0, 0);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;

  }
  return v2;
}

- (void)trustedDeviceEnrollmentInfoWithCompletion:(id)a3
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

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABDA18;
    v7 = v4;
    v11[4] = self;
    v12 = v7;
    -[PKTrustedDeviceEnrollmentInfoProvider _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_3;
    v9[3] = &unk_1E2AD1C50;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "trustedDeviceEnrollmentInfoWithHandler:", v9);

  }
}

void __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_2;
  v3[3] = &unk_1E2ABDA18;
  v2 = *(id *)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_4;
  v10[3] = &unk_1E2ABDB58;
  v7 = *(id *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __83__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentInfoWithCompletion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5]);
}

- (void)trustedDeviceEnrollmentSignatureForDevice:(unint64_t)a3 accountDSID:(id)a4 sessionData:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v10 = a6;
  v11 = v10;
  if (v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke;
    v19[3] = &unk_1E2ABDD88;
    v13 = v10;
    v19[4] = self;
    v20 = v13;
    v14 = a5;
    v15 = a4;
    -[PKTrustedDeviceEnrollmentInfoProvider _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_3;
    v17[3] = &unk_1E2AD1CA0;
    v17[4] = self;
    v18 = v13;
    objc_msgSend(v16, "trustedDeviceEnrollmentSignatureForDevice:accountDSID:sessionData:handler:", a3, v15, v14, v17);

  }
}

void __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

void __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_4;
  v16[3] = &unk_1E2AD1C78;
  v21 = *(id *)(a1 + 40);
  v22 = a3;
  v17 = v9;
  v18 = v10;
  v12 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v20 = v12;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v16);

}

uint64_t __118__PKTrustedDeviceEnrollmentInfoProvider_trustedDeviceEnrollmentSignatureForDevice_accountDSID_sessionData_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[8] + 16))(a1[8], a1[4], a1[9], a1[5], a1[6]);
}

- (id)_remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", a3);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_existingRemoteObjectProxy
{
  return -[PKXPCService existingRemoteObjectProxy](self->_remoteService, "existingRemoteObjectProxy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
