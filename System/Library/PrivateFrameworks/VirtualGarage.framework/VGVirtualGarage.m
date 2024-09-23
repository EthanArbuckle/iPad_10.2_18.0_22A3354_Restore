@implementation VGVirtualGarage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  VGVirtualGarage *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v5, "encodeObject:forKey:", v4->_vehicles, CFSTR("_vehicles"));
  objc_msgSend(v5, "encodeObject:forKey:", v4->_selectedVehicleIdentifier, CFSTR("_selectedVehicleIdentifier"));
  objc_sync_exit(v4);

}

- (VGVirtualGarage)initWithCoder:(id)a3
{
  id v4;
  VGVirtualGarage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *vehicles;
  uint64_t v11;
  NSString *selectedVehicleIdentifier;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VGVirtualGarage;
  v5 = -[VGVirtualGarage init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_vehicles"));
    v9 = objc_claimAutoreleasedReturnValue();
    vehicles = v5->_vehicles;
    v5->_vehicles = (NSMutableArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selectedVehicleIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    selectedVehicleIdentifier = v5->_selectedVehicleIdentifier;
    v5->_selectedVehicleIdentifier = (NSString *)v11;

  }
  return v5;
}

- (void)_setDataCoordintorRunning:(BOOL)a3
{
  _BOOL4 v3;
  VGVirtualGarage *v4;
  VGDataCoordinator *v5;
  VGOEMApplicationFinder *v6;
  VGExternalAccessory *v7;
  uint64_t v8;
  VGDataCoordinator *dataCoordinator;
  NSObject *p_super;
  VGDataCoordinator *v11;
  NSObject *v12;
  int v13;
  VGDataCoordinator *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_isDataCoordinatorRunning != v3)
  {
    v4->_isDataCoordinatorRunning = v3;
    if (v3)
    {
      v5 = [VGDataCoordinator alloc];
      v6 = objc_alloc_init(VGOEMApplicationFinder);
      v7 = objc_alloc_init(VGExternalAccessory);
      v8 = -[VGDataCoordinator initWithApplicationFinder:externalAccessory:delegate:](v5, "initWithApplicationFinder:externalAccessory:delegate:", v6, v7, v4);
      dataCoordinator = v4->_dataCoordinator;
      v4->_dataCoordinator = (VGDataCoordinator *)v8;

      VGGetVirtualGarageLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
      {
        v11 = v4->_dataCoordinator;
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_20A329000, p_super, OS_LOG_TYPE_INFO, "Instantiated a new _dataCoordinator %@ for VirtualGarage", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      VGGetVirtualGarageLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_INFO, "Will not use dataCoordinator, EV routing isn't enabled", (uint8_t *)&v13, 2u);
      }

      p_super = &v4->_dataCoordinator->super;
      v4->_dataCoordinator = 0;
    }

  }
  objc_sync_exit(v4);

}

- (void)virtualGarageGetGarageWithReply:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  VGVirtualGarage *v5;
  void *v6;
  void *v7;
  NSMutableArray *queuedGetGarageCompletionHandlers;
  void *v9;
  NSObject *v10;
  __int16 v11;
  _QWORD v12[4];
  void (**v13)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_finishedLoadingVehicles)
  {
    -[VGVirtualGarage _garageCopy](v5, "_garageCopy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0);

  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__VGVirtualGarage_virtualGarageGetGarageWithReply___block_invoke;
    v12[3] = &unk_24C2FB848;
    v13 = v4;
    v7 = (void *)MEMORY[0x20BD239CC](v12);
    queuedGetGarageCompletionHandlers = v5->_queuedGetGarageCompletionHandlers;
    v9 = (void *)MEMORY[0x20BD239CC]();
    -[NSMutableArray addObject:](queuedGetGarageCompletionHandlers, "addObject:", v9);

    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 0;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Garage hasn't finished loading vehicles from persistor. Once finished, reply block will be executed", (uint8_t *)&v11, 2u);
    }

  }
  objc_sync_exit(v5);

}

void __43__VGVirtualGarage_initWithGaragePersister___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    VGGetPersistingLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v18 = 138412290;
        v19 = v6;
        _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "Failed to load virtual garage with error: %@", (uint8_t *)&v18, 0xCu);
      }

      VGGetPersistingLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = *(_QWORD *)(a1 + 40);
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v13, OS_SIGNPOST_INTERVAL_END, v14, "LoadVehicles", (const char *)&unk_20A357DD6, (uint8_t *)&v18, 2u);
      }

      LOBYTE(v9[6].isa) = 1;
      -[NSObject _updateDataCoordinatorAvailability](v9, "_updateDataCoordinatorAvailability");
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_INFO, "Garage did finish loading initial vehicles.", (uint8_t *)&v18, 2u);
      }

      -[NSObject _forceUpdateWithVehicles:](v9, "_forceUpdateWithVehicles:", v5);
      VGGetPersistingLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = *(_QWORD *)(a1 + 40);
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v16, OS_SIGNPOST_INTERVAL_END, v17, "LoadVehicles", (const char *)&unk_20A357DD6, (uint8_t *)&v18, 2u);
      }

      LOBYTE(v9[6].isa) = 1;
      -[NSObject _updateDataCoordinatorAvailability](v9, "_updateDataCoordinatorAvailability");
      -[NSObject _removeVehiclesWithUninstalledAppsIfNeeded](v9, "_removeVehiclesWithUninstalledAppsIfNeeded");
    }
    -[NSObject _executeQueuedCompletionHandlersIfNeeded](v9, "_executeQueuedCompletionHandlersIfNeeded");
    objc_sync_exit(v9);
  }
  else
  {
    VGGetVirtualGarageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "-[VGVirtualGarage initWithGaragePersister:]_block_invoke";
      v20 = 1024;
      v21 = 83;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v18, 0x12u);
    }
  }

}

