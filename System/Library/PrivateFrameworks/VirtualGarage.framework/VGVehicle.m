@implementation VGVehicle

- (VGVehicle)initWithDisplayName:(id)a3 year:(id)a4 manufacturer:(id)a5 model:(id)a6 colorHex:(id)a7 headUnitIdentifier:(id)a8 headUnitBluetoothIdentifier:(id)a9 supportedConnectors:(unint64_t)a10 powerByConnector:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  VGVehicle *v25;
  void *v26;
  uint64_t v27;
  NSString *identifier;
  uint64_t v29;
  NSString *iapIdentifier;
  uint64_t v31;
  NSDate *creationDate;
  NSDate *lastStateUpdateDate;
  uint64_t v34;
  NSString *displayName;
  uint64_t v36;
  NSString *year;
  uint64_t v38;
  NSString *manufacturer;
  uint64_t v40;
  NSString *model;
  uint64_t v42;
  NSString *colorHex;
  uint64_t v44;
  NSString *headUnitIdentifier;
  uint64_t v46;
  NSString *headUnitBluetoothIdentifier;
  uint64_t v48;
  NSDictionary *powerByConnector;
  objc_super v51;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a11;
  v51.receiver = self;
  v51.super_class = (Class)VGVehicle;
  v25 = -[VGVehicle init](&v51, sel_init);
  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v27 = objc_claimAutoreleasedReturnValue();
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v27;

    v29 = objc_msgSend(v22, "copy");
    iapIdentifier = v25->_iapIdentifier;
    v25->_iapIdentifier = (NSString *)v29;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v31 = objc_claimAutoreleasedReturnValue();
    creationDate = v25->_creationDate;
    v25->_creationDate = (NSDate *)v31;

    lastStateUpdateDate = v25->_lastStateUpdateDate;
    v25->_lastStateUpdateDate = 0;

    v34 = objc_msgSend(v17, "copy");
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v34;

    v36 = objc_msgSend(v18, "copy");
    year = v25->_year;
    v25->_year = (NSString *)v36;

    v38 = objc_msgSend(v19, "copy");
    manufacturer = v25->_manufacturer;
    v25->_manufacturer = (NSString *)v38;

    v40 = objc_msgSend(v20, "copy");
    model = v25->_model;
    v25->_model = (NSString *)v40;

    v42 = objc_msgSend(v21, "copy");
    colorHex = v25->_colorHex;
    v25->_colorHex = (NSString *)v42;

    v44 = objc_msgSend(v22, "copy");
    headUnitIdentifier = v25->_headUnitIdentifier;
    v25->_headUnitIdentifier = (NSString *)v44;

    v46 = objc_msgSend(v23, "copy");
    headUnitBluetoothIdentifier = v25->_headUnitBluetoothIdentifier;
    v25->_headUnitBluetoothIdentifier = (NSString *)v46;

    v25->_supportedConnectors = a10;
    v48 = objc_msgSend(v24, "copy");
    powerByConnector = v25->_powerByConnector;
    v25->_powerByConnector = (NSDictionary *)v48;

  }
  return v25;
}

- (VGVehicle)initWithLicensePlate:(id)a3 lprVehicleType:(id)a4 lprPowerType:(id)a5
{
  id v8;
  id v9;
  id v10;
  VGVehicle *v11;
  id v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSDate *creationDate;
  NSDate *lastStateUpdateDate;
  uint64_t v18;
  NSString *displayName;
  uint64_t v20;
  NSString *licensePlate;
  uint64_t v22;
  NSString *lprVehicleType;
  uint64_t v24;
  NSString *lprPowerType;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VGVehicle;
  v11 = -[VGVehicle init](&v27, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    creationDate = v11->_creationDate;
    v11->_creationDate = (NSDate *)v15;

    lastStateUpdateDate = v11->_lastStateUpdateDate;
    v11->_lastStateUpdateDate = 0;

    v18 = objc_msgSend(v8, "copy");
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v18;

    v20 = objc_msgSend(v8, "copy");
    licensePlate = v11->_licensePlate;
    v11->_licensePlate = (NSString *)v20;

    v22 = objc_msgSend(v9, "copy");
    lprVehicleType = v11->_lprVehicleType;
    v11->_lprVehicleType = (NSString *)v22;

    v24 = objc_msgSend(v10, "copy");
    lprPowerType = v11->_lprPowerType;
    v11->_lprPowerType = (NSString *)v24;

  }
  return v11;
}

- (VGVehicle)initWithIdentifier:(id)a3 displayName:(id)a4 year:(id)a5 manufacturer:(id)a6 model:(id)a7 colorHex:(id)a8 licensePlate:(id)a9 lprVehicleType:(id)a10 lprPowerType:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  VGVehicle *v25;
  uint64_t v26;
  NSString *identifier;
  uint64_t v28;
  NSDate *creationDate;
  NSDate *lastStateUpdateDate;
  uint64_t v31;
  NSString *displayName;
  uint64_t v33;
  NSString *manufacturer;
  uint64_t v35;
  NSString *model;
  uint64_t v37;
  NSString *colorHex;
  uint64_t v39;
  NSString *licensePlate;
  uint64_t v41;
  NSString *lprVehicleType;
  uint64_t v43;
  NSString *lprPowerType;
  id v46;
  objc_super v47;

  v17 = a3;
  v18 = a4;
  v46 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v47.receiver = self;
  v47.super_class = (Class)VGVehicle;
  v25 = -[VGVehicle init](&v47, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v17, "copy");
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v28 = objc_claimAutoreleasedReturnValue();
    creationDate = v25->_creationDate;
    v25->_creationDate = (NSDate *)v28;

    lastStateUpdateDate = v25->_lastStateUpdateDate;
    v25->_lastStateUpdateDate = 0;

    v31 = objc_msgSend(v18, "copy");
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v31;

    objc_storeStrong((id *)&v25->_year, a5);
    v33 = objc_msgSend(v19, "copy");
    manufacturer = v25->_manufacturer;
    v25->_manufacturer = (NSString *)v33;

    v35 = objc_msgSend(v20, "copy");
    model = v25->_model;
    v25->_model = (NSString *)v35;

    v37 = objc_msgSend(v21, "copy");
    colorHex = v25->_colorHex;
    v25->_colorHex = (NSString *)v37;

    v39 = objc_msgSend(v22, "copy");
    licensePlate = v25->_licensePlate;
    v25->_licensePlate = (NSString *)v39;

    v41 = objc_msgSend(v23, "copy");
    lprVehicleType = v25->_lprVehicleType;
    v25->_lprVehicleType = (NSString *)v41;

    v43 = objc_msgSend(v24, "copy");
    lprPowerType = v25->_lprPowerType;
    v25->_lprPowerType = (NSString *)v43;

  }
  return v25;
}

