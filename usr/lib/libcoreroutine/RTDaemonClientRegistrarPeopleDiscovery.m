@implementation RTDaemonClientRegistrarPeopleDiscovery

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTDaemonClientRegistrarPeopleDiscovery)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPeopleDiscoveryProvider_queue_);
}

- (RTDaemonClientRegistrarPeopleDiscovery)initWithPeopleDiscoveryProvider:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  RTDaemonClientRegistrarPeopleDiscovery *v9;
  RTDaemonClientRegistrarPeopleDiscovery *v10;
  RTInvocationDispatcher *v11;
  RTInvocationDispatcher *dispatcher;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTDaemonClientRegistrarPeopleDiscovery;
  v9 = -[RTDaemonClientRegistrarPeopleDiscovery init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_peopleDiscoveryProvider, a3);
    v11 = -[RTInvocationDispatcher initWithQueue:]([RTInvocationDispatcher alloc], "initWithQueue:", v10->_queue);
    dispatcher = v10->_dispatcher;
    v10->_dispatcher = v11;

  }
  return v10;
}

- (RTDaemonClientRegistrarPeopleDiscovery)initWithCoder:(id)a3
{
  id v4;
  RTDaemonClientRegistrarPeopleDiscovery *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  uint64_t v8;
  RTPeopleDiscoveryServiceConfiguration *configuration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTDaemonClientRegistrarPeopleDiscovery;
  v5 = -[RTDaemonClientRegistrar initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v8 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (RTPeopleDiscoveryServiceConfiguration *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTDaemonClientRegistrarPeopleDiscovery;
  v4 = a3;
  -[RTDaemonClientRegistrar encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startMonitoringForPeopleDiscoveryWithIdentifier:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  RTPeopleDiscoveryProvider *peopleDiscoveryProvider;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  RTDaemonClientRegistrarPeopleDiscovery *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (-[RTDaemonClientRegistrarPeopleDiscovery invocationsPending](self, "invocationsPending"))
  {
    -[RTDaemonClientRegistrarPeopleDiscovery dispatcher](self, "dispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dispatchPendingInvocations");

  }
  objc_msgSend(v8, "densityCallbackConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
    +[RTNotification notificationName](RTPeopleDensityUpdateNotification, "notificationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier addObserver:selector:name:](peopleDiscoveryProvider, "addObserver:selector:name:", self, sel_onPeopleDensityUpdateNotification_, v12);

  }
  -[RTPeopleDiscoveryProvider addClient:withIdentifier:withConfiguration:](self->_peopleDiscoveryProvider, "addClient:withIdentifier:withConfiguration:", self, v7, v8);
  objc_storeStrong((id *)&self->_configuration, a4);
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 138412802;
    v15 = v8;
    v16 = 2112;
    v17 = self;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "received service configuration %@ for client %@ using identifier %@", (uint8_t *)&v14, 0x20u);
  }

}

- (void)onPeopleDensityUpdateNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  RTDaemonClientRegistrarPeopleDiscovery *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__RTDaemonClientRegistrarPeopleDiscovery_onPeopleDensityUpdateNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __76__RTDaemonClientRegistrarPeopleDiscovery_onPeopleDensityUpdateNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_onPeopleDensityUpdateNotification:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412802;
      v5 = v3;
      v6 = 2080;
      v7 = "-[RTDaemonClientRegistrarPeopleDiscovery onPeopleDensityUpdateNotification:]_block_invoke";
      v8 = 1024;
      v9 = 98;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "unknown notification with name received, %@ (in %s:%d)", (uint8_t *)&v4, 0x1Cu);

    }
  }
}

- (void)_onPeopleDensityUpdateNotification:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "densityBundles");
    v6 = objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        v9 = 134217984;
        v10 = -[NSObject count](v6, "count");
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "#RTDaemonClientRegistrarPeopleDiscovery, received people density events update, count %lu", (uint8_t *)&v9, 0xCu);
      }

      objc_msgSend(WeakRetained, "peopleDiscoveryRegistrar:didReceivePeopleDensityUpdate:error:", self, v6, 0);
    }
    else
    {
      if (v8)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "received nil people density in notification, returning.", (uint8_t *)&v9, 2u);
      }

      v6 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "no delegate or does not respond to selector, returning", (uint8_t *)&v9, 2u);
    }
  }

}

- (void)stopMonitoringForPeopleDiscovery
{
  RTPeopleDiscoveryProvider *peopleDiscoveryProvider;
  void *v4;

  -[RTInvocationDispatcher removeAllPendingInvocations](self->_dispatcher, "removeAllPendingInvocations");
  -[RTDaemonClientRegistrarPeopleDiscovery setConfiguration:](self, "setConfiguration:", 0);
  peopleDiscoveryProvider = self->_peopleDiscoveryProvider;
  +[RTNotification notificationName](RTPeopleDensityUpdateNotification, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier removeObserver:fromNotification:](peopleDiscoveryProvider, "removeObserver:fromNotification:", self, v4);

  -[RTPeopleDiscoveryProvider removeClient:](self->_peopleDiscoveryProvider, "removeClient:", self->_clientIdentifier);
}

- (void)addPendingPeopleDensityUpdateBlock:(id)a3 failBlock:(id)a4 description:(id)a5
{
  -[RTInvocationDispatcher enqueueBlock:failureBlock:description:](self->_dispatcher, "enqueueBlock:failureBlock:description:", a3, a4, CFSTR("%@"), a5);
}

- (int64_t)countOfPendingInvocations
{
  return -[RTInvocationDispatcher countOfPendingInvocations](self->_dispatcher, "countOfPendingInvocations");
}

- (BOOL)invocationsPending
{
  return -[RTInvocationDispatcher countOfPendingInvocations](self->_dispatcher, "countOfPendingInvocations") != 0;
}

- (BOOL)registered
{
  return self->_configuration != 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTPeopleDiscoveryServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RTDaemonClientRegistrarPeopleDiscoveryProtocol)delegate
{
  return (RTDaemonClientRegistrarPeopleDiscoveryProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (RTPeopleDiscoveryProvider)peopleDiscoveryProvider
{
  return self->_peopleDiscoveryProvider;
}

- (void)setPeopleDiscoveryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_peopleDiscoveryProvider, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
