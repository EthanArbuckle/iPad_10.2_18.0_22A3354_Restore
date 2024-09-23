@implementation PKCloudStoreService

- (PKCloudStoreService)init
{
  PKCloudStoreService *v2;
  PKXPCService *v3;
  void *v4;
  uint64_t v5;
  PKXPCService *remoteService;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKCloudStoreService;
  v2 = -[PKCloudStoreService init](&v8, sel_init);
  if (v2)
  {
    v3 = [PKXPCService alloc];
    PDCloudStoreServiceInterface();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](v3, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", CFSTR("com.apple.passd.cloud-store"), v4, 0, v2);
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PKCloudStoreService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_279 != -1)
    dispatch_once(&_MergedGlobals_279, block);
  return (id)qword_1ECF22B38;
}

void __37__PKCloudStoreService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF22B38;
  qword_1ECF22B38 = (uint64_t)v1;

}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4
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
  aBlock[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_2;
  v14[3] = &unk_1E2AC3558;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateCloudStoreWithLocalItemsWithConfigurations:completion:", v10, v14);

}

void __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_8;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __83__PKCloudStoreService_updateCloudStoreWithLocalItemsWithConfigurations_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7
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
  aBlock[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v25 = a2;
  v15 = v13;
  aBlock[4] = self;
  v24 = v15;
  v16 = a5;
  v17 = a4;
  v18 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_2;
  v21[3] = &unk_1E2ADA140;
  v21[4] = self;
  v22 = v15;
  v20 = v15;
  objc_msgSend(v19, "removeAllItems:inZoneName:containerName:storeLocally:completion:", a3, v17, v16, v7, v21);

}

void __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_10;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __87__PKCloudStoreService_removeAllItems_inZoneName_containerName_storeLocally_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
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
  aBlock[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v24 = a2;
  v13 = v11;
  aBlock[4] = self;
  v23 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_2;
  v20[3] = &unk_1E2ABDD88;
  v20[4] = self;
  v21 = v13;
  v19 = v13;
  objc_msgSend(v18, "removeRecordWithRecordName:zoneName:containerName:completion:", v16, v15, v14, v20);

}

void __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_12;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_12(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_2(uint64_t a1, void *a2)
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
  v10[2] = __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __84__PKCloudStoreService_removeRecordWithRecordName_zoneName_containerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
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

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v19 = a2;
  v11 = v9;
  aBlock[4] = self;
  v18 = v11;
  v12 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_2;
  v15[3] = &unk_1E2ADB1B0;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "allItemsOfItemType:storeLocally:completion:", a3, v5, v15);

}

void __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_14;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __66__PKCloudStoreService_allItemsOfItemType_storeLocally_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
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
  aBlock[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_2;
  v17[3] = &unk_1E2ADB1B0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "applePayContainerItemsFromDate:toDate:completion:", v13, v12, v17);

}

void __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_16;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __72__PKCloudStoreService_applePayContainerItemsFromDate_toDate_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  id v21;
  SEL v22;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v22 = a2;
  v13 = v11;
  aBlock[4] = self;
  v21 = v13;
  v14 = a4;
  v15 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_2;
  v18[3] = &unk_1E2ADB1B0;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "itemOfItemTypeFromAllZones:recordName:qualityOfService:completion:", a3, v14, a5, v18);

}

void __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_17;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __89__PKCloudStoreService_itemOfItemTypeFromAllZones_recordName_qualityOfService_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
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
  aBlock[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB1B0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "cloudStoreRecordArrayWithConfiguration:completion:", v10, v14);

}

void __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_18;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__PKCloudStoreService_cloudStoreRecordArrayWithConfiguration_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 completion:(id)a5
{
  -[PKCloudStoreService itemOfItemType:recordName:qualityOfService:completion:](self, "itemOfItemType:recordName:qualityOfService:completion:", a3, a4, 17, a5);
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  id v21;
  SEL v22;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v22 = a2;
  v13 = v11;
  aBlock[4] = self;
  v21 = v13;
  v14 = a4;
  v15 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_2;
  v18[3] = &unk_1E2ADB1D8;
  v18[4] = self;
  v19 = v13;
  v17 = v13;
  objc_msgSend(v16, "itemOfItemType:recordName:qualityOfService:completion:", a3, v14, a5, v18);

}

