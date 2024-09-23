@implementation TUIDSLookupManager

+ (TUIDSLookupManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__TUIDSLookupManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (TUIDSLookupManager *)(id)sharedManager_sharedManager;
}

void __35__TUIDSLookupManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;

}

- (TUIDSLookupManager)init
{
  TUSimulatedIDSIDQueryController *v3;
  void *v4;
  TUIDSLookupManager *v5;

  if (TUSimulatedModeEnabled())
  {
    v3 = objc_alloc_init(TUSimulatedIDSIDQueryController);
    v4 = &__block_literal_global_34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D34310], "sharedInstance");
    v3 = (TUSimulatedIDSIDQueryController *)objc_claimAutoreleasedReturnValue();
    v4 = &__block_literal_global_61;
  }
  v5 = -[TUIDSLookupManager initWithQueryController:batchQueryControllerCreationBlock:](self, "initWithQueryController:batchQueryControllerCreationBlock:", v3, v4);

  return v5;
}

TUSimulatedIDSBatchIDQueryController *__26__TUIDSLookupManager_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  TUSimulatedIDSBatchIDQueryController *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = -[TUSimulatedIDSBatchIDQueryController initWithService:delegate:queue:]([TUSimulatedIDSBatchIDQueryController alloc], "initWithService:delegate:queue:", v8, v7, v6);

  return v9;
}

id __26__TUIDSLookupManager_init__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0D342B0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = (void *)objc_msgSend([v6 alloc], "initWithService:delegate:queue:", v9, v8, v7);

  return v10;
}

- (TUIDSLookupManager)initWithQueryController:(id)a3 batchQueryControllerCreationBlock:(id)a4
{
  id v7;
  id v8;
  TUIDSLookupManager *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  void *v14;
  id batchQueryControllerCreationBlock;
  TULocked *v16;
  void *v17;
  uint64_t v18;
  TULocked *idsFaceTimeVideoStatuses;
  TULocked *v20;
  void *v21;
  uint64_t v22;
  TULocked *idsFaceTimeAudioStatuses;
  TULocked *v24;
  void *v25;
  uint64_t v26;
  TULocked *idsFaceTimeMultiwayStatuses;
  TULocked *v28;
  void *v29;
  uint64_t v30;
  TULocked *idsVideoMessagingStatuses;
  TULocked *v32;
  void *v33;
  uint64_t v34;
  TULocked *idsiMessageStatuses;
  TULocked *v36;
  void *v37;
  uint64_t v38;
  TULocked *idsModernStatuses;
  TULocked *v40;
  void *v41;
  uint64_t v42;
  TULocked *idsWebCapableStatuses;
  TULocked *v44;
  void *v45;
  uint64_t v46;
  TULocked *idsAVLessSharePlayCapableStatuses;
  TULocked *v48;
  void *v49;
  uint64_t v50;
  TULocked *idsNameAndPhotoStatuses;
  objc_super v53;

  v7 = a3;
  v8 = a4;
  v53.receiver = self;
  v53.super_class = (Class)TUIDSLookupManager;
  v9 = -[TUIDSLookupManager init](&v53, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.tuidslookupmanager", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_queryController, a3);
    v14 = _Block_copy(v8);
    batchQueryControllerCreationBlock = v9->_batchQueryControllerCreationBlock;
    v9->_batchQueryControllerCreationBlock = v14;

    v16 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TULocked initWithObject:](v16, "initWithObject:", v17);
    idsFaceTimeVideoStatuses = v9->_idsFaceTimeVideoStatuses;
    v9->_idsFaceTimeVideoStatuses = (TULocked *)v18;

    v20 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[TULocked initWithObject:](v20, "initWithObject:", v21);
    idsFaceTimeAudioStatuses = v9->_idsFaceTimeAudioStatuses;
    v9->_idsFaceTimeAudioStatuses = (TULocked *)v22;

    v24 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[TULocked initWithObject:](v24, "initWithObject:", v25);
    idsFaceTimeMultiwayStatuses = v9->_idsFaceTimeMultiwayStatuses;
    v9->_idsFaceTimeMultiwayStatuses = (TULocked *)v26;

    v28 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[TULocked initWithObject:](v28, "initWithObject:", v29);
    idsVideoMessagingStatuses = v9->_idsVideoMessagingStatuses;
    v9->_idsVideoMessagingStatuses = (TULocked *)v30;

    v32 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[TULocked initWithObject:](v32, "initWithObject:", v33);
    idsiMessageStatuses = v9->_idsiMessageStatuses;
    v9->_idsiMessageStatuses = (TULocked *)v34;

    v36 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[TULocked initWithObject:](v36, "initWithObject:", v37);
    idsModernStatuses = v9->_idsModernStatuses;
    v9->_idsModernStatuses = (TULocked *)v38;

    v40 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[TULocked initWithObject:](v40, "initWithObject:", v41);
    idsWebCapableStatuses = v9->_idsWebCapableStatuses;
    v9->_idsWebCapableStatuses = (TULocked *)v42;

    v44 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[TULocked initWithObject:](v44, "initWithObject:", v45);
    idsAVLessSharePlayCapableStatuses = v9->_idsAVLessSharePlayCapableStatuses;
    v9->_idsAVLessSharePlayCapableStatuses = (TULocked *)v46;

    v48 = [TULocked alloc];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[TULocked initWithObject:](v48, "initWithObject:", v49);
    idsNameAndPhotoStatuses = v9->_idsNameAndPhotoStatuses;
    v9->_idsNameAndPhotoStatuses = (TULocked *)v50;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIDSLookupManager cancelQueries](self, "cancelQueries");
  v3.receiver = self;
  v3.super_class = (Class)TUIDSLookupManager;
  -[TUIDSLookupManager dealloc](&v3, sel_dealloc);
}

