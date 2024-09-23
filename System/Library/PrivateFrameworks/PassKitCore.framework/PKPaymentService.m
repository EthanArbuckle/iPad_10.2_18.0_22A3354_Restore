@implementation PKPaymentService

- (PKPaymentService)initWithDelegate:(id)a3
{
  id v4;
  PKPaymentService *v5;
  PKPaymentService *v6;
  NSMutableArray *v7;
  NSMutableArray *pendingInvitationRequests;
  void *v9;
  PKXPCService *v10;
  void *v11;
  uint64_t v12;
  PKXPCService *remoteService;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentService;
  v5 = -[PKPaymentService init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_forceConnectionOnResume = v4 != 0;
    v6->_pendingInvitationRequestsLock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingInvitationRequests = v6->_pendingInvitationRequests;
    v6->_pendingInvitationRequests = v7;

    PDPaymentServiceExtendedInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_interfaceType = 1;
    v10 = [PKXPCService alloc];
    PKPaymentServiceInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v10, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.payment"), v9, v11, v6);
    remoteService = v6->_remoteService;
    v6->_remoteService = (PKXPCService *)v12;

    -[PKXPCService setDelegate:](v6->_remoteService, "setDelegate:", v6);
    -[PKXPCService setForceConnectionOnResume:](v6->_remoteService, "setForceConnectionOnResume:", v6->_forceConnectionOnResume);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_forceConnectionOnResume)
    -[PKXPCService setForceConnectionOnResume:](self->_remoteService, "setForceConnectionOnResume:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentService;
  -[PKPaymentService dealloc](&v3, sel_dealloc);
}

- (PKPaymentService)init
{
  return -[PKPaymentService initWithDelegate:](self, "initWithDelegate:", 0);
}

- (PKPaymentWebServiceContext)sharedPaymentWebServiceContext
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v2 = MEMORY[0x1E0C809B0];
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a2;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke_219;
  v6[3] = &unk_1E2ACAEA0;
  v6[4] = &v8;
  objc_msgSend(v3, "usingSynchronousProxy:fetchSharedPaymentWebServiceContextWithCompletion:", 1, v6);
  v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return (PKPaymentWebServiceContext *)v4;
}

- (id)categoryVisualizationMagnitudesForPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID___block_invoke;
  v8[3] = &unk_1E2ABDE00;
  v8[4] = &v9;
  objc_msgSend(v5, "categoryVisualizationMagnitudesForPassUniqueID:completion:", v4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)hasPendingProvisioningsOfTypes:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  _QWORD aBlock[6];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke;
  aBlock[3] = &unk_1E2AC3158;
  aBlock[4] = self;
  aBlock[5] = a2;
  v7 = _Block_copy(aBlock);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke_12;
    v11[3] = &unk_1E2ABDD10;
    v11[4] = &v12;
    objc_msgSend(v8, "usingSynchronousProxy:hasPendingProvisioningsOfTypes:completion:", 1, v5, v11);

  }
  v9 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

uint64_t __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)familyMembersWithCompletion:(id)a3
{
  -[PKPaymentService familyMembersIgnoringCache:completion:](self, "familyMembersIgnoringCache:completion:", 0, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingInvitationRequests, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

void __67__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)applicationMessagesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke;
    v11[3] = &unk_1E2ABD9C8;
    v7 = v4;
    v12 = v7;
    -[PKPaymentService _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke_2;
    v9[3] = &unk_1E2ABE008;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v8, "usingSynchronousProxy:applicationMessagesWithCompletion:", 0, v9);

  }
}

- (id)_extendedRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPaymentService _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPaymentService description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an extended interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (void)familyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  SEL v16;

  v4 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke;
  v14[3] = &unk_1E2AC1C68;
  v16 = a2;
  v9 = v7;
  v15 = v9;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_261;
  v12[3] = &unk_1E2ABE008;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "familyMembersIgnoringCache:completion:", v4, v12);

}

- (id)_extendedRemoteObjectProxyWithFailureHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPaymentService _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPaymentService description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an extended interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasInterfaceOfType:(unint64_t)a3
{
  unint64_t interfaceType;
  BOOL v4;
  BOOL v5;

  interfaceType = self->_interfaceType;
  v4 = interfaceType == 1;
  v5 = interfaceType < 2;
  if (a3 == 1)
    return v4;
  else
    return v5;
}

- (void)featureApplicationsForAccountUserInvitationWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke_271;
  v11[3] = &unk_1E2AC3558;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "featureApplicationsForAccountUserInvitationWithCompletion:", v11);

}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v11 = v8;
    aBlock[4] = self;
    v17 = v11;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_2;
    v14[3] = &unk_1E2ACAB58;
    v14[4] = self;
    v15 = v11;
    objc_msgSend(v13, "conflictingExpressPassIdentifiersForPassInformation:withCompletion:", v7, v14);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", a3);
}

void __61__PKPaymentService_paymentDeviceDidEnterFieldWithProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentDeviceDidEnterFieldWithProperties:", *(_QWORD *)(a1 + 32));

}

- (void)paymentDeviceDidEnterFieldWithProperties:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  self->_hasPaymentDeviceFieldProperties = v4 != 0;
  v5 = MEMORY[0x1E0C809B0];
  atomic_store(1u, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __61__PKPaymentService_paymentDeviceDidEnterFieldWithProperties___block_invoke;
  v7[3] = &unk_1E2ACA9F0;
  v8 = v4;
  v6 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v7);

}

- (void)_accessDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (self->_forceConnectionOnResume && WeakRetained == 0)
  {
    self->_forceConnectionOnResume = 0;
    -[PKXPCService setForceConnectionOnResume:](self->_remoteService, "setForceConnectionOnResume:", 0);
  }
  if (v7)
    v7[2](v7, v5);

}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke_8;
  v14[3] = &unk_1E2ABDF68;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "checkInvitationStatusForMailboxAddress:completion:", v10, v14);

}

void __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __79__PKPaymentService_Sharing__checkInvitationStatusForMailboxAddress_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke_10;
  v14[3] = &unk_1E2AC30B8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "retrieveShareInvitationForMailboxAddress:completion:", v10, v14);

}

void __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __81__PKPaymentService_Sharing__retrieveShareInvitationForMailboxAddress_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke_12;
  v14[3] = &unk_1E2ABDDB0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "relinquishInvitation:completion:", v10, v14);

}

void __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __61__PKPaymentService_Sharing__relinquishInvitation_completion___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke_14;
  v14[3] = &unk_1E2ABDDB0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "prewarmCreateShareForPassIdentifier:completion:", v10, v14);

}

void __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __76__PKPaymentService_Sharing__prewarmCreateShareForPassIdentifier_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke_15;
  v17[3] = &unk_1E2AC30E0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "createShareForPartialShareInvitation:authorization:completion:", v13, v12, v17);

}

void __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __91__PKPaymentService_Sharing__createShareForPartialShareInvitation_authorization_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v24 = a2;
  v13 = v11;
  aBlock[4] = self;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke_17;
  v20[3] = &unk_1E2AC3108;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "createShareInvitationForPartialShareInvitation:existingTransportIdentifier:authorization:completion:", v16, v15, v14, v20);

}

void __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, v3);

}

uint64_t __129__PKPaymentService_Sharing__createShareInvitationForPartialShareInvitation_existingTransportIdentifier_authorization_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke_19;
  v17[3] = &unk_1E2AC3130;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "acceptCarKeyShareForMessage:activationCode:completion:", v13, v12, v17);

}

void __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __83__PKPaymentService_Sharing__acceptCarKeyShareForMessage_activationCode_completion___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  PKPaymentService *v14;
  SEL v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __75__PKPaymentService_Sharing__cacheSharingMessageFromMailboxAddress_message___block_invoke;
  v13 = &unk_1E2AC3158;
  v14 = self;
  v15 = a2;
  v6 = a4;
  v7 = a3;
  v8 = _Block_copy(&v10);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8, v10, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cacheSharingMessageFromMailboxAddress:message:", v7, v6);

}

void __75__PKPaymentService_Sharing__cacheSharingMessageFromMailboxAddress_message___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)deleteSharingMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  PKPaymentService *v11;
  SEL v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __50__PKPaymentService_Sharing__deleteSharingMessage___block_invoke;
  v10 = &unk_1E2AC3158;
  v11 = self;
  v12 = a2;
  v4 = a3;
  v5 = _Block_copy(&v7);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v5, v7, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteSharingMessage:", v4);

}

void __50__PKPaymentService_Sharing__deleteSharingMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke_21;
  v16[3] = &unk_1E2AC3180;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "createSingleUseShareURLWithMessage:timeToLive:completion:", v12, a4, v16);

}

void __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __86__PKPaymentService_Sharing__createSingleUseShareURLWithMessage_timeToLive_completion___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v24 = a2;
  v13 = v11;
  aBlock[4] = self;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke_23;
  v20[3] = &unk_1E2ABDF68;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "updateShareForPassIdentifier:share:authorization:completion:", v16, v15, v14, v20);

}

void __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __89__PKPaymentService_Sharing__updateShareForPassIdentifier_share_authorization_completion___block_invoke_23(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  SEL v23;

  v6 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v23 = a2;
  v13 = v11;
  aBlock[4] = self;
  v22 = v13;
  v14 = a4;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke_24;
  v19[3] = &unk_1E2ABDF68;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "revokeShareForPassIdentifier:share:shouldCascade:completion:", v15, v14, v6, v19);

}

void __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __89__PKPaymentService_Sharing__revokeShareForPassIdentifier_share_shouldCascade_completion___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  SEL v23;

  v6 = a5;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v23 = a2;
  v13 = v11;
  aBlock[4] = self;
  v22 = v13;
  v14 = a4;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke_25;
  v19[3] = &unk_1E2ABDF68;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "revokeSharesForPassIdentifier:shares:shouldCascade:completion:", v15, v14, v6, v19);

}

void __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __91__PKPaymentService_Sharing__revokeSharesForPassIdentifier_shares_shouldCascade_completion___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  PKPaymentService *v11;
  SEL v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __58__PKPaymentService_Sharing__rejectShareForMailboxAddress___block_invoke;
  v10 = &unk_1E2AC3158;
  v11 = self;
  v12 = a2;
  v4 = a3;
  v5 = _Block_copy(&v7);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v5, v7, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rejectShareForMailboxAddress:", v4);

}

void __58__PKPaymentService_Sharing__rejectShareForMailboxAddress___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD aBlock[5];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a2;
  v7 = _Block_copy(aBlock);
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke_26;
  v11[3] = &unk_1E2ABDD38;
  v11[4] = &v12;
  objc_msgSend(v8, "usingSynchronousProxy:entitlementsForPassIdentifier:completion:", 1, v5, v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __59__PKPaymentService_Sharing__entitlementsForPassIdentifier___block_invoke_26(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)hasActiveExternallySharedPasses:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke_28;
  v11[3] = &unk_1E2ABDDB0;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "hasActiveExternallySharedPasses:", v11);

}

void __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __61__PKPaymentService_Sharing__hasActiveExternallySharedPasses___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke_29;
  v14[3] = &unk_1E2ABE008;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "displayableSharesForPassIdentifier:completion:", v10, v14);

}

void __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __75__PKPaymentService_Sharing__displayableSharesForPassIdentifier_completion___block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sharingCapabilitiesForPassIdentifier:(id)a3 outHasShares:(BOOL *)a4 outHasShareableEntitlements:(BOOL *)a5
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  _QWORD aBlock[6];

  v9 = a3;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke;
  aBlock[3] = &unk_1E2AC3158;
  aBlock[4] = self;
  aBlock[5] = a2;
  v11 = _Block_copy(aBlock);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke_30;
  v13[3] = &unk_1E2AC31C8;
  v13[5] = &v18;
  v13[6] = &v14;
  v13[4] = self;
  objc_msgSend(v12, "sharingCapabilitiesForPassIdentifier:completion:", v9, v13);
  if (a4)
    *a4 = *((_BYTE *)v19 + 24);
  if (a5)
    *a5 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

}

void __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __107__PKPaymentService_Sharing__sharingCapabilitiesForPassIdentifier_outHasShares_outHasShareableEntitlements___block_invoke_30(uint64_t result, char a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = a3;
  return result;
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke_32;
  v14[3] = &unk_1E2ABE008;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "displayableEntitlementsForPassIdentifier:completion:", v10, v14);

}

void __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __81__PKPaymentService_Sharing__displayableEntitlementsForPassIdentifier_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke_33;
  v17[3] = &unk_1E2ABDF68;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "sendSharingMessageTo:message:completion:", v13, v12, v17);

}

void __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __69__PKPaymentService_Sharing__sendSharingMessageTo_message_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke_34;
  v16[3] = &unk_1E2ABDDB0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "didReceiveActivationCodeFailureForCredentialIdentifier:attemptsRemaining:completion:", v12, a4, v16);

}

void __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __113__PKPaymentService_Sharing__didReceiveActivationCodeFailureForCredentialIdentifier_attemptsRemaining_completion___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke_35;
  v14[3] = &unk_1E2AC31F0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "pendingShareActivationForShareIdentifier:completion:", v10, v14);

}

void __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __81__PKPaymentService_Sharing__pendingShareActivationForShareIdentifier_completion___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)processSharingCLICommands:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke_39;
  v14[3] = &unk_1E2ABDFE0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "processSharingCLICommands:completion:", v10, v14);

}

void __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, const __CFString *))(v6 + 16))(v6, CFSTR("XPC Failure"));

}

uint64_t __66__PKPaymentService_Sharing__processSharingCLICommands_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)paymentOffersCatalog
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PKPaymentService_PaymentOffers__paymentOffersCatalog__block_invoke;
  v6[3] = &unk_1E2AC3468;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "paymentOffersCatalogWithCompletion:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__PKPaymentService_PaymentOffers__paymentOffersCatalog__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)updatePaymentOffersCatalogWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke_9;
  v11[3] = &unk_1E2AC3490;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updatePaymentOffersCatalogWithCompletion:", v11);

}

void __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);

}

uint64_t __76__PKPaymentService_PaymentOffers__updatePaymentOffersCatalogWithCompletion___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removePaymentOffersCatalog
{
  void *v3;
  void *v4;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PKPaymentService_PaymentOffers__removePaymentOffersCatalog__block_invoke;
  v5[3] = &unk_1E2AC3158;
  v5[4] = self;
  v5[5] = a2;
  v3 = _Block_copy(v5);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removePaymentOffersCatalog");

}

void __61__PKPaymentService_PaymentOffers__removePaymentOffersCatalog__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)eligiblePaymentOfferCriteriasForPassUniqueID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  _QWORD v13[4];
  void (**v14)(void *, void *);
  id v15;
  _QWORD aBlock[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E2AC34E0;
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PKPaymentService paymentOffersCatalog](self, "paymentOffersCatalog");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v11[2](v11, v12);
  }
  else
  {
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_3;
    v13[3] = &unk_1E2AC3530;
    v14 = v11;
    v15 = v10;
    -[PKPaymentService updatePaymentOffersCatalogWithCompletion:](self, "updatePaymentOffersCatalogWithCompletion:", v13);

  }
}

void __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "catalog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_2;
  v5[3] = &unk_1E2AC34B8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "pk_objectsPassingTest:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "associatedPassUniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

void __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_4;
  v9[3] = &unk_1E2AC3508;
  v10 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __91__PKPaymentService_PaymentOffers__eligiblePaymentOfferCriteriasForPassUniqueID_completion___block_invoke_4(_QWORD *a1)
{
  if (a1[4])
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  else
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], 0, a1[5]);
}

- (void)issuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_13;
  v14[3] = &unk_1E2AC3558;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "issuerInstallmentTransactionsForPassUniqueID:completion:", v10, v14);

}

void __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);

}

