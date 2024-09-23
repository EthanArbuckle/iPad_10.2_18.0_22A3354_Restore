@implementation STUDevice

- (STUDevice)initWithPrimitives:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  STUDevice *v10;
  STUDevice *v11;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  objc_super v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "devicePrimitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertyProviders"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crk_firstMatching:", &stru_1000CAAA0));
  if (!v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 48, CFSTR("The device identifier provider was not supplied."));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDevice initWithPrimitives:]"));
    v16 = (objc_class *)objc_opt_class(NSString);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (objc_class *)objc_opt_class(v8);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("STUDevice.m"), 51, CFSTR("expected %@, got %@"), v18, v21);

  }
  v22.receiver = self;
  v22.super_class = (Class)STUDevice;
  v10 = -[STUDevice initWithIdentifier:](&v22, "initWithIdentifier:", v8);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_propertyProviders, v6);

  return v11;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->mObserverCount)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 62, CFSTR("STUDevice cannot be deallocated while clients are still observing changes."));

  }
  v5.receiver = self;
  v5.super_class = (Class)STUDevice;
  -[STUDevice dealloc](&v5, "dealloc");
}

- (void)beginObservingProviders
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice providersByKey](self, "providersByKey", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "addObserver:forKeyPath:options:context:", self, CFSTR("value"), 4, CFSTR("STUDeviceProviderContext"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)endObservingProviders
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice providersByKey](self, "providersByKey", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "removeObserver:forKeyPath:context:", self, CFSTR("value"), CFSTR("STUDeviceProviderContext"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  NSString *v44;
  objc_class *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v11 = a4;
  v12 = v11;
  if (a6 == CFSTR("STUDeviceProviderContext"))
  {
    v13 = v11;
    v14 = objc_opt_class(NSObject);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDevice observeValueForKeyPath:ofObject:change:context:]"));
      v22 = (objc_class *)objc_opt_class(NSObject);
      v23 = NSStringFromClass(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (objc_class *)objc_opt_class(v13);
      v26 = NSStringFromClass(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("STUDevice.m"), 89, CFSTR("expected %@, got %@"), v24, v27);

    }
    v15 = objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___STUDevicePropertyProviding);

    if ((v15 & 1) == 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v29 = v13;
      v30 = objc_opt_class(NSObject);
      if ((objc_opt_isKindOfClass(v29, v30) & 1) == 0)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDevice observeValueForKeyPath:ofObject:change:context:]"));
        v43 = (objc_class *)objc_opt_class(NSObject);
        v44 = NSStringFromClass(v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v45 = (objc_class *)objc_opt_class(v29);
        v46 = NSStringFromClass(v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
        objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("STUDevice.m"), 89, CFSTR("expected %@, got %@"), v48, v47);

      }
      v31 = (objc_class *)objc_opt_class(v29);
      v32 = NSStringFromClass(v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 89, CFSTR("expected view model to conform to %@, “%@” does not"), CFSTR("STUDevicePropertyProviding"), v33);

    }
    v16 = v13;
    v17 = objc_opt_class(NSObject);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[STUDevice observeValueForKeyPath:ofObject:change:context:]"));
      v36 = (objc_class *)objc_opt_class(NSObject);
      v37 = NSStringFromClass(v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v39 = (objc_class *)objc_opt_class(v16);
      v40 = NSStringFromClass(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("STUDevice.m"), 89, CFSTR("expected %@, got %@"), v38, v41);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "value"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "key"));
    -[STUDevice setValue:forKey:](self, "setValue:forKey:", v18, v19);

  }
  else
  {
    v50.receiver = self;
    v50.super_class = (Class)STUDevice;
    -[STUDevice observeValueForKeyPath:ofObject:change:context:](&v50, "observeValueForKeyPath:ofObject:change:context:", a3, v11, a5, a6);
  }

}

- (void)startObservingChanges
{
  unint64_t mObserverCount;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 98, CFSTR("%@ must be called from the main thread"), v14);

  }
  mObserverCount = self->mObserverCount;
  self->mObserverCount = mObserverCount + 1;
  if (!mObserverCount)
  {
    -[STUDevice beginObservingProviders](self, "beginObservingProviders");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice providersByKey](self, "providersByKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v11, "beginUpdating") & 1) != 0)
            objc_msgSend(v11, "beginUpdating");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
}

