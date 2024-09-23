@implementation VCDaemonSyncDataEndpoint

- (VCDaemonSyncDataEndpoint)initWithEventHandler:(id)a3
{
  id v6;
  VCDaemonSyncDataEndpoint *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSMutableSet *mutableSyncDataHandlers;
  VCDaemonSyncDataEndpoint *v14;
  void *v16;
  objc_super v17;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCDaemonSyncDataEndpoint.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventHandler"));

  }
  v17.receiver = self;
  v17.super_class = (Class)VCDaemonSyncDataEndpoint;
  v7 = -[VCDaemonSyncDataEndpoint init](&v17, sel_init);
  if (v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.shortcuts.VCDaemonSyncDataEndpoint", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_eventHandler, a3);
    v12 = objc_opt_new();
    mutableSyncDataHandlers = v7->_mutableSyncDataHandlers;
    v7->_mutableSyncDataHandlers = (NSMutableSet *)v12;

    v14 = v7;
  }

  return v7;
}

- (NSSet)syncDataHandlers
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy__3533;
  v11 = __Block_byref_object_dispose__3534;
  v12 = 0;
  -[VCDaemonSyncDataEndpoint queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__VCDaemonSyncDataEndpoint_syncDataHandlers__block_invoke;
  v6[3] = &unk_1E7AA8288;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (NSMutableSet)mutableSyncDataHandlers
{
  return self->_mutableSyncDataHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSyncDataHandlers, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__VCDaemonSyncDataEndpoint_syncDataHandlers__block_invoke(uint64_t a1)
{
  void *v2;
  VCIntentDefinitionSyncDataHandler *v3;
  void *v4;
  VCIntentDefinitionSyncDataHandler *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "mutableSyncDataHandlers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("class"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", objc_opt_class()) & 1) == 0)
  {
    v3 = [VCIntentDefinitionSyncDataHandler alloc];
    objc_msgSend(*(id *)(a1 + 32), "eventHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VCIntentDefinitionSyncDataHandler initWithEventHandler:](v3, "initWithEventHandler:", v4);
    objc_msgSend(v9, "addObject:", v5);

  }
  v6 = objc_msgSend(v9, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

@end