- (void)_forceUpdateWithVehicles:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSMutableArray *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  __CFString *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  NSMutableArray *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  id v40;
  __CFString *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  NSObject *v48;
  NSMutableArray *vehicles;
  NSObject *v50;
  __CFString *v51;
  NSObject *v52;
  void *v53;
  NSMutableArray *v54;
  NSObject *v55;
  VGVirtualGarage *obj;
  _QWORD v57[6];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[4];
  __CFString *v67;
  __int16 v68;
  __CFString *v69;
  uint8_t v70[128];
  _BYTE buf[24];
  char v72;
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  obj = self;
  objc_sync_enter(obj);
  v53 = v4;
  if (v4)
  {
    v5 = objc_opt_new();
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (!v7)
      goto LABEL_17;
    v8 = *(_QWORD *)v59;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v10, "currentVehicleState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dateOfUpdate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_14;
        objc_msgSend(v10, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VGVirtualGarage _vehicleWithIdentifier:](obj, "_vehicleWithIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "currentVehicleState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateOfUpdate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16 || objc_msgSend(v16, "compare:", v12) != 1)
        {

LABEL_14:
          -[NSObject addObject:](v5, "addObject:", v10);
          goto LABEL_15;
        }
        -[NSObject addObject:](v5, "addObject:", v14);
        VGGetVirtualGarageLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v14;
          _os_log_impl(&dword_20A329000, v17, OS_LOG_TYPE_ERROR, "Discarding vehicle with stale charge state: %@ in favor of: %@", buf, 0x16u);
        }

LABEL_15:
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (!v7)
      {
LABEL_17:

        VGGetVirtualGarageLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v52 = v18;
          v19 = obj->_vehicles;
          v54 = v19;
          if (v19)
          {
            if (-[NSMutableArray count](v19, "count"))
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v54, "count"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = 0u;
              v65 = 0u;
              *(_OWORD *)v62 = 0u;
              v63 = 0u;
              v21 = v54;
              v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", v62, buf, 16);
              if (v22)
              {
                v23 = *(_QWORD *)v63;
                do
                {
                  for (j = 0; j != v22; ++j)
                  {
                    if (*(_QWORD *)v63 != v23)
                      objc_enumerationMutation(v21);
                    v25 = *(id *)(*(_QWORD *)&v62[8] + 8 * j);
                    if (v25)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v25);
                      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v26 = CFSTR("<nil>");
                    }

                    objc_msgSend(v20, "addObject:", v26);
                  }
                  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", v62, buf, 16);
                }
                while (v22);
              }

              -[NSMutableArray componentsJoinedByString:](v21, "componentsJoinedByString:", CFSTR(", "));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)MEMORY[0x24BDD17C8];
              v29 = v21;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ [%@]"), v30, v27);
              v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v32 = (void *)MEMORY[0x24BDD17C8];
              v33 = v54;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v33);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ (empty)"), v20);
              v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

          }
          else
          {
            v31 = CFSTR("<nil>");
          }

          v51 = v31;
          v34 = v5;
          v55 = v34;
          if (v34)
          {
            if (-[NSObject count](v34, "count"))
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSObject count](v55, "count"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = 0u;
              v65 = 0u;
              *(_OWORD *)v62 = 0u;
              v63 = 0u;
              v36 = v55;
              v37 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", v62, buf, 16);
              if (v37)
              {
                v38 = *(_QWORD *)v63;
                do
                {
                  for (k = 0; k != v37; ++k)
                  {
                    if (*(_QWORD *)v63 != v38)
                      objc_enumerationMutation(v36);
                    v40 = *(id *)(*(_QWORD *)&v62[8] + 8 * k);
                    if (v40)
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v40);
                      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v41 = CFSTR("<nil>");
                    }

                    objc_msgSend(v35, "addObject:", v41);
                  }
                  v37 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", v62, buf, 16);
                }
                while (v37);
              }

              -[NSObject componentsJoinedByString:](v36, "componentsJoinedByString:", CFSTR(", "));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (void *)MEMORY[0x24BDD17C8];
              v44 = v36;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ [%@]"), v45, v42);
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v47 = (void *)MEMORY[0x24BDD17C8];
              v48 = v55;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v48);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v47, "stringWithFormat:", CFSTR("%@ (empty)"), v35);
              v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

          }
          else
          {
            v46 = CFSTR("<nil>");
          }

          *(_DWORD *)v66 = 138412546;
          v67 = v51;
          v68 = 2112;
          v69 = v46;
          _os_log_impl(&dword_20A329000, v52, OS_LOG_TYPE_INFO, "Force updating local vehicles: %@, with following vehicles: %@", v66, 0x16u);

          v18 = v52;
        }

        objc_storeStrong((id *)&obj->_vehicles, v5);
        if (GEOConfigGetBOOL())
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v72 = 1;
          vehicles = obj->_vehicles;
          v57[0] = MEMORY[0x24BDAC760];
          v57[1] = 3221225472;
          v57[2] = __44__VGVirtualGarage__forceUpdateWithVehicles___block_invoke;
          v57[3] = &unk_24C2FB820;
          v57[4] = obj;
          v57[5] = buf;
          -[NSMutableArray enumerateObjectsUsingBlock:](vehicles, "enumerateObjectsUsingBlock:", v57);
          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24) && obj->_selectedVehicleIdentifier)
          {
            VGGetVirtualGarageLog();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v62 = 0;
              _os_log_impl(&dword_20A329000, v50, OS_LOG_TYPE_INFO, "Forced vehicle update removed the selected vehicle. Will deselect", v62, 2u);
            }

            -[VGVirtualGarage _selectVehicleWithIdentifier:](obj, "_selectVehicleWithIdentifier:", 0);
          }
          _Block_object_dispose(buf, 8);
        }
        -[VGVirtualGarage _notifyObserversGarageDidUpdateVehicles](obj, "_notifyObserversGarageDidUpdateVehicles");
        goto LABEL_61;
      }
    }
  }
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "Tried to update local vehicles with nil vehicles.", buf, 2u);
  }
LABEL_61:

  objc_sync_exit(obj);
}

