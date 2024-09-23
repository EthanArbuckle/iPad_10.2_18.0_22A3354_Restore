@implementation RECoreLocationLocationManager

void __62___RECoreLocationLocationManager_initWithEffectiveBundlePath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_alloc(MEMORY[0x24BDBFA88]);
    v3 = objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), MEMORY[0x24BDAC9B8]);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBFA88], "sharedManager");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setDelegate:");
  }
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 40) + 40));
}

void __41___RECoreLocationLocationManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t result;
  uint64_t v7;
  uint8_t v8[16];

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  RELogForDomain(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "startLocationUpdates", v8, 2u);
  }

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "_startMonitoringSignificantLocationChangesOfDistance:withPowerBudget:", 1, 1000.0);
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v7 + 8))
    return objc_msgSend(*(id *)(v7 + 32), "requestLocation");
  return result;
}

void __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke_24(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentLocation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

uint64_t __53___RECoreLocationLocationManager_stopLocationUpdates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  RELogForDomain(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "stopLocationUpdates", v6, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopMonitoringSignificantLocationChanges");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stopUpdatingLocation");
}

void __69___RECoreLocationLocationManager_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 40);
  v4 = (void *)v3[1];
  v6 = (id)v2;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v4, "distanceFromLocation:", v2);
  if (v5 >= 0.01)
  {
    v3 = *(_QWORD **)(a1 + 40);
    v2 = (uint64_t)v6;
LABEL_4:
    objc_msgSend(v3, "_updateLocation:", v2);
    objc_msgSend(*(id *)(a1 + 40), "_notifyUpdateHandlersWithError:", 0);
  }

}

uint64_t __67___RECoreLocationLocationManager_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLocation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyUpdateHandlersWithError:", *(_QWORD *)(a1 + 40));
}

void __65___RECoreLocationLocationManager__notifyUpdateHandlersWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "currentLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

@end
