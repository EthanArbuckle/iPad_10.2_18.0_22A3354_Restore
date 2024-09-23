@implementation PXLocationStream

- (PXLocationStream)initWithAccuracy:(double)a3 handler:(id)a4
{
  id v7;
  void *v8;
  PXLocationStream *v9;
  PXLocationStream *v10;
  uint64_t v11;
  id handler;
  NSObject *v13;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  objc_super v19;
  uint8_t buf[4];
  PXLocationStream *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a3 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accuracy >= 0.f"));

    if (v8)
      goto LABEL_3;
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)PXLocationStream;
  v9 = -[PXLocationStream init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_state = 0;
    v9->_accuracy = a3;
    v11 = objc_msgSend(v8, "copy");
    handler = v10->_handler;
    v10->_handler = (id)v11;

    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEBUG, "%@ Create.", buf, 0xCu);
    }

    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[PXLocationStream performSelector:withObject:afterDelay:](v10, "performSelector:withObject:afterDelay:", sel__open, 0, 0.0);
    }
    else
    {
      objc_initWeak((id *)buf, v10);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PXLocationStream_initWithAccuracy_handler___block_invoke;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v18, (id *)buf);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[PXLocationStream setClosed:](self, "setClosed:", 1);
  v3.receiver = self;
  v3.super_class = (Class)PXLocationStream;
  -[PXLocationStream dealloc](&v3, sel_dealloc);
}

- (BOOL)isClosed
{
  return self->_state == 2;
}

- (void)setClosed:(BOOL)a3
{
  NSObject *v4;
  void *v6;
  uint8_t buf[4];
  PXLocationStream *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shouldClose"));

  }
  if (!-[PXLocationStream isClosed](self, "isClosed"))
  {
    self->_state = 2;
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ Close.", buf, 0xCu);
    }

    -[PXLocationStream _cleanup](self, "_cleanup");
  }
}

- (void)_open
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  CLLocationManager *v10;
  CLLocationManager *locationManager;
  void *v13;
  uint8_t buf[4];
  PXLocationStream *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXLocationStreamStateInitial == _state"));

  }
  if ((objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled") & 1) == 0)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      v7 = "%@ Unrecoverable failure: Location services are disabled.";
      v8 = v5;
      v9 = 12;
LABEL_11:
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
LABEL_12:

    -[PXLocationStream _closeStreamWithError](self, "_closeStreamWithError");
    return;
  }
  v3 = objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatus");
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 - 1) <= 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "denied";
      if (v3 == 1)
        v6 = "restricted";
      *(_DWORD *)buf = 138412546;
      v15 = self;
      v16 = 2080;
      v17 = v6;
      v7 = "%@ Unrecoverable failure: Authorization status %s.";
      v8 = v5;
      v9 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEBUG, "%@ Opening...", buf, 0xCu);
  }

  v10 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
  locationManager = self->_locationManager;
  self->_locationManager = v10;

  -[CLLocationManager setDistanceFilter:](self->_locationManager, "setDistanceFilter:", self->_accuracy);
  -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", self->_accuracy);
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
}

- (void)_requestAuthorization
{
  NSObject *v3;
  void *v5;
  uint8_t buf[4];
  PXLocationStream *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXLocationStreamStateInitial == _state"));

  }
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%@ Requesting authorization...", buf, 0xCu);
  }

  -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
}

- (void)_requestLocation
{
  NSObject *v3;
  void *v5;
  uint8_t buf[4];
  PXLocationStream *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_state)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXLocationStreamStateInitial == _state"));

  }
  self->_state = 1;
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "%@ Open.", buf, 0xCu);
  }

  -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
}

- (void)_emitLocation:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  PXLocationStream *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_state != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXLocationStreamStateOpen == _state"));

  }
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%@ Emit: %@", buf, 0x16u);
  }

  (*((void (**)(void))self->_handler + 2))();
}

- (void)_closeStreamWithError
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint8_t buf[4];
  PXLocationStream *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[PXLocationStream isClosed](self, "isClosed"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLocationStream.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![self isClosed]"));

  }
  self->_state = 2;
  PLUIGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEBUG, "%@ Close with error.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  (*((void (**)(void))self->_handler + 2))();
  WeakRetained = objc_loadWeakRetained((id *)buf);
  objc_msgSend(WeakRetained, "_cleanup");

  objc_destroyWeak((id *)buf);
}

- (void)_cleanup
{
  id handler;
  CLLocationManager *locationManager;

  handler = self->_handler;
  self->_handler = 0;

  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", 0);
  locationManager = self->_locationManager;
  self->_locationManager = 0;

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PXLocationStream *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEBUG, "%@ CLLocationManager did update locations: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLocationStream _emitLocation:](self, "_emitLocation:", v7);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PXLocationStream *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "%@ CLLocationManager did fail with error: \"%@\", (uint8_t *)&v8, 0x16u);

  }
  -[PXLocationStream _closeStreamWithError](self, "_closeStreamWithError");

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  PXLocationStream *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (a4 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_DescriptionForAuthorizationStatus(CLAuthorizationStatus)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXLocationStream.m"), 27, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v8 = off_1E5143A78[a4];
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "%@ CLLocationManager did change authorization status: %@", (uint8_t *)&v13, 0x16u);
  }

  if ((a4 - 1) < 2)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = "denied";
      if (a4 == 1)
        v10 = "restricted";
      v13 = 138412546;
      v14 = self;
      v15 = 2080;
      v16 = (void *)v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "%@ Unrecoverable failure: Authorization status %s.", (uint8_t *)&v13, 0x16u);
    }

    -[PXLocationStream _closeStreamWithError](self, "_closeStreamWithError");
  }
  else if ((a4 - 3) >= 2)
  {
    if (!a4)
      -[PXLocationStream _requestAuthorization](self, "_requestAuthorization");
  }
  else
  {
    -[PXLocationStream _requestLocation](self, "_requestLocation");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong(&self->_handler, 0);
}

void __45__PXLocationStream_initWithAccuracy_handler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_open");

}

@end