- (VGVehicle)initWithMapsSyncVehicle:(id)a3
{
  id v4;
  VGVehicle *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *iapIdentifier;
  void *v12;
  uint64_t v13;
  NSString *siriIntentsIdentifier;
  void *v15;
  uint64_t v16;
  NSDate *creationDate;
  void *v18;
  uint64_t v19;
  NSDate *lastStateUpdateDate;
  void *v21;
  uint64_t v22;
  NSString *displayName;
  void *v24;
  uint64_t v25;
  NSString *year;
  void *v27;
  uint64_t v28;
  NSString *manufacturer;
  void *v30;
  uint64_t v31;
  NSString *model;
  void *v33;
  uint64_t v34;
  NSString *colorHex;
  void *v36;
  uint64_t v37;
  NSString *licensePlate;
  void *v39;
  uint64_t v40;
  NSString *lprVehicleType;
  void *v42;
  uint64_t v43;
  NSString *lprPowerType;
  void *v45;
  uint64_t v46;
  NSString *headUnitIdentifier;
  void *v48;
  uint64_t v49;
  NSString *headUnitBluetoothIdentifier;
  void *v51;
  id v52;
  void (**v53)(_QWORD, _QWORD);
  void *v54;
  uint64_t v55;
  NSDictionary *powerByConnector;
  VGChargingNetworksStorage *v57;
  void *v58;
  VGChargingNetworksStorage *v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  NSSet *preferredChargingNetworks;
  VGVehicleStateStorage *v65;
  void *v66;
  VGVehicleStateStorage *v67;
  uint64_t v68;
  VGVehicleState *currentVehicleState;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  NSString *pairedAppIdentifier;
  void *v74;
  uint64_t v75;
  NSString *pairedAppInstallDeviceIdentifier;
  void *v77;
  uint64_t v78;
  NSData *pairedAppInstallSessionIdentifier;
  _QWORD v81[4];
  id v82;
  objc_super v83;
  uint8_t buf[4];
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)VGVehicle;
  v5 = -[VGVehicle init](&v83, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vehicleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "iapIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    iapIdentifier = v5->_iapIdentifier;
    v5->_iapIdentifier = (NSString *)v10;

    objc_msgSend(v4, "siriIntentsIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    siriIntentsIdentifier = v5->_siriIntentsIdentifier;
    v5->_siriIntentsIdentifier = (NSString *)v13;

    objc_msgSend(v4, "dateOfVehicleIngestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v16;

    objc_msgSend(v4, "lastStateUpdateDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    lastStateUpdateDate = v5->_lastStateUpdateDate;
    v5->_lastStateUpdateDate = (NSDate *)v19;

    objc_msgSend(v4, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v22;

    objc_msgSend(v4, "year");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringValue");
    v25 = objc_claimAutoreleasedReturnValue();
    year = v5->_year;
    v5->_year = (NSString *)v25;

    objc_msgSend(v4, "manufacturer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v28;

    objc_msgSend(v4, "model");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    model = v5->_model;
    v5->_model = (NSString *)v31;

    objc_msgSend(v4, "colorHex");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    colorHex = v5->_colorHex;
    v5->_colorHex = (NSString *)v34;

    objc_msgSend(v4, "licensePlate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "copy");
    licensePlate = v5->_licensePlate;
    v5->_licensePlate = (NSString *)v37;

    objc_msgSend(v4, "lprVehicleType");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    lprVehicleType = v5->_lprVehicleType;
    v5->_lprVehicleType = (NSString *)v40;

    objc_msgSend(v4, "lprPowerType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    lprPowerType = v5->_lprPowerType;
    v5->_lprPowerType = (NSString *)v43;

    objc_msgSend(v4, "headUnitMacAddress");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "copy");
    headUnitIdentifier = v5->_headUnitIdentifier;
    v5->_headUnitIdentifier = (NSString *)v46;

    objc_msgSend(v4, "headUnitBluetoothIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "copy");
    headUnitBluetoothIdentifier = v5->_headUnitBluetoothIdentifier;
    v5->_headUnitBluetoothIdentifier = (NSString *)v49;

    objc_msgSend(v4, "supportedConnectors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportedConnectors = objc_msgSend(v51, "unsignedIntegerValue");

    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __37__VGVehicle_initWithMapsSyncVehicle___block_invoke;
    v81[3] = &unk_24C2FB190;
    v52 = v4;
    v82 = v52;
    v53 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD239CC](v81);
    objc_msgSend(v52, "powerByConnector");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v53)[2](v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    powerByConnector = v5->_powerByConnector;
    v5->_powerByConnector = (NSDictionary *)v55;

    v57 = [VGChargingNetworksStorage alloc];
    objc_msgSend(v52, "preferredChargingNetworks");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[VGChargingNetworksStorage initWithData:](v57, "initWithData:", v58);

    v60 = objc_alloc(MEMORY[0x24BDBCF20]);
    -[VGChargingNetworksStorage networks](v59, "networks");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    VGMap(v61, &__block_literal_global_0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v60, "initWithArray:", v62);
    preferredChargingNetworks = v5->_preferredChargingNetworks;
    v5->_preferredChargingNetworks = (NSSet *)v63;

    v5->_usesPreferredNetworksForRouting = -[VGChargingNetworksStorage usesPreferredNetworksForRouting](v59, "usesPreferredNetworksForRouting");
    v65 = [VGVehicleStateStorage alloc];
    objc_msgSend(v52, "currentVehicleState");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[VGVehicleStateStorage initWithData:](v65, "initWithData:", v66);

    if (v67)
    {
      +[VGVehicleState _vehicleStateFromStorage:](VGVehicleState, "_vehicleStateFromStorage:", v67);
      v68 = objc_claimAutoreleasedReturnValue();
      currentVehicleState = v5->_currentVehicleState;
      v5->_currentVehicleState = (VGVehicleState *)v68;
    }
    else
    {
      VGGetPersistingLog();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v85 = v52;
        _os_log_impl(&dword_20A329000, v70, OS_LOG_TYPE_ERROR, "Failed to load vehicleStateStorage from MapsSyncVehicle: %@.", buf, 0xCu);
      }

      currentVehicleState = v5->_currentVehicleState;
      v5->_currentVehicleState = 0;
    }

    objc_msgSend(v52, "pairedAppIdentifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "copy");
    pairedAppIdentifier = v5->_pairedAppIdentifier;
    v5->_pairedAppIdentifier = (NSString *)v72;

    -[VGVehicleStateStorage pairedAppInstallDeviceIdentifier](v67, "pairedAppInstallDeviceIdentifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "copy");
    pairedAppInstallDeviceIdentifier = v5->_pairedAppInstallDeviceIdentifier;
    v5->_pairedAppInstallDeviceIdentifier = (NSString *)v75;

    -[VGVehicleStateStorage pairedAppInstallSessionIdentifier](v67, "pairedAppInstallSessionIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "copy");
    pairedAppInstallSessionIdentifier = v5->_pairedAppInstallSessionIdentifier;
    v5->_pairedAppInstallSessionIdentifier = (NSData *)v78;

  }
  return v5;
}

NSObject *__37__VGVehicle_initWithMapsSyncVehicle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, &v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v35;

    if (v9 || !v8)
    {
      VGGetPersistingLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v38 = v24;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "Failed to load powerByConnector dictionary from MapsSyncVehicle: %@.", buf, 0xCu);
      }
      v23 = 0;
    }
    else
    {
      v28 = a1;
      v10 = objc_opt_new();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v8;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v32;
        v29 = v8;
        v30 = v3;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              VGGetPersistingLog();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              {
                v26 = *(_QWORD *)(v28 + 32);
                *(_DWORD *)buf = 138412290;
                v38 = v26;
                _os_log_impl(&dword_20A329000, v25, OS_LOG_TYPE_FAULT, "Failed to parse a powerByConnector dictionary from MapsSyncVehicle: %@.", buf, 0xCu);
              }

              v23 = 0;
              v8 = v29;
              v3 = v30;
              v9 = 0;
              goto LABEL_21;
            }
            v18 = objc_alloc(MEMORY[0x24BDD1660]);
            objc_msgSend(v17, "doubleValue");
            v20 = v19;
            objc_msgSend(MEMORY[0x24BDD1938], "watts");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v18, "initWithDoubleValue:unit:", v21, v20);
            -[NSObject setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v22, v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          v8 = v29;
          v3 = v30;
          v9 = 0;
          if (v13)
            continue;
          break;
        }
      }

      v10 = v10;
      v23 = v10;
    }
LABEL_21:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

VGChargingNetwork *__37__VGVehicle_initWithMapsSyncVehicle___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  VGChargingNetwork *v3;

  v2 = a2;
  v3 = -[VGChargingNetwork initWithChargingNetworkStorage:]([VGChargingNetwork alloc], "initWithChargingNetworkStorage:", v2);

  return v3;
}

- (VGVehicle)initWithCoder:(id)a3
{
  id v4;
  VGVehicle *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *iapIdentifier;
  uint64_t v10;
  NSString *siriIntentsIdentifier;
  uint64_t v12;
  NSDate *creationDate;
  uint64_t v14;
  NSDate *lastStateUpdateDate;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSString *year;
  uint64_t v20;
  NSString *manufacturer;
  uint64_t v22;
  NSString *model;
  uint64_t v24;
  NSString *colorHex;
  uint64_t v26;
  NSString *headUnitIdentifier;
  uint64_t v28;
  NSString *headUnitBluetoothIdentifier;
  uint64_t v30;
  NSString *licensePlate;
  uint64_t v32;
  NSString *lprVehicleType;
  uint64_t v34;
  NSString *lprPowerType;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSDictionary *powerByConnector;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSSet *preferredChargingNetworks;
  uint64_t v48;
  VGVehicleState *currentVehicleState;
  uint64_t v50;
  NSString *pairedAppIdentifier;
  uint64_t v52;
  NSString *pairedAppInstallDeviceIdentifier;
  uint64_t v54;
  NSData *pairedAppInstallSessionIdentifier;
  objc_super v57;

  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)VGVehicle;
  v5 = -[VGVehicle init](&v57, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iapIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    iapIdentifier = v5->_iapIdentifier;
    v5->_iapIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_siriIntentsIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    siriIntentsIdentifier = v5->_siriIntentsIdentifier;
    v5->_siriIntentsIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_creationDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lastStateUpdateDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastStateUpdateDate = v5->_lastStateUpdateDate;
    v5->_lastStateUpdateDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
    v16 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_year"));
    v18 = objc_claimAutoreleasedReturnValue();
    year = v5->_year;
    v5->_year = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_manufacturer"));
    v20 = objc_claimAutoreleasedReturnValue();
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_model"));
    v22 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_colorHex"));
    v24 = objc_claimAutoreleasedReturnValue();
    colorHex = v5->_colorHex;
    v5->_colorHex = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_headUnitIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    headUnitIdentifier = v5->_headUnitIdentifier;
    v5->_headUnitIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_headUnitBluetoothIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    headUnitBluetoothIdentifier = v5->_headUnitBluetoothIdentifier;
    v5->_headUnitBluetoothIdentifier = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_licensePlate"));
    v30 = objc_claimAutoreleasedReturnValue();
    licensePlate = v5->_licensePlate;
    v5->_licensePlate = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lprVehicleType"));
    v32 = objc_claimAutoreleasedReturnValue();
    lprVehicleType = v5->_lprVehicleType;
    v5->_lprVehicleType = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lprPowerType"));
    v34 = objc_claimAutoreleasedReturnValue();
    lprPowerType = v5->_lprPowerType;
    v5->_lprPowerType = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_supportedConnectors"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportedConnectors = objc_msgSend(v36, "unsignedIntegerValue");

    v37 = objc_alloc(MEMORY[0x24BDBCF20]);
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    v40 = (void *)objc_msgSend(v37, "initWithObjects:", v38, v39, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("_powerByConnector"));
    v41 = objc_claimAutoreleasedReturnValue();
    powerByConnector = v5->_powerByConnector;
    v5->_powerByConnector = (NSDictionary *)v41;

    v43 = objc_alloc(MEMORY[0x24BDBCF20]);
    v44 = objc_opt_class();
    v45 = (void *)objc_msgSend(v43, "initWithObjects:", v44, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("_preferredChargingNetworks"));
    v46 = objc_claimAutoreleasedReturnValue();
    preferredChargingNetworks = v5->_preferredChargingNetworks;
    v5->_preferredChargingNetworks = (NSSet *)v46;

    v5->_usesPreferredNetworksForRouting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_usesPreferredNetworksForRouting"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentVehicleState"));
    v48 = objc_claimAutoreleasedReturnValue();
    currentVehicleState = v5->_currentVehicleState;
    v5->_currentVehicleState = (VGVehicleState *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pairedAppIdentifier"));
    v50 = objc_claimAutoreleasedReturnValue();
    pairedAppIdentifier = v5->_pairedAppIdentifier;
    v5->_pairedAppIdentifier = (NSString *)v50;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pairedAppInstallDeviceIdentifier"));
    v52 = objc_claimAutoreleasedReturnValue();
    pairedAppInstallDeviceIdentifier = v5->_pairedAppInstallDeviceIdentifier;
    v5->_pairedAppInstallDeviceIdentifier = (NSString *)v52;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pairedAppInstallSessionIdentifier"));
    v54 = objc_claimAutoreleasedReturnValue();
    pairedAppInstallSessionIdentifier = v5->_pairedAppInstallSessionIdentifier;
    v5->_pairedAppInstallSessionIdentifier = (NSData *)v54;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  VGVehicle *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v6, "encodeObject:forKey:", v4->_identifier, CFSTR("_identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_iapIdentifier, CFSTR("_iapIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_siriIntentsIdentifier, CFSTR("_siriIntentsIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_creationDate, CFSTR("_creationDate"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_lastStateUpdateDate, CFSTR("_lastStateUpdateDate"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_displayName, CFSTR("_displayName"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_year, CFSTR("_year"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_manufacturer, CFSTR("_manufacturer"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_model, CFSTR("_model"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_colorHex, CFSTR("_colorHex"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_headUnitIdentifier, CFSTR("_headUnitIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_headUnitBluetoothIdentifier, CFSTR("_headUnitBluetoothIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_licensePlate, CFSTR("_licensePlate"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_lprVehicleType, CFSTR("_lprVehicleType"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_lprPowerType, CFSTR("_lprPowerType"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4->_supportedConnectors);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_supportedConnectors"));

  objc_msgSend(v6, "encodeObject:forKey:", v4->_powerByConnector, CFSTR("_powerByConnector"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_preferredChargingNetworks, CFSTR("_preferredChargingNetworks"));
  objc_msgSend(v6, "encodeBool:forKey:", v4->_usesPreferredNetworksForRouting, CFSTR("_usesPreferredNetworksForRouting"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_currentVehicleState, CFSTR("_currentVehicleState"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_pairedAppIdentifier, CFSTR("_pairedAppIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_pairedAppInstallDeviceIdentifier, CFSTR("_pairedAppInstallDeviceIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", v4->_pairedAppInstallSessionIdentifier, CFSTR("_pairedAppInstallSessionIdentifier"));
  objc_sync_exit(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPureElectricVehicle
{
  void *v3;
  void *v4;
  BOOL v5;

  -[VGVehicleState consumptionArguments](self->_currentVehicleState, "consumptionArguments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[VGVehicleState chargingArguments](self->_currentVehicleState, "chargingArguments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateWithVehicleState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  VGVehicle *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[VGVehicle _canBeUpdatedFromState:](self, "_canBeUpdatedFromState:", v4))
  {
    -[VGVehicle _setVehicleState:](self, "_setVehicleState:", v4);
  }
  else
  {
    VGGetDataCoordinatorLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "origin");
      v8 = CFSTR("Unknown");
      if (v7 == 1)
        v8 = CFSTR("iAP2");
      v9 = 138412802;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      if (v7 == 2)
        v8 = CFSTR("SiriIntents");
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_FAULT, "Tried to update a vehicle %@, with an incompatible state: id: %@, origin: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)_setVehicleState:(id)a3
{
  VGVehicle *v4;
  uint64_t v5;
  VGVehicleState *currentVehicleState;
  uint64_t v7;
  NSDate *lastStateUpdateDate;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v9, "copy");
  currentVehicleState = v4->_currentVehicleState;
  v4->_currentVehicleState = (VGVehicleState *)v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  lastStateUpdateDate = v4->_lastStateUpdateDate;
  v4->_lastStateUpdateDate = (NSDate *)v7;

  objc_sync_exit(v4);
}

- (id)_vehicleByUpdatingWithVehicle:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;

  v4 = a3;
  v5 = (_QWORD *)-[VGVehicle copy](self, "copy");
  v5[15] = objc_msgSend(v4, "supportedConnectors");
  objc_msgSend(v4, "powerByConnector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)v5[16];
  v5[16] = v7;

  objc_msgSend(v4, "currentVehicleState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateWithVehicleState:", v9);

  objc_msgSend(v5, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v4, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)v5[5];
    v5[5] = v12;

  }
  objc_msgSend(v5, "colorHex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v4, "colorHex");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    v17 = (void *)v5[9];
    v5[9] = v16;

  }
  objc_msgSend(v5, "model");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v4, "model");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    v21 = (void *)v5[8];
    v5[8] = v20;

  }
  objc_msgSend(v5, "manufacturer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(v4, "manufacturer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    v25 = (void *)v5[7];
    v5[7] = v24;

  }
  objc_msgSend(v5, "year");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    objc_msgSend(v4, "year");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    v29 = (void *)v5[6];
    v5[6] = v28;

  }
  objc_msgSend(v5, "headUnitIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    objc_msgSend(v4, "headUnitIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    v33 = (void *)v5[11];
    v5[11] = v32;

  }
  objc_msgSend(v5, "headUnitBluetoothIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    objc_msgSend(v4, "headUnitBluetoothIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    v37 = (void *)v5[10];
    v5[10] = v36;

  }
  objc_msgSend(v5, "iapIdentifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    objc_msgSend(v4, "iapIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    v41 = (void *)v5[20];
    v5[20] = v40;

  }
  return v5;
}

- (id)_vehicleByUpdatingUsesPreferredNetworksForRouting:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[VGVehicle copy](self, "copy");
  v4[8] = a3;
  return v4;
}

- (void)pairToIapIdentifier:(id)a3 bluetoothIdentifier:(id)a4
{
  VGVehicle *v6;
  VGVehicle *v7;
  NSString *iapIdentifier;
  NSObject *v9;
  NSObject *headUnitBluetoothIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *headUnitIdentifier;
  NSString *v15;
  int v16;
  VGVehicle *v17;
  __int16 v18;
  VGVehicle *v19;
  __int16 v20;
  VGVehicle *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (VGVehicle *)a3;
  v7 = (VGVehicle *)a4;
  iapIdentifier = self->_iapIdentifier;
  VGGetDataCoordinatorLog();
  v9 = objc_claimAutoreleasedReturnValue();
  headUnitBluetoothIdentifier = v9;
  if (iapIdentifier)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v16 = 138412802;
      v17 = self;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_20A329000, headUnitBluetoothIdentifier, OS_LOG_TYPE_FAULT, "Tried to pair a vehicle: (%@) to iapID: %@, bluetoothID: %@, but it was already paired.", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_20A329000, headUnitBluetoothIdentifier, OS_LOG_TYPE_INFO, "Pairing vehicle to iapIdentifier: %@, bluetoothIdentifier: %@", (uint8_t *)&v16, 0x16u);
    }

    v11 = (NSString *)-[VGVehicle copy](v6, "copy");
    v12 = self->_iapIdentifier;
    self->_iapIdentifier = v11;

    v13 = (NSString *)-[VGVehicle copy](v6, "copy");
    headUnitIdentifier = self->_headUnitIdentifier;
    self->_headUnitIdentifier = v13;

    v15 = (NSString *)-[VGVehicle copy](v7, "copy");
    headUnitBluetoothIdentifier = self->_headUnitBluetoothIdentifier;
    self->_headUnitBluetoothIdentifier = v15;
  }

}

- (id)_identifierForVehicleStateOrigin:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
  {
    v3 = 160;
  }
  else
  {
    if (a3 != 2)
      return 0;
    v3 = 168;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)_canBeUpdatedFromState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "origin");

  -[VGVehicle _identifierForVehicleStateOrigin:](self, "_identifierForVehicleStateOrigin:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v7);

  return (char)v4;
}