- (void)_executeQueuedCompletionHandlersIfNeeded
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_queuedGetGarageCompletionHandlers, "count"))
  {
    -[VGVirtualGarage _garageCopy](self, "_garageCopy");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[NSMutableArray copy](self->_queuedGetGarageCompletionHandlers, "copy");
    -[NSMutableArray removeAllObjects](self->_queuedGetGarageCompletionHandlers, "removeAllObjects");
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v19 = objc_msgSend(v4, "count");
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Will execute %lu queued completionHandlers with garage: %@.", buf, 0x16u);
    }

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    VGGetVirtualGarageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v6, "count", (_QWORD)v13);
      *(_DWORD *)buf = 134217984;
      v19 = v12;
      _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_INFO, "Finished executing %lu queued completionHandlers", buf, 0xCu);
    }

  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_DEBUG, "There are no queued completion handlers, nothing to do.", buf, 2u);
    }
  }

}

- (void)dealloc
{
  NSObject *v3;
  VGVirtualGaragePersisting *persister;
  objc_super v5;
  uint8_t buf[4];
  VGVirtualGarage *v7;
  __int16 v8;
  VGVirtualGaragePersisting *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_persister)
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      persister = self->_persister;
      *(_DWORD *)buf = 134218240;
      v7 = self;
      v8 = 2048;
      v9 = persister;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "Deallocating virtualGarage: %p with persister: %p", buf, 0x16u);
    }

  }
  GEOConfigRemoveDelegateListenerForAllKeys();
  v5.receiver = self;
  v5.super_class = (Class)VGVirtualGarage;
  -[VGVirtualGarage dealloc](&v5, sel_dealloc);
}

uint64_t __51__VGVirtualGarage_virtualGarageGetGarageWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_garageCopy
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = -[VGVirtualGarage copy](self, "copy");
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_DEBUG, "EV Routing not enabled. Will strip EV vehicles from VG.", buf, 2u);
    }

    VGFilter(*(void **)(v2 + 8), &__block_literal_global_6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = *(void **)(v2 + 8);
    *(_QWORD *)(v2 + 8) = v5;

    if (*(_QWORD *)(v2 + 16))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = *(id *)(v2 + 8);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
LABEL_7:
        v11 = 0;
        while (1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "identifier", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(v2 + 16));

          if ((v13 & 1) != 0)
            break;
          if (v9 == ++v11)
          {
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
            if (v9)
              goto LABEL_7;
            goto LABEL_13;
          }
        }
      }
      else
      {
LABEL_13:

        v7 = *(id *)(v2 + 16);
        *(_QWORD *)(v2 + 16) = 0;
      }

    }
  }
  return (id)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  VGVirtualGarage *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[NSMutableArray mutableCopyWithZone:](v6->_vehicles, "mutableCopyWithZone:", a3);
  v8 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v7;

  v9 = -[NSString copyWithZone:](v6->_selectedVehicleIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  *(_BYTE *)(v5 + 64) = v6->_shouldAssumeFullCharge;
  objc_sync_exit(v6);

  return (id)v5;
}

- (void)_removeVehiclesWithUninstalledAppsIfNeeded
{
  VGVirtualGarage *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  char *v12;
  NSObject *v13;
  void *v14;
  const char *v16;
  NSObject *p_super;
  os_log_type_t v18;
  uint32_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *Name;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!self->_dataCoordinator)
  {
    VGGetVirtualGarageLog();
    v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136315138;
    Name = sel_getName(a2);
    v16 = "Tried to use a method (%s) that requires a dataCoordinator.";
    p_super = &v3->super;
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 12;
LABEL_21:
    _os_log_impl(&dword_20A329000, p_super, v18, v16, buf, v19);
    goto LABEL_22;
  }
  if ((GEOConfigGetBOOL() & 1) == 0)
  {
    VGGetVirtualGarageLog();
    v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v3->super, OS_LOG_TYPE_INFO))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v16 = "Automatic unpairing is disabled. Will not remove vehicles.";
    p_super = &v3->super;
    v18 = OS_LOG_TYPE_INFO;
    v19 = 2;
    goto LABEL_21;
  }
  v3 = self;
  objc_sync_enter(v3);
  -[VGVirtualGarage vehicles](v3, "vehicles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    Name = (const char *)objc_msgSend(v5, "count");
    _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "Will check for vehicles (%lu) that no longer have their paired apps.", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138412290;
    v20 = v9;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(char **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[VGDataCoordinator shouldUnpairVehicle:](self->_dataCoordinator, "shouldUnpairVehicle:", v12, v20, (_QWORD)v21))
        {
          VGGetVirtualGarageLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            Name = v12;
            _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_INFO, "The OEM app on the primary device was uninstalled. Will remove vehicle: %@", buf, 0xCu);
          }

          objc_msgSend(v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[VGVirtualGarage _removeVehicleWithIdentifier:](v3, "_removeVehicleWithIdentifier:", v14);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  objc_sync_exit(v3);
LABEL_22:

}

- (NSArray)vehicles
{
  VGVirtualGarage *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_vehicles, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedGetGarageCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_selectedVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicles, 0);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VGVirtualGarage)initWithGaragePersister:(id)a3
{
  char *v5;
  VGVirtualGarage *v6;
  NSObject *v7;
  uint64_t v8;
  NSMutableArray *vehicles;
  uint64_t v10;
  NSMutableArray *queuedGetGarageCompletionHandlers;
  void *global_queue;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  NSObject *v16;
  VGVirtualGaragePersisting *persister;
  uint64_t v18;
  NSString *selectedVehicleIdentifier;
  VGVirtualGarage *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27[2];
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  if (v5)
  {
    v28.receiver = self;
    v28.super_class = (Class)VGVirtualGarage;
    v6 = -[VGVirtualGarage init](&v28, sel_init);
    if (v6)
    {
      VGGetVirtualGarageLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v30 = (const char *)v6;
        v31 = 2048;
        v32 = v5;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "Creating new virtualGarage: %p with persister: %p", buf, 0x16u);
      }

      objc_storeStrong((id *)&v6->_persister, a3);
      -[VGVirtualGaragePersisting setDelegate:](v6->_persister, "setDelegate:", v6);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      vehicles = v6->_vehicles;
      v6->_vehicles = (NSMutableArray *)v8;

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = objc_claimAutoreleasedReturnValue();
      queuedGetGarageCompletionHandlers = v6->_queuedGetGarageCompletionHandlers;
      v6->_queuedGetGarageCompletionHandlers = (NSMutableArray *)v10;

      global_queue = (void *)geo_get_global_queue();
      _GEOConfigAddDelegateListenerForKey();

      VGGetPersistingLog();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (char *)os_signpost_id_generate(v13);

      VGGetPersistingLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v16, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v14, "LoadVehicles", (const char *)&unk_20A357DD6, buf, 2u);
      }

      objc_initWeak((id *)buf, v6);
      persister = v6->_persister;
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __43__VGVirtualGarage_initWithGaragePersister___block_invoke;
      v26 = &unk_24C2FB7B0;
      objc_copyWeak(v27, (id *)buf);
      v27[1] = v14;
      -[VGVirtualGaragePersisting loadVehiclesWithCompletion:](persister, "loadVehiclesWithCompletion:", &v23);
      -[VGVirtualGaragePersisting selectedVehicleIdentifier](v6->_persister, "selectedVehicleIdentifier", v23, v24, v25, v26);
      v18 = objc_claimAutoreleasedReturnValue();
      selectedVehicleIdentifier = v6->_selectedVehicleIdentifier;
      v6->_selectedVehicleIdentifier = (NSString *)v18;

      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);
    }
    self = v6;
    v20 = self;
  }
  else
  {
    VGGetAssertLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v30 = "-[VGVirtualGarage initWithGaragePersister:]";
      v31 = 2082;
      v32 = "persister == nil";
      v33 = 2082;
      v34 = "Garage should be initialized with a persister.";
      _os_log_impl(&dword_20A329000, v21, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }

    v20 = 0;
  }

  return v20;
}

