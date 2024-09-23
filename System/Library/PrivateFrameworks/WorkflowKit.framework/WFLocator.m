@implementation WFLocator

- (WFLocator)initWithWorkflowEnvironment:(int64_t)a3
{
  WFLocator *v4;
  uint64_t v5;
  CLLocationManager *locationManager;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  CLInUseAssertion *inUseAssertion;
  WFLocator *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFLocator;
  v4 = -[WFLocator init](&v13, sel_init);
  if (v4)
  {
    WFCLLocationManagerWithOptions(a3, v4, MEMORY[0x1E0C80D38]);
    v5 = objc_claimAutoreleasedReturnValue();
    locationManager = v4->_locationManager;
    v4->_locationManager = (CLLocationManager *)v5;

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFCLInUseAssertionWithOptions(a3, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    inUseAssertion = v4->_inUseAssertion;
    v4->_inUseAssertion = (CLInUseAssertion *)v9;

    v11 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  -[CLInUseAssertion invalidate](self->_inUseAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WFLocator;
  -[WFLocator dealloc](&v3, sel_dealloc);
}

- (BOOL)useRequestLocation
{
  return 1;
}

- (void)start
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFWFLocatorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[WFLocator start]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting locator...", (uint8_t *)&v4, 0xCu);
  }

  if (-[WFLocator useRequestLocation](self, "useRequestLocation"))
    -[WFLocator requestLocation](self, "requestLocation");
  else
    -[WFLocator startUpdatingLocation](self, "startUpdatingLocation");
}

- (void)requestLocation
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFWFLocatorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFLocator requestLocation]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s requestLocation", (uint8_t *)&v5, 0xCu);
  }

  -[WFLocator locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestLocation");

}

- (void)startUpdatingLocation
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFWFLocatorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[WFLocator startUpdatingLocation]";
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s startUpdatingLocation", (uint8_t *)&v5, 0xCu);
  }

  -[WFLocator locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startUpdatingLocation");

  -[WFLocator timeout](self, "timeout");
  -[WFLocator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_finishUpdatingLocation, 0);
}

