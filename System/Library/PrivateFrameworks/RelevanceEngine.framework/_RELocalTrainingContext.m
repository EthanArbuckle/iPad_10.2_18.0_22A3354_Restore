@implementation _RELocalTrainingContext

- (_RELocalTrainingContext)initWithConnection:(id)a3
{
  id v5;
  _RELocalTrainingContext *v6;
  id v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSXPCConnection *connection;
  void *v11;
  NSXPCConnection *v12;
  void *v13;
  NSXPCConnection *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_RELocalTrainingContext;
  v6 = -[RETrainingContext init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.RelevanceEngine.LocalTrainingContext.%p"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    -[_RELocalTrainingContext _configureForRelevanceEngine:](v6, "_configureForRelevanceEngine:", 0);
    objc_storeStrong((id *)&v6->_connection, a3);
    connection = v6->_connection;
    RERemoteTrainingClientInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](connection, "setRemoteObjectInterface:", v11);

    v12 = v6->_connection;
    RERemoteTrainingServerInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v12, "setExportedInterface:", v13);

    -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
    objc_initWeak(&location, v6);
    v14 = v6->_connection;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46___RELocalTrainingContext_initWithConnection___block_invoke;
    v16[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](v6->_connection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (id)_elementRelevanceEngine
{
  void *v2;
  void *v3;
  void *v4;

  -[RETrainingContext relevanceEngine](self, "relevanceEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementRelevanceEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_configureForRelevanceEngine:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_RELocalTrainingContext;
  -[RETrainingContext _configureForRelevanceEngine:](&v6, sel__configureForRelevanceEngine_, a3);
  -[_RELocalTrainingContext _elementRelevanceEngine](self, "_elementRelevanceEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  dispatch_set_target_queue((dispatch_object_t)self->_queue, v5);

}

- (void)_handleInvalidation
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___RELocalTrainingContext__handleInvalidation__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)performTrainingWithElements:(id)a3 events:(id)a4 interactions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;
  OS_dispatch_queue *v24;
  id v25;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self->_queue;
  -[_RELocalTrainingContext _elementRelevanceEngine](self, "_elementRelevanceEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86___RELocalTrainingContext_performTrainingWithElements_events_interactions_completion___block_invoke;
    block[3] = &unk_24CF8C5A8;
    block[4] = self;
    v20 = v16;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    v24 = v14;
    v25 = v13;
    dispatch_async(queue, block);

  }
  else
  {
    RELogForDomain(17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2132F7000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to train, but the trainingQueue is nil!", buf, 2u);
    }

    dispatch_async((dispatch_queue_t)v14, v13);
  }

}

- (void)updateRemoteAttribute:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
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
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __67___RELocalTrainingContext_updateRemoteAttribute_forKey_completion___block_invoke;
  v15[3] = &unk_24CF8C5D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
