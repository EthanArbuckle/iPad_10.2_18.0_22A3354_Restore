@implementation VGDataCoordinator

- (VGDataCoordinator)initWithApplicationFinder:(id)a3 externalAccessory:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  VGDataCoordinator *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *delegateQueue;
  uint64_t v19;
  NSMutableArray *unpairedVehicles;
  uint64_t v21;
  NSMutableSet *observedVehicles;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)VGDataCoordinator;
  v12 = -[VGDataCoordinator init](&v24, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("VGDataCoordinator.WorkQueue", v13);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("VGDataCoordinator.DelegateQueue", v16);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    unpairedVehicles = v12->_unpairedVehicles;
    v12->_unpairedVehicles = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    observedVehicles = v12->_observedVehicles;
    v12->_observedVehicles = (NSMutableSet *)v21;

    objc_storeStrong((id *)&v12->_applicationFinder, a3);
    -[VGOEMApplicationFinding setDelegate:](v12->_applicationFinder, "setDelegate:", v12);
    -[VGOEMApplicationFinding findOEMApplications](v12->_applicationFinder, "findOEMApplications");
    objc_storeStrong((id *)&v12->_accessory, a4);
    -[VGExternalAccessory setAccessoryUpdateDelegate:](v12->_accessory, "setAccessoryUpdateDelegate:", v12);
    -[VGDataCoordinator _loadIapVehicles](v12, "_loadIapVehicles");
  }

  return v12;
}

- (void)_loadIapVehicles
{
  char BOOL;
  NSObject *v4;
  _BOOL4 v5;
  VGExternalAccessory *accessory;
  _QWORD v7[5];
  uint8_t buf[16];

  BOOL = GEOConfigGetBOOL();
  VGGetDataCoordinatorLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if ((BOOL & 1) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "_loadIapVehicles: Loading iAP2 vehicles.", buf, 2u);
    }

    accessory = self->_accessory;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__VGDataCoordinator__loadIapVehicles__block_invoke;
    v7[3] = &unk_24C2FB468;
    v7[4] = self;
    -[VGExternalAccessory listCarsWithCompletion:](accessory, "listCarsWithCompletion:", v7);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "_loadIapVehicles: iap2 onboarding is disabled. Will not load iap2 vehicles.", buf, 2u);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[VGDataCoordinator _invalidateRefreshTimer](self, "_invalidateRefreshTimer");
  v3.receiver = self;
  v3.super_class = (Class)VGDataCoordinator;
  -[VGDataCoordinator dealloc](&v3, sel_dealloc);
}

- (NSArray)unpairedVehicles
{
  NSObject *workQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__VGDataCoordinator_unpairedVehicles__block_invoke;
  v5[3] = &unk_24C2FB240;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __37__VGDataCoordinator_unpairedVehicles__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)deviceIdentifier
{
  NSString *deviceIdentifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSObject *v7;
  NSString *v8;
  int v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  deviceIdentifier = self->_deviceIdentifier;
  if (!deviceIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceIdentifierForVendor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

    VGGetDataCoordinatorLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_DEFAULT, "loaded device identifier as: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = self->_deviceIdentifier;
    self->_deviceIdentifier = v6;

    deviceIdentifier = self->_deviceIdentifier;
  }
  return deviceIdentifier;
}

- (double)_vehicleStateRefreshInterval
{
  double result;

  GEOConfigGetDouble();
  return result;
}

- (void)forceFetchAllVehicles
{
  NSObject *v3;
  NSObject *workQueue;
  _QWORD block[4];
  id v6;
  id buf[2];

  VGGetDataCoordinatorLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "forceFetchAllVehicles: will reload all SI and iAP2 vehicles", (uint8_t *)buf, 2u);
  }

  -[VGDataCoordinator _loadIapVehicles](self, "_loadIapVehicles");
  -[VGOEMApplicationFinding findOEMApplications](self->_applicationFinder, "findOEMApplications");
  objc_initWeak(buf, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__VGDataCoordinator_forceFetchAllVehicles__block_invoke;
  block[3] = &unk_24C2FB268;
  objc_copyWeak(&v6, buf);
  dispatch_async(workQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __42__VGDataCoordinator_forceFetchAllVehicles__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_loadAllOEMVehiclesForApps:completion:", WeakRetained[5], &__block_literal_global_1);
  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[VGDataCoordinator forceFetchAllVehicles]_block_invoke";
      v6 = 1024;
      v7 = 128;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }

  }
}

void __42__VGDataCoordinator_forceFetchAllVehicles__block_invoke_7()
{
  NSObject *v0;
  uint8_t v1[16];

  VGGetDataCoordinatorLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20A329000, v0, OS_LOG_TYPE_INFO, "forceFetchAllVehicles: finished reloading vehicles", v1, 2u);
  }

}

