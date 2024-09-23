@implementation PKDeviceRegistrationService

+ (id)sharedInstance
{
  if (qword_1ECF225C8 != -1)
    dispatch_once(&qword_1ECF225C8, &__block_literal_global_117);
  return (id)_MergedGlobals_236;
}

void __45__PKDeviceRegistrationService_sharedInstance__block_invoke()
{
  PKDeviceRegistrationService *v0;
  void *v1;

  v0 = objc_alloc_init(PKDeviceRegistrationService);
  v1 = (void *)_MergedGlobals_236;
  _MergedGlobals_236 = (uint64_t)v0;

}

- (PKDeviceRegistrationService)init
{
  PKDeviceRegistrationService *v2;
  PKXPCService *v3;
  void *v4;
  uint64_t v5;
  PKXPCService *remoteService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKDeviceRegistrationService;
  v2 = -[PKDeviceRegistrationService init](&v8, sel_init);
  if (v2)
  {
    v3 = [PKXPCService alloc];
    PDDeviceRegistrationServiceInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v3, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.device-registration"), v4, 0, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKDeviceRegistrationService;
  -[PKDeviceRegistrationService dealloc](&v2, sel_dealloc);
}

- (void)performDeviceRegistrationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKDeviceRegistrationService_performDeviceRegistrationWithCompletion___block_invoke;
  v6[3] = &unk_1E2ACFCF8;
  v7 = v4;
  v5 = v4;
  -[PKDeviceRegistrationService performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:](self, "performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:", CFSTR("default"), 0, 0, v6);

}

uint64_t __71__PKDeviceRegistrationService_performDeviceRegistrationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performDeviceRegistrationForReason:(id)a3 brokerURL:(id)a4 actionType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PKDeviceRegistrationService_performDeviceRegistrationForReason_brokerURL_actionType_completion___block_invoke;
  v12[3] = &unk_1E2ACFCF8;
  v13 = v10;
  v11 = v10;
  -[PKDeviceRegistrationService performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:](self, "performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:", a3, a4, a5, v12);

}

uint64_t __98__PKDeviceRegistrationService_performDeviceRegistrationForReason_brokerURL_actionType_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)performRegistrationForMemberOfRegions:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v9 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKDeviceRegistrationService_performRegistrationForMemberOfRegions_withReason_completion___block_invoke;
  aBlock[3] = &unk_1E2ABE198;
  v16 = v9;
  v17 = a2;
  aBlock[4] = self;
  v10 = v9;
  v11 = a4;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKDeviceRegistrationService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performRegistrationForMemberOfRegions:withReason:completion:", v12, v11, v10);

}

void __91__PKDeviceRegistrationService_performRegistrationForMemberOfRegions_withReason_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKDeviceRegistrationService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    PKDisplayableErrorForCommonType(0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v4 + 16))(v4, 1, 0, v5);

  }
}

- (void)performRegistrationForRegion:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v9 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKDeviceRegistrationService_performRegistrationForRegion_withReason_completion___block_invoke;
  aBlock[3] = &unk_1E2ABE198;
  v16 = v9;
  v17 = a2;
  aBlock[4] = self;
  v10 = v9;
  v11 = a4;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKDeviceRegistrationService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performRegistrationForRegion:withReason:completion:", v12, v11, v10);

}

void __82__PKDeviceRegistrationService_performRegistrationForRegion_withReason_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKDeviceRegistrationService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    PKDisplayableErrorForCommonType(0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v4 + 16))(v4, 1, 0, v5);

  }
}

- (void)performDeviceRegistrationReturningContextForReason:(id)a3 brokerURL:(id)a4 actionType:(int64_t)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD aBlock[5];
  id v18;
  SEL v19;

  v11 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__PKDeviceRegistrationService_performDeviceRegistrationReturningContextForReason_brokerURL_actionType_completion___block_invoke;
  aBlock[3] = &unk_1E2ABE198;
  v18 = v11;
  v19 = a2;
  aBlock[4] = self;
  v12 = v11;
  v13 = a4;
  v14 = a3;
  v15 = _Block_copy(aBlock);
  -[PKDeviceRegistrationService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performDeviceRegistrationReturningContextForReason:brokerURL:actionType:completion:", v14, v13, a5, v12);

}

void __114__PKDeviceRegistrationService_performDeviceRegistrationReturningContextForReason_brokerURL_actionType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKDeviceRegistrationService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    PKDisplayableErrorForCommonType(0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, void *))(v4 + 16))(v4, 1, 0, v5);

  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
