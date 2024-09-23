@implementation SPScheduler

- (SPScheduler)init
{
  SPScheduler *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  id v6;
  void *v7;
  uint64_t v8;
  FMXPCServiceDescription *serviceDescription;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SPScheduler;
  v2 = -[SPScheduler init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.scheduler", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc(MEMORY[0x24BE2FE70]);
    -[SPScheduler remoteInterface](v2, "remoteInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.scheduler"), 0, v7, 0, 0);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SPScheduler session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPScheduler setSession:](self, "setSession:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SPScheduler;
  -[SPScheduler dealloc](&v4, sel_dealloc);
}

- (SPSchedulerXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SPScheduler queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPScheduler session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE2FE78]);
    -[SPScheduler serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPScheduler setSession:](self, "setSession:", v7);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[SPScheduler serviceDescription](self, "serviceDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "machService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_215909000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "SPScheduler: Establishing XPC connection to %@", (uint8_t *)&v14, 0xCu);

    }
    -[SPScheduler session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
  -[SPScheduler session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "proxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPSchedulerXPCProtocol *)v12;
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DEEB98);
}

- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke;
  activity_block[3] = &unk_24D3B6E50;
  activity_block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_215909000, "SPScheduler schedulePublishWakeWithInformation", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke(id *a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke_2;
  v3[3] = &unk_24D3B6E28;
  objc_copyWeak(&v6, &location);
  v4 = a1[5];
  v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schedulePublishWakeWithInformation:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)publishImmediatelyWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke;
  activity_block[3] = &unk_24D3B6EA0;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215909000, "SPScheduler publishImmediatelyWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke_2;
  block[3] = &unk_24D3B6E78;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishImmediatelyWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

@end