uint64_t __91__PKPaymentService_PaymentOffers__issuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteIssuerInstallmentTransactionsForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_15;
  v14[3] = &unk_1E2ABDD88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteIssuerInstallmentTransactionsForPassUniqueID:completion:", v10, v14);

}

void __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __97__PKPaymentService_PaymentOffers__deleteIssuerInstallmentTransactionsForPassUniqueID_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updatePaymentRewardsBalancesWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke_16;
  v14[3] = &unk_1E2AC3558;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updatePaymentRewardsBalancesWithPassUniqueIdentifier:completion:", v10, v14);

}

void __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);

}

uint64_t __99__PKPaymentService_PaymentOffers__updatePaymentRewardsBalancesWithPassUniqueIdentifier_completion___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke_17;
  v16[3] = &unk_1E2AC3558;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "updatePaymentRewardsRedemptionsWithPassUniqueIdentifier:limit:completion:", v12, a4, v16);

}

void __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __108__PKPaymentService_PaymentOffers__updatePaymentRewardsRedemptionsWithPassUniqueIdentifier_limit_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)paymentRewardsBalanceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentService_PaymentOffers__paymentRewardsBalanceWithIdentifier___block_invoke;
  v8[3] = &unk_1E2AC3580;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "paymentRewardsBalanceWithIdentifier:completion:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __71__PKPaymentService_PaymentOffers__paymentRewardsBalanceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)paymentRewardsBalancesWithPassUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PKPaymentService_PaymentOffers__paymentRewardsBalancesWithPassUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E2AC35A8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "paymentRewardsBalancesWithPassUniqueIdentifier:completion:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __82__PKPaymentService_PaymentOffers__paymentRewardsBalancesWithPassUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_limit___block_invoke;
  v10[3] = &unk_1E2AC35A8;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v7, "paymentRewardsRedemptionsForPassUniqueIdentifier:limit:completion:", v6, a4, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __90__PKPaymentService_PaymentOffers__paymentRewardsRedemptionsForPassUniqueIdentifier_limit___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)paymentRewardsRedemptionForPaymentHash:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__9;
  v13 = __Block_byref_object_dispose__9;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_PaymentOffers__paymentRewardsRedemptionForPaymentHash___block_invoke;
  v8[3] = &unk_1E2AC35D0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "paymentRewardsRedemptionForPaymentHash:completion:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__PKPaymentService_PaymentOffers__paymentRewardsRedemptionForPaymentHash___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)insertOrUpdatePaymentRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v6 = a4;
  v7 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__PKPaymentService_PaymentOffers__insertOrUpdatePaymentRewardsRedemption_withPassUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E2ABE120;
  v9[4] = self;
  objc_msgSend(v8, "insertOrUpdatePaymentRewardsRedemption:withPassUniqueIdentifier:completion:", v7, v6, v9);

}

- (void)deletePaymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__PKPaymentService_PaymentOffers__deletePaymentRewardsRedemptionsForPassUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E2ABE120;
  v6[4] = self;
  objc_msgSend(v5, "deletePaymentRewardsRedemptionsForPassUniqueIdentifier:completion:", v4, v6);

}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 policyIdentifier:(id)a4 targetDeviceIdentifier:(id)a5 credentialIdentifier:(id)a6 attestations:(id)a7 completion:(id)a8
{
  -[PKPaymentService provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attestations:completion:](self, "provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attestations:completion:", a3, a5, a6, a7, a8);
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v27 = a2;
  v15 = v13;
  aBlock[4] = self;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke_8;
  v23[3] = &unk_1E2AC8B20;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attestations:completion:", v19, v18, v17, v16, v23);

}

void __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __136__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provisionIdentityPassWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD aBlock[5];
  id v29;
  SEL v30;

  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v30 = a2;
  v17 = v15;
  aBlock[4] = self;
  v29 = v17;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_10;
  v26[3] = &unk_1E2AC8B20;
  v26[4] = self;
  v27 = v17;
  v25 = v17;
  objc_msgSend(v24, "provisionIdentityPassWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:attestations:supplementalData:completion:", v22, v21, v20, v19, v18, v26);

}

void __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __153__PKPaymentService_Identity__provisionIdentityPassWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_attestations_supplementalData_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)queueIdentityPassProvisioningWithPassMetadata:(id)a3 targetDeviceIdentifier:(id)a4 credentialIdentifier:(id)a5 supplementalData:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v27 = a2;
  v15 = v13;
  aBlock[4] = self;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke_11;
  v23[3] = &unk_1E2ABDD88;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "queueIdentityPassProvisioningWithPassMetadata:targetDeviceIdentifier:credentialIdentifier:supplementalData:completion:", v19, v18, v17, v16, v23);

}

void __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __148__PKPaymentService_Identity__queueIdentityPassProvisioningWithPassMetadata_targetDeviceIdentifier_credentialIdentifier_supplementalData_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prepareIdentityProvisioningForTargetDeviceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke_12;
  v14[3] = &unk_1E2ABDD88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "prepareIdentityProvisioningForTargetDeviceIdentifier:completion:", v10, v14);

}

void __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __94__PKPaymentService_Identity__prepareIdentityProvisioningForTargetDeviceIdentifier_completion___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateNotificationForProductIdentifier:(id)a3 configuration:(id)a4 localizedNotificationTitle:(id)a5 localizedNotificationMessage:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v27 = a2;
  v15 = v13;
  aBlock[4] = self;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke_13;
  v23[3] = &unk_1E2ABDD88;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "updateNotificationForProductIdentifier:configuration:localizedNotificationTitle:localizedNotificationMessage:completion:", v19, v18, v17, v16, v23);

}

void __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __150__PKPaymentService_Identity__updateNotificationForProductIdentifier_configuration_localizedNotificationTitle_localizedNotificationMessage_completion___block_invoke_13(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  uint64_t v4;
  _QWORD block[5];

  v4 = MEMORY[0x1E0C809B0];
  atomic_store(0, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __57__PKPaymentService_remoteService_didEstablishConnection___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__PKPaymentService_remoteService_didEstablishConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessDelegate:", &__block_literal_global_83);
}

void __57__PKPaymentService_remoteService_didEstablishConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "paymentServiceEstablishedConnection");

}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v4;
  _QWORD block[5];

  v4 = MEMORY[0x1E0C809B0];
  atomic_store(0, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __57__PKPaymentService_remoteService_didInterruptConnection___block_invoke;
  block[3] = &unk_1E2ABE120;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __57__PKPaymentService_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessDelegate:", &__block_literal_global_35);
}

void __57__PKPaymentService_remoteService_didInterruptConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "paymentServiceReceivedInterruption");

}

- (void)remoteServiceDidSuspend:(id)a3
{
  atomic_store(0, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
}

- (id)_remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

- (id)_existingRemoteObjectProxy
{
  return -[PKXPCService existingRemoteObjectProxy](self->_remoteService, "existingRemoteObjectProxy");
}

- (id)_extendedRemoteObjectProxy
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[PKPaymentService _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0CB2FC0];
    -[PKPaymentService description](self, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ is not backed by an extended interface"), v6);

    v3 = 0;
  }
  return v3;
}

- (id)_extendedSynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPaymentService _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPaymentService description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an extended interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (void)paymentDeviceDidExitField
{
  self->_hasPaymentDeviceFieldProperties = 0;
  atomic_store(1u, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", &__block_literal_global_43_1);
}

void __45__PKPaymentService_paymentDeviceDidExitField__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "paymentDeviceDidExitField");

}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PKPaymentService_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __68__PKPaymentService_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateDefaultPaymentPassWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)didUpdateApplicationMessages:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PKPaymentService_didUpdateApplicationMessages___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __49__PKPaymentService_didUpdateApplicationMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateApplicationMessages:", *(_QWORD *)(a1 + 32));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __70__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didReceiveMessage:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PKPaymentService_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
  v12[3] = &unk_1E2ACAA40;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v12);

}

void __71__PKPaymentService_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passWithUniqueIdentifier:didUpdateTiles:forContext:", a1[4], a1[5], a1[6]);

}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PKPaymentService_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __70__PKPaymentService_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionSourceIdentifier:didReceiveTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __76__PKPaymentService_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didReceiveBalanceUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PKPaymentService_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __73__PKPaymentService_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didReceivePlanUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __102__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
  v14[3] = &unk_1E2ACAA68;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v14);

}

void __102__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didUpdateBalanceReminder:forBalanceWithIdentifier:", a1[4], a1[5], a1[6]);

}

- (void)didReceivePendingProvisioningUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PKPaymentService_didReceivePendingProvisioningUpdate___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __56__PKPaymentService_didReceivePendingProvisioningUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didReceivePendingProvisioningUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKPaymentService_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __83__PKPaymentService_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionSourceIdentifier:didRemoveTransactionWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__PKPaymentService_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __69__PKPaymentService_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRemoveTransactionsWithSourceIdentifierMapping:", *(_QWORD *)(a1 + 32));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  v8[3] = &unk_1E2ACAA90;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v8);

}

void __76__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didEnableMessageService:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  v8[3] = &unk_1E2ACAA90;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v8);

}

void __80__PKPaymentService_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didEnableTransactionService:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PKPaymentService_passWithUniqueIdentifier_didReceiveValueAddedServiceTransaction___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __84__PKPaymentService_passWithUniqueIdentifier_didReceiveValueAddedServiceTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passWithUniqueIdentifier:didReceiveValueAddedServiceTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __87__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didUpdateWithTransitPassProperties:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateCategoryVisualizationWithStyle___block_invoke;
  v8[3] = &unk_1E2ACAAB8;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v8);

}

void __92__PKPaymentService_paymentPassWithUniqueIdentifier_didUpdateCategoryVisualizationWithStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "paymentPassWithUniqueIdentifier:didUpdateCategoryVisualizationWithStyle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)featureApplicationAdded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PKPaymentService_featureApplicationAdded___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __44__PKPaymentService_featureApplicationAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureApplicationAdded:", *(_QWORD *)(a1 + 32));

}

- (void)featureApplicationRemoved:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKPaymentService_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __46__PKPaymentService_featureApplicationRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureApplicationRemoved:", *(_QWORD *)(a1 + 32));

}

- (void)featureApplicationChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKPaymentService_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __46__PKPaymentService_featureApplicationChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "featureApplicationChanged:", *(_QWORD *)(a1 + 32));

}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PKPaymentService_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __43__PKPaymentService_didUpdateFamilyMembers___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didUpdateFamilyMembers:", *(_QWORD *)(a1 + 32));

}

- (void)transactionBatch:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__PKPaymentService_transactionBatch_moreComing_readyForNextBatch___block_invoke;
  v12[3] = &unk_1E2ACAAE0;
  v15 = a4;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v12);

}

void __66__PKPaymentService_transactionBatch_moreComing_readyForNextBatch___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionBatch:moreComing:readyForNextBatch:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didRecieveCredentialInvitation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_pendingInvitationRequestsLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_pendingInvitationRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      objc_msgSend(v10, "invitation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isSameInvitationAsInvitation:", v4);

      if ((v12 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_12;
    -[NSMutableArray removeObject:](self->_pendingInvitationRequests, "removeObject:", v13);
    os_unfair_lock_unlock(&self->_pendingInvitationRequestsLock);
    objc_msgSend(v13, "invokeCompletionWithInvitation:error:", v4, 0);
  }
  else
  {
LABEL_9:

LABEL_12:
    os_unfair_lock_unlock(&self->_pendingInvitationRequestsLock);
    v13 = 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__PKPaymentService_didRecieveCredentialInvitation___block_invoke;
  v15[3] = &unk_1E2ACA9F0;
  v16 = v4;
  v14 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v15);

}

void __51__PKPaymentService_didRecieveCredentialInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didRecieveCredentialInvitation:", *(_QWORD *)(a1 + 32));

}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__PKPaymentService_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  v12[3] = &unk_1E2ACAA40;
  v13 = v8;
  v14 = v9;
  v15 = a5;
  v10 = v9;
  v11 = v8;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v12);

}

void __87__PKPaymentService_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "credential:forPaymentApplication:didUpdateRangingSuspensionReasons:", a1[4], a1[5], a1[6]);

}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PKPaymentService_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E2ACA9F0;
  v7 = v4;
  v5 = v4;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v6);

}

void __71__PKPaymentService_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "sharesDidUpdateWithPaymentPassWithUniqueIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentService_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __76__PKPaymentService_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transactionWithIdentifier:didDownloadTransactionReceipt:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PKPaymentService_didReceiveDeviceSharingCapabilities_forHandle___block_invoke;
  v10[3] = &unk_1E2ACAA18;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PKPaymentService _accessDelegate:](self, "_accessDelegate:", v10);

}

void __66__PKPaymentService_didReceiveDeviceSharingCapabilities_forHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didReceiveDeviceSharingCapabilities:forHandle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke;
  v15[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  v15[4] = self;
  v16 = v9;
  v10 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDDB0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "displayTapToRadarAlertForRequest:completion:", v10, v13);

}

void __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_98;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_98(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __64__PKPaymentService_displayTapToRadarAlertForRequest_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)setDoubleClickAllowed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDoubleClickAllowed:completion:", v3, &__block_literal_global_100);

}

- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_transactionsAppLaunchTokenForPassWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E2AC3D58;
  v8[4] = &v9;
  objc_msgSend(v5, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:handler:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __74__PKPaymentService_transactionsAppLaunchTokenForPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPaymentService_messagesAppLaunchTokenForPassWithUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E2AC3D58;
  v8[4] = &v9;
  objc_msgSend(v5, "messagesAppLaunchTokenForPassWithUniqueIdentifier:handler:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __70__PKPaymentService_messagesAppLaunchTokenForPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5
{
  -[PKPaymentService _submitVerificationCode:verificationData:forDPANIdentifier:usingSynchronousProxy:completion:](self, "_submitVerificationCode:verificationData:forDPANIdentifier:usingSynchronousProxy:completion:", a3, a4, a5, 1, 0);
}

- (void)submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 completion:(id)a6
{
  -[PKPaymentService _submitVerificationCode:verificationData:forDPANIdentifier:usingSynchronousProxy:completion:](self, "_submitVerificationCode:verificationData:forDPANIdentifier:usingSynchronousProxy:completion:", a3, a4, a5, 0, a6);
}

- (void)_submitVerificationCode:(id)a3 verificationData:(id)a4 forDPANIdentifier:(id)a5 usingSynchronousProxy:(BOOL)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  _QWORD aBlock[4];
  id v26;
  SEL v27;
  BOOL v28;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke;
  aBlock[3] = &unk_1E2ACAB08;
  v27 = a2;
  v15 = v13;
  v26 = v15;
  v28 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = _Block_copy(aBlock);
  if (a6)
    -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", v19);
  else
    -[PKPaymentService _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_2;
  v22[3] = &unk_1E2ACAB30;
  v24 = a6;
  v22[4] = self;
  v23 = v15;
  v21 = v15;
  objc_msgSend(v20, "submitVerificationCode:verificationData:forDPANIdentifier:handler:", v18, v17, v16, v22);

}

void __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSObject *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD, _QWORD, _QWORD);
  __int128 buf;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  v6 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 32);
  if (v6)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v6[2](*(_QWORD *)(a1 + 32), 0, 0);
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_102;
      v10[3] = &unk_1E2ABD9A0;
      v11 = v6;
      v9 = v10;
      *(_QWORD *)&buf = v8;
      *((_QWORD *)&buf + 1) = 3221225472;
      v13 = __dispatch_async_ar_block_invoke_8;
      v14 = &unk_1E2ABD9A0;
      v15 = v9;
      dispatch_async(v7, &buf);

    }
  }

}

