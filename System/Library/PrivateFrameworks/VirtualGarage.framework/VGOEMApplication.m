@implementation VGOEMApplication

- (VGOEMApplication)initWithIdentifier:(id)a3 applicationRecord:(id)a4
{
  id v7;
  id v8;
  VGOEMApplication *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VGOEMApplication;
  v9 = -[VGOEMApplication init](&v14, sel_init);
  if (v9)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("VGOEMApplicationQueue", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_applicationRecord, a4);
  }

  return v9;
}

- (unint64_t)_VGChargingConnectorTypeOptionsFromINCarChargingConnectorTypes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (_MergedGlobals_4 != -1)
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_7);
  v4 = (id)qword_253DA4248;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 |= objc_msgSend(v13, "unsignedIntegerValue");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_VGChargingConnectorTypeOptionFromINCarChargingConnectorType:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = a3;
  if (_MergedGlobals_4 != -1)
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_7);
  v4 = (id)qword_253DA4248;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isValidConsumptionModelForResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (GEOConfigGetBOOL())
  {
    GEOConfigGetString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consumptionFormulaArguments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (-[VGOEMApplication allowedFormulaIDs](self, "allowedFormulaIDs"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "containsObject:", v7),
          v8,
          (v9 & 1) != 0))
    {
      v10 = 1;
    }
    else
    {
      VGGetOEMApplicationLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[VGOEMApplication allowedFormulaIDs](self, "allowedFormulaIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412546;
        v15 = v7;
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "Allowlisted formula IDs do not contain the formula in the Consumption Arguments. Current formula: %@, Allowed formula IDs: %@", (uint8_t *)&v14, 0x16u);

      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)_vehicleStateFromResponse:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v44;
  void *v45;
  VGVehicleState *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  VGOEMApplication *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  NSObject *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  VGGetVirtualGarageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v9;
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(v7, "carIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "dateOfLastStateUpdate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "calendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v12, "calendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        VGGetOEMApplicationLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20A329000, v18, OS_LOG_TYPE_INFO, "Date components did not specify a calendar; assuming the current one",
            buf,
            2u);
        }

        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v14;
      objc_msgSend(v14, "dateFromComponents:", v12);
      v20 = objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_19;
      VGGetOEMApplicationLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v60 = (uint64_t)v12;
        _os_log_impl(&dword_20A329000, v21, OS_LOG_TYPE_ERROR, "Failed to get an updateDate from components: %@", buf, 0xCu);
      }

    }
    VGGetOEMApplicationLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v60 = (uint64_t)v7;
      _os_log_impl(&dword_20A329000, v22, OS_LOG_TYPE_ERROR, "Assuming vehicle state response: %{private}@ was created now", buf, 0xCu);
    }

    v20 = objc_opt_new();