- (VGVehicle)selectedVehicle
{
  VGVirtualGarage *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[VGVirtualGarage _vehicleWithIdentifier:](v2, "_vehicleWithIdentifier:", v2->_selectedVehicleIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (VGVehicle *)v3;
}

- (id)_vehicleWithIdentifier:(id)a3
{
  id v4;
  VGVirtualGarage *v5;
  NSMutableArray *vehicles;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *log;
  void *v28;
  id v29;
  id *obj;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  obj = (id *)&v5->super.isa;
  if (v4)
  {
    vehicles = v5->_vehicles;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __42__VGVirtualGarage__vehicleWithIdentifier___block_invoke;
    v31[3] = &unk_24C2FB168;
    v29 = v4;
    v32 = v29;
    v7 = -[NSMutableArray indexOfObjectPassingTest:](vehicles, "indexOfObjectPassingTest:", v31);
    if (v7 >= -[NSMutableArray count](v5->_vehicles, "count"))
    {
      VGGetVirtualGarageLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        log = v9;
        v10 = obj[1];
        v28 = v10;
        if (v10)
        {
          if (objc_msgSend(v10, "count"))
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v28, "count"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v33 = 0u;
            v34 = 0u;
            v12 = v28;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v34;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v34 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * i);
                  if (v16)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
                    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v17 = CFSTR("<nil>");
                  }

                  objc_msgSend(v11, "addObject:", v17);
                }
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              }
              while (v13);
            }

            objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x24BDD17C8];
            v20 = v12;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ [%@]"), v21, v18);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v23 = (void *)MEMORY[0x24BDD17C8];
            v24 = v28;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ (empty)"), v25);
            v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v22 = CFSTR("<nil>");
        }

        *(_DWORD *)buf = 138412546;
        v38 = v29;
        v39 = 2112;
        v40 = v22;
        _os_log_impl(&dword_20A329000, log, OS_LOG_TYPE_ERROR, "Didn't find vehicle with identifier: %@ in vehicles: %@.", buf, 0x16u);

        v9 = log;
      }

      v8 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](v5->_vehicles, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(obj);

  return v8;
}

- (NSString)description
{
  VGVirtualGarage *v2;
  objc_class *v3;
  NSMutableArray *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  NSString *selectedVehicleIdentifier;
  void *v23;
  void *v24;
  NSMutableArray *v25;
  VGVirtualGarage *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v23 = (void *)MEMORY[0x24BDD17C8];
  obj = v2;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  selectedVehicleIdentifier = v2->_selectedVehicleIdentifier;
  v4 = v2->_vehicles;
  v25 = v4;
  if (v4)
  {
    if (-[NSMutableArray count](v4, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v25, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v6 = v25;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v6);
            v10 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (v10)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
              v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v11 = CFSTR("<nil>");
            }

            objc_msgSend(v5, "addObject:", v11);
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v7);
      }

      -[NSMutableArray componentsJoinedByString:](v6, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDD17C8];
      v14 = v6;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ [%@]"), v15, v12);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = v25;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ (empty)"), v19);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v16 = CFSTR("<nil>");
  }

  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@:%p,\n _selectedVehicleIdentifier: %@,\n _vehicles: %@\n>"), v24, obj, selectedVehicleIdentifier, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(obj);
  return (NSString *)v20;
}

uint64_t __42__VGVirtualGarage__vehicleWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setShouldAssumeFullCharge:(BOOL)a3
{
  VGVirtualGarage *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_shouldAssumeFullCharge = a3;
  -[VGVirtualGarage _notifyObserversGarageDidUpdateVehicles](obj, "_notifyObserversGarageDidUpdateVehicles");
  objc_sync_exit(obj);

}

- (BOOL)_persisterHasStaleStateForVehicle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VGVirtualGaragePersisting persistedVehicleForVehicle:](self->_persister, "persistedVehicleForVehicle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    VGGetVirtualGarageLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v22 = 138412290;
      v23 = v4;
      _os_log_impl(&dword_20A329000, v20, OS_LOG_TYPE_DEBUG, "_persisterHasStaleStateForVehicle: Didn't find persisted vehicle for vehicle: %@", (uint8_t *)&v22, 0xCu);
    }

    goto LABEL_9;
  }
  objc_msgSend(v4, "currentVehicleState");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v5, "currentVehicleState"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
LABEL_9:
    v11 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v4, "currentVehicleState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentVehicleState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isSignificantlyDifferentFromVehicleState:", v10);

  GEOConfigGetDouble();
  v13 = v12;
  objc_msgSend(v5, "currentVehicleState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateOfUpdate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVehicleState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateOfUpdate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v17);
  v19 = fabs(v18);

  if (v19 > v13)
    v11 = 1;
LABEL_10:

  return v11;
}