uint64_t __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v12;

  v4 = a3;
  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 40);
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v5[2](*(_QWORD *)(a1 + 40), 0, 0);
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_3;
      v9[3] = &unk_1E2ABD9A0;
      v10 = v5;
      v8 = v9;
      block[0] = v7;
      block[1] = 3221225472;
      block[2] = __dispatch_async_ar_block_invoke_8;
      block[3] = &unk_1E2ABD9A0;
      v12 = v8;
      dispatch_async(v6, block);

    }
  }

}

uint64_t __112__PKPaymentService__submitVerificationCode_verificationData_forDPANIdentifier_usingSynchronousProxy_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke;
  v21[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  v21[4] = self;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2;
  v19[3] = &unk_1E2ABE008;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "peerPaymentCounterpartHandlesForTransactionSourceIdentifier:startDate:endDate:completion:", v16, v15, v14, v19);

}

void __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_105;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_105(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __109__PKPaymentService_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke;
  v15[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  v15[4] = self;
  v16 = v9;
  v10 = a3;
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDDB0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "hasTransactionsForTransactionSourceIdentifiers:completion:", v10, v13);

}

void __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_107;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_107(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __78__PKPaymentService_hasTransactionsForTransactionSourceIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke;
  v21[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  v21[4] = self;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_2;
  v19[3] = &unk_1E2ACB2D0;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "insertOrUpdatePaymentTransaction:forPassUniqueIdentifier:paymentApplication:completion:", v16, v15, v14, v19);

}

void __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_108;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_108(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __107__PKPaymentService_insertOrUpdatePaymentTransaction_forPassUniqueIdentifier_paymentApplication_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)insertOrUpdatePaymentTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke;
  v18[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  v18[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E2ACB2D0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "insertOrUpdatePaymentTransaction:forTransactionSourceIdentifier:completion:", v13, v12, v16);

}

void __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_110;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_110(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __95__PKPaymentService_insertOrUpdatePaymentTransaction_forTransactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)removeMapsDataForTransactionWithIdentifier:(id)a3 forTransactionSourceIdentifier:(id)a4 issueReportIdentifier:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke;
  v21[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  v21[4] = self;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E2ACB2D0;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "removeMapsDataForTransactionWithIdentifier:forTransactionSourceIdentifier:issueReportIdentifier:completion:", v16, v15, v14, v19);

}

void __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_111;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_111(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __127__PKPaymentService_removeMapsDataForTransactionWithIdentifier_forTransactionSourceIdentifier_issueReportIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  _QWORD aBlock[5];
  id v29;
  SEL v30;

  v16 = a9;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v30 = a2;
  v18 = v16;
  aBlock[4] = self;
  v29 = v18;
  v19 = a7;
  v20 = a6;
  v21 = a3;
  v22 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E2ACAB58;
  v26[4] = self;
  v27 = v18;
  v24 = v18;
  objc_msgSend(v23, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v21, a4, a5, v20, v19, a8, v26);

}

void __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_112;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_112(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __137__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v27[5];
  id v28;
  _QWORD aBlock[5];
  id v30;
  SEL v31;

  v16 = a10;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v31 = a2;
  v18 = v16;
  aBlock[4] = self;
  v30 = v18;
  v19 = a7;
  v20 = a6;
  v21 = a3;
  v22 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2;
  v27[3] = &unk_1E2ACAB58;
  v27[4] = self;
  v28 = v18;
  v24 = v18;
  objc_msgSend(v23, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:orderedByDate:limit:completion:", v21, a4, a5, v20, v19, a8, a9, v27);

}

void __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_114;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_114(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __151__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_orderedByDate_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v24 = a2;
  v15 = v13;
  aBlock[4] = self;
  v23 = v15;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v20[3] = &unk_1E2ACAB58;
  v20[4] = self;
  v21 = v15;
  v19 = v15;
  objc_msgSend(v18, "transactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:limit:completion:", v16, a4, a5, a6, v20);

}

void __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_115;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_115(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __119__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 unit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD aBlock[5];
  id v24;
  SEL v25;

  v7 = a6;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v25 = a2;
  v15 = v13;
  aBlock[4] = self;
  v24 = v15;
  v16 = a4;
  v17 = a3;
  v18 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_2;
  v21[3] = &unk_1E2ABE008;
  v21[4] = self;
  v22 = v15;
  v20 = v15;
  objc_msgSend(v19, "transactionCountByPeriodForRequest:calendar:unit:includePurchaseTotal:completion:", v17, v16, a5, v7, v21);

}

void __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_116;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_116(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __101__PKPaymentService_transactionCountByPeriodForRequest_calendar_unit_includePurchaseTotal_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  _QWORD aBlock[5];
  id v30;
  SEL v31;

  v16 = a9;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v31 = a2;
  v18 = v16;
  aBlock[4] = self;
  v30 = v18;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_2;
  v27[3] = &unk_1E2ABE008;
  v27[4] = self;
  v28 = v18;
  v25 = v18;
  objc_msgSend(v24, "cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:completion:", v22, v21, v20, v19, a7, a8, v27);

}

void __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_117;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_117(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __128__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v27 = a2;
  v17 = v15;
  aBlock[4] = self;
  v26 = v17;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v23[3] = &unk_1E2ACAB58;
  v23[4] = self;
  v24 = v17;
  v22 = v17;
  objc_msgSend(v21, "transactionsForTransactionSourceIdentifiers:withPeerPaymentCounterpartHandles:withTransactionSource:withBackingData:limit:completion:", v19, v18, a5, a6, a7, v23);

}

void __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_118;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_118(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __153__PKPaymentService_transactionsForTransactionSourceIdentifiers_withPeerPaymentCounterpartHandles_withTransactionSource_withBackingData_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v27 = a2;
  v17 = v15;
  aBlock[4] = self;
  v26 = v17;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v23[3] = &unk_1E2ACAB58;
  v23[4] = self;
  v24 = v17;
  v22 = v17;
  objc_msgSend(v21, "transactionsForTransactionSourceIdentifiers:matchingMerchant:withTransactionSource:withBackingData:limit:completion:", v19, v18, a5, a6, a7, v23);

}

void __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_119;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_119(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __136__PKPaymentService_transactionsForTransactionSourceIdentifiers_matchingMerchant_withTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v27[5];
  id v28;
  _QWORD aBlock[5];
  id v30;
  SEL v31;

  v16 = a10;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v31 = a2;
  v18 = v16;
  aBlock[4] = self;
  v30 = v18;
  v19 = a8;
  v20 = a7;
  v21 = a3;
  v22 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v27[3] = &unk_1E2ACAB58;
  v27[4] = self;
  v28 = v18;
  v24 = v18;
  objc_msgSend(v23, "transactionsForTransactionSourceIdentifiers:withMerchantCategory:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v21, a4, a5, a6, v20, v19, a9, v27);

}

void __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_120;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_120(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __158__PKPaymentService_transactionsForTransactionSourceIdentifiers_withMerchantCategory_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v27[5];
  id v28;
  _QWORD aBlock[5];
  id v30;
  SEL v31;

  v16 = a10;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v31 = a2;
  v18 = v16;
  aBlock[4] = self;
  v30 = v18;
  v19 = a8;
  v20 = a7;
  v21 = a3;
  v22 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v27[3] = &unk_1E2ACAB58;
  v27[4] = self;
  v28 = v18;
  v24 = v18;
  objc_msgSend(v23, "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v21, a4, a5, a6, v20, v19, a9, v27);

}

void __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_121;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_121(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __157__PKPaymentService_transactionsForTransactionSourceIdentifiers_withTransactionType_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  _QWORD aBlock[5];
  id v29;
  SEL v30;

  v16 = a9;
  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v30 = a2;
  v18 = v16;
  aBlock[4] = self;
  v29 = v18;
  v19 = a7;
  v20 = a6;
  v21 = a3;
  v22 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E2ACAB58;
  v26[4] = self;
  v27 = v18;
  v24 = v18;
  objc_msgSend(v23, "approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v21, a4, a5, v20, v19, a8, v26);

}

void __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_122;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_122(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __145__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__26;
  v25 = __Block_byref_object_dispose__26;
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __134__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit___block_invoke;
  v20[3] = &unk_1E2AC46F8;
  v20[4] = self;
  v20[5] = &v21;
  objc_msgSend(v17, "approvedTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v14, a4, a5, v15, v16, a8, v20);
  v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __134__PKPaymentService_approvedTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[5];
  id v29;
  SEL v30;

  v17 = a9;
  v18 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v30 = a2;
  v19 = v17;
  aBlock[4] = self;
  v29 = v19;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  v23 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E2ACAB80;
  v27 = v19;
  v25 = v19;
  objc_msgSend(v24, "pendingTransactionsForTransactionSourceIdentifiers:withTransactionSource:withBackingData:startDate:endDate:limit:completion:", v22, a4, a5, v21, v20, a8, v26);

}

void __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_123;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_123(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __144__PKPaymentService_pendingTransactionsForTransactionSourceIdentifiers_withTransactionSource_withBackingData_startDate_endDate_limit_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsWithTransactionSource:(unint64_t)a3 withBackingData:(unint64_t)a4 limit:(int64_t)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v13 = v11;
  aBlock[4] = self;
  v20 = v13;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_2;
  v17[3] = &unk_1E2ACAB58;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "transactionsWithTransactionSource:withBackingData:limit:completion:", a3, a4, a5, v17);

}

void __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_124;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_124(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __87__PKPaymentService_transactionsWithTransactionSource_withBackingData_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionWithTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACB2D0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "transactionWithTransactionIdentifier:completion:", v10, v14);

}

void __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_125;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_125(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __68__PKPaymentService_transactionWithTransactionIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionsWithTransactionIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  SEL v14;

  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v13 = v7;
  v14 = a2;
  aBlock[4] = self;
  v8 = v7;
  v9 = a3;
  v10 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transactionsWithTransactionIdentifiers:completion:", v9, v8);

}

void __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke_126;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __70__PKPaymentService_transactionsWithTransactionIdentifiers_completion___block_invoke_126(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)transactionsWithFullPaymentHashes:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  SEL v14;

  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentService_transactionsWithFullPaymentHashes_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v13 = v7;
  v14 = a2;
  aBlock[4] = self;
  v8 = v7;
  v9 = a3;
  v10 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transactionsWithFullPaymentHashes:completion:", v9, v8);

}

void __65__PKPaymentService_transactionsWithFullPaymentHashes_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPaymentService_transactionsWithFullPaymentHashes_completion___block_invoke_127;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __65__PKPaymentService_transactionsWithFullPaymentHashes_completion___block_invoke_127(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)transactionSourceTypeForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2AC3E70;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "transactionSourceTypeForTransactionSourceIdentifier:completion:", v10, v14);

}

void __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_128;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_128(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E2ABDBD0;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v7;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v11 = v6;
  dispatch_async(v4, block);

}

uint64_t __83__PKPaymentService_transactionSourceTypeForTransactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ACB2D0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "transactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v13, v12, v17);

}

void __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_130;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_130(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __92__PKPaymentService_transactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACB2D0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "transactionWithReferenceIdentifier:completion:", v10, v14);

}

void __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_131;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_131(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __66__PKPaymentService_transactionWithReferenceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACAB58;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "installmentTransactionsForInstallmentPlanIdentifier:completion:", v10, v14);

}

void __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_132;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __83__PKPaymentService_installmentTransactionsForInstallmentPlanIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)installmentPlansWithTransactionReferennceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v10 = v7;
    aBlock[4] = self;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ACAB58;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "installmentPlansWithTransactionReferenceIdentifier:completion:", v11, v14);

  }
}

void __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_133;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_133(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __83__PKPaymentService_installmentPlansWithTransactionReferennceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
  _BOOL8 v12;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD aBlock[5];
  id v29;
  SEL v30;

  v12 = a5;
  v17 = a9;
  v18 = v17;
  if (v17)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v30 = a2;
    v19 = v17;
    aBlock[4] = self;
    v29 = v19;
    v20 = a8;
    v21 = a7;
    v22 = a4;
    v23 = a3;
    v25 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_2;
    v26[3] = &unk_1E2ACAB58;
    v26[4] = self;
    v27 = v19;
    objc_msgSend(v24, "installmentPlanTransactionsForTransactionSourceIdentifiers:accountIdentifier:redeemed:withRedemptionType:startDate:endDate:completion:", v23, v22, v12, a6, v21, v20, v26);

  }
}

void __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_134;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __154__PKPaymentService_installmentPlanTransactionsForTransactionSourceIdentifiers_accountIdentifier_redeemed_withRedemptionType_startDate_endDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)transactionsForRequest:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PKPaymentService_transactionsForRequest_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v10 = v7;
    aBlock[4] = self;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __54__PKPaymentService_transactionsForRequest_completion___block_invoke_2;
    v14[3] = &unk_1E2ABE008;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "transactionsForRequest:completion:", v11, v14);

  }
}

void __54__PKPaymentService_transactionsForRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PKPaymentService_transactionsForRequest_completion___block_invoke_135;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __54__PKPaymentService_transactionsForRequest_completion___block_invoke_135(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __54__PKPaymentService_transactionsForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)transactionsForRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "limit") - 11) > 0xFFFFFFFFFFFFFFF5)
  {
    -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v10 = buf;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__26;
    v13 = __Block_byref_object_dispose__26;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__PKPaymentService_transactionsForRequest___block_invoke;
    v8[3] = &unk_1E2AC35A8;
    v8[4] = self;
    v8[5] = buf;
    -[NSObject transactionsForRequest:completion:](v5, "transactionsForRequest:completion:", v4, v8);
    v6 = *((id *)v10 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Synchronous transaction request asking for too many transactions", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

void __43__PKPaymentService_transactionsForRequest___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v10 = v7;
    aBlock[4] = self;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_2;
    v14[3] = &unk_1E2ACABA8;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "transactionsTotalAmountForRequest:completion:", v11, v14);

  }
}

void __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_136;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_136(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__PKPaymentService_transactionsTotalAmountForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__26;
  v26 = __Block_byref_object_dispose__26;
  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __117__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type___block_invoke;
  v21[3] = &unk_1E2AC35A8;
  v21[4] = self;
  v21[5] = &v22;
  objc_msgSend(v18, "cashbackByPeriodForTransactionSourceIdentifiers:withStartDate:endDate:calendar:calendarUnit:type:completion:", v14, v15, v16, v17, a7, a8, v21);
  v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

void __117__PKPaymentService_cashbackByPeriodForTransactionSourceIdentifiers_withStartDate_endDate_calendar_calendarUnit_type___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (void)logoImageDataForURL:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PKPaymentService_logoImageDataForURL_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v10 = v7;
    aBlock[4] = self;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_2;
    v14[3] = &unk_1E2AC45E0;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "logoImageDataForURL:completion:", v11, v14);

  }
}

void __51__PKPaymentService_logoImageDataForURL_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_138;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __51__PKPaymentService_logoImageDataForURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)transactionsForPredicate:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v20 = a2;
    v12 = v9;
    aBlock[4] = self;
    v19 = v12;
    v13 = a3;
    v14 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_2;
    v16[3] = &unk_1E2ABE008;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "transactionsForPredicate:limit:completion:", v13, a4, v16);

  }
}

void __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_140;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__PKPaymentService_transactionsForPredicate_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Received transactions: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)passUniqueIdentifierForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDFE0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "passUniqueIdentifierForTransactionWithIdentifier:completion:", v10, v14);

}

void __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_141;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_141(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __80__PKPaymentService_passUniqueIdentifierForTransactionWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)passUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDFE0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "passUniqueIdentifierForTransactionWithServiceIdentifier:transactionSourceIdentifier:completion:", v13, v12, v17);

}

void __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_142;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_142(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __115__PKPaymentService_passUniqueIdentifierForTransactionWithServiceIdentifier_transactionSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDFE0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier:completion:", v10, v14);

}