- (TUIDSBatchIDQueryController)batchQuerySearchVideoController
{
  NSObject *v3;
  TUIDSBatchIDQueryController *batchQuerySearchVideoController;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  TUIDSBatchIDQueryController *v8;
  TUIDSBatchIDQueryController *v9;

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  batchQuerySearchVideoController = self->_batchQuerySearchVideoController;
  if (!batchQuerySearchVideoController)
  {
    -[TUIDSLookupManager batchQueryControllerCreationBlock](self, "batchQueryControllerCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D34210];
    -[TUIDSLookupManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_batchQuerySearchVideoController;
    self->_batchQuerySearchVideoController = v8;

    batchQuerySearchVideoController = self->_batchQuerySearchVideoController;
  }
  return batchQuerySearchVideoController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchAudioController
{
  NSObject *v3;
  TUIDSBatchIDQueryController *batchQuerySearchAudioController;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  TUIDSBatchIDQueryController *v8;
  TUIDSBatchIDQueryController *v9;

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  batchQuerySearchAudioController = self->_batchQuerySearchAudioController;
  if (!batchQuerySearchAudioController)
  {
    -[TUIDSLookupManager batchQueryControllerCreationBlock](self, "batchQueryControllerCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D34208];
    -[TUIDSLookupManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_batchQuerySearchAudioController;
    self->_batchQuerySearchAudioController = v8;

    batchQuerySearchAudioController = self->_batchQuerySearchAudioController;
  }
  return batchQuerySearchAudioController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchMultiwayController
{
  NSObject *v3;
  TUIDSBatchIDQueryController *batchQuerySearchMultiwayController;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  TUIDSBatchIDQueryController *v8;
  TUIDSBatchIDQueryController *v9;

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  batchQuerySearchMultiwayController = self->_batchQuerySearchMultiwayController;
  if (!batchQuerySearchMultiwayController)
  {
    -[TUIDSLookupManager batchQueryControllerCreationBlock](self, "batchQueryControllerCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D34218];
    -[TUIDSLookupManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_batchQuerySearchMultiwayController;
    self->_batchQuerySearchMultiwayController = v8;

    batchQuerySearchMultiwayController = self->_batchQuerySearchMultiwayController;
  }
  return batchQuerySearchMultiwayController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchVideoMessagingController
{
  NSObject *v3;
  TUIDSBatchIDQueryController *batchQuerySearchVideoMessagingController;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  TUIDSBatchIDQueryController *v7;
  TUIDSBatchIDQueryController *v8;

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  batchQuerySearchVideoMessagingController = self->_batchQuerySearchVideoMessagingController;
  if (!batchQuerySearchVideoMessagingController)
  {
    -[TUIDSLookupManager batchQueryControllerCreationBlock](self, "batchQueryControllerCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[TUIDSLookupManager queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, TUIDSLookupManager *, void *))v5)[2](v5, CFSTR("com.apple.private.alloy.facetime.messaging"), self, v6);
    v7 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    v8 = self->_batchQuerySearchVideoMessagingController;
    self->_batchQuerySearchVideoMessagingController = v7;

    batchQuerySearchVideoMessagingController = self->_batchQuerySearchVideoMessagingController;
  }
  return batchQuerySearchVideoMessagingController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchiMessageController
{
  NSObject *v3;
  TUIDSBatchIDQueryController *batchQuerySearchiMessageController;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  TUIDSBatchIDQueryController *v8;
  TUIDSBatchIDQueryController *v9;

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  batchQuerySearchiMessageController = self->_batchQuerySearchiMessageController;
  if (!batchQuerySearchiMessageController)
  {
    -[TUIDSLookupManager batchQueryControllerCreationBlock](self, "batchQueryControllerCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D34240];
    -[TUIDSLookupManager queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, TUIDSLookupManager *, void *))v5)[2](v5, v6, self, v7);
    v8 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    v9 = self->_batchQuerySearchiMessageController;
    self->_batchQuerySearchiMessageController = v8;

    batchQuerySearchiMessageController = self->_batchQuerySearchiMessageController;
  }
  return batchQuerySearchiMessageController;
}

- (TUIDSBatchIDQueryController)batchQuerySearchShareNameAndPhotoController
{
  NSObject *v3;
  TUIDSBatchIDQueryController *batchQuerySearchShareNameAndPhotoController;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  TUIDSBatchIDQueryController *v7;
  TUIDSBatchIDQueryController *v8;

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  batchQuerySearchShareNameAndPhotoController = self->_batchQuerySearchShareNameAndPhotoController;
  if (!batchQuerySearchShareNameAndPhotoController)
  {
    -[TUIDSLookupManager batchQueryControllerCreationBlock](self, "batchQueryControllerCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[TUIDSLookupManager queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, TUIDSLookupManager *, void *))v5)[2](v5, CFSTR("com.apple.private.alloy.nameandphoto"), self, v6);
    v7 = (TUIDSBatchIDQueryController *)objc_claimAutoreleasedReturnValue();
    v8 = self->_batchQuerySearchShareNameAndPhotoController;
    self->_batchQuerySearchShareNameAndPhotoController = v7;

    batchQuerySearchShareNameAndPhotoController = self->_batchQuerySearchShareNameAndPhotoController;
  }
  return batchQuerySearchShareNameAndPhotoController;
}

- (BOOL)isFaceTimeVideoAvailableForItem:(id)a3
{
  void *v4;

  objc_msgSend(a3, "idsCanonicalDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TUIDSLookupManager isFaceTimeVideoAvailableForAnyDestinationInDestinations:](self, "isFaceTimeVideoAvailableForAnyDestinationInDestinations:", v4);

  return (char)self;
}

- (BOOL)isFaceTimeAudioAvailableForItem:(id)a3
{
  void *v4;

  objc_msgSend(a3, "idsCanonicalDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TUIDSLookupManager isFaceTimeAudioAvailableForAnyDestinationInDestinations:](self, "isFaceTimeAudioAvailableForAnyDestinationInDestinations:", v4);

  return (char)self;
}

- (BOOL)isFaceTimeMultiwayAvailableForItem:(id)a3
{
  void *v4;

  objc_msgSend(a3, "idsCanonicalDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TUIDSLookupManager isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:](self, "isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:", v4);

  return (char)self;
}

- (BOOL)isVideoMessagingAvailableForItem:(id)a3
{
  void *v4;

  objc_msgSend(a3, "idsCanonicalDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TUIDSLookupManager isVideoMessagingAvailableForAnyDestinationInDestinations:](self, "isVideoMessagingAvailableForAnyDestinationInDestinations:", v4);

  return (char)self;
}

- (BOOL)isFaceTimeVideoAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsFaceTimeVideoStatuses](self, "idsFaceTimeVideoStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAnyDestinationAvailableInDestinations:usingCache:", v4, v6);

  return (char)v5;
}

- (BOOL)isFaceTimeAudioAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsFaceTimeAudioStatuses](self, "idsFaceTimeAudioStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAnyDestinationAvailableInDestinations:usingCache:", v4, v6);

  return (char)v5;
}

- (BOOL)isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsFaceTimeMultiwayStatuses](self, "idsFaceTimeMultiwayStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAnyDestinationAvailableInDestinations:usingCache:", v4, v6);

  return (char)v5;
}

- (BOOL)isVideoMessagingAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsVideoMessagingStatuses](self, "idsVideoMessagingStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAnyDestinationAvailableInDestinations:usingCache:", v4, v6);

  return (char)v5;
}

- (BOOL)isiMessageAvailableForAnyDestinationInDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsiMessageStatuses](self, "idsiMessageStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAnyDestinationAvailableInDestinations:usingCache:", v4, v6);

  return (char)v5;
}

- (BOOL)isAVLessSharePlayCapableForAnyDestinationInDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TUIDSLookupManager idsAVLessSharePlayCapableStatuses](self, "idsAVLessSharePlayCapableStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intersectsSet:", v4);

  return v7;
}

- (unsigned)faceTimeAudioAvailabilityForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsFaceTimeAudioStatuses](self, "idsFaceTimeAudioStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "fzHandleIDStatusForDestination:usingCache:", v4, v6);

  return v5;
}

- (unsigned)faceTimeVideoAvailabilityForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsFaceTimeVideoStatuses](self, "idsFaceTimeVideoStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "fzHandleIDStatusForDestination:usingCache:", v4, v6);

  return v5;
}

- (unsigned)faceTimeMultiwayAvailabilityForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsFaceTimeMultiwayStatuses](self, "idsFaceTimeMultiwayStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "fzHandleIDStatusForDestination:usingCache:", v4, v6);

  return v5;
}

- (BOOL)isModernFaceTimeAvailableForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TUIDSLookupManager idsModernStatuses](self, "idsModernStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)isWebCapableFaceTimeAvailableForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TUIDSLookupManager idsWebCapableStatuses](self, "idsWebCapableStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (BOOL)isNameAndPhotoAvailableForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TUIDSLookupManager idsNameAndPhotoStatuses](self, "idsNameAndPhotoStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isAnyDestinationAvailableInDestinations:usingCache:", v4, v6);

  return (char)v5;
}

- (void)cancelQueries
{
  NSObject *v3;
  _QWORD block[5];

  -[TUIDSLookupManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__TUIDSLookupManager_cancelQueries__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __35__TUIDSLookupManager_cancelQueries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  objc_msgSend(*(id *)(a1 + 32), "idsFaceTimeVideoStatuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C9AA70];
  objc_msgSend(v2, "setObject:", MEMORY[0x1E0C9AA70]);

  objc_msgSend(*(id *)(a1 + 32), "idsFaceTimeAudioStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "idsFaceTimeMultiwayStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "idsiMessageStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "idsModernStatuses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:", v8);

  objc_msgSend(*(id *)(a1 + 32), "idsWebCapableStatuses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:", v10);

  objc_msgSend(*(id *)(a1 + 32), "idsAVLessSharePlayCapableStatuses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 96);
  *(_QWORD *)(v13 + 96) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 104);
  *(_QWORD *)(v15 + 104) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "invalidate");
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 112);
  *(_QWORD *)(v17 + 112) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "invalidate");
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 128);
  *(_QWORD *)(v19 + 128) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "invalidate");
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 136);
  *(_QWORD *)(v21 + 136) = 0;

}