LABEL_19:
    v46 = [VGVehicleState alloc];
    objc_msgSend(v7, "carIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chargePercentRemaining");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "distanceRemainingElectric");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumDistanceElectric");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimumBatteryCapacity");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentBatteryCapacity");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maximumBatteryCapacity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "consumptionFormulaArguments");
    v24 = objc_claimAutoreleasedReturnValue();
    v54 = self;
    v55 = v10;
    v56 = (void *)v24;
    if (v24)
    {
      v58 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v24, 0, &v58);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v58;
      v27 = v26;
      if (!v25 || v26)
      {
        VGGetVirtualGarageLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v60 = (uint64_t)v56;
          v61 = 2112;
          v62 = v27;
          _os_log_impl(&dword_20A329000, v29, OS_LOG_TYPE_ERROR, "Failed to serialize VGVehicleArguments into a string. arguments: %@, error: %@", buf, 0x16u);
        }
        v28 = 0;
      }
      else
      {
        v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v25, 4);
        VGGetOEMApplicationLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v60 = v28;
          _os_log_impl(&dword_20A329000, v29, OS_LOG_TYPE_INFO, "Serializing arguments as: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      VGGetVirtualGarageLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v27, OS_LOG_TYPE_INFO, "Tried to serialize nil arguments.", buf, 2u);
      }
      v28 = 0;
    }

    objc_msgSend(v7, "chargingFormulaArguments");
    v30 = objc_claimAutoreleasedReturnValue();
    v53 = v12;
    v45 = (void *)v30;
    if (v30)
    {
      v31 = v30;
      v58 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v30, 0, &v58);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v58;
      v34 = v33;
      if (!v32 || v33)
      {
        v35 = (void *)v28;
        VGGetVirtualGarageLog();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v23;
        v39 = (void *)v20;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v60 = v31;
          v61 = 2112;
          v62 = v34;
          _os_log_impl(&dword_20A329000, v37, OS_LOG_TYPE_ERROR, "Failed to serialize VGVehicleArguments into a string. arguments: %@, error: %@", buf, 0x16u);
        }
        v36 = 0;
      }
      else
      {
        v35 = (void *)v28;
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v32, 4);
        VGGetOEMApplicationLog();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v23;
        v39 = (void *)v20;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v60 = (uint64_t)v36;
          _os_log_impl(&dword_20A329000, v37, OS_LOG_TYPE_INFO, "Serializing arguments as: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      v35 = (void *)v28;
      v38 = (void *)v23;
      v39 = (void *)v20;
      VGGetVirtualGarageLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v34, OS_LOG_TYPE_INFO, "Tried to serialize nil arguments.", buf, 2u);
      }
      v36 = 0;
    }

    objc_msgSend(v7, "charging");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "BOOLValue");
    objc_msgSend(v7, "activeConnector");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v44) = v41;
    v47 = -[VGVehicleState initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:](v46, "initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:", v57, v39, 2, v52, v38, v51, v50, v49, v48, v35, v36, v44, -[VGOEMApplication _VGChargingConnectorTypeOptionFromINCarChargingConnectorType:](v54, "_VGChargingConnectorTypeOptionFromINCarChargingConnectorType:", v42));

    v17 = (void *)v47;
    v10 = v55;
    v16 = v53;
    goto LABEL_44;
  }
  if (!a4)
  {
    v17 = 0;
    goto LABEL_45;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  GEOErrorDomain();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, -11, 0);
  v17 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
  return v17;
}

- (id)_vehiclesFromListCarsIntentResponse:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  CGColor *v16;
  VGVehicle *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  VGVehicle *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const CGFloat *Components;
  size_t v37;
  CGColorSpace *ColorSpace;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  id v44;
  void *v45;
  id obj;
  uint64_t v47;
  VGOEMApplication *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  VGVehicle *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v64 = (uint64_t)v7;
    _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (objc_msgSend(v5, "code") == 3)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v5, "cars");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    VGGetOEMApplicationLog();
    v11 = objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);

    if ((_DWORD)v9)
      v45 = (void *)objc_opt_new();
    else
      v45 = 0;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v44 = v5;
    objc_msgSend(v5, "cars");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v50)
    {
      v47 = *(_QWORD *)v59;
      v48 = self;
      v49 = v10;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v59 != v47)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v14);
          v16 = (CGColor *)objc_msgSend(v15, "color");
          v17 = [VGVehicle alloc];
          objc_msgSend(v15, "displayName");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "year");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "make");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "model");
          v53 = v14;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v17;
          if (v16)
          {
            VGHexRepresentationFromCGColor(v16);
            v18 = objc_claimAutoreleasedReturnValue();
            v51 = (void *)v18;
          }
          else
          {
            v18 = 0;
          }
          objc_msgSend(v15, "headUnit");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "iAP2Identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "headUnit");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bluetoothIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "supportedChargingConnectors");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[VGOEMApplication _VGChargingConnectorTypeOptionsFromINCarChargingConnectorTypes:](self, "_VGChargingConnectorTypeOptionsFromINCarChargingConnectorTypes:", v23);
          -[VGOEMApplication _powerByConnectorDictionaryFromCar:](self, "_powerByConnectorDictionaryFromCar:", v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[VGVehicle initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:](v52, "initWithDisplayName:year:manufacturer:model:colorHex:headUnitIdentifier:headUnitBluetoothIdentifier:supportedConnectors:powerByConnector:", v57, v56, v55, v54, v18, v20, v22, v24, v25);

          if (v16)
          objc_msgSend(v15, "carIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v27, "copy");
          -[VGVehicle setSiriIntentsIdentifier:](v26, "setSiriIntentsIdentifier:", v28);

          self = v48;
          -[VGOEMApplication identifier](v48, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "copy");
          -[VGVehicle setPairedAppIdentifier:](v26, "setPairedAppIdentifier:", v30);

          VGGetOEMApplicationLog();
          v31 = objc_claimAutoreleasedReturnValue();
          LODWORD(v30) = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

          v10 = v49;
          if ((_DWORD)v30)
          {
            v32 = (void *)MEMORY[0x24BDD16A8];
            -[VGVehicle displayName](v26, "displayName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[VGVehicle siriIntentsIdentifier](v26, "siriIntentsIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@ (%@) "), v33, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              Components = CGColorGetComponents(v16);
              if (CGColorGetNumberOfComponents(v16))
              {
                v37 = 0;
                do
                  objc_msgSend(v35, "appendFormat:", CFSTR("%f "), *(_QWORD *)&Components[v37++]);
                while (v37 < CGColorGetNumberOfComponents(v16));
              }
              ColorSpace = CGColorGetColorSpace(v16);
              objc_msgSend(v35, "appendFormat:", CFSTR("%@"), CGColorSpaceGetName(ColorSpace));
            }
            else
            {
              objc_msgSend(v35, "appendString:", CFSTR("<no color>"));
            }
            objc_msgSend(v45, "addObject:", v35);

          }
          -[NSObject addObject:](v49, "addObject:", v26);

          v14 = v53 + 1;
        }
        while (v53 + 1 != v50);
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v50);
    }

    VGGetOEMApplicationLog();
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

    v5 = v44;
    if (v40)
    {
      VGGetOEMApplicationLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v45, "componentsJoinedByString:", CFSTR(", "));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = (uint64_t)v42;
        _os_log_impl(&dword_20A329000, v41, OS_LOG_TYPE_INFO, "_vehiclesFromListCarsIntentResponse color are: %@", buf, 0xCu);

      }
    }
    v13 = -[NSObject copy](v10, "copy");

  }
  else
  {
    VGGetOEMApplicationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(v5, "code");
      *(_DWORD *)buf = 134217984;
      v64 = v12;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Listing cars received a non-Success response code: %ld", buf, 0xCu);
    }
    v13 = (id)MEMORY[0x24BDBD1A8];
  }

  return v13;
}