void __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_143;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_143(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __96__PKPaymentService_ambiguousPassUniqueIdentifierForTransactionWithServiceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)mapsMerchantsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ACAB58;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "mapsMerchantsWithCompletion:", v11);

}

void __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_144;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_144(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __48__PKPaymentService_mapsMerchantsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __54__PKPaymentService_applicationMessagesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)tappedApplicationMessageWithKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usingSynchronousProxy:tappedApplicationMessageWithKey:completion:", 1, v4, &__block_literal_global_145_1);

}

- (void)updateFinanceKitApplicationMessages
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "usingSynchronousProxy:updateFinanceKitApplicationMessagesWithCompletion:", 1, &__block_literal_global_146);

}

- (void)removeApplicationMessageWithKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "usingSynchronousProxy:removeApplicationMessageWithKey:completion:", 1, v4, &__block_literal_global_147);

}

- (void)removeApplicationMessagesWithKeys:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke;
  v14[3] = &unk_1E2ABD9C8;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke_2;
  v12[3] = &unk_1E2ABD9A0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "usingSynchronousProxy:removeApplicationMessagesWithKeys:completion:", 0, v9, v12);

}

uint64_t __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __65__PKPaymentService_removeApplicationMessagesWithKeys_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACAB58;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "messagesForPaymentPassWithUniqueIdentifier:handler:", v10, v14);

}

void __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_148;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_148(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __74__PKPaymentService_messagesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)tilesForPassWithUniqueIdentifier:(id)a3 context:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    if (v8)
    {
      v11 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke;
      v16[3] = &unk_1E2ABD9C8;
      v12 = v9;
      v17 = v12;
      -[PKPaymentService _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke_2;
      v14[3] = &unk_1E2ABE008;
      v14[4] = self;
      v15 = v12;
      objc_msgSend(v13, "usingSynchronousProxy:tilesForPassWithUniqueIdentifer:context:completion:", 0, v8, a4, v14);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }
  }

}

uint64_t __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PKPaymentService_tilesForPassWithUniqueIdentifier_context_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)tilesForPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  -[PKPaymentService tilesForPassWithUniqueIdentifier:context:completion:](self, "tilesForPassWithUniqueIdentifier:context:completion:", a3, 1, a4);
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACAB58;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "balancesForPaymentPassWithUniqueIdentifier:handler:", v10, v14);

}

void __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_149;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_149(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __74__PKPaymentService_balancesForPaymentPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABE008;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "plansForPaymentPassWithUniqueIdentifier:handler:", v10, v14);

}

void __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_150;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_150(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __71__PKPaymentService_plansForPaymentPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[5];
  id v23;
  SEL v24;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v24 = a2;
  v11 = v9;
  aBlock[4] = self;
  v23 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_2;
  v20[3] = &unk_1E2ACABD0;
  v20[4] = self;
  v21 = v11;
  v19 = v11;
  objc_msgSend(v15, "balanceReminderThresholdForBalanceIdentifier:withPassUniqueIdentifier:handler:", v17, v18, v20);

}

void __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_151;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_151(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __75__PKPaymentService_balanceReminderThresholdForBalance_pass_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v27 = a2;
  v13 = v11;
  aBlock[4] = self;
  v26 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "anyObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_2;
  v23[3] = &unk_1E2ABDDB0;
  v23[4] = self;
  v24 = v13;
  v22 = v13;
  objc_msgSend(v18, "setBalanceReminder:forBalanceIdentifier:withPassUniqueIdentifier:handler:", v16, v20, v21, v23);

}

void __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_153;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_153(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __66__PKPaymentService_setBalanceReminder_forBalance_pass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDDB0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "cancelAutoTopUpForPassWithUniqueIdentifier:balanceIdentifiers:handler:", v13, v12, v17);

}

void __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_154;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_154(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __93__PKPaymentService_cancelAutoTopUpForPassWithUniqueIdentifier_balanceIdentifiers_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)commutePlanReminderForCommputePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  SEL v23;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v11 = v9;
  aBlock[4] = self;
  v22 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "uniqueID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_2;
  v19[3] = &unk_1E2ACABF8;
  v19[4] = self;
  v20 = v11;
  v18 = v11;
  objc_msgSend(v15, "commutePlanReminderForCommutePlanIdentifier:withPassUniqueIdentifier:handler:", v16, v17, v19);

}

void __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_155;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_155(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __75__PKPaymentService_commutePlanReminderForCommputePlan_pass_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD aBlock[5];
  id v25;
  SEL v26;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v26 = a2;
  v13 = v11;
  aBlock[4] = self;
  v25 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "uniqueID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_2;
  v22[3] = &unk_1E2ABDDB0;
  v22[4] = self;
  v23 = v13;
  v21 = v13;
  objc_msgSend(v18, "setCommutePlanReminder:forCommutePlanIdentifier:withPassUniqueIdentifier:handler:", v16, v19, v20, v22);

}

void __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_157;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_157(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __74__PKPaymentService_setCommutePlanReminder_forCommutePlan_pass_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePaymentTransactionWithIdentifier:handler:", v4, &__block_literal_global_158_0);

}

- (void)deletePaymentTransactionsWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deletePaymentTransactionsWithIdentifiers:handler:", v4, &__block_literal_global_159);

}

- (void)deleteAllTransactionsForTransactionSourceIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteAllTransactionsForTransactionSourceIdentifiers:handler:", v4, &__block_literal_global_160_0);

}

- (void)deleteMessagesForPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteAllMessagesForPaymentPassWithUniqueIdentifier:handler:", v4, &__block_literal_global_161);

}

- (void)archiveMessageWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archiveMessageWithIdentifier:handler:", v4, &__block_literal_global_162);

}

- (void)insertOrUpdateValueAddedServiceTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentTransaction:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke;
  v21[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  v21[4] = self;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_2;
  v19[3] = &unk_1E2ABDA18;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "insertOrUpdateValueAddedServiceTransaction:forPassUniqueIdentifier:paymentTransaction:handler:", v16, v15, v14, v19);

}

void __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_163;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_163(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_3;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __117__PKPaymentService_insertOrUpdateValueAddedServiceTransaction_forPassUniqueIdentifier_paymentTransaction_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)valueAddedServiceTransactionsForPassWithUniqueIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_2;
  v16[3] = &unk_1E2ACAB58;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "valueAddedServiceTransactionsForPassWithUniqueIdentifier:limit:handler:", v12, a4, v16);

}

void __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_164;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_164(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __94__PKPaymentService_valueAddedServiceTransactionsForPassWithUniqueIdentifier_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)valueAddedServiceTransactionsForPaymentTransaction:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];
  id v18;
  SEL v19;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v19 = a2;
  v10 = v8;
  aBlock[4] = self;
  v18 = v10;
  v11 = a3;
  v12 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_2;
  v15[3] = &unk_1E2ACAB58;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "valueAddedServiceTransactionsForPaymentTransaction:handler:", v11, v15);

}

void __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_165;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_165(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __88__PKPaymentService_valueAddedServiceTransactionsForPaymentTransaction_limit_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)valueAddedServiceTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ACAC20;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "valueAddedServiceTransactionWithIdentifier:handler:", v10, v14);

}

void __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_166;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_166(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __74__PKPaymentService_valueAddedServiceTransactionWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ACAC48;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "setDefaultPaymentApplication:forPassUniqueIdentifier:handler:", v13, v12, v17);

}

void __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_168;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_168(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __84__PKPaymentService_setDefaultPaymentApplication_forPassUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_defaultPaymentApplicationForPassUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E2ACAC70;
  v8[4] = &v9;
  objc_msgSend(v5, "defaultPaymentApplicationForPassUniqueIdentifier:handler:", v4, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __69__PKPaymentService_defaultPaymentApplicationForPassUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)initializeSecureElementIfNecessaryWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v5 = a3;
  if (PKSecureElementIsAvailable())
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v15 = a2;
    v7 = v5;
    aBlock[4] = self;
    v14 = v7;
    v8 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_2;
    v11[3] = &unk_1E2ACACC0;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v9, "initializeSecureElementIfNecessaryWithHandler:", v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "This device does not have a secure element", buf, 2u);
    }

    if (v5)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v5 + 2))(v5, 0, 0, 0);
  }

}

void __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_171;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_171(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

void __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  _QWORD block[4];
  id v22;

  v7 = a3;
  v8 = a4;
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_3;
  v15[3] = &unk_1E2ACAC98;
  v11 = *(id *)(a1 + 40);
  v20 = a2;
  v16 = v7;
  v17 = v8;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v12 = v15;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v22 = v12;
  v13 = v8;
  v14 = v7;
  dispatch_async(v9, block);

}

uint64_t __69__PKPaymentService_initializeSecureElementIfNecessaryWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)initializeSecureElement:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v5 = a3;
  if (PKSecureElementIsAvailable())
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PKPaymentService_initializeSecureElement___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v15 = a2;
    v7 = v5;
    aBlock[4] = self;
    v14 = v7;
    v8 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __44__PKPaymentService_initializeSecureElement___block_invoke_2;
    v11[3] = &unk_1E2ABDDB0;
    v11[4] = self;
    v12 = v7;
    objc_msgSend(v9, "initializeSecureElement:", v11);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "This device does not have a secure element", buf, 2u);
    }

    if (v5)
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

void __44__PKPaymentService_initializeSecureElement___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PKPaymentService_initializeSecureElement___block_invoke_173;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __44__PKPaymentService_initializeSecureElement___block_invoke_173(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __44__PKPaymentService_initializeSecureElement___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  _QWORD block[4];
  id v12;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PKPaymentService_initializeSecureElement___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __44__PKPaymentService_initializeSecureElement___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)sanitizeExpressPasses
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sanitizeExpressPasses");

}

- (id)defaultExpressFelicaTransitPassIdentifier
{
  NSObject *v2;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "PKPaymentService: DEPRECATED METHOD defaultExpressFelicaTransitPassIdentifier NO LONGER IMPLEMENTED.", v4, 2u);
  }

  return 0;
}

- (void)setDefaultExpressFelicaTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_2;
  v17[3] = &unk_1E2ACACE8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "setDefaultExpressTransitPassIdentifier:withCredential:completion:", v13, v12, v17);

}

void __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_174;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

void __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_174(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultExpressTransitPassIdentifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __91__PKPaymentService_setDefaultExpressFelicaTransitPassIdentifier_withCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)defaultExpressTransitPassIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[PKPaymentService expressPassConfigurationsWithCardType:](self, "expressPassConfigurationsWithCardType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passUniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDefaultExpressTransitPassIdentifier:(id)a3 withCredential:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_2;
  v17[3] = &unk_1E2ACACE8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "setDefaultExpressTransitPassIdentifier:withCredential:completion:", v13, v12, v17);

}

void __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_176;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

void __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_176(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultExpressTransitPassIdentifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __85__PKPaymentService_setDefaultExpressTransitPassIdentifier_withCredential_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isExpressModeEnabledForRemotePassUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  +[PKPassLibrary sharedInstanceWithRemoteLibrary](PKPassLibrary, "sharedInstanceWithRemoteLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_remoteLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passWithUniqueID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secureElementPass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isRemotePass"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__PKPaymentService_isExpressModeEnabledForRemotePassUniqueIdentifier___block_invoke;
    v12[3] = &unk_1E2AC27B0;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v9, "isExpressModeEnabledForRemotePassUniqueIdentifier:handler:", v4, v12);
    v10 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __70__PKPaymentService_isExpressModeEnabledForRemotePassUniqueIdentifier___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (BOOL)isExpressModeEnabledForPassUniqueIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[PKPaymentService expressPassConfigurationWithPassUniqueIdentifier:](self, "expressPassConfigurationWithPassUniqueIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)expressPassConfigurationWithPassUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_expressPassConfigurationWithPassUniqueIdentifier___block_invoke;
  v8[3] = &unk_1E2ACAD10;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "expressPassConfigurationWithPassUniqueIdentifier:handler:", v4, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __69__PKPaymentService_expressPassConfigurationWithPassUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)expressPassConfigurationsWithCardType:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PKPaymentService_expressPassConfigurationsWithCardType___block_invoke;
  v8[3] = &unk_1E2AC46F8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "expressPassConfigurationsWithCardType:handler:", a3, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __58__PKPaymentService_expressPassConfigurationsWithCardType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)expressPassesInformationWithAutomaticSelectionTechnologyType:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PKPaymentService_expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke;
  v8[3] = &unk_1E2AC46F8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "expressPassesInformationWithAutomaticSelectionTechnologyType:handler:", a3, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __81__PKPaymentService_expressPassesInformationWithAutomaticSelectionTechnologyType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)expressPassConfigurations
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__26;
  v11 = __Block_byref_object_dispose__26;
  v12 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PKPaymentService_expressPassConfigurations__block_invoke;
  v6[3] = &unk_1E2AC46F8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "usingSynchronousProxy:expressPassConfigurationsWithHandler:", 1, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __45__PKPaymentService_expressPassConfigurations__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)expressPassesInformation
{
  void *v2;
  void *v3;

  -[PKPaymentService expressPassConfigurations](self, "expressPassConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pk_setByApplyingBlock:", &__block_literal_global_180);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __44__PKPaymentService_expressPassesInformation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passInformation");
}

- (id)expressPassInformationForMode:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "PKPaymentService: DEPRECATED METHOD expressPassInformationForMode: NO LONGER IMPLEMENTED.", v5, 2u);
  }

  return 0;
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v11 = v8;
    aBlock[4] = self;
    v17 = v11;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_2;
    v14[3] = &unk_1E2ACAB58;
    v14[4] = self;
    v15 = v11;
    objc_msgSend(v13, "conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:", v7, v14);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_181;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_181(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __89__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_182;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __87__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withCompletion___block_invoke_182(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && objc_msgSend(v10, "count"))
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v20 = a2;
    v13 = v11;
    aBlock[4] = self;
    v19 = v13;
    v14 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_2;
    v16[3] = &unk_1E2ACAB58;
    v16[4] = self;
    v17 = v13;
    objc_msgSend(v15, "conflictingExpressPassIdentifiersForPassConfiguration:withReferenceExpressState:completion:", v9, v10, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

void __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_183;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_183(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __111__PKPaymentService_conflictingExpressPassIdentifiersForPassConfiguration_withReferenceExpressState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)conflictingExpressPassIdentifiersForPassInformation:(id)a3 withReferenceExpressState:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && objc_msgSend(v10, "count"))
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v20 = a2;
    v13 = v11;
    aBlock[4] = self;
    v19 = v13;
    v14 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_2;
    v16[3] = &unk_1E2ACAB58;
    v16[4] = self;
    v17 = v13;
    objc_msgSend(v15, "conflictingExpressPassIdentifiersForPassInformation:withReferenceExpressState:completion:", v9, v10, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

void __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_184;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_184(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __109__PKPaymentService_conflictingExpressPassIdentifiersForPassInformation_withReferenceExpressState_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v21 = a2;
    v14 = v11;
    aBlock[4] = self;
    v20 = v14;
    v15 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_2;
    v17[3] = &unk_1E2ACAD58;
    v17[4] = self;
    v18 = v14;
    objc_msgSend(v16, "setExpressWithPassConfiguration:credential:completion:", v9, v10, v17);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

void __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_185;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_185(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __71__PKPaymentService_setExpressWithPassConfiguration_credential_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PKPaymentService_setExpressWithPassInformation_credential_completion___block_invoke;
  v10[3] = &unk_1E2ACAD80;
  v11 = v8;
  v9 = v8;
  -[PKPaymentService setExpressWithPassInformation:credential:handler:](self, "setExpressWithPassInformation:credential:handler:", a3, a4, v10);

}

void __72__PKPaymentService_setExpressWithPassInformation_credential_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(a3, "anyObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);

  }
}

- (void)setExpressWithPassInformation:(id)a3 credential:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v21 = a2;
    v14 = v11;
    aBlock[4] = self;
    v20 = v14;
    v15 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_2;
    v17[3] = &unk_1E2ACAD58;
    v17[4] = self;
    v18 = v14;
    objc_msgSend(v16, "setExpressWithPassInformation:credential:completion:", v9, v10, v17);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
  }

}