- (id)combinedDisplayName
{
  NSString **p_displayName;
  NSString **p_licensePlate;
  NSString *licensePlate;
  NSString *v6;

  p_displayName = &self->_displayName;
  if (-[NSString length](self->_displayName, "length"))
    goto LABEL_4;
  licensePlate = self->_licensePlate;
  p_licensePlate = &self->_licensePlate;
  v6 = -[NSString length](licensePlate, "length");
  if (v6)
  {
    p_displayName = p_licensePlate;
LABEL_4:
    v6 = *p_displayName;
  }
  return v6;
}

- (unint64_t)displayedBatteryPercentage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  int v15;
  VGVehicle *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (-[VGVehicle isPureElectricVehicle](self, "isPureElectricVehicle"))
  {
    -[VGVehicle currentVehicleState](self, "currentVehicleState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "batteryPercentage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[VGVehicle currentVehicleState](self, "currentVehicleState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "batteryPercentage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;

    }
    else
    {
      VGGetVirtualGarageLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
      }

      -[VGVehicle batteryPercentageBasedOfCapacity](self, "batteryPercentageBasedOfCapacity");
      v8 = v12;
    }
    v13 = 100.0;
    v14 = v8 * 100.0;
    if (v8 < 0.0)
      v14 = 0.0;
    if (v8 <= 1.0)
      v13 = v14;
    return vcvtad_u64_f64(v13);
  }
  else
  {
    VGGetVirtualGarageLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "Querried a vehicle for battery state that is not an EV. Vehicle: %@", (uint8_t *)&v15, 0xCu);
    }

    return 0;
  }
}