- (void)beginQueryWithDestinations:(id)a3
{
  -[TUIDSLookupManager beginQueryWithDestinations:services:](self, "beginQueryWithDestinations:services:", a3, 47);
}

- (void)beginQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 63;
  else
    v4 = 47;
  -[TUIDSLookupManager beginQueryWithDestinations:services:](self, "beginQueryWithDestinations:services:", a3, v4);
}

- (void)beginQueryWithDestinations:(id)a3 services:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[TUIDSLookupManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__TUIDSLookupManager_beginQueryWithDestinations_services___block_invoke;
  block[3] = &unk_1E38A2150;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __58__TUIDSLookupManager_beginQueryWithDestinations_services___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 48);
  if ((v2 & 1) != 0)
  {
    result = objc_msgSend(*(id *)(result + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(result + 40), *MEMORY[0x1E0D34208]);
    v2 = *(_QWORD *)(v1 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  result = objc_msgSend(*(id *)(v1 + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34210]);
  v2 = *(_QWORD *)(v1 + 48);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  result = objc_msgSend(*(id *)(v1 + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34218]);
  v2 = *(_QWORD *)(v1 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  result = objc_msgSend(*(id *)(v1 + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(v1 + 40), CFSTR("com.apple.private.alloy.facetime.messaging"));
  v2 = *(_QWORD *)(v1 + 48);
  if ((v2 & 0x20) == 0)
  {
LABEL_6:
    if ((v2 & 0x10) == 0)
      return result;
    return objc_msgSend(*(id *)(v1 + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34240]);
  }
LABEL_12:
  result = objc_msgSend(*(id *)(v1 + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(v1 + 40), CFSTR("com.apple.private.alloy.nameandphoto"));
  if ((*(_QWORD *)(v1 + 48) & 0x10) != 0)
    return objc_msgSend(*(id *)(v1 + 32), "beginQueryWithDestination:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34240]);
  return result;
}

- (id)preferredFromID
{
  void *v2;
  void *v3;

  +[TUCallCapabilities outgoingRelayCallerID](TUCallCapabilities, "outgoingRelayCallerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34EA8]), "initWithUnprefixedURI:", v2);

  return v3;
}

- (void)beginQueryWithDestination:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  TUIDSLookupManager *v21;
  id v22;

  v6 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __58__TUIDSLookupManager_beginQueryWithDestination_onService___block_invoke;
  v20 = &unk_1E38A3308;
  v21 = self;
  v7 = v6;
  v22 = v7;
  v8 = a3;
  v9 = _Block_copy(&v17);
  -[TUIDSLookupManager preferredFromID](self, "preferredFromID", v17, v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDSLookupManager queryController](self, "queryController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  -[TUIDSLookupManager queryController](self, "queryController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *MEMORY[0x1E0D34228];
  -[TUIDSLookupManager queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) != 0)
    objc_msgSend(v13, "requiredIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v14, v7, v10, v15, v16, v9);
  else
    objc_msgSend(v13, "refreshIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v14, v7, v10, v15, v16, v9);

}

uint64_t __58__TUIDSLookupManager_beginQueryWithDestination_onService___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleIDSQueryResultWithDestinationStatus:onService:", a2, *(_QWORD *)(a1 + 40));
}

- (void)beginQueryWithRefreshForDestination:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  TUIDSLookupManager *v21;
  id v22;

  v6 = a4;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __68__TUIDSLookupManager_beginQueryWithRefreshForDestination_onService___block_invoke;
  v20 = &unk_1E38A3308;
  v21 = self;
  v22 = v6;
  v7 = v6;
  v8 = a3;
  v9 = _Block_copy(&v17);
  v10 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.private.alloy.nameandphoto"), v17, v18, v19, v20, v21);
  v11 = (id *)TUBundleIdentifierNameAndPhotoUtilities;
  if (!v10)
    v11 = (id *)MEMORY[0x1E0D34228];
  v12 = *v11;
  -[TUIDSLookupManager queryController](self, "queryController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIDSLookupManager preferredFromID](self, "preferredFromID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDSLookupManager queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "refreshIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v14, v7, v15, v12, v16, v9);

}

uint64_t __68__TUIDSLookupManager_beginQueryWithRefreshForDestination_onService___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleIDSQueryResultWithDestinationStatus:onService:", a2, *(_QWORD *)(a1 + 40));
}

- (void)beginBatchQueryWithDestinations:(id)a3
{
  -[TUIDSLookupManager beginBatchQueryWithDestinations:services:](self, "beginBatchQueryWithDestinations:services:", a3, 47);
}

- (void)beginBatchQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 63;
  else
    v4 = 47;
  -[TUIDSLookupManager beginBatchQueryWithDestinations:services:](self, "beginBatchQueryWithDestinations:services:", a3, v4);
}

- (void)beginBatchQueryWithDestinations:(id)a3 services:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[TUIDSLookupManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__TUIDSLookupManager_beginBatchQueryWithDestinations_services___block_invoke;
  block[3] = &unk_1E38A2150;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __63__TUIDSLookupManager_beginBatchQueryWithDestinations_services___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v2 = *(_QWORD *)(a1 + 48);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "batchQuerySearchAudioController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDestinations:", v10);

    v2 = *(_QWORD *)(a1 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(*(id *)(a1 + 32), "batchQuerySearchVideoController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDestinations:", v12);

  v2 = *(_QWORD *)(a1 + 48);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "batchQuerySearchMultiwayController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDestinations:", v14);

  v2 = *(_QWORD *)(a1 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "batchQuerySearchShareNameAndPhotoController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDestinations:", v18);

    if ((*(_QWORD *)(a1 + 48) & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "batchQuerySearchVideoMessagingController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDestinations:", v16);

  v2 = *(_QWORD *)(a1 + 48);
  if ((v2 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v2 & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "batchQuerySearchiMessageController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDestinations:", v4);

  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "queryController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D34228];
  objc_msgSend(*(id *)(a1 + 32), "preferredFromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v5, v6, v7, CFSTR("com.apple.TelephonyUtilities"), v8, &__block_literal_global_79_0);

}

- (void)beginCachedQueryWithDestinations:(id)a3
{
  -[TUIDSLookupManager beginCachedQueryWithDestinations:services:](self, "beginCachedQueryWithDestinations:services:", a3, 47);
}

- (void)beginCachedQueryWithDestinations:(id)a3 includeMessages:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 63;
  else
    v4 = 47;
  -[TUIDSLookupManager beginCachedQueryWithDestinations:services:](self, "beginCachedQueryWithDestinations:services:", a3, v4);
}

- (void)beginCachedQueryWithDestinations:(id)a3 services:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[TUIDSLookupManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__TUIDSLookupManager_beginCachedQueryWithDestinations_services___block_invoke;
  block[3] = &unk_1E38A2150;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __64__TUIDSLookupManager_beginCachedQueryWithDestinations_services___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 48);
  if ((v2 & 1) != 0)
  {
    result = objc_msgSend(*(id *)(result + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(result + 40), *MEMORY[0x1E0D34208]);
    v2 = *(_QWORD *)(v1 + 48);
    if ((v2 & 2) == 0)
    {
LABEL_3:
      if ((v2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v2 & 2) == 0)
  {
    goto LABEL_3;
  }
  result = objc_msgSend(*(id *)(v1 + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34210]);
  v2 = *(_QWORD *)(v1 + 48);
  if ((v2 & 4) == 0)
  {
LABEL_4:
    if ((v2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  result = objc_msgSend(*(id *)(v1 + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34218]);
  v2 = *(_QWORD *)(v1 + 48);
  if ((v2 & 8) == 0)
  {
LABEL_5:
    if ((v2 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_12;
  }
LABEL_11:
  result = objc_msgSend(*(id *)(v1 + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(v1 + 40), CFSTR("com.apple.private.alloy.facetime.messaging"));
  v2 = *(_QWORD *)(v1 + 48);
  if ((v2 & 0x20) == 0)
  {
LABEL_6:
    if ((v2 & 0x10) == 0)
      return result;
    return objc_msgSend(*(id *)(v1 + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34240]);
  }
LABEL_12:
  result = objc_msgSend(*(id *)(v1 + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(v1 + 40), CFSTR("com.apple.private.alloy.nameandphoto"));
  if ((*(_QWORD *)(v1 + 48) & 0x10) != 0)
    return objc_msgSend(*(id *)(v1 + 32), "beginCachedQueryWithDestinations:onService:", *(_QWORD *)(v1 + 40), *MEMORY[0x1E0D34240]);
  return result;
}

- (void)beginCachedQueryWithDestinations:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = a3;
  -[TUIDSLookupManager queryController](self, "queryController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIDSLookupManager preferredFromID](self, "preferredFromID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIDSLookupManager queue](self, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__TUIDSLookupManager_beginCachedQueryWithDestinations_onService___block_invoke;
  v13[3] = &unk_1E38A3308;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v8, "currentIDStatusForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v9, v12, v10, CFSTR("com.apple.TelephonyUtilities"), v11, v13);

}

void __65__TUIDSLookupManager_beginCachedQueryWithDestinations_onService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
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
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", &unk_1E38E9118);

        if ((v12 & 1) == 0)
          objc_msgSend(v4, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleIDSQueryResultWithDestinationStatus:onService:", v4, *(_QWORD *)(a1 + 40));
}

+ (BOOL)isAnyDestinationAvailableInDestinations:(id)a3 usingCache:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "integerValue") == 1)
        {

          LOBYTE(v8) = 1;
          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

+ (unsigned)fzHandleIDStatusForDestination:(id)a3 usingCache:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v5 = a3;
  objc_msgSend(a4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntValue");
  else
    v8 = 0;

  return v8;
}

- (void)postStatusChangedNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__TUIDSLookupManager_postStatusChangedNotification__block_invoke;
  block[3] = &unk_1E38A1360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__TUIDSLookupManager_postStatusChangedNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("TUIDSLookupManagerStatusChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    TULoggableStringForObject();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Received query status response for service %@: %@", (uint8_t *)&v12, 0x16u);

  }
  -[TUIDSLookupManager handleIDSQueryResultWithDestinationStatus:onService:](self, "handleIDSQueryResultWithDestinationStatus:onService:", v8, v9);

}

- (void)handleIDSQueryResultWithDestinationStatus:(id)a3 onService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  TUIDSLookupManager *v16;
  _QWORD v17[4];
  id v18;
  TUIDSLookupManager *v19;
  _QWORD v20[4];
  id v21;
  TUIDSLookupManager *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  TUIDSLookupManager *v27;
  _QWORD v28[4];
  id v29;
  TUIDSLookupManager *v30;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D34208]))
  {
    -[TUIDSLookupManager idsFaceTimeAudioStatuses](self, "idsFaceTimeAudioStatuses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke;
    v28[3] = &unk_1E38A3308;
    v29 = v6;
    v30 = self;
    objc_msgSend(v8, "performWhileLocked:", v28);

    -[TUIDSLookupManager postStatusChangedNotification](self, "postStatusChangedNotification");
    v9 = v29;
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D34210]))
  {
    -[TUIDSLookupManager idsFaceTimeVideoStatuses](self, "idsFaceTimeVideoStatuses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_2;
    v25[3] = &unk_1E38A3308;
    v26 = v6;
    v27 = self;
    objc_msgSend(v10, "performWhileLocked:", v25);

    -[TUIDSLookupManager postStatusChangedNotification](self, "postStatusChangedNotification");
    v9 = v26;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D34218]))
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_3;
    v23[3] = &unk_1E38A3308;
    v23[4] = self;
    v24 = v6;
    -[TUIDSLookupManager filteredDestinationForMultiway:completionBlock:](self, "filteredDestinationForMultiway:completionBlock:", v24, v23);
    v9 = v24;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D34240]))
  {
    -[TUIDSLookupManager idsiMessageStatuses](self, "idsiMessageStatuses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_82;
    v20[3] = &unk_1E38A3308;
    v21 = v6;
    v22 = self;
    objc_msgSend(v11, "performWhileLocked:", v20);

    -[TUIDSLookupManager postStatusChangedNotification](self, "postStatusChangedNotification");
    v9 = v21;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.private.alloy.facetime.messaging")))
  {
    -[TUIDSLookupManager idsVideoMessagingStatuses](self, "idsVideoMessagingStatuses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_83;
    v17[3] = &unk_1E38A3308;
    v18 = v6;
    v19 = self;
    objc_msgSend(v12, "performWhileLocked:", v17);

    -[TUIDSLookupManager postStatusChangedNotification](self, "postStatusChangedNotification");
    v9 = v18;
    goto LABEL_13;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.private.alloy.nameandphoto")))
  {
    -[TUIDSLookupManager idsNameAndPhotoStatuses](self, "idsNameAndPhotoStatuses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_84;
    v14[3] = &unk_1E38A3308;
    v15 = v6;
    v16 = self;
    objc_msgSend(v13, "performWhileLocked:", v14);

    v9 = v15;
    goto LABEL_13;
  }
LABEL_14:

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "idsFaceTimeAudioStatuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setObject:", v4);

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "idsFaceTimeVideoStatuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setObject:", v4);

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "idsFaceTimeMultiwayStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_4;
  v18 = &unk_1E38A3308;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v19 = v5;
  v20 = v6;
  objc_msgSend(v4, "performWhileLocked:", &v15);

  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    TULoggableStringForObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "idsModernStatuses", v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TULoggableStringForObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "idsWebCapableStatuses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TULoggableStringForObject();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "idsAVLessSharePlayCapableStatuses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TULoggableStringForObject();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v8;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Updated filtered destinations for Multiway service: %@ modern: %@ webCapable: %@ avLessSharePlayCapable: %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "postStatusChangedNotification");

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "idsFaceTimeMultiwayStatuses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "setObject:", v4);

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_82(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    TULoggableStringForObject();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Updating destinations for iMessage service: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "idsiMessageStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v6, "setObject:", v7);

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_83(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    TULoggableStringForObject();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Updating destinations for video messaging service: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "idsVideoMessagingStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v6, "setObject:", v7);

}

void __74__TUIDSLookupManager_handleIDSQueryResultWithDestinationStatus_onService___block_invoke_84(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 32));
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    TULoggableStringForObject();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Updating destinations for name and photo service: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "idsNameAndPhotoStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v6, "setObject:", v7);

  objc_msgSend(*(id *)(a1 + 40), "postStatusChangedNotification");
}

- (void)filteredDestinationForMultiway:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  TUIDSLookupManager *v23;
  void (**v24)(id, void *);
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isGreenTea"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E38E9130, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    v7[2](v7, v8);
  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke;
    v25[3] = &unk_1E38A3370;
    v16 = v15;
    v26 = v16;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v25);
    if (objc_msgSend(v16, "count"))
    {
      -[TUIDSLookupManager queryController](self, "queryController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0D34218];
      -[TUIDSLookupManager preferredFromID](self, "preferredFromID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(33, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2;
      v21[3] = &unk_1E38A33E8;
      v22 = v8;
      v23 = self;
      v24 = v7;
      objc_msgSend(v17, "currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v16, v20, v18, CFSTR("com.apple.TelephonyUtilities"), v19, v21);

    }
    else
    {
      v7[2](v7, v8);
    }

  }
}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "intValue") == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E20];
  v4 = a2;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3;
  v34[3] = &unk_1E38A3398;
  v35 = *(id *)(a1 + 32);
  v9 = v6;
  v36 = v9;
  v10 = v5;
  v37 = v10;
  v11 = v7;
  v38 = v11;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v34);

  objc_msgSend(*(id *)(a1 + 40), "idsWebCapableStatuses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_96;
  v31[3] = &unk_1E38A33C0;
  v13 = v10;
  v14 = *(_QWORD *)(a1 + 40);
  v32 = v13;
  v33 = v14;
  objc_msgSend(v12, "performWhileLocked:", v31);

  objc_msgSend(*(id *)(a1 + 40), "idsModernStatuses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2_98;
  v28[3] = &unk_1E38A33C0;
  v16 = v9;
  v17 = *(_QWORD *)(a1 + 40);
  v29 = v16;
  v30 = v17;
  objc_msgSend(v15, "performWhileLocked:", v28);

  objc_msgSend(*(id *)(a1 + 40), "idsAVLessSharePlayCapableStatuses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3_99;
  v25[3] = &unk_1E38A33C0;
  v19 = v11;
  v20 = *(_QWORD *)(a1 + 40);
  v26 = v19;
  v27 = v20;
  objc_msgSend(v18, "performWhileLocked:", v25);

  TUDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    TULoggableStringForObject();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v22;
    _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "Updated filtered destinations for Multiway service: %@", buf, 0xCu);

  }
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v23, v24);

}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v25 = *(_QWORD *)v27;
    v24 = *MEMORY[0x1E0D34B20];
    v8 = *MEMORY[0x1E0D34B40];
    v22 = *MEMORY[0x1E0D34B30];
    v9 = *MEMORY[0x1E0D34B28];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "capabilities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "valueForCapability:", v24);

        if (v13)
          v14 = &unk_1E38E9130;
        else
          v14 = &unk_1E38E9148;
        objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v14, v5);
        objc_msgSend(v11, "capabilities");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "valueForCapability:", v8);

        v17 = a1 + 5;
        if (v16
          || (objc_msgSend(v11, "capabilities"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v18, "valueForCapability:", v22),
              v18,
              v17 = a1 + 6,
              v19))
        {
          objc_msgSend(*v17, "addObject:", v5);
        }
        objc_msgSend(v11, "capabilities");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "valueForCapability:", v9);

        if (v21)
          objc_msgSend(a1[7], "addObject:", v5);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_96(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
  objc_msgSend(*(id *)(a1 + 40), "idsWebCapableStatuses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "setObject:", v3);

}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_2_98(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
  objc_msgSend(*(id *)(a1 + 40), "idsModernStatuses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "setObject:", v3);

}

void __69__TUIDSLookupManager_filteredDestinationForMultiway_completionBlock___block_invoke_3_99(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
  objc_msgSend(*(id *)(a1 + 40), "idsAVLessSharePlayCapableStatuses");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v4, "setObject:", v3);

}

- (void)queryHasWebOnlyEndpointsForDestinations:(id)a3 completionBlock:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0D34DD8];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D34B30]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D34B40]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "initWithRequiredCapabilities:requiredMissingCapabilities:", v10, v11);

  -[TUIDSLookupManager queryHasEndpointWithCapabilities:forMultiwayDestinations:completionBlock:](self, "queryHasEndpointWithCapabilities:forMultiwayDestinations:completionBlock:", v12, v8, v7);
}