- (void)_updateGarageWithVehicle:(id)a3 syncAcrossDevices:(BOOL)a4
{
  NSObject *v7;
  NSObject *v8;
  char *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *delegateQueue;
  unint64_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  NSMutableArray *v23;
  NSMutableArray *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  id v33;
  __CFString *v34;
  void *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  __CFString *v39;
  NSMutableArray *v40;
  NSMutableArray *v41;
  void *v42;
  NSMutableArray *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  id v50;
  __CFString *v51;
  void *v52;
  void *v53;
  NSMutableArray *v54;
  void *v55;
  char *v56;
  NSObject *v57;
  void *v58;
  NSMutableArray *v59;
  const char *v60;
  void *v61;
  NSMutableArray *v62;
  NSMutableArray *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  _QWORD v67[4];
  NSObject *v68;
  VGDataCoordinator *v69;
  _QWORD v70[4];
  NSObject *v71;
  VGDataCoordinator *v72;
  _QWORD block[4];
  NSObject *v74;
  VGDataCoordinator *v75;
  NSObject *v76;
  BOOL v77;
  NSObject *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  NSObject *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  VGGetVirtualGarageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v84 = v9;
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = WeakRetained;
    if (WeakRetained)
    {
      v78 = v7;
      objc_msgSend(WeakRetained, "vehicles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[VGVehicleDeduper actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:](VGVehicleDeduper, "actionForAddingNewVehicle:withExistingGarageVehicles:andUnpairedVehicles:", &v78, v12, self->_unpairedVehicles);
      v14 = v78;

      switch(v13)
      {
        case 0:
          VGGetDataCoordinatorLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: No action to update the garage with.", buf, 2u);
          }
          break;
        case 1:
          VGGetDataCoordinatorLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v84 = (const char *)v14;
            _os_log_impl(&dword_20A329000, v16, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: Updating a vehicle in VG :%@.", buf, 0xCu);
          }

          delegateQueue = self->_delegateQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke;
          block[3] = &unk_24C2FB290;
          v74 = v11;
          v75 = self;
          v14 = v14;
          v76 = v14;
          v77 = a4;
          dispatch_async(delegateQueue, block);

          v15 = v74;
          break;
        case 2:
          v18 = -[VGDataCoordinator _indexOfVehicleInUnpairedVehicles:](self, "_indexOfVehicleInUnpairedVehicles:", v14);
          VGGetDataCoordinatorLog();
          v19 = objc_claimAutoreleasedReturnValue();
          v15 = v19;
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v84 = (const char *)v14;
              _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: Found a new vehicle. Saving vehicle in dataCoordinator until it's onboarded through UI. Vehicle: :%@.", buf, 0xCu);
            }

            -[NSMutableArray addObject:](self->_unpairedVehicles, "addObject:", v14);
            v20 = self->_delegateQueue;
            v67[0] = MEMORY[0x24BDAC760];
            v67[1] = 3221225472;
            v67[2] = __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_10;
            v67[3] = &unk_24C2FB2B8;
            v68 = v11;
            v69 = self;
            dispatch_async(v20, v67);
            v15 = v68;
            break;
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            break;
          v40 = self->_unpairedVehicles;
          v41 = v40;
          if (v40)
          {
            if (-[NSMutableArray count](v40, "count"))
            {
              v65 = v14;
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v41, "count"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              v82 = 0u;
              v63 = v41;
              v43 = v41;
              v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v80;
                do
                {
                  for (i = 0; i != v45; ++i)
                  {
                    if (*(_QWORD *)v80 != v46)
                      objc_enumerationMutation(v43);
                    v48 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
                    if (v48)
                    {
                      v49 = (void *)MEMORY[0x24BDD17C8];
                      v50 = v48;
                      objc_msgSend(v49, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v50);
                      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v51 = CFSTR("<nil>");
                    }
                    objc_msgSend(v42, "addObject:", v51);

                  }
                  v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
                }
                while (v45);
              }

              -[NSMutableArray componentsJoinedByString:](v43, "componentsJoinedByString:", CFSTR(", "));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = (void *)MEMORY[0x24BDD17C8];
              v54 = v43;
              objc_msgSend(v53, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v53, "stringWithFormat:", CFSTR("%@ [%@]"), v55, v52);
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

              v14 = v65;
              v41 = v63;
            }
            else
            {
              v61 = (void *)MEMORY[0x24BDD17C8];
              v62 = v41;
              objc_msgSend(v61, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v62);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v61, "stringWithFormat:", CFSTR("%@ (empty)"), v42);
              v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

          }
          else
          {
            v39 = CFSTR("<nil>");
          }

          *(_DWORD *)buf = 138412546;
          v84 = (const char *)v39;
          v85 = 2112;
          v86 = v14;
          v60 = "_updateGarageWithVehicle: Tried to add unpaired vehicle, but it already exists in the array: %@, vehicle: %@";
          goto LABEL_60;
        case 3:
          v21 = -[VGDataCoordinator _indexOfVehicleInUnpairedVehicles:](self, "_indexOfVehicleInUnpairedVehicles:", v14);
          VGGetDataCoordinatorLog();
          v22 = objc_claimAutoreleasedReturnValue();
          v15 = v22;
          if (v21 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              v23 = self->_unpairedVehicles;
              v24 = v23;
              if (v23)
              {
                if (-[NSMutableArray count](v23, "count"))
                {
                  v64 = v14;
                  v66 = v11;
                  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v24, "count"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = 0u;
                  v80 = 0u;
                  v81 = 0u;
                  v82 = 0u;
                  v26 = v24;
                  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
                  if (v27)
                  {
                    v28 = v27;
                    v29 = *(_QWORD *)v80;
                    do
                    {
                      for (j = 0; j != v28; ++j)
                      {
                        if (*(_QWORD *)v80 != v29)
                          objc_enumerationMutation(v26);
                        v31 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
                        if (v31)
                        {
                          v32 = (void *)MEMORY[0x24BDD17C8];
                          v33 = v31;
                          objc_msgSend(v32, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v33);
                          v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

                        }
                        else
                        {
                          v34 = CFSTR("<nil>");
                        }
                        objc_msgSend(v25, "addObject:", v34);

                      }
                      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v79, buf, 16);
                    }
                    while (v28);
                  }

                  -[NSMutableArray componentsJoinedByString:](v26, "componentsJoinedByString:", CFSTR(", "));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = (void *)MEMORY[0x24BDD17C8];
                  v37 = v26;
                  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@ [%@]"), v38, v35);
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  v14 = v64;
                  v11 = v66;
                }
                else
                {
                  v58 = (void *)MEMORY[0x24BDD17C8];
                  v59 = v24;
                  objc_msgSend(v58, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v59);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v58, "stringWithFormat:", CFSTR("%@ (empty)"), v25);
                  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }

              }
              else
              {
                v39 = CFSTR("<nil>");
              }

              *(_DWORD *)buf = 138412546;
              v84 = (const char *)v39;
              v85 = 2112;
              v86 = v14;
              v60 = "_updateGarageWithVehicle: didn't find an unpaired vehicle to update in _unpairedVehicles array: %@, vehicle: %@";
LABEL_60:
              _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_FAULT, v60, buf, 0x16u);

            }
          }
          else
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              -[NSMutableArray objectAtIndexedSubscript:](self->_unpairedVehicles, "objectAtIndexedSubscript:", v21);
              v56 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v84 = v56;
              v85 = 2112;
              v86 = v14;
              _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "_updateGarageWithVehicle: Replacing an upaired vehicle with an updated one. existing vehicle: %@, updated vehicle: %@", buf, 0x16u);

            }
            -[NSMutableArray replaceObjectAtIndex:withObject:](self->_unpairedVehicles, "replaceObjectAtIndex:withObject:", v21, v14);
            v57 = self->_delegateQueue;
            v70[0] = MEMORY[0x24BDAC760];
            v70[1] = 3221225472;
            v70[2] = __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_9;
            v70[3] = &unk_24C2FB2B8;
            v71 = v11;
            v72 = self;
            dispatch_async(v57, v70);
            v15 = v71;
          }
          break;
        default:
          goto LABEL_62;
      }
    }
    else
    {
      VGGetVirtualGarageLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v84 = "-[VGDataCoordinator _updateGarageWithVehicle:syncAcrossDevices:]";
        v85 = 1024;
        LODWORD(v86) = 147;
        _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", buf, 0x12u);
      }
      v14 = v7;
    }

LABEL_62:
  }
  else
  {
    VGGetDataCoordinatorLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_INFO, "_updateGarageWithState: tried to update garage with a nil vehicle. No action for the DataCoordinator.", buf, 2u);
    }
  }

}

uint64_t __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataCoordinator:wantsToUpdateVehicle:syncAcrossDevices:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_9(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(v2 + 56), "copy");
  objc_msgSend(v1, "dataCoordinator:didUpdateUnpairedVehicles:", v2, v3);

}

void __64__VGDataCoordinator__updateGarageWithVehicle_syncAcrossDevices___block_invoke_10(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(v2 + 56), "copy");
  objc_msgSend(v1, "dataCoordinator:didUpdateUnpairedVehicles:", v2, v3);

}