void __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_187;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_187(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __69__PKPaymentService_setExpressWithPassInformation_credential_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeExpressPassesWithCardType:(int64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  aBlock[4] = self;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_2;
  v13[3] = &unk_1E2ACAD58;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "removeExpressPassesWithCardType:completion:", a3, v13);

}

void __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_188;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_188(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __63__PKPaymentService_removeExpressPassesWithCardType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeExpressPassWithUniqueIdentifierV2:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v11 = v8;
    aBlock[4] = self;
    v17 = v11;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_2;
    v14[3] = &unk_1E2ACAD58;
    v14[4] = self;
    v15 = v11;
    objc_msgSend(v13, "removeExpressPassWithUniqueIdentifier:completion:", v7, v14);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_189;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_189(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __71__PKPaymentService_removeExpressPassWithUniqueIdentifierV2_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v11 = v8;
    aBlock[4] = self;
    v17 = v11;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_2;
    v14[3] = &unk_1E2ACAD58;
    v14[4] = self;
    v15 = v11;
    objc_msgSend(v13, "removeExpressPassWithUniqueIdentifier:completion:", v7, v14);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_190;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_190(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    objc_msgSend(a3, "pk_setByApplyingBlock:", &__block_literal_global_191);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v5);

  }
}

uint64_t __69__PKPaymentService_removeExpressPassWithUniqueIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "passInformation");
}

- (void)isPassExpressWithUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v10 = v8;
  aBlock[4] = self;
  v16 = v10;
  v11 = _Block_copy(aBlock);
  if (v10)
  {
    if (v7)
    {
      -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_2;
      v13[3] = &unk_1E2ABDDB0;
      v13[4] = self;
      v14 = v10;
      objc_msgSend(v12, "isPassExpressWithUniqueIdentifier:completion:", v7, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

void __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_192;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_192(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __65__PKPaymentService_isPassExpressWithUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)processTransitTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  PKPaymentService *v23;
  SEL v24;

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __149__PKPaymentService_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState___block_invoke;
  v22 = &unk_1E2AC4430;
  v23 = self;
  v24 = a2;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(&v19);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v17, v19, v20, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "processTransitTransactionEventWithHistory:transactionDate:forPaymentApplication:withPassUniqueIdentifier:expressTransactionState:", v16, v15, v14, v13, v12);

}

void __149__PKPaymentService_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[5];
  __int128 buf;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __149__PKPaymentService_processTransitTransactionEventWithHistory_transactionDate_forPaymentApplication_withPassUniqueIdentifier_expressTransactionState___block_invoke_193;
  v7[3] = &unk_1E2ABE120;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v7;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v9 = __dispatch_async_ar_block_invoke_8;
  v10 = &unk_1E2ABD9A0;
  v11 = v6;
  dispatch_async(v4, &buf);

}

- (void)recordPaymentApplicationUsageForPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  PKPaymentService *v14;
  SEL v15;

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __102__PKPaymentService_recordPaymentApplicationUsageForPassUniqueIdentifier_paymentApplicationIdentifier___block_invoke;
  v13 = &unk_1E2AC4430;
  v14 = self;
  v15 = a2;
  v6 = a4;
  v7 = a3;
  v8 = _Block_copy(&v10);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v8, v10, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordPaymentApplicationUsageForPassUniqueIdentifier:paymentApplicationIdentifier:", v7, v6);

}

void __102__PKPaymentService_recordPaymentApplicationUsageForPassUniqueIdentifier_paymentApplicationIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[5];
  __int128 buf;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __102__PKPaymentService_recordPaymentApplicationUsageForPassUniqueIdentifier_paymentApplicationIdentifier___block_invoke_194;
  v7[3] = &unk_1E2ABE120;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v7;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v9 = __dispatch_async_ar_block_invoke_8;
  v10 = &unk_1E2ABD9A0;
  v11 = v6;
  dispatch_async(v4, &buf);

}

- (id)allPaymentApplicationUsageSummaries
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PKPaymentService_allPaymentApplicationUsageSummaries__block_invoke;
  v5[3] = &unk_1E2ABDD38;
  v5[4] = &v6;
  objc_msgSend(v2, "allPaymentApplicationUsageSummariesWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__PKPaymentService_allPaymentApplicationUsageSummaries__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)simulateDefaultExpressTransitPassIdentifier:(id)a3 forExpressMode:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simulateDefaultExpressTransitPassIdentifier:forExpressMode:handler:", v7, v6, &__block_literal_global_195);

}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2;
  v17[3] = &unk_1E2ACADE8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "transitStateWithPassUniqueIdentifier:paymentApplication:handler:", v13, v12, v17);

}

void __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_196;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_196(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __87__PKPaymentService_transitStateWithPassUniqueIdentifier_paymentApplication_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)simulatePaymentPush
{
  -[PKPaymentService simulatePaymentPushTopic:](self, "simulatePaymentPushTopic:", CFSTR("paymentpass.com.apple.dev1"));
}

- (void)simulateNotificationOfType:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simulateNotificationOfType:userInfo:handler:", a3, v6, &__block_literal_global_200_0);

}

- (void)simulatePaymentPushTopic:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simulatePaymentPushTopic:handler:", v4, &__block_literal_global_201);

}

- (void)simulateVehicleInitiatedPairingWithTCIs:(id)a3 brandCode:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simulateVehicleInitiatedPairingWithTCIs:brandCode:handler:", v6, a4, &__block_literal_global_202);

}

- (void)downloadAllPaymentPasses
{
  id v2;

  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadAllPaymentPassesWithHandler:", &__block_literal_global_203_1);

}

- (void)consistencyCheck
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PKPaymentService_consistencyCheck__block_invoke;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = a2;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __36__PKPaymentService_consistencyCheck__block_invoke_205;
  v5[3] = &unk_1E2ABE120;
  v5[4] = self;
  objc_msgSend(v4, "consistencyCheckWithHandler:", v5);

}

void __36__PKPaymentService_consistencyCheck__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)scheduleSetupReminders
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleSetupReminders:", &__block_literal_global_206);

}

- (void)scheduleDeviceCheckInWithStartTimeOffset:(double)a3
{
  id v4;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleDeviceCheckInWithStartTimeOffset:", a3);

}

- (void)unscheduleDeviceCheckIn
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unscheduleDeviceCheckIn");

}

- (void)unscheduleDeviceUpgradeTaskActivity
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unscheduleDeviceUpgradeTaskActivity");

}

- (void)scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleDeviceUpgradeTasksIfNecessaryWithRandomizeStartDate:", v3);

}

- (void)setDeviceUpgradeTasksContextBuildVersion:(id)a3 upgradeTaskVersion:(int64_t)a4 retryCount:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDeviceUpgradeTasksContextBuildVersion:upgradeTaskVersion:retryCount:", v8, a4, a5);

}

- (void)removeProductsCache
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeProductsCache");

}

- (void)requestNotificationAuthorizationIfNecessaryWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke;
  v12[3] = &unk_1E2ABDBD0;
  v14 = a2;
  v7 = v5;
  v12[4] = self;
  v13 = v7;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke_207;
  v10[3] = &unk_1E2ABDF68;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestNotificationAuthorizationIfNecessaryWithCompletion:", v10);

}

uint64_t __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __78__PKPaymentService_requestNotificationAuthorizationIfNecessaryWithCompletion___block_invoke_207(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestNotificationAuthorizationWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke;
  v12[3] = &unk_1E2ABDBD0;
  v14 = a2;
  v7 = v5;
  v12[4] = self;
  v13 = v7;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke_208;
  v10[3] = &unk_1E2ABDF68;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requestNotificationAuthorizationWithCompletion:", v10);

}

uint64_t __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __67__PKPaymentService_requestNotificationAuthorizationWithCompletion___block_invoke_208(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)userNotificationActionPerformed:(unint64_t)a3 applicationMessageContentIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[6];

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2AC4430;
  v16[4] = self;
  v16[5] = a2;
  v11 = a4;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke_209;
  v14[3] = &unk_1E2ABDA18;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "userNotificationActionPerformed:applicationMessageContentIdentifier:completion:", a3, v11, v14);

}

void __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __99__PKPaymentService_userNotificationActionPerformed_applicationMessageContentIdentifier_completion___block_invoke_209(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[6];

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke;
  v16[3] = &unk_1E2AC4430;
  v16[4] = self;
  v16[5] = a2;
  v11 = a4;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke_210;
  v14[3] = &unk_1E2ABDA18;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "userNotificationActionPerformed:notificationIdentifier:completion:", a3, v11, v14);

}

void __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __86__PKPaymentService_userNotificationActionPerformed_notificationIdentifier_completion___block_invoke_210(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)passbookUIServiceDidLaunch
{
  id v2;

  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passbookUIServiceDidLaunch:", &__block_literal_global_211);

}

- (void)simulateExpressTransactionForPassUniqueIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simulateExpressTransactionForPassUniqueIdentifier:withCompletion:", v4, &__block_literal_global_212);

}

- (void)handleStandaloneTransaction:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "usingSynchronousProxy:handleStandaloneTransaction:withCompletion:", 1, v4, &__block_literal_global_213);

  }
}

- (void)startBackgroundVerificationObserverForPass:(id)a3 verificationMethod:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__PKPaymentService_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke;
  v9[3] = &__block_descriptor_40_e5_v8__0l;
  v9[4] = a2;
  v6 = a4;
  v7 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startBackgroundVerificationObserverForPass:verificationMethod:", v7, v6);

}

void __82__PKPaymentService_startBackgroundVerificationObserverForPass_verificationMethod___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (BOOL)hasPaymentDeviceFieldProperties
{
  unsigned __int8 v3;
  id v4;

  v3 = atomic_load((unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  if ((v3 & 1) == 0)
    v4 = -[PKPaymentService paymentDeviceFieldProperties](self, "paymentDeviceFieldProperties");
  return self->_hasPaymentDeviceFieldProperties;
}

- (PKFieldProperties)paymentDeviceFieldProperties
{
  void *v3;
  uint64_t *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v13 = 0;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PKPaymentService_paymentDeviceFieldProperties__block_invoke;
  v7[3] = &unk_1E2ACAE30;
  v7[4] = &v8;
  objc_msgSend(v3, "paymentDeviceFieldPropertiesWithHandler:", v7);
  v4 = v9;
  self->_hasPaymentDeviceFieldProperties = v9[5] != 0;
  atomic_store(1u, (unsigned __int8 *)&self->_cachedFieldPropertiesValid);
  v5 = (id)v4[5];

  _Block_object_dispose(&v8, 8);
  return (PKFieldProperties *)v5;
}

void __48__PKPaymentService_paymentDeviceFieldProperties__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (PKExpressTransactionState)outstandingExpressTransactionState
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  -[PKPaymentService _extendedSynchronousRemoteObjectProxyWithErrorHandler:](self, "_extendedSynchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKPaymentService_outstandingExpressTransactionState__block_invoke;
  v5[3] = &unk_1E2ACAE58;
  v5[4] = &v6;
  objc_msgSend(v2, "outstandingExpressTransactionState:", v5);
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return (PKExpressTransactionState *)v3;
}

void __54__PKPaymentService_outstandingExpressTransactionState__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setDefaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKPaymentService_setDefaultPaymentPassUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E2ABE120;
  v6[4] = self;
  objc_msgSend(v5, "setDefaultPaymentPassUniqueIdentifier:handler:", v4, v6);

}

- (NSString)defaultPaymentPassUniqueIdentifier
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  v11 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKPaymentService_defaultPaymentPassUniqueIdentifier__block_invoke;
  v5[3] = &unk_1E2AC3D58;
  v5[4] = &v6;
  objc_msgSend(v2, "defaultPaymentPassUniqueIdentifier:", v5);
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return (NSString *)v3;
}

void __54__PKPaymentService_defaultPaymentPassUniqueIdentifier__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setSharedPaymentWebServiceContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      PKLogFacilityTypeGetObject(6uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 136315394;
        v11 = "-[PKPaymentService setSharedPaymentWebServiceContext:]";
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "%s archiving context without deviceID: %@", (uint8_t *)&v10, 0x16u);

      }
    }
    -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject usingSynchronousProxy:setSharedPaymentWebServiceContext:withCompletion:](v9, "usingSynchronousProxy:setSharedPaymentWebServiceContext:withCompletion:", 1, v5, &__block_literal_global_217);
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Attempt to set the shared payment web service context to nil. Ignoring.", (uint8_t *)&v10, 2u);
    }
  }

}

void __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

void __50__PKPaymentService_sharedPaymentWebServiceContext__block_invoke_219(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)sharedPaymentWebServiceContextWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke;
    v12[3] = &unk_1E2AC4110;
    v14 = a2;
    v8 = v5;
    v13 = v8;
    -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_2;
    v10[3] = &unk_1E2ACAEC8;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "usingSynchronousProxy:fetchSharedPaymentWebServiceContextWithCompletion:", 0, v10);

  }
}

void __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  __int128 buf;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_221;
  v7[3] = &unk_1E2ABD9A0;
  v8 = *(id *)(a1 + 32);
  v6 = v7;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v10 = __dispatch_async_ar_block_invoke_8;
  v11 = &unk_1E2ABD9A0;
  v12 = v6;
  dispatch_async(v4, &buf);

}

uint64_t __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_221(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__PKPaymentService_sharedPaymentWebServiceContextWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setDelegate:(id)a3
{
  BOOL v5;
  uint64_t v6;
  BOOL v7;

  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
    v5 = 1;
  else
    v5 = !self->_forceConnectionOnResume;
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
LABEL_12:
    self->_forceConnectionOnResume = v7;
    -[PKXPCService setForceConnectionOnResume:](self->_remoteService, "setForceConnectionOnResume:", v6);
    return;
  }
  if (a3 && !self->_forceConnectionOnResume)
  {
    v7 = 1;
    goto LABEL_12;
  }
}

- (void)updateAllMapsBrandAndMerchantDataWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDA18;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "updateAllMapsBrandAndMerchantDataWithCompletion:", v11);

}

void __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_222;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_222(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__PKPaymentService_updateAllMapsBrandAndMerchantDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)mapsMerchantWithIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];
  id v18;
  SEL v19;

  v5 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v19 = a2;
  v11 = v9;
  aBlock[4] = self;
  v18 = v11;
  v12 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_2;
  v15[3] = &unk_1E2ACAEF0;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "mapsMerchantWithIdentifier:resultProviderIdentifier:completion:", a3, v5, v15);

}

void __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_223;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_223(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __83__PKPaymentService_mapsMerchantWithIdentifier_resultProviderIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)rangingSuspensionReasonForAppletSubcredential:(id)a3 forPaymentApplicationID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID___block_invoke;
  v11[3] = &unk_1E2ACAF18;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v8, "rangingSuspensionReasonForCredential:forPaymentApplicationID:completion:", v6, v7, v11);
  v9 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __90__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)rangingSuspensionReasonForAppletSubcredential:(id)a3 forPaymentApplicationID:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_2;
  v17[3] = &unk_1E2AC3E70;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "rangingSuspensionReasonForCredential:forPaymentApplicationID:completion:", v13, v12, v17);

}

void __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_225;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_225(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __101__PKPaymentService_rangingSuspensionReasonForAppletSubcredential_forPaymentApplicationID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPaymentApplicationRangingSuspensionReason:(unint64_t)a3 forPassUniqueIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPaymentApplicationRangingSuspensionReason:forPassUniqueIdentifier:completion:", a3, v6, &__block_literal_global_226);

}