- (void)queryHasEndpointWithCapabilities:(id)a3 forMultiwayDestinations:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TUIDSLookupManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke;
  v15[3] = &unk_1E38A3108;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "queryController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D34218];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "preferredFromID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(33, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_2;
  v7[3] = &unk_1E38A3438;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "currentRemoteDevicesForDestinations:service:preferredFromID:listenerID:queue:completionBlock:", v4, v3, v5, CFSTR("com.apple.TelephonyUtilities"), v6, v7);

}

void __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_3;
  v6[3] = &unk_1E38A3410;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *((unsigned __int8 *)v10 + 24), v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __95__TUIDSLookupManager_queryHasEndpointWithCapabilities_forMultiwayDestinations_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t k;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _BYTE *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v24 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = a3;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "requiredCapabilities", v24);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v33;
          v11 = 1;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v33 != v10)
                objc_enumerationMutation(v7);
              v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
              objc_msgSend(v6, "capabilities");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v13) = objc_msgSend(v14, "valueForCapability:", v13) != 0;

              v11 &= v13;
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          }
          while (v9);

          if (!v11)
            continue;
        }
        else
        {

        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "requiredMissingCapabilities");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (!v16)
        {

LABEL_26:
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *v24 = 1;
          continue;
        }
        v17 = v16;
        v18 = *(_QWORD *)v29;
        LOBYTE(v19) = 1;
        do
        {
          for (k = 0; k != v17; ++k)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * k);
            objc_msgSend(v6, "capabilities");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "valueForCapability:", v21);

            v19 = (v23 == 0) & v19;
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        }
        while (v17);

        if (v19)
          goto LABEL_26;
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v27);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUIDSIDQueryController)queryController
{
  return self->_queryController;
}

