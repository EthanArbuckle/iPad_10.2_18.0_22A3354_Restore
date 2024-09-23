@implementation PKPassLibrary

void __36__PKPassLibrary_contentForUniqueID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)contentForUniqueID:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PKPassLibrary_contentForUniqueID___block_invoke;
  v7[3] = &unk_1E2AC4200;
  v7[4] = &v8;
  -[PKPassLibrary _fetchContentForUniqueID:usingSynchronousProxy:withCompletion:](self, "_fetchContentForUniqueID:usingSynchronousProxy:withCompletion:", v4, 1, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)imageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__PKPassLibrary_imageSetForUniqueID_ofType_displayProfile_suffix___block_invoke;
  v15[3] = &unk_1E2AC42C8;
  v15[4] = &v16;
  -[PKPassLibrary _fetchImageSetContainerForUniqueID:ofType:displayProfile:suffix:usingSynchronousProxy:withCompletion:](self, "_fetchImageSetContainerForUniqueID:ofType:displayProfile:suffix:usingSynchronousProxy:withCompletion:", v10, a4, v11, v12, 1, v15);
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x19400CFE8]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6;
    v9[3] = &unk_1E2ABDA18;
    v11 = v5;
    v10 = v3;
    v8 = v9;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_3;
    block[3] = &unk_1E2ABD9A0;
    v13 = v8;
    dispatch_async(v6, block);

  }
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  if (v3)
  {
    PKPassLibraryImageSetCache();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageSetHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2;
    v13[3] = &unk_1E2AC4250;
    v7 = v3;
    v9 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v14 = v7;
    v15 = v8;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3;
    v10[3] = &unk_1E2AC42F0;
    v12 = v9;
    v11 = v7;
    objc_msgSend(v4, "retrieveItemForKey:synchronous:retrievalBlock:deliveryBlock:", v5, 1, v13, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_fetchContentForUniqueID:(id)a3 usingSynchronousProxy:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  SEL v23;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke;
    aBlock[3] = &unk_1E2AC3090;
    v23 = a2;
    v13 = v10;
    aBlock[4] = self;
    v22 = v13;
    v14 = _Block_copy(aBlock);
    if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
    {
      if (v6)
        -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v14);
      else
        -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_164;
      v19[3] = &unk_1E2AC4228;
      v16 = &v20;
      v19[4] = self;
      v20 = v13;
      objc_msgSend(v15, "usingSynchronousProxy:getContentForUniqueID:withHandler:", v6, v9, v19);
    }
    else
    {
      if (v6)
        -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v14);
      else
        -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_2;
      v17[3] = &unk_1E2AC4228;
      v16 = &v18;
      v17[4] = self;
      v18 = v13;
      objc_msgSend(v15, "getContentForUniqueID:handler:", v9, v17);
    }

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

- (void)_fetchImageSetContainerForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 usingSynchronousProxy:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  int64_t v33;
  BOOL v34;
  _QWORD v35[5];
  id v36;
  BOOL v37;
  _QWORD v38[4];
  id v39;
  _QWORD aBlock[5];
  id v41;
  int64_t v42;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if (v17)
  {
    if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
    {
      if (+[PKImageSet shouldCacheForDisplayProfile:imageSetType:](PKImageSet, "shouldCacheForDisplayProfile:imageSetType:", v15, a4))
      {
        v18 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke;
        aBlock[3] = &unk_1E2AC4318;
        v42 = a4;
        aBlock[4] = self;
        v41 = v17;
        v38[0] = v18;
        v38[1] = 3221225472;
        v38[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4;
        v38[3] = &unk_1E2ABD9C8;
        v19 = _Block_copy(aBlock);
        v39 = v19;
        v20 = _Block_copy(v38);
        if (v9)
          -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v20);
        else
          -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5;
        v35[3] = &unk_1E2AC4340;
        v37 = v9;
        v35[4] = self;
        v36 = v19;
        v26 = v19;
        objc_msgSend(v25, "usingSynchronousProxy:getImageSetContainerForUniqueID:type:withDisplayProfile:suffix:handler:", v9, v14, a4, v15, v16, v35);

      }
      else
      {
        GenerateKeyImageSetCacheKey(a4, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = MEMORY[0x1E0C809B0];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_7;
        v29[3] = &unk_1E2AC4368;
        v33 = a4;
        v29[4] = self;
        v34 = v9;
        v30 = v14;
        v31 = v15;
        v32 = v16;
        v23 = _Block_copy(v29);
        PKPassLibraryImageSetCache();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v22;
        v27[1] = 3221225472;
        v27[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_12;
        v27[3] = &unk_1E2AC4390;
        v28 = v17;
        objc_msgSend(v24, "retrieveItemForKey:synchronous:retrievalBlock:deliveryBlock:", v21, v9, v23, v27);

      }
    }
    else
    {
      -[PKPassLibrary _fetchImageSetForUniqueID:ofType:displayProfile:suffix:usingSynchronousProxy:withCompletion:](self, "_fetchImageSetForUniqueID:ofType:displayProfile:suffix:usingSynchronousProxy:withCompletion:", v14, a4, v15, v16, v9, v17);
    }
  }

}

- (id)_synchronousExtendedRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
  {
    -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an extended interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (BOOL)_hasInterfaceOfType:(unint64_t)a3
{
  BOOL v4;

  if (a3 == 1)
  {
    v4 = self->_interfaceType - 1 >= 2;
  }
  else
  {
    if (a3 == 2)
      return self->_interfaceType == 2;
    v4 = self->_interfaceType >= 3;
  }
  return !v4;
}

void __66__PKPassLibrary_imageSetForUniqueID_ofType_displayProfile_suffix___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[5];
  id v22;
  uint64_t v23;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_8;
  aBlock[3] = &unk_1E2AC4318;
  v23 = *(_QWORD *)(a1 + 64);
  v5 = v3;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v22 = v5;
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_9;
  v19[3] = &unk_1E2ABD9C8;
  v6 = _Block_copy(aBlock);
  v20 = v6;
  v7 = _Block_copy(v19);
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(v8, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v7);
  else
    objc_msgSend(v8, "_extendedRemoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned __int8 *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_10;
  v16[3] = &unk_1E2AC4340;
  v18 = v10;
  v14 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v15 = v6;
  objc_msgSend(v9, "usingSynchronousProxy:getImageSetContainerForUniqueID:type:withDisplayProfile:suffix:handler:", v10, v14, v11, v13, v12, v16);

}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);

  v4 = a2;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "consumeImageSet");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v3 && objc_msgSend((id)objc_opt_class(), "imageSetType") != *(_QWORD *)(a1 + 40))
  {

    v3 = 0;
  }
  v4[2](v4, v3);

}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  v5 = (id)objc_msgSend(v3, "consumeImageSet");
  objc_msgSend(v3, "invalidate");

  if (!v5)
    goto LABEL_5;
  if (objc_msgSend((id)objc_opt_class(), "imageSetType") != *(_QWORD *)(a1 + 48))
  {

LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = v5;
LABEL_6:
  v6 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_extendedRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
  {
    -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an extended interface"), v8);

    v5 = 0;
  }

  return v5;
}

void __31__PKPassLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initWithRemote:", 0);
  v2 = (void *)qword_1ECF222C0;
  qword_1ECF222C0 = v1;

}

- (id)_initWithRemote:(id)a3
{
  id v5;
  PKPassLibrary *v6;
  PKPassLibrary *v7;
  void *v8;
  PKPassLibrary *remoteLibrary;
  uint64_t v10;
  NSObject *remoteLibraryObserver;
  _QWORD v13[4];
  id v14;
  id location;

  v5 = a3;
  kdebug_trace();
  if (PKDaemonIsAvailable())
  {
    v6 = -[PKPassLibrary initWithMachServiceName:resumeNotificationName:interfaceType:](self, "initWithMachServiceName:resumeNotificationName:interfaceType:", CFSTR("com.apple.passd.library"), CFSTR("com.apple.passd.listener.resumed"), 2);
    v7 = v6;
    if (v6)
    {
      if (v5)
      {
        objc_storeStrong((id *)&v6->_remoteLibrary, a3);
        objc_initWeak(&location, v7);
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        remoteLibrary = v7->_remoteLibrary;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __33__PKPassLibrary__initWithRemote___block_invoke;
        v13[3] = &unk_1E2AC3CB8;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("PKPassLibraryDidChangeNotification"), remoteLibrary, 0, v13);
        v10 = objc_claimAutoreleasedReturnValue();
        remoteLibraryObserver = v7->_remoteLibraryObserver;
        v7->_remoteLibraryObserver = v10;

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      kdebug_trace();
    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (PKPassLibrary)initWithMachServiceName:(id)a3 resumeNotificationName:(id)a4 interfaceType:(unint64_t)a5
{
  id v8;
  id v9;
  PKPassLibrary *v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *asynchronousImageQueue;
  PKXPCService *v15;
  void *v16;
  uint64_t v17;
  PKXPCService *remoteService;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPassLibrary;
  v10 = -[PKPassLibrary init](&v20, sel_init);
  if (v10)
  {
    if (a5 == 1)
    {
      PDPassLibraryInAppInterface();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5 == 2)
        PDPassLibraryExtendedInterface();
      else
        PDPassLibraryInterface();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    v10->_delegatesLock._os_unfair_lock_opaque = 0;
    v13 = dispatch_queue_create("com.apple.passkit.asynchronousImage", 0);
    asynchronousImageQueue = v10->_asynchronousImageQueue;
    v10->_asynchronousImageQueue = (OS_dispatch_queue *)v13;

    v10->_interfaceType = a5;
    v15 = [PKXPCService alloc];
    PKPassLibraryInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:](v15, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:", v8, v12, v16, v10, v9);
    remoteService = v10->_remoteService;
    v10->_remoteService = (PKXPCService *)v17;

    -[PKXPCService setDelegate:](v10->_remoteService, "setDelegate:", v10);
  }

  return v10;
}

- (NSArray)passesOfType:(PKPassType)passType
{
  return (NSArray *)-[PKPassLibrary _copyPassesOfType:withRetries:](self, "_copyPassesOfType:withRetries:", passType, 2);
}

+ (PKPassLibrary)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PKPassLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECF222B8 != -1)
    dispatch_once(&qword_1ECF222B8, block);
  return (PKPassLibrary *)(id)qword_1ECF222C0;
}

- (void)addDelegate:(id)a3
{
  id v4;
  NSHashTable *delegates;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_delegatesLock);
    delegates = self->_delegates;
    if (!delegates)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_delegates;
      self->_delegates = v6;

      delegates = self->_delegates;
    }
    -[NSHashTable addObject:](delegates, "addObject:", v8);
    os_unfair_lock_unlock(&self->_delegatesLock);
    v4 = v8;
  }

}

- (id)_copyPassesOfType:(unint64_t)a3 withRetries:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__11;
  v33 = __Block_byref_object_dispose__11;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke;
  v18[3] = &unk_1E2AC41B0;
  v18[4] = &v25;
  v18[5] = &v19;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke_2;
  v17[3] = &unk_1E2AC46F8;
  v17[4] = self;
  v17[5] = &v29;
  objc_msgSend(v8, "getPassesOfType:handler:", a3, v17);
  if (*((_BYTE *)v26 + 24))
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10)
      {
        objc_msgSend((id)v20[5], "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v36 = a4;
        v37 = 2114;
        v38 = v15;
        _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Error retrieving passes (%lu retries remaining): %{public}@", buf, 0x16u);

      }
      v11 = -[PKPassLibrary _copyPassesOfType:withRetries:](self, "_copyPassesOfType:withRetries:", a3, a4 - 1);
      v9 = v30[5];
      v30[5] = (uint64_t)v11;
    }
    else if (v10)
    {
      objc_msgSend((id)v20[5], "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = (unint64_t)v16;
      _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Error retrieving passes (giving up): %{public}@", buf, 0xCu);

    }
  }
  v12 = (void *)v30[5];
  if (!v12)
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

- (PKPass)passWithPassTypeIdentifier:(NSString *)identifier serialNumber:(NSString *)serialNumber
{
  NSString *v6;
  NSString *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = identifier;
  v7 = serialNumber;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PKPassLibrary_passWithPassTypeIdentifier_serialNumber___block_invoke;
  v11[3] = &unk_1E2AC3D30;
  v11[4] = &v12;
  objc_msgSend(v8, "getPassWithPassTypeID:serialNumber:handler:", v6, v7, v11);
  -[PKPassLibrary _applyDataAccessorToObject:](self, "_applyDataAccessorToObject:", v13[5]);
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (PKPass *)v9;
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
}

- (void)_applyDataAccessorToObjects:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[PKPassLibrary _applyDataAccessorToObject:](self, "_applyDataAccessorToObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_applyDataAccessorToObject:(id)a3
{
  id v4;
  PKRemoteDataAccessor *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "uniqueID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PKRemoteDataAccessor initWithLibrary:objectUniqueID:]([PKRemoteDataAccessor alloc], "initWithLibrary:objectUniqueID:", self, v6);
  objc_msgSend(v4, "setDataAccessor:", v5);

}

void __57__PKPassLibrary_passWithPassTypeIdentifier_serialNumber___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = (void *)MEMORY[0x19400CFE8]();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_11;
    v9[3] = &unk_1E2ABDA18;
    v11 = v5;
    v10 = v3;
    v8 = v9;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_3;
    block[3] = &unk_1E2ABD9A0;
    v13 = v8;
    dispatch_async(v6, block);

  }
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asynchronousImageQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_remoteLibraryObserver, 0);
  objc_storeStrong((id *)&self->_remoteLibrary, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

- (void)getGroupsControllerSnapshotWithOptions:(id)a3 synchronously:(BOOL)a4 handler:(id)a5
{
  -[PKPassLibrary _getGroupsControllerSnapshotWithOptions:synchronously:retries:handler:](self, "_getGroupsControllerSnapshotWithOptions:synchronously:retries:handler:", a3, a4, 2, a5);
}

- (void)_getGroupsControllerSnapshotWithOptions:(id)a3 synchronously:(BOOL)a4 retries:(unint64_t)a5 handler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD aBlock[5];
  id v21;
  id v22;
  unint64_t v23;
  BOOL v24;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke;
    aBlock[3] = &unk_1E2AC47C0;
    v23 = a5;
    aBlock[4] = self;
    v13 = v10;
    v21 = v13;
    v24 = v8;
    v14 = v11;
    v22 = v14;
    v15 = _Block_copy(aBlock);
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_251;
    v18[3] = &unk_1E2AC47E8;
    v18[4] = self;
    v19 = v14;
    v16 = _Block_copy(v18);
    if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
    {
      if (v8)
        -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v15);
      else
        -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "usingSynchronousProxy:getGroupsControllerSnapshotWithOptions:handler:", v8, v13, v16);
    }
    else
    {
      if (v8)
        -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v15);
      else
        -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "getGroupsControllerSnapshotWithOptions:handler:", v13, v16);
    }

  }
}

- (void)canAddSecureElementPassWithConfiguration:(id)a3 completion:(id)a4
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
    aBlock[2] = __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke;
    aBlock[3] = &unk_1E2AC4110;
    v18 = a2;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke_158;
    v14[3] = &unk_1E2ABDF68;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "usingSynchronousProxy:canAddSecureElementPassWithConfiguration:completion:", 0, v11, v14);

  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", a3);
}

void __40__PKPassLibrary_passesPendingActivation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (id)passesPendingActivation
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
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PKPassLibrary_passesPendingActivation__block_invoke;
  v5[3] = &unk_1E2ABDE00;
  v5[4] = &v6;
  objc_msgSend(v2, "usingSynchronousProxy:getPaymentPassesPendingActivationWithHandler:", 1, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)fetchImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 withCompletion:(id)a7
{
  -[PKPassLibrary _fetchImageSetContainerForUniqueID:ofType:displayProfile:suffix:usingSynchronousProxy:withCompletion:](self, "_fetchImageSetContainerForUniqueID:ofType:displayProfile:suffix:usingSynchronousProxy:withCompletion:", a3, a4, a5, a6, 0, a7);
}

uint64_t __33__PKPassLibrary_hasPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (PKPassLibrary)init
{
  PKPassLibrary *v3;
  PKPassLibrary *v4;

  v3 = -[PKPassLibrary initWithMachServiceName:resumeNotificationName:interfaceType:]([PKPassLibrary alloc], "initWithMachServiceName:resumeNotificationName:interfaceType:", CFSTR("com.apple.NPKCompanionAgent.library"), CFSTR("com.apple.NPKCompanionAgent.listener.resumed"), 0);
  v4 = -[PKPassLibrary _initWithRemote:](self, "_initWithRemote:", v3);

  return v4;
}

- (BOOL)hasPassesOfType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PKPassLibrary_hasPassesOfType___block_invoke;
  v6[3] = &unk_1E2ABDD10;
  v6[4] = &v7;
  objc_msgSend(v4, "hasPassesOfType:handler:", a3, v6);
  LOBYTE(a3) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_remoteLibraryObserver)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_remoteLibraryObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassLibrary;
  -[PKPassLibrary dealloc](&v4, sel_dealloc);
}

+ (BOOL)isPassLibraryAvailable
{
  int IsAvailable;

  if (dyld_program_sdk_at_least())
    IsAvailable = PKDaemonIsAvailable();
  else
    IsAvailable = PKPassbookIsSupported();
  return IsAvailable != 0;
}

+ (BOOL)isSecureElementPassActivationAvailable
{
  void *v2;
  void *v3;
  char v4;

  +[PKPassLibrary sharedInstanceWithRemoteLibrary](PKPassLibrary, "sharedInstanceWithRemoteLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isPaymentPassActivationAvailable");
  else
    v4 = 0;

  return v4;
}