- (void)stopObservingChanges
{
  unint64_t mObserverCount;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 112, CFSTR("%@ must be called from the main thread"), v15);

  }
  mObserverCount = self->mObserverCount;
  if (!mObserverCount)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 113, CFSTR("Stop observing device changes called more than start observing changes"));

    mObserverCount = self->mObserverCount;
  }
  v5 = mObserverCount - 1;
  self->mObserverCount = v5;
  if (!v5)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice providersByKey](self, "providersByKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v12, "endUpdating") & 1) != 0)
            objc_msgSend(v12, "endUpdating");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    -[STUDevice endObservingProviders](self, "endObservingProviders");
    -[STUDevice nilOutAllProperties](self, "nilOutAllProperties");
  }
}

- (void)nilOutAllProperties
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _UNKNOWN **v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice providersByKey](self, "providersByKey", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice valueForKey:](self, "valueForKey:", v9));
        v11 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          v12 = &off_1000D41E8;
        else
          v12 = 0;
        -[STUDevice setValue:forKey:](self, "setValue:forKey:", v12, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (NSDictionary)providersByKey
{
  NSDictionary *providersByKey;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  providersByKey = self->_providersByKey;
  if (!providersByKey)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice propertyProviders](self, "propertyProviders"));
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &stru_1000CAAE0, 0));
    v6 = self->_providersByKey;
    self->_providersByKey = v5;

    providersByKey = self->_providersByKey;
  }
  return providersByKey;
}

- (void)browseForPickableAirPlayRoutes
{
  NSTimer *mAirPlayBrowseExpirationTimer;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MPAVRoutingController *v8;
  MPAVRoutingController *mRoutingController;
  NSTimer *v10;
  NSTimer *v11;

  mAirPlayBrowseExpirationTimer = self->mAirPlayBrowseExpirationTimer;
  if (mAirPlayBrowseExpirationTimer)
  {
    -[NSTimer invalidate](mAirPlayBrowseExpirationTimer, "invalidate");
  }
  else
  {
    v4 = objc_alloc((Class)MPAVRoutingController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "processName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-routingController"), v6));
    v8 = (MPAVRoutingController *)objc_msgSend(v4, "initWithName:", v7);
    mRoutingController = self->mRoutingController;
    self->mRoutingController = v8;

    -[MPAVRoutingController setDiscoveryMode:](self->mRoutingController, "setDiscoveryMode:", 3);
    -[MPAVRoutingController setDelegate:](self->mRoutingController, "setDelegate:", self);
    -[STUDevice updateAvailableRoutesWithRoutingController:](self, "updateAvailableRoutesWithRoutingController:", self->mRoutingController);
  }
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "airPlayBrowseExpirationTimerDidFire:", 0, 0, 5.0));
  v11 = self->mAirPlayBrowseExpirationTimer;
  self->mAirPlayBrowseExpirationTimer = v10;

}

- (void)airPlayBrowseExpirationTimerDidFire:(id)a3
{
  NSTimer *mAirPlayBrowseExpirationTimer;
  MPAVRoutingController *mRoutingController;

  mAirPlayBrowseExpirationTimer = self->mAirPlayBrowseExpirationTimer;
  self->mAirPlayBrowseExpirationTimer = 0;

  -[MPAVRoutingController setDelegate:](self->mRoutingController, "setDelegate:", 0);
  mRoutingController = self->mRoutingController;
  self->mRoutingController = 0;

  -[STUDevice setAvailableAirPlayRoutes:](self, "setAvailableAirPlayRoutes:", 0);
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevice.m"), 182, CFSTR("%@ must be called from the main thread"), v7);

  }
  -[STUDevice updateAvailableRoutesWithRoutingController:](self, "updateAvailableRoutesWithRoutingController:", v8);

}

- (void)updateAvailableRoutesWithRoutingController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "availableRoutes"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKeyPath:", CFSTR("@distinctUnionOfArrays.stu_routeDescriptions")));

  v5 = (void *)v11;
  if (v11)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice availableAirPlayRoutes](self, "availableAirPlayRoutes"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevice availableAirPlayRoutes](self, "availableAirPlayRoutes"));
      v9 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));

    }
    else
    {
      v9 = 0;
    }

    if (v6 | v9 && (objc_msgSend((id)v9, "isEqual:", v6) & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "allObjects"));
      -[STUDevice setAvailableAirPlayRoutes:](self, "setAvailableAirPlayRoutes:", v10);

    }
    v5 = (void *)v11;
  }

}

- (NSArray)propertyProviders
{
  return self->_propertyProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providersByKey, 0);
  objc_storeStrong((id *)&self->_propertyProviders, 0);
  objc_storeStrong((id *)&self->mRoutingController, 0);
  objc_storeStrong((id *)&self->mAirPlayBrowseExpirationTimer, 0);
}

@end