- (TULocked)idsFaceTimeVideoStatuses
{
  return self->_idsFaceTimeVideoStatuses;
}

- (TULocked)idsFaceTimeAudioStatuses
{
  return self->_idsFaceTimeAudioStatuses;
}

- (TULocked)idsFaceTimeMultiwayStatuses
{
  return self->_idsFaceTimeMultiwayStatuses;
}

- (TULocked)idsVideoMessagingStatuses
{
  return self->_idsVideoMessagingStatuses;
}

- (TULocked)idsiMessageStatuses
{
  return self->_idsiMessageStatuses;
}

- (TULocked)idsNameAndPhotoStatuses
{
  return self->_idsNameAndPhotoStatuses;
}

- (TULocked)idsModernStatuses
{
  return self->_idsModernStatuses;
}

- (TULocked)idsWebCapableStatuses
{
  return self->_idsWebCapableStatuses;
}

- (TULocked)idsAVLessSharePlayCapableStatuses
{
  return self->_idsAVLessSharePlayCapableStatuses;
}

- (void)setBatchQuerySearchVideoController:(id)a3
{
  objc_storeStrong((id *)&self->_batchQuerySearchVideoController, a3);
}

- (void)setBatchQuerySearchAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_batchQuerySearchAudioController, a3);
}