- (void)_updateStateOfChargeForVehicle:(id)a3 syncAcrossDevices:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD);
  id v20;
  BOOL v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a5)
    v9 = a5;
  else
    v9 = &__block_literal_global_11;
  v10 = (void (**)(_QWORD))MEMORY[0x20BD239CC](v9);
  -[VGDataCoordinator _vehicleStateProviderForVehicle:](self, "_vehicleStateProviderForVehicle:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  VGGetDataCoordinatorLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v14;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_INFO, "Will update SoC using %@ for vehicle: %@.", buf, 0x16u);

  }
  if (v11)
  {
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_12;
    v16[3] = &unk_24C2FB328;
    objc_copyWeak(&v20, (id *)buf);
    v17 = v8;
    v19 = v10;
    v18 = v11;
    v21 = a4;
    objc_msgSend(v18, "getStateOfChargeForVehicle:completion:", v17, v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    VGGetDataCoordinatorLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "Couldn't update SoC for vehicle: %@, because there was no source.", buf, 0xCu);
    }

    v10[2](v10);
  }

}

void __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_13;
    block[3] = &unk_24C2FB300;
    objc_copyWeak(&v17, (id *)(a1 + 56));
    v12 = v5;
    v13 = *(id *)(a1 + 32);
    v14 = v6;
    v16 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 40);
    v18 = *(_BYTE *)(a1 + 64);
    dispatch_async(v9, block);

    objc_destroyWeak(&v17);
  }
  else
  {
    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[VGDataCoordinator _updateStateOfChargeForVehicle:syncAcrossDevices:completion:]_block_invoke";
      v21 = 1024;
      v22 = 216;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __81__VGDataCoordinator__updateStateOfChargeForVehicle_syncAcrossDevices_completion___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    VGGetDataCoordinatorLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (char *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 32);
        v12 = 138412546;
        v13 = v7;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Received vehicleState and will update vehicle. Source: %@ state: %@.", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 40), "_updateWithVehicleState:", *(_QWORD *)(a1 + 32));
      objc_msgSend(WeakRetained, "_updateGarageWithVehicle:syncAcrossDevices:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80));
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v10 = *(const char **)(a1 + 40);
        v11 = *(_QWORD *)(a1 + 48);
        v12 = 138412546;
        v13 = v10;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "Failed to get vehicleState for vehicle: %@. error: %@", (uint8_t *)&v12, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    VGGetVirtualGarageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[VGDataCoordinator _updateStateOfChargeForVehicle:syncAcrossDevices:completion:]_block_invoke";
      v14 = 1024;
      LODWORD(v15) = 218;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v12, 0x12u);
    }

  }
}

- (unint64_t)_indexOfVehicleInUnpairedVehicles:(id)a3
{
  id v4;
  NSMutableArray *unpairedVehicles;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  unpairedVehicles = self->_unpairedVehicles;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__VGDataCoordinator__indexOfVehicleInUnpairedVehicles___block_invoke;
  v9[3] = &unk_24C2FB168;
  v10 = v4;
  v6 = v4;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](unpairedVehicles, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __55__VGDataCoordinator__indexOfVehicleInUnpairedVehicles___block_invoke(uint64_t a1, void *a2)
{
  return VGVehiclesHaveMatchingVehicleStateProviders(*(void **)(a1 + 32), a2);
}

- (id)_vehicleStateProviderForVehicle:(id)a3
{
  id v4;
  VGExternalAccessory *v5;
  VGExternalAccessory *v6;
  VGExternalAccessory *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[VGExternalAccessory isConnectedToVehicle:](self->_accessory, "isConnectedToVehicle:", v4))
  {
    v5 = self->_accessory;
  }
  else
  {
    -[VGDataCoordinator _applicationForVehicle:](self, "_applicationForVehicle:", v4);
    v5 = (VGExternalAccessory *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v5 && (-[VGExternalAccessory conformsToProtocol:](v5, "conformsToProtocol:", &unk_2545FB0A8) & 1) == 0)
  {
    VGGetDataCoordinatorLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_FAULT, "vehicleStateProvider: %@ does not conform to VGVehicleStateProviding", (uint8_t *)&v12, 0xCu);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (void)finishOnboardingVehicle:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  VGDataCoordinator *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke;
  v7[3] = &unk_24C2FB378;
  objc_copyWeak(&v10, &location);
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(workQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  const char *v31;
  id v32;
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[VGDataCoordinator finishOnboardingVehicle:]_block_invoke";
      v40 = 1024;
      LODWORD(v41) = 264;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
    goto LABEL_28;
  }
  VGGetDataCoordinatorLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "finishOnboardingVehicle: will update and remove vehicle: %@ from unpairedVehicles.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_saveOnboardingInfoForVehicle:", *(_QWORD *)(a1 + 32));
  v5 = objc_msgSend(WeakRetained, "_indexOfVehicleInUnpairedVehicles:", *(_QWORD *)(a1 + 32));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    VGGetDataCoordinatorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(const char **)(a1 + 32);
      v8 = *((id *)WeakRetained + 7);
      v9 = v8;
      if (v8)
      {
        if (objc_msgSend(v8, "count"))
        {
          v31 = v7;
          v32 = WeakRetained;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v30 = v9;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v35 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                if (v16)
                {
                  v17 = (void *)MEMORY[0x24BDD17C8];
                  v18 = v16;
                  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v18);
                  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v19 = CFSTR("<nil>");
                }
                objc_msgSend(v10, "addObject:", v19);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
            }
            while (v13);
          }

          objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x24BDD17C8];
          v22 = v11;
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ [%@]"), v23, v20);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

          WeakRetained = v32;
          v9 = v30;
          v7 = v31;
        }
        else
        {
          v28 = (void *)MEMORY[0x24BDD17C8];
          v29 = v9;
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v29);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ (empty)"), v10);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v24 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412546;
      v39 = v7;
      v40 = 2112;
      v41 = v24;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "_removeUnpairedVehicle: Tried to remove unpaired vehicle: %@, but _unpairedVehicles don't contain that vehicle. %@", buf, 0x16u);

    }
LABEL_28:

    goto LABEL_29;
  }
  objc_msgSend(*((id *)WeakRetained + 7), "removeObjectAtIndex:", v5);
  VGGetDataCoordinatorLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v39 = v26;
    _os_log_impl(&dword_20A329000, v25, OS_LOG_TYPE_INFO, "_removeUnpairedVehicle: removed vehicle: %@ from unpairedVehicles.", buf, 0xCu);
  }

  v27 = *((_QWORD *)WeakRetained + 3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke_63;
  block[3] = &unk_24C2FB350;
  block[4] = WeakRetained;
  dispatch_async(v27, block);
LABEL_29:

}

void __45__VGDataCoordinator_finishOnboardingVehicle___block_invoke_63(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(v2 + 56), "copy");
  objc_msgSend(WeakRetained, "dataCoordinator:didUpdateUnpairedVehicles:", v2, v3);

}

