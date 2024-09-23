@implementation CBWHBAggregateDevice

- (id)description
{
  NSMutableDictionary *v3;
  CBDevice *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];

  v3 = self->_deviceControllerMap;
  v4 = self->_latestDevice;
  v24 = 0;
  v5 = objc_msgSend((id)objc_opt_class(self), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  NSAppendPrintF_safe(&v24, "%@: %@, Hosts %d", v6, v4, -[NSMutableDictionary count](v3, "count"));
  v7 = v24;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v3, "allKeys"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = " [";
    do
    {
      v13 = 0;
      v14 = v7;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
        v19 = v14;
        NSAppendPrintF_safe(&v19, "%s%@", v12, v15);
        v7 = v19;

        v13 = (char *)v13 + 1;
        v12 = ", ";
        v14 = v7;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v12 = ", ";
    }
    while (v10);

    v18 = v7;
    NSAppendPrintF_safe(&v18, "]");
    v8 = v7;
    v7 = v18;
  }

  v16 = v7;
  return v16;
}

- (NSMutableDictionary)deviceControllerMap
{
  return self->_deviceControllerMap;
}

- (void)setDeviceControllerMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceControllerMap, a3);
}

- (CBDevice)latestDevice
{
  return self->_latestDevice;
}

- (void)setLatestDevice:(id)a3
{
  objc_storeStrong((id *)&self->_latestDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDevice, 0);
  objc_storeStrong((id *)&self->_deviceControllerMap, 0);
}

@end