void __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_19;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __77__PKCloudStoreService_itemOfItemType_recordName_qualityOfService_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5
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
  aBlock[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDF68;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "resetContainerWithIdentifier:zoneNames:completion:", v13, v12, v17);

}

void __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_21;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __73__PKCloudStoreService_resetContainerWithIdentifier_zoneNames_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4
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
  aBlock[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB1B0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "generateRandomTransactionForTransactionSourceIdentifier:completion:", v10, v14);

}

void __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_23;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_23(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __90__PKCloudStoreService_generateRandomTransactionForTransactionSourceIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6
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
  aBlock[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  aBlock[4] = self;
  v22 = v13;
  v14 = a4;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_2;
  v19[3] = &unk_1E2ADB1B0;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "uploadTransaction:forTransactionSourceIdentifier:includeServerData:completion:", v15, v14, v6, v19);

}

void __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_24;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __101__PKCloudStoreService_uploadTransaction_forTransactionSourceIdentifier_includeServerData_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5
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
  aBlock[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDF68;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "deleteZone:containerName:completion:", v13, v12, v17);

}

void __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_25;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __59__PKCloudStoreService_deleteZone_containerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5
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
  aBlock[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_2;
  v17[3] = &unk_1E2ABDF68;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "createZone:containerName:completion:", v13, v12, v17);

}

void __59__PKCloudStoreService_createZone_containerName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_26;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __59__PKCloudStoreService_createZone_containerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
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
  aBlock[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E2ADB1B0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "populateEvents:forAccountIdentifier:completion:", v13, v12, v17);

}

void __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_27;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __70__PKCloudStoreService_populateEvents_forAccountIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4
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
  aBlock[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB200;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "simulateCloudStorePushForContainerIdentifier:completion:", v10, v14);

}

void __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_28;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

void __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD block[4];
  id v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_3;
  v18[3] = &unk_1E2ACA258;
  v12 = *(id *)(a1 + 40);
  v19 = v7;
  v20 = v8;
  v13 = *(_QWORD *)(a1 + 32);
  v21 = v9;
  v22 = v13;
  v23 = v12;
  v14 = v18;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v25 = v14;
  v15 = v9;
  v16 = v8;
  v17 = v7;
  dispatch_async(v10, block);

}

uint64_t __79__PKCloudStoreService_simulateCloudStorePushForContainerIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[8];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6]);
  return result;
}

- (void)simulatePassProvisioningForPassUniqueIdentifier:(id)a3 completion:(id)a4
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
  aBlock[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDD88;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "simulatePassProvisioningForPassUniqueIdentifier:completion:", v10, v14);

}

void __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_30;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
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
  v10[2] = __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __82__PKCloudStoreService_simulatePassProvisioningForPassUniqueIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
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
  _QWORD v24[4];
  id v25;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke;
  v24[3] = &unk_1E2ABD9C8;
  v15 = v13;
  v25 = v15;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[PKCloudStoreService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2;
  v22[3] = &unk_1E2ABDF68;
  v22[4] = self;
  v23 = v15;
  v21 = v15;
  objc_msgSend(v20, "declineInvitationForRecipientHandle:zoneName:containerName:qualityOfService:completion:", v18, v17, v16, a6, v22);

}

uint64_t __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __110__PKCloudStoreService_declineInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
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
  _QWORD v24[4];
  id v25;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke;
  v24[3] = &unk_1E2ABD9C8;
  v15 = v13;
  v25 = v15;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[PKCloudStoreService errorHandlerForMethod:completion:](self, "errorHandlerForMethod:completion:", a2, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCloudStoreService _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2;
  v22[3] = &unk_1E2ABDF68;
  v22[4] = self;
  v23 = v15;
  v21 = v15;
  objc_msgSend(v20, "createInvitationForRecipientHandle:zoneName:containerName:qualityOfService:completion:", v18, v17, v16, a6, v22);

}

uint64_t __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __109__PKCloudStoreService_createInvitationForRecipientHandle_zoneName_containerName_qualityOfService_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
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
  _QWORD aBlock[5];
  id v22;
  SEL v23;

  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v23 = a2;
  v13 = v11;
  aBlock[4] = self;
  v22 = v13;
  v14 = a4;
  v15 = a3;
  v16 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_2;
  v19[3] = &unk_1E2ADB1B0;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "shareForZoneName:containerName:qualityOfService:completion:", v15, v14, a5, v19);

}