- (double)batteryPercentageBasedOfCapacity
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v15;
  double v16;
  double v17;
  int v19;
  VGVehicle *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[VGVehicle isPureElectricVehicle](self, "isPureElectricVehicle"))
  {
    -[VGVehicle currentVehicleState](self, "currentVehicleState");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject minBatteryCapacity](v3, "minBatteryCapacity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    -[NSObject maxBatteryCapacity](v3, "maxBatteryCapacity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8 - v6;

    -[NSObject currentBatteryCapacity](v3, "currentBatteryCapacity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11 - v6;

    if (v12 < 0.0 || v9 <= 2.22044605e-16 || v12 > v9)
    {
      VGGetVirtualGarageLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v19 = 138412290;
        v20 = (VGVehicle *)v3;
        _os_log_impl(&dword_20A329000, v15, OS_LOG_TYPE_ERROR, "Vehicle provided invalid battery state: %@", (uint8_t *)&v19, 0xCu);
      }

      v16 = 0.0;
    }
    else
    {
      v17 = 0.0;
      if (v12 / v9 >= 0.0)
        v17 = v12 / v9;
      if (v12 / v9 <= 1.0)
        v16 = v17;
      else
        v16 = 1.0;
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v16 = 0.0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = self;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "Querried a vehicle for battery state that is not an EV. Vehicle: %@", (uint8_t *)&v19, 0xCu);
    }
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  VGVehicle *v39;

  v39 = +[VGVehicle allocWithZone:](VGVehicle, "allocWithZone:", a3);
  v38 = (void *)-[NSString copy](self->_identifier, "copy");
  v4 = (void *)-[NSString copy](self->_displayName, "copy");
  v5 = (void *)-[NSString copy](self->_year, "copy");
  v6 = (void *)-[NSString copy](self->_manufacturer, "copy");
  v7 = (void *)-[NSString copy](self->_model, "copy");
  v8 = (void *)-[NSString copy](self->_colorHex, "copy");
  v9 = (void *)-[NSString copy](self->_licensePlate, "copy");
  v10 = (void *)-[NSString copy](self->_lprVehicleType, "copy");
  v11 = (void *)-[NSString copy](self->_lprPowerType, "copy");
  v12 = -[VGVehicle initWithIdentifier:displayName:year:manufacturer:model:colorHex:licensePlate:lprVehicleType:lprPowerType:](v39, "initWithIdentifier:displayName:year:manufacturer:model:colorHex:licensePlate:lprVehicleType:lprPowerType:", v38, v4, v5, v6, v7, v8, v9, v10, v11);

  v13 = -[NSString copy](self->_iapIdentifier, "copy");
  v14 = *(void **)(v12 + 160);
  *(_QWORD *)(v12 + 160) = v13;

  v15 = -[NSString copy](self->_siriIntentsIdentifier, "copy");
  v16 = *(void **)(v12 + 168);
  *(_QWORD *)(v12 + 168) = v15;

  v17 = -[NSDate copy](self->_creationDate, "copy");
  v18 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v17;

  v19 = -[NSDate copy](self->_lastStateUpdateDate, "copy");
  v20 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v19;

  v21 = -[NSString copy](self->_headUnitIdentifier, "copy");
  v22 = *(void **)(v12 + 88);
  *(_QWORD *)(v12 + 88) = v21;

  v23 = -[NSString copy](self->_headUnitBluetoothIdentifier, "copy");
  v24 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 80) = v23;

  *(_QWORD *)(v12 + 120) = self->_supportedConnectors;
  v25 = -[NSDictionary copy](self->_powerByConnector, "copy");
  v26 = *(void **)(v12 + 128);
  *(_QWORD *)(v12 + 128) = v25;

  v27 = -[NSSet copy](self->_preferredChargingNetworks, "copy");
  v28 = *(void **)(v12 + 136);
  *(_QWORD *)(v12 + 136) = v27;

  *(_BYTE *)(v12 + 8) = self->_usesPreferredNetworksForRouting;
  v29 = -[VGVehicleState copy](self->_currentVehicleState, "copy");
  v30 = *(void **)(v12 + 144);
  *(_QWORD *)(v12 + 144) = v29;

  v31 = -[NSString copy](self->_pairedAppIdentifier, "copy");
  v32 = *(void **)(v12 + 152);
  *(_QWORD *)(v12 + 152) = v31;

  v33 = -[NSString copy](self->_pairedAppInstallDeviceIdentifier, "copy");
  v34 = *(void **)(v12 + 176);
  *(_QWORD *)(v12 + 176) = v33;

  v35 = -[NSData copy](self->_pairedAppInstallSessionIdentifier, "copy");
  v36 = *(void **)(v12 + 184);
  *(_QWORD *)(v12 + 184) = v35;

  return (id)v12;
}