+ (PKSuppressionRequestToken)requestAutomaticPassPresentationSuppressionWithResponseHandler:(void *)responseHandler
{
  void *v3;
  NSObject *v4;
  PKSuppressionRequestToken v5;
  void *v6;
  _QWORD block[4];
  id v9;
  uint8_t buf[16];

  v3 = responseHandler;
  if (PKApplicationIsInBackground())
  {
    PKLogFacilityTypeGetObject(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "+[PKPassLibrary requestAutomaticPassPresentationSuppressionWithResponseHandler:] must not be called while the application is in the background.", buf, 2u);
    }

    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__PKPassLibrary_requestAutomaticPassPresentationSuppressionWithResponseHandler___block_invoke;
      block[3] = &unk_1E2ABD9A0;
      v9 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    v5 = 0;
  }
  else
  {
    +[PKAutomaticPassPresentationSuppressor sharedInstance](PKAutomaticPassPresentationSuppressor, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "requestSuppressionWithResponseHandler:", v3);

  }
  return v5;
}

uint64_t __80__PKPassLibrary_requestAutomaticPassPresentationSuppressionWithResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)endAutomaticPassPresentationSuppressionWithRequestToken:(PKSuppressionRequestToken)requestToken
{
  id v4;

  +[PKAutomaticPassPresentationSuppressor sharedInstance](PKAutomaticPassPresentationSuppressor, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSuppressionWithRequestToken:", requestToken);

}

+ (BOOL)isSuppressingAutomaticPassPresentation
{
  void *v2;
  char v3;

  +[PKAutomaticPassPresentationSuppressor sharedInstance](PKAutomaticPassPresentationSuppressor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSuppressing");

  return v3;
}

+ (id)sharedInstanceWithRemoteLibrary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PKPassLibrary_sharedInstanceWithRemoteLibrary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_201 != -1)
    dispatch_once(&_MergedGlobals_201, block);
  return (id)qword_1ECF222B0;
}

void __48__PKPassLibrary_sharedInstanceWithRemoteLibrary__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF222B0;
  qword_1ECF222B0 = (uint64_t)v1;

}

void __33__PKPassLibrary__initWithRemote___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("PKPassLibraryRemotePaymentPassesDidChange"), WeakRetained, v5);

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

- (id)_extendedRemoteObjectProxy
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
  {
    -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ is not backed by an extended interface"), v6);

    v3 = 0;
  }
  return v3;
}

- (id)_extendedRemoteObjectProxyWithFailureHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
  {
    -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an extended interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (id)_inAppRemoteObjectProxy
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService remoteObjectProxy](self->_remoteService, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ is not backed by an in-app interface"), v6);

    v3 = 0;
  }
  return v3;
}

- (id)_inAppRemoteObjectProxyWithFailureHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService remoteObjectProxyWithFailureHandler:](self->_remoteService, "remoteObjectProxyWithFailureHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an in-app interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (id)_inAppRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService remoteObjectProxyWithErrorHandler:](self->_remoteService, "remoteObjectProxyWithErrorHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an in-app interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (id)_synchronousInAppRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 1))
  {
    -[PKXPCService synchronousRemoteObjectProxyWithErrorHandler:](self->_remoteService, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0CB2FC0];
    -[PKPassLibrary description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ is not backed by an in-app interface"), v8);

    v5 = 0;
  }

  return v5;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  NSHashTable *delegates;
  NSHashTable *v7;
  NSHashTable *v8;
  id obj;

  obj = a3;
  os_unfair_lock_lock(&self->_delegatesLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      -[NSHashTable removeObject:](self->_delegates, "removeObject:", WeakRetained);
    v5 = obj;
    if (obj)
    {
      delegates = self->_delegates;
      if (!delegates)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_delegates;
        self->_delegates = v7;

        delegates = self->_delegates;
      }
      -[NSHashTable addObject:](delegates, "addObject:");
      v5 = obj;
    }
    objc_storeWeak((id *)&self->_delegate, v5);
  }
  os_unfair_lock_unlock(&self->_delegatesLock);

}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_delegatesLock;
  id v5;

  if (a3)
  {
    p_delegatesLock = &self->_delegatesLock;
    v5 = a3;
    os_unfair_lock_lock(p_delegatesLock);
    -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

    os_unfair_lock_unlock(p_delegatesLock);
  }
}

- (id)delegates
{
  os_unfair_lock_s *p_delegatesLock;
  void *v4;
  void *v5;

  p_delegatesLock = &self->_delegatesLock;
  os_unfair_lock_lock(&self->_delegatesLock);
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_delegatesLock);
  return v5;
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PKPassLibrary_remoteService_didInterruptConnection___block_invoke;
  v4[3] = &unk_1E2AC3648;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __54__PKPassLibrary_remoteService_didInterruptConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(WeakRetained, "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "passLibraryReceivedInterruption");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (NSArray)passes
{
  return (NSArray *)-[PKPassLibrary _copyPassesWithRetries:](self, "_copyPassesWithRetries:", 2);
}

- (id)passesOfStyles:(unint64_t)a3
{
  return -[PKPassLibrary _copyPassesOfStyles:withRetries:](self, "_copyPassesOfStyles:withRetries:", a3, 2);
}

- (id)passWithUniqueID:(id)a3
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
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PKPassLibrary_passWithUniqueID___block_invoke;
  v8[3] = &unk_1E2AC41D8;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "getPassWithUniqueID:handler:", v4, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __34__PKPassLibrary_passWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)passWithFPANIdentifier:(id)a3
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
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PKPassLibrary_passWithFPANIdentifier___block_invoke;
    v8[3] = &unk_1E2AC4480;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v5, "passWithFPANIdentifier:handler:", v4, v8);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__PKPassLibrary_passWithFPANIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)passWithDPANIdentifier:(id)a3
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
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PKPassLibrary_passWithDPANIdentifier___block_invoke;
    v8[3] = &unk_1E2AC4480;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v5, "passWithDPANIdentifier:handler:", v4, v8);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __40__PKPassLibrary_passWithDPANIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)getPassesWithUniqueIdentifiers:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke;
      v14[3] = &unk_1E2ABDBD0;
      v16 = a2;
      v10 = v8;
      v14[4] = self;
      v15 = v10;
      -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke_81;
      v12[3] = &unk_1E2ABDE50;
      v12[4] = self;
      v13 = v10;
      objc_msgSend(v11, "getPassesWithUniqueIdentifiers:handler:", v7, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AA60]);
    }
  }

}

uint64_t __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__PKPassLibrary_getPassesWithUniqueIdentifiers_handler___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)passesWithSearchableTransactions:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke;
    v12[3] = &unk_1E2ABDBD0;
    v14 = a2;
    v8 = v5;
    v12[4] = self;
    v13 = v8;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke_84;
    v10[3] = &unk_1E2ABDD60;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "getPassesWithSearchableTransactions:", v10);

  }
}

void __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v6, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

}

void __50__PKPassLibrary_passesWithSearchableTransactions___block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)passUniqueIDsForAssociatedApplicationIdentifier:(id)a3
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
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__PKPassLibrary_passUniqueIDsForAssociatedApplicationIdentifier___block_invoke;
    v8[3] = &unk_1E2ABDE00;
    v8[4] = &v9;
    objc_msgSend(v5, "getPassUniqueIDsForAssociatedApplicationIdentifier:handler:", v4, v8);

  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __65__PKPassLibrary_passUniqueIDsForAssociatedApplicationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)getMetadataForFieldWithProperties:(id)a3 withHandler:(id)a4
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
    v15[2] = __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke;
    v15[3] = &unk_1E2ABDBD0;
    v17 = a2;
    v10 = v7;
    v15[4] = self;
    v16 = v10;
    v11 = a3;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke_86;
    v13[3] = &unk_1E2AC3CE0;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "getMetadataForFieldWithProperties:handler:", v11, v13);

  }
}

uint64_t __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __63__PKPassLibrary_getMetadataForFieldWithProperties_withHandler___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)manifestHashForPassWithUniqueID:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v6 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v11[4] = a2;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke_90;
  v10[3] = &unk_1E2AC3D08;
  v10[4] = &v12;
  objc_msgSend(v7, "usingSynchronousProxy:getManifestHashForPassWithUniqueID:handler:", 1, v5, v10);
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke(uint64_t a1)
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

void __49__PKPassLibrary_manifestHashForPassWithUniqueID___block_invoke_90(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSArray)remotePaymentPasses
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
  {
    -[PKPassLibrary passesOfType:](self->_remoteLibrary, "passesOfType:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "paymentPass", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v11;
}

- (NSArray)remoteSecureElementPasses
{
  void *v3;
  void *v4;
  NSArray *v5;

  if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
  {
    -[PKPassLibrary passesOfType:](self->_remoteLibrary, "passesOfType:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v4;

  return v5;
}

- (BOOL)hasPassesInExpiredSection
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PKPassLibrary_hasPassesInExpiredSection__block_invoke;
  v5[3] = &unk_1E2ABDD10;
  v5[4] = &v6;
  objc_msgSend(v2, "hasPassesInExpiredSectionWithHandler:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__PKPassLibrary_hasPassesInExpiredSection__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)paymentPassesWithLocallyStoredValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPassLibrary hasPassesOfType:](self, "hasPassesOfType:", 1))
  {
    -[PKPassLibrary passesOfType:](self, "passesOfType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isStoredValuePass") & 1) == 0)
          {
            objc_msgSend(v9, "devicePrimaryPaymentApplication");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "supportsTransitHistory");

            if (!v11)
              continue;
          }
          objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return v12;
}

- (id)peerPaymentPassUniqueID
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if ((PKUseMockSURFServer() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    PKMockPeerPaymentPassPassTypeID();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PKMockPeerPaymentPassSerialNumber();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKGeneratePassUniqueID(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__11;
    v14 = __Block_byref_object_dispose__11;
    v15 = 0;
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__PKPassLibrary_peerPaymentPassUniqueID__block_invoke;
    v9[3] = &unk_1E2AC3D58;
    v9[4] = &v10;
    objc_msgSend(v7, "peerPaymentPassUniqueIDWithHandler:", v9);
    v8 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    return v8;
  }
}

void __40__PKPassLibrary_peerPaymentPassUniqueID__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)countOfPasses
{
  return -[PKPassLibrary countPassesOfType:](self, "countPassesOfType:", -1);
}

- (unint64_t)countPassesOfType:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PKPassLibrary_countPassesOfType___block_invoke;
  v7[3] = &unk_1E2ABDC48;
  v7[4] = &v8;
  objc_msgSend(v4, "countPassesOfType:handler:", a3, v7);
  v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __35__PKPassLibrary_countPassesOfType___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)canAddPassOfType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PKPassLibrary_canAddPassOfType___block_invoke;
  v6[3] = &unk_1E2ABDD10;
  v6[4] = &v7;
  objc_msgSend(v4, "canAddPassesOfType:handler:", a3, v6);
  LOBYTE(a3) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __34__PKPassLibrary_canAddPassOfType___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)canAddSecureElementPassWithPrimaryAccountIdentifier:(NSString *)primaryAccountIdentifier
{
  NSString *v4;
  PKAddSecureElementPassConfiguration *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = primaryAccountIdentifier;
  if (v4)
  {
    v5 = -[PKAddSecureElementPassConfiguration initWithType:]([PKAddSecureElementPassConfiguration alloc], "initWithType:", 5);
    if (-[PKPassLibrary canAddSecureElementPassWithConfiguration:](self, "canAddSecureElementPassWithConfiguration:", v5))
    {
      if (PKSecureElementIsAvailable())
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v6 = 1;
        -[PKPassLibrary passesOfType:](self, "passesOfType:", 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v28;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v28 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              objc_msgSend(v12, "primaryAccountIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", v4);

              if (v14 && (unint64_t)objc_msgSend(v12, "activationState") <= 3)
              {

                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
            if (v9)
              continue;
            break;
          }
          v6 = 1;
        }
        goto LABEL_30;
      }
LABEL_16:
      if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary")
        && -[PKPassLibrary isWatchIssuerAppProvisioningSupported](self, "isWatchIssuerAppProvisioningSupported"))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v6 = 1;
        -[PKPassLibrary passesOfType:](self->_remoteLibrary, "passesOfType:", 1, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v24;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v24 != v17)
                objc_enumerationMutation(v7);
              v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              objc_msgSend(v19, "primaryAccountIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v4);

              if (v21 && (unint64_t)objc_msgSend(v19, "activationState") < 4)
              {
                v6 = 0;
                goto LABEL_30;
              }
            }
            v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            v6 = 1;
            if (v16)
              continue;
            break;
          }
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    v6 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v6 = 0;
LABEL_32:

  return v6;
}

