@implementation RTVehicleLocationCompanionLink

- (RTVehicleLocationCompanionLink)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler_);
}

- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 vehicleEventHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  RTVehicleLocationCompanionLink *v10;

  v6 = (objc_class *)MEMORY[0x1E0D83900];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[RTVehicleLocationCompanionLink initWithQueue:companionLinkClient:vehicleEventHandler:deviceConnectionUpdateHandler:](self, "initWithQueue:companionLinkClient:vehicleEventHandler:deviceConnectionUpdateHandler:", v8, v9, v7, 0);

  return v10;
}

- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 deviceConnectionUpdateHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  RTVehicleLocationCompanionLink *v10;

  v6 = (objc_class *)MEMORY[0x1E0D83900];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = -[RTVehicleLocationCompanionLink initWithQueue:companionLinkClient:vehicleEventHandler:deviceConnectionUpdateHandler:](self, "initWithQueue:companionLinkClient:vehicleEventHandler:deviceConnectionUpdateHandler:", v8, v9, 0, v7);

  return v10;
}

- (RTVehicleLocationCompanionLink)initWithQueue:(id)a3 companionLinkClient:(id)a4 vehicleEventHandler:(id)a5 deviceConnectionUpdateHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTVehicleLocationCompanionLink *v15;
  RTVehicleLocationCompanionLink *v16;
  uint64_t v17;
  id vehicleEventHandler;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  RTVehicleLocationCompanionLink *v24;
  NSObject *v25;
  const char *v26;
  _QWORD v28[4];
  id v29;
  id location[2];
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  objc_super v35;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v24 = 0;
      goto LABEL_10;
    }
    LOWORD(location[0]) = 0;
    v26 = "Invalid parameter not satisfying: queue";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)location, 2u);
    goto LABEL_9;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(location[0]) = 0;
    v26 = "Invalid parameter not satisfying: companionLinkClient";
    goto LABEL_12;
  }
  v35.receiver = self;
  v35.super_class = (Class)RTVehicleLocationCompanionLink;
  v15 = -[RTVehicleLocationCompanionLink init](&v35, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a3);
    v17 = MEMORY[0x1D8232094](v13);
    vehicleEventHandler = v16->_vehicleEventHandler;
    v16->_vehicleEventHandler = (id)v17;

    objc_storeStrong((id *)&v16->_client, a4);
    -[RPCompanionLinkClient setDispatchQueue:](v16->_client, "setDispatchQueue:", v11);
    -[RPCompanionLinkClient setControlFlags:](v16->_client, "setControlFlags:", 32);
    v19 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke;
    v33[3] = &unk_1E92A3958;
    v20 = v14;
    v34 = v20;
    -[RTVehicleLocationCompanionLink client](v16, "client");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDeviceFoundHandler:", v33);

    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_16;
    v31[3] = &unk_1E92A3958;
    v32 = v20;
    -[RTVehicleLocationCompanionLink client](v16, "client");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDeviceLostHandler:", v31);

    objc_initWeak(location, v16);
    -[RTVehicleLocationCompanionLink client](v16, "client");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_17;
    v28[3] = &unk_1E92A3980;
    objc_copyWeak(&v29, location);
    objc_msgSend(v23, "activateWithCompletion:", v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);

  }
  self = v16;
  v24 = self;
LABEL_10:

  return v24;
}

void __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "model");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("Unknown Model");
    }

    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "name");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("Unknown Name");
    }

    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "effectiveIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "RTVehicleLocationCompanionLink, onDeviceFound, id, %@, name, %@, model, %@", (uint8_t *)&v11, 0x20u);

    }
  }

}

void __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "model");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("Unknown Model");
    }

    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "name");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("Unknown Name");
    }

    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v3, "effectiveIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v10;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "RTVehicleLocationCompanionLink, onDeviceLost, id, %@, name, %@, model, %@", (uint8_t *)&v11, 0x20u);

    }
  }

}

void __118__RTVehicleLocationCompanionLink_initWithQueue_companionLinkClient_vehicleEventHandler_deviceConnectionUpdateHandler___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Failed to activate RPCompanionLinkClient with error %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, rapport session ready to listen for incoming devices", (uint8_t *)&v8, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vehicleEventHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(WeakRetained, "registerEventHandlers");

}

- (id)encodeVehicleEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("clear"), CFSTR("type"));
LABEL_8:
    v10 = v5;
    goto LABEL_9;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v7)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("update"), CFSTR("type"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("payload"));

    goto LABEL_8;
  }
  v8 = v7;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Encoding error, %@", buf, 0xCu);
  }

  v10 = 0;
LABEL_9:

  return v10;
}

- (id)decodeVehicleEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("update"), "isEqualToString:", v4))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("payload"));
    v5 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (!v7)
    {
LABEL_12:

      goto LABEL_13;
    }
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Decoding error, %@", buf, 0xCu);
    }

    v5 = v6;
LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  if ((objc_msgSend(CFSTR("clear"), "isEqualToString:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, Decoding error, unknown event type, %@", buf, 0xCu);
    }
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
  v6 = 0;
LABEL_13:

  return v6;
}

- (void)registerEventHandlers
{
  NSObject *v3;
  RPCompanionLinkClient *client;
  _QWORD v5[5];
  uint8_t buf[16];

  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, registering request handlers", buf, 2u);
  }

  client = self->_client;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__RTVehicleLocationCompanionLink_registerEventHandlers__block_invoke;
  v5[3] = &unk_1E92A39A8;
  v5[4] = self;
  -[RPCompanionLinkClient registerEventID:options:handler:](client, "registerEventID:options:handler:", CFSTR("com.apple.routined.rapport.vehicleEventUpdate"), 0, v5);
}

void __55__RTVehicleLocationCompanionLink_registerEventHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint8_t v8[16];

  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, received an event update from a nearby device", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "vehicleEventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeVehicleEvent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "vehicleEventHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v6);

  }
}

- (BOOL)_companionLinkConnected
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[RPCompanionLinkClient activeDevices](self->_client, "activeDevices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = ((char *)i + 1))
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "statusFlags") & 1) != 0)
        {
          _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
          v3 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v13 = v6;
            _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, companion link connected device %@", buf, 0xCu);
          }

          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (void)sendVehicleEvent:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[RTVehicleLocationCompanionLink _companionLinkConnected](self, "_companionLinkConnected"))
  {
    -[RTVehicleLocationCompanionLink encodeVehicleEvent:](self, "encodeVehicleEvent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[RTVehicleLocationCompanionLink client](self, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0D83968];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__RTVehicleLocationCompanionLink_sendVehicleEvent_handler___block_invoke;
      v14[3] = &unk_1E9297568;
      v15 = v7;
      objc_msgSend(v9, "sendEventID:event:destinationID:options:completion:", CFSTR("com.apple.routined.rapport.vehicleEventUpdate"), v8, v10, 0, v14);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, invalid payload, %@", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[RPCompanionLinkClient activeDevices](self->_client, "activeDevices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, no connected clients, %@", buf, 0xCu);

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __59__RTVehicleLocationCompanionLink_sendVehicleEvent_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "RTVehicleLocationCompanionLink, failed to post a vehicle event, err, %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "RTVehicleLocationCompanionLink, send a vehicle event to paried companion device", (uint8_t *)&v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (RPCompanionLinkClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)vehicleEventHandler
{
  return self->_vehicleEventHandler;
}

- (void)setVehicleEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_vehicleEventHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