- (id)description
{
  VGVehicle *v2;
  NSString *headUnitBluetoothIdentifier;
  NSString *licensePlate;
  NSString *headUnitIdentifier;
  NSString *lprVehicleType;
  NSString *lprPowerType;
  void *v8;
  NSDictionary *powerByConnector;
  NSSet *preferredChargingNetworks;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  NSString *colorHex;
  NSString *model;
  NSString *manufacturer;
  NSString *year;
  NSString *displayName;
  NSDate *lastStateUpdateDate;
  NSDate *creationDate;
  NSString *siriIntentsIdentifier;
  NSString *identifier;
  NSString *iapIdentifier;
  uint64_t v25;
  void *v26;

  v2 = self;
  objc_sync_enter(v2);
  v26 = (void *)MEMORY[0x24BDD17C8];
  v25 = objc_opt_class();
  identifier = v2->_identifier;
  iapIdentifier = v2->_iapIdentifier;
  creationDate = v2->_creationDate;
  siriIntentsIdentifier = v2->_siriIntentsIdentifier;
  displayName = v2->_displayName;
  lastStateUpdateDate = v2->_lastStateUpdateDate;
  manufacturer = v2->_manufacturer;
  year = v2->_year;
  headUnitBluetoothIdentifier = v2->_headUnitBluetoothIdentifier;
  colorHex = v2->_colorHex;
  model = v2->_model;
  headUnitIdentifier = v2->_headUnitIdentifier;
  licensePlate = v2->_licensePlate;
  lprVehicleType = v2->_lprVehicleType;
  lprPowerType = v2->_lprPowerType;
  NSStringFromVGChargingConnectorTypeOptions(v2->_supportedConnectors);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  powerByConnector = v2->_powerByConnector;
  preferredChargingNetworks = v2->_preferredChargingNetworks;
  if (v2->_usesPreferredNetworksForRouting)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@:%p,\n identifier: %@,\n iapIdentifier: %@,\n siriIntentsIdentifier: %@,\n creationDate: %@,\n lastStateUpdateDate: %@,\n displayName: %@,\n year: %@,\n manufacturer: %@,\n model: %@,\n colorHex: %@,\n headUnitBluetoothIdentifier: %@,\n headUnitIdentifier: %@,\n license plate: %@,\n lprVehicleType: %@,\n lprPowerType: %@,\n supportedConnectors: %@,\n powerByConnector: %@,\n preferredChargingNetworks: %@,\n usesPreferredNetworksForRouting: %@,\n currentState: %@,\n pairedAppIdentifier: %@,\n pairedAppInstallDeviceIdentifier: %@,\n pairedAppInstallSessionIdentifier: %@\n>"), v25, v2, identifier, iapIdentifier, siriIntentsIdentifier, creationDate, lastStateUpdateDate, displayName, year, manufacturer, model, colorHex, headUnitBluetoothIdentifier, headUnitIdentifier, licensePlate, lprVehicleType,
    lprPowerType,
    v8,
    powerByConnector,
    preferredChargingNetworks,
    v12,
    v2->_currentVehicleState,
    v2->_pairedAppIdentifier,
    v2->_pairedAppInstallDeviceIdentifier,
    v2->_pairedAppInstallSessionIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  VGVehicle *v4;
  VGVehicle *v5;
  NSString *identifier;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSDate *creationDate;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  NSString *iapIdentifier;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  NSString *siriIntentsIdentifier;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  NSDate *lastStateUpdateDate;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  NSString *displayName;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  int v35;
  NSString *manufacturer;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  int v40;
  NSString *model;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  int v45;
  NSString *year;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  int v50;
  NSString *headUnitBluetoothIdentifier;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  int v55;
  NSString *headUnitIdentifier;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  int v60;
  NSString *colorHex;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  int v65;
  NSString *licensePlate;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  int v70;
  NSString *lprVehicleType;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  int v75;
  NSString *lprPowerType;
  unint64_t v77;
  unint64_t v78;
  void *v79;
  int v80;
  NSDictionary *powerByConnector;
  unint64_t v82;
  unint64_t v83;
  void *v84;
  int v85;
  NSSet *preferredChargingNetworks;
  unint64_t v87;
  unint64_t v88;
  void *v89;
  int v90;
  VGVehicleState *currentVehicleState;
  VGVehicleState *v92;
  id v93;
  void *v94;
  char v95;

  v4 = (VGVehicle *)a3;
  if (v4 == self)
  {
    v95 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = v5->_identifier;
      v7 = self->_identifier;
      v8 = identifier;
      if (v7 | v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend((id)v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_43;
      }
      creationDate = v5->_creationDate;
      v12 = self->_creationDate;
      v13 = creationDate;
      if (v12 | v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend((id)v12, "isEqual:", v13);

        if (!v15)
          goto LABEL_43;
      }
      iapIdentifier = v5->_iapIdentifier;
      v17 = self->_iapIdentifier;
      v18 = iapIdentifier;
      if (v17 | v18)
      {
        v19 = (void *)v18;
        v20 = objc_msgSend((id)v17, "isEqual:", v18);

        if (!v20)
          goto LABEL_43;
      }
      siriIntentsIdentifier = v5->_siriIntentsIdentifier;
      v22 = self->_siriIntentsIdentifier;
      v23 = siriIntentsIdentifier;
      if (v22 | v23)
      {
        v24 = (void *)v23;
        v25 = objc_msgSend((id)v22, "isEqual:", v23);

        if (!v25)
          goto LABEL_43;
      }
      lastStateUpdateDate = v5->_lastStateUpdateDate;
      v27 = self->_lastStateUpdateDate;
      v28 = lastStateUpdateDate;
      if (v27 | v28)
      {
        v29 = (void *)v28;
        v30 = objc_msgSend((id)v27, "isEqual:", v28);

        if (!v30)
          goto LABEL_43;
      }
      displayName = v5->_displayName;
      v32 = self->_displayName;
      v33 = displayName;
      if (v32 | v33)
      {
        v34 = (void *)v33;
        v35 = objc_msgSend((id)v32, "isEqual:", v33);

        if (!v35)
          goto LABEL_43;
      }
      manufacturer = v5->_manufacturer;
      v37 = self->_manufacturer;
      v38 = manufacturer;
      if (v37 | v38)
      {
        v39 = (void *)v38;
        v40 = objc_msgSend((id)v37, "isEqual:", v38);

        if (!v40)
          goto LABEL_43;
      }
      model = v5->_model;
      v42 = self->_model;
      v43 = model;
      if (v42 | v43)
      {
        v44 = (void *)v43;
        v45 = objc_msgSend((id)v42, "isEqual:", v43);

        if (!v45)
          goto LABEL_43;
      }
      year = v5->_year;
      v47 = self->_year;
      v48 = year;
      if (v47 | v48)
      {
        v49 = (void *)v48;
        v50 = objc_msgSend((id)v47, "isEqual:", v48);

        if (!v50)
          goto LABEL_43;
      }
      headUnitBluetoothIdentifier = v5->_headUnitBluetoothIdentifier;
      v52 = self->_headUnitBluetoothIdentifier;
      v53 = headUnitBluetoothIdentifier;
      if (v52 | v53)
      {
        v54 = (void *)v53;
        v55 = objc_msgSend((id)v52, "isEqual:", v53);

        if (!v55)
          goto LABEL_43;
      }
      headUnitIdentifier = v5->_headUnitIdentifier;
      v57 = self->_headUnitIdentifier;
      v58 = headUnitIdentifier;
      if (v57 | v58)
      {
        v59 = (void *)v58;
        v60 = objc_msgSend((id)v57, "isEqual:", v58);

        if (!v60)
          goto LABEL_43;
      }
      colorHex = v5->_colorHex;
      v62 = self->_colorHex;
      v63 = colorHex;
      if (v62 | v63)
      {
        v64 = (void *)v63;
        v65 = objc_msgSend((id)v62, "isEqual:", v63);

        if (!v65)
          goto LABEL_43;
      }
      licensePlate = v5->_licensePlate;
      v67 = self->_licensePlate;
      v68 = licensePlate;
      if (v67 | v68)
      {
        v69 = (void *)v68;
        v70 = objc_msgSend((id)v67, "isEqual:", v68);

        if (!v70)
          goto LABEL_43;
      }
      lprVehicleType = v5->_lprVehicleType;
      v72 = self->_lprVehicleType;
      v73 = lprVehicleType;
      if (v72 | v73)
      {
        v74 = (void *)v73;
        v75 = objc_msgSend((id)v72, "isEqual:", v73);

        if (!v75)
          goto LABEL_43;
      }
      lprPowerType = v5->_lprPowerType;
      v77 = self->_lprPowerType;
      v78 = lprPowerType;
      if (v77 | v78)
      {
        v79 = (void *)v78;
        v80 = objc_msgSend((id)v77, "isEqual:", v78);

        if (!v80)
          goto LABEL_43;
      }
      if (self->_supportedConnectors != v5->_supportedConnectors)
        goto LABEL_43;
      powerByConnector = v5->_powerByConnector;
      v82 = self->_powerByConnector;
      v83 = powerByConnector;
      if (v82 | v83)
      {
        v84 = (void *)v83;
        v85 = objc_msgSend((id)v82, "isEqual:", v83);

        if (!v85)
          goto LABEL_43;
      }
      if (((preferredChargingNetworks = v5->_preferredChargingNetworks,
             v87 = self->_preferredChargingNetworks,
             v88 = preferredChargingNetworks,
             !(v87 | v88))
         || (v89 = (void *)v88,
             v90 = objc_msgSend((id)v87, "isEqual:", v88),
             v89,
             (id)v87,
             v90))
        && self->_usesPreferredNetworksForRouting == v5->_usesPreferredNetworksForRouting)
      {
        currentVehicleState = self->_currentVehicleState;
        v92 = v5->_currentVehicleState;
        v93 = currentVehicleState;
        v94 = v93;
        if ((unint64_t)v93 | (unint64_t)v92)
          v95 = objc_msgSend(v93, "isEqual:", v92);
        else
          v95 = 1;

      }
      else
      {
LABEL_43:
        v95 = 0;
      }

    }
    else
    {
      v95 = 0;
    }
  }

  return v95;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastStateUpdateDate
{
  return self->_lastStateUpdateDate;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)year
{
  return self->_year;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)colorHex
{
  return self->_colorHex;
}

- (void)setColorHex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)headUnitBluetoothIdentifier
{
  return self->_headUnitBluetoothIdentifier;
}