void __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_31;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_31(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __82__PKCloudStoreService_shareForZoneName_containerName_qualityOfService_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4
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
  aBlock[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB228;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "cloudStoreStatusForContainer:completion:", v10, v14);

}

void __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_32;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  return result;
}

void __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
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

  v7 = a2;
  v8 = a4;
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_3;
  v15[3] = &unk_1E2ACAC98;
  v11 = *(id *)(a1 + 40);
  v20 = a3;
  v16 = v7;
  v17 = v8;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = v11;
  v12 = v15;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v22 = v12;
  v13 = v8;
  v14 = v7;
  dispatch_async(v9, block);

}

uint64_t __63__PKCloudStoreService_cloudStoreStatusForContainer_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4
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
  aBlock[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_2;
  v14[3] = &unk_1E2ABDF68;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "setupCloudDatabaseForContainerName:completion:", v10, v14);

}

void __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_34;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __69__PKCloudStoreService_setupCloudDatabaseForContainerName_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)checkTLKsMissingWithCompletion:(id)a3
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
  aBlock[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "checkTLKsMissingWithCompletion:", v11);

}

void __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_35;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __54__PKCloudStoreService_checkTLKsMissingWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
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
  aBlock[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDF68;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "resetApplePayManateeViewWithCompletion:", v11);

}

void __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_36;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_36(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  _QWORD block[4];
  id v18;

  v5 = a3;
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_3;
  v12[3] = &unk_1E2ABDC70;
  v8 = *(id *)(a1 + 40);
  v16 = a2;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v18 = v10;
  v11 = v5;
  dispatch_async(v6, block);

}

uint64_t __62__PKCloudStoreService_resetApplePayManateeViewWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4
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
  aBlock[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB250;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "diagnosticInfoForContainerWithName:completion:", v10, v14);

}

void __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_37;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __69__PKCloudStoreService_diagnosticInfoForContainerWithName_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4
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
  aBlock[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB278;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "diagnosticSnapshotForContainerWithName:completion:", v10, v14);

}

void __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_39;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__PKCloudStoreService_diagnosticSnapshotForContainerWithName_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_2;
  v16[3] = &unk_1E2ABD9C8;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "performAction:inContainerWithName:completion:", a3, v12, v16);

}

void __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_41;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __68__PKCloudStoreService_performAction_inContainerWithName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performBackgroundTransactionSyncFromDate:(id)a3 completion:(id)a4
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
  aBlock[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_2;
  v14[3] = &unk_1E2ADB1B0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "performBackgroundTransactionSyncFromDate:completion:", v10, v14);

}

void __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_42;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_42(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __75__PKCloudStoreService_performBackgroundTransactionSyncFromDate_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)performBackgroundRecordChangesSyncWithCompletion:(id)a3
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
  aBlock[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v15 = a2;
  v7 = v5;
  aBlock[4] = self;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_2;
  v11[3] = &unk_1E2ABDD88;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "performBackgroundRecordChangesSyncWithCompletion:", v11);

}

void __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_43;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_43(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
  v10[2] = __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __72__PKCloudStoreService_performBackgroundRecordChangesSyncWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)changeHistoryForContainerIdentifier:(id)a3 completion:(id)a4
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
  aBlock[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKCloudStoreService _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E2AC3558;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "changeHistoryForContainerIdentifier:completion:", v10, v14);

}

void __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_44;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_20;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_44(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD block[4];
  id v19;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_3;
  v13[3] = &unk_1E2ABDB58;
  v9 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v9;
  v10 = v13;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_20;
  block[3] = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v7, block);

}

uint64_t __70__PKCloudStoreService_changeHistoryForContainerIdentifier_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
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

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];
  id v12;
  SEL v13;

  v6 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E2AC3090;
  v12 = v6;
  v13 = a3;
  aBlock[4] = self;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = _Block_copy(v8);

  return v9;
}

void __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  __int128 buf;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKCloudStoreService %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke_45;
  v12[3] = &unk_1E2ABDA68;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v13 = v3;
  v14 = v9;
  v15 = v8;
  v10 = v12;
  *(_QWORD *)&buf = v7;
  *((_QWORD *)&buf + 1) = 3221225472;
  v17 = __dispatch_async_ar_block_invoke_20;
  v18 = &unk_1E2ABD9A0;
  v19 = v10;
  v11 = v3;
  dispatch_async(v6, &buf);

}

uint64_t __56__PKCloudStoreService_errorHandlerForMethod_completion___block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end