- (id)_powerByConnectorDictionaryFromCar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  VGOEMApplication *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __int128 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  if (_MergedGlobals_4 != -1)
    dispatch_once(&_MergedGlobals_4, &__block_literal_global_7);
  objc_msgSend((id)qword_253DA4248, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v27;
    *(_QWORD *)&v8 = 134218242;
    v24 = v8;
    v25 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v4, "supportedChargingConnectors", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if (v14)
        {
          objc_msgSend(v4, "maximumPowerForChargingConnectorType:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = -[VGOEMApplication _VGChargingConnectorTypeOptionFromINCarChargingConnectorType:](self, "_VGChargingConnectorTypeOptionFromINCarChargingConnectorType:", v12);
            if (v16)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
              v17 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);
            }
            else
            {
              VGGetOEMApplicationLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v4, "powerPerConnectors");
                v18 = self;
                v19 = v5;
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v24;
                v31 = v12;
                v32 = 2112;
                v33 = v20;
                _os_log_impl(&dword_20A329000, v17, OS_LOG_TYPE_ERROR, "Failed to extract power for connector type: %lu, from car array: %@.", buf, 0x16u);

                v5 = v19;
                self = v18;
                v6 = v25;
              }
            }

          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

  VGGetOEMApplicationLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v5;
    _os_log_impl(&dword_20A329000, v21, OS_LOG_TYPE_INFO, "Constructed powerByConnector dictionary: %@", buf, 0xCu);
  }

  v22 = (void *)objc_msgSend(v5, "copy");
  return v22;
}