- (BOOL)canAddFelicaPass
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PKPassLibrary_canAddFelicaPass__block_invoke;
  v6[3] = &unk_1E2ABDD10;
  v6[4] = &v7;
  objc_msgSend(v3, "canAddFelicaPassWithHandler:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    v4 = 1;
  }
  else
  {
    if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
      v4 = -[PKPassLibrary canAddFelicaPass](self->_remoteLibrary, "canAddFelicaPass");
    else
      v4 = 0;
    *((_BYTE *)v8 + 24) = v4;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__PKPassLibrary_canAddFelicaPass__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isRemovingPassesOfType:(unint64_t)a3
{
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PKPassLibrary_isRemovingPassesOfType___block_invoke;
  v6[3] = &unk_1E2ABDD10;
  v6[4] = &v7;
  objc_msgSend(v4, "isRemovingPassesOfType:handler:", a3, v6);
  LOBYTE(a3) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __40__PKPassLibrary_isRemovingPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)hasSecureElementPassesOfType:(int64_t)a3
{
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PKPassLibrary_hasSecureElementPassesOfType___block_invoke;
  v6[3] = &unk_1E2ABDD10;
  v6[4] = &v7;
  objc_msgSend(v4, "hasSecureElementPassesOfType:handler:", a3, v6);
  LOBYTE(a3) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __46__PKPassLibrary_hasSecureElementPassesOfType___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isPassbookVisible
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PKPassLibrary_isPassbookVisible__block_invoke;
  v5[3] = &unk_1E2ABDD10;
  v5[4] = &v6;
  objc_msgSend(v2, "isPassbookVisibleWithHandler:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__PKPassLibrary_isPassbookVisible__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)passbookHasBeenDeleted
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PKPassLibrary_passbookHasBeenDeleted__block_invoke;
  v5[3] = &unk_1E2ABDD10;
  v5[4] = &v6;
  objc_msgSend(v2, "passbookHasBeenDeletedWithHandler:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__PKPassLibrary_passbookHasBeenDeleted__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)iPadSupportsPasses
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PKPassLibrary_iPadSupportsPasses__block_invoke;
  v5[3] = &unk_1E2ABDD10;
  v5[4] = &v6;
  objc_msgSend(v2, "iPadSupportsPasses:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PKPassLibrary_iPadSupportsPasses__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)inAppPaymentPassesForPaymentRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "supportedNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "merchantCapabilities");
  objc_msgSend(v5, "supportedCountries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "isMultiTokenRequest");
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  v12 = MEMORY[0x1E0C809B0];
  v26 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke;
  v20[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v20[4] = a2;
  -[PKPassLibrary _synchronousInAppRemoteObjectProxyWithErrorHandler:](self, "_synchronousInAppRemoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "requestType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke_98;
  v19[3] = &unk_1E2AC3D80;
  v19[4] = self;
  v19[5] = &v21;
  objc_msgSend(v13, "inAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:paymentRequestType:isMultiTokensRequest:withHandler:", v8, v9, v10, v14, v11, v19);

  -[PKPassLibrary _filterPeerPaymentPass:request:](self, "_filterPeerPaymentPass:request:", v22[5], v5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v22[5];
  v22[5] = v15;

  v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

void __53__PKPassLibrary_inAppPaymentPassesForPaymentRequest___block_invoke_98(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_filterPeerPaymentPass:(id)a3 request:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  char v16;
  char v17;

  v6 = a4;
  v7 = a3;
  -[PKPassLibrary peerPaymentPassUniqueID](self, "peerPaymentPassUniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isPeerPaymentRequest");
  v10 = objc_msgSend(v6, "supportsInstantFundsIn");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__PKPassLibrary__filterPeerPaymentPass_request___block_invoke;
  v14[3] = &unk_1E2AC3DA8;
  v16 = v10;
  v17 = v9;
  v15 = v8;
  v11 = v8;
  objc_msgSend(v7, "objectsPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __48__PKPassLibrary__filterPeerPaymentPass_request___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40)
    && (objc_msgSend(v3, "devicePrimaryPaymentApplication"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "supportsInstantFundsIn"),
        v5,
        !v6))
  {
    v9 = 0;
  }
  else if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(v4, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    v9 = v8 ^ 1u;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 withHandler:(id)a6
{
  -[PKPassLibrary hasInAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:isMultiTokensRequest:withHandler:](self, "hasInAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:isMultiTokensRequest:withHandler:", a3, a4, a5, 0, a6);
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 isMultiTokensRequest:(BOOL)a6 withHandler:(id)a7
{
  -[PKPassLibrary hasInAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:paymentRequestType:isMultiTokensRequest:withHandler:](self, "hasInAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:paymentRequestType:isMultiTokensRequest:withHandler:", a3, a4, a5, 0, 0, a7);
}

- (void)hasInAppPaymentPassesForNetworks:(id)a3 capabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 paymentRequestType:(id)a6 isMultiTokensRequest:(BOOL)a7 withHandler:(id)a8
{
  _BOOL8 v8;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  SEL v27;

  v8 = a7;
  v15 = a8;
  v16 = v15;
  if (v15)
  {
    v17 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke;
    v25[3] = &unk_1E2ABDBD0;
    v27 = a2;
    v18 = v15;
    v25[4] = self;
    v26 = v18;
    v19 = a6;
    v20 = a5;
    v21 = a3;
    -[PKPassLibrary _inAppRemoteObjectProxyWithFailureHandler:](self, "_inAppRemoteObjectProxyWithFailureHandler:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke_100;
    v23[3] = &unk_1E2ABDDB0;
    v23[4] = self;
    v24 = v18;
    objc_msgSend(v22, "hasInAppPaymentPassesForNetworks:capabilities:issuerCountryCodes:paymentRequestType:isMultiTokensRequest:withHandler:", v21, a4, v20, v19, v8, v23);

  }
}

uint64_t __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __134__PKPassLibrary_hasInAppPaymentPassesForNetworks_capabilities_issuerCountryCodes_paymentRequestType_isMultiTokensRequest_withHandler___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)inAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  v11 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke;
  v16[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v16[4] = a2;
  -[PKPassLibrary _synchronousInAppRemoteObjectProxyWithErrorHandler:](self, "_synchronousInAppRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke_101;
  v15[3] = &unk_1E2AC3D80;
  v15[4] = self;
  v15[5] = &v17;
  objc_msgSend(v12, "inAppPrivateLabelPaymentPassesForApplicationIdentifier:issuerCountryCodes:isMultiTokensRequest:withHandler:", v9, v10, v5, v15);
  v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v13;
}

void __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

void __112__PKPassLibrary_inAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  _BOOL8 v6;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;

  v6 = a5;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke;
    v20[3] = &unk_1E2ABDBD0;
    v22 = a2;
    v14 = v11;
    v20[4] = self;
    v21 = v14;
    v15 = a4;
    v16 = a3;
    -[PKPassLibrary _inAppRemoteObjectProxyWithFailureHandler:](self, "_inAppRemoteObjectProxyWithFailureHandler:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_102;
    v18[3] = &unk_1E2ABDDB0;
    v18[4] = self;
    v19 = v14;
    objc_msgSend(v17, "hasInAppPrivateLabelPaymentPassesForApplicationIdentifier:issuerCountryCodes:isMultiTokensRequest:withHandler:", v16, v15, v6, v18);

  }
}

uint64_t __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __127__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForApplicationIdentifier_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)inAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  v11 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke;
  v16[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v16[4] = a2;
  -[PKPassLibrary _synchronousInAppRemoteObjectProxyWithErrorHandler:](self, "_synchronousInAppRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke_103;
  v15[3] = &unk_1E2AC3D80;
  v15[4] = self;
  v15[5] = &v17;
  objc_msgSend(v12, "inAppPrivateLabelPaymentPassesForWebDomain:issuerCountryCodes:isMultiTokensRequest:withHandler:", v9, v10, v5, v15);
  v13 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v13;
}

void __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

void __100__PKPassLibrary_inAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest___block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)hasInAppPrivateLabelPaymentPassesForWebDomain:(id)a3 issuerCountryCodes:(id)a4 isMultiTokensRequest:(BOOL)a5 withHandler:(id)a6
{
  _BOOL8 v6;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;

  v6 = a5;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke;
    v20[3] = &unk_1E2ABDBD0;
    v22 = a2;
    v14 = v11;
    v20[4] = self;
    v21 = v14;
    v15 = a4;
    v16 = a3;
    -[PKPassLibrary _inAppRemoteObjectProxyWithFailureHandler:](self, "_inAppRemoteObjectProxyWithFailureHandler:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_104;
    v18[3] = &unk_1E2ABDDB0;
    v18[4] = self;
    v19 = v14;
    objc_msgSend(v17, "hasInAppPrivateLabelPaymentPassesForWebDomain:issuerCountryCodes:isMultiTokensRequest:withHandler:", v16, v15, v6, v18);

  }
}

uint64_t __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __115__PKPassLibrary_hasInAppPrivateLabelPaymentPassesForWebDomain_issuerCountryCodes_isMultiTokensRequest_withHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)enabledValueAddedServicePassesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke;
    v12[3] = &unk_1E2ABDBD0;
    v14 = a2;
    v8 = v5;
    v12[4] = self;
    v13 = v8;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke_105;
    v10[3] = &unk_1E2ABDE50;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "enabledValueAddedServicePassesWithHandler:", v10);

  }
}

uint64_t __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __62__PKPassLibrary_enabledValueAddedServicePassesWithCompletion___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)getPassesAndCatalog:(BOOL)a3 withHandler:(id)a4
{
  -[PKPassLibrary getPassesAndCatalog:synchronously:withHandler:](self, "getPassesAndCatalog:synchronously:withHandler:", a3, 0, a4);
}

- (void)getPassesAndCatalog:(BOOL)a3 synchronously:(BOOL)a4 withHandler:(id)a5
{
  -[PKPassLibrary _getPassesAndCatalogOfPassTypes:synchronously:limitResults:withRetries:handler:](self, "_getPassesAndCatalogOfPassTypes:synchronously:limitResults:withRetries:handler:", 0, a4, a3, 2, a5);
}

- (void)getPassesAndCatalogOfPassTypes:(unint64_t)a3 synchronously:(BOOL)a4 withHandler:(id)a5
{
  -[PKPassLibrary _getPassesAndCatalogOfPassTypes:synchronously:limitResults:withRetries:handler:](self, "_getPassesAndCatalogOfPassTypes:synchronously:limitResults:withRetries:handler:", a3, a4, 0, 2, a5);
}

- (void)unexpiredPassesOrderedByGroup:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke;
    v12[3] = &unk_1E2ABDBD0;
    v14 = a2;
    v8 = v5;
    v12[4] = self;
    v13 = v8;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke_106;
    v10[3] = &unk_1E2ABDE50;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "unexpiredPassesOrderedByGroup:", v10);

  }
}

uint64_t __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __47__PKPassLibrary_unexpiredPassesOrderedByGroup___block_invoke_106(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_applyDataAccessorToObjects:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)containsPass:(PKPass *)pass
{
  PKPass *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = pass;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v5 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__PKPassLibrary_containsPass___block_invoke;
  v8[3] = &unk_1E2AC3DD0;
  v10 = &v11;
  v6 = v5;
  v9 = v6;
  -[PKPassLibrary getContainmentStatusAndSettingsForPass:withHandler:](self, "getContainmentStatusAndSettingsForPass:withHandler:", v4, v8);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

intptr_t __30__PKPassLibrary_containsPass___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)containsPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
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
  aBlock[2] = __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_108;
  v17[3] = &unk_1E2ABDDB0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "usingSynchronousProxy:containsPassWithPassTypeIdentifier:serialNumber:completionHandler:", 0, v13, v12, v17);

}

uint64_t __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_108(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2;
  block[3] = &unk_1E2ABDAB8;
  v5 = *(id *)(a1 + 40);
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v4, block);

}

uint64_t __83__PKPassLibrary_containsPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (BOOL)replacePassWithPass:(PKPass *)pass
{
  PKPass *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = pass;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x19400CFE8]();
    -[PKObject archiveData](v4, "archiveData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v5);
    if (v6)
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__PKPassLibrary_replacePassWithPass___block_invoke;
      v10[3] = &unk_1E2ABDD10;
      v10[4] = &v11;
      objc_msgSend(v7, "replacePassWithPassData:handler:", v6, v10);
      v8 = *((_BYTE *)v12 + 24) != 0;

      _Block_object_dispose(&v11, 8);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __37__PKPassLibrary_replacePassWithPass___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)archiveForObjectWithUniqueID:(id)a3
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
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PKPassLibrary_archiveForObjectWithUniqueID___block_invoke;
  v8[3] = &unk_1E2AC3D08;
  v8[4] = &v9;
  objc_msgSend(v5, "getArchivedObjectWithUniqueID:handler:", v4, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __46__PKPassLibrary_archiveForObjectWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4 objectUniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PKPassLibrary_dataForBundleResourceNamed_withExtension_objectUniqueIdentifier___block_invoke;
  v14[3] = &unk_1E2AC3D08;
  v14[4] = &v15;
  objc_msgSend(v11, "getDataForBundleResourceNamed:withExtension:objectUniqueIdentifier:handler:", v8, v9, v10, v14);
  kdebug_trace();
  v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __81__PKPassLibrary_dataForBundleResourceNamed_withExtension_objectUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)dataForBundleResources:(id)a3 objectUniqueIdentifier:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  id v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  v7 = -[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2);
  kdebug_trace();
  if (v7)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__11;
    v32 = __Block_byref_object_dispose__11;
    v33 = 0;
    -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke;
    v27[3] = &unk_1E2AC3DF8;
    v27[4] = &v28;
    objc_msgSend(v8, "getDataForBundleResources:objectUniqueIdentifier:handler:", v6, v19, v27);
    kdebug_trace();
    v9 = (id)v29[5];

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "extension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke_2;
          v20[3] = &unk_1E2AC3E20;
          v21 = v9;
          v22 = v14;
          objc_msgSend(v10, "getDataForBundleResourceNamed:withExtension:objectUniqueIdentifier:handler:", v15, v16, v19, v20);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
      }
      while (v11);
    }

    kdebug_trace();
  }

  return v9;
}

void __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __63__PKPassLibrary_dataForBundleResources_objectUniqueIdentifier___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(result + 40));
  return result;
}

- (id)passLocalizedStringForKey:(id)a3 uniqueID:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke;
  v15[3] = &unk_1E2AC3E48;
  v17 = &v19;
  v18 = a2;
  v10 = v7;
  v16 = v10;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke_112;
  v14[3] = &unk_1E2AC3D58;
  v14[4] = &v19;
  objc_msgSend(v11, "usingSynchronousProxy:passLocalizedStringForKey:uniqueID:completion:", 1, v10, v8, v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] Error: %@;",
      (uint8_t *)&v6,
      0x16u);

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));

}

void __52__PKPassLibrary_passLocalizedStringForKey_uniqueID___block_invoke_112(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)addPasses:(NSArray *)passes withCompletionHandler:(void *)completion
{
  NSArray *v6;
  void *v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = passes;
  v7 = completion;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19400CFE8](v10);
        objc_msgSend(v14, "archiveData", (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v11 = v10;
    }
    while (v10);
  }

  -[PKPassLibrary addPassesWithData:withCompletionHandler:](self, "addPassesWithData:withCompletionHandler:", v8, v7);
}

- (void)addPassesWithData:(id)a3 withCompletionHandler:(id)a4
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
  if (objc_msgSend(v7, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v17 = a2;
    v10 = v8;
    aBlock[4] = self;
    v16 = v10;
    v11 = _Block_copy(aBlock);
    -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_114;
    v13[3] = &unk_1E2AC3E70;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "addPassesWithData:handler:", v7, v13);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

void __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_114(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E2AC1C68;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __57__PKPassLibrary_addPassesWithData_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)addPassesWithIngestionPayloads:(id)a3 withCompletionHandler:(id)a4
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
  if (objc_msgSend(v7, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v17 = a2;
    v10 = v8;
    aBlock[4] = self;
    v16 = v10;
    v11 = _Block_copy(aBlock);
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_115;
    v13[3] = &unk_1E2AC3E98;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "usingSynchronousProxy:addPassIngestionPayloads:withCompletionHandler:", 0, v7, v13);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

void __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_115(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E2AC1C68;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __70__PKPassLibrary_addPassesWithIngestionPayloads_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)addPassesContainer:(id)a3 withCompletionHandler:(id)a4
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
    aBlock[2] = __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E2ABDBD0;
    v18 = a2;
    v11 = v8;
    aBlock[4] = self;
    v17 = v11;
    v12 = _Block_copy(aBlock);
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke_117;
    v14[3] = &unk_1E2AC3E98;
    v14[4] = self;
    v15 = v11;
    objc_msgSend(v13, "usingSynchronousProxy:addPassesContainer:withCompletionHandler:", 0, v7, v14);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

uint64_t __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 2);
  return result;
}

uint64_t __58__PKPassLibrary_addPassesContainer_withCompletionHandler___block_invoke_117(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addUnsignedPassesAtURLs:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PKFileDescriptorXPCContainer *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  SEL v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = -[PKFileDescriptorXPCContainer initWithFileURL:]([PKFileDescriptorXPCContainer alloc], "initWithFileURL:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14));
        objc_msgSend(v9, "safelyAddObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v12);
  }

  v16 = objc_msgSend(v9, "count");
  if (v16 == objc_msgSend(v10, "count"))
  {
    v17 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E2AC3EC0;
    v18 = v9;
    v30 = v18;
    v31 = v8;
    v26[0] = v17;
    v26[1] = 3221225472;
    v26[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2;
    v26[3] = &unk_1E2ABDBD0;
    v28 = a2;
    v19 = _Block_copy(aBlock);
    v26[4] = self;
    v27 = v19;
    v20 = _Block_copy(v26);
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_119;
    v24[3] = &unk_1E2AC3E98;
    v24[4] = self;
    v25 = v19;
    v22 = v19;
    objc_msgSend(v21, "usingSynchronousProxy:addUnsignedPassesWithDataFileDescriptors:completionHandler:", 0, v18, v24);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v23, OS_LOG_TYPE_DEFAULT, "Attempting to add unsigned passed, but failed to convert all .pkpass urls to fds", buf, 2u);
    }

    if (v8)
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 2);
  }

}

uint64_t __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "invalidate", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_119(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2_120;
  block[3] = &unk_1E2ABDBD0;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

uint64_t __63__PKPassLibrary_addUnsignedPassesAtURLs_withCompletionHandler___block_invoke_2_120(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)provisionHomeKeyPassForSerialNumbers:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Provisioning HomeKey passes: %@", buf, 0xCu);
  }

  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke;
  v16[3] = &unk_1E2AC3090;
  v18 = a2;
  v11 = v8;
  v16[4] = self;
  v17 = v11;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke_121;
  v14[3] = &unk_1E2ABE710;
  v14[4] = self;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "usingSynchronousProxy:provisionHomeKeyPassForSerialNumbers:completionHandler:", 0, v7, v14);

}

void __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

void __72__PKPassLibrary_provisionHomeKeyPassForSerialNumbers_completionHandler___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)availableHomeKeyPassesWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  uint8_t buf[16];

  v5 = a3;
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Fetching available HomeKey passes", buf, 2u);
  }

  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E2AC3090;
  v15 = a2;
  v8 = v5;
  v13[4] = self;
  v14 = v8;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke_123;
  v11[3] = &unk_1E2AC3558;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "usingSynchronousProxy:availableHomeKeyPassesWithCompletionHandler:", 0, v11);

}

void __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

void __61__PKPassLibrary_availableHomeKeyPassesWithCompletionHandler___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  PKSecureElement *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  PKSerializedDataAccessor *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v6)
  {
    v18 = a1;
    v8 = objc_alloc_init(PKSecureElement);
    -[PKSecureElement secureElementIdentifiers](v8, "secureElementIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v14 = -[PKSerializedDataAccessor initWithData:error:]([PKSerializedDataAccessor alloc], "initWithData:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 0);
          v15 = +[PKObject createWithFileDataAccessor:validationOptions:warnings:error:](PKPass, "createWithFileDataAccessor:validationOptions:warnings:error:", v14, 2, 0, 0);
          objc_msgSend(v15, "paymentPass");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v9);
          objc_msgSend(v7, "safelyAddObject:", v16);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v6 = 0;
    a1 = v18;
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v7, v6);

}

- (void)replaceUnsignedPassAtURL:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  PKFileDescriptorXPCContainer *v9;
  uint64_t v10;
  id v11;
  PKFileDescriptorXPCContainer *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  _QWORD aBlock[4];
  PKFileDescriptorXPCContainer *v23;
  id v24;

  v7 = a4;
  v8 = a3;
  v9 = -[PKFileDescriptorXPCContainer initWithFileURL:]([PKFileDescriptorXPCContainer alloc], "initWithFileURL:", v8);

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E2ABDCE8;
  v23 = v9;
  v24 = v7;
  v11 = v7;
  v12 = v9;
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2;
  v19[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v13 = _Block_copy(aBlock);
  v19[4] = self;
  v20 = v13;
  v14 = _Block_copy(v19);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_126;
  v17[3] = &unk_1E2ABDDB0;
  v17[4] = self;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v15, "usingSynchronousProxy:replaceUnsignedPassWithDataFileDescriptor:completionHandler:", 0, v12, v17);

}

uint64_t __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_126(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2_127;
  block[3] = &unk_1E2ABDAB8;
  v5 = *(id *)(a1 + 40);
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v4, block);

}

uint64_t __64__PKPassLibrary_replaceUnsignedPassAtURL_withCompletionHandler___block_invoke_2_127(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)generateTransactionKeyWithReaderIdentifier:(id)a3 readerPublicKey:(id)a4 completion:(id)a5
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
  v18[2] = __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke;
  v18[3] = &unk_1E2AC3090;
  v20 = a2;
  v11 = v9;
  v18[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_128;
  v16[3] = &unk_1E2AC3F10;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "usingSynchronousProxy:generateTransactionKeyWithReaderIdentifier:readerPublicKey:completion:", 0, v13, v12, v16);

}

void __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, 0, 0, v3);

}

void __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_128(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_2;
  block[3] = &unk_1E2AC3EE8;
  v17 = *(id *)(a1 + 40);
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v18 = *(_QWORD *)(a1 + 32);
  v29 = v15;
  v30 = v18;
  v31 = v17;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v23 = v11;
  dispatch_async(v16, block);

}