- (BOOL)shouldUnpairVehicle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "pairedAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    VGGetDataCoordinatorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: vehicle doesn't have a pairedAppId -> NO", (uint8_t *)&v23, 2u);
    }
    goto LABEL_12;
  }
  -[VGDataCoordinator deviceIdentifier](self, "deviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedAppInstallDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    VGGetDataCoordinatorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "pairedAppInstallDeviceIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGDataCoordinator deviceIdentifier](self, "deviceIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = v20;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: this is not the primary device. vehicle.deviceId: %@, self.deviceId: %@ -> NO", (uint8_t *)&v23, 0x16u);

    }
LABEL_12:
    v14 = 0;
    goto LABEL_16;
  }
  -[VGDataCoordinator _applicationRecordForVehicle:](self, "_applicationRecordForVehicle:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    -[NSObject installSessionIdentifier](v9, "installSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairedAppInstallSessionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);
    v14 = v13 ^ 1;

    VGGetDataCoordinatorLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "pairedAppInstallSessionIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject installSessionIdentifier](v10, "installSessionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("YES");
      if (v13)
        v18 = CFSTR("NO");
      v19 = v18;
      v23 = 138412802;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: this is a primary device, the OEM app is installed, vehicle.installId: %@, oemApp.installId: %@ -> %@", (uint8_t *)&v23, 0x20u);

    }
  }
  else
  {
    VGGetDataCoordinatorLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = 1;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "shouldUnpairVehicle: this is a primary device and the OEM app is not installed -> YES", (uint8_t *)&v23, 2u);
    }
  }

LABEL_16:
  return v14;
}

- (id)_applicationRecordForVehicle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDC1540];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "pairedAppIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v11);
  v8 = v11;

  if (!v7)
  {
    VGGetDataCoordinatorLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "Failed to load application record with error: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (void)_saveOnboardingInfoForVehicle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "pairedAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "headUnitIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {

    }
    else
    {
      objc_msgSend(v4, "headUnitBluetoothIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (!v13)
      {
        VGGetDataCoordinatorLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        v17 = 138412290;
        v18 = v4;
        v14 = "No application associated with vehicle: %@";
        v15 = v7;
        v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }
    VGGetDataCoordinatorLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v17 = 138412290;
    v18 = v4;
    v14 = "No matching application for vehicle: %@";
    v15 = v7;
    v16 = OS_LOG_TYPE_INFO;
LABEL_12:
    _os_log_impl(&dword_20A329000, v15, v16, v14, (uint8_t *)&v17, 0xCu);
    goto LABEL_13;
  }
  -[VGDataCoordinator _applicationRecordForVehicle:](self, "_applicationRecordForVehicle:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[VGDataCoordinator deviceIdentifier](self, "deviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPairedAppInstallDeviceIdentifier:", v8);

    -[NSObject installSessionIdentifier](v7, "installSessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPairedAppInstallSessionIdentifier:", v9);

  }
  else
  {
    VGGetDataCoordinatorLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "Ignoring, OEM Application not installed for vehicle: %@", (uint8_t *)&v17, 0xCu);
    }

    v7 = 0;
  }
LABEL_13:

}

- (void)unpairVehicle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *workQueue;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "iapIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "pairedAppIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    VGGetDataCoordinatorLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_INFO, "unpairVehicle: Unpairing iAP2 only vehicle. Will reload unpaired iAP vehicles.", (uint8_t *)location, 2u);
    }

    -[VGDataCoordinator _loadIapVehicles](self, "_loadIapVehicles");
  }
  else
  {
    objc_msgSend(v4, "siriIntentsIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(v4, "pairedAppIdentifier"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_initWeak(location, self);
      workQueue = self->_workQueue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __35__VGDataCoordinator_unpairVehicle___block_invoke;
      v14[3] = &unk_24C2FB3C8;
      objc_copyWeak(&v16, location);
      v15 = v4;
      dispatch_async(workQueue, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(location);
    }
    else
    {
      VGGetDataCoordinatorLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_INFO, "unpairVehicle: Tried to unpair a vehicle without iapIdentifier/siriIdentifier/pairedAppIdentifier -> ignoring the call.", (uint8_t *)location, 2u);
      }

    }
  }

}

void __35__VGDataCoordinator_unpairVehicle___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  __CFString *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  _QWORD v35[4];
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[5];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __35__VGDataCoordinator_unpairVehicle___block_invoke_65;
    v35[3] = &unk_24C2FB3A0;
    v36 = *(id *)(a1 + 32);
    VGFilter(v4, v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    VGGetDataCoordinatorLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "unpairVehicle: will reload all vehicles for app: %@", buf, 0xCu);
      }

      v41 = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_loadAllOEMVehiclesForApps:completion:", v8, 0);
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = *(const char **)(a1 + 32);
      v11 = v3[5];
      v12 = v11;
      if (v11)
      {
        if (objc_msgSend(v11, "count"))
        {
          v33 = v10;
          v34 = v8;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v32 = v12;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v38 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                if (v19)
                {
                  v20 = (void *)MEMORY[0x24BDD17C8];
                  v21 = v19;
                  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v21);
                  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v22 = CFSTR("<nil>");
                }
                objc_msgSend(v13, "addObject:", v22);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
            }
            while (v16);
          }

          objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BDD17C8];
          v25 = v14;
          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ [%@]"), v26, v23);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v8 = v34;
          v6 = 0;
          v12 = v32;
          v10 = v33;
        }
        else
        {
          v28 = (void *)MEMORY[0x24BDD17C8];
          v29 = v12;
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v29);
          v30 = v12;
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ (empty)"), v31);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v12 = v30;
        }
      }
      else
      {
        v27 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412546;
      v43 = v10;
      v44 = 2112;
      v45 = v27;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "unpairVehicle: Tried to unpair a vehicle %@, but _applications didn't contain the vehicle's paired app (%@). Not adding it back to unpaired vehicles.", buf, 0x16u);

    }
    v9 = v36;
  }
  else
  {
    VGGetVirtualGarageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[VGDataCoordinator unpairVehicle:]_block_invoke";
      v44 = 1024;
      LODWORD(v45) = 375;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

uint64_t __35__VGDataCoordinator_unpairVehicle___block_invoke_65(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v6 = a2;
  if (objc_msgSend(v6, "isEnabled")
    && (objc_msgSend(v6, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "pairedAppIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        v7,
        v9))
  {
    v10 = 1;
    *a4 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)startContinuousUpdatesForVehicle:(id)a3
{
  id v4;
  NSObject *workQueue;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _BYTE location[12];
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__VGDataCoordinator_startContinuousUpdatesForVehicle___block_invoke;
    v7[3] = &unk_24C2FB3C8;
    objc_copyWeak(&v9, (id *)location);
    v8 = v4;
    dispatch_async(workQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    VGGetAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136446722;
      *(_QWORD *)&location[4] = "-[VGDataCoordinator startContinuousUpdatesForVehicle:]";
      v11 = 2082;
      v12 = "vehicle == nil";
      v13 = 2082;
      v14 = "can't start continuous updates with a nil vehicle.";
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    }

  }
}

void __54__VGDataCoordinator_startContinuousUpdatesForVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 9), "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_startChargeStreamForVehicle:", *(_QWORD *)(a1 + 32));
    if (!v3[8])
    {
      objc_msgSend(v3, "_refreshStateForTrackedVehicles");
      objc_msgSend(v3, "_setupTimerIfNeeded");
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[VGDataCoordinator startContinuousUpdatesForVehicle:]_block_invoke";
      v7 = 1024;
      v8 = 405;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }

  }
}

