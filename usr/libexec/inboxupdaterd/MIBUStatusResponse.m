@implementation MIBUStatusResponse

- (MIBUStatusResponse)init
{
  MIBUStatusResponse *v2;
  MIBUStatusResponse *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MIBUStatusResponse;
  v2 = -[MIBUNFCResponse init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[MIBUStatusResponse setSerialNumber:](v2, "setSerialNumber:", 0);
    -[MIBUStatusResponse setOsVersion:](v3, "setOsVersion:", 0);
    -[MIBUStatusResponse setBuildVersion:](v3, "setBuildVersion:", 0);
    -[MIBUStatusResponse setStatus:](v3, "setStatus:", 0);
  }
  return v3;
}

- (id)serialize
{
  MIBUSerializer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];

  v3 = objc_opt_new(MIBUSerializer);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));

  if (!v4 || -[MIBUNFCResponse rejected](self, "rejected"))
    goto LABEL_23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v24, "state")));
  v25[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse serialNumber](self, "serialNumber"));
  v25[1] = v22;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse osVersion](self, "osVersion"));
  v25[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse buildVersion](self, "buildVersion"));
  v25[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "operation")));
  v25[4] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "batteryLevel"));
  v25[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 6));
  v12 = -[MIBUSerializer serialize:withValue:](v3, "serialize:withValue:", &off_10005D1F0, v11);

  if ((v12 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058900);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E6E8();
    goto LABEL_23;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUNFCResponse error](self, "error"));
  v14 = -[MIBUSerializer serializeResponseError:](v3, "serializeResponseError:", v13);

  if ((v14 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058920);
    v20 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E654(v20, self);
    goto LABEL_23;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "operationError"));
  v17 = -[MIBUSerializer serializeOperationError:](v3, "serializeOperationError:", v16);

  if ((v17 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058940);
    v21 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E5A8(v21, self);
    goto LABEL_23;
  }
  if (!-[MIBUStatusResponse _serializeOperationDetailsWithSerializer:](self, "_serializeOperationDetailsWithSerializer:", v3)|| !-[MIBUStatusResponse _serializeThermalDetailsWithSerializer:](self, "_serializeThermalDetailsWithSerializer:", v3)|| !-[MIBUStatusResponse _serializeBatteryDetailsWithSerializer:](self, "_serializeBatteryDetailsWithSerializer:", v3))
  {
LABEL_23:
    v18 = 0;
    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUSerializer serializedData](v3, "serializedData"));
LABEL_10:

  return v18;
}

- (BOOL)_deserialize:(id)a3
{
  id v4;
  MIBUDeserializer *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  MIBUDeviceStatus *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;

  v4 = a3;
  v5 = -[MIBUDeserializer initWithData:]([MIBUDeserializer alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUDeserializer deserialize](v5, "deserialize"));
  if (!v6)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058960);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E714();
    v27 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    v38 = 0;
    v39 = 0;
    goto LABEL_24;
  }
  v41 = 0;
  v7 = -[MIBUDeserializer deserializeResponseError:](v5, "deserializeResponseError:", &v41);
  v39 = v41;
  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100058980);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E2D8();
    goto LABEL_23;
  }
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CB08));
  if (!v8)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000589A0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E740();
LABEL_23:
    v27 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    v38 = 0;
LABEL_24:
    v11 = 0;
    v9 = 0;
