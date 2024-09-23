@implementation DMDDeviceController

+ (DMDDeviceController)shared
{
  if (qword_1000EB888 != -1)
    dispatch_once(&qword_1000EB888, &stru_1000BADB8);
  return (DMDDeviceController *)(id)qword_1000EB880;
}

- (DMFDevice)currentDevice
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DMFFetchDevicePropertiesRequest currentDevicePropertyKeys](DMFFetchDevicePropertiesRequest, "currentDevicePropertyKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeviceController deviceWithKeys:](self, "deviceWithKeys:", v3));

  return (DMFDevice *)v4;
}

- (id)deviceWithKeys:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v16 = objc_msgSend(objc_alloc((Class)DMFDevice), "initPrivate");
  v5 = objc_opt_new(NSMutableDictionary);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[DMFDevice propertyNameForKey:](DMFDevice, "propertyNameForKey:", v11, v16));
        v17 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDDeviceController valueForKey:error:](self, "valueForKey:error:", v12, &v17));
        v14 = v17;
        if (v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, v11);
        else
          objc_msgSend(v16, "setValue:forKey:", v13, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(v16, "setErrorsForKeys:", v5);
  return v16;
}

- (id)deviceType
{
  return &off_1000C34F8;
}

@end
