@implementation SVXMyriadDeviceManager

- (SVXMyriadDeviceManager)initWithInstanceContext:(id)a3 analytics:(id)a4 preferences:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SVXMyriadDeviceManager *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *analyticsQueue;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SVXMyriadDeviceManager;
  v14 = -[SVXMyriadDeviceManager init](&v25, sel_init);
  if (v14)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    if (SVXDispatchRootQueueGetHighPriority_onceToken != -1)
      dispatch_once(&SVXDispatchRootQueueGetHighPriority_onceToken, &__block_literal_global_4545);
    v17 = (id)SVXDispatchRootQueueGetHighPriority_queue;
    v18 = dispatch_queue_create_with_target_V2("com.apple.SiriHeadlessService.myriadproxy", v16, v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = dispatch_queue_create("com.apple.SiriHeadlessService.myriadproxy.analytics", v21);
    analyticsQueue = v14->_analyticsQueue;
    v14->_analyticsQueue = (OS_dispatch_queue *)v22;

    -[SVXMyriadDeviceManager _initializeMyriadDeviceWithInstanceContext:analytics:preferences:delegate:workQueue:analyticsQueue:](v14, "_initializeMyriadDeviceWithInstanceContext:analytics:preferences:delegate:workQueue:analyticsQueue:", v10, v11, v12, v13, v14->_queue, v14->_analyticsQueue);
  }

  return v14;
}

- (void)_initializeMyriadDeviceWithInstanceContext:(id)a3 analytics:(id)a4 preferences:(id)a5 delegate:(id)a6 workQueue:(id)a7 analyticsQueue:(id)a8
{
  id v10;
  id v11;
  NSObject *v12;
  SVXMyriadHostDevice *v13;
  SVXMyriadRequestDelegate *device;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = a7;
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[SVXMyriadDeviceManager _initializeMyriadDeviceWithInstanceContext:analytics:preferences:delegate:workQueue:analyticsQueue:]";
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s #myriad Initializing Myriad on host device", (uint8_t *)&v15, 0xCu);
  }
  v13 = -[SVXMyriadHostDevice initWithDelegate:queue:]([SVXMyriadHostDevice alloc], "initWithDelegate:queue:", v10, v11);
  device = self->_device;
  self->_device = (SVXMyriadRequestDelegate *)v13;

}

- (void)startAdvertising:(unint64_t)a3 withMyriadGoodnessScoreContext:(id)a4 withMyriadAudioContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[SVXMyriadDeviceManager startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:]";
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v15, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
  {
    v14 = *MEMORY[0x24BE08FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD8], OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[SVXMyriadDeviceManager startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:]";
      _os_log_error_impl(&dword_214934000, v14, OS_LOG_TYPE_ERROR, "%s Unexpected call to startAdvertising:withMyriadGoodnessScoreContext:... with SCDA enabled", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    -[SVXMyriadRequestDelegate startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:](self->_device, "startAdvertising:withMyriadGoodnessScoreContext:withMyriadAudioContext:completion:", a3, v10, v11, v12);
  }

}

- (void)startAdvertising:(unint64_t)a3 withSCDAGoodnessScoreContext:(id)a4 withSCDAAudioContext:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v15 = 136315138;
    v16 = "-[SVXMyriadDeviceManager startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:]";
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v15, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x24BE091E0], "isSCDAFrameworkEnabled"))
  {
    -[SVXMyriadRequestDelegate startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:](self->_device, "startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:", a3, v10, v11, v12);
  }
  else
  {
    v14 = *MEMORY[0x24BE08FD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FD8], OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[SVXMyriadDeviceManager startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:]";
      _os_log_error_impl(&dword_214934000, v14, OS_LOG_TYPE_ERROR, "%s Unexpected call to startAdvertising:withSCDAGoodnessScoreContext:... with SCDA disabled", (uint8_t *)&v15, 0xCu);
    }
  }

}

- (void)preheatMyriad
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXMyriadDeviceManager preheatMyriad]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v4, 0xCu);
  }
  -[SVXMyriadRequestDelegate preheatMyriad](self->_device, "preheatMyriad");
}

- (void)resetMyriad
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXMyriadDeviceManager resetMyriad]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v4, 0xCu);
  }
  -[SVXMyriadRequestDelegate resetMyriad](self->_device, "resetMyriad");
}

- (void)setupEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SVXMyriadDeviceManager setupEnabled:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[SVXMyriadRequestDelegate setupEnabled:](self->_device, "setupEnabled:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