- (void)listCarsWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  char *v7;
  NSObject *queue;
  NSObject *v9;
  NSObject *v10;
  NSString *identifier;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    if (-[VGOEMApplication isEnabled](self, "isEnabled"))
    {
      objc_initWeak((id *)buf, self);
      queue = self->_queue;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke;
      v12[3] = &unk_24C2FB5A0;
      objc_copyWeak(&v14, (id *)buf);
      v13 = v5;
      dispatch_async(queue, v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      VGGetOEMApplicationLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        *(_DWORD *)buf = 138412290;
        v16 = (const char *)identifier;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "Application %@ is not enabled returning no results", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, MEMORY[0x24BDBD1A8], 0);
    }
  }
  else
  {
    VGGetAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v16 = "-[VGOEMApplication listCarsWithCompletion:]";
      v17 = 2082;
      v18 = "completion == nil";
      v19 = 2082;
      v20 = "Completion cannot be nil!";
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }

  }
}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD9E08]);
    objc_msgSend(WeakRetained, "_connectionWithIntent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    VGGetOEMApplicationLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (char *)os_signpost_id_generate(v6);

    VGGetOEMApplicationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A329000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "listCarsIntentSignpost", (const char *)&unk_20A357DD6, buf, 2u);
    }

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_21;
    v11[3] = &unk_24C2FB9A8;
    objc_copyWeak(v14, v2);
    v14[1] = v7;
    v13 = *(id *)(a1 + 32);
    v10 = v5;
    v12 = v10;
    objc_msgSend(v10, "resumeWithCompletionHandler:", v11);

    objc_destroyWeak(v14);
  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[VGOEMApplication listCarsWithCompletion:]_block_invoke";
      v17 = 1024;
      v18 = 310;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[2];
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      VGGetOEMApplicationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 56);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v9, OS_SIGNPOST_INTERVAL_END, v10, "listCarsIntentSignpost", (const char *)&unk_20A357DD6, buf, 2u);
      }

      v11 = WeakRetained[1];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_22;
      block[3] = &unk_24C2FB930;
      v21 = *(id *)(a1 + 40);
      v12 = v6;
      v20 = v12;
      dispatch_async(v11, block);
      VGGetOEMApplicationLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = (const char *)v12;
        _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_ERROR, "Returning because of a connection error: %@", buf, 0xCu);
      }

    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_24;
      v15[3] = &unk_24C2FB980;
      v18[1] = *(id *)(a1 + 56);
      objc_copyWeak(v18, (id *)(a1 + 48));
      v17 = *(id *)(a1 + 40);
      v16 = *(id *)(a1 + 32);
      objc_msgSend(v5, "handleIntentWithCompletionHandler:", v15);

      objc_destroyWeak(v18);
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[VGOEMApplication listCarsWithCompletion:]_block_invoke";
      v24 = 1024;
      v25 = 318;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }

  }
}

uint64_t __43__VGOEMApplication_listCarsWithCompletion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  NSObject *v15;
  NSObject **v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  VGGetOEMApplicationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v8, OS_SIGNPOST_INTERVAL_END, v9, "listCarsIntentSignpost", (const char *)&unk_20A357DD6, buf, 2u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__VGOEMApplication_listCarsWithCompletion___block_invoke_25;
    block[3] = &unk_24C2FB958;
    v15 = v6;
    v19 = *(id *)(a1 + 40);
    v16 = v11;
    v17 = v5;
    v18 = *(id *)(a1 + 32);
    dispatch_async(v12, block);

    v13 = v15;
  }
  else
  {
    VGGetVirtualGarageLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[VGOEMApplication listCarsWithCompletion:]_block_invoke";
      v22 = 1024;
      v23 = 323;
      _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }
  }

}

void __43__VGOEMApplication_listCarsWithCompletion___block_invoke_25(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "underlyingError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "underlyingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

    VGGetOEMApplicationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "underlyingError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "Returning because of an underlying error in the connection: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_vehiclesFromListCarsIntentResponse:", *(_QWORD *)(a1 + 48));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "underlyingError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v9, v8);

    objc_msgSend(*(id *)(a1 + 56), "reset");
  }
}

- (void)getStateOfChargeForVehicle:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, NSObject *, _QWORD);
  NSObject *v9;
  char *v10;
  NSObject *queue;
  NSObject *v12;
  NSObject *v13;
  NSString *identifier;
  _QWORD block[4];
  id v16;
  void (**v17)(id, NSObject *, _QWORD);
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, NSObject *, _QWORD))a4;
  if (!v8)
  {
    VGGetAssertLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v20 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]";
      v21 = 2082;
      v22 = "completion == nil";
      v23 = 2082;
      v24 = "Completion cannot be nil!";
      _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
    goto LABEL_11;
  }
  VGGetVirtualGarageLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v10;
    _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (!-[VGOEMApplication isEnabled](self, "isEnabled"))
  {
    VGGetOEMApplicationLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138412290;
      v20 = (const char *)identifier;
      _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_INFO, "Application %@ is not enabled returning existing SoC", buf, 0xCu);
    }

    objc_msgSend(v7, "currentVehicleState");
    v12 = objc_claimAutoreleasedReturnValue();
    v8[2](v8, v12, 0);