- (void)_updateDataCoordinatorAvailability
{
  uint64_t BOOL;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_finishedLoadingVehicles)
    BOOL = GEOConfigGetBOOL();
  else
    BOOL = 0;
  VGGetVirtualGarageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if ((_DWORD)BOOL)
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = v5;
    if (GEOConfigGetBOOL())
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v7;
    if (self->_finishedLoadingVehicles)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v9;
    v11 = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "_updateDataCoordinatorAvailability: %@, evRoutingEnabled: %@, vehiclesLoaded: %@", (uint8_t *)&v11, 0x20u);

  }
  -[VGVirtualGarage _setDataCoordintorRunning:](self, "_setDataCoordintorRunning:", BOOL);
}

- (void)_addVehicle:(id)a3
{
  id v4;
  VGVirtualGarage *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (-[NSMutableArray containsObject:](v5->_vehicles, "containsObject:", v4))
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "addVehicle: tried to add a vehicle that is already in the garage.", (uint8_t *)&v12, 2u);
    }

  }
  else
  {
    -[NSMutableArray addObject:](v5->_vehicles, "addObject:", v4);
    -[VGVirtualGaragePersisting addVehicle:](v5->_persister, "addVehicle:", v4);
    VGGetVirtualGarageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = -[NSMutableArray count](v5->_vehicles, "count");
      v12 = 138412546;
      v13 = v4;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "Added vehicle: %@, vehicles.count: %lu", (uint8_t *)&v12, 0x16u);
    }

    if (!v5->_selectedVehicleIdentifier)
    {
      VGGetVirtualGarageLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_INFO, "Default selecting new vehicle: %@", (uint8_t *)&v12, 0xCu);

      }
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGVirtualGarage _selectVehicleWithIdentifier:](v5, "_selectVehicleWithIdentifier:", v11);

    }
    -[VGVirtualGarage _notifyObserversGarageDidUpdateVehicles](v5, "_notifyObserversGarageDidUpdateVehicles");
  }
  objc_sync_exit(v5);

}

- (void)_saveVehicle:(id)a3 syncAcrossDevices:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *vehicles;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  __CFString *v23;
  _BOOL4 v24;
  NSObject *v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSMutableArray *v31;
  VGVirtualGarage *obj;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[4];
  void *v41;
  __int16 v42;
  __CFString *v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  obj = self;
  objc_sync_enter(obj);
  vehicles = obj->_vehicles;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __50__VGVirtualGarage__saveVehicle_syncAcrossDevices___block_invoke;
  v34[3] = &unk_24C2FB168;
  v33 = v6;
  v35 = v33;
  v8 = -[NSMutableArray indexOfObjectPassingTest:](vehicles, "indexOfObjectPassingTest:", v34);
  VGGetVirtualGarageLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v30 = v10;
      objc_msgSend(v33, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = obj->_vehicles;
      v31 = v11;
      if (v11)
      {
        if (-[NSMutableArray count](v11, "count"))
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](v31, "count"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v13 = v31;
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v37 != v15)
                  objc_enumerationMutation(v13);
                v17 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * i);
                if (v17)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v17);
                  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v18 = CFSTR("<nil>");
                }

                objc_msgSend(v12, "addObject:", v18);
              }
              v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, buf, 16);
            }
            while (v14);
          }

          -[NSMutableArray componentsJoinedByString:](v13, "componentsJoinedByString:", CFSTR(", "));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x24BDD17C8];
          v21 = v13;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ [%@]"), v22, v19);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = (void *)MEMORY[0x24BDD17C8];
          v27 = v31;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ (empty)"), v28);
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v23 = CFSTR("<nil>");
      }

      *(_DWORD *)v40 = 138412546;
      v41 = v29;
      v42 = 2112;
      v43 = v23;
      _os_log_impl(&dword_20A329000, v30, OS_LOG_TYPE_ERROR, "_saveVehicle: Vehicle with ID: %@ wasn't found, it was removed before _save was called. vehicles: %@", v40, 0x16u);

      v10 = v30;
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v33;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "_saveVehicle: Vehicle was found, will replace it in local array: %@", buf, 0xCu);
    }

    -[NSMutableArray replaceObjectAtIndex:withObject:](obj->_vehicles, "replaceObjectAtIndex:withObject:", v8, v33);
    -[VGVirtualGarage _notifyObserversGarageDidUpdateVehicles](obj, "_notifyObserversGarageDidUpdateVehicles");
    v24 = -[VGVirtualGarage _persisterHasStaleStateForVehicle:](obj, "_persisterHasStaleStateForVehicle:", v33);
    if (v24)
    {
      VGGetVirtualGarageLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v33;
        _os_log_impl(&dword_20A329000, v25, OS_LOG_TYPE_INFO, "_saveVehicle: Will force sync chargeState because persister has stale info for vehicle: %@", buf, 0xCu);
      }

    }
    -[VGVirtualGaragePersisting saveVehicle:syncAcrossDevices:](obj->_persister, "saveVehicle:syncAcrossDevices:", v33, v4 | v24);
  }

  objc_sync_exit(obj);
}

uint64_t __50__VGVirtualGarage__saveVehicle_syncAcrossDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

- (void)_removeVehicleWithIdentifier:(id)a3
{
  id v4;
  VGVirtualGarage *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[VGVirtualGarage _vehicleWithIdentifier:](v5, "_vehicleWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VGVirtualGarage selectedVehicle](v5, "selectedVehicle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if (v8)
      -[VGVirtualGarage _endContinuousUpdates](v5, "_endContinuousUpdates");
    -[NSMutableArray removeObject:](v5->_vehicles, "removeObject:", v6);
    -[VGVirtualGaragePersisting removeVehicle:](v5->_persister, "removeVehicle:", v6);
    VGGetVirtualGarageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[NSMutableArray count](v5->_vehicles, "count");
      v12 = 138412546;
      v13 = v6;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_INFO, "Removed vehicle: %@, vehicles.count: %lu", (uint8_t *)&v12, 0x16u);
    }

    -[VGVirtualGarage _unpairVehicle:](v5, "_unpairVehicle:", v6);
    -[VGVirtualGarage _notifyObserversGarageDidUpdateVehicles](v5, "_notifyObserversGarageDidUpdateVehicles");
  }
  else
  {
    VGGetVirtualGarageLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "removeVehicle: tried to remove a vehicle that is not in the garage.", (uint8_t *)&v12, 2u);
    }

  }
  objc_sync_exit(v5);

}

