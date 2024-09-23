@implementation _FindableDeviceAlgorithmsContainer

- (_FindableDeviceAlgorithmsContainer)initWithToken:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  _FindableDeviceAlgorithmsContainer *v12;
  NSUUID *v13;
  NSUUID *containerIdentifier;
  NIServerAnalyticsManager *v15;
  NIServerAnalyticsManager *analyticsManager;
  NINearbyUpdatesEngine *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NIServerAnalyticsManager *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  NINearbyUpdatesEngine *v26;
  id v27;
  NINearbyUpdatesEngine *updatesEngine;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  id v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_FindableDeviceAlgorithmsContainer;
  v12 = -[_FindableDeviceAlgorithmsContainer init](&v36, "init");
  if (v12)
  {
    v13 = objc_opt_new(NSUUID);
    containerIdentifier = v12->_containerIdentifier;
    v12->_containerIdentifier = v13;

    objc_storeStrong((id *)&v12->_token, a3);
    v15 = -[NIServerAnalyticsManager initWithBundleIdentifier:]([NIServerAnalyticsManager alloc], "initWithBundleIdentifier:", CFSTR("nearbyd"));
    analyticsManager = v12->_analyticsManager;
    v12->_analyticsManager = v15;

    v12->_currentSolutionMacAddress = 0;
    v17 = [NINearbyUpdatesEngine alloc];
    v19 = objc_msgSend((id)objc_opt_class(v12, v18), "configurationForContainerObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = v12->_analyticsManager;
    v22 = sub_1002CA108();
    v23 = (std::__shared_weak_count *)v22[21];
    v34 = v22[20];
    v35 = v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
    }
    v33 = 0;
    v26 = -[NINearbyUpdatesEngine initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:](v17, "initWithConfiguration:queue:delegate:dataSource:analyticsManager:protobufLogger:error:", v20, v10, v11, v12, v21, &v34, &v33);
    v27 = v33;
    updatesEngine = v12->_updatesEngine;
    v12->_updatesEngine = v26;

    v29 = v35;
    if (v35)
    {
      v30 = (unint64_t *)&v35->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

    if (v27 && os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
      sub_1003D7BF0();

  }
  return v12;
}

- (void)invalidate
{
  -[NINearbyUpdatesEngine invalidate](self->_updatesEngine, "invalidate");
}

+ (id)configurationForContainerObjects
{
  if (qword_100857ED8 != -1)
    dispatch_once(&qword_100857ED8, &stru_10080C9B8);
  return (id)qword_100857ED0;
}

- (id)discoveryTokenFromIdentifier:(unint64_t)a3
{
  return self->_token;
}

- (optional<unsigned)identifierFromDiscoveryToken:(id)a3
{
  unint64_t currentSolutionMacAddress;
  _BOOL8 v4;
  optional<unsigned long long> result;

  currentSolutionMacAddress = self->_currentSolutionMacAddress;
  v4 = 1;
  result.__engaged_ = v4;
  result.var0 = ($BEC950A715106DE229A2E4BA1089E24D)currentSolutionMacAddress;
  return result;
}

- (id)objectFromIdentifier:(unint64_t)a3
{
  return -[NINearbyObject initWithToken:]([NINearbyObject alloc], "initWithToken:", self->_token);
}

- (basic_string<char,)uniqueIdentifierForEngine:(std::allocator<char>> *__return_ptr)retstr
{
  uint64_t v1;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  id v4;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v1 + 16), "UUIDString")));
  sub_10000BF04(retstr, (char *)objc_msgSend(v4, "UTF8String"));

  return result;
}

- (NINearbyUpdatesEngine)updatesEngine
{
  return (NINearbyUpdatesEngine *)objc_getProperty(self, a2, 24, 1);
}

- (NIServerAnalyticsManager)analyticsManager
{
  return (NIServerAnalyticsManager *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)currentSolutionMacAddress
{
  return self->_currentSolutionMacAddress;
}

- (void)setCurrentSolutionMacAddress:(unint64_t)a3
{
  self->_currentSolutionMacAddress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_updatesEngine, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
