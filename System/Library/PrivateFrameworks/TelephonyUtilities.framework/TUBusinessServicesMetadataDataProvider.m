@implementation TUBusinessServicesMetadataDataProvider

+ (TUBusinessServicesMetadataDataProvider)sharedInstance
{
  void *v3;
  int v4;
  id v5;
  _QWORD block[5];

  v3 = (void *)objc_opt_new();
  v4 = TUBusinessConnectCallingEnabled(v3);

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__TUBusinessServicesMetadataDataProvider_sharedInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedInstance_onceToken_2 != -1)
      dispatch_once(&sharedInstance_onceToken_2, block);
    v5 = (id)sharedInstance_sBusinessServicesDataProvider;
  }
  else
  {
    v5 = 0;
  }
  return (TUBusinessServicesMetadataDataProvider *)v5;
}

void __56__TUBusinessServicesMetadataDataProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sBusinessServicesDataProvider;
  sharedInstance_sBusinessServicesDataProvider = (uint64_t)v1;

}

- (TUBusinessServicesMetadataDataProvider)init
{
  id v3;
  TUBusinessServicesMetadataDataProvider *BCSBusinessQueryServiceClass;

  v3 = (id)objc_opt_new();
  if (!TUBusinessConnectCallingEnabled(v3))
  {
    BCSBusinessQueryServiceClass = 0;
    goto LABEL_5;
  }
  BCSBusinessQueryServiceClass = (TUBusinessServicesMetadataDataProvider *)getBCSBusinessQueryServiceClass();

  if (BCSBusinessQueryServiceClass)
  {
    v3 = objc_alloc_init((Class)getBCSBusinessQueryServiceClass());
    self = -[TUBusinessServicesMetadataDataProvider initWithBusinessService:](self, "initWithBusinessService:", v3);
    BCSBusinessQueryServiceClass = self;
LABEL_5:

  }
  return BCSBusinessQueryServiceClass;
}

- (TUBusinessServicesMetadataDataProvider)initWithBusinessService:(id)a3
{
  id v5;
  TUBusinessServicesMetadataDataProvider *v6;
  TUBusinessServicesMetadataDataProvider *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUBusinessServicesMetadataDataProvider;
  v6 = -[TUBusinessServicesMetadataDataProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_businessQueryService, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.BusinessServicesDataProvider", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)fetchBusinessServiceInformationForHandleValue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__11;
  v15[4] = __Block_byref_object_dispose__11;
  v16 = 0;
  -[TUBusinessServicesMetadataDataProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke;
  v11[3] = &unk_1E38A3688;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v14 = v15;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  _Block_object_dispose(v15, 8);
}

void __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "businessQueryService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    TUDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Querying business service for destinationID: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "businessQueryService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_4;
    v12[3] = &unk_1E38A3660;
    v8 = v7;
    v9 = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v14 = v9;
    v11 = *(_OWORD *)(a1 + 48);
    v10 = (id)v11;
    v15 = v11;
    objc_msgSend(v6, "isBusinessCallerRegisteredForPhoneNumber:completion:", v8, v12);

  }
}

void __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_4(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Got result indicating that destinationID: %@ is registered with business. Querying for more information about business", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "businessQueryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_5;
    v14[3] = &unk_1E38A3638;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v15 = v9;
    v16 = v10;
    v13 = *(_OWORD *)(a1 + 48);
    v11 = (id)v13;
    v17 = v13;
    objc_msgSend(v7, "fetchBusinessCallerMetadataWithPhoneNumber:completion:", v9, v14);

  }
  else
  {
    if (v5)
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Got result indicating that destinationID: %@ is not registered with business", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __99__TUBusinessServicesMetadataDataProvider_fetchBusinessServiceInformationForHandleValue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  TUBusinessCallerItem *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (*v13)(void);
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Got businessItem: %@ for destinationID: %@", (uint8_t *)&v16, 0x16u);
  }

  if (v3 && objc_msgSend(*(id *)(a1 + 40), "isValidBusinessItem:", v3))
  {
    v6 = [TUBusinessCallerItem alloc];
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "department");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logoURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TUBusinessCallerItem initWithName:department:logoURL:](v6, "initWithName:department:logoURL:", v7, v8, v9);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    TUDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "logoURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "Got nil or invalid businessItem with improper logoURL %@", (uint8_t *)&v16, 0xCu);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v13();

}

- (BOOL)isValidBusinessItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "logoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "logoURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFileURL");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (TUBusinessServiceProviderProtocol)businessQueryService
{
  return self->_businessQueryService;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)metadataQueryHandler
{
  return self->_metadataQueryHandler;
}

- (void)setMetadataQueryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadataQueryHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_businessQueryService, 0);
}

@end
