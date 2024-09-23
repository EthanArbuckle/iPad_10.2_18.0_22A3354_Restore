@implementation VGVehicleState

- (VGVehicleState)initWithIdentifier:(id)a3 dateOfUpdate:(id)a4 origin:(int64_t)a5 batteryPercentage:(id)a6 currentEVRange:(id)a7 maxEVRange:(id)a8 minBatteryCapacity:(id)a9 currentBatteryCapacity:(id)a10 maxBatteryCapacity:(id)a11 consumptionArguments:(id)a12 chargingArguments:(id)a13 isCharging:(BOOL)a14 activeConnector:(unint64_t)a15
{
  id v20;
  id v21;
  VGVehicleState *v22;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  NSString *consumptionArguments;
  uint64_t v27;
  NSString *chargingArguments;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v36 = a6;
  v35 = a7;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  v31 = a11;
  v20 = a12;
  v21 = a13;
  v39.receiver = self;
  v39.super_class = (Class)VGVehicleState;
  v22 = -[VGVehicleState init](&v39, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v38, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    objc_storeStrong((id *)&v22->_dateOfUpdate, a4);
    v22->_origin = a5;
    objc_storeStrong((id *)&v22->_batteryPercentage, a6);
    objc_storeStrong((id *)&v22->_currentEVRange, a7);
    objc_storeStrong((id *)&v22->_maxEVRange, a8);
    objc_storeStrong((id *)&v22->_minBatteryCapacity, a9);
    objc_storeStrong((id *)&v22->_currentBatteryCapacity, a10);
    objc_storeStrong((id *)&v22->_maxBatteryCapacity, a11);
    v25 = objc_msgSend(v20, "copy");
    consumptionArguments = v22->_consumptionArguments;
    v22->_consumptionArguments = (NSString *)v25;

    v27 = objc_msgSend(v21, "copy");
    chargingArguments = v22->_chargingArguments;
    v22->_chargingArguments = (NSString *)v27;

    v22->_isCharging = a14;
    v22->_activeConnector = a15;
  }

  return v22;
}