- (void)endAllContinuousUpdates
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__VGDataCoordinator_endAllContinuousUpdates__block_invoke;
  v4[3] = &unk_24C2FB268;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __44__VGDataCoordinator_endAllContinuousUpdates__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = WeakRetained[9];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "_stopChargeStreamForVehicle:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    objc_msgSend(v2[9], "removeAllObjects");
    objc_msgSend(v2, "_invalidateRefreshTimer");
  }
  else
  {
    VGGetVirtualGarageLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[VGDataCoordinator endAllContinuousUpdates]_block_invoke";
      v16 = 1024;
      v17 = 421;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

- (void)_refreshStateForTrackedVehicles
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__VGDataCoordinator__refreshStateForTrackedVehicles__block_invoke;
  v4[3] = &unk_24C2FB268;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__VGDataCoordinator__refreshStateForTrackedVehicles__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    VGGetDataCoordinatorLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained[9], "allObjects");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        if (objc_msgSend(v3, "count"))
        {
          v29 = v2;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v28 = v4;
          v6 = v4;
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
          if (v7)
          {
            v8 = v7;
            v9 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v8; ++i)
              {
                if (*(_QWORD *)v35 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                if (v11)
                {
                  v12 = (void *)MEMORY[0x24BDD17C8];
                  v13 = v11;
                  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v13);
                  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v14 = CFSTR("<nil>");
                }
                objc_msgSend(v5, "addObject:", v14);

              }
              v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
            }
            while (v8);
          }

          objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x24BDD17C8];
          v17 = v6;
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ [%@]"), v18, v15);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v4 = v28;
          v2 = v29;
        }
        else
        {
          v21 = (void *)MEMORY[0x24BDD17C8];
          v22 = v4;
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ (empty)"), v23);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v19 = CFSTR("<nil>");
      }

      *(_DWORD *)buf = 138412290;
      v40 = (const char *)v19;
      _os_log_impl(&dword_20A329000, v2, OS_LOG_TYPE_INFO, "Refresh timer ticked, pulling SoC for vehicles: %@", buf, 0xCu);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = WeakRetained[9];
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v20);
          objc_msgSend(WeakRetained, "_updateStateOfChargeForVehicle:syncAcrossDevices:completion:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j), 1, 0);
        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v25);
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[VGDataCoordinator _refreshStateForTrackedVehicles]_block_invoke";
      v41 = 1024;
      v42 = 436;
      _os_log_impl(&dword_20A329000, v20, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

- (void)_invalidateRefreshTimer
{
  NSObject *v3;
  NSTimer *vehicleStateRefreshTimer;
  uint8_t v5[16];

  VGGetDataCoordinatorLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "Invalidating refresh timer.", v5, 2u);
  }

  -[NSTimer invalidate](self->_vehicleStateRefreshTimer, "invalidate");
  vehicleStateRefreshTimer = self->_vehicleStateRefreshTimer;
  self->_vehicleStateRefreshTimer = 0;

}

- (void)_setupTimerIfNeeded
{
  double v3;
  double v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *vehicleStateRefreshTimer;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!self->_vehicleStateRefreshTimer)
  {
    -[VGDataCoordinator _vehicleStateRefreshInterval](self, "_vehicleStateRefreshInterval");
    v4 = v3;
    VGGetDataCoordinatorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = (uint64_t)v4;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Starting refresh timer with interval: %ld", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__refreshStateForTrackedVehicles, 0, 1, v4);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    vehicleStateRefreshTimer = self->_vehicleStateRefreshTimer;
    self->_vehicleStateRefreshTimer = v6;

  }
}

- (id)_applicationForVehicle:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_applications;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "pairedAppIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_loadAllOEMVehiclesForApps:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  char *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *workQueue;
  id v19;
  id v20;
  VGDataCoordinator *v21;
  id obj;
  _QWORD block[4];
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  void *v27;
  id v28[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id location;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  v7 = dispatch_group_create();
  v21 = self;
  objc_initWeak(&location, self);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        VGGetDataCoordinatorLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v13;
          _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_INFO, "Requesting list of vehicles for %@", buf, 0xCu);

        }
        dispatch_group_enter(v7);
        VGGetDataCoordinatorLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (char *)os_signpost_id_generate(v14);

        VGGetDataCoordinatorLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_20A329000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "ListCars", (const char *)&unk_20A357DD6, buf, 2u);
        }

        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke;
        v25[3] = &unk_24C2FB418;
        v28[1] = v15;
        v26 = v7;
        v27 = v11;
        objc_copyWeak(v28, &location);
        objc_msgSend(v11, "listCarsWithCompletion:", v25);
        objc_destroyWeak(v28);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v8);
  }

  workQueue = v21->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_2;
  block[3] = &unk_24C2FB440;
  v24 = v20;
  v19 = v20;
  dispatch_group_notify(v7, workQueue, block);

  objc_destroyWeak(&location);
}

void __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  char *v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  NSObject **WeakRetained;
  NSObject **v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  VGGetDataCoordinatorLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v8, OS_SIGNPOST_INTERVAL_END, v9, "ListCars", (const char *)&unk_20A357DD6, buf, 2u);
  }

  if (v6)
  {
    VGGetDataCoordinatorLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "description");
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v11;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "Error Listing Cars from Intents: %@", buf, 0xCu);

    }