uint64_t __87__PKPassLibrary_generateTransactionKeyWithReaderIdentifier_readerPublicKey_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[10];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6], a1[7], a1[8]);
  return result;
}

- (void)configureHomeAuxiliaryCapabilitiesForSerialNumber:(id)a3 homeIdentifier:(id)a4 fromUnifiedAccessDescriptor:(id)a5 andAliroDescriptor:(id)a6 completion:(id)a7
{
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  SEL v26;

  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke;
  v24[3] = &unk_1E2AC3090;
  v26 = a2;
  v15 = v13;
  v24[4] = self;
  v25 = v15;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v24);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_130;
  v22[3] = &unk_1E2AC3F60;
  v22[4] = self;
  v23 = v15;
  v21 = v15;
  objc_msgSend(v20, "usingSynchronousProxy:configureHomeAuxiliaryCapabilitiesForSerialNumber:homeIdentifier:fromUnifiedAccessDescriptor:andAliroDescriptor:completion:", 0, v19, v18, v17, v16, v22);

}

void __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, 0, v3);

}

void __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_130(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_2;
  v19[3] = &unk_1E2AC3F38;
  v14 = *(id *)(a1 + 40);
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v14;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v9;
  dispatch_async(v13, v19);

}

uint64_t __140__PKPassLibrary_configureHomeAuxiliaryCapabilitiesForSerialNumber_homeIdentifier_fromUnifiedAccessDescriptor_andAliroDescriptor_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = a1[9];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5], a1[6], a1[7]);
  return result;
}

- (void)fetchTransactionKeyForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__PKPassLibrary_fetchTransactionKeyForPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  v10[3] = &unk_1E2AC3F88;
  v11 = v8;
  v9 = v8;
  -[PKPassLibrary fetchAppletSubCredentialForPassTypeIdentifier:serialNumber:completionHandler:](self, "fetchAppletSubCredentialForPassTypeIdentifier:serialNumber:completionHandler:", a3, a4, v10);

}

void __89__PKPassLibrary_fetchTransactionKeyForPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "transactionKey");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)fetchAppletSubCredentialForPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
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
  v18[2] = __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  v18[3] = &unk_1E2AC3090;
  v20 = a2;
  v11 = v9;
  v18[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke_133;
  v16[3] = &unk_1E2AC3FB0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "usingSynchronousProxy:fetchAppletSubCredentialForPassTypeIdentifier:serialNumber:completionHandler:", 0, v13, v12, v16);

}

void __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __94__PKPassLibrary_fetchAppletSubCredentialForPassTypeIdentifier_serialNumber_completionHandler___block_invoke_133(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)enableExpressForPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 completionHandler:(id)a5
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
  v18[2] = __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke;
  v18[3] = &unk_1E2AC3090;
  v20 = a2;
  v11 = v9;
  v18[4] = self;
  v19 = v11;
  v12 = a4;
  v13 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_134;
  v16[3] = &unk_1E2ABDDB0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "usingSynchronousProxy:enableExpressForPassWithPassTypeIdentifier:serialNumber:completionHandler:", 0, v13, v12, v16);

}

void __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v7, 0xCu);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

void __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_134(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2;
  block[3] = &unk_1E2ABDAB8;
  v5 = *(id *)(a1 + 40);
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v4, block);

}

uint64_t __91__PKPassLibrary_enableExpressForPassWithPassTypeIdentifier_serialNumber_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)openPaymentSetup
{
  id v2;

  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openPaymentUIWithCompletion:", &__block_literal_global_30);

}

- (void)openPaymentSetupForMerchantIdentifier:(id)a3 domain:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  PKInAppPaymentService *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Requesting merchant registration status for openPaymentSetup...", buf, 2u);
  }

  v12 = objc_alloc_init(PKInAppPaymentService);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PKPassLibrary_openPaymentSetupForMerchantIdentifier_domain_completion___block_invoke;
  v14[3] = &unk_1E2ABDAE0;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[PKInAppPaymentService merchantStatusCheck:merchantDomain:sourceApplicationSecondaryIdentifier:completion:](v12, "merchantStatusCheck:merchantDomain:sourceApplicationSecondaryIdentifier:completion:", v8, v9, 0, v14);

}

void __73__PKPassLibrary_openPaymentSetupForMerchantIdentifier_domain_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)a2)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Merchant registered, opening payment setup", (uint8_t *)&v9, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "openPaymentSetup");
  }
  else
  {
    if (v7)
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Could not validate merchant for payment setup: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);

}

- (void)presentPaymentSetupRequest:(id)a3 orientation:(id)a4 completion:(id)a5
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
  aBlock[2] = __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v21 = a2;
  v11 = v9;
  aBlock[4] = self;
  v20 = v11;
  v12 = a4;
  v13 = a3;
  v14 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_137;
  v17[3] = &unk_1E2ABDDB0;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "presentPaymentSetupRequest:orientation:completion:", v13, v12, v17);

}

uint64_t __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_137(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  char v8;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_2;
  block[3] = &unk_1E2ABDAB8;
  v5 = *(id *)(a1 + 40);
  v8 = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v4, block);

}

uint64_t __67__PKPassLibrary_presentPaymentSetupRequest_orientation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v19;
  SEL v20;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v9 = v7;
  aBlock[4] = self;
  v19 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  PKLogFacilityTypeGetObject(6uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKPassLibrary requesting payment setup features", buf, 2u);
  }

  -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_138;
  v15[3] = &unk_1E2ABE008;
  v15[4] = self;
  v16 = v9;
  v14 = v9;
  objc_msgSend(v13, "paymentSetupFeaturesForConfiguration:completion:", v10, v15);

}

uint64_t __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __65__PKPassLibrary_paymentSetupFeaturesForConfiguration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)paymentPassWithAssociatedAccountIdentifier:(id)a3 completion:(id)a4
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
  aBlock[2] = __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_139;
  v14[3] = &unk_1E2AC3FF8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "paymentPassWithAssociatedAccountIdentifier:completion:", v10, v14);

}

uint64_t __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E2ABDA68;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v11 = v5;
  v7 = v3;
  dispatch_async(v4, block);

}

uint64_t __71__PKPassLibrary_paymentPassWithAssociatedAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)presentSecureElementPass:(PKSecureElementPass *)pass
{
  PKSecureElementPass *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PKSecureElementPass *v8;

  v4 = pass;
  if (v4)
  {
    v8 = v4;
    -[PKObject uniqueID](v4, "uniqueID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v5)
    {
      v6 = -[PKPass passType](v8, "passType");

      v4 = v8;
      if (v6 == 1)
      {
        -[PKObject uniqueID](v8, "uniqueID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPassLibrary presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:completion:](self, "presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:completion:", v7, 4, 0);

        v4 = v8;
      }
    }
  }

}

- (void)presentWalletWithRelevantPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  if (a3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__PKPassLibrary_presentWalletWithRelevantPassUniqueID___block_invoke;
    v6[3] = &__block_descriptor_40_e5_v8__0l;
    v6[4] = a2;
    v4 = a3;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openWalletUIWithRelevantPass:", v4);

  }
}

void __55__PKPassLibrary_presentWalletWithRelevantPassUniqueID___block_invoke(uint64_t a1)
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

- (void)canPresentPaymentRequest:(id)a3 completion:(id)a4
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
    v15[2] = __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke;
    v15[3] = &unk_1E2ABDBD0;
    v17 = a2;
    v10 = v7;
    v15[4] = self;
    v16 = v10;
    v11 = a3;
    -[PKPassLibrary _inAppRemoteObjectProxyWithFailureHandler:](self, "_inAppRemoteObjectProxyWithFailureHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke_140;
    v13[3] = &unk_1E2AC4020;
    v13[4] = self;
    v14 = v10;
    objc_msgSend(v12, "canPresentPaymentRequest:completion:", v11, v13);

  }
}

uint64_t __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __53__PKPassLibrary_canPresentPaymentRequest_completion___block_invoke_140(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webDomain:(id)a6
{
  return -[PKPassLibrary hasPassesWithSupportedNetworks:merchantCapabilities:issuerCountryCodes:webDomain:paymentRequestType:isMultiTokensRequest:](self, "hasPassesWithSupportedNetworks:merchantCapabilities:issuerCountryCodes:webDomain:paymentRequestType:isMultiTokensRequest:", a3, a4, a5, a6, 0, 0);
}

- (BOOL)hasPassesWithSupportedNetworks:(id)a3 merchantCapabilities:(unint64_t)a4 issuerCountryCodes:(id)a5 webDomain:(id)a6 paymentRequestType:(id)a7 isMultiTokensRequest:(BOOL)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a8;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  -[PKPassLibrary _synchronousInAppRemoteObjectProxyWithErrorHandler:](self, "_synchronousInAppRemoteObjectProxyWithErrorHandler:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = 3221225472;
  v20[2] = __138__PKPassLibrary_hasPassesWithSupportedNetworks_merchantCapabilities_issuerCountryCodes_webDomain_paymentRequestType_isMultiTokensRequest___block_invoke;
  v20[3] = &unk_1E2ABDD10;
  v20[4] = &v21;
  v20[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v18, "hasPassesWithSupportedNetworks:merchantCapabilities:webDomain:issuerCountryCodes:paymentRequestType:isMultiTokensRequest:completion:", v14, a4, v16, v15, v17, v8, v20);
  LOBYTE(v8) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v8;
}

uint64_t __138__PKPassLibrary_hasPassesWithSupportedNetworks_merchantCapabilities_issuerCountryCodes_webDomain_paymentRequestType_isMultiTokensRequest___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)presentContactlessInterfaceForDefaultPassFromSource:(int64_t)a3 completion:(id)a4
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
  aBlock[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v17 = a2;
  v9 = v7;
  aBlock[4] = self;
  v16 = v9;
  v10 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_2;
  v13[3] = &unk_1E2ABDDB0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "presentContactlessInterfaceForDefaultPassFromSource:handler:", a3, v13);

}

void __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_142;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_3;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_142(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_2(uint64_t a1, char a2)
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
  v8[2] = __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __80__PKPassLibrary_presentContactlessInterfaceForDefaultPassFromSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)presentContactlessInterfaceForPassWithUniqueIdentifier:(id)a3 fromSource:(int64_t)a4 completion:(id)a5
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
  aBlock[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v20 = a2;
  v11 = v9;
  aBlock[4] = self;
  v19 = v11;
  v12 = a3;
  v13 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_2;
  v16[3] = &unk_1E2ABDDB0;
  v16[4] = self;
  v17 = v11;
  v15 = v11;
  objc_msgSend(v14, "presentContactlessInterfaceForPassWithUniqueIdentifier:fromSource:handler:", v12, a4, v16);

}

void __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];",
      (uint8_t *)&buf,
      0xCu);

  }
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_143;
  v8[3] = &unk_1E2ABDA18;
  v6 = *(id *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  *(_QWORD *)&buf = v5;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = __dispatch_async_ar_block_invoke_3;
  v12 = &unk_1E2ABD9A0;
  v13 = v7;
  dispatch_async(v4, &buf);

}

uint64_t __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_143(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_2(uint64_t a1, char a2)
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
  v8[2] = __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_3;
  v8[3] = &unk_1E2ABDAB8;
  v6 = *(id *)(a1 + 40);
  v10 = a2;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v8;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v12 = v7;
  dispatch_async(v4, block);

}

uint64_t __94__PKPassLibrary_presentContactlessInterfaceForPassWithUniqueIdentifier_fromSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

- (void)activatePaymentPass:(PKPaymentPass *)paymentPass withActivationCode:(NSString *)activationCode completion:(void *)completion
{
  PKPaymentPass *v8;
  NSString *v9;
  void (**v10)(void *, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = paymentPass;
  v9 = activationCode;
  v10 = completion;
  if (-[NSString length](v9, "length"))
  {
    -[PKPassLibrary _activateSecureElementPass:withActivationCode:activationData:completion:](self, "_activateSecureElementPass:withActivationCode:activationData:completion:", v8, v9, 0, v10);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("INVALID_ACTIVATION_CODE"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v10[2](v10, 0, v14);

  }
}

- (void)activateSecureElementPass:(PKSecureElementPass *)secureElementPass withActivationData:(NSData *)activationData completion:(void *)completion
{
  PKSecureElementPass *v8;
  NSData *v9;
  void (**v10)(void *, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = secureElementPass;
  v9 = activationData;
  v10 = completion;
  if (-[NSData length](v9, "length"))
  {
    -[PKPassLibrary _activateSecureElementPass:withActivationCode:activationData:completion:](self, "_activateSecureElementPass:withActivationCode:activationData:completion:", v8, 0, v9, v10);
  }
  else
  {
    PKLocalizedPaymentString(CFSTR("INVALID_ACTIVATION_DATA"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v10[2](v10, 0, v14);

  }
}

- (void)_activateSecureElementPass:(id)a3 withActivationCode:(id)a4 activationData:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PKPassLibrary *v16;
  PKPassLibrary *v17;
  PKPassLibrary *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  PKPassLibrary *v25;
  uint64_t v26;
  id v27;
  PKPassLibrary *v28;
  void *v29;
  void *v30;
  PKPassLibrary *v31;
  id v32;
  const char *v33;
  _QWORD v34[4];
  PKPassLibrary *v35;
  id v36;
  _QWORD v37[4];
  PKPassLibrary *v38;
  id v39;
  SEL v40;

  v11 = a3;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(v11, "dataAccessor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "library");
    v17 = (PKPassLibrary *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17 || v17 == v16)
      goto LABEL_10;
    v18 = v17;
    v19 = (uint64_t)v18;
LABEL_9:

    v16 = (PKPassLibrary *)v19;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v11, "passLibraryMachServiceName");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    v33 = a2;
    -[PKXPCService machServiceName](v16->_remoteService, "machServiceName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passLibraryMachServiceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if ((v24 & 1) == 0)
    {
      v25 = [PKPassLibrary alloc];
      objc_msgSend(v11, "passLibraryMachServiceName");
      v18 = (PKPassLibrary *)objc_claimAutoreleasedReturnValue();
      v19 = -[PKPassLibrary initWithMachServiceName:resumeNotificationName:interfaceType:](v25, "initWithMachServiceName:resumeNotificationName:interfaceType:", v18, 0, 0);
      a2 = v33;
      goto LABEL_9;
    }
    a2 = v33;
  }
LABEL_11:
  v26 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke;
  v37[3] = &unk_1E2ABDBD0;
  v40 = a2;
  v27 = v12;
  v39 = v27;
  v28 = v16;
  v38 = v28;
  -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](v28, "_remoteObjectProxyWithFailureHandler:", v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  v34[1] = 3221225472;
  v34[2] = __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke_151;
  v34[3] = &unk_1E2ABDF68;
  v35 = v28;
  v36 = v27;
  v31 = v28;
  v32 = v27;
  objc_msgSend(v29, "submitVerificationCode:verificationData:forPassWithUniqueID:handler:", v14, v13, v30, v34);

}

uint64_t __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "XPC Failure in -[PKPassLibrary %@];",
      (uint8_t *)&v5,
      0xCu);

  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl(&dword_18FC92000, v2, OS_LOG_TYPE_ERROR, "Error on PKPassLibrary connection.", (uint8_t *)&v5, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __89__PKPassLibrary__activateSecureElementPass_withActivationCode_activationData_completion___block_invoke_151(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestUpdateOfObjectWithUniqueIdentifier:(id)a3 completion:(id)a4
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
  aBlock[2] = __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v18 = a2;
  v9 = v7;
  aBlock[4] = self;
  v17 = v9;
  v10 = a3;
  v11 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke_152;
  v14[3] = &unk_1E2ABDDB0;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "updateObjectWithUniqueIdentifier:handler:", v10, v14);

}

uint64_t __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __70__PKPassLibrary_requestUpdateOfObjectWithUniqueIdentifier_completion___block_invoke_152(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestPersonalizationOfPassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8
{
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD aBlock[5];
  id v27;
  SEL v28;

  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v28 = a2;
  v17 = v15;
  aBlock[4] = self;
  v27 = v17;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke_153;
  v24[3] = &unk_1E2ABDDB0;
  v24[4] = self;
  v25 = v17;
  v23 = v17;
  objc_msgSend(v22, "personalizePassWithUniqueIdentifier:contact:personalizationToken:requiredPersonalizationFields:personalizationSource:handler:", v20, v19, v18, a6, a7, v24);

}

uint64_t __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __155__PKPassLibrary_requestPersonalizationOfPassWithUniqueIdentifier_contact_personalizationToken_requiredPersonalizationFields_personalizationSource_handler___block_invoke_153(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removePass:(PKPass *)pass
{
  id v4;

  if (pass)
  {
    -[PKObject uniqueID](pass, "uniqueID");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPassLibrary removePassWithUniqueID:diagnosticReason:](self, "removePassWithUniqueID:diagnosticReason:", v4, 0);

  }
}

- (void)removePasses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "uniqueID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length"))
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  -[PKPassLibrary removePassesWithUniqueIDs:diagnosticReason:](self, "removePassesWithUniqueIDs:diagnosticReason:", v13, 0);

}

- (void)getContainmentStatusAndSettingsForPass:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  PKPassLibrary *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD aBlock[5];
  id v26;
  SEL v27;

  v7 = a3;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke;
  aBlock[3] = &unk_1E2ABDBD0;
  v27 = a2;
  v10 = v8;
  aBlock[4] = self;
  v26 = v10;
  v11 = _Block_copy(aBlock);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "passTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke_154;
  v17[3] = &unk_1E2AC4048;
  v15 = v7;
  v18 = v15;
  v21 = v24;
  v22 = v23;
  v16 = v10;
  v19 = self;
  v20 = v16;
  objc_msgSend(v12, "getManifestHashAndSettingsForPassTypeID:serialNumber:handler:", v13, v14, v17);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);

}