LABEL_11:

    goto LABEL_12;
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke;
  block[3] = &unk_24C2FB508;
  objc_copyWeak(&v18, (id *)buf);
  v16 = v7;
  v17 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
LABEL_12:

}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v4 = objc_alloc(MEMORY[0x24BDDA1A0]);
    objc_msgSend(a1[4], "siriIntentsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v5, v6, 0);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9D48]), "initWithCarName:", v7);
    objc_msgSend(WeakRetained, "_connectionWithIntent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VGGetOEMApplicationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (char *)os_signpost_id_generate(v10);

    VGGetOEMApplicationLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_20A329000, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v11, "stateOfChargeIntentSignpost", (const char *)&unk_20A357DD6, buf, 2u);
    }

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_30;
    v15[3] = &unk_24C2FBA20;
    objc_copyWeak(v19, v2);
    v19[1] = v11;
    v18 = a1[5];
    v14 = v9;
    v16 = v14;
    v17 = a1[4];
    objc_msgSend(v14, "resumeWithCompletionHandler:", v15);

    objc_destroyWeak(v19);
  }
  else
  {
    VGGetVirtualGarageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]_block_invoke";
      v22 = 1024;
      v23 = 351;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }

}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19[2];
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      VGGetOEMApplicationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 64);
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_20A329000, v9, OS_SIGNPOST_INTERVAL_END, v10, "stateOfChargeIntent", (const char *)&unk_20A357DD6, buf, 2u);
      }

      v11 = WeakRetained[1];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_31;
      block[3] = &unk_24C2FB930;
      v22 = *(id *)(a1 + 48);
      v12 = v6;
      v21 = v12;
      dispatch_async(v11, block);
      VGGetOEMApplicationLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = (const char *)v12;
        _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_ERROR, "Returning because of a connection error: %@", buf, 0xCu);
      }

    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_32;
      v15[3] = &unk_24C2FB9F8;
      v19[1] = *(id *)(a1 + 64);
      objc_copyWeak(v19, (id *)(a1 + 56));
      v18 = *(id *)(a1 + 48);
      v16 = *(id *)(a1 + 32);
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v5, "handleIntentWithCompletionHandler:", v15);

      objc_destroyWeak(v19);
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]_block_invoke";
      v25 = 1024;
      v26 = 359;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }

  }
}

uint64_t __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  _QWORD *WeakRetained;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[4];
  id v34;
  _QWORD *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  VGGetOEMApplicationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20A329000, v8, OS_SIGNPOST_INTERVAL_END, v9, "stateOfChargeIntentSignpost", (const char *)&unk_20A357DD6, buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      VGGetOEMApplicationLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v6;
        _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "error in handleIntentWithCompletionHandler: %@", buf, 0xCu);
      }

      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v6, "underlyingError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);
      }
      else
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        GEOErrorDomain();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Intents error with code: %ld"), objc_msgSend(v6, "errorCode"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -11, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v20);

      }
      objc_msgSend(*(id *)(a1 + 32), "reset");
    }
    else
    {
      v15 = v5;
      if (objc_msgSend(v15, "code") == 4)
      {

      }
      else
      {
        v21 = objc_msgSend(v15, "code");

        if (v21 != 5)
        {
          if ((objc_msgSend(WeakRetained, "_isValidConsumptionModelForResponse:", v15) & 1) != 0)
          {
            v28 = WeakRetained[1];
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_41;
            block[3] = &unk_24C2FB9D0;
            v34 = 0;
            v39 = *(id *)(a1 + 48);
            v35 = WeakRetained;
            v36 = v15;
            v37 = *(id *)(a1 + 40);
            v38 = *(id *)(a1 + 32);
            dispatch_async(v28, block);

          }
          else
          {
            v29 = (void *)MEMORY[0x24BDD1540];
            GEOErrorDomain();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = *MEMORY[0x24BDD0FC8];
            v41 = CFSTR("Invalid Formula");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, -11, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            objc_msgSend(*(id *)(a1 + 32), "reset");

          }
          goto LABEL_21;
        }
      }
      VGGetOEMApplicationLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v47 = (const char *)v15;
        _os_log_impl(&dword_20A329000, v22, OS_LOG_TYPE_ERROR, "Unsupported response code: %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Intent response with unsupported code: %ld"), objc_msgSend(v15, "code"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, -11, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 32), "reset");

    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[VGOEMApplication getStateOfChargeForVehicle:completion:]_block_invoke";
      v48 = 1024;
      v49 = 364;
      _os_log_impl(&dword_20A329000, v14, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", buf, 0x12u);
    }

  }