LABEL_7:

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_18;
  }
  v12 = objc_msgSend(v5, "count");
  VGGetDataCoordinatorLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v12)
  {
    if (v13)
    {
      v19 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Didn't receive any vehicles from %@, bailing.", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (v13)
  {
    v14 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Received Vehicles from %@: %@", buf, 0x16u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    v17 = WeakRetained[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_73;
    block[3] = &unk_24C2FB3F0;
    v21 = v5;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    v22 = *(id *)(a1 + 32);
    dispatch_async(v17, block);

    objc_destroyWeak(&v23);
    v18 = v21;
  }
  else
  {
    VGGetVirtualGarageLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[VGDataCoordinator _loadAllOEMVehiclesForApps:completion:]_block_invoke";
      v26 = 1024;
      LODWORD(v27) = 504;
      _os_log_impl(&dword_20A329000, v18, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

LABEL_18:
}

void __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_73(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = MEMORY[0x24BDAC760];
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v6);
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        if (!WeakRetained)
        {
          VGGetVirtualGarageLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v19 = "-[VGDataCoordinator _loadAllOEMVehiclesForApps:completion:]_block_invoke";
            v20 = 1024;
            v21 = 507;
            _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
          }

          return;
        }
        v9 = WeakRetained;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_74;
        v12[3] = &unk_24C2FB350;
        v13 = *(id *)(a1 + 40);
        objc_msgSend(v9, "_updateStateOfChargeForVehicle:syncAcrossDevices:completion:", v7, 1, v12);

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v3)
        continue;
      break;
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_74(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __59__VGDataCoordinator__loadAllOEMVehiclesForApps_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_oemAppForChargeStreamForVehicle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "siriIntentsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((GEOConfigGetBOOL() & 1) != 0)
    {
      -[VGDataCoordinator _applicationForVehicle:](self, "_applicationForVehicle:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        v5 = v7;
LABEL_11:

        goto LABEL_12;
      }
      VGGetDataCoordinatorLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "Couldn't modify charge stream for vehicle: %@. Underlying app was not found.", (uint8_t *)&v10, 0xCu);
      }

      v7 = 0;
    }
    else
    {
      VGGetDataCoordinatorLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "Couldn't modify charge stream for vehicle, because EVRoutingStreamUpdatesDuringNav is false.", (uint8_t *)&v10, 2u);
      }
    }
    v5 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (void)_startChargeStreamForVehicle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VGDataCoordinator _oemAppForChargeStreamForVehicle:](self, "_oemAppForChargeStreamForVehicle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    VGGetDataCoordinatorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "Will start charge stream for vehicle: %@.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v5, "setChargeStreamingDelegate:", self);
    objc_msgSend(v5, "startSendingChargeUpdatesForVehicle:", v4);
  }

}

- (void)_stopChargeStreamForVehicle:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VGDataCoordinator _oemAppForChargeStreamForVehicle:](self, "_oemAppForChargeStreamForVehicle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    VGGetDataCoordinatorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "Will stop charge stream for vehicle: %@.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v5, "stopSendingChargeUpdatesForVehicle:", v4);
  }

}

- (void)vehicleStateUpdated:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__VGDataCoordinator_vehicleStateUpdated___block_invoke;
  block[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__VGDataCoordinator_vehicleStateUpdated___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  __CFString *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __CFString *v28;
  void *v29;
  id v30;
  void *v31;
  const char *v32;
  void *v33;
  id *v34;
  _QWORD v35[4];
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[9];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __41__VGDataCoordinator_vehicleStateUpdated___block_invoke_76;
    v35[3] = &unk_24C2FB168;
    v36 = *(id *)(a1 + 32);
    VGFilter(v4, v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");

      VGGetDataCoordinatorLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(__CFString **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v42 = (const char *)v7;
        v43 = 2112;
        v44 = v9;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "SoC Streaming will update vehicle: %@ with state: %@", buf, 0x16u);
      }

      -[NSObject _updateWithVehicleState:](v7, "_updateWithVehicleState:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v3, "_updateGarageWithVehicle:syncAcrossDevices:", v7, 0);
    }
    else
    {
      VGGetDataCoordinatorLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = *(const char **)(a1 + 32);
        objc_msgSend(v3[9], "allObjects");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          if (objc_msgSend(v12, "count"))
          {
            v32 = v11;
            v33 = v5;
            v34 = v3;
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v15 = v13;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v38;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v38 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                  if (v20)
                  {
                    v21 = (void *)MEMORY[0x24BDD17C8];
                    v22 = v20;
                    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v22);
                    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v23 = CFSTR("<nil>");
                  }
                  objc_msgSend(v14, "addObject:", v23);

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, buf, 16);
              }
              while (v17);
            }

            objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x24BDD17C8];
            v26 = v15;
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ [%@]"), v27, v24);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v5 = v33;
            v3 = v34;
            v11 = v32;
          }
          else
          {
            v29 = (void *)MEMORY[0x24BDD17C8];
            v30 = v13;
            objc_msgSend(v29, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v29, "stringWithFormat:", CFSTR("%@ (empty)"), v31);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v28 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412546;
        v42 = v11;
        v43 = 2112;
        v44 = v28;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "SoC Streaming couldn't find vehicle for state: %@ in observed vehicles: %@", buf, 0x16u);

      }
    }

    v10 = v36;
  }
  else
  {
    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "-[VGDataCoordinator vehicleStateUpdated:]_block_invoke";
      v43 = 1024;
      LODWORD(v44) = 582;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

uint64_t __41__VGDataCoordinator_vehicleStateUpdated___block_invoke_76(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "siriIntentsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

- (void)accessoryUpdatedWithVehicle:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *workQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  workQueue = self->_workQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__VGDataCoordinator_accessoryUpdatedWithVehicle___block_invoke;
  v10[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v5;
  v9 = v5;
  dispatch_async(workQueue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __49__VGDataCoordinator_accessoryUpdatedWithVehicle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  NSObject *v5;
  char BOOL;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained((id *)WeakRetained + 1);
    if (v4)
    {
      v5 = v4;
      if (*(_QWORD *)(a1 + 32))
      {
        BOOL = GEOConfigGetBOOL();
        VGGetDataCoordinatorLog();
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if ((BOOL & 1) != 0)
        {
          if (v8)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "accessoryUpdatedWithVehicle: accessory did update vehicle. Will update garage", buf, 2u);
          }

          objc_msgSend(v3, "_updateGarageWithVehicle:syncAcrossDevices:", *(_QWORD *)(a1 + 32), 0);
          goto LABEL_35;
        }
        if (v8)
        {
          *(_WORD *)buf = 0;
          v21 = "accessoryUpdatedWithVehicle: iAP2 onboarding is disabled. The dataCoordinator won't save the iAP2 vehicle.";
LABEL_33:
          _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, v21, buf, 2u);
          goto LABEL_34;
        }
        goto LABEL_34;
      }
      VGGetDataCoordinatorLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "accessoryUpdatedWithVehicle: not connected to an iAP2 EV vehicle. Will remove any unpaired vehicles if possible", buf, 2u);
      }

      objc_msgSend(v3, "_removeUnpairedIapVehicleIfNeeded");
      VGGetDataCoordinatorLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

      if (v12)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[NSObject vehicles](v5, "vehicles", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
LABEL_18:
          v17 = 0;
          while (1)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
            v19 = (void *)v3[6];
            objc_msgSend(v18, "iapIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v19) = objc_msgSend(v19, "isConnectedToAccessoryWithIdentifier:", v20);

            if ((v19 & 1) != 0)
              break;
            if (v15 == ++v17)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
              if (v15)
                goto LABEL_18;
              goto LABEL_24;
            }
          }
          v7 = v18;

          if (!v7)
            goto LABEL_31;
          VGGetDataCoordinatorLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20A329000, v22, OS_LOG_TYPE_INFO, "accessoryUpdatedWithVehicle: accessory is connected to a disambiguated non-EV accessory.", buf, 2u);
          }

          goto LABEL_34;
        }