uint64_t __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __68__PKPassLibrary_getContainmentStatusAndSettingsForPass_withHandler___block_invoke_154(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;

  if (a2)
  {
    v5 = (void *)a1[4];
    v6 = a2;
    objc_msgSend(v5, "manifestHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToData:", v7);

    v9 = 1;
    if (!v8)
      v9 = 2;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)noteObjectSharedWithUniqueID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteObjectSharedWithUniqueID:", v4);

}

- (void)updateSettings:(unint64_t)a3 forObjectWithUniqueID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSettings:forObjectWithUniqueID:", a3, v6);

}

- (void)setSortingState:(int64_t)a3 forObjectWithUniqueID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortingState:forObjectWithUniqueID:withCompletion:", a3, v9, v8);

}

- (unint64_t)setLiveRenderingEnabled:(BOOL)a3 forPassUniqueID:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke;
  v12[3] = &unk_1E2AC4070;
  v12[4] = &v13;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke_2;
  v11[3] = &unk_1E2ABDC48;
  v11[4] = &v13;
  objc_msgSend(v8, "usingSynchronousProxy:setLiveRenderingEnabled:forPassUniqueID:handler:", 1, v4, v6, v11);
  v9 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __57__PKPassLibrary_setLiveRenderingEnabled_forPassUniqueID___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)dynamicStateForPassUniqueID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v5 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke;
  v10[3] = &unk_1E2AC4070;
  v10[4] = &v11;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke_2;
  v9[3] = &unk_1E2AC4098;
  v9[4] = &v11;
  objc_msgSend(v6, "usingSynchronousProxy:dynamicStateForPassUniqueID:handler:", 1, v4, v9);
  v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __45__PKPassLibrary_dynamicStateForPassUniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)rescheduleCommutePlanRenewalReminderForPassWithUniqueID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rescheduleCommutePlanRenewalReminderForPassWithUniqueID:", v4);

}

- (void)checkForTransitNotification
{
  id v2;

  -[PKPassLibrary _remoteObjectProxy](self, "_remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkForTransitNotification");

}

- (void)postUpgradedPassNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKPassLibrary _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postUpgradedPassNotificationForMarket:passUniqueID:", v7, v6);

}

- (void)postUpgradesAvailableNotificationForMarket:(id)a3 passUniqueID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKPassLibrary _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "usingSynchronousProxy:postUpgradesAvailableNotificationForMarket:passUniqueID:", 0, v7, v6);

}

- (void)signData:(NSData *)signData withSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion
{
  NSData *v9;
  PKSecureElementPass *v10;
  void *v11;
  PKPassLibrary *remoteLibrary;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  NSObject *v21;
  SEL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  NSData *v26;
  __int16 v27;
  PKSecureElementPass *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = signData;
  v10 = secureElementPass;
  v11 = completion;
  if (v11)
  {
    if (v9 && v10)
    {
      remoteLibrary = self;
      if (-[PKPass isRemotePass](v10, "isRemotePass"))
        remoteLibrary = self->_remoteLibrary;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __59__PKPassLibrary_signData_withSecureElementPass_completion___block_invoke;
      v20[3] = &unk_1E2AC3090;
      v22 = a2;
      v13 = v11;
      v20[4] = self;
      v21 = v13;
      -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](remoteLibrary, "_remoteObjectProxyWithErrorHandler:", v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject uniqueID](v10, "uniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "signData:forPassUniqueID:completion:", v9, v15, v13);

      v16 = v21;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v19;
        v25 = 2112;
        v26 = v9;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] requires all input values -> signData: %@ secureElementPass: %@", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, _QWORD, NSObject *))v11 + 2))(v11, 0, 0, v16);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] had no completion", buf, 0xCu);

    }
  }

}

void __59__PKPassLibrary_signData_withSecureElementPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] error: %@;",
      (uint8_t *)&v7,
      0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)encryptedServiceProviderDataForSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion
{
  PKSecureElementPass *v7;
  void *v8;
  PKPassLibrary *remoteLibrary;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  NSObject *v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = secureElementPass;
  v8 = completion;
  if (v8)
  {
    if (v7)
    {
      remoteLibrary = self;
      if (-[PKPass isRemotePass](v7, "isRemotePass"))
        remoteLibrary = self->_remoteLibrary;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __77__PKPassLibrary_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke;
      v17[3] = &unk_1E2AC3090;
      v19 = a2;
      v10 = v8;
      v17[4] = self;
      v18 = v10;
      -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](remoteLibrary, "_remoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject uniqueID](v7, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "usingSynchronousProxy:getEncryptedServiceProviderDataForUniqueID:completion:", 0, v12, v10);

      v13 = v18;
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v16;
        v22 = 2112;
        v23 = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] requires all input values -> secureElementPass: %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, NSObject *))v8 + 2))(v8, 0, v13);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] had no completion", buf, 0xCu);

    }
  }

}

void __77__PKPassLibrary_encryptedServiceProviderDataForSecureElementPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] error: %@;",
      (uint8_t *)&v7,
      0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)serviceProviderDataForSecureElementPass:(PKSecureElementPass *)secureElementPass completion:(void *)completion
{
  PKSecureElementPass *v7;
  void *v8;
  PKPassLibrary *remoteLibrary;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  NSObject *v18;
  SEL v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = secureElementPass;
  v8 = completion;
  if (v8)
  {
    if (v7)
    {
      remoteLibrary = self;
      if (-[PKPass isRemotePass](v7, "isRemotePass"))
        remoteLibrary = self->_remoteLibrary;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __68__PKPassLibrary_serviceProviderDataForSecureElementPass_completion___block_invoke;
      v17[3] = &unk_1E2AC3090;
      v19 = a2;
      v10 = v8;
      v17[4] = self;
      v18 = v10;
      -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](remoteLibrary, "_remoteObjectProxyWithErrorHandler:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKObject uniqueID](v7, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "usingSynchronousProxy:getServiceProviderDataForUniqueID:completion:", 0, v12, v10);

      v13 = v18;
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v16;
        v22 = 2112;
        v23 = 0;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] requires all input values -> secureElementPass: %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, NSObject *))v8 + 2))(v8, 0, v13);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "[PKPassLibrary %@] had no completion", buf, 0xCu);

    }
  }

}

void __68__PKPassLibrary_serviceProviderDataForSecureElementPass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@] error: %@;",
      (uint8_t *)&v7,
      0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3
{
  return -[PKPassLibrary canAddSecureElementPassWithConfiguration:outError:](self, "canAddSecureElementPassWithConfiguration:outError:", a3, 0);
}

- (BOOL)canAddSecureElementPassWithConfiguration:(id)a3 outError:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD aBlock[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v7 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke;
  aBlock[3] = &unk_1E2AC40C0;
  aBlock[4] = &v15;
  aBlock[5] = a2;
  v9 = _Block_copy(aBlock);
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke_157;
  v13[3] = &unk_1E2AC40E8;
  v13[4] = &v21;
  v13[5] = &v15;
  objc_msgSend(v10, "usingSynchronousProxy:canAddSecureElementPassWithConfiguration:completion:", 1, v7, v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

void __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v9,
      0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __67__PKPassLibrary_canAddSecureElementPassWithConfiguration_outError___block_invoke_157(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v8,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

}

uint64_t __69__PKPassLibrary_canAddSecureElementPassWithConfiguration_completion___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)canAddCarKeyPassWithConfiguration:(id)a3 completion:(id)a4
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
    aBlock[2] = __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke;
    aBlock[3] = &unk_1E2AC4110;
    v18 = a2;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke_159;
    v14[3] = &unk_1E2AC4138;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "usingSynchronousProxy:canAddCarKeyPassWithConfiguration:completion:", 0, v11, v14);

  }
}

void __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v8,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v7);

}

uint64_t __62__PKPassLibrary_canAddCarKeyPassWithConfiguration_completion___block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)meetsProvisioningRequirements:(id)a3 completion:(id)a4
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
    aBlock[2] = __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke;
    aBlock[3] = &unk_1E2AC4110;
    v18 = a2;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke_161;
    v14[3] = &unk_1E2AC4160;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "usingSynchronousProxy:meetsProvisioningRequirements:completion:", 0, v11, v14);

  }
}

void __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]: %@;",
      (uint8_t *)&v6,
      0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __58__PKPassLibrary_meetsProvisioningRequirements_completion___block_invoke_161(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)meetsProvisioningRequirements:(id)a3 missingRequirements:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11;
  v15 = __Block_byref_object_dispose__11;
  v16 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PKPassLibrary_meetsProvisioningRequirements_missingRequirements___block_invoke;
  v10[3] = &unk_1E2AC4188;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[4] = self;
  objc_msgSend(v7, "usingSynchronousProxy:meetsProvisioningRequirements:completion:", 1, v6, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v8;
}

void __67__PKPassLibrary_meetsProvisioningRequirements_missingRequirements___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
}

- (id)passForProvisioningCredentialHash:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;
  _QWORD v13[3];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__11;
  v11[4] = __Block_byref_object_dispose__11;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke;
  v10[3] = &unk_1E2AC41B0;
  v10[4] = v13;
  v10[5] = v11;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke_2;
  v9[3] = &unk_1E2AC41D8;
  v9[4] = self;
  v9[5] = &v15;
  objc_msgSend(v6, "usingSynchronousProxy:getPassForProvisioningCredentialHash:handler:", 1, v4, v9);
  v7 = (id)v16[5];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void __51__PKPassLibrary_passForProvisioningCredentialHash___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)fetchContentForUniqueID:(id)a3 withCompletion:(id)a4
{
  -[PKPassLibrary _fetchContentForUniqueID:usingSynchronousProxy:withCompletion:](self, "_fetchContentForUniqueID:usingSynchronousProxy:withCompletion:", a3, 0, a4);
}

uint64_t __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __79__PKPassLibrary__fetchContentForUniqueID_usingSynchronousProxy_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)cachedImageSetForUniqueID:(id)a3 type:(int64_t)a4 withDisplayProfile:(id)a5 displayTraits:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2)
    && +[PKImageSet shouldCacheForDisplayProfile:imageSetType:](PKImageSet, "shouldCacheForDisplayProfile:imageSetType:", v11, a4))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__11;
    v21 = __Block_byref_object_dispose__11;
    v22 = 0;
    -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke;
    v16[3] = &unk_1E2AC42A0;
    v16[4] = &v17;
    v16[5] = a4;
    objc_msgSend(v13, "usingSynchronousProxy:getCachedImageSetContainerForUniqueID:type:withDisplayProfile:displayTraits:handler:", 1, v10, a4, v11, v12, v16);
    v14 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v3 = a2;
  if (v3)
  {
    PKPassLibraryImageSetCache();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageSetHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_2;
    v13[3] = &unk_1E2AC4250;
    v7 = v3;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v14 = v7;
    v15 = v8;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_3;
    v10[3] = &unk_1E2AC4278;
    v12 = v9;
    v11 = v7;
    objc_msgSend(v4, "retrieveItemForKey:synchronous:retrievalBlock:deliveryBlock:", v5, 1, v13, v10);

  }
}

void __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);

  v4 = a2;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "consumeImageSet");
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (v3 && objc_msgSend((id)objc_opt_class(), "imageSetType") != *(_QWORD *)(a1 + 40))
  {

    v3 = 0;
  }
  v4[2](v4, v3);

}

void __81__PKPassLibrary_cachedImageSetForUniqueID_type_withDisplayProfile_displayTraits___block_invoke_3(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __118__PKPassLibrary__fetchImageSetContainerForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_fetchImageSetForUniqueID:(id)a3 ofType:(int64_t)a4 displayProfile:(id)a5 suffix:(id)a6 usingSynchronousProxy:(BOOL)a7 withCompletion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD aBlock[5];
  id v25;
  id v26;
  id v27;
  int64_t v28;
  BOOL v29;

  v9 = a7;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if (v17)
  {
    GenerateKeyImageSetCacheKey(a4, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke;
    aBlock[3] = &unk_1E2AC4368;
    v28 = a4;
    aBlock[4] = self;
    v29 = v9;
    v25 = v14;
    v26 = v15;
    v27 = v16;
    v20 = _Block_copy(aBlock);
    PKPassLibraryImageSetCache();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6;
    v22[3] = &unk_1E2AC4390;
    v23 = v17;
    objc_msgSend(v21, "retrieveItemForKey:synchronous:retrievalBlock:deliveryBlock:", v18, v9, v20, v22);

  }
}

void __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  char v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[5];
  id v21;
  uint64_t v22;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E2AC43B8;
  v22 = *(_QWORD *)(a1 + 64);
  v5 = v3;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3;
  v18[3] = &unk_1E2ABD9C8;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = _Block_copy(v18);
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(v8, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
  else
    objc_msgSend(v8, "_remoteObjectProxyWithErrorHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4;
  v15[3] = &unk_1E2AC43E0;
  v17 = *(_BYTE *)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v6;
  v14 = v6;
  objc_msgSend(v9, "getImageSetForUniqueID:ofType:displayProfile:suffix:handler:", v13, v10, v12, v11, v15);

}

void __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  if (!v3)
    goto LABEL_5;
  v5 = v3;
  if (objc_msgSend((id)objc_opt_class(), "imageSetType") != *(_QWORD *)(a1 + 48))
  {

LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = v5;
LABEL_6:
  v6 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5;
    v6[3] = &unk_1E2ABDA18;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __109__PKPassLibrary__fetchImageSetForUniqueID_ofType_displayProfile_suffix_usingSynchronousProxy_withCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_setSetting:(unint64_t)a3 enabled:(BOOL)a4 forPass:(id)a5
{
  id v8;
  dispatch_semaphore_t v9;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  NSObject *v15;
  uint64_t *v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __45__PKPassLibrary__setSetting_enabled_forPass___block_invoke;
  v13[3] = &unk_1E2AC4408;
  v18 = a4;
  v13[4] = self;
  v17 = a3;
  v10 = v8;
  v14 = v10;
  v16 = &v19;
  v11 = v9;
  v15 = v11;
  -[PKPassLibrary getContainmentStatusAndSettingsForPass:withHandler:](self, "getContainmentStatusAndSettingsForPass:withHandler:", v10, v13);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(self) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

intptr_t __45__PKPassLibrary__setSetting_enabled_forPass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)(a1 + 64);
  v6 = v5 | a3;
  v7 = a3 & ~v5;
  if (*(_BYTE *)(a1 + 72))
    v8 = v6;
  else
    v8 = v7;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateSettings:forObjectWithUniqueID:", v8, v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)setShowInLockScreenEnabled:(BOOL)a3 forPass:(id)a4
{
  return -[PKPassLibrary _setSetting:enabled:forPass:](self, "_setSetting:enabled:forPass:", 1, a3, a4);
}

- (BOOL)setAutomaticUpdatesEnabled:(BOOL)a3 forPass:(id)a4
{
  return -[PKPassLibrary _setSetting:enabled:forPass:](self, "_setSetting:enabled:forPass:", 2, a3, a4);
}

- (BOOL)setNotificationServiceUpdatesEnabled:(BOOL)a3 forPass:(id)a4
{
  return -[PKPassLibrary _setSetting:enabled:forPass:](self, "_setSetting:enabled:forPass:", 8, a3, a4);
}

- (BOOL)setAutomaticPresentationEnabled:(BOOL)a3 forPass:(id)a4
{
  return -[PKPassLibrary _setSetting:enabled:forPass:](self, "_setSetting:enabled:forPass:", 16, a3, a4);
}

- (BOOL)setSuppressNotificationsEnabled:(BOOL)a3 forPass:(id)a4
{
  return -[PKPassLibrary _setSetting:enabled:forPass:](self, "_setSetting:enabled:forPass:", 128, a3, a4);
}

- (BOOL)setSuppressPromotionsEnabled:(BOOL)a3 forPass:(id)a4
{
  return -[PKPassLibrary _setSetting:enabled:forPass:](self, "_setSetting:enabled:forPass:", 256, a3, a4);
}

- (BOOL)resetSettingsForPass:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "defaultSettings");
  objc_msgSend(v4, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassLibrary updateSettings:forObjectWithUniqueID:](self, "updateSettings:forObjectWithUniqueID:", v5, v6);
  return 1;
}

- (id)defaultPaymentPassesWithRemotePasses:(BOOL)a3
{
  _BOOL4 v3;
  dispatch_group_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[5];
  NSObject *v21;
  uint64_t *v22;
  _QWORD aBlock[4];
  NSObject *v24;
  SEL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__11;
  v36 = __Block_byref_object_dispose__11;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__11;
  v30 = __Block_byref_object_dispose__11;
  v31 = 0;
  v6 = dispatch_group_create();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke;
  aBlock[3] = &unk_1E2AC4430;
  v25 = a2;
  v8 = v6;
  v24 = v8;
  v9 = _Block_copy(aBlock);
  -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v8);
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_170;
  v20[3] = &unk_1E2AC4458;
  v20[4] = self;
  v22 = &v32;
  v11 = v8;
  v21 = v11;
  objc_msgSend(v10, "defaultPaymentPassWithHandler:", v20);
  if (v3 && -[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
  {
    -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self->_remoteLibrary, "_remoteObjectProxyWithFailureHandler:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v11);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_2;
    v17[3] = &unk_1E2AC4480;
    v19 = &v26;
    v18 = v11;
    objc_msgSend(v12, "defaultPaymentPassWithHandler:", v17);

  }
  dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = v13;
  if (v33[5])
    objc_msgSend(v13, "addObject:");
  if (v27[5])
    objc_msgSend(v14, "addObject:");
  if (!objc_msgSend(v14, "count"))
  {

    v14 = 0;
  }
  v15 = (void *)objc_msgSend(v14, "copy");

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

void __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke(uint64_t a1)
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
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_170(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObject:", v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __54__PKPassLibrary_defaultPaymentPassesWithRemotePasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (id)expressFelicaTransitPasses
{
  dispatch_group_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  _QWORD v21[4];
  NSObject *v22;
  uint64_t *v23;
  _QWORD aBlock[4];
  NSObject *v25;
  SEL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__11;
  v37 = __Block_byref_object_dispose__11;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = 0;
  v4 = dispatch_group_create();
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke;
  aBlock[3] = &unk_1E2AC4430;
  v26 = a2;
  v6 = v4;
  v25 = v6;
  v7 = _Block_copy(aBlock);
  -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self->_remoteLibrary, "_remoteObjectProxyWithFailureHandler:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_171;
  v21[3] = &unk_1E2AC41D8;
  v23 = &v33;
  v10 = v6;
  v22 = v10;
  objc_msgSend(v8, "expressTransitPassWithHandler:", v21);
  if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
  {
    dispatch_group_enter(v10);
    v15 = v5;
    v16 = 3221225472;
    v17 = __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_2;
    v18 = &unk_1E2AC41D8;
    v20 = &v27;
    v19 = v10;
    objc_msgSend(v9, "expressTransitPassWithHandler:", &v15);

  }
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = v11;
  if (v34[5])
    objc_msgSend(v11, "addObject:");
  if (v28[5])
    objc_msgSend(v12, "addObject:");
  if (!objc_msgSend(v12, "count", v15, v16, v17, v18))
  {

    v12 = 0;
  }
  v13 = (void *)objc_msgSend(v12, "copy");

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v13;
}

void __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke(uint64_t a1)
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
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_171(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __43__PKPassLibrary_expressFelicaTransitPasses__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)sortedTransitPassesForTransitNetworkIdentifiersWithCompletion:(id)a3
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
    aBlock[2] = __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke;
    aBlock[3] = &unk_1E2AC1C68;
    v15 = a2;
    v8 = v5;
    v14 = v8;
    v9 = _Block_copy(aBlock);
    -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke_172;
    v11[3] = &unk_1E2AC44A8;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v10, "sortedTransitPassesForTransitNetworkIdentifiers:", v11);

  }
}

uint64_t __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__PKPassLibrary_sortedTransitPassesForTransitNetworkIdentifiersWithCompletion___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)sortedTransitPassesForAppletDataFormat:(id)a3 completion:(id)a4
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
    aBlock[2] = __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke;
    aBlock[3] = &unk_1E2AC1C68;
    v18 = a2;
    v10 = v7;
    v17 = v10;
    v11 = a3;
    v12 = _Block_copy(aBlock);
    -[PKPassLibrary _remoteObjectProxyWithFailureHandler:](self, "_remoteObjectProxyWithFailureHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke_173;
    v14[3] = &unk_1E2ABDE50;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v13, "sortedTransitPassesForAppletDataFormat:handler:", v11, v14);

  }
}