LABEL_21:

}

void __58__VGOEMApplication_getStateOfChargeForVehicle_completion___block_invoke_41(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "underlyingError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "underlyingError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

    VGGetOEMApplicationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "underlyingError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "Returning because of an underlying error in the connection: %@", buf, 0xCu);

    }
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v16 = 0;
    objc_msgSend(v7, "_vehicleStateFromResponse:error:", v8, &v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;
    if (v9)
    {
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "siriIntentsIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) == 0)
      {
        VGGetOEMApplicationLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          v14 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          v18 = v9;
          v19 = 2112;
          v20 = v14;
          _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_FAULT, "Received a vehicle state: %@ that doesn't apply to the provided vehicle: %@", buf, 0x16u);
        }

        v9 = 0;
      }
    }
    VGGetOEMApplicationLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_INFO, "getStateOfChargeForVehicle fetched %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    objc_msgSend(*(id *)(a1 + 64), "reset");

  }
}

- (void)_createChargeStreamingConnectionIfNeededForVehicle:(id)a3
{
  id v4;
  NSObject *queue;
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
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __71__VGOEMApplication__createChargeStreamingConnectionIfNeededForVehicle___block_invoke;
    v7[3] = &unk_24C2FB3C8;
    objc_copyWeak(&v9, (id *)location);
    v8 = v4;
    dispatch_async(queue, v7);

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
      *(_QWORD *)&location[4] = "-[VGOEMApplication _createChargeStreamingConnectionIfNeededForVehicle:]";
      v11 = 2082;
      v12 = "vehicle == nil";
      v13 = 2082;
      v14 = "Vehicle cannot be nil";
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", location, 0x20u);
    }

  }
}

void __71__VGOEMApplication__createChargeStreamingConnectionIfNeededForVehicle___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[VGOEMApplication _createChargeStreamingConnectionIfNeededForVehicle:]_block_invoke";
      v16 = 1024;
      LODWORD(v17) = 422;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_9;
  }
  if (!WeakRetained[2] && objc_msgSend(WeakRetained, "isEnabled"))
  {
    v4 = objc_alloc(MEMORY[0x24BDDA1A0]);
    objc_msgSend(*(id *)(a1 + 32), "siriIntentsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v5, v6, 0);

    v8 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9D48]), "initWithCarName:", v7);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE5B900]), "initWithIntent:", v8);
    v10 = v3[2];
    v3[2] = (id)v9;

    objc_msgSend(v3[2], "setRequiresTCC:", 0);
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3[2], "intent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setLaunchId:", v11);

    VGGetOEMApplicationLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_20A329000, v13, OS_LOG_TYPE_INFO, "Started a new Intent %@ with %@", (uint8_t *)&v14, 0x16u);
    }

LABEL_9:
  }

}

- (void)startSendingChargeUpdatesForVehicle:(id)a3
{
  id v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  char *v9;
  NSObject *queue;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    VGGetOEMApplicationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[VGOEMApplication identifier](self, "identifier");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "%@ starting updates", buf, 0xCu);

    }
    -[VGOEMApplication _createChargeStreamingConnectionIfNeededForVehicle:](self, "_createChargeStreamingConnectionIfNeededForVehicle:", v5);
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke;
    block[3] = &unk_24C2FB268;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    VGGetAssertLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "-[VGOEMApplication startSendingChargeUpdatesForVehicle:]";
      v16 = 2082;
      v17 = "vehicle == nil";
      v18 = 2082;
      v19 = "Vehicle cannot be nil";
      _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }

  }
}