- (NSString)headUnitIdentifier
{
  return self->_headUnitIdentifier;
}

- (NSString)licensePlate
{
  return self->_licensePlate;
}

- (void)setLicensePlate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)lprVehicleType
{
  return self->_lprVehicleType;
}

- (void)setLprVehicleType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)lprPowerType
{
  return self->_lprPowerType;
}

- (void)setLprPowerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)supportedConnectors
{
  return self->_supportedConnectors;
}

- (void)setSupportedConnectors:(unint64_t)a3
{
  self->_supportedConnectors = a3;
}

- (NSDictionary)powerByConnector
{
  return self->_powerByConnector;
}

- (NSSet)preferredChargingNetworks
{
  return self->_preferredChargingNetworks;
}

- (void)setPreferredChargingNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_preferredChargingNetworks, a3);
}

- (BOOL)usesPreferredNetworksForRouting
{
  return self->_usesPreferredNetworksForRouting;
}

- (void)setUsesPreferredNetworksForRouting:(BOOL)a3
{
  self->_usesPreferredNetworksForRouting = a3;
}

- (VGVehicleState)currentVehicleState
{
  return self->_currentVehicleState;
}

- (NSString)pairedAppIdentifier
{
  return self->_pairedAppIdentifier;
}

- (void)setPairedAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAppIdentifier, a3);
}