- (void)regionsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke;
    v15[3] = &unk_1E2ABDBD0;
    v17 = a2;
    v10 = v7;
    v15[4] = self;
    v16 = v10;
    v11 = a3;
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_2;
    v13[3] = &unk_1E2ABE008;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "regionsWithIdentifiers:completion:", v11, v13);

  }
}

void __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_227;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_227(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, MEMORY[0x1E0C9AA60]);
  return result;
}

uint64_t __54__PKPaymentService_regionsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)regionsMatchingName:(id)a3 types:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke;
    v18[3] = &unk_1E2ABDBD0;
    v20 = a2;
    v12 = v9;
    v18[4] = self;
    v19 = v12;
    v13 = a4;
    v14 = a3;
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_2;
    v16[3] = &unk_1E2ABE008;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "regionsMatchingName:types:completion:", v14, v13, v16);

  }
}

void __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_228;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_228(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, MEMORY[0x1E0C9AA60]);
  return result;
}

uint64_t __57__PKPaymentService_regionsMatchingName_types_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)merchantForPassUniqueIdentifier:(id)a3 withAuxiliaryPassInformationItem:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_2;
  v17[3] = &unk_1E2ACAEF0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "merchantForPassUniqueIdentifier:withAuxiliaryPassInformationItem:completion:", v13, v12, v17);

}

void __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_229;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_229(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __96__PKPaymentService_merchantForPassUniqueIdentifier_withAuxiliaryPassInformationItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)suggestPaymentSafariCredentialImport:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_2;
  v14[3] = &unk_1E2ABDF68;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "suggestPaymentSafariCredentialImport:withCompletion:", v10, v14);

}

void __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_230;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_230(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __72__PKPaymentService_suggestPaymentSafariCredentialImport_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)notifyForSafariCardImportConsentWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "notifyForSafariCardImportConsentWithCompletion:", v11);

}

void __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_231;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_231(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __67__PKPaymentService_notifyForSafariCardImportConsentWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)notifyForSafariCardImportWithCredentials:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_2;
  v14[3] = &unk_1E2ABDF68;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "notifyForSafariCardImportWithCredentials:withCompletion:", v10, v14);

}

void __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_232;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_232(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __76__PKPaymentService_notifyForSafariCardImportWithCredentials_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearSafariCardImportNotificationsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "clearSafariCardImportNotificationsWithCompletion:", v11);

}

void __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_233;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_233(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __69__PKPaymentService_clearSafariCardImportNotificationsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearSafariCardImportNotificationHistoryWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "clearSafariCardImportNotificationHistoryWithCompletion:", v11);

}

void __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_234;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_234(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __75__PKPaymentService_clearSafariCardImportNotificationHistoryWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)generateUnderlyingKeyReportWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v7 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke_235;
  v10[3] = &unk_1E2ACAF60;
  v10[4] = self;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "generateUnderlyingKeyReportWithCompletion:", v10);

}

void __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

uint64_t __62__PKPaymentService_generateUnderlyingKeyReportWithCompletion___block_invoke_235(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)simulateEnableBiometricsForPass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PKPaymentService_simulateEnableBiometricsForPass___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simulateEnableBiometricsForPass:", v4);

}

void __52__PKPaymentService_simulateEnableBiometricsForPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

- (void)simulateDeviceAccessory
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPaymentService_simulateDeviceAccessory__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v3 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "simulateDeviceAccessory");

}

void __43__PKPaymentService_simulateDeviceAccessory__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

- (void)setNFCPayloadState:(unint64_t)a3 forPass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PKPaymentService_setNFCPayloadState_forPass___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v6 = a4;
  v7 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNFCPayloadState:forPass:", a3, v6);

}

void __47__PKPaymentService_setNFCPayloadState_forPass___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

- (void)enforceUpgradedPasscodePolicyWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC1C68;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke_238;
  v10[3] = &unk_1E2ABDF68;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "enforceUpgradedPasscodePolicyWithCompletion:", v10);

}

void __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v5);

  }
}

uint64_t __64__PKPaymentService_enforceUpgradedPasscodePolicyWithCompletion___block_invoke_238(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)currentPasscodeMeetsUpgradedPasscodePolicy:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke;
  v12[3] = &unk_1E2AC1C68;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke_239;
  v10[3] = &unk_1E2ABDF68;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "currentPasscodeMeetsUpgradedPasscodePolicy:", v10);

}

void __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v5);

  }
}

uint64_t __63__PKPaymentService_currentPasscodeMeetsUpgradedPasscodePolicy___block_invoke_239(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requiresUpgradedPasscodeWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC1C68;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke_240;
  v10[3] = &unk_1E2ABDF68;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "requiresUpgradedPasscodeWithCompletion:", v10);

}

void __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __59__PKPaymentService_requiresUpgradedPasscodeWithCompletion___block_invoke_240(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)changePasscodeFrom:(id)a3 toPasscode:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke_241;
  v16[3] = &unk_1E2ABDF68;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "changePasscodeFrom:toPasscode:completion:", v13, v12, v16);

}

void __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __61__PKPaymentService_changePasscodeFrom_toPasscode_completion___block_invoke_241(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)registerAuxiliaryCapabilityForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_242;
  v16[3] = &unk_1E2ABDD88;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "registerAuxiliaryCapabilityForPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v13, v12, v16);

}

void __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

uint64_t __107__PKPaymentService_registerAuxiliaryCapabilityForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_242(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)checkAllAuxiliaryRegistrationRequirements
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__PKPaymentService_checkAllAuxiliaryRegistrationRequirements__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a2;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkAllAuxiliaryRegistrationRequirements");

}

void __61__PKPaymentService_checkAllAuxiliaryRegistrationRequirements__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke;
  v15[3] = &unk_1E2AC1C68;
  v17 = a2;
  v9 = v7;
  v16 = v9;
  v10 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke_243;
  v13[3] = &unk_1E2ABDA18;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier:completion:", v10, v13);

}

uint64_t __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __96__PKPaymentService_invalidateAuxiliaryCapabilityCertificatesForPassUniqueIdentifier_completion___block_invoke_243(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_244;
  v16[3] = &unk_1E2ACAF88;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "fetchBarcodesForPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v13, v12, v16);

}

void __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __93__PKPaymentService_fetchBarcodesForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_244(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke;
    v18[3] = &unk_1E2AC1C68;
    v20 = a2;
    v12 = v9;
    v19 = v12;
    v13 = a4;
    v14 = a3;
    -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke_246;
    v16[3] = &unk_1E2ACAFB0;
    v16[4] = self;
    v17 = v12;
    objc_msgSend(v15, "retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:withCompletion:", v14, v13, v16);

  }
}

void __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

}

uint64_t __107__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_withCompletion___block_invoke_246(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke;
    v21[3] = &unk_1E2AC1C68;
    v23 = a2;
    v14 = v11;
    v22 = v14;
    v15 = a5;
    v16 = a4;
    v17 = a3;
    -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke_248;
    v19[3] = &unk_1E2ACAFB0;
    v19[4] = self;
    v20 = v14;
    objc_msgSend(v18, "retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:authorization:sessionExchangeToken:withCompletion:", v17, v16, v15, v19);

  }
}

void __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

}

uint64_t __128__PKPaymentService_retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier_authorization_sessionExchangeToken_withCompletion___block_invoke_248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke;
  v15[3] = &unk_1E2AC1C68;
  v17 = a2;
  v9 = v7;
  v16 = v9;
  v10 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke_249;
  v13[3] = &unk_1E2ABE008;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "retrievePINEncryptionCertificateForPassUniqueIdentifier:withCompletion:", v10, v13);

}

uint64_t __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __91__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_withCompletion___block_invoke_249(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_250;
  v16[3] = &unk_1E2ABE008;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "retrievePINEncryptionCertificateForPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v13, v12, v16);

}

uint64_t __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __112__PKPaymentService_retrievePINEncryptionCertificateForPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_250(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  SEL v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke;
  v17[3] = &unk_1E2AC1C68;
  v19 = a2;
  v11 = v9;
  v18 = v11;
  v12 = a4;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke_251;
  v15[3] = &unk_1E2ABDA18;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "processedAuthenticationMechanism:forTransactionIdentifier:completion:", a3, v12, v15);

}

uint64_t __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __89__PKPaymentService_processedAuthenticationMechanism_forTransactionIdentifier_completion___block_invoke_251(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke;
  v15[3] = &unk_1E2AC1C68;
  v17 = a2;
  v9 = v7;
  v16 = v9;
  v10 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke_252;
  v13[3] = &unk_1E2ABDA18;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "markAuthenticationCompleteForTransactionIdentifier:completion:", v10, v13);

}

uint64_t __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__PKPaymentService_markAuthenticationCompleteForTransactionIdentifier_completion___block_invoke_252(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  SEL v19;

  v6 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke;
  v17[3] = &unk_1E2AC1C68;
  v19 = a2;
  v11 = v9;
  v18 = v11;
  v12 = a4;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_253;
  v15[3] = &unk_1E2ACAFD8;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "submitUserConfirmation:forTransactionIdentifier:completion:", v6, v12, v15);

}

void __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __79__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_completion___block_invoke_253(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  SEL v22;

  v8 = a3;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke;
  v20[3] = &unk_1E2AC1C68;
  v22 = a2;
  v13 = v11;
  v21 = v13;
  v14 = a5;
  v15 = a4;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_255;
  v18[3] = &unk_1E2ACAFD8;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "submitUserConfirmation:forTransactionIdentifier:sessionExchangeToken:completion:", v8, v15, v14, v18);

}

void __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __100__PKPaymentService_submitUserConfirmation_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_255(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_256;
  v16[3] = &unk_1E2ACAFD8;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "submitEncryptedPIN:forTransactionIdentifier:completion:", v13, v12, v16);

}

void __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __75__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_completion___block_invoke_256(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke;
  v21[3] = &unk_1E2AC1C68;
  v23 = a2;
  v13 = v11;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_257;
  v19[3] = &unk_1E2ACAFD8;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "submitEncryptedPIN:forTransactionIdentifier:sessionExchangeToken:completion:", v16, v15, v14, v19);

}

void __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __96__PKPaymentService_submitEncryptedPIN_forTransactionIdentifier_sessionExchangeToken_completion___block_invoke_257(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke_258;
  v16[3] = &unk_1E2ACAFD8;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "submitTransactionSignatureForTransactionIdentifier:sessionExchangeToken:completion:", v13, v12, v16);

}

void __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __103__PKPaymentService_submitTransactionSignatureForTransactionIdentifier_sessionExchangeToken_completion___block_invoke_258(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke;
  v18[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke_259;
  v16[3] = &unk_1E2ABDA18;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "submitBarcodePaymentEvent:forPassUniqueIdentifier:withCompletion:", v13, v12, v16);

}

uint64_t __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __85__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_withCompletion___block_invoke_259(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke;
  v21[3] = &unk_1E2AC1C68;
  v23 = a2;
  v13 = v11;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_260;
  v19[3] = &unk_1E2ABDA18;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "submitBarcodePaymentEvent:forPassUniqueIdentifier:sessionExchangeToken:withCompletion:", v16, v15, v14, v19);

}

uint64_t __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __106__PKPaymentService_submitBarcodePaymentEvent_forPassUniqueIdentifier_sessionExchangeToken_withCompletion___block_invoke_260(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_261(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PKPaymentService_familyMembersIgnoringCache_completion___block_invoke_2;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

- (void)memberTypeForCurrentUserWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[4];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke;
  v12[3] = &unk_1E2AC1C68;
  v14 = a2;
  v7 = v5;
  v13 = v7;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_262;
  v10[3] = &unk_1E2AC3E98;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "memberTypeForCurrentUserWithCompletion:", v10);

}

uint64_t __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, -1);
  return result;
}

void __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_262(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  _QWORD block[4];
  id v11;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_2;
  v7[3] = &unk_1E2ABDBD0;
  v8 = *(id *)(a1 + 40);
  v9 = a2;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v7;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v11 = v6;
  dispatch_async(v4, block);

}

uint64_t __59__PKPaymentService_memberTypeForCurrentUserWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (void)pendingFamilyMembersIgnoringCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  SEL v16;

  v4 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke;
  v14[3] = &unk_1E2AC1C68;
  v16 = a2;
  v9 = v7;
  v15 = v9;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_264;
  v12[3] = &unk_1E2ABE008;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "pendingFamilyMembersIgnoringCache:completion:", v4, v12);

}

uint64_t __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_264(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_2;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __65__PKPaymentService_pendingFamilyMembersIgnoringCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke;
  v15[3] = &unk_1E2AC1C68;
  v17 = a2;
  v9 = v7;
  v16 = v9;
  v10 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_265;
  v13[3] = &unk_1E2ACAF60;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "photosForFamilyMembersWithDSIDs:completion:", v10, v13);

}

uint64_t __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_265(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD block[4];
  id v15;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_2;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __63__PKPaymentService_photosForFamilyMembersWithDSIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)defaultPaymentPassIngestionSpecificIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke;
    aBlock[3] = &unk_1E2AC1C68;
    v15 = a2;
    v8 = v5;
    v14 = v8;
    v9 = _Block_copy(aBlock);
    -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke_266;
    v11[3] = &unk_1E2ABDFE0;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "defaultPaymentPassIngestionSpecificIdentifier:", v11);

  }
}

uint64_t __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PKPaymentService_defaultPaymentPassIngestionSpecificIdentifier___block_invoke_266(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke_267;
  v14[3] = &unk_1E2ABE008;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "featureApplicationsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __71__PKPaymentService_featureApplicationsForAccountIdentifier_completion___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateFeatureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke_268;
  v14[3] = &unk_1E2AC3558;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateFeatureApplicationsForAccountIdentifier:completion:", v10, v14);

}

uint64_t __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __77__PKPaymentService_updateFeatureApplicationsForAccountIdentifier_completion___block_invoke_268(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)featureApplicationsForProvisioningWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke_270;
  v11[3] = &unk_1E2AC3558;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "featureApplicationsForProvisioningWithCompletion:", v11);

}

uint64_t __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __69__PKPaymentService_featureApplicationsForProvisioningWithCompletion___block_invoke_270(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __78__PKPaymentService_featureApplicationsForAccountUserInvitationWithCompletion___block_invoke_271(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)featureApplicationWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E2AC1C68;
    v18 = a2;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke_272;
    v14[3] = &unk_1E2ACB000;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "featureApplicationWithReferenceIdentifier:completion:", v11, v14);

  }
}

uint64_t __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __73__PKPaymentService_featureApplicationWithReferenceIdentifier_completion___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v21 = a2;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke_274;
  v17[3] = &unk_1E2ACB028;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "augmentedProductForInstallmentConfiguration:experimentDetails:withCompletion:", v13, v12, v17);

}

uint64_t __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __97__PKPaymentService_augmentedProductForInstallmentConfiguration_experimentDetails_withCompletion___block_invoke_274(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)featureApplicationsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke_276;
  v11[3] = &unk_1E2ABE008;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "featureApplicationsWithCompletion:", v11);

}

uint64_t __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __54__PKPaymentService_featureApplicationsWithCompletion___block_invoke_276(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)featureApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke_277;
  v14[3] = &unk_1E2ACB000;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "featureApplicationWithIdentifier:completion:", v10, v14);

}

uint64_t __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __64__PKPaymentService_featureApplicationWithIdentifier_completion___block_invoke_277(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitApplyRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPaymentService_submitApplyRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __50__PKPaymentService_submitApplyRequest_completion___block_invoke_278;
  v14[3] = &unk_1E2ACB050;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "submitApplyRequest:completion:", v10, v14);

}

uint64_t __50__PKPaymentService_submitApplyRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __50__PKPaymentService_submitApplyRequest_completion___block_invoke_278(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitDocumentRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKPaymentService_submitDocumentRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __53__PKPaymentService_submitDocumentRequest_completion___block_invoke_280;
  v14[3] = &unk_1E2ACB050;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "submitDocumentRequest:completion:", v10, v14);

}