void __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 2);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke_46;
    v6[3] = &unk_24C2FBA48;
    objc_copyWeak(&v7, v1);
    objc_msgSend(v4, "resumeWithCompletionHandler:", v6);
    objc_destroyWeak(&v7);
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[VGOEMApplication startSendingChargeUpdatesForVehicle:]_block_invoke";
      v10 = 1024;
      v11 = 447;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __56__VGOEMApplication_startSendingChargeUpdatesForVehicle___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      VGGetOEMApplicationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v9 = (char *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "Connection error while receiving updates: %@", (uint8_t *)&v11, 0xCu);

      }
    }
    objc_msgSend(v5, "startSendingUpdatesToObserver:", WeakRetained);
  }
  else
  {
    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[VGOEMApplication startSendingChargeUpdatesForVehicle:]_block_invoke";
      v13 = 1024;
      v14 = 450;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v11, 0x12u);
    }

  }
}

- (void)stopSendingChargeUpdatesForVehicle:(id)a3
{
  id v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  char *v9;
  NSObject *queue;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v7 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    VGGetOEMApplicationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[VGOEMApplication identifier](self, "identifier");
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "%@ stopping updates", buf, 0xCu);

    }
    -[VGOEMApplication _createChargeStreamingConnectionIfNeededForVehicle:](self, "_createChargeStreamingConnectionIfNeededForVehicle:", v5);
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke;
    block[3] = &unk_24C2FB268;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    VGGetAssertLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v15 = "-[VGOEMApplication stopSendingChargeUpdatesForVehicle:]";
      v16 = 2082;
      v17 = "vehicle == nil";
      v18 = 2082;
      v19 = "Vehicle cannot be nil";
      _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }

  }
}

void __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 2);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke_47;
    v6[3] = &unk_24C2FBA48;
    objc_copyWeak(&v7, v1);
    objc_msgSend(v4, "resumeWithCompletionHandler:", v6);
    objc_destroyWeak(&v7);
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[VGOEMApplication stopSendingChargeUpdatesForVehicle:]_block_invoke";
      v10 = 1024;
      v11 = 471;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }

  }
}

void __55__VGOEMApplication_stopSendingChargeUpdatesForVehicle___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      VGGetOEMApplicationLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "localizedDescription");
        v9 = (char *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "Connection error while receiving updates: %@", (uint8_t *)&v11, 0xCu);

      }
    }
    objc_msgSend(v5, "stopSendingUpdates");
    objc_msgSend(WeakRetained[2], "reset");
    v10 = WeakRetained[2];
    WeakRetained[2] = 0;
  }
  else
  {
    VGGetVirtualGarageLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[VGOEMApplication stopSendingChargeUpdatesForVehicle:]_block_invoke";
      v13 = 1024;
      v14 = 473;
      _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v11, 0x12u);
    }
  }

}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v5;
  id WeakRetained;
  NSObject *queue;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  _BYTE location[12];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chargeStreamingDelegate);
  if (WeakRetained)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__VGOEMApplication_intentResponseDidUpdate_withSerializedCacheItems___block_invoke;
    block[3] = &unk_24C2FB378;
    objc_copyWeak(&v12, (id *)location);
    v10 = v5;
    v11 = WeakRetained;
    dispatch_async(queue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    VGGetVirtualGarageLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[VGOEMApplication intentResponseDidUpdate:withSerializedCacheItems:]";
      v14 = 1024;
      v15 = 488;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "strongChargeStreamingDelegate went away in %s line %d", location, 0x12u);
    }

  }
}