uint64_t __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PKPassLibrary_sortedTransitPassesForAppletDataFormat_completion___block_invoke_173(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_applyDataAccessorToObjects:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_sortedPaymentPassesForPaymentRequest:(id)a3
{
  return -[PKPassLibrary _sortedPaymentPassesForPaymentRequest:additionalPaymentPasses:](self, "_sortedPaymentPassesForPaymentRequest:additionalPaymentPasses:", a3, 0);
}

- (id)_sortedPaymentPassesForPaymentRequest:(id)a3 additionalPaymentPasses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  int v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  char v41;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36 = objc_msgSend(v6, "isPeerPaymentRequest");
  v37 = v6;
  -[PKPassLibrary inAppPaymentPassesForPaymentRequest:](self, "inAppPaymentPassesForPaymentRequest:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = (void *)objc_msgSend(v10, "pk_createSetByApplyingBlock:", &__block_literal_global_175);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v17, "uniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v11, "containsObject:", v18);

        if ((v19 & 1) == 0)
          objc_msgSend(v10, "safelyAddObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v14);
  }

  if ((unint64_t)objc_msgSend(v10, "count") > 1)
  {
    -[PKPassLibrary defaultPaymentPassesWithRemotePasses:](self, "defaultPaymentPassesWithRemotePasses:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    v24 = MEMORY[0x1E0C809B0];
    if (v23
      && (objc_msgSend(v22, "objectAtIndexedSubscript:", 0),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v25, "uniqueID"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v26,
          v25,
          v26))
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uniqueID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0;
      v21 = v37;
      v30 = v36;
      if (!v36)
        goto LABEL_21;
    }
    else
    {
      v21 = v37;
      v30 = v36;
      if ((v36 & 1) == 0)
      {
        objc_msgSend(v37, "countryCode");
        v42[0] = v24;
        v42[1] = 3221225472;
        v42[2] = __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_2;
        v42[3] = &unk_1E2AC44F0;
        v43 = (id)objc_claimAutoreleasedReturnValue();
        v31 = v43;
        objc_msgSend(v10, "pk_firstObjectPassingTest:", v42);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "uniqueID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = 0;
        goto LABEL_20;
      }
      v28 = 0;
    }
    +[PKPeerPaymentService sharedInstance](PKPeerPaymentService, "sharedInstance");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastUsedAlternateFundingSourcePassUniqueIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_4;
    v38[3] = &unk_1E2AC4518;
    v41 = v30;
    v39 = v29;
    v40 = v28;
    v33 = v28;
    v34 = v29;
    objc_msgSend(v10, "sortedArrayUsingComparator:", v38);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  v20 = (void *)objc_msgSend(v10, "copy");
  v21 = v37;
LABEL_22:

  return v20;
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "deviceInAppPaymentApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_3;
  v6[3] = &unk_1E2AC1030;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "pk_hasObjectPassingTest:", v6);

  return v4;
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isRequiredForMerchantInCountry:", *(_QWORD *)(a1 + 32));
}

uint64_t __79__PKPassLibrary__sortedPaymentPassesForPaymentRequest_additionalPaymentPasses___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v5, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      v10 = *(void **)(a1 + 32);
      objc_msgSend(v6, "uniqueID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v9 && !v12)
        goto LABEL_12;
      if ((v9 | v12 ^ 1) != 1)
        goto LABEL_15;
    }
    objc_msgSend(v5, "devicePrimaryInAppPaymentApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "paymentType");

    objc_msgSend(v6, "devicePrimaryInAppPaymentApplication");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "paymentType");

    if (v14 == 1 && v16 != 1)
      goto LABEL_12;
    if (v14 != 1 && v16 == 1)
    {
LABEL_15:
      v23 = 1;
      goto LABEL_16;
    }
  }
  v17 = *(void **)(a1 + 40);
  objc_msgSend(v5, "uniqueID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  v20 = *(void **)(a1 + 40);
  objc_msgSend(v6, "uniqueID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if (!v19 || v22)
  {
    if ((v19 | v22 ^ 1) == 1)
    {
      objc_msgSend(v5, "ingestedDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ingestedDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "compare:", v25);

      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_12:
  v23 = -1;
LABEL_16:

  return v23;
}

- (id)_defaultPaymentPassForPaymentRequest:(id)a3
{
  void *v3;
  void *v4;

  -[PKPassLibrary _sortedPaymentPassesForPaymentRequest:](self, "_sortedPaymentPassesForPaymentRequest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsSearchForPassUniqueID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PKPassLibrary_supportsSearchForPassUniqueID___block_invoke;
  v8[3] = &unk_1E2ABDD10;
  v8[4] = &v9;
  objc_msgSend(v5, "supportsSearchForPassUniqueID:completion:", v4, v8);
  v6 = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__PKPassLibrary_supportsSearchForPassUniqueID___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  SEL v16;

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke;
  v14[3] = &unk_1E2AC3090;
  v16 = a2;
  v9 = v7;
  v14[4] = self;
  v15 = v9;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke_180;
  v12[3] = &unk_1E2AC3558;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "pushProvisioningNoncesWithCredentialCount:completion:", a3, v12);

}

void __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v6);

}

uint64_t __70__PKPassLibrary_pushProvisioningNoncesWithCredentialCount_completion___block_invoke_180(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__PKPassLibrary_configurePushProvisioningConfiguration_completion___block_invoke;
  v8[3] = &unk_1E2AC4540;
  v9 = v6;
  v7 = v6;
  -[PKPassLibrary configurePushProvisioningConfigurationV2:completion:](self, "configurePushProvisioningConfigurationV2:completion:", a3, v8);

}

void __67__PKPassLibrary_configurePushProvisioningConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "shareablePassConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)configurePushProvisioningConfigurationV2:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  SEL v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke;
    v24[3] = &unk_1E2AC3090;
    v26 = a2;
    v11 = v8;
    v24[4] = self;
    v25 = v11;
    -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v7;
    else
      v13 = 0;
    v14 = v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_185;
      v22[3] = &unk_1E2AC4568;
      v22[4] = self;
      v23 = v11;
      objc_msgSend(v12, "usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion:", 0, v7, v22);
      v15 = v23;
    }
    else
    {
      PKLogFacilityTypeGetObject(0);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v17)
        {
          NSStringFromSelector(a2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v28 = v18;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "-[PKPassLibrary %@] falling back to usingSynchronousProxy:configurePushProvisioningConfiguration:completion: as v2 is not supported", buf, 0xCu);

        }
        v20[0] = v10;
        v20[1] = 3221225472;
        v20[2] = __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_186;
        v20[3] = &unk_1E2AC4590;
        v20[4] = self;
        v21 = v11;
        objc_msgSend(v12, "usingSynchronousProxy:configurePushProvisioningConfiguration:completion:", 0, v14, v20);
        v15 = v21;
      }
      else
      {
        if (v17)
        {
          NSStringFromSelector(a2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v28 = v19;
          v29 = 2112;
          v30 = v7;
          _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Non PKAddShareablePassConfiguration used with proxy that does not yet su"
            "pport usingSynchronousProxy:configurePushProvisioningConfigurationV2:completion: - %@",
            buf,
            0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v15);
      }
    }

  }
}

void __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v6);

}

uint64_t __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __69__PKPassLibrary_configurePushProvisioningConfigurationV2_completion___block_invoke_186(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
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
    v15[2] = __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke;
    v15[3] = &unk_1E2AC3090;
    v17 = a2;
    v10 = v7;
    v15[4] = self;
    v16 = v10;
    v11 = a3;
    -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_188;
    v13[3] = &unk_1E2ABE390;
    v14 = v10;
    objc_msgSend(v12, "startVehicleConnectionSessionWithPassUniqueIdentifier:completion:", v11, v13);

  }
}

void __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

void __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __82__PKPassLibrary_startVehicleConnectionSessionWithPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)sendRKEPassThroughMessage:(id)a3 forSessionIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__11;
    v22 = __Block_byref_object_dispose__11;
    v23 = 0;
    v13 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke;
    v17[3] = &unk_1E2AC3158;
    v17[4] = self;
    v17[5] = a2;
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke_189;
    v16[3] = &unk_1E2AC40E8;
    v16[4] = &v24;
    v16[5] = &v18;
    objc_msgSend(v14, "sendRKEPassThroughMessage:forSessionIdentifier:withCompletion:", v9, v11, v16);
    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
    v12 = *((_BYTE *)v25 + 24) != 0;

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }

  return v12;
}

void __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

void __70__PKPassLibrary_sendRKEPassThroughMessage_forSessionIdentifier_error___block_invoke_189(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)invalidateVehicleConnectionSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PKPassLibrary *v10;
  SEL v11;

  if (a3)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __62__PKPassLibrary_invalidateVehicleConnectionSessionIdentifier___block_invoke;
    v9 = &unk_1E2AC3158;
    v10 = self;
    v11 = a2;
    v4 = a3;
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateVehicleConnectionSessionIdentifier:", v4, v6, v7, v8, v9, v10, v11);

  }
}

void __62__PKPassLibrary_invalidateVehicleConnectionSessionIdentifier___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (id)backupMetadata
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD aBlock[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__11;
  v14 = __Block_byref_object_dispose__11;
  v3 = MEMORY[0x1E0C809B0];
  v15 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__PKPassLibrary_backupMetadata__block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a2;
  v4 = _Block_copy(aBlock);
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __31__PKPassLibrary_backupMetadata__block_invoke_190;
  v8[3] = &unk_1E2AC3D08;
  v8[4] = &v10;
  objc_msgSend(v5, "backupMetadataWithHandler:", v8);
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __31__PKPassLibrary_backupMetadata__block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

void __31__PKPassLibrary_backupMetadata__block_invoke_190(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)setBackupMetadata:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD aBlock[5];

  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__PKPassLibrary_setBackupMetadata___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a2;
  v5 = a3;
  v6 = _Block_copy(aBlock);
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __35__PKPassLibrary_setBackupMetadata___block_invoke_191;
  v8[3] = &unk_1E2ABE120;
  v8[4] = self;
  objc_msgSend(v7, "setBackupMetadata:handler:", v5, v8);

}

void __35__PKPassLibrary_setBackupMetadata___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (void)prepareForBackupRestoreWithExistingPreferencesData:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD aBlock[5];
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PKPassLibrary_prepareForBackupRestoreWithExistingPreferencesData___block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    aBlock[4] = a2;
    v7 = _Block_copy(aBlock);
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __68__PKPassLibrary_prepareForBackupRestoreWithExistingPreferencesData___block_invoke_192;
    v9[3] = &unk_1E2ABE120;
    v9[4] = self;
    objc_msgSend(v8, "prepareForBackupRestoreWithExistingPreferencesData:handler:", v5, v9);

  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithExistingPreferencesData - Error: No plist data passed in.", buf, 2u);
    }
  }

}

void __68__PKPassLibrary_prepareForBackupRestoreWithExistingPreferencesData___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (void)prepareForBackupRestoreWithSafeHavenPath:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  unint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *oslog;
  void *v33;
  PKPassLibrary *v34;
  id obj;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD aBlock[5];
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v5;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithSafeHavenPath - Starting prepare for backup restore with safe haven path: %@", buf, 0xCu);
  }

  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithSafeHavenPath - Error: No path passed in.", buf, 2u);
    }
    v8 = v6;
    goto LABEL_30;
  }
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKPassLibrary_prepareForBackupRestoreWithSafeHavenPath___block_invoke;
  aBlock[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  aBlock[4] = a2;
  v8 = _Block_copy(aBlock);
  PKRequiredPaymentSetupFileURLs();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (!v10)
    goto LABEL_27;
  v11 = v10;
  v36 = *(_QWORD *)v41;
  v12 = 0x1E0CB3000uLL;
  oslog = v6;
  v33 = v8;
  v34 = self;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v41 != v36)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "path", oslog);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v5;
      objc_msgSend(v5, "stringByAppendingPathComponent:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v12 + 1568), "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByDeletingLastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      v19 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v39);
      v20 = v39;

      if (!v19)
      {
        v6 = oslog;
        v26 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        v27 = oslog;
        v5 = v15;
        if (v26)
        {
          objc_msgSend(v20, "description");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v28;
          v29 = "Unable to create parent directories within safe haven: %{public}@";
LABEL_22:
          _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

          v27 = v6;
        }
LABEL_26:

        v8 = v33;
        self = v34;
        v7 = MEMORY[0x1E0C809B0];
        goto LABEL_27;
      }
      v21 = v12;
      objc_msgSend(*(id *)(v12 + 1568), "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "createFileAtPath:contents:attributes:", v16, 0, 0);

      if (!v23)
      {
        v6 = oslog;
        v30 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        v27 = oslog;
        v5 = v15;
        if (v30)
        {
          objc_msgSend(v20, "description");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v47 = v28;
          v29 = "Failed to create file in safe haven: %{public}@";
          goto LABEL_22;
        }
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingAtPath:", v16);
      v24 = objc_claimAutoreleasedReturnValue();
      v5 = v15;
      if (!v24)
      {
        v6 = oslog;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v16;
          _os_log_impl(&dword_18FC92000, oslog, OS_LOG_TYPE_DEFAULT, "Failed to create file handle for path: %{public}@", buf, 0xCu);
        }

        v27 = 0;
        goto LABEL_26;
      }
      v25 = (void *)v24;
      objc_msgSend(v37, "addObject:", v24);

      v12 = v21;
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    v6 = oslog;
    v8 = v33;
    self = v34;
    v7 = MEMORY[0x1E0C809B0];
    if (v11)
      continue;
    break;
  }
LABEL_27:

  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __58__PKPassLibrary_prepareForBackupRestoreWithSafeHavenPath___block_invoke_195;
  v38[3] = &unk_1E2ABE120;
  v38[4] = self;
  objc_msgSend(v31, "prepareForBackupRestoreWithRequiredFileURLs:destinationFileHandles:handler:", obj, v37, v38);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "prepareForBackupRestoreWithSafeHavenPath - Finished preparation for backup restore.", buf, 2u);
  }

LABEL_30:
}

void __58__PKPassLibrary_prepareForBackupRestoreWithSafeHavenPath___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (int64_t)_currentNotificationCountForIdentifier:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  __CFString *v5;
  void *v6;
  int64_t v7;

  if (!a3)
    return 0;
  v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v5 = (__CFString *)a3;
  CFPreferencesSynchronize(CFSTR("com.apple.PassKit.mapsNotifications"), v3, v4);
  v6 = (void *)CFPreferencesCopyValue(v5, CFSTR("com.apple.PassKit.mapsNotifications"), v3, v4);

  v7 = objc_msgSend(v6, "integerValue");
  return v7;
}