- (void)_selectVehicleWithIdentifier:(id)a3
{
  id v5;
  VGVirtualGarage *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((objc_msgSend(v5, "isEqualToString:", v6->_selectedVehicleIdentifier) & 1) == 0)
  {
    -[VGVirtualGarage _vehicleWithIdentifier:](v6, "_vehicleWithIdentifier:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v5 || v7)
    {
      objc_storeStrong((id *)&v6->_selectedVehicleIdentifier, a3);
      -[VGVirtualGaragePersisting setSelectedVehicleIdentifier:](v6->_persister, "setSelectedVehicleIdentifier:", v5);
      VGGetVirtualGarageLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Selected vehicle: %@", (uint8_t *)&v11, 0xCu);
      }

      -[VGVirtualGarage _notifyObserversGarageDidUpdateVehicles](v6, "_notifyObserversGarageDidUpdateVehicles");
    }
    else
    {
      VGGetVirtualGarageLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "selectVehicle: tried to select a vehicle that is not in the garage.", (uint8_t *)&v11, 2u);
      }

    }
  }
  objc_sync_exit(v6);

}

- (void)_onboardVehicle:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __CFString *v21;
  NSObject *p_super;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  VGVirtualGarage *v27;
  VGVirtualGarage *obj;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[4];
  id v39;
  __int16 v40;
  __CFString *v41;
  uint8_t buf[4];
  const char *Name;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  if (self->_dataCoordinator)
  {
    obj = self;
    objc_sync_enter(obj);
    v27 = self;
    -[VGDataCoordinator unpairedVehicles](self->_dataCoordinator, "unpairedVehicles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1758];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __35__VGVirtualGarage__onboardVehicle___block_invoke;
    v32[3] = &unk_24C2FB7D8;
    v30 = v31;
    v33 = v30;
    objc_msgSend(v6, "predicateWithBlock:", v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v29, "count") != 1)
    {
      VGGetVirtualGarageLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = v29;
        v26 = v9;
        if (v9)
        {
          if (objc_msgSend(v9, "count"))
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v11 = v26;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v35;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v35 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * i);
                  if (v15)
                  {
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
                    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v16 = CFSTR("<nil>");
                  }

                  objc_msgSend(v10, "addObject:", v16);
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, buf, 16);
              }
              while (v12);
            }

            objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (void *)MEMORY[0x24BDD17C8];
            v19 = v11;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ [%@]"), v20, v17);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v23 = (void *)MEMORY[0x24BDD17C8];
            v24 = v26;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v24);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ (empty)"), v10);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v21 = CFSTR("<nil>");
        }

        *(_DWORD *)v38 = 138412546;
        v39 = v30;
        v40 = 2112;
        v41 = v21;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "_onboardVehicle will onboard vehicle %@, but we didn't find exactly one match in unpairedVehicles: %@", v38, 0x16u);

      }
    }
    VGGetVirtualGarageLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      Name = (const char *)v30;
      _os_log_impl(&dword_20A329000, v25, OS_LOG_TYPE_INFO, "Onboarding vehicle: %@ in virtual garage.", buf, 0xCu);
    }

    -[VGDataCoordinator finishOnboardingVehicle:](v27->_dataCoordinator, "finishOnboardingVehicle:", v30);
    -[VGVirtualGarage _addVehicle:](obj, "_addVehicle:", v30);

    p_super = &obj->super;
    objc_sync_exit(obj);
  }
  else
  {
    VGGetVirtualGarageLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_20A329000, p_super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", buf, 0xCu);
    }
  }

}

uint64_t __35__VGVirtualGarage__onboardVehicle___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)_unpairVehicle:(id)a3
{
  char *v5;
  VGVirtualGarage *v6;
  NSObject *v7;
  int v8;
  const char *Name;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  if (self->_dataCoordinator)
  {
    v6 = self;
    objc_sync_enter(v6);
    VGGetVirtualGarageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      Name = v5;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "Unpairing vehicle: %@", (uint8_t *)&v8, 0xCu);
    }

    -[VGDataCoordinator unpairVehicle:](self->_dataCoordinator, "unpairVehicle:", v5);
    objc_sync_exit(v6);
  }
  else
  {
    VGGetVirtualGarageLog();
    v6 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_20A329000, &v6->super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_setShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4
{
  _BOOL8 v4;
  id v6;
  VGVirtualGarage *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  VGGetVirtualGarageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v10 = v9;
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "setShouldUsePreferredNetworks: %@ for vehicle: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGVirtualGarage _vehicleWithIdentifier:](v7, "_vehicleWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_vehicleByUpdatingUsesPreferredNetworksForRouting:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGVirtualGarage _saveVehicle:syncAcrossDevices:](v7, "_saveVehicle:syncAcrossDevices:", v13, 1);

  objc_sync_exit(v7);
}

- (void)_startContinuousUpdatesIfNeeded
{
  VGVirtualGarage *v3;
  char *v4;
  NSObject *v5;
  _BOOL4 v6;
  int v8;
  const char *Name;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_dataCoordinator)
  {
    v3 = self;
    objc_sync_enter(v3);
    -[VGVirtualGarage selectedVehicle](v3, "selectedVehicle");
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        v8 = 138412290;
        Name = v4;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Garage will start continuous updates for vehicle: %@", (uint8_t *)&v8, 0xCu);
      }

      -[VGDataCoordinator startContinuousUpdatesForVehicle:](self->_dataCoordinator, "startContinuousUpdatesForVehicle:", v4);
    }
    else
    {
      if (v6)
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Garage will not start continuous updates, because there is no selected vehicle", (uint8_t *)&v8, 2u);
      }

    }
    objc_sync_exit(v3);
  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_20A329000, &v3->super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_endContinuousUpdates
{
  VGVirtualGarage *v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (self->_dataCoordinator)
  {
    v3 = self;
    objc_sync_enter(v3);
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "Garage will end continuous updates.", (uint8_t *)&v6, 2u);
    }

    -[VGDataCoordinator endAllContinuousUpdates](self->_dataCoordinator, "endAllContinuousUpdates");
    objc_sync_exit(v3);
  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_20A329000, &v3->super, OS_LOG_TYPE_ERROR, "Tried to use a method (%s) that requires a dataCoordinator.", (uint8_t *)&v6, 0xCu);
    }
  }

}