uint64_t __53__PKPaymentService_submitDocumentRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __53__PKPaymentService_submitDocumentRequest_completion___block_invoke_280(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitVerificationRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PKPaymentService_submitVerificationRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __57__PKPaymentService_submitVerificationRequest_completion___block_invoke_281;
  v14[3] = &unk_1E2ACB050;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "submitVerificationRequest:completion:", v10, v14);

}

uint64_t __57__PKPaymentService_submitVerificationRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __57__PKPaymentService_submitVerificationRequest_completion___block_invoke_281(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitTermsRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PKPaymentService_submitTermsRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __50__PKPaymentService_submitTermsRequest_completion___block_invoke_282;
  v14[3] = &unk_1E2ACB050;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "submitTermsRequest:completion:", v10, v14);

}

uint64_t __50__PKPaymentService_submitTermsRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __50__PKPaymentService_submitTermsRequest_completion___block_invoke_282(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitDeleteRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentService_submitDeleteRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __51__PKPaymentService_submitDeleteRequest_completion___block_invoke_283;
  v14[3] = &unk_1E2ABDD88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "submitDeleteRequest:completion:", v10, v14);

}

uint64_t __51__PKPaymentService_submitDeleteRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __51__PKPaymentService_submitDeleteRequest_completion___block_invoke_283(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[4];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v23 = a2;
  v13 = v11;
  v22 = v13;
  v14 = a5;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke_284;
  v19[3] = &unk_1E2ABDD88;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "submitTransactionAnswerForTransaction:questionType:answer:completion:", v15, a4, v14, v19);

}

uint64_t __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __89__PKPaymentService_submitTransactionAnswerForTransaction_questionType_answer_completion___block_invoke_284(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke_285;
  v14[3] = &unk_1E2ACAB58;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "transactionsRequiringReviewForAccountWithIdentifier:completion:", v10, v14);

}

uint64_t __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __83__PKPaymentService_transactionsRequiringReviewForAccountWithIdentifier_completion___block_invoke_285(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)categoryVisualizationMagnitudesForPassUniqueID:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke;
    aBlock[3] = &unk_1E2AC1C68;
    v18 = a2;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke_286;
    v14[3] = &unk_1E2ACAB58;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "categoryVisualizationMagnitudesForPassUniqueID:completion:", v11, v14);

  }
}

uint64_t __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__PKPaymentService_categoryVisualizationMagnitudesForPassUniqueID_completion___block_invoke_286(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)recomputeCategoryVisualizationMangitudesForPassUniqueID:(id)a3 style:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPaymentService_recomputeCategoryVisualizationMangitudesForPassUniqueID_style___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v6 = a3;
  v7 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recomputeCategoryVisualizationMangitudesForPassUniqueID:style:", v6, a4);

}

void __82__PKPaymentService_recomputeCategoryVisualizationMangitudesForPassUniqueID_style___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)performDeviceCheckInWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke_287;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performDeviceCheckInWithCompletion:", v11);

}

uint64_t __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __55__PKPaymentService_performDeviceCheckInWithCompletion___block_invoke_287(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setDeviceCheckInContextBuildVersion:(id)a3 outstandingAction:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKPaymentService_setDeviceCheckInContextBuildVersion_outstandingAction_forRegion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v8 = a5;
  v9 = a3;
  v10 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDeviceCheckInContextBuildVersion:outstandingAction:forRegion:", v9, a4, v8);

}

void __84__PKPaymentService_setDeviceCheckInContextBuildVersion_outstandingAction_forRegion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)productsWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKPaymentService_productsWithRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __51__PKPaymentService_productsWithRequest_completion___block_invoke_288;
  v14[3] = &unk_1E2ACB078;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "productsWithRequest:completion:", v10, v14);

}

uint64_t __51__PKPaymentService_productsWithRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __51__PKPaymentService_productsWithRequest_completion___block_invoke_288(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)productsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPaymentService_productsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __43__PKPaymentService_productsWithCompletion___block_invoke_290;
  v11[3] = &unk_1E2ACB078;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "productsWithCompletion:", v11);

}

uint64_t __43__PKPaymentService_productsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __43__PKPaymentService_productsWithCompletion___block_invoke_290(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performProductActionRequest:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_performProductActionRequest_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__PKPaymentService_performProductActionRequest_completion___block_invoke_291;
  v14[3] = &unk_1E2ACB078;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "performProductActionRequest:completion:", v10, v14);

}

uint64_t __59__PKPaymentService_performProductActionRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __59__PKPaymentService_performProductActionRequest_completion___block_invoke_291(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)storePassOwnershipToken:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_storePassOwnershipToken_withIdentifier___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v6 = a4;
  v7 = a3;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storePassOwnershipToken:withIdentifier:", v7, v6);

}

void __59__PKPaymentService_storePassOwnershipToken_withIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)passOwnershipTokenWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];

  v7 = a4;
  if (v7)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = a2;
    v9 = a3;
    v10 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke_292;
    v12[3] = &unk_1E2ABDFE0;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v11, "passOwnershipTokenWithIdentifier:completion:", v9, v12);

  }
}

void __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __64__PKPaymentService_passOwnershipTokenWithIdentifier_completion___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)accountAttestationAnonymizationSaltWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke_293;
  v11[3] = &unk_1E2ACB0A0;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "accountAttestationAnonymizationSaltWithCompletion:", v11);

}

uint64_t __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __70__PKPaymentService_accountAttestationAnonymizationSaltWithCompletion___block_invoke_293(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAccountAttestationAnonymizationSalt:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke_295;
  v14[3] = &unk_1E2ABEB88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "setAccountAttestationAnonymizationSalt:withCompletion:", v10, v14);

}

void __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

uint64_t __74__PKPaymentService_setAccountAttestationAnonymizationSalt_withCompletion___block_invoke_295(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addPlaceholderPassWithConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke_296;
  v14[3] = &unk_1E2ACB0C8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "addPlaceholderPassWithConfiguration:completion:", v10, v14);

}

uint64_t __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __67__PKPaymentService_addPlaceholderPassWithConfiguration_completion___block_invoke_296(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)subcredentialInvitationsWithCompletion:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke_298;
  v11[3] = &unk_1E2ABDD60;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "subcredentialInvitationsWithCompletion:", v11);

}

uint64_t __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __59__PKPaymentService_subcredentialInvitationsWithCompletion___block_invoke_298(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v21 = a2;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke_299;
  v17[3] = &unk_1E2ABDCE8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "updateMetadataOnPassWithIdentifier:credential:completion:", v13, v12, v17);

}

uint64_t __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __77__PKPaymentService_updateMetadataOnPassWithIdentifier_credential_completion___block_invoke_299(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)registerCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v9 = a3;
  v10 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke_300;
  v13[3] = &unk_1E2ACB0F0;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "registerCredentialsWithIdentifiers:completion:", v9, v13);

}

void __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __66__PKPaymentService_registerCredentialsWithIdentifiers_completion___block_invoke_300(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)revokeCredentialsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke_302;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "revokeCredentialsWithIdentifiers:completion:", v10, v14);

}

uint64_t __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __64__PKPaymentService_revokeCredentialsWithIdentifiers_completion___block_invoke_302(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v21 = a2;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke_303;
  v17[3] = &unk_1E2ABDCE8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "addPassShare:onCredentialWithIdentifier:withCompletion:", v13, v12, v17);

}

uint64_t __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __71__PKPaymentService_addPassShare_onCredentialWithIdentifier_completion___block_invoke_303(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v21 = a2;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke_304;
  v17[3] = &unk_1E2ABDCE8;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "removeSharingInvitationReceiptWithIdentifiers:onCredential:completion:", v13, v12, v17);

}

uint64_t __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __90__PKPaymentService_removeSharingInvitationReceiptWithIdentifiers_onCredential_completion___block_invoke_304(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke_305;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "declineRelatedSharingInvitationsIfNecessary:withCompletion:", v10, v14);

}

uint64_t __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __79__PKPaymentService_declineRelatedSharingInvitationsIfNecessary_withCompletion___block_invoke_305(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeSharingInvitation:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;
  SEL v19;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v19 = a2;
  v9 = v7;
  v18 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke_306;
  v15[3] = &unk_1E2ABDCE8;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  objc_msgSend(v12, "removeSharingInvitationWithIdentifier:withCompletion:", v13, v15);

}

uint64_t __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __59__PKPaymentService_removeSharingInvitation_withCompletion___block_invoke_306(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  SEL v17;

  v7 = a4;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __88__PKPaymentService_requestBackgroundRegistrationForCredentialWithIdentifier_completion___block_invoke;
  v15 = &unk_1E2AC1C68;
  v16 = v7;
  v17 = a2;
  v8 = v7;
  v9 = a3;
  v10 = _Block_copy(&v12);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10, v12, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestBackgroundRegistrationForCredentialWithIdentifier:completion:", v9, v8);

}

uint64_t __88__PKPaymentService_requestBackgroundRegistrationForCredentialWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)matchingInvitationOnDevice:(id)a3 withTimeout:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  PKPendingInvitationRequest *v17;
  NSObject *v18;
  PKPendingInvitationRequest *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  PKPendingInvitationRequest *v24;
  _QWORD v25[4];
  id v26;
  PKPaymentService *v27;
  PKPendingInvitationRequest *v28;
  id v29;
  unint64_t v30;
  uint64_t aBlock;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  SEL v36;
  unint64_t v37;
  _QWORD v38[4];
  NSObject *v39;
  id v40;
  _QWORD handler[4];
  NSObject *v42;
  id v43;
  id v44;
  id location[2];

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = &unk_190441000;
    if (a4)
    {
      objc_initWeak(location, self);
      v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      v14 = dispatch_time(0, 1000000000 * a4);
      dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
      handler[0] = v11;
      handler[1] = 3221225472;
      handler[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke;
      handler[3] = &unk_1E2AC7820;
      v15 = v13;
      v42 = v15;
      objc_copyWeak(&v44, location);
      v16 = v9;
      v43 = v16;
      dispatch_source_set_event_handler(v15, handler);
      v17 = [PKPendingInvitationRequest alloc];
      v38[0] = v11;
      v38[1] = 3221225472;
      v38[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_2;
      v38[3] = &unk_1E2ACB118;
      v18 = v15;
      v39 = v18;
      v40 = v10;
      v19 = -[PKPendingInvitationRequest initWithInvitation:completion:](v17, "initWithInvitation:completion:", v16, v38);
      os_unfair_lock_lock(&self->_pendingInvitationRequestsLock);
      -[NSMutableArray addObject:](self->_pendingInvitationRequests, "addObject:", v19);
      os_unfair_lock_unlock(&self->_pendingInvitationRequestsLock);
      dispatch_resume(v18);

      objc_destroyWeak(&v44);
      objc_destroyWeak(location);
      v12 = (_QWORD *)&unk_190441000;
    }
    else
    {
      v19 = 0;
    }
    aBlock = v11;
    v32 = v12[267];
    v20 = v32;
    v33 = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_3;
    v34 = &unk_1E2ACB140;
    v36 = a2;
    v37 = a4;
    v21 = v10;
    v35 = v21;
    v22 = _Block_copy(&aBlock);
    -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v11;
    v25[1] = v20;
    v25[2] = __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_309;
    v25[3] = &unk_1E2ACB168;
    v26 = v9;
    v27 = self;
    v30 = a4;
    v28 = v19;
    v29 = v21;
    v24 = v19;
    objc_msgSend(v23, "subcredentialInvitationsWithCompletion:", v25);

  }
}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_source_cancel(v2);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 7);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(id *)&v4[8]._os_unfair_lock_opaque;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(v10, "invitation", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 40);

        if (v11 == v12)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v7)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v13 = v10;

      if (!v13)
        goto LABEL_15;
      objc_msgSend(*(id *)&v4[8]._os_unfair_lock_opaque, "removeObject:", v13);
      os_unfair_lock_unlock(v4 + 7);
      objc_msgSend(v13, "invokeCompletionWithInvitation:error:", 0, 0);

    }
    else
    {
LABEL_12:

LABEL_15:
      os_unfair_lock_unlock(v4 + 7);
    }
  }

}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = *(NSObject **)(a1 + 32);
  if (v6)
    dispatch_source_cancel(v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
  if (!*(_QWORD *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__PKPaymentService_matchingInvitationOnDevice_withTimeout_completion___block_invoke_309(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(*(id *)(a1 + 32), "isSameInvitationAsInvitation:", v7))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  if (*(_QWORD *)(a1 + 64))
  {
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 28));
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        while (2)
        {
          for (j = 0; j != v10; ++j)
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j))
            {

              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(a1 + 48), (_QWORD)v13);
              os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 28));
              objc_msgSend(*(id *)(a1 + 48), "invokeCompletionWithInvitation:error:", v4, 0);
              goto LABEL_24;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          if (v10)
            continue;
          break;
        }
      }

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 28));
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_24:

}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke_310;
  v14[3] = &unk_1E2ABD9C8;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "canAcceptInvitation:withCompletion:", v10, v14);

}

uint64_t __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __55__PKPaymentService_canAcceptInvitation_withCompletion___block_invoke_310(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)credentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke_311;
  v14[3] = &unk_1E2ACB190;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "credentialWithIdentifier:completion:", v10, v14);

}

uint64_t __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __56__PKPaymentService_credentialWithIdentifier_completion___block_invoke_311(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)passSharesForCredentialIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke_313;
  v14[3] = &unk_1E2ABE760;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "passSharesForCredentialIdentifier:completion:", v10, v14);

}

uint64_t __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __65__PKPaymentService_passSharesForCredentialIdentifier_completion___block_invoke_313(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sharingInvitationWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD aBlock[4];
  id v23;
  SEL v24;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v24 = a2;
  v13 = v11;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke_314;
  v20[3] = &unk_1E2ABDCE8;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "sharingInvitationWasInvalidated:withCredentialIdentifier:error:completion:", v16, v15, v14, v20);

}

uint64_t __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __94__PKPaymentService_sharingInvitationWasInvalidated_withCredentialIdentifier_error_completion___block_invoke_314(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)finishedKeyExchangeForCredential:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke_315;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "finishedKeyExchangeForCredential:withCompletion:", v10, v14);

}

uint64_t __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __68__PKPaymentService_finishedKeyExchangeForCredential_withCompletion___block_invoke_315(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD aBlock[4];
  id v26;
  SEL v27;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v27 = a2;
  v15 = v13;
  v26 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke_316;
  v23[3] = &unk_1E2ABDCE8;
  v23[4] = self;
  v24 = v15;
  v22 = v15;
  objc_msgSend(v21, "didReceiveSharingInvitationWithIdentifier:fromOriginatorIDSHandle:sharingSessionIdentifier:metadata:completion:", v19, v18, v17, v16, v23);

}

uint64_t __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __131__PKPaymentService_didReceiveSharingInvitationWithIdentifier_fromOriginatorIDSHandle_sharingSessionIdentifier_metadata_completion___block_invoke_316(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didReceiveSharingInvitationRequest:(id)a3 withCompletion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke_317;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "didReceiveSharingInvitationRequest:withCompletion:", v10, v14);

}

uint64_t __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __70__PKPaymentService_didReceiveSharingInvitationRequest_withCompletion___block_invoke_317(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[4];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke_318;
  v16[3] = &unk_1E2ABDCE8;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "didUpdateSharingInvitationWithIdentifier:reason:completion:", v12, a4, v16);

}

uint64_t __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __79__PKPaymentService_didUpdateSharingInvitationWithIdentifier_reason_completion___block_invoke_318(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pushProvisioningSharingIdentifiers:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke_319;
  v11[3] = &unk_1E2ABE710;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "pushProvisioningSharingIdentifiers:", v11);

}