LABEL_24:

LABEL_31:
        VGGetDataCoordinatorLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v21 = "accessoryUpdatedWithVehicle: accessory is connected to a vehicle that is not an EV and was not disambiguated. ";
          goto LABEL_33;
        }
LABEL_34:

      }
    }
    else
    {
      VGGetVirtualGarageLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[VGDataCoordinator accessoryUpdatedWithVehicle:]_block_invoke";
        v30 = 1024;
        v31 = 615;
        _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", buf, 0x12u);
      }

      v5 = 0;
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[VGDataCoordinator accessoryUpdatedWithVehicle:]_block_invoke";
      v30 = 1024;
      v31 = 614;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
LABEL_35:

}

void __37__VGDataCoordinator__loadIapVehicles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "accessoryUpdatedWithVehicle:", v3);
    v3 = v4;
  }

}

- (void)_removeUnpairedIapVehicleIfNeeded
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *delegateQueue;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_unpairedVehicles;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "iapIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          VGGetDataCoordinatorLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v8;
            _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Will remove an existing unpaired iap2 vehicle: %@", buf, 0xCu);
          }

          -[NSMutableArray removeObject:](self->_unpairedVehicles, "removeObject:", v8);
          delegateQueue = self->_delegateQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __54__VGDataCoordinator__removeUnpairedIapVehicleIfNeeded__block_invoke;
          block[3] = &unk_24C2FB350;
          block[4] = self;
          dispatch_async(delegateQueue, block);
          goto LABEL_14;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v5)
        continue;
      break;
    }
  }

  VGGetDataCoordinatorLog();
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v3->super.super, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A329000, &v3->super.super, OS_LOG_TYPE_INFO, "Haven't found any iAP2 unpaired vehicles upon disconnecting from iAP2.", buf, 2u);
  }
LABEL_14:

}

void __54__VGDataCoordinator__removeUnpairedIapVehicleIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_msgSend(*(id *)(v2 + 56), "copy");
  objc_msgSend(WeakRetained, "dataCoordinator:didUpdateUnpairedVehicles:", v2, v3);

}

- (void)OEMAppsUpdated:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__VGDataCoordinator_OEMAppsUpdated___block_invoke;
  block[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__VGDataCoordinator_OEMAppsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  __CFString *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  id v41;
  __CFString *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  __CFString *v47;
  void *v48;
  id v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  id v65;
  __CFString *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  __CFString *v71;
  void *v72;
  id v73;
  NSObject *v74;
  os_signpost_id_t v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  id *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[4];
  id v89;
  os_signpost_id_t v90;
  _QWORD block[4];
  NSObject *v92;
  id *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  __CFString *v101;
  uint64_t v102;

  v1 = a1;
  v102 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 1);
    if (v4)
    {
      VGGetDataCoordinatorLog();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = 0x24BDBC000uLL;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v7 = v3[5];
        v8 = v7;
        v86 = v1;
        if (v7)
        {
          if (objc_msgSend(v7, "count"))
          {
            v81 = v5;
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v79 = v8;
            v10 = v8;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v95;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v95 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
                  if (v15)
                  {
                    v16 = (void *)MEMORY[0x24BDD17C8];
                    v17 = v15;
                    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v17);
                    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v18 = CFSTR("<nil>");
                  }
                  objc_msgSend(v9, "addObject:", v18);

                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
              }
              while (v12);
            }

            objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x24BDD17C8];
            v21 = v10;
            objc_msgSend(v20, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ [%@]"), v22, v19);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v1 = v86;
            v8 = v79;
            v5 = v81;
          }
          else
          {
            v25 = (void *)MEMORY[0x24BDD17C8];
            v26 = v8;
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ (empty)"), v27);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v1 = v86;
          }
        }
        else
        {
          v23 = CFSTR("<nil>");
        }

        v28 = v23;
        v29 = *(id *)(v1 + 32);
        v30 = v29;
        if (v29)
        {
          v80 = v29;
          if (objc_msgSend(v29, "count"))
          {
            v82 = v5;
            v84 = v4;
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = v30;
            v33 = (void *)v31;
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v34 = v32;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v95;
              do
              {
                for (j = 0; j != v36; ++j)
                {
                  if (*(_QWORD *)v95 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
                  if (v39)
                  {
                    v40 = (void *)MEMORY[0x24BDD17C8];
                    v41 = v39;
                    objc_msgSend(v40, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v41);
                    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v42 = CFSTR("<nil>");
                  }
                  objc_msgSend(v33, "addObject:", v42);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
              }
              while (v36);
            }

            objc_msgSend(v34, "componentsJoinedByString:", CFSTR(", "));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)MEMORY[0x24BDD17C8];
            v45 = v34;
            objc_msgSend(v44, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v44, "stringWithFormat:", CFSTR("%@ [%@]"), v46, v43);
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v4 = v84;
            v1 = v86;
            v5 = v82;
          }
          else
          {
            v48 = (void *)MEMORY[0x24BDD17C8];
            v49 = v30;
            objc_msgSend(v48, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v49);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v48, "stringWithFormat:", CFSTR("%@ (empty)"), v33);
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          v6 = 0x24BDBC000uLL;
          v30 = v80;
        }
        else
        {
          v47 = CFSTR("<nil>");
          v6 = 0x24BDBC000;
        }

        *(_DWORD *)buf = 138412546;
        v99 = (const char *)v28;
        v100 = 2112;
        v101 = v47;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "OEMAppsUpdated, reseting unpairedVehicles, updating apps from %@ to %@.", buf, 0x16u);

      }
      objc_storeStrong(v3 + 5, *(id *)(v1 + 32));
      objc_msgSend(*(id *)(v6 + 3768), "array");
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = v3[7];
      v3[7] = (id)v50;

      v52 = v3[3];
      v53 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_77;
      block[3] = &unk_24C2FB2B8;
      v92 = v4;
      v93 = v3;
      dispatch_async(v52, block);
      VGGetDataCoordinatorLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v55 = *(id *)(v1 + 32);
        v83 = v55;
        if (v55)
        {
          v56 = v55;
          v87 = v1;
          if (objc_msgSend(v55, "count"))
          {
            v85 = v3;
            objc_msgSend(*(id *)(v6 + 3768), "arrayWithCapacity:", objc_msgSend(v56, "count"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v58 = v56;
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
            if (v59)
            {
              v60 = v59;
              v61 = *(_QWORD *)v95;
              do
              {
                for (k = 0; k != v60; ++k)
                {
                  if (*(_QWORD *)v95 != v61)
                    objc_enumerationMutation(v58);
                  v63 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
                  if (v63)
                  {
                    v64 = (void *)MEMORY[0x24BDD17C8];
                    v65 = v63;
                    objc_msgSend(v64, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v65);
                    v66 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v66 = CFSTR("<nil>");
                  }
                  objc_msgSend(v57, "addObject:", v66);

                }
                v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
              }
              while (v60);
            }

            objc_msgSend(v58, "componentsJoinedByString:", CFSTR(", "));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = (void *)MEMORY[0x24BDD17C8];
            v69 = v58;
            objc_msgSend(v68, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v68, "stringWithFormat:", CFSTR("%@ [%@]"), v70, v67);
            v71 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v3 = v85;
            v53 = MEMORY[0x24BDAC760];
          }
          else
          {
            v72 = (void *)MEMORY[0x24BDD17C8];
            v73 = v56;
            objc_msgSend(v72, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v73);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v72, "stringWithFormat:", CFSTR("%@ (empty)"), v57);
            v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

          v1 = v87;
        }
        else
        {
          v71 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412290;
        v99 = (const char *)v71;
        _os_log_impl(&dword_20A329000, v54, OS_LOG_TYPE_INFO, "Started pulling all vehicles for apps: %@.", buf, 0xCu);

      }
      VGGetDataCoordinatorLog();
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = os_signpost_id_generate(v74);

      VGGetDataCoordinatorLog();
      v76 = objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (v75 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v77, OS_SIGNPOST_INTERVAL_BEGIN, v75, "PullAllVehicles", (const char *)&unk_20A357DD6, buf, 2u);
      }

      v78 = *(void **)(v1 + 32);
      v88[0] = v53;
      v88[1] = 3221225472;
      v88[2] = __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_78;
      v88[3] = &unk_24C2FB490;
      v90 = v75;
      v89 = v78;
      objc_msgSend(v3, "_loadAllOEMVehiclesForApps:completion:", v89, v88);

      v24 = v92;
    }
    else
    {
      VGGetVirtualGarageLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v99 = "-[VGDataCoordinator OEMAppsUpdated:]_block_invoke";
        v100 = 1024;
        LODWORD(v101) = 691;
        _os_log_impl(&dword_20A329000, v24, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", buf, 0x12u);
      }
    }

  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "-[VGDataCoordinator OEMAppsUpdated:]_block_invoke";
      v100 = 1024;
      LODWORD(v101) = 690;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

