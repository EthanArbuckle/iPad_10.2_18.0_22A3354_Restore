@implementation MapsExternalAccessoryState

+ (id)allKeys
{
  if (qword_1014D3170 != -1)
    dispatch_once(&qword_1014D3170, &stru_1011C5BB0);
  return (id)qword_1014D3168;
}

- (id)descriptionForKey:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("destinationHandoffEnabled")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("lowRangeWarning")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessoryState valueForKey:](self, "valueForKey:", v4));
    v6 = objc_msgSend(v5, "BOOLValue");
    v7 = CFSTR("NO");
    if (v6)
      v7 = CFSTR("YES");
    v8 = v7;

  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("engineTypes")))
    {
      v9 = sub_100760100((int)-[MapsExternalAccessoryState engineTypes](self, "engineTypes"));
      v10 = objc_claimAutoreleasedReturnValue(v9);
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)MapsExternalAccessoryState;
      v11 = -[MapsExternalState descriptionForKey:](&v13, "descriptionForKey:", v4);
      v10 = objc_claimAutoreleasedReturnValue(v11);
    }
    v8 = (__CFString *)v10;
  }

  return v8;
}

- (MapsExternalAccessoryState)initWithAccessory:(id)a3
{
  id v4;
  MapsExternalAccessoryState *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *manufacturer;
  uint64_t v10;
  NSString *model;
  uint64_t v12;
  NSString *carName;
  uint64_t v14;
  NSString *bluetoothIdentifier;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MapsExternalAccessoryState;
  v5 = -[MapsExternalAccessoryState init](&v19, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_connectionID = (unint64_t)objc_msgSend(v4, "connectionID");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manufacturer"));
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelNumber"));
    model = v5->_model;
    v5->_model = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    carName = v5->_carName;
    v5->_carName = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "macAddress"));
    bluetoothIdentifier = v5->_bluetoothIdentifier;
    v5->_bluetoothIdentifier = (NSString *)v14;

    v5->_destinationHandoffEnabled = objc_msgSend(v4, "pointOfInterestHandoffEnabled");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getVehicleInfoData"));
    -[MapsExternalAccessoryState updateWithInfo:](v5, "updateWithInfo:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vehicleInfoInitialData"));

    -[MapsExternalAccessoryState updateWithInfo:](v5, "updateWithInfo:", v17);
  }

  return v5;
}

- (void)_augmentMutableVehicleInfo:(id)a3
{
  uint64_t v3;
  id v5;
  _QWORD v6[2];
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  void *v8;
  id v9;
  _OWORD v10[8];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_100760ECC;
  v8 = &unk_1011C5C00;
  v9 = a3;
  v3 = 0;
  v5 = v9;
  v10[0] = MapsEAVehicleConfig_RangeGasoline;
  v10[1] = MapsEAVehicleConfig_RangeDiesel;
  v10[2] = MapsEAVehicleConfig_RangeElectric;
  v10[3] = MapsEAVehicleConfig_RangeCNG;
  v10[4] = MapsEAVehicleConfig_HasLowDistanceRangeGasoline;
  v10[5] = MapsEAVehicleConfig_HasLowDistanceRangeDiesel;
  v10[6] = MapsEAVehicleConfig_HasLowDistanceRangeElectric;
  v10[7] = MapsEAVehicleConfig_HasLowDistanceRangeCNG;
  do
  {
    if (!v7((uint64_t)v6, *(_QWORD *)&v10[v3], *((_QWORD *)&v10[v3] + 1)))
      break;
  }
  while (v3++ != 7);

}

- (id)_augmentVehicleInfo:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  int v10;
  void *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  v5 = sub_100761100();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "pre-augment vehicleInfo=%@", (uint8_t *)&v10, 0xCu);
  }

  -[MapsExternalAccessoryState _augmentMutableVehicleInfo:](self, "_augmentMutableVehicleInfo:", v4);
  -[MapsExternalAccessoryState _augmentMutableVehicleInfo:](self, "_augmentMutableVehicleInfo:", v4);
  v7 = sub_100761100();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "post-augment vehicleInfo=%@", (uint8_t *)&v10, 0xCu);
  }

  return v4;
}

