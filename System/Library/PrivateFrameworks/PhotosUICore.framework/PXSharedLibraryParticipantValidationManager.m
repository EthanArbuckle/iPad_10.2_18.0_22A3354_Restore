@implementation PXSharedLibraryParticipantValidationManager

- (PXSharedLibraryParticipantValidationManager)init
{
  PXSharedLibraryParticipantValidationManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *queryAddressesToQueries;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *ivarQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryParticipantValidationManager;
  v2 = -[PXSharedLibraryParticipantValidationManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryAddressesToQueries = v2->_queryAddressesToQueries;
    v2->_queryAddressesToQueries = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("PXSharedLibraryParticipantValidationQueryQueue", v6);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)requestValidationForPhoneNumbers:(id)a3 emailAddresses:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void (**v17)(void *, id, id);
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD aBlock[5];
  id v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantValidationManager.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke;
  aBlock[3] = &unk_1E51171E8;
  aBlock[4] = self;
  v16 = v12;
  v32 = v16;
  v17 = (void (**)(void *, id, id))_Block_copy(aBlock);
  v17[2](v17, v9, v13);
  v17[2](v17, v10, v14);
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_3;
  block[3] = &unk_1E5148CE0;
  v18 = v11;
  v30 = v18;
  v19 = v16;
  v29 = v19;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (objc_msgSend(v14, "count") || objc_msgSend(v13, "count"))
  {
    v20 = v10;
    v21 = v9;
    v22 = (void *)MEMORY[0x1E0CD17A8];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_4;
    v26[3] = &unk_1E511A4C8;
    v26[4] = self;
    v27 = v18;
    v24 = v22;
    v9 = v21;
    v10 = v20;
    objc_msgSend(v24, "queryParticipantsWithEmails:phoneNumbers:photoLibrary:completionHandler:", v14, v13, v23, v26);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_queryAddressesToQueries, 0);
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2;
  v8[3] = &unk_1E5130E28;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, id, id);
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void (**)(uint64_t, id, id))(v6 + 16);
  v8 = a2;
  v7(v6, v8, v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_5;
  v10[3] = &unk_1E513E138;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  if (v5)
  {
    PLSharedLibraryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Error validating participants: %@", buf, 0xCu);
    }

  }
}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  char v12;

  v5 = a2;
  v6 = objc_msgSend(a3, "BOOLValue");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_6;
  block[3] = &unk_1E51473C0;
  block[4] = v7;
  v11 = v5;
  v12 = v6;
  v9 = v5;
  dispatch_sync(v8, block);

}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsValid:", v1);

}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  PXSharedLibraryParticipantValidationQuery *v10;
  PXSharedLibraryParticipantValidationQuery *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD *);
  void *v18;
  uint64_t v19;
  id v20;
  PXSharedLibraryParticipantValidationQuery *v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v3 = a2;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5704;
  v29 = __Block_byref_object_dispose__5705;
  v30 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 16);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_136;
  block[3] = &unk_1E513FD98;
  v24 = &v25;
  block[4] = v4;
  v7 = v3;
  v23 = v7;
  dispatch_sync(v5, block);
  v8 = (void *)v26[5];
  if (v8)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isValid"));
    v10 = (PXSharedLibraryParticipantValidationQuery *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v7);
  }
  else
  {
    v11 = -[PXSharedLibraryParticipantValidationQuery initWithAddress:]([PXSharedLibraryParticipantValidationQuery alloc], "initWithAddress:", v7);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(NSObject **)(v12 + 16);
    v15 = v6;
    v16 = 3221225472;
    v17 = __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2_140;
    v18 = &unk_1E51457C8;
    v19 = v12;
    v14 = v7;
    v20 = v14;
    v10 = v11;
    v21 = v10;
    dispatch_sync(v13, &v15);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v14, v15, v16, v17, v18, v19);

  }
  _Block_object_dispose(&v25, 8);

}

void __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_136(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __109__PXSharedLibraryParticipantValidationManager_requestValidationForPhoneNumbers_emailAddresses_resultHandler___block_invoke_2_140(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

@end