- (void)finishUpdatingLocation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  __CFString *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  getWFWFLocatorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WFLocator completionHandler](self, "completionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFLocator finishUpdatingLocation]";
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1C15B3000, v3, OS_LOG_TYPE_DEFAULT, "%s finishing with completion handler: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_finishUpdatingLocation, 0);
  -[WFLocator locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopUpdatingLocation");

  -[WFLocator locationManager](self, "locationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", 0);

  -[WFLocator setLocationManager:](self, "setLocationManager:", 0);
  -[WFLocator completionHandler](self, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFLocator bestEffortLocation](self, "bestEffortLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WFLocator completionHandler](self, "completionHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v10)[2](v10, v9, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasCapability:", *MEMORY[0x1E0DC80E8]))
        v12 = CFSTR("Make sure your device isn’t in Airplane Mode and try again; turning WLAN on may help.");
      else
        v12 = CFSTR("Make sure your device isn’t in Airplane Mode and try again; turning Wi-Fi on may help.");
      WFLocalizedString(v12);
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

      -[WFLocator completionHandler](self, "completionHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB35C8];
      getkCLErrorDomain();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = *MEMORY[0x1E0CB2D68];
      WFLocalizedString(CFSTR("Shortcuts was unable to find your current location."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = *MEMORY[0x1E0CB2D50];
      v20[0] = v16;
      v20[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v17, v19[0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v18);

    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  _BOOL4 v29;
  int v30;
  const char *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFWFLocatorLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136315394;
    v31 = "-[WFLocator locationManager:didUpdateLocations:]";
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s did update with locations: %@", (uint8_t *)&v30, 0x16u);
  }

  objc_msgSend(v7, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFLocator useRequestLocation](self, "useRequestLocation"))
  {
    -[WFLocator setBestEffortLocation:](self, "setBestEffortLocation:", v9);
LABEL_5:
    -[WFLocator finishUpdatingLocation](self, "finishUpdatingLocation");
    goto LABEL_25;
  }
  objc_msgSend(v9, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = -v11;

  -[WFLocator timeout](self, "timeout");
  if (v13 < v12)
  {
    getWFWFLocatorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315138;
      v31 = "-[WFLocator locationManager:didUpdateLocations:]";
      v15 = "%s Ignoring location update due to stale location age";
LABEL_23:
      _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v30, 0xCu);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  objc_msgSend(v9, "horizontalAccuracy");
  if (v16 < 0.0)
  {
    getWFWFLocatorLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 136315138;
      v31 = "-[WFLocator locationManager:didUpdateLocations:]";
      v15 = "%s Ignoring location update since horizontal accuracy < 0";
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  -[WFLocator bestEffortLocation](self, "bestEffortLocation");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[WFLocator bestEffortLocation](self, "bestEffortLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "horizontalAccuracy");
    v21 = v20;
    objc_msgSend(v9, "horizontalAccuracy");
    v23 = v22;

    if (v21 <= v23)
    {
      getWFWFLocatorLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 136315138;
        v31 = "-[WFLocator locationManager:didUpdateLocations:]";
        v15 = "%s Dropping due to bad accuracy / not having a best effort location";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  -[WFLocator setBestEffortLocation:](self, "setBestEffortLocation:", v9);
  objc_msgSend(v9, "horizontalAccuracy");
  v25 = v24;
  objc_msgSend(v6, "desiredAccuracy");
  v27 = v26;
  getWFWFLocatorLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v25 <= v27)
  {
    if (v29)
    {
      v30 = 136315138;
      v31 = "-[WFLocator locationManager:didUpdateLocations:]";
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Location is within desired accuracy, will finish", (uint8_t *)&v30, 0xCu);
    }

    goto LABEL_5;
  }
  if (v29)
  {
    v30 = 136315138;
    v31 = "-[WFLocator locationManager:didUpdateLocations:]";
    _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_DEFAULT, "%s Location is not within desired accuracy, dropping", (uint8_t *)&v30, 0xCu);
  }

LABEL_25:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getkCLErrorDomain();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", v7))
  {

LABEL_7:
    getWFWFLocatorLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[WFLocator locationManager:didFailWithError:]";
      v17 = 2112;
      v18 = v5;
      v12 = "%s Locator failed with unknown location error (%@) — finishing";
      v13 = v10;
      v14 = 22;
      goto LABEL_9;
    }
LABEL_10:

    -[WFLocator finishUpdatingLocation](self, "finishUpdatingLocation");
    goto LABEL_11;
  }
  v8 = objc_msgSend(v5, "code");

  if (v8)
    goto LABEL_7;
  v9 = -[WFLocator useRequestLocation](self, "useRequestLocation");
  getWFWFLocatorLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      v15 = 136315138;
      v16 = "-[WFLocator locationManager:didFailWithError:]";
      v12 = "%s Locator failed with unknown location error — since we're using request location, finishing...";
      v13 = v10;
      v14 = 12;
LABEL_9:
      _os_log_impl(&dword_1C15B3000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v11)
  {
    v15 = 136315138;
    v16 = "-[WFLocator locationManager:didFailWithError:]";
    _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_DEFAULT, "%s Locator failed with unknown location error — CoreLocation will continue trying to find a location", (uint8_t *)&v15, 0xCu);
  }

LABEL_11:
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (void)setInUseAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_inUseAssertion, a3);
}

- (CLLocation)bestEffortLocation
{
  return self->_bestEffortLocation;
}

- (void)setBestEffortLocation:(id)a3
{
  objc_storeStrong((id *)&self->_bestEffortLocation, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_bestEffortLocation, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 completion:(id)a4
{
  id v6;

  v6 = a4;
  getkCLLocationAccuracyNearestTenMeters();
  objc_msgSend(a1, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", a3, v6);

}

+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 desiredAccuracy:(double)a4 completion:(id)a5
{
  objc_msgSend(a1, "determineLocationWithWorkflowEnvironment:desiredAccuracy:timeout:completion:", a3, a5, a4, 5.0);
}

+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 desiredAccuracy:(double)a4 timeout:(double)a5 completion:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;
  double v14;
  double v15;

  v9 = a6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke;
  v11[3] = &unk_1E7AF5AB0;
  v14 = a4;
  v15 = a5;
  v12 = v9;
  v13 = a3;
  v10 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke(uint64_t a1)
{
  WFLocator *v2;
  double v3;
  void *v4;
  WFLocator *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[5];
  WFLocator *v13;

  v2 = -[WFLocator initWithWorkflowEnvironment:]([WFLocator alloc], "initWithWorkflowEnvironment:", *(_QWORD *)(a1 + 40));
  v3 = *(double *)(a1 + 48);
  -[WFLocator locationManager](v2, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDesiredAccuracy:", v3);

  -[WFLocator setTimeout:](v2, "setTimeout:", *(double *)(a1 + 56));
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__51146;
  v12[4] = __Block_byref_object_dispose__51147;
  v5 = v2;
  v13 = v5;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke_13;
  v9 = &unk_1E7AF5A88;
  v10 = *(id *)(a1 + 32);
  v11 = v12;
  -[WFLocator setCompletionHandler:](v5, "setCompletionHandler:", &v6);
  -[WFLocator start](v5, "start", v6, v7, v8, v9);

  _Block_object_dispose(v12, 8);
}

void __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

@end