- (void)updateWithInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unsigned int v23;
  NSMutableDictionary *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;

  v4 = a3;
  v5 = sub_100761100();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "vehicleInfo=%@", buf, 0xCu);
  }

  if (GEOConfigGetBOOL(MapsEAVehicleConfig_AugmentVehicleInfo, off_1014BA660))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[MapsExternalAccessoryState _augmentVehicleInfo:](self, "_augmentVehicleInfo:", v4));

    v4 = (id)v7;
  }
  v8 = EAConnectionIDKey;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAConnectionIDKey));
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8)),
        v12 = objc_msgSend(v11, "unsignedIntegerValue"),
        v13 = -[MapsExternalAccessoryState connectionID](self, "connectionID"),
        v11,
        v10,
        v12 == (id)v13))
  {
    v14 = EAVehicleInfoYearKey;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAVehicleInfoYearKey));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
      -[MapsExternalAccessoryState setYear:](self, "setYear:", v16);

    }
    v17 = EAVehicleInfoMapsDisplayNameKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAVehicleInfoMapsDisplayNameKey));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v17));
      -[MapsExternalAccessoryState setMapsDisplayName:](self, "setMapsDisplayName:", v19);

    }
    v20 = EAVehicleInfoEngineTypeBitmaskKey;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAVehicleInfoEngineTypeBitmaskKey));

    if (!v21)
      goto LABEL_18;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v20));
    -[MapsExternalAccessoryState setEngineType:](self, "setEngineType:", objc_msgSend(v22, "longLongValue"));

    v23 = -[MapsExternalAccessoryState engineTypes](self, "engineTypes");
    v24 = objc_opt_new(NSMutableDictionary);
    if ((v23 & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarEngineState engineStateGasoline](MapsCarEngineState, "engineStateGasoline"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v38, &off_10126EBC0);

      if ((v23 & 0x100) == 0)
      {
LABEL_14:
        if ((v23 & 0x10000) == 0)
          goto LABEL_15;
        goto LABEL_33;
      }
    }
    else if ((v23 & 0x100) == 0)
    {
      goto LABEL_14;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarEngineState engineStateDiesel](MapsCarEngineState, "engineStateDiesel"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v39, &off_10126EBD8);

    if ((v23 & 0x10000) == 0)
    {
LABEL_15:
      if ((v23 & 0x1000000) == 0)
      {
LABEL_17:
        -[MapsExternalAccessoryState setEngineStates:](self, "setEngineStates:", v24);

LABEL_18:
        v26 = EAVehicleInfoHasLowDistanceRangeKey;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAVehicleInfoHasLowDistanceRangeKey));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v26));
          -[MapsExternalAccessoryState setLowRangeWarning:](self, "setLowRangeWarning:", objc_msgSend(v28, "BOOLValue"));

        }
        v29 = EAVehicleInfoRangeKey;
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAVehicleInfoRangeKey));

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v29));
          -[MapsExternalAccessoryState setRange:](self, "setRange:", v31);

        }
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessoryState engineStates](self, "engineStates", 0));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allValues"));

        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v42;
          do
          {
            v37 = 0;
            do
            {
              if (*(_QWORD *)v42 != v36)
                objc_enumerationMutation(v33);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v37), "updateWithVehicleInfo:", v4);
              v37 = (char *)v37 + 1;
            }
            while (v35 != v37);
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v35);
        }

        goto LABEL_30;
      }
LABEL_16:
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarEngineState engineStateCNG](MapsCarEngineState, "engineStateCNG"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, &off_10126EC08);

      goto LABEL_17;
    }
LABEL_33:
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MapsCarEngineState engineStateElectric](MapsCarEngineState, "engineStateElectric"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v40, &off_10126EBF0);

    if ((v23 & 0x1000000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_30:

}

- ($294CB042FB18EDF8FD74FDF4F765ED39)engineTypes
{
  unsigned int v2;

  v2 = -[MapsExternalAccessoryState engineType](self, "engineType");
  return ($294CB042FB18EDF8FD74FDF4F765ED39)(v2 & 1 | (((v2 >> 2) & 1) << 16) & 0xFEFFFEFF | (((v2 >> 3) & 1) << 24) | (((v2 >> 1) & 1) << 8));
}

- (BOOL)isEqualToState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MapsExternalAccessoryState;
  return -[MapsExternalState isEqualToState:](&v4, "isEqualToState:", a3);
}

- (unint64_t)connectionID
{
  return self->_connectionID;
}

- (void)setConnectionID:(unint64_t)a3
{
  self->_connectionID = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bluetoothIdentifier
{
  return self->_bluetoothIdentifier;
}

- (void)setBluetoothIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)year
{
  return self->_year;
}

- (void)setYear:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)carName
{
  return self->_carName;
}

- (void)setCarName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)destinationHandoffEnabled
{
  return self->_destinationHandoffEnabled;
}

- (void)setDestinationHandoffEnabled:(BOOL)a3
{
  self->_destinationHandoffEnabled = a3;
}

- (NSString)mapsDisplayName
{
  return self->_mapsDisplayName;
}

- (void)setMapsDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int)a3
{
  self->_engineType = a3;
}

- (BOOL)lowRangeWarning
{
  return self->_lowRangeWarning;
}

- (void)setLowRangeWarning:(BOOL)a3
{
  self->_lowRangeWarning = a3;
}

- (NSNumber)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)engineStates
{
  return self->_engineStates;
}

- (void)setEngineStates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineStates, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_mapsDisplayName, 0);
  objc_storeStrong((id *)&self->_carName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_bluetoothIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