- (BOOL)isSignificantlyDifferentFromVehicleState:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSDate *dateOfUpdate;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSDate *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  NSMeasurement *maxBatteryCapacity;
  NSMeasurement *currentBatteryCapacity;
  NSMeasurement *minBatteryCapacity;
  BOOL v27;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  NSString *consumptionArguments;
  void *v35;
  id v36;
  unint64_t v37;
  char v38;
  NSString *chargingArguments;
  void *v40;
  id v41;
  unint64_t v42;
  void *v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  int v52;
  NSObject *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  int v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  NSMeasurement *v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  GEOConfigGetDouble();
  v6 = v5;
  dateOfUpdate = self->_dateOfUpdate;
  objc_msgSend(v4, "dateOfUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate timeIntervalSinceDate:](dateOfUpdate, "timeIntervalSinceDate:", v8);
  v10 = fabs(v9);

  if (v10 <= v6)
  {
    GEOConfigGetDouble();
    v15 = v14;
    -[NSMeasurement doubleValue](self->_minBatteryCapacity, "doubleValue");
    v17 = v16;
    objc_msgSend(v4, "minBatteryCapacity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    if (vabdd_f64(v17, v19) > v15)
    {
LABEL_7:

      goto LABEL_8;
    }
    -[NSMeasurement doubleValue](self->_currentBatteryCapacity, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "currentBatteryCapacity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    if (vabdd_f64(v21, v23) > v15)
    {

      goto LABEL_7;
    }
    -[NSMeasurement doubleValue](self->_maxBatteryCapacity, "doubleValue");
    v30 = v29;
    objc_msgSend(v4, "maxBatteryCapacity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "doubleValue");
    v33 = vabdd_f64(v30, v32);

    if (v33 > v15)
    {
LABEL_8:
      VGGetPersistingLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        currentBatteryCapacity = self->_currentBatteryCapacity;
        maxBatteryCapacity = self->_maxBatteryCapacity;
        minBatteryCapacity = self->_minBatteryCapacity;
        v58 = 138413058;
        v59 = minBatteryCapacity;
        v60 = 2112;
        v61 = maxBatteryCapacity;
        v62 = 2112;
        v63 = currentBatteryCapacity;
        v64 = 2112;
        v65 = v4;
        _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_INFO, "isSignificantlyDifferentFromVehicleState: -> YES. Battery state has changed. _min: %@, _max: %@, _current: %@. new: %@", (uint8_t *)&v58, 0x2Au);
      }
      goto LABEL_10;
    }
    consumptionArguments = self->_consumptionArguments;
    objc_msgSend(v4, "consumptionArguments");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = consumptionArguments;
    v37 = v35;
    if ((unint64_t)v36 | v37
      && (v38 = objc_msgSend(v36, "isEqual:", v37), (id)v37, v36, (v38 & 1) == 0))
    {

    }
    else
    {
      chargingArguments = self->_chargingArguments;
      objc_msgSend(v4, "chargingArguments");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = chargingArguments;
      v42 = v40;
      if (!((unint64_t)v41 | v42))
      {

        goto LABEL_36;
      }
      v43 = (void *)v42;
      v44 = objc_msgSend(v41, "isEqual:", v42);

      if ((v44 & 1) != 0)
        goto LABEL_36;
    }
    VGDictionaryFromVGVehicleArguments(self->_chargingArguments);
    v45 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chargingArguments");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    VGDictionaryFromVGVehicleArguments(v46);
    v47 = objc_claimAutoreleasedReturnValue();
    if (v45 | v47)
      v48 = objc_msgSend((id)v45, "isEqual:", v47) ^ 1;
    else
      v48 = 0;

    VGDictionaryFromVGVehicleArguments(self->_consumptionArguments);
    v49 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consumptionArguments");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    VGDictionaryFromVGVehicleArguments(v50);
    v51 = objc_claimAutoreleasedReturnValue();
    if (v49 | v51)
      v52 = objc_msgSend((id)v49, "isEqual:", v51) ^ 1;
    else
      v52 = 0;

    if ((v52 | v48) == 1)
    {
      VGGetPersistingLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = CFSTR("NO");
        if (v48)
          v55 = CFSTR("YES");
        else
          v55 = CFSTR("NO");
        if (v52)
          v54 = CFSTR("YES");
        v58 = 138412546;
        v59 = v55;
        v60 = 2112;
        v61 = v54;
        v56 = v54;
        v57 = v55;
        _os_log_impl(&dword_20A329000, v53, OS_LOG_TYPE_INFO, "isSignificantlyDifferentFromVehicleState: -> YES. chargingArgumentsAreDifferent: %@, consumptionArgumentsAreDifferent: %@", (uint8_t *)&v58, 0x16u);

      }
      goto LABEL_11;
    }
LABEL_36:
    v27 = 0;
    goto LABEL_12;
  }
  VGGetPersistingLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self->_dateOfUpdate;
    objc_msgSend(v4, "dateOfUpdate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 138412546;
    v59 = v12;
    v60 = 2112;
    v61 = v13;
    _os_log_impl(&dword_20A329000, v11, OS_LOG_TYPE_INFO, "isSignificantlyDifferentFromVehicleState: -> YES. Date of last update: %@, date of new update: %@", (uint8_t *)&v58, 0x16u);

  }
LABEL_10:

LABEL_11:
  v27 = 1;
LABEL_12:

  return v27;
}