uint64_t __30__VGVirtualGarage__garageCopy__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPureElectricVehicle") ^ 1;
}

void __44__VGVirtualGarage__forceUpdateWithVehicles___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)garagePersister:(id)a3 wantsToUpdateVehicles:(id)a4
{
  id v6;
  id v7;
  char BOOL;
  NSObject *v9;
  _BOOL4 v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BOOL = GEOConfigGetBOOL();
  VGGetVirtualGarageLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((BOOL & 1) != 0)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_INFO, "garagePersister: %@ wants to update vehicles with vehicles: %@", (uint8_t *)&v13, 0x16u);

    }
    -[VGVirtualGarage _forceUpdateWithVehicles:](self, "_forceUpdateWithVehicles:", v7);
    -[VGVirtualGarage _removeVehiclesWithUninstalledAppsIfNeeded](self, "_removeVehiclesWithUninstalledAppsIfNeeded");
  }
  else
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_INFO, "GeoConfig_EVRoutingUseMapsSyncLiveUpdates is not set, we're ignoring live updates.", (uint8_t *)&v13, 2u);
    }

  }
}

- (void)_notifyObserversGarageDidUpdateVehicles
{
  void *v3;
  id v4;

  -[VGVirtualGarage _garageCopy](self, "_garageCopy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VGVirtualGarage delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "virtualGarageDidUpdate:", v4);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  NSObject *v5;
  int BOOL;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3.var0 == *MEMORY[0x24BE3CB50] && a3.var1 == *(void **)(MEMORY[0x24BE3CB50] + 8))
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL = GEOConfigGetBOOL();
      v7 = CFSTR("NO");
      if (BOOL)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "GEOConfigs changed, isEVRoutingEnabled: %@", (uint8_t *)&v9, 0xCu);

    }
    -[VGVirtualGarage _updateDataCoordinatorAvailability](self, "_updateDataCoordinatorAvailability");
  }
}

- (void)dataCoordinator:(id)a3 wantsToUpdateVehicle:(id)a4 syncAcrossDevices:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v5 = a5;
  v11 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  VGGetVirtualGarageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "DataCoordinator wants to save vehicle: %@", (uint8_t *)&v9, 0xCu);
  }

  -[VGVirtualGarage _saveVehicle:syncAcrossDevices:](self, "_saveVehicle:syncAcrossDevices:", v7, v5);
}

- (void)dataCoordinator:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VGVirtualGarage delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "virtualGarage:didUpdateUnpairedVehicles:", self, v5);

}

- (void)dataCoordinatorDidUpdateInstalledApps:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  VGGetVirtualGarageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "DataCoordinator updated installed apps. Will try to remove vehicles that have no OEM app.", v5, 2u);
  }

  -[VGVirtualGarage _removeVehiclesWithUninstalledAppsIfNeeded](self, "_removeVehiclesWithUninstalledAppsIfNeeded");
}

- (void)virtualGarageRemoveVehicle:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VGVirtualGarage _removeVehicleWithIdentifier:](self, "_removeVehicleWithIdentifier:", v4);

}

- (void)virtualGarageSelectVehicle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VGVirtualGarage selectedVehicle](self, "selectedVehicle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGVirtualGarage _selectVehicleWithIdentifier:](self, "_selectVehicleWithIdentifier:", v6);

  if (objc_msgSend(v4, "isPureElectricVehicle"))
  {
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v9
      || (objc_msgSend(v5, "currentVehicleState"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "currentVehicleState"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "isSignificantlyDifferentFromVehicleState:", v11),
          v11,
          v10,
          v12))
    {
      VGGetVirtualGarageLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v14;
        _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_INFO, "Will fetch SoC for vehicle: (%@) after it's been selected.", (uint8_t *)&v16, 0xCu);

      }
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:](self, "virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:", v15, 1, &__block_literal_global_22);

    }
  }

}

void __46__VGVirtualGarage_virtualGarageSelectVehicle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      v9 = "Failed fetching SoC for newly selected vehicle: (%@) with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_20A329000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v8;
    v9 = "Did finish fetching SoC for vehicle: (%@) after it's been selected.";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

}

- (void)virtualGarageSaveVehicle:(id)a3
{
  -[VGVirtualGarage _saveVehicle:syncAcrossDevices:](self, "_saveVehicle:syncAcrossDevices:", a3, 1);
}

- (void)virtualGarageForceFetchAllVehicles
{
  VGVirtualGarage *obj;

  obj = self;
  objc_sync_enter(obj);
  -[VGDataCoordinator forceFetchAllVehicles](obj->_dataCoordinator, "forceFetchAllVehicles");
  objc_sync_exit(obj);

}

- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3
{
  VGDataCoordinator *dataCoordinator;
  id v5;
  void *v6;
  id v7;

  dataCoordinator = self->_dataCoordinator;
  v5 = a3;
  -[VGDataCoordinator unpairedVehicles](dataCoordinator, "unpairedVehicles");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "copy");
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  VGVirtualGarage *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  int BOOL;
  NSObject *v23;
  _BOOL4 v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  char *v30;
  NSObject *v31;
  uint8_t v32[8];
  _QWORD v33[4];
  id v34;
  id v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  os_signpost_id_t v39;
  uint64_t v40;
  const __CFString *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
      v11 = self;
      objc_sync_enter(v11);
      VGGetDataCoordinatorLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_signpost_id_generate(v12);

      VGGetDataCoordinatorLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "GetVehicleState", (const char *)&unk_20A357DD6, buf, 2u);
      }

      v16 = MEMORY[0x24BDAC760];
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke;
      v37[3] = &unk_24C2FB890;
      v39 = v13;
      v38 = v10;
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD239CC](v37);
      if (objc_msgSend(v8, "isEqualToString:", v11->_selectedVehicleIdentifier))
        -[VGVirtualGarage selectedVehicle](v11, "selectedVehicle");
      else
        -[VGVirtualGarage _vehicleWithIdentifier:](v11, "_vehicleWithIdentifier:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        if ((objc_msgSend(v18, "isPureElectricVehicle") & 1) != 0)
        {
          objc_initWeak((id *)buf, v11);
          v33[0] = v16;
          v33[1] = 3221225472;
          v33[2] = __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_33;
          v33[3] = &unk_24C2FB8E0;
          objc_copyWeak(&v35, (id *)buf);
          v20 = v19;
          v34 = v20;
          v36 = a4;
          v21 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD239CC](v33);
          BOOL = GEOConfigGetBOOL();
          VGGetVirtualGarageLog();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
          if (BOOL)
          {
            if (v24)
            {
              *(_WORD *)v32 = 0;
              _os_log_impl(&dword_20A329000, v23, OS_LOG_TYPE_INFO, "EVRoutingSynchronousVehicleStateUpdate is on, will fetch SOC and wait before calling completion block.", v32, 2u);
            }

            v25 = v17;
          }
          else
          {
            if (v24)
            {
              *(_WORD *)v32 = 0;
              _os_log_impl(&dword_20A329000, v23, OS_LOG_TYPE_INFO, "EVRoutingSynchronousVehicleStateUpdate is off, getting latest SoC from what is currently in the garage.", v32, 2u);
            }

            ((void (**)(_QWORD, id, _QWORD))v17)[2](v17, v20, 0);
            v25 = 0;
          }
          ((void (**)(_QWORD, id, _QWORD))v21)[2](v21, v20, v25);

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
LABEL_29:

          objc_sync_exit(v11);
          goto LABEL_30;
        }
        v26 = CFSTR("Fetched vehicle is not an EV vehicle.");
      }
      else
      {
        v26 = CFSTR("Could not fetch a vehicle.");
      }
      v27 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *MEMORY[0x24BDD0FC8];
      v41 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, -8, v29);
      v30 = (char *)objc_claimAutoreleasedReturnValue();

      VGGetVirtualGarageLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v30;
        _os_log_impl(&dword_20A329000, v31, OS_LOG_TYPE_ERROR, "Unable to fetch a state for vehicle. Error: %@", buf, 0xCu);
      }

      ((void (**)(_QWORD, _QWORD, char *))v17)[2](v17, 0, v30);
      goto LABEL_29;
    }
    VGGetAssertLog();
    v11 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v43 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]";
      v44 = 2082;
      v45 = "reply == nil";
      v46 = 2082;
      v47 = "reply block cannot be nil";
      goto LABEL_12;
    }
  }
  else
  {
    VGGetAssertLog();
    v11 = (VGVirtualGarage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v43 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]";
      v44 = 2082;
      v45 = "identifier == nil";
      v46 = 2082;
      v47 = "vehicleIdentifier cannot be nil";
LABEL_12:
      _os_log_impl(&dword_20A329000, &v11->super, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
  }
LABEL_30:

}

void __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  VGGetDataCoordinatorLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v8, OS_SIGNPOST_INTERVAL_END, v9, "GetVehicleState", (const char *)&unk_20A357DD6, v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)*((_QWORD *)WeakRetained + 4);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_34;
    v11[3] = &unk_24C2FB8B8;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v12 = *(id *)(a1 + 32);
    v15 = *(_BYTE *)(a1 + 48);
    v13 = v6;
    objc_msgSend(v9, "getLatestStateOfVehicle:withReply:", v5, v11);

    objc_destroyWeak(&v14);
  }
  else
  {
    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]_block_invoke";
      v18 = 1024;
      v19 = 737;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __98__VGVirtualGarage_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      VGGetVirtualGarageLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v14 = *(const char **)(a1 + 32);
        v20 = 138412546;
        v21 = v14;
        v22 = 2112;
        v23 = v6;
        v9 = "Failed to get the latest state of vehicle: %@. with error: %@";
        v10 = v8;
        v11 = OS_LOG_TYPE_ERROR;
        v12 = 22;
        goto LABEL_12;
      }
    }
    else if ((objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      VGGetVirtualGarageLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v5;
        v9 = "Updated vehicle: %@ is the same as the existing one. Not saving the state.";
        v10 = v8;
        v11 = OS_LOG_TYPE_INFO;
        v12 = 12;
LABEL_12:
        _os_log_impl(&dword_20A329000, v10, v11, v9, (uint8_t *)&v20, v12);
      }
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_vehicleWithIdentifier:", v17);
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[NSObject _vehicleByUpdatingWithVehicle:](v8, "_vehicleByUpdatingWithVehicle:", v5);
        v15 = objc_claimAutoreleasedReturnValue();

        VGGetVirtualGarageLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = (const char *)v15;
          _os_log_impl(&dword_20A329000, v18, OS_LOG_TYPE_INFO, "Received the latest state of vehicle: %@ through virtualGarageGetLatestStateOfVehicle. Will save the state.", (uint8_t *)&v20, 0xCu);
        }

        objc_msgSend(WeakRetained, "_saveVehicle:syncAcrossDevices:", v15, *(unsigned __int8 *)(a1 + 56));
        goto LABEL_14;
      }
      VGGetVirtualGarageLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v5;
        _os_log_impl(&dword_20A329000, v19, OS_LOG_TYPE_INFO, "Received the latest state of vehicle: %@ through virtualGarageGetLatestStateOfVehicle, but the underlying vehicle was removed from the garage before the callback returned.", (uint8_t *)&v20, 0xCu);
      }

      v8 = 0;
    }
    v15 = (uint64_t)v5;
LABEL_14:

    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, v15, v6);
    v5 = (char *)v15;
    goto LABEL_17;
  }
  VGGetVirtualGarageLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v20 = 136315394;
    v21 = "-[VGVirtualGarage virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]_block_invoke";
    v22 = 1024;
    LODWORD(v23) = 740;
    _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v20, 0x12u);
  }

LABEL_17:
}

- (BOOL)shouldAssumeFullCharge
{
  return self->_shouldAssumeFullCharge;
}

- (VGVirtualGarageDelegate)delegate
{
  return (VGVirtualGarageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
