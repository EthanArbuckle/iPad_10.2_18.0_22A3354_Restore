@implementation ICMachineDataActionHandler

+ (ICMachineDataActionHandler)sharedHandler
{
  if (sharedHandler_sOnceToken != -1)
    dispatch_once(&sharedHandler_sOnceToken, &__block_literal_global_33863);
  return (ICMachineDataActionHandler *)(id)sharedHandler_sSharedHandler;
}

- (void)processActionFromResponse:(id)a3 withRequestContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CFString **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-MD-Action"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = ICStoreHTTPHeaderKeyXAppleMDData;
    v14 = 1;
  }
  else
  {
    objc_msgSend(v8, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-AMD-Action"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
      goto LABEL_12;
    }
    v12 = (void *)v15;
    v13 = &ICStoreHTTPHeaderKeyXAppleAMDData;
    v14 = 2;
  }
  objc_msgSend(v8, "ic_valueForHTTPHeaderField:", *v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_10;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v16, 0);
  if (!v17)
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v8;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "failed to decode anisette response data from response %{public}@", buf, 0xCu);
    }

LABEL_10:
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__ICMachineDataActionHandler_processActionFromResponse_withRequestContext_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E4390CA0;
  v21 = v12;
  v22 = v10;
  v19 = v12;
  -[ICMachineDataActionHandler processAction:data:withRequestContext:version:withCompletionHandler:](self, "processAction:data:withRequestContext:version:withCompletionHandler:", v19, v17, v9, v14, v20);

LABEL_12:
}

void __43__ICMachineDataActionHandler_sharedHandler__block_invoke()
{
  ICMachineDataActionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(ICMachineDataActionHandler);
  v1 = (void *)sharedHandler_sSharedHandler;
  sharedHandler_sSharedHandler = (uint64_t)v0;

}

- (ICMachineDataActionHandler)init
{
  ICMachineDataActionHandler *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *callbackQueue;
  NSOperationQueue *v5;
  NSOperationQueue *operationQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICMachineDataActionHandler;
  v2 = -[ICMachineDataActionHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iTunesCloud.ICMachineDataSession.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v3;

    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v5;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICMachineDataSession.operation"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
  }
  return v2;
}

- (void)processAction:(id)a3 data:(id)a4 withRequestContext:(id)a5 version:(int64_t)a6 withCompletionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  __objc2_class **v17;
  id v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  ICMachineDataActionHandler *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "processing machine data action %{public}@", buf, 0xCu);
  }

  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SP")) & 1) != 0)
  {
    v17 = off_1E437A788;
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("SM")) & 1) != 0)
  {
    v17 = off_1E437A790;
  }
  else
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("RP")) & 1) == 0)
    {
      if (v12)
      {
        v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v12;
          _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "unknown machine data action %{public}@ - ignoring", buf, 0xCu);
        }

      }
      goto LABEL_15;
    }
    v17 = off_1E437A780;
  }
  v18 = objc_alloc_init(*v17);
  if (!v18)
  {
LABEL_15:
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
    goto LABEL_16;
  }
  v19 = v18;
  objc_msgSend(v18, "setData:", v13);
  objc_msgSend(v19, "setRequestContext:", v14);
  objc_msgSend(v19, "setProtocolVersion:", a6);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E4390C58;
  v22 = v12;
  v23 = self;
  v24 = v15;
  objc_msgSend(v19, "setCompletionHandler:", v21);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v19);

LABEL_16:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

uint64_t __97__ICMachineDataActionHandler_processActionFromResponse_withRequestContext_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), a2, a3);
  return result;
}

void __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "machine data action %{public}@ completed. err=%{public}@", buf, 0x16u);
  }

  v9 = (void *)a1[6];
  v10 = *(NSObject **)(a1[5] + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke_13;
  block[3] = &unk_1E4390E58;
  v15 = v6;
  v16 = v9;
  v14 = v5;
  v11 = v6;
  v12 = v5;
  dispatch_async(v10, block);

}

uint64_t __98__ICMachineDataActionHandler_processAction_data_withRequestContext_version_withCompletionHandler___block_invoke_13(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