+ (id)_vehicleStateFromStorage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  VGVehicleState *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  int v25;
  id v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  VGVehicleState *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v54 = [VGVehicleState alloc];
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "dateOfUpdate");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "origin");
    v8 = v7;
    if (v7 >= 3)
    {
      VGGetPersistingLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v11;
        _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_ERROR, "Failed to load origin from protoOrigin: %@", buf, 0xCu);

      }
      v51 = 0;
    }
    else
    {
      v51 = v7;
    }
    v53 = objc_msgSend(v3, "hasBatteryPercentage");
    v55 = (void *)v5;
    if (v53)
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v3, "batteryPercentage");
      objc_msgSend(v12, "numberWithDouble:");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = 0;
    }
    v52 = objc_msgSend(v3, "hasCurrentEVRange");
    if (v52)
    {
      v13 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(v3, "currentEVRange");
      v15 = v14;
      objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (void *)objc_msgSend(v13, "initWithDoubleValue:unit:", v15);
    }
    else
    {
      v59 = 0;
    }
    v50 = objc_msgSend(v3, "hasMaxEVRange");
    if (v50)
    {
      v16 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(v3, "maxEVRange");
      v18 = v17;
      objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_msgSend(v16, "initWithDoubleValue:unit:", v18);
    }
    else
    {
      v58 = 0;
    }
    v49 = objc_msgSend(v3, "hasMinBatteryCapacity");
    if (v49)
    {
      v19 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(v3, "minBatteryCapacity");
      v21 = v20;
      objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (void *)objc_msgSend(v19, "initWithDoubleValue:unit:", v21);
    }
    else
    {
      v57 = 0;
    }
    v48 = objc_msgSend(v3, "hasCurrentBatteryCapacity");
    if (v48)
    {
      v22 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(v3, "currentBatteryCapacity");
      v24 = v23;
      objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)objc_msgSend(v22, "initWithDoubleValue:unit:", v24);
    }
    else
    {
      v56 = 0;
    }
    v25 = objc_msgSend(v3, "hasMaxBatteryCapacity");
    if (v25)
    {
      v26 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(v3, "maxBatteryCapacity");
      v28 = v27;
      objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v26, "initWithDoubleValue:unit:", v28);
    }
    else
    {
      v29 = 0;
    }
    objc_msgSend(v3, "consumptionArguments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");
    objc_msgSend(v3, "chargingArguments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copy");
    v34 = objc_msgSend(v3, "isCharging");
    v35 = objc_msgSend(v3, "activeConnector");
    v36 = v35;
    if (v35 >= 0xA)
    {
      v47 = v4;
      VGGetPersistingLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v39;
        _os_log_impl(&dword_20A329000, v38, OS_LOG_TYPE_ERROR, "Failed to load a single connector type from protoConnectorType: %@", buf, 0xCu);

      }
      v37 = 0;
      v4 = v47;
    }
    else
    {
      v37 = qword_20A354600[(int)v35];
    }
    LOBYTE(v41) = v34;
    v9 = -[VGVehicleState initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:](v54, "initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:", v55, v61, v51, v60, v59, v58, v57, v56, v29, v31, v33, v41, v37);

    if (v25)
    {

    }
    if (v48)
    {

    }
    if (v49)
    {

    }
    if (v50)
    {

    }
    if (v52)
    {

    }
    if (v53)

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_storage
{
  VGVehicleStateStorage *v3;
  void *v4;
  unint64_t origin;
  NSObject *v6;
  NSNumber *batteryPercentage;
  NSMeasurement *currentEVRange;
  void *v9;
  void *v10;
  NSMeasurement *maxEVRange;
  void *v12;
  void *v13;
  NSMeasurement *minBatteryCapacity;
  void *v15;
  void *v16;
  NSMeasurement *currentBatteryCapacity;
  void *v18;
  void *v19;
  NSMeasurement *maxBatteryCapacity;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t activeConnector;
  uint64_t v26;
  NSObject *v27;
  __CFString *v28;
  int v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(VGVehicleStateStorage);
  v4 = (void *)-[NSString copy](self->_identifier, "copy");
  -[VGVehicleStateStorage setIdentifier:](v3, "setIdentifier:", v4);

  -[NSDate timeIntervalSinceReferenceDate](self->_dateOfUpdate, "timeIntervalSinceReferenceDate");
  -[VGVehicleStateStorage setDateOfUpdate:](v3, "setDateOfUpdate:");
  origin = self->_origin;
  if (origin >= 3)
  {
    VGGetPersistingLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v30 = 138412290;
      v31 = CFSTR("Unknown");
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "Failed to persist origin from vgOrigin: %@", (uint8_t *)&v30, 0xCu);
    }

    origin = 0;
  }
  -[VGVehicleStateStorage setOrigin:](v3, "setOrigin:", origin);
  batteryPercentage = self->_batteryPercentage;
  if (batteryPercentage)
  {
    -[NSNumber doubleValue](batteryPercentage, "doubleValue");
    -[VGVehicleStateStorage setBatteryPercentage:](v3, "setBatteryPercentage:");
  }
  currentEVRange = self->_currentEVRange;
  if (currentEVRange)
  {
    objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement measurementByConvertingToUnit:](currentEVRange, "measurementByConvertingToUnit:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[VGVehicleStateStorage setCurrentEVRange:](v3, "setCurrentEVRange:");

  }
  maxEVRange = self->_maxEVRange;
  if (maxEVRange)
  {
    objc_msgSend(MEMORY[0x24BDD1928], "kilometers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement measurementByConvertingToUnit:](maxEVRange, "measurementByConvertingToUnit:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    -[VGVehicleStateStorage setMaxEVRange:](v3, "setMaxEVRange:");

  }
  minBatteryCapacity = self->_minBatteryCapacity;
  if (minBatteryCapacity)
  {
    objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement measurementByConvertingToUnit:](minBatteryCapacity, "measurementByConvertingToUnit:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    -[VGVehicleStateStorage setMinBatteryCapacity:](v3, "setMinBatteryCapacity:");

  }
  currentBatteryCapacity = self->_currentBatteryCapacity;
  if (currentBatteryCapacity)
  {
    objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement measurementByConvertingToUnit:](currentBatteryCapacity, "measurementByConvertingToUnit:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    -[VGVehicleStateStorage setCurrentBatteryCapacity:](v3, "setCurrentBatteryCapacity:");

  }
  maxBatteryCapacity = self->_maxBatteryCapacity;
  if (maxBatteryCapacity)
  {
    objc_msgSend(MEMORY[0x24BDD1900], "kilowattHours");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMeasurement measurementByConvertingToUnit:](maxBatteryCapacity, "measurementByConvertingToUnit:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    -[VGVehicleStateStorage setMaxBatteryCapacity:](v3, "setMaxBatteryCapacity:");

  }
  v23 = (void *)-[NSString copy](self->_consumptionArguments, "copy");
  -[VGVehicleStateStorage setConsumptionArguments:](v3, "setConsumptionArguments:", v23);

  v24 = (void *)-[NSString copy](self->_chargingArguments, "copy");
  -[VGVehicleStateStorage setChargingArguments:](v3, "setChargingArguments:", v24);

  -[VGVehicleStateStorage setIsCharging:](v3, "setIsCharging:", self->_isCharging);
  activeConnector = self->_activeConnector;
  if (activeConnector > 15)
  {
    if (activeConnector <= 63)
    {
      if (activeConnector == 16)
      {
        v26 = 5;
        goto LABEL_37;
      }
      if (activeConnector == 32)
      {
        v26 = 6;
        goto LABEL_37;
      }
    }
    else
    {
      switch(activeConnector)
      {
        case 64:
          v26 = 7;
          goto LABEL_37;
        case 128:
          v26 = 8;
          goto LABEL_37;
        case 256:
          v26 = 9;
          goto LABEL_37;
      }
    }
LABEL_33:
    VGGetPersistingLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      NSStringFromVGChargingConnectorTypeOptions(activeConnector);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v28;
      _os_log_impl(&dword_20A329000, v27, OS_LOG_TYPE_ERROR, "Failed to persist a single connector type from vgConnectorType: %@", (uint8_t *)&v30, 0xCu);

    }
LABEL_36:
    v26 = 0;
  }
  else
  {
    v26 = 1;
    switch(activeConnector)
    {
      case 0:
        goto LABEL_36;
      case 1:
        break;
      case 2:
        v26 = 2;
        break;
      case 4:
        v26 = 3;
        break;
      case 8:
        v26 = 4;
        break;
      default:
        goto LABEL_33;
    }
  }