void __69__VGOEMApplication_intentResponseDidUpdate_withSerializedCacheItems___block_invoke(id *a1)
{
  id *WeakRetained;
  NSObject *v3;
  char *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    VGGetOEMApplicationLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained, "identifier");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v5 = a1[4];
      *(_DWORD *)buf = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "%@ received INGetCarPowerLevelStatusResponse live update: %@", buf, 0x16u);

    }
    if ((objc_msgSend(WeakRetained, "isEnabled") & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = a1[4];
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v7 = v6;
          if (-[NSObject code](v7, "code") == 4)
          {

            goto LABEL_21;
          }
          v17 = -[NSObject code](v7, "code");

          if (v17 == 5)
          {
LABEL_21:
            VGGetOEMApplicationLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              v18 = -[NSObject code](v7, "code");
              *(_DWORD *)buf = 134217984;
              v24 = (const char *)v18;
              v14 = "Unsupported response code: %ld";
              v15 = v13;
              v16 = 12;
              goto LABEL_23;
            }
LABEL_24:

            goto LABEL_25;
          }
          if ((objc_msgSend(WeakRetained, "_isValidConsumptionModelForResponse:", v7) & 1) != 0)
          {
            v19 = a1[4];
            v22 = 0;
            objc_msgSend(WeakRetained, "_vehicleStateFromResponse:error:", v19, &v22);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v22;
            if (v20)
            {
              objc_msgSend(a1[5], "vehicleStateUpdated:", v20);
            }
            else
            {
              VGGetOEMApplicationLog();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v24 = (const char *)v13;
                _os_log_impl(&dword_20A329000, v21, OS_LOG_TYPE_ERROR, "Response failed to deserialize to a valid VGVehicleState %@", buf, 0xCu);
              }

            }
            goto LABEL_24;
          }
          VGGetOEMApplicationLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_WORD *)buf = 0;
          v14 = "Formula from the response is invalid";
        }
        else
        {
          VGGetOEMApplicationLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_WORD *)buf = 0;
          v14 = "chargeStreamingDelegate does not implement required method vehicleStateUpdated:";
        }
        v15 = v13;
        v16 = 2;
LABEL_23:
        _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
        goto LABEL_24;
      }
      VGGetOEMApplicationLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v24 = (const char *)v12;
        v8 = "Unexpected streaming response class. Received an %@ instance";
        v9 = v6;
        v10 = 12;
        goto LABEL_16;
      }
    }
    else
    {
      VGGetOEMApplicationLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_ERROR, "Received stream callback when disabled", buf, 2u);
      }

      objc_msgSend(WeakRetained[2], "reset");
      v6 = WeakRetained[2];
      WeakRetained[2] = 0;
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[VGOEMApplication intentResponseDidUpdate:withSerializedCacheItems:]_block_invoke";
      v25 = 1024;
      LODWORD(v26) = 492;
      v8 = "strongSelf went away in %s line %d";
      v9 = v6;
      v10 = 18;
LABEL_16:
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    }
  }
LABEL_25:

}

- (id)_connectionWithIntent:(id)a3
{
  id v5;
  NSObject *v6;
  VGOEMApplication *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  VGOEMApplication *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VGGetVirtualGarageLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (VGOEMApplication *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  -[VGOEMApplication identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setLaunchId:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE5B900]), "initWithIntent:", v5);
  objc_msgSend(v9, "setRequiresTCC:", 0);
  objc_msgSend(v9, "setRequiresTrustCheck:", GEOConfigGetBOOL());
  GEOConfigGetDouble();
  v11 = v10;
  VGGetOEMApplicationLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2048;
    v19 = v11;
    _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_INFO, "Creating connection for OEMApp: (%@), with timeout %.2f", buf, 0x16u);
  }

  objc_msgSend(v9, "setRequestTimeoutInterval:", v11);
  objc_initWeak((id *)buf, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__VGOEMApplication__connectionWithIntent___block_invoke;
  v14[3] = &unk_24C2FBA70;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v9, "setTimeoutHandler:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v9;
}

void __42__VGOEMApplication__connectionWithIntent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *WeakRetained;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    VGGetOEMApplicationLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412546;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      v6 = "Connection for OEMApp: (%@), timed out with error: %@";
      v7 = v5;
      v8 = 22;
LABEL_6:
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v9, v8);
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[VGOEMApplication _connectionWithIntent:]_block_invoke";
      v11 = 1024;
      LODWORD(v12) = 551;
      v6 = "strongSelf went away in %s line %d";
      v7 = v5;
      v8 = 18;
      goto LABEL_6;
    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VGOEMApplication identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Identifier: %@"), self->_identifier);
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (VGOEMAppSOCStreaming)chargeStreamingDelegate
{
  return (VGOEMAppSOCStreaming *)objc_loadWeakRetained((id *)&self->_chargeStreamingDelegate);
}

- (void)setChargeStreamingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chargeStreamingDelegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)allowedFormulaIDs
{
  return self->_allowedFormulaIDs;
}

- (void)setAllowedFormulaIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedFormulaIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedFormulaIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_chargeStreamingDelegate);
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_chargeStreamingConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