LABEL_30:
    v34 = 0;
    goto LABEL_9;
  }
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CB68));
  if (!v10)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000589C0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E76C();
    v27 = 0;
    v12 = 0;
    v15 = 0;
    v14 = 0;
    v38 = 0;
    v11 = 0;
    goto LABEL_30;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CB20));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CB38));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CB50));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", &off_10005CB80));
    if (v16)
    {
      v37 = (void *)v16;
      v40 = 0;
      v17 = -[MIBUDeserializer deserializeOperationError:](v5, "deserializeOperationError:", &v40);
      v18 = v40;
      v38 = v18;
      if ((v17 & 1) != 0)
      {
        v19 = v18;
        v20 = objc_alloc_init(MIBUDeviceStatus);
        -[MIBUStatusResponse setStatus:](self, "setStatus:", v20);

        -[MIBUStatusResponse setSerialNumber:](self, "setSerialNumber:", v12);
        -[MIBUStatusResponse setOsVersion:](self, "setOsVersion:", v14);
        -[MIBUStatusResponse setBuildVersion:](self, "setBuildVersion:", v15);
        v21 = (int)objc_msgSend(v9, "shortValue");
        v36 = v12;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        objc_msgSend(v22, "setState:", v21);

        v23 = (int)objc_msgSend(v11, "shortValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        objc_msgSend(v24, "setOperation:", v23);

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        objc_msgSend(v25, "setOperationError:", v19);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        v27 = v37;
        objc_msgSend(v26, "setBatteryLevel:", v37);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _deserializeThermalDetailsFromDict:](self, "_deserializeThermalDetailsFromDict:", v6));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        objc_msgSend(v29, "setThermalDetails:", v28);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _deserializeBatteryDetailsFromDict:](self, "_deserializeBatteryDetailsFromDict:", v6));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        objc_msgSend(v31, "setBatteryDetails:", v30);

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _deserializeOperationDetailsFromDict:](self, "_deserializeOperationDetailsFromDict:", v6));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
        objc_msgSend(v33, "setOperationDetails:", v32);

        v12 = v36;
        v34 = 1;
      }
      else
      {
        if (qword_100068958 != -1)
          dispatch_once(&qword_100068958, &stru_100058A20);
        if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
          sub_10003E7F0();
        v34 = 0;
        v27 = v37;
      }
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100058A00);
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
        sub_10003E7C4();
      v27 = 0;
      v38 = 0;
      v34 = 0;
    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000589E0);
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003E798();
    v27 = 0;
    v15 = 0;
    v38 = 0;
    v34 = 0;
    v14 = 0;
  }
LABEL_9:
  -[MIBUNFCResponse setError:](self, "setError:", v39);

  return v34;
}

- (id)_reverseDict:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v13));
        -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_serializeDict:(id)a3 fromKeyToTagMapping:(id)a4 withSerializer:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  BOOL v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  uint64_t v29;
  _BYTE v30[128];

  v7 = a3;
  v8 = a4;
  v23 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v14));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v14));
        v17 = (void *)v16;
        if (v16)
        {
          v29 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
          v28 = v15;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
          v20 = objc_msgSend(v23, "serialize:withValue:", v18, v19);

          if ((v20 & 1) == 0)
          {

            v21 = 0;
            goto LABEL_11;
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v11)
        continue;
      break;
    }
  }
  v21 = 1;
LABEL_11:

  return v21;
}

- (id)_deserializeFromTagDict:(id)a3 withKeyToTagMapping:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _reverseDict:](self, "_reverseDict:", v7));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v14));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v14));
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v15, v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_serializeOperationDetailsWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[6];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operationDetails"));
  v9[0] = CFSTR("Progress");
  v9[1] = CFSTR("TimeRemaining");
  v10[0] = &off_10005CB98;
  v10[1] = &off_10005CBB0;
  v9[2] = CFSTR("TargetOSVersion");
  v9[3] = CFSTR("TargetBuildVersion");
  v10[2] = &off_10005CBC8;
  v10[3] = &off_10005CBE0;
  v9[4] = CFSTR("SoftwareUpdatePhase");
  v9[5] = CFSTR("TargetSUBundleSize");
  v10[4] = &off_10005CBF8;
  v10[5] = &off_10005CC10;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 6));
  LOBYTE(self) = -[MIBUStatusResponse _serializeDict:fromKeyToTagMapping:withSerializer:](self, "_serializeDict:fromKeyToTagMapping:withSerializer:", v6, v7, v4);

  return (char)self;
}

- (id)_deserializeOperationDetailsFromDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[6];

  v8[0] = CFSTR("Progress");
  v8[1] = CFSTR("TimeRemaining");
  v9[0] = &off_10005CB98;
  v9[1] = &off_10005CBB0;
  v8[2] = CFSTR("TargetOSVersion");
  v8[3] = CFSTR("TargetBuildVersion");
  v9[2] = &off_10005CBC8;
  v9[3] = &off_10005CBE0;
  v8[4] = CFSTR("SoftwareUpdatePhase");
  v8[5] = CFSTR("TargetSUBundleSize");
  v9[4] = &off_10005CBF8;
  v9[5] = &off_10005CC10;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 6));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _deserializeFromTagDict:withKeyToTagMapping:](self, "_deserializeFromTagDict:withKeyToTagMapping:", v4, v5));

  return v6;
}