- (void)createFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 challenge:(id)a5 externalizedAuth:(id)a6 completion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  PKLogFacilityTypeGetObject(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "PKPassLibrary creating FIDO key", buf, 2u);
  }

  v19 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke;
  v25[3] = &unk_1E2AC3090;
  v27 = a2;
  v20 = v17;
  v25[4] = self;
  v26 = v20;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke_196;
  v23[3] = &unk_1E2AC45B8;
  v23[4] = self;
  v24 = v20;
  v22 = v20;
  objc_msgSend(v21, "usingSynchronousProxy:createFidoKeyForRelyingParty:relyingPartyAccountHash:challenge:externalizedAuth:completion:", 0, v13, v14, v15, v16, v23);

}

void __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, 0, v3);

}

uint64_t __108__PKPassLibrary_createFidoKeyForRelyingParty_relyingPartyAccountHash_challenge_externalizedAuth_completion___block_invoke_196(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)checkFidoKeyPresenceForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 completion:(id)a6
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
  v21[2] = __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke;
  v21[3] = &unk_1E2AC3090;
  v23 = a2;
  v13 = v11;
  v21[4] = self;
  v22 = v13;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke_198;
  v19[3] = &unk_1E2ABDDB0;
  v19[4] = self;
  v20 = v13;
  v18 = v13;
  objc_msgSend(v17, "usingSynchronousProxy:checkFidoKeyPresenceForRelyingParty:relyingPartyAccountHash:fidoKeyHash:completion:", 0, v16, v15, v14, v19);

}

void __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __100__PKPassLibrary_checkFidoKeyPresenceForRelyingParty_relyingPartyAccountHash_fidoKeyHash_completion___block_invoke_198(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)signWithFidoKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 challenge:(id)a6 publicKeyIdentifier:(id)a7 externalizedAuth:(id)a8 completion:(id)a9
{
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  SEL v32;

  v17 = a9;
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke;
  v30[3] = &unk_1E2AC3090;
  v32 = a2;
  v19 = v17;
  v30[4] = self;
  v31 = v19;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke_199;
  v28[3] = &unk_1E2AC45E0;
  v28[4] = self;
  v29 = v19;
  v27 = v19;
  objc_msgSend(v26, "usingSynchronousProxy:signWithFidoKeyForRelyingParty:relyingPartyAccountHash:fidoKeyHash:challenge:publicKeyIdentifier:externalizedAuth:completion:", 0, v25, v24, v23, v22, v21, v20, v28);

}

void __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __142__PKPassLibrary_signWithFidoKeyForRelyingParty_relyingPartyAccountHash_fidoKeyHash_challenge_publicKeyIdentifier_externalizedAuth_completion___block_invoke_199(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
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
  v15[2] = __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v15[3] = &unk_1E2AC3090;
  v17 = a2;
  v9 = v7;
  v15[4] = self;
  v16 = v9;
  v10 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_201;
  v13[3] = &unk_1E2AC45E0;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "usingSynchronousProxy:generateSEEncryptionCertificateForSubCredentialId:completion:", 0, v10, v13);

}

void __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __78__PKPassLibrary_generateSEEncryptionCertificateForSubCredentialId_completion___block_invoke_201(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)generateISOEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
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
  v15[2] = __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke;
  v15[3] = &unk_1E2AC3090;
  v17 = a2;
  v9 = v7;
  v15[4] = self;
  v16 = v9;
  v10 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke_202;
  v13[3] = &unk_1E2AC4608;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "usingSynchronousProxy:generateISOEncryptionCertificateForSubCredentialId:completion:", 0, v10, v13);

}

void __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, v3);

}

uint64_t __79__PKPassLibrary_generateISOEncryptionCertificateForSubCredentialId_completion___block_invoke_202(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PKPassLibrary *v10;
  SEL v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __53__PKPassLibrary_deleteKeyMaterialForSubCredentialId___block_invoke;
  v9 = &unk_1E2AC3158;
  v10 = self;
  v11 = a2;
  v4 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteKeyMaterialForSubCredentialId:", v4, v6, v7, v8, v9, v10, v11);

}

void __53__PKPassLibrary_deleteKeyMaterialForSubCredentialId___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (void)addISO18013Blobs:(id)a3 cardType:(int64_t)a4 completion:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke;
  v17[3] = &unk_1E2AC3090;
  v19 = a2;
  v11 = v9;
  v17[4] = self;
  v18 = v11;
  v12 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke_204;
  v15[3] = &unk_1E2ABDD88;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "usingSynchronousProxy:addISO18013Blobs:cardType:completion:", 0, v12, a4, v15);

}

void __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __54__PKPassLibrary_addISO18013Blobs_cardType_completion___block_invoke_204(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)longTermPrivacyKeyForCredentialGroupIdentifier:(id)a3 reuseExisting:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke;
  v17[3] = &unk_1E2AC3090;
  v19 = a2;
  v11 = v9;
  v17[4] = self;
  v18 = v11;
  v12 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke_205;
  v15[3] = &unk_1E2AC45E0;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "usingSynchronousProxy:longTermPrivacyKeyForCredentialGroupIdentifier:reuseExisting:completion:", 0, v12, v5, v15);

}

void __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __89__PKPassLibrary_longTermPrivacyKeyForCredentialGroupIdentifier_reuseExisting_completion___block_invoke_205(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)generateAuxiliaryCapabilitiesForRequirements:(id)a3 completion:(id)a4
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
  v15[2] = __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke;
  v15[3] = &unk_1E2AC3090;
  v17 = a2;
  v9 = v7;
  v15[4] = self;
  v16 = v9;
  v10 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke_206;
  v13[3] = &unk_1E2AC4630;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "usingSynchronousProxy:generateAuxiliaryCapabilitiesForRequirements:completion:", 0, v10, v13);

}

void __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __73__PKPassLibrary_generateAuxiliaryCapabilitiesForRequirements_completion___block_invoke_206(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentIssuerBindingFlowForIssuerData:(id)a3 signature:(id)a4 orientation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  PKPassLibrary *v16;
  SEL v17;

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __77__PKPassLibrary_presentIssuerBindingFlowForIssuerData_signature_orientation___block_invoke;
  v15 = &unk_1E2AC3158;
  v16 = self;
  v17 = a2;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentIssuerBindingFlowForIssuerData:signature:orientation:", v10, v9, v8, v12, v13, v14, v15, v16, v17);

}

void __77__PKPassLibrary_presentIssuerBindingFlowForIssuerData_signature_orientation___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (void)requestIssuerBoundPassesWithBindingWithData:(id)a3 automaticallyProvision:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;

  v5 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke;
  v17[3] = &unk_1E2AC3090;
  v19 = a2;
  v11 = v9;
  v17[4] = self;
  v18 = v11;
  v12 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke_208;
  v15[3] = &unk_1E2AC3558;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "usingSynchronousProxy:requestIssuerBoundPassesWithBindingWithData:automaticallyProvision:withCompletion:", 0, v12, v5, v15);

}

void __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v3);

}

uint64_t __99__PKPassLibrary_requestIssuerBoundPassesWithBindingWithData_automaticallyProvision_withCompletion___block_invoke_208(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)signData:(id)a3 signatureEntanglementMode:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;

  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E2AC3090;
  v19 = a2;
  v11 = v9;
  v17[4] = self;
  v18 = v11;
  v12 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_209;
  v15[3] = &unk_1E2AC4658;
  v15[4] = self;
  v16 = v11;
  v14 = v11;
  objc_msgSend(v13, "signData:signatureEntanglementMode:withCompletionHandler:", v12, a4, v15);

}

void __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v6 + 16))(v6, 0, 0, v3);

}

uint64_t __74__PKPassLibrary_signData_signatureEntanglementMode_withCompletionHandler___block_invoke_209(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isPaymentPassActivationAvailable
{
  void *v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PKPassLibrary_isPaymentPassActivationAvailable__block_invoke;
  v6[3] = &unk_1E2ABDD10;
  v6[4] = &v7;
  objc_msgSend(v3, "isPaymentPassActivationAvailableWithHandler:", v6);
  if (*((_BYTE *)v8 + 24))
  {
    v4 = 1;
  }
  else if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
  {
    v4 = -[PKPassLibrary isPaymentPassActivationAvailable](self->_remoteLibrary, "isPaymentPassActivationAvailable");
  }
  else
  {
    v4 = 0;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __49__PKPassLibrary_isPaymentPassActivationAvailable__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)_hasRemoteLibrary
{
  PKPassLibrary *remoteLibrary;
  NSObject *v4;
  void *v5;
  BOOL v6;
  const __CFString *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  remoteLibrary = self->_remoteLibrary;
  v13 = remoteLibrary != 0;
  if (remoteLibrary)
  {
    PKLogFacilityTypeGetObject(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "PKPassLibrary: checking remote library...", buf, 2u);
    }

    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__PKPassLibrary__hasRemoteLibrary__block_invoke;
    v9[3] = &unk_1E2ABDD10;
    v9[4] = &v10;
    objc_msgSend(v5, "hasRemoteLibraryWithHandler:", v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (*((_BYTE *)v11 + 24))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "PKPassLibrary: has remote library: %{public}@.", buf, 0xCu);
    }

    v6 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __34__PKPassLibrary__hasRemoteLibrary__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)_remoteLibrary
{
  PKPassLibrary *remoteLibrary;

  if (-[PKPassLibrary _hasRemoteLibrary](self, "_hasRemoteLibrary"))
    remoteLibrary = self->_remoteLibrary;
  else
    remoteLibrary = 0;
  return remoteLibrary;
}

- (BOOL)migrateDataWithDidRestoreFromBackup:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  BOOL v7;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = CFSTR("NO");
    if (v3)
      v9 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "PKPassLibrary: requesting passd data migration (didRestoreFromBackup: %@)...", buf, 0xCu);
  }

  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PKPassLibrary_migrateDataWithDidRestoreFromBackup___block_invoke;
  v11[3] = &unk_1E2ABDD10;
  v11[4] = &v12;
  objc_msgSend(v6, "migrateDataWithHandler:didRestoreFromBackup:", v11, v3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (*((_BYTE *)v13 + 24))
      v10 = CFSTR("success");
    else
      v10 = CFSTR("failure");
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "PKPassLibrary: passd migration state: %{public}@.", buf, 0xCu);
  }

  v7 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __53__PKPassLibrary_migrateDataWithDidRestoreFromBackup___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)sendUserEditedCatalog:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPassLibrary _remoteObjectProxy](self, "_remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendUserEditedCatalog:", v4);

}

- (void)notifyPassUsedWithIdentifier:(id)a3 fromSource:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyPassUsedWithIdentifier:fromSource:", v6, a4);

}

- (void)issueWalletUserNotificationWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5 customActionRoute:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "issueWalletUserNotificationWithTitle:message:forPassUniqueIdentifier:customActionRoute:", v13, v12, v11, v10);

}

- (void)pendingUserNotificationsWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E2ABDA18;
    v9 = v6;
    aBlock[4] = self;
    v16 = v9;
    v10 = a3;
    v11 = _Block_copy(aBlock);
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_3;
    v13[3] = &unk_1E2ABE008;
    v13[4] = self;
    v14 = v9;
    objc_msgSend(v12, "pendingUserNotificationsWithIdentifier:completion:", v10, v13);

  }
}

void __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke(uint64_t a1)
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
  v6[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
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
  v10[2] = __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_4;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __67__PKPassLibrary_pendingUserNotificationsWithIdentifier_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)updateDate:(id)a3 forPendingNotificationWithIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateDate:forPendingNotificationWithIdentifier:", v7, v6);

}

- (void)removeAllScheduledActivities
{
  id v2;

  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllScheduledActivities");

}

- (void)introduceDatabaseIntegrityProblem
{
  id v2;

  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "introduceDatabaseIntegrityProblem");

}

- (void)forceImmediateRevocationCheck
{
  id v2;

  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceImmediateRevocationCheck");

}

- (void)spotlightReindexAllContentWithAcknowledgement:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke;
  aBlock[3] = &unk_1E2ABDA18;
  v6 = v4;
  aBlock[4] = self;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_3;
  v10[3] = &unk_1E2ABDA18;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "spotlightReindexAllContentWithAcknowledgement:", v10);

}

void __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke(uint64_t a1)
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
  v6[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_3(uint64_t a1)
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
  v6[2] = __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_4;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __63__PKPassLibrary_spotlightReindexAllContentWithAcknowledgement___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spotlightReindexContentWithIdentifiers:(id)a3 acknowledgement:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke;
  aBlock[3] = &unk_1E2ABDA18;
  v8 = v6;
  aBlock[4] = self;
  v16 = v8;
  v9 = a3;
  v10 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_3;
  v13[3] = &unk_1E2ABDA18;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "spotlightReindexContentWithIdentifiers:acknowledgement:", v9, v13);

}

void __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke(uint64_t a1)
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
  v6[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_3(uint64_t a1)
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
  v6[2] = __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_4;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __72__PKPassLibrary_spotlightReindexContentWithIdentifiers_acknowledgement___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spotlightResetWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDA18;
  v6 = v4;
  aBlock[4] = self;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDA18;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "spotlightResetWithCompletion:", v10);

}

void __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke(uint64_t a1)
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
  v6[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_3(uint64_t a1)
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
  v6[2] = __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_4;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __46__PKPassLibrary_spotlightResetWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spotlightStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke;
  aBlock[3] = &unk_1E2ABDA18;
  v6 = v4;
  aBlock[4] = self;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_3;
  v10[3] = &unk_1E2ABDFE0;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "spotlightStatusWithCompletion:", v10);

}

void __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke(uint64_t a1)
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
  v6[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_2;
  v6[3] = &unk_1E2ABDA18;
  v4 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v6;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v9 = v5;
  dispatch_async(v2, block);

}

uint64_t __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
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
  v10[2] = __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_4;
  v10[3] = &unk_1E2ABDA68;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v12 = v7;
  v13 = v6;
  v8 = v10;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_3;
  block[3] = &unk_1E2ABD9A0;
  v15 = v8;
  v9 = v3;
  dispatch_async(v4, block);

}

uint64_t __47__PKPassLibrary_spotlightStatusWithCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)removePassWithUniqueID:(id)a3 diagnosticReason:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__PKPassLibrary_removePassWithUniqueID_diagnosticReason___block_invoke;
    v15[3] = &unk_1E2AC3158;
    v15[4] = self;
    v15[5] = a2;
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = PKGetMyPid();
      PKProcessNameForPid(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Call from %@"), v13);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __57__PKPassLibrary_removePassWithUniqueID_diagnosticReason___block_invoke_222;
    v14[3] = &unk_1E2ABE120;
    v14[4] = self;
    objc_msgSend(v10, "removePassWithUniqueID:diagnosticReason:handler:", v7, v8, v14);

  }
}

void __57__PKPassLibrary_removePassWithUniqueID_diagnosticReason___block_invoke(uint64_t a1)
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
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

- (void)removePassesWithUniqueIDs:(id)a3 diagnosticReason:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__PKPassLibrary_removePassesWithUniqueIDs_diagnosticReason___block_invoke;
    v15[3] = &unk_1E2AC3158;
    v15[4] = self;
    v15[5] = a2;
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = PKGetMyPid();
      PKProcessNameForPid(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Call from %@"), v13);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __60__PKPassLibrary_removePassesWithUniqueIDs_diagnosticReason___block_invoke_223;
    v14[3] = &unk_1E2ABE120;
    v14[4] = self;
    objc_msgSend(v10, "removePassesWithUniqueIDs:diagnosticReason:handler:", v7, v8, v14);

  }
}

void __60__PKPassLibrary_removePassesWithUniqueIDs_diagnosticReason___block_invoke(uint64_t a1)
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
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

- (void)recoverPassWithUniqueID:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[6];

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__PKPassLibrary_recoverPassWithUniqueID___block_invoke;
    v10[3] = &unk_1E2AC3158;
    v10[4] = self;
    v10[5] = a2;
    -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __41__PKPassLibrary_recoverPassWithUniqueID___block_invoke_224;
    v9[3] = &unk_1E2ABE120;
    v9[4] = self;
    objc_msgSend(v8, "recoverPassWithUniqueID:handler:", v6, v9);

  }
}

void __41__PKPassLibrary_recoverPassWithUniqueID___block_invoke(uint64_t a1)
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
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@];", (uint8_t *)&v4, 0xCu);

  }
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PKPassLibrary_removePassesOfType_withDiagnosticReason___block_invoke;
  v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v14[4] = a2;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = PKGetMyPid();
    PKProcessNameForPid(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Call from %@"), v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __57__PKPassLibrary_removePassesOfType_withDiagnosticReason___block_invoke_225;
  v13[3] = &unk_1E2ABE120;
  v13[4] = self;
  objc_msgSend(v9, "removePassesOfType:withDiagnosticReason:handler:", a3, v7, v13);

}

void __57__PKPassLibrary_removePassesOfType_withDiagnosticReason___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 32);
    v6 = a2;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;

  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke;
  v20[3] = &unk_1E2AC3090;
  v22 = a2;
  v12 = v10;
  v20[4] = self;
  v21 = v12;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = PKGetMyPid();
    PKProcessNameForPid(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Call from %@"), v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke_226;
  v18[3] = &unk_1E2ABDA18;
  v18[4] = self;
  v19 = v12;
  v17 = v12;
  objc_msgSend(v13, "removePassesOfType:withDiagnosticReason:handler:", a3, v9, v18);

}

void __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v7,
      0x16u);

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);

}