- (void)setBatchQuerySearchMultiwayController:(id)a3
{
  objc_storeStrong((id *)&self->_batchQuerySearchMultiwayController, a3);
}

- (void)setBatchQuerySearchVideoMessagingController:(id)a3
{
  objc_storeStrong((id *)&self->_batchQuerySearchVideoMessagingController, a3);
}

- (void)setBatchQuerySearchiMessageController:(id)a3
{
  objc_storeStrong((id *)&self->_batchQuerySearchiMessageController, a3);
}

- (void)setBatchQuerySearchShareNameAndPhotoController:(id)a3
{
  objc_storeStrong((id *)&self->_batchQuerySearchShareNameAndPhotoController, a3);
}

- (id)batchQueryControllerCreationBlock
{
  return self->_batchQueryControllerCreationBlock;
}

- (void)setBatchQueryControllerCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_batchQueryControllerCreationBlock, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchShareNameAndPhotoController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchiMessageController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchVideoMessagingController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchMultiwayController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchAudioController, 0);
  objc_storeStrong((id *)&self->_batchQuerySearchVideoController, 0);
  objc_storeStrong((id *)&self->_idsAVLessSharePlayCapableStatuses, 0);
  objc_storeStrong((id *)&self->_idsWebCapableStatuses, 0);
  objc_storeStrong((id *)&self->_idsModernStatuses, 0);
  objc_storeStrong((id *)&self->_idsNameAndPhotoStatuses, 0);
  objc_storeStrong((id *)&self->_idsiMessageStatuses, 0);
  objc_storeStrong((id *)&self->_idsVideoMessagingStatuses, 0);
  objc_storeStrong((id *)&self->_idsFaceTimeMultiwayStatuses, 0);
  objc_storeStrong((id *)&self->_idsFaceTimeAudioStatuses, 0);
  objc_storeStrong((id *)&self->_idsFaceTimeVideoStatuses, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