- (BOOL)_serializeThermalDetailsWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[9];
  _QWORD v10[9];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thermalDetails"));
  v9[0] = CFSTR("TSRM/TVRM");
  v9[1] = CFSTR("TSRR/TVRR");
  v10[0] = &off_10005CC28;
  v10[1] = &off_10005CC40;
  v9[2] = CFSTR("TVRQ");
  v9[3] = CFSTR("TSBE/TVBE");
  v10[2] = &off_10005CC58;
  v10[3] = &off_10005CC70;
  v9[4] = CFSTR("TSBQ/TVBQ");
  v9[5] = CFSTR("TSBR/TVBR");
  v10[4] = &off_10005CC88;
  v10[5] = &off_10005CCA0;
  v9[6] = CFSTR("TSLR/TVRH");
  v9[7] = CFSTR("TG0V");
  v10[6] = &off_10005CCB8;
  v10[7] = &off_10005CCD0;
  v9[8] = CFSTR("ThermalPressure");
  v10[8] = &off_10005CCE8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 9));
  LOBYTE(self) = -[MIBUStatusResponse _serializeDict:fromKeyToTagMapping:withSerializer:](self, "_serializeDict:fromKeyToTagMapping:withSerializer:", v6, v7, v4);

  return (char)self;
}

- (id)_deserializeThermalDetailsFromDict:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  double v17;
  void *v18;
  uint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[9];
  _QWORD v28[9];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v27[0] = CFSTR("TSRM/TVRM");
  v27[1] = CFSTR("TSRR/TVRR");
  v28[0] = &off_10005CC28;
  v28[1] = &off_10005CC40;
  v27[2] = CFSTR("TVRQ");
  v27[3] = CFSTR("TSBE/TVBE");
  v28[2] = &off_10005CC58;
  v28[3] = &off_10005CC70;
  v27[4] = CFSTR("TSBQ/TVBQ");
  v27[5] = CFSTR("TSBR/TVBR");
  v28[4] = &off_10005CC88;
  v28[5] = &off_10005CCA0;
  v27[6] = CFSTR("TSLR/TVRH");
  v27[7] = CFSTR("TG0V");
  v28[6] = &off_10005CCB8;
  v28[7] = &off_10005CCD0;
  v27[8] = CFSTR("ThermalPressure");
  v28[8] = &off_10005CCE8;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _deserializeFromTagDict:withKeyToTagMapping:](self, "_deserializeFromTagDict:withKeyToTagMapping:", v4, v6));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13));
        v15 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v21 = 0;
          v16 = v14;
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("TG0V")))
          {
            v20 = 0;
            objc_msgSend(v16, "getBytes:length:", &v20, 8);
            v17 = (double)v20 * 0.0000152587891;
            *(float *)&v17 = v17;
            v21 = LODWORD(v17);
          }
          else
          {
            objc_msgSend(v16, "getBytes:length:", &v21, 4);
            LODWORD(v17) = v21;
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v18, v13);

        }
        else
        {
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)_serializeBatteryDetailsWithSerializer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "batteryDetails"));
  v9[0] = CFSTR("WARP");
  v9[1] = CFSTR("WAVR");
  v10[0] = &off_10005CD00;
  v10[1] = &off_10005CD18;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  LOBYTE(self) = -[MIBUStatusResponse _serializeDict:fromKeyToTagMapping:withSerializer:](self, "_serializeDict:fromKeyToTagMapping:withSerializer:", v6, v7, v4);

  return (char)self;
}

- (id)_deserializeBatteryDetailsFromDict:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  __int16 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];
  _QWORD v26[2];

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v25[0] = CFSTR("WARP");
  v25[1] = CFSTR("WAVR");
  v26[0] = &off_10005CD00;
  v26[1] = &off_10005CD18;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
  v18 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUStatusResponse _deserializeFromTagDict:withKeyToTagMapping:](self, "_deserializeFromTagDict:withKeyToTagMapping:", v4, v6));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v13));
        v15 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v19 = 0;
          objc_msgSend(v14, "getBytes:length:", &v19, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v19));
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v16, v13);

        }
        else
        {
          -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v14, v13);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersion, a3);
}

- (MIBUDeviceStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end
