@implementation REEngineLocationManager

- (REEngineLocationManager)initWithRelevanceEngine:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  REEngineLocationManager *v8;
  REEngineLocationManager *v9;
  uint64_t v10;
  RELocationManager *simulatedLocationManager;
  void *v12;
  void *v13;
  uint64_t v14;
  REObserverStore *observers;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)REEngineLocationManager;
  v8 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v18, sel_initWithRelevanceEngine_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locationManager, a4);
    if (_fetchedInternalBuildOnceToken_4 != -1)
      dispatch_once(&_fetchedInternalBuildOnceToken_4, &__block_literal_global_47);
    if (_isInternalDevice_4)
    {
      +[RELocationManager simulatedLocationManager](RELocationManager, "simulatedLocationManager");
      v10 = objc_claimAutoreleasedReturnValue();
      simulatedLocationManager = v9->_simulatedLocationManager;
      v9->_simulatedLocationManager = (RELocationManager *)v10;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__beginTraining, CFSTR("RETrainingSimulationCoordinatorDidBeginTraining"), 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObserver:selector:name:object:", v9, sel__endTraining, CFSTR("RETrainingSimulationCoordinatorDidEndTraining"), 0);

    }
    v14 = objc_opt_new();
    observers = v9->_observers;
    v9->_observers = (REObserverStore *)v14;

    objc_msgSend(v6, "logger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addLoggable:", v9);

  }
  return v9;
}

uint64_t __67__REEngineLocationManager_initWithRelevanceEngine_locationManager___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_4 = result;
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLoggable:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("RETrainingSimulationCoordinatorDidBeginTraining"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("RETrainingSimulationCoordinatorDidEndTraining"), 0);

  v7.receiver = self;
  v7.super_class = (Class)REEngineLocationManager;
  -[RERelevanceEngineSubsystem dealloc](&v7, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[REObserverStore addObserver:](self->_observers, "addObserver:", a3);
  -[REEngineLocationManager _updateLocationStatus](self, "_updateLocationStatus");
}

- (void)removeObserver:(id)a3
{
  -[REObserverStore removeObserver:](self->_observers, "removeObserver:", a3);
  -[REEngineLocationManager _updateLocationStatus](self, "_updateLocationStatus");
}

- (CLLocation)currentLocation
{
  void *v2;
  void *v3;

  -[REEngineLocationManager location](self, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (CLLocation *)v3;
}

- (void)_updateLocationStatus
{
  NSObject *v3;
  _QWORD block[5];

  -[RERelevanceEngineSubsystem queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__REEngineLocationManager__updateLocationStatus__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __48__REEngineLocationManager__updateLocationStatus__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  _BYTE *v4;
  char v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_wantsLocation");
  objc_msgSend(*(id *)(a1 + 32), "_currentLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE **)(a1 + 32);
  if (v2)
  {
    if (!v4[64])
    {
      v6 = v3;
      objc_msgSend(v4, "_beginMonitoringLocationForManager:", v3);
      v5 = 1;
LABEL_6:
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = v5;
      v3 = v6;
    }
  }
  else if (v4[64])
  {
    v6 = v3;
    objc_msgSend(v4, "_stopMonitoringLocationForManager:", v3);
    v5 = 0;
    goto LABEL_6;
  }

}

- (BOOL)_wantsLocation
{
  _BOOL4 v3;

  v3 = -[RERelevanceEngineSubsystem isRunning](self, "isRunning");
  if (v3)
    LOBYTE(v3) = -[REObserverStore count](self->_observers, "count") != 0;
  return v3;
}

- (void)_handleLocationUpdate:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  REEngineLocationManager *v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__REEngineLocationManager__handleLocationUpdate___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__REEngineLocationManager__handleLocationUpdate___block_invoke(uint64_t a1)
{
  id v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "location");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v2)
  {

  }
  else
  {
    v3 = objc_msgSend(v7, "isEqual:", v2);

    if ((v3 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "setLocation:", *(_QWORD *)(a1 + 32));
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 56);
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __49__REEngineLocationManager__handleLocationUpdate___block_invoke_2;
      v8[3] = &unk_24CF8EF78;
      v8[4] = v4;
      objc_msgSend(v5, "enumerateObserversWithBlock:", v8);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "postNotificationName:object:", CFSTR("RESignificantLocationUpdateNotification"), 0);

    }
  }
}

uint64_t __49__REEngineLocationManager__handleLocationUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "locationManagerDidUpdateLocation:", *(_QWORD *)(a1 + 32));
}

- (void)_beginTraining
{
  NSObject *v3;
  _QWORD block[5];

  -[RERelevanceEngineSubsystem queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__REEngineLocationManager__beginTraining__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __41__REEngineLocationManager__beginTraining__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 64))
  {
    objc_msgSend((id)result, "_stopMonitoringLocationForManager:", *(_QWORD *)(result + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_beginMonitoringLocationForManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  }
  return result;
}

- (void)_endTraining
{
  NSObject *v3;
  _QWORD block[5];

  -[RERelevanceEngineSubsystem queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__REEngineLocationManager__endTraining__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __39__REEngineLocationManager__endTraining__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 64))
  {
    objc_msgSend((id)result, "_stopMonitoringLocationForManager:", *(_QWORD *)(result + 48));
    return objc_msgSend(*(id *)(a1 + 32), "_beginMonitoringLocationForManager:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  }
  return result;
}

- (id)_currentLocationManager
{
  int IsCurrentlyActive;
  int *v4;

  IsCurrentlyActive = RETrainingSimulationIsCurrentlyActive();
  v4 = &OBJC_IVAR___REEngineLocationManager__locationManager;
  if (IsCurrentlyActive)
    v4 = &OBJC_IVAR___REEngineLocationManager__simulatedLocationManager;
  return *(id *)((char *)&self->super.super.isa + *v4);
}

- (void)_beginMonitoringLocationForManager:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "currentLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke;
  block[3] = &unk_24CF8AB18;
  block[4] = self;
  v8 = v5;
  v13 = v8;
  dispatch_async(v6, block);

  objc_initWeak(&location, self);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2;
  v9[3] = &unk_24CF8EFA0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "startLocationUpdatesWithHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

uint64_t __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLocationUpdate:", *(_QWORD *)(a1 + 40));
}

void __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    RELogForDomain(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2_cold_1((uint64_t)v6, v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleLocationUpdate:", v5);

}

- (void)_stopMonitoringLocationForManager:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(a3, "stopLocationUpdates");
  -[RERelevanceEngineSubsystem queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__REEngineLocationManager__stopMonitoringLocationForManager___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __61__REEngineLocationManager__stopMonitoringLocationForManager___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLocation:", 0);
}

- (BOOL)monitoringLocation
{
  return self->_monitoringLocation;
}

- (RELocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_simulatedLocationManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __62__REEngineLocationManager__beginMonitoringLocationForManager___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Unable to get location: %@", (uint8_t *)&v2, 0xCu);
}

@end