- (NSString)iapIdentifier
{
  return self->_iapIdentifier;
}

- (void)setIapIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iapIdentifier, a3);
}

- (NSString)siriIntentsIdentifier
{
  return self->_siriIntentsIdentifier;
}

- (void)setSiriIntentsIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_siriIntentsIdentifier, a3);
}

- (NSString)pairedAppInstallDeviceIdentifier
{
  return self->_pairedAppInstallDeviceIdentifier;
}

- (void)setPairedAppInstallDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAppInstallDeviceIdentifier, a3);
}

- (NSData)pairedAppInstallSessionIdentifier
{
  return self->_pairedAppInstallSessionIdentifier;
}

- (void)setPairedAppInstallSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pairedAppInstallSessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedAppInstallSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedAppInstallDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_siriIntentsIdentifier, 0);
  objc_storeStrong((id *)&self->_iapIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_currentVehicleState, 0);
  objc_storeStrong((id *)&self->_preferredChargingNetworks, 0);
  objc_storeStrong((id *)&self->_powerByConnector, 0);
  objc_storeStrong((id *)&self->_lprPowerType, 0);
  objc_storeStrong((id *)&self->_lprVehicleType, 0);
  objc_storeStrong((id *)&self->_licensePlate, 0);
  objc_storeStrong((id *)&self->_headUnitIdentifier, 0);
  objc_storeStrong((id *)&self->_headUnitBluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_colorHex, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastStateUpdateDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