uint64_t __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __55__PKPaymentService_pushProvisioningSharingIdentifiers___block_invoke_319(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)saveProvisioningSupportData:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke_320;
  v14[3] = &unk_1E2ABDD88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "saveProvisioningSupportData:completion:", v10, v14);

}

void __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

uint64_t __59__PKPaymentService_saveProvisioningSupportData_completion___block_invoke_320(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearProvisioningSupportDataOfType:(unint64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[4];
  id v16;
  SEL v17;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v17 = a2;
  v9 = v7;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke_321;
  v13[3] = &unk_1E2ABDA18;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "clearProvisioningSupportDataOfType:completion:", a3, v13);

}

uint64_t __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __66__PKPaymentService_clearProvisioningSupportDataOfType_completion___block_invoke_321(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  SEL v20;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v10 = v8;
  v18 = v7;
  v19 = v10;
  v11 = v7;
  v12 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke_322;
  v15[3] = &unk_1E2ACB1B8;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "statusForShareableCredentials:completion:", v11, v15);

}

uint64_t __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32), 0);
  return result;
}

uint64_t __61__PKPaymentService_statusForShareableCredentials_completion___block_invoke_322(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v21 = a2;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke_324;
  v17[3] = &unk_1E2ABEB88;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "provideEncryptedPushProvisioningTarget:sharingInstanceIdentifier:completion:", v13, v12, v17);

}

void __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

uint64_t __96__PKPaymentService_provideEncryptedPushProvisioningTarget_sharingInstanceIdentifier_completion___block_invoke_324(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[4];
  id v19;
  SEL v20;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke_325;
  v16[3] = &unk_1E2ACB1E0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "prepareProvisioningTarget:checkFamilyCircle:completion:", v12, v5, v16);

}

void __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

  }
}

uint64_t __75__PKPaymentService_prepareProvisioningTarget_checkFamilyCircle_completion___block_invoke_325(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)redeemEncryptedProvisioningTarget:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentShareableCredential *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PKPaymentShareableCredential initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:]([PKPaymentShareableCredential alloc], "initWithEncryptedProvisioningTarget:provisioningSharingIdentifier:passThumbnailImageData:", v7, 0, 0);

  -[PKPaymentService redeemPaymentShareableCredential:completion:](self, "redeemPaymentShareableCredential:completion:", v8, v6);
}

- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke_328;
  v14[3] = &unk_1E2ACB208;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "redeemPaymentShareableCredential:completion:", v10, v14);

}

void __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, 0, v5);

  }
}

uint64_t __64__PKPaymentService_redeemPaymentShareableCredential_completion___block_invoke_328(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke_330;
  v14[3] = &unk_1E2ACB230;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "redeemProvisioningSharingIdentifier:completion:", v10, v14);

}

void __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

  }
}

uint64_t __67__PKPaymentService_redeemProvisioningSharingIdentifier_completion___block_invoke_330(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)currentSecureElementSnapshot:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKPaymentService_currentSecureElementSnapshot___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v15 = a2;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __49__PKPaymentService_currentSecureElementSnapshot___block_invoke_332;
  v11[3] = &unk_1E2ACB258;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "currentSecureElementSnapshot:", v11);

}

void __49__PKPaymentService_currentSecureElementSnapshot___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

uint64_t __49__PKPaymentService_currentSecureElementSnapshot___block_invoke_332(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)reserveStorageForAppletTypes:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[4];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v21 = a2;
  v11 = v9;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke_334;
  v17[3] = &unk_1E2ACB280;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "reserveStorageForAppletTypes:metadata:completion:", v13, v12, v17);

}

void __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v6,
      0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

  }
}

uint64_t __69__PKPaymentService_reserveStorageForAppletTypes_metadata_completion___block_invoke_334(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteReservation:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PKPaymentService_deleteReservation_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __49__PKPaymentService_deleteReservation_completion___block_invoke_336;
  v14[3] = &unk_1E2ABDA18;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteReservation:completion:", v10, v14);

}

uint64_t __49__PKPaymentService_deleteReservation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__PKPaymentService_deleteReservation_completion___block_invoke_336(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke_337;
  v14[3] = &unk_1E2ACB2A8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "transactionReceiptWithUniqueID:completion:", v10, v14);

}

uint64_t __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __62__PKPaymentService_transactionReceiptWithUniqueID_completion___block_invoke_337(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD aBlock[4];
  id v19;
  SEL v20;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v20 = a2;
  v11 = v9;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke_339;
  v16[3] = &unk_1E2ACB2A8;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "transactionReceiptForTransactionWithIdentifier:updateIfNecessary:completion:", v12, v5, v16);

}

uint64_t __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __96__PKPaymentService_transactionReceiptForTransactionWithIdentifier_updateIfNecessary_completion___block_invoke_339(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)storeTransactionReceiptData:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke_340;
  v14[3] = &unk_1E2ACB2A8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "storeTransactionReceiptData:completion:", v10, v14);

}

uint64_t __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __59__PKPaymentService_storeTransactionReceiptData_completion___block_invoke_340(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteTransactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke_341;
  v14[3] = &unk_1E2ABDCE8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "deleteTransactionReceiptWithUniqueID:completion:", v10, v14);

}

uint64_t __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __68__PKPaymentService_deleteTransactionReceiptWithUniqueID_completion___block_invoke_341(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke_342;
  v14[3] = &unk_1E2ABDD60;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "transactionTagsForTransactionWithIdentifier:completion:", v10, v14);

}

uint64_t __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __75__PKPaymentService_transactionTagsForTransactionWithIdentifier_completion___block_invoke_342(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__PKPaymentService_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke;
  v7[3] = &unk_1E2AC27B0;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v5, "willPassWithUniqueIdentifierAutomaticallyBecomeDefault:completion:", v4, v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return (char)self;
}

uint64_t __75__PKPaymentService_willPassWithUniqueIdentifierAutomaticallyBecomeDefault___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)sendAllPassTransactions
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPaymentService_sendAllPassTransactions__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = a2;
  v3 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendAllPassTransactions");

}

void __43__PKPaymentService_sendAllPassTransactions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (void)ambiguousTransactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[4];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2AC1C68;
  v18 = a2;
  v9 = v7;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke_343;
  v14[3] = &unk_1E2ACB2D0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "ambiguousTransactionWithServiceIdentifier:completion:", v10, v14);

}

uint64_t __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __73__PKPaymentService_ambiguousTransactionWithServiceIdentifier_completion___block_invoke_343(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)sendDeviceSharingCapabilitiesRequestForHandle:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2;
  v14[3] = &unk_1E2ACB2F8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "sendDeviceSharingCapabilitiesRequestForHandle:completion:", v10, v14);

}

void __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPeerPaymentService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_344;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_8;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_344(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3;
  v11[3] = &unk_1E2ABDF90;
  v14 = *(id *)(a1 + 40);
  v15 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v8;
  v9 = v11;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_8;
  block[3] = &unk_1E2ABD9A0;
  v17 = v9;
  v10 = v5;
  dispatch_async(v6, block);

}

uint64_t __77__PKPaymentService_sendDeviceSharingCapabilitiesRequestForHandle_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[7], a1[4]);
  return result;
}

- (void)simulateSecureEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  PKPaymentService *v10;
  SEL v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __40__PKPaymentService_simulateSecureEvent___block_invoke;
  v9 = &unk_1E2AC4430;
  v10 = self;
  v11 = a2;
  v4 = a3;
  -[PKPaymentService _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "simulateSecureEvent:", v4, v6, v7, v8, v9, v10, v11);

}

void __40__PKPaymentService_simulateSecureEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

- (PKPaymentServiceDelegate)delegate
{
  return (PKPaymentServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)paymentPassForVirtualCard:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[5];
  id v18;
  SEL v19;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (objc_msgSend(v7, "type") == 2)
    {
      objc_msgSend(v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke;
      aBlock[3] = &unk_1E2AC3090;
      v19 = a2;
      v11 = v8;
      aBlock[4] = self;
      v18 = v11;
      v12 = _Block_copy(aBlock);
      -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke_8;
      v15[3] = &unk_1E2ABE170;
      v16 = v11;
      objc_msgSend(v13, "paymentPassForVPANID:andLoadImages:completion:", v9, 1, v15);

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Only VPAN virtual cards are supported via Payment Service", buf, 2u);
      }

      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
  }

}

void __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __63__PKPaymentService_VPAN__paymentPassForVirtualCard_completion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)virtualCardsWithActiveVPAN:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[5];
  id v14;
  SEL v15;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke;
    aBlock[3] = &unk_1E2AC3090;
    v15 = a2;
    v8 = v5;
    aBlock[4] = self;
    v14 = v8;
    v9 = _Block_copy(aBlock);
    -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke_10;
    v11[3] = &unk_1E2ADA140;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "vpanVirtualCards:", v11);

  }
}

void __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __53__PKPaymentService_VPAN__virtualCardsWithActiveVPAN___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)vpanCardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 merchantHost:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  NSObject *v22;
  _QWORD aBlock[5];
  NSObject *v24;
  SEL v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    if (objc_msgSend(v11, "type") == 2)
    {
      objc_msgSend(v11, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke;
        aBlock[3] = &unk_1E2AC3090;
        v25 = a2;
        v17 = v14;
        aBlock[4] = self;
        v24 = v17;
        v18 = _Block_copy(aBlock);
        -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v16;
        v21[1] = 3221225472;
        v21[2] = __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke_12;
        v21[3] = &unk_1E2ADA168;
        v21[4] = self;
        v22 = v17;
        objc_msgSend(v19, "vpanCardCredentialsForVPANID:authorization:merchantHost:completion:", v15, v12, v13, v21);

        v20 = v24;
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v27 = "-[PKPaymentService(VPAN) vpanCardCredentialsForVirtualCard:authorization:merchantHost:completion:]";
          v28 = 2112;
          v29 = v11;
        }
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[PKPaymentService(VPAN) vpanCardCredentialsForVirtualCard:authorization:merchantHost:completion:]";
        v28 = 2112;
        v29 = v11;
      }
    }

  }
}

void __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __98__PKPaymentService_VPAN__vpanCardCredentialsForVirtualCard_authorization_merchantHost_completion___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)regenerateVPANCardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD aBlock[5];
  NSObject *v21;
  SEL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (objc_msgSend(v9, "type") == 2)
    {
      objc_msgSend(v9, "identifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke;
        aBlock[3] = &unk_1E2AC3090;
        v22 = a2;
        v14 = v11;
        aBlock[4] = self;
        v21 = v14;
        v15 = _Block_copy(aBlock);
        -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v13;
        v18[1] = 3221225472;
        v18[2] = __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke_14;
        v18[3] = &unk_1E2ADA168;
        v18[4] = self;
        v19 = v14;
        objc_msgSend(v16, "regenerateVPANCardCredentialsForVPANID:authorization:completion:", v12, v10, v18);

        v17 = v21;
      }
      else
      {
        PKLogFacilityTypeGetObject(6uLL);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[PKPaymentService(VPAN) regenerateVPANCardCredentialsForVirtualCard:authorization:completion:]";
          v25 = 2112;
          v26 = v9;
        }
      }

    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[PKPaymentService(VPAN) regenerateVPANCardCredentialsForVirtualCard:authorization:completion:]";
        v25 = 2112;
        v26 = v9;
      }
    }

  }
}

void __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __95__PKPaymentService_VPAN__regenerateVPANCardCredentialsForVirtualCard_authorization_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateDateLastUsedBySafari:(id)a3 forVirtualCard:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD aBlock[5];
  NSObject *v21;
  SEL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "type") == 2)
  {
    objc_msgSend(v10, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke;
      aBlock[3] = &unk_1E2AC3090;
      v22 = a2;
      v14 = v11;
      aBlock[4] = self;
      v21 = v14;
      v15 = _Block_copy(aBlock);
      -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke_15;
      v18[3] = &unk_1E2ABDD88;
      v18[4] = self;
      v19 = v14;
      objc_msgSend(v16, "updateDateLastUsedBySafari:forVirtualCardWithIdentifier:completion:", v9, v12, v18);

      v17 = v21;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[PKPaymentService(VPAN) updateDateLastUsedBySafari:forVirtualCard:completion:]";
        v25 = 2112;
        v26 = v10;
      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PKPaymentService(VPAN) updateDateLastUsedBySafari:forVirtualCard:completion:]";
      v25 = 2112;
      v26 = v10;
    }
  }

}

void __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __79__PKPaymentService_VPAN__updateDateLastUsedBySafari_forVirtualCard_completion___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateCardholderNameFromSafari:(id)a3 forVirtualCard:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  NSObject *v19;
  _QWORD aBlock[5];
  NSObject *v21;
  SEL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "type") == 2)
  {
    objc_msgSend(v10, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke;
      aBlock[3] = &unk_1E2AC3090;
      v22 = a2;
      v14 = v11;
      aBlock[4] = self;
      v21 = v14;
      v15 = _Block_copy(aBlock);
      -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      v18[1] = 3221225472;
      v18[2] = __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke_16;
      v18[3] = &unk_1E2ABDD88;
      v18[4] = self;
      v19 = v14;
      objc_msgSend(v16, "updateCardholderNameFromSafari:forVirtualCardWithIdentifier:completion:", v9, v12, v18);

      v17 = v21;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[PKPaymentService(VPAN) updateCardholderNameFromSafari:forVirtualCard:completion:]";
        v25 = 2112;
        v26 = v10;
      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PKPaymentService(VPAN) updateCardholderNameFromSafari:forVirtualCard:completion:]";
      v25 = 2112;
      v26 = v10;
    }
  }

}

void __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v7,
      0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __83__PKPaymentService_VPAN__updateCardholderNameFromSafari_forVirtualCard_completion___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addPendingProvisioning:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  PKPaymentService *v11;
  SEL v12;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __64__PKPaymentService_PendingProvisioning__addPendingProvisioning___block_invoke;
  v10 = &unk_1E2AC3158;
  v11 = self;
  v12 = a2;
  v4 = a3;
  v5 = _Block_copy(&v7);
  -[PKPaymentService _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v5, v7, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addPendingProvisioning:", v4);

}

void __64__PKPaymentService_PendingProvisioning__addPendingProvisioning___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  const char *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 40);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@]: %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)addPendingProvisionings:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke_8;
  v14[3] = &unk_1E2ABDD88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "addPendingProvisionings:completion:", v10, v14);

}

void __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@]: %@", (uint8_t *)&v7, 0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __76__PKPaymentService_PendingProvisioning__addPendingProvisionings_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retrievePendingProvisioningsWithType:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD aBlock[5];
  id v17;
  SEL v18;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke_10;
  v14[3] = &unk_1E2ABE008;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "retrievePendingProvisioningsWithType:completion:", v10, v14);

}

uint64_t __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __89__PKPaymentService_PendingProvisioning__retrievePendingProvisioningsWithType_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v4,
      0xCu);

  }
}

uint64_t __72__PKPaymentService_PendingProvisioning__hasPendingProvisioningsOfTypes___block_invoke_12(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)retrievePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_14;
  v17[3] = &unk_1E2ADB5A0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "retrievePendingProvisioningOfType:withUniqueIdentifier:completion:", v13, v12, v17);

}

uint64_t __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __107__PKPaymentService_PendingProvisioning__retrievePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removePendingProvisioningOfType:(id)a3 withUniqueIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD aBlock[5];
  id v20;
  SEL v21;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPaymentService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_16;
  v17[3] = &unk_1E2ABDDB0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "removePendingProvisioningOfType:withUniqueIdentifier:completion:", v13, v12, v17);

}

uint64_t __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPaymentService %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __105__PKPaymentService_PendingProvisioning__removePendingProvisioningOfType_withUniqueIdentifier_completion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
