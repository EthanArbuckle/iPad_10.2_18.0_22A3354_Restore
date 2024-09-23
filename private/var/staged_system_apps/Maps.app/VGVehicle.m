@implementation VGVehicle

- (LSApplicationRecord)applicationRecord
{
  id AssociatedObject;
  id v5;
  id v6;
  void *v7;

  AssociatedObject = objc_getAssociatedObject(self, a2);
  v5 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v6 = objc_alloc((Class)LSApplicationRecord);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle pairedAppIdentifier](self, "pairedAppIdentifier"));
    v5 = objc_msgSend(v6, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 0, 0);

    objc_setAssociatedObject(self, a2, v5, (void *)1);
  }
  return (LSApplicationRecord *)v5;
}

- (id)evChargingPorts
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle powerByConnector](self, "powerByConnector", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v10 = GEOEvChargingConnectorTypeFromVGConnectorType(objc_msgSend(v9, "unsignedIntegerValue"));
        if ((_DWORD)v10)
        {
          v11 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle powerByConnector](self, "powerByConnector"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));

          v14 = objc_alloc_init((Class)GEOPDEvChargingPort);
          objc_msgSend(v14, "setChargingConnectorType:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUnitPower watts](NSUnitPower, "watts"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "measurementByConvertingToUnit:", v15));
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(v14, "setPower:", v17);

          objc_msgSend(v3, "addObject:", v14);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isLPRWithElectricEngine
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle lprVehicleType](self, "lprVehicleType"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle lprPowerType](self, "lprPowerType"));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("EV"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)updatedTraitsFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle evChargingPorts](self, "evChargingPorts"));
  objc_msgSend(v4, "setEvChargingPorts:", v5);

  objc_msgSend(v4, "clearEngineTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v7 = objc_msgSend(v6, "engineTypes");

  if ((v7 & 1) != 0)
  {
    objc_msgSend(v4, "addEngineType:", 1);
    if ((v7 & 0x1000000) == 0)
    {
LABEL_3:
      if ((v7 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((v7 & 0x1000000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "addEngineType:", 4);
  if ((v7 & 0x100) == 0)
  {
LABEL_4:
    if ((v7 & 0x10000) != 0)
      goto LABEL_11;
    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(v4, "addEngineType:", 2);
  if ((v7 & 0x10000) != 0)
  {
LABEL_11:
    objc_msgSend(v4, "addEngineType:", 3);
    goto LABEL_12;
  }
LABEL_9:
  if ((-[VGVehicle isPureElectricVehicle](self, "isPureElectricVehicle") & 1) != 0
    || -[VGVehicle isLPRWithElectricEngine](self, "isLPRWithElectricEngine"))
  {
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "clearPreferredBrands");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle preferredChargingNetworks](self, "preferredChargingNetworks"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13), "globalBrandID")));
        objc_msgSend(v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v4, "addPreferredBrand:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue", (_QWORD)v21));
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  return v4;
}

@end
