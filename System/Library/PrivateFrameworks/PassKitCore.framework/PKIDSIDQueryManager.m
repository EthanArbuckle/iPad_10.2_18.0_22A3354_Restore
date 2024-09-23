@implementation PKIDSIDQueryManager

- (PKIDSIDQueryManager)init
{

  return 0;
}

- (PKIDSIDQueryManager)initWithQueue:(id)a3
{
  id v5;
  PKIDSIDQueryManager *v6;
  PKIDSIDQueryManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIDSIDQueryManager;
  v6 = -[PKIDSIDQueryManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)reachableDestinationsForDestination:(id)a3 service:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKIDSBatchIDQueryControllerWrapper *v11;
  OS_dispatch_queue *queue;
  PKIDSBatchIDQueryControllerWrapper *v13;
  id v14;
  _QWORD v15[5];
  PKIDSBatchIDQueryControllerWrapper *v16;
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(PKIDSBatchIDQueryControllerWrapper);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke;
  v15[3] = &unk_1E2ACF3C0;
  v16 = v11;
  v17 = v8;
  v15[4] = self;
  v13 = v11;
  v14 = v8;
  -[PKIDSBatchIDQueryControllerWrapper reachableDestinationsForDestination:service:queue:completion:](v13, "reachableDestinationsForDestination:service:queue:completion:", v10, v9, queue, v15);

}

void __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v8 = *(id *)(a1 + 48);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __78__PKIDSIDQueryManager_reachableDestinationsForDestination_service_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)checkIDSStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  OS_dispatch_queue *queue;
  id v18;
  _QWORD v19[5];
  id v20;

  v10 = a6;
  v11 = (void *)MEMORY[0x1E0D34310];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PKIDSNormalizedAddress(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke;
  v19[3] = &unk_1E2AC3EC0;
  v19[4] = self;
  v20 = v10;
  v18 = v10;
  objc_msgSend(v15, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v16, v13, v12, queue, v19);

}

void __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  BOOL v7;

  v2 = a2 == 1;
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke_2;
  v5[3] = &unk_1E2ABDCC0;
  v6 = v3;
  v7 = v2;
  dispatch_async(v4, v5);

}

uint64_t __82__PKIDSIDQueryManager_checkIDSStatusForDestination_service_listenerID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)checkDeviceSupportForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 capability:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  OS_dispatch_queue *queue;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  PKIDSIDQueryManager *v25;
  id v26;

  v12 = a6;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_81_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_2;
  v22[3] = &unk_1E2ACF438;
  v23 = v16;
  v24 = v12;
  v25 = self;
  v26 = v13;
  v19 = v13;
  v20 = v12;
  v21 = v16;
  objc_msgSend(v17, "currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:", v21, v15, v14, queue, v22);

}

id __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke(uint64_t a1, void *a2)
{
  return PKIDSNormalizedAddress(a2);
}

void __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_3;
  v12[3] = &unk_1E2ACF410;
  v13 = v3;
  v5 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v6 = v3;
  LOBYTE(v5) = objc_msgSend(v5, "pk_containsObjectPassingTest:", v12);
  v7 = *(void **)(a1 + 56);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_5;
  v9[3] = &unk_1E2ABDCC0;
  v10 = v7;
  v11 = (char)v5;
  dispatch_async(v8, v9);

}

uint64_t __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_4;
  v6[3] = &unk_1E2ACF3E8;
  v7 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", v6);

  return v4;
}

BOOL __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "valueForCapability:", *(_QWORD *)(a1 + 32)) != 0;

  return v4;
}

uint64_t __98__PKIDSIDQueryManager_checkDeviceSupportForDestinations_service_listenerID_capability_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