LABEL_37:
  -[VGVehicleStateStorage setActiveConnector:](v3, "setActiveConnector:", v26);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VGVehicleState)initWithCoder:(id)a3
{
  id v4;
  VGVehicleState *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *dateOfUpdate;
  uint64_t v10;
  NSNumber *batteryPercentage;
  uint64_t v12;
  NSMeasurement *currentEVRange;
  uint64_t v14;
  NSMeasurement *maxEVRange;
  uint64_t v16;
  NSMeasurement *minBatteryCapacity;
  uint64_t v18;
  NSMeasurement *currentBatteryCapacity;
  uint64_t v20;
  NSMeasurement *maxBatteryCapacity;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSString *consumptionArguments;
  uint64_t v29;
  NSString *chargingArguments;
  void *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)VGVehicleState;
  v5 = -[VGVehicleState init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dateOfUpdate"));
    v8 = objc_claimAutoreleasedReturnValue();
    dateOfUpdate = v5->_dateOfUpdate;
    v5->_dateOfUpdate = (NSDate *)v8;

    v5->_origin = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_origin"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_batteryPercentage"));
    v10 = objc_claimAutoreleasedReturnValue();
    batteryPercentage = v5->_batteryPercentage;
    v5->_batteryPercentage = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentEVRange"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentEVRange = v5->_currentEVRange;
    v5->_currentEVRange = (NSMeasurement *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxEVRange"));
    v14 = objc_claimAutoreleasedReturnValue();
    maxEVRange = v5->_maxEVRange;
    v5->_maxEVRange = (NSMeasurement *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_minBatteryCapacity"));
    v16 = objc_claimAutoreleasedReturnValue();
    minBatteryCapacity = v5->_minBatteryCapacity;
    v5->_minBatteryCapacity = (NSMeasurement *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentBatteryCapacity"));
    v18 = objc_claimAutoreleasedReturnValue();
    currentBatteryCapacity = v5->_currentBatteryCapacity;
    v5->_currentBatteryCapacity = (NSMeasurement *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxBatteryCapacity"));
    v20 = objc_claimAutoreleasedReturnValue();
    maxBatteryCapacity = v5->_maxBatteryCapacity;
    v5->_maxBatteryCapacity = (NSMeasurement *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("_consumptionArguments"));
    v27 = objc_claimAutoreleasedReturnValue();
    consumptionArguments = v5->_consumptionArguments;
    v5->_consumptionArguments = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("_chargingArguments"));
    v29 = objc_claimAutoreleasedReturnValue();
    chargingArguments = v5->_chargingArguments;
    v5->_chargingArguments = (NSString *)v29;

    v5->_isCharging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCharging"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_activeConnector"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_activeConnector = objc_msgSend(v31, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateOfUpdate, CFSTR("_dateOfUpdate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_origin, CFSTR("_origin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_batteryPercentage, CFSTR("_batteryPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentEVRange, CFSTR("_currentEVRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxEVRange, CFSTR("_maxEVRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minBatteryCapacity, CFSTR("_minBatteryCapacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBatteryCapacity, CFSTR("_currentBatteryCapacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maxBatteryCapacity, CFSTR("_maxBatteryCapacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_consumptionArguments, CFSTR("_consumptionArguments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_chargingArguments, CFSTR("_chargingArguments"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCharging, CFSTR("_isCharging"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_activeConnector);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_activeConnector"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  VGVehicleState *v4;
  uint64_t v6;

  v4 = +[VGVehicleState allocWithZone:](VGVehicleState, "allocWithZone:", a3);
  LOBYTE(v6) = self->_isCharging;
  return -[VGVehicleState initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:](v4, "initWithIdentifier:dateOfUpdate:origin:batteryPercentage:currentEVRange:maxEVRange:minBatteryCapacity:currentBatteryCapacity:maxBatteryCapacity:consumptionArguments:chargingArguments:isCharging:activeConnector:", self->_identifier, self->_dateOfUpdate, self->_origin, self->_batteryPercentage, self->_currentEVRange, self->_maxEVRange, self->_minBatteryCapacity, self->_currentBatteryCapacity, self->_maxBatteryCapacity, self->_consumptionArguments, self->_chargingArguments, v6, self->_activeConnector);
}

- (BOOL)isEqual:(id)a3
{
  VGVehicleState *v4;
  VGVehicleState *v5;
  NSString *identifier;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSDate *dateOfUpdate;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  NSNumber *batteryPercentage;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  NSMeasurement *currentEVRange;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  NSMeasurement *maxEVRange;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  NSMeasurement *minBatteryCapacity;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  int v35;
  NSMeasurement *currentBatteryCapacity;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  int v40;
  NSMeasurement *maxBatteryCapacity;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  int v45;
  NSString *consumptionArguments;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  int v50;
  NSString *chargingArguments;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  int v55;
  BOOL v56;

  v4 = (VGVehicleState *)a3;
  if (v4 == self)
  {
    v56 = 1;
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
          goto LABEL_28;
      }
      dateOfUpdate = v5->_dateOfUpdate;
      v12 = self->_dateOfUpdate;
      v13 = dateOfUpdate;
      if (v12 | v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend((id)v12, "isEqual:", v13);

        if (!v15)
          goto LABEL_28;
      }
      if (self->_origin != v5->_origin)
        goto LABEL_28;
      batteryPercentage = v5->_batteryPercentage;
      v17 = self->_batteryPercentage;
      v18 = batteryPercentage;
      if (v17 | v18)
      {
        v19 = (void *)v18;
        v20 = objc_msgSend((id)v17, "isEqual:", v18);

        if (!v20)
          goto LABEL_28;
      }
      currentEVRange = v5->_currentEVRange;
      v22 = self->_currentEVRange;
      v23 = currentEVRange;
      if (v22 | v23)
      {
        v24 = (void *)v23;
        v25 = objc_msgSend((id)v22, "isEqual:", v23);

        if (!v25)
          goto LABEL_28;
      }
      maxEVRange = v5->_maxEVRange;
      v27 = self->_maxEVRange;
      v28 = maxEVRange;
      if (v27 | v28)
      {
        v29 = (void *)v28;
        v30 = objc_msgSend((id)v27, "isEqual:", v28);

        if (!v30)
          goto LABEL_28;
      }
      minBatteryCapacity = v5->_minBatteryCapacity;
      v32 = self->_minBatteryCapacity;
      v33 = minBatteryCapacity;
      if (v32 | v33)
      {
        v34 = (void *)v33;
        v35 = objc_msgSend((id)v32, "isEqual:", v33);

        if (!v35)
          goto LABEL_28;
      }
      currentBatteryCapacity = v5->_currentBatteryCapacity;
      v37 = self->_currentBatteryCapacity;
      v38 = currentBatteryCapacity;
      if (v37 | v38)
      {
        v39 = (void *)v38;
        v40 = objc_msgSend((id)v37, "isEqual:", v38);

        if (!v40)
          goto LABEL_28;
      }
      maxBatteryCapacity = v5->_maxBatteryCapacity;
      v42 = self->_maxBatteryCapacity;
      v43 = maxBatteryCapacity;
      if (v42 | v43)
      {
        v44 = (void *)v43;
        v45 = objc_msgSend((id)v42, "isEqual:", v43);

        if (!v45)
          goto LABEL_28;
      }
      consumptionArguments = v5->_consumptionArguments;
      v47 = self->_consumptionArguments;
      v48 = consumptionArguments;
      if (v47 | v48)
      {
        v49 = (void *)v48;
        v50 = objc_msgSend((id)v47, "isEqual:", v48);

        if (!v50)
          goto LABEL_28;
      }
      if (((chargingArguments = v5->_chargingArguments,
             v52 = self->_chargingArguments,
             v53 = chargingArguments,
             !(v52 | v53))
         || (v54 = (void *)v53,
             v55 = objc_msgSend((id)v52, "isEqual:", v53),
             v54,
             (id)v52,
             v55))
        && self->_isCharging == v5->_isCharging)
      {
        v56 = self->_activeConnector == v5->_activeConnector;
      }
      else
      {
LABEL_28:
        v56 = 0;
      }

    }
    else
    {
      v56 = 0;
    }
  }

  return v56;
}

- (id)description
{
  uint64_t v3;
  const __CFString *v4;
  int64_t origin;
  NSMeasurement *minBatteryCapacity;
  NSMeasurement *maxEVRange;
  NSMeasurement *currentBatteryCapacity;
  NSMeasurement *maxBatteryCapacity;
  NSString *consumptionArguments;
  NSString *chargingArguments;
  __CFString *v12;
  unint64_t activeConnector;
  NSNumber *batteryPercentage;
  __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v19;
  NSMeasurement *currentEVRange;
  NSDate *dateOfUpdate;
  NSString *identifier;
  uint64_t v23;
  void *v24;

  v24 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = CFSTR("Unknown");
  identifier = self->_identifier;
  v23 = v3;
  dateOfUpdate = self->_dateOfUpdate;
  origin = self->_origin;
  currentEVRange = self->_currentEVRange;
  if (origin == 1)
    v4 = CFSTR("iAP2");
  if (origin == 2)
    v4 = CFSTR("SiriIntents");
  v19 = v4;
  maxEVRange = self->_maxEVRange;
  minBatteryCapacity = self->_minBatteryCapacity;
  currentBatteryCapacity = self->_currentBatteryCapacity;
  maxBatteryCapacity = self->_maxBatteryCapacity;
  consumptionArguments = self->_consumptionArguments;
  chargingArguments = self->_chargingArguments;
  if (self->_isCharging)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  activeConnector = self->_activeConnector;
  batteryPercentage = self->_batteryPercentage;
  v15 = v12;
  NSStringFromVGChargingConnectorTypeOptions(activeConnector);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@:%p, identifier: %@, dateOfUpdate: %@, origin: %@, batteryCharge: %@, currentEVRange: %@, maxEVRange: %@, minBatteryCapacity: %@, currentBatteryCapacity: %@, maxBatteryCapacity: %@, consumptionArguments: %@, chargingArguments: %@, isCharging: %@, activeConnector: %@>"), v23, self, identifier, dateOfUpdate, v19, batteryPercentage, currentEVRange, maxEVRange, minBatteryCapacity, currentBatteryCapacity, maxBatteryCapacity, consumptionArguments, chargingArguments, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateOfUpdate
{
  return self->_dateOfUpdate;
}

- (int64_t)origin
{
  return self->_origin;
}

- (NSMeasurement)currentEVRange
{
  return self->_currentEVRange;
}

- (NSMeasurement)maxEVRange
{
  return self->_maxEVRange;
}

- (NSMeasurement)minBatteryCapacity
{
  return self->_minBatteryCapacity;
}

- (NSMeasurement)currentBatteryCapacity
{
  return self->_currentBatteryCapacity;
}

- (NSMeasurement)maxBatteryCapacity
{
  return self->_maxBatteryCapacity;
}

- (NSString)consumptionArguments
{
  return self->_consumptionArguments;
}

- (NSString)chargingArguments
{
  return self->_chargingArguments;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (unint64_t)activeConnector
{
  return self->_activeConnector;
}

- (NSNumber)batteryPercentage
{
  return self->_batteryPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryPercentage, 0);
  objc_storeStrong((id *)&self->_chargingArguments, 0);
  objc_storeStrong((id *)&self->_consumptionArguments, 0);
  objc_storeStrong((id *)&self->_maxBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_currentBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_minBatteryCapacity, 0);
  objc_storeStrong((id *)&self->_maxEVRange, 0);
  objc_storeStrong((id *)&self->_currentEVRange, 0);
  objc_storeStrong((id *)&self->_dateOfUpdate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