uint64_t __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_77(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dataCoordinator:didUpdateUnpairedVehicles:", *(_QWORD *)(a1 + 40), MEMORY[0x24BDBD1A8]);
  return objc_msgSend(*(id *)(a1 + 32), "dataCoordinatorDidUpdateInstalledApps:", *(_QWORD *)(a1 + 40));
}

void __36__VGDataCoordinator_OEMAppsUpdated___block_invoke_78(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  VGGetDataCoordinatorLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PullAllVehicles", (const char *)&unk_20A357DD6, buf, 2u);
  }

  VGGetDataCoordinatorLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(id *)(a1 + 32);
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
      {
        v25 = v5;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, buf, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v27 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              if (v14)
              {
                v15 = (void *)MEMORY[0x24BDD17C8];
                v16 = v14;
                objc_msgSend(v15, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
                v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v17 = CFSTR("<nil>");
              }
              objc_msgSend(v8, "addObject:", v17);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, buf, 16);
          }
          while (v11);
        }

        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x24BDD17C8];
        v20 = v9;
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ [%@]"), v21, v18);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v5 = v25;
      }
      else
      {
        v23 = (void *)MEMORY[0x24BDD17C8];
        v24 = v7;
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ (empty)"), v8);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v22 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412290;
    v31 = v22;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Finished pulling all vehicles for apps: %@.", buf, 0xCu);

  }
}

- (void)getLatestStateOfVehicle:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, id, NSObject *);
  id WeakRetained;
  void *v9;
  void *v10;
  char v11;
  NSObject *workQueue;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  void (**v20)(id, id, NSObject *);
  id v21;
  uint64_t v22;
  const __CFString *v23;
  _BYTE location[12];
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id, NSObject *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = WeakRetained;
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[VGDataCoordinator getLatestStateOfVehicle:withReply:]";
      v25 = 1024;
      v26 = 717;
      _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_ERROR, "strongDelegate went away in %s line %d", location, 0x12u);
    }
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "vehicles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if ((v11 & 1) == 0)
  {
    VGGetDataCoordinatorLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_ERROR, "Tried to get SoC for vehicle, that is not saved in the garage.", location, 2u);
    }

    v15 = (void *)MEMORY[0x24BDD1540];
    GEOErrorDomain();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDD0FC8];
    v23 = CFSTR("Could not get latest state of vehicle.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -10, v17);
    v13 = objc_claimAutoreleasedReturnValue();

    v7[2](v7, v6, v13);
LABEL_9:

    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke;
  block[3] = &unk_24C2FB508;
  objc_copyWeak(&v21, (id *)location);
  v19 = v6;
  v20 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)location);
LABEL_10:

}

void __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint8_t buf[4];
  char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_vehicleStateProviderForVehicle:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    VGGetDataCoordinatorLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = (char *)objc_opt_class();
        v8 = v22;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "getLatestStateOfVehicle: using %@ to fetch SoC.", buf, 0xCu);

      }
      v9 = a1[4];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_84;
      v15[3] = &unk_24C2FB4E0;
      objc_copyWeak(&v18, v2);
      v16 = a1[4];
      v17 = a1[5];
      -[NSObject getStateOfChargeForVehicle:completion:](v5, "getStateOfChargeForVehicle:completion:", v9, v15);

      objc_destroyWeak(&v18);
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = (char *)a1[4];
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "getLatestStateOfVehicle: called for a vehicle (%@) that doesn't have a stateProvider. Make sure that the paired app is installed, otherwise there might be an issue in the VG logic.", buf, 0xCu);
      }

      v11 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDD0FC8];
      v20 = CFSTR("Could not get latest state of vehicle, because the provider was nil.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -10, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(void))a1[5] + 2))();
      v5 = 0;
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[VGDataCoordinator getLatestStateOfVehicle:withReply:]_block_invoke";
      v23 = 1024;
      v24 = 731;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

void __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_84(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[2];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_85;
    v11[3] = &unk_24C2FB4B8;
    v12 = v5;
    v13 = a1[4];
    v14 = v6;
    v15 = a1[5];
    dispatch_async(v9, v11);

    v10 = v12;
  }
  else
  {
    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[VGDataCoordinator getLatestStateOfVehicle:withReply:]_block_invoke";
      v18 = 1024;
      v19 = 745;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }
  }

}

void __55__VGDataCoordinator_getLatestStateOfVehicle_withReply___block_invoke_85(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v2, "_updateWithVehicleState:", *(_QWORD *)(a1 + 32));
    VGGetDataCoordinatorLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "getLatestStateOfVehicle: Fetched latest vehicle state: %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    VGGetDataCoordinatorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "getLatestStateOfVehicle: Tried to fetch SoC for %@, but failed with error: %@.", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_observedVehicles, 0);
  objc_storeStrong((id *)&self->_vehicleStateRefreshTimer, 0);
  objc_storeStrong((id *)&self->_unpairedVehicles, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_applicationFinder, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