uint64_t __68__PKPassLibrary_removePassesOfType_withDiagnosticReason_completion___block_invoke_226(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (unint64_t)estimatedTimeToResetApplePay
{
  return 60 * -[PKPassLibrary countPassesOfType:](self, "countPassesOfType:", 1);
}

- (void)resetApplePayWithDiagnosticReason:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  _QWORD v20[6];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PKLogFacilityTypeGetObject(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "XPC about to start in -[PKPassLibrary %@];", buf, 0xCu);

  }
  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke;
  v20[3] = &unk_1E2AC3158;
  v20[4] = self;
  v20[5] = a2;
  -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = PKGetMyPid();
    PKProcessNameForPid(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Call from %@"), v15);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke_227;
  v17[3] = &unk_1E2AC4680;
  v18 = v8;
  v19 = a2;
  v17[4] = self;
  v16 = v8;
  objc_msgSend(v12, "resetApplePayWithDiagnosticReason:handler:", v7, v17);

}

void __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

uint64_t __62__PKPassLibrary_resetApplePayWithDiagnosticReason_completion___block_invoke_227(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v5;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC finished in -[PKPassLibrary %@]; successful:%d",
      (uint8_t *)&v7,
      0x12u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (BOOL)resetApplePayWithDiagnosticReason:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  _QWORD v15[7];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  PKLogFacilityTypeGetObject(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "XPC about to start in -[PKPassLibrary %@];", buf, 0xCu);

  }
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke;
  v16[3] = &unk_1E2AC3158;
  v16[4] = self;
  v16[5] = a2;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = PKGetMyPid();
    PKProcessNameForPid(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Call from %@"), v12);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke_228;
  v15[3] = &unk_1E2AC46A8;
  v15[5] = &v17;
  v15[6] = a2;
  v15[4] = self;
  objc_msgSend(v9, "resetApplePayWithDiagnosticReason:handler:", v5, v15);
  v13 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v13;
}

void __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke(uint64_t a1, void *a2)
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
  PKLogFacilityTypeGetObject(0);
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
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKPassLibrary %@]; Error: %@",
      (uint8_t *)&v8,
      0x16u);

  }
}

void __51__PKPassLibrary_resetApplePayWithDiagnosticReason___block_invoke_228(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "XPC finished in -[PKPassLibrary %@]; successful:%d",
      (uint8_t *)&v6,
      0x12u);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (void)shuffleGroups:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shuffleGroups:", v3);

}

- (void)noteAppleAccountChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteAppleAccountChanged:handler:", v4, &__block_literal_global_229);

}

- (void)noteACAccountChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteACAccountChanged:handler:", v4, &__block_literal_global_230);

}

- (id)diffForPassUpdateUserNotificationWithIdentifier:(id)a3
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
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = 0;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PKPassLibrary_diffForPassUpdateUserNotificationWithIdentifier___block_invoke;
  v8[3] = &unk_1E2AC46D0;
  v8[4] = &v9;
  objc_msgSend(v5, "getDiffForPassUpdateUserNotificationWithIdentifier:handler:", v4, v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __65__PKPassLibrary_diffForPassUpdateUserNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)isWatchIssuerAppProvisioningSupported
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKPassLibrary_isWatchIssuerAppProvisioningSupported__block_invoke;
  v5[3] = &unk_1E2ABDD10;
  v5[4] = &v6;
  objc_msgSend(v2, "isWatchIssuerAppProvisioningSupportedWithHandler:", v5);
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__PKPassLibrary_isWatchIssuerAppProvisioningSupported__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)catalogChanged:(id)a3 withNewPasses:(id)a4
{
  -[PKPassLibrary catalogChanged:withNewPasses:states:](self, "catalogChanged:withNewPasses:states:", a3, a4, 0);
}

- (void)catalogChanged:(id)a3 withNewPasses:(id)a4 states:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16 = a5;
  -[PKPassLibrary _applyDataAccessorToObjects:](self, "_applyDataAccessorToObjects:", v9);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKPassLibrary delegates](self, "delegates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 = (void *)objc_msgSend(v8, "copy");
          objc_msgSend(v14, "passLibrary:receivedUpdatedCatalog:passes:states:", self, v15, v9, v16);
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_11;
          v15 = (void *)objc_msgSend(v8, "copy");
          objc_msgSend(v14, "passLibrary:receivedUpdatedCatalog:passes:", self, v15, v9);
        }

LABEL_11:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (void)passAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPassLibrary _applyDataAccessorToObject:](self, "_applyDataAccessorToObject:", v4);
  v7 = v4;
  v8 = CFSTR("PKPassLibraryAddedPassesUserInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassLibrary _postLibraryChangeWithUserInfo:](self, "_postLibraryChangeWithUserInfo:", v6);
}

- (void)passUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPassLibrary _applyDataAccessorToObject:](self, "_applyDataAccessorToObject:", v4);
  v7 = v4;
  v8 = CFSTR("PKPassLibraryReplacementPassesUserInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassLibrary _postLibraryChangeWithUserInfo:](self, "_postLibraryChangeWithUserInfo:", v6);
}

- (void)passRecovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPassLibrary _applyDataAccessorToObject:](self, "_applyDataAccessorToObject:", v4);
  v7 = v4;
  v8 = CFSTR("PKPassLibraryRecoveredPassesUserInfoKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPassLibrary _postLibraryChangeWithUserInfo:](self, "_postLibraryChangeWithUserInfo:", v6);
}

- (void)passRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("PKPassLibraryPassTypeIdentifierUserInfo");
  v4 = a3;
  objc_msgSend(v4, "passTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("PKPassLibrarySerialNumberUserInfo");
  v14[0] = v5;
  objc_msgSend(v4, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  v11 = CFSTR("PKPassLibraryRemovedPassInfosUserInfo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPassLibrary _postLibraryChangeWithUserInfo:](self, "_postLibraryChangeWithUserInfo:", v9);

}

- (void)contactlessInterfaceDidPresentFromSource:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKPassLibrary delegates](self, "delegates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "contactlessInterfaceDidPresentFromSource:", a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKPassLibrary delegates](self, "delegates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "contactlessInterfaceDidDismissFromSource:", a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)vehicleConnectionDidUpdateConnectionState:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PKPassLibrary delegates](self, "delegates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "vehicleConnectionDidUpdateConnectionState:", a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)vehicleConnectionDidRecievePassthroughData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPassLibrary delegates](self, "delegates", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "vehicleConnectionDidRecievePassthroughData:", v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)issuerBindingAuthenticationOccured
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PKPassLibrary delegates](self, "delegates", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "issuerBindingAuthenticationOccured");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_postLibraryChangeWithUserInfo:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("PKPassLibraryDidChangeNotification"), self, v5);

}

- (id)_copyPassesWithRetries:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  v22 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__PKPassLibrary__copyPassesWithRetries___block_invoke;
  v16[3] = &unk_1E2AC41B0;
  v16[4] = &v23;
  v16[5] = &v17;
  -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __40__PKPassLibrary__copyPassesWithRetries___block_invoke_2;
  v15[3] = &unk_1E2AC46F8;
  v15[4] = self;
  v15[5] = &v27;
  objc_msgSend(v6, "getPassesWithHandler:", v15);
  if (*((_BYTE *)v24 + 24))
  {
    PKLogFacilityTypeGetObject(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (a3)
    {
      if (v8)
      {
        objc_msgSend((id)v18[5], "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v34 = a3;
        v35 = 2114;
        v36 = v13;
        _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Error retrieving passes (%lu retries remaining): %{public}@", buf, 0x16u);

      }
      v9 = -[PKPassLibrary _copyPassesWithRetries:](self, "_copyPassesWithRetries:", a3 - 1);
      v7 = v28[5];
      v28[5] = (uint64_t)v9;
    }
    else if (v8)
    {
      objc_msgSend((id)v18[5], "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = (unint64_t)v14;
      _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Error retrieving passes (giving up): %{public}@", buf, 0xCu);

    }
  }
  v10 = (void *)v28[5];
  if (!v10)
    v10 = (void *)MEMORY[0x1E0C9AA60];
  v11 = v10;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __40__PKPassLibrary__copyPassesWithRetries___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

uint64_t __40__PKPassLibrary__copyPassesWithRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __47__PKPassLibrary__copyPassesOfType_withRetries___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (id)_copyPassesOfStyles:(unint64_t)a3 withRetries:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__11;
  v33 = __Block_byref_object_dispose__11;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke;
  v18[3] = &unk_1E2AC41B0;
  v18[4] = &v25;
  v18[5] = &v19;
  -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke_2;
  v17[3] = &unk_1E2AC46F8;
  v17[4] = self;
  v17[5] = &v29;
  objc_msgSend(v8, "usingSynchronousProxy:getPassesOfStyles:handler:", 1, a3, v17);
  if (*((_BYTE *)v26 + 24))
  {
    PKLogFacilityTypeGetObject(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10)
      {
        objc_msgSend((id)v20[5], "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v36 = a4;
        v37 = 2114;
        v38 = v15;
        _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Error retrieving passes (%lu retries remaining): %{public}@", buf, 0x16u);

      }
      v11 = -[PKPassLibrary _copyPassesOfStyles:withRetries:](self, "_copyPassesOfStyles:withRetries:", a3, a4 - 1);
      v9 = v30[5];
      v30[5] = (uint64_t)v11;
    }
    else if (v10)
    {
      objc_msgSend((id)v20[5], "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = (unint64_t)v16;
      _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Error retrieving passes (giving up): %{public}@", buf, 0xCu);

    }
  }
  v12 = (void *)v30[5];
  if (!v12)
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

uint64_t __49__PKPassLibrary__copyPassesOfStyles_withRetries___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_applyDataAccessorToObjects:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_getPassesAndCatalogOfPassTypes:(unint64_t)a3 synchronously:(BOOL)a4 limitResults:(BOOL)a5 withRetries:(unint64_t)a6 handler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD aBlock[5];
  id v22;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;
  BOOL v26;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = v12;
  if (v12)
  {
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke;
    aBlock[3] = &unk_1E2AC4748;
    v23 = a6;
    v24 = a3;
    aBlock[4] = self;
    v25 = v9;
    v26 = v8;
    v15 = v12;
    v22 = v15;
    v16 = _Block_copy(aBlock);
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_248;
    v19[3] = &unk_1E2AC4770;
    v19[4] = self;
    v20 = v15;
    v17 = _Block_copy(v19);
    if (-[PKPassLibrary _hasInterfaceOfType:](self, "_hasInterfaceOfType:", 2))
    {
      if (v9)
        -[PKPassLibrary _synchronousExtendedRemoteObjectProxyWithErrorHandler:](self, "_synchronousExtendedRemoteObjectProxyWithErrorHandler:", v16);
      else
        -[PKPassLibrary _extendedRemoteObjectProxyWithErrorHandler:](self, "_extendedRemoteObjectProxyWithErrorHandler:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "usingSynchronousProxy:getPassesAndCatalogOfPassTypes:limitResults:withHandler:", v9, a3, v8, v17);
    }
    else
    {
      if (v9)
        -[PKPassLibrary _synchronousRemoteObjectProxyWithErrorHandler:](self, "_synchronousRemoteObjectProxyWithErrorHandler:", v16);
      else
        -[PKPassLibrary _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getPassesAndCatalogOfPassTypes:limitResults:withHandler:", a3, v8, v17);
    }

  }
}

void __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke(int8x16_t *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];
  id v16;
  int8x16_t v17;
  __int16 v18;
  _BYTE block[24];
  void *v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[3].i64[0];
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v3, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)block = 134218242;
      *(_QWORD *)&block[4] = v4;
      *(_WORD *)&block[12] = 2114;
      *(_QWORD *)&block[14] = v13;
      _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes and catalog (%lu retries remaining): %{public}@", block, 0x16u);

    }
    v7 = MEMORY[0x1E0C809B0];
    aBlock[2] = __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_247;
    aBlock[3] = &unk_1E2AC4720;
    v8 = (void *)a1[2].i64[1];
    aBlock[4] = a1[2].i64[0];
    v18 = a1[4].i16[0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    v17 = vextq_s8(a1[3], a1[3], 8uLL);
    v16 = v8;
    v9 = _Block_copy(aBlock);
    v10 = v9;
    if (a1[4].i8[0])
    {
      (*((void (**)(void *))v9 + 2))(v9);
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v10;
      *(_QWORD *)block = v7;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __dispatch_async_ar_block_invoke_3;
      v20 = &unk_1E2ABD9A0;
      v21 = v12;
      dispatch_async(v11, block);

    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v3, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)block = 138543362;
      *(_QWORD *)&block[4] = v14;
      _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes and catalog (giving up): %{public}@", block, 0xCu);

    }
    (*(void (**)(void))(a1[2].i64[1] + 16))();
  }

}

uint64_t __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_247(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getPassesAndCatalogOfPassTypes:synchronously:limitResults:withRetries:handler:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 40));
}

void __96__PKPassLibrary__getPassesAndCatalogOfPassTypes_synchronously_limitResults_withRetries_handler___block_invoke_248(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_applyDataAccessorToObjects:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  _BYTE block[24];
  void *v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 56);
  PKLogFacilityTypeGetObject(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v3, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)block = 134218242;
      *(_QWORD *)&block[4] = v4;
      *(_WORD *)&block[12] = 2114;
      *(_QWORD *)&block[14] = v16;
      _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes with annotations and catalog (%lu retries remaining): %{public}@", block, 0x16u);

    }
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_250;
    aBlock[3] = &unk_1E2AC4798;
    v8 = *(void **)(a1 + 40);
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v9 = v8;
    v22 = *(_BYTE *)(a1 + 64);
    v11 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v19 = v9;
    v21 = v10;
    v20 = v11;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (*(_BYTE *)(a1 + 64))
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v13;
      *(_QWORD *)block = v7;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __dispatch_async_ar_block_invoke_3;
      v24 = &unk_1E2ABD9A0;
      v25 = v15;
      dispatch_async(v14, block);

    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v3, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)block = 138543362;
      *(_QWORD *)&block[4] = v17;
      _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Error retrieving passes with annotations and catalog (giving up): %{public}@", block, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_250(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getGroupsControllerSnapshotWithOptions:synchronously:retries:handler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56) - 1, *(_QWORD *)(a1 + 48));
}

void __87__PKPassLibrary__getGroupsControllerSnapshotWithOptions_synchronously_retries_handler___block_invoke_251(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "passes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_applyDataAccessorToObjects:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)recomputeRelevantPassesWithSearchMode:(int64_t)a3
{
  id v4;

  -[PKPassLibrary _extendedRemoteObjectProxy](self, "_extendedRemoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recomputeRelevantPassesWithSearchMode:", a3);

}

- (void)fetchHasCandidatePasses:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__PKPassLibrary_fetchHasCandidatePasses___block_invoke;
    v8[3] = &unk_1E2ABD9A0;
    v6 = v4;
    v9 = v6;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchHasCandidatePasses:", v6);

  }
}

uint64_t __41__PKPassLibrary_fetchHasCandidatePasses___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentRelevantPassInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__PKPassLibrary_fetchCurrentRelevantPassInfo___block_invoke;
    v8[3] = &unk_1E2ABD9A0;
    v6 = v4;
    v9 = v6;
    -[PKPassLibrary _extendedRemoteObjectProxyWithFailureHandler:](self, "_extendedRemoteObjectProxyWithFailureHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchCurrentRelevantPassInfo:", v6);

  }
}

uint64_t __46__PKPassLibrary_fetchCurrentRelevantPassInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (BOOL)contactlessInterfaceCanBePresentedFromSource:(int64_t)a3
{
  uint64_t BoolForKey;
  _BOOL8 v5;
  _BOOL8 v6;
  int v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (PKNearFieldRadioIsAvailable())
  {
    BoolForKey = PKSharedCacheGetBoolForKey(CFSTR("ContactlessPassesAvailable"));
    v5 = BoolForKey;
    if (!a3 && (_DWORD)BoolForKey)
    {
      v6 = 1;
      v5 = PKDoubleClickAllowed();
      goto LABEL_13;
    }
  }
  else
  {
    v5 = 0;
  }
  if (a3 == 2)
  {
    v7 = _os_feature_enabled_impl();
    v8 = PKDeviceUILocked();
    if (v7)
    {
      v6 = v8 != 0;
    }
    else if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F90]) == 1;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }
LABEL_13:
  PKLogFacilityTypeGetObject(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPassLibrary contactlessInterfaceCanBePresentedFromSource: canBePresented: %@ shouldBePresented: %@", (uint8_t *)&v14, 0x16u);

  }
  return v5 && v6;
}

+ (BOOL)contactlessInterfaceCanBePresentedFromSource:(int64_t)a3 deviceUILocked:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t BoolForKey;
  _BOOL8 v7;
  uint64_t v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if (PKNearFieldRadioIsAvailable())
  {
    BoolForKey = PKSharedCacheGetBoolForKey(CFSTR("ContactlessPassesAvailable"));
    v7 = BoolForKey;
    if (!a3 && (_DWORD)BoolForKey)
    {
      v8 = 1;
      v7 = PKDoubleClickAllowed();
      goto LABEL_11;
    }
  }
  else
  {
    v7 = 0;
  }
  if (a3 == 2)
  {
    v9 = _os_feature_enabled_impl();
    v8 = v9 & v4;
    if ((v9 & 1) == 0 && v4)
    {
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46F90]) == 1;

    }
  }
  else
  {
    v8 = 1;
  }
LABEL_11:
  PKLogFacilityTypeGetObject(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKPassLibrary contactlessInterfaceCanBePresentedFromSource: canBePresented: %@ shouldBeShouldBePresented: %@", (uint8_t *)&v15, 0x16u);

  }
  return v7 & v8;
}

- (PKPassLibraryDelegate)delegate
{
  return (PKPassLibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
