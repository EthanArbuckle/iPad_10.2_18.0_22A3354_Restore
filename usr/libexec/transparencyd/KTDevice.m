@implementation KTDevice

- (id)debugDescription
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  KTDevice *v21;
  NSMutableArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("[\n")));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v21 = self;
  obj = self->_clientDatas;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v7);
        objc_msgSend(v3, "appendFormat:", CFSTR("   {\n"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientData"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    clientData:%@\n"), v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientDataHash"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    clientDataHash:%@\n"), v12);

        objc_msgSend(v3, "appendFormat:", CFSTR("    appVersion:%lu\n"), objc_msgSend(v8, "applicationVersion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addedDate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "markedForDeletion"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expiry"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "escrowExpiry"));
        objc_msgSend(v3, "appendFormat:", CFSTR("    addedDate:%@ markDate:%@; expiryDate:%@; escrowDate:%@\n"),
          v13,
          v14,
          v15,
          v16);

        objc_msgSend(v3, "appendFormat:", CFSTR("   },\n"));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("  ]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v21->_deviceID, "kt_hexString"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSData kt_hexString](v21->_deviceIDHash, "kt_hexString"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{\n  deviceID:%@\n  deviceIDHash:%@\n  clientDatas: %@\n}"), v17, v18, v3));

  return v19;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceID"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceIDHash"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v14), "diagnosticsJsonDictionary"));
        objc_msgSend(v9, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("clientDatas"));
  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("deviceID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("deviceIDHash"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("clientDataRecords"));

}

- (KTDevice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  KTDevice *v17;
  KTDevice *v18;
  id v19;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("deviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v8), CFSTR("deviceIDHash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_opt_class(NSArray, v11);
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(KTClientDataRecord, v13), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("clientDataRecords")));

  v17 = objc_alloc_init(KTDevice);
  v18 = v17;
  if (v17)
  {
    -[KTDevice setDeviceID:](v17, "setDeviceID:", v7);
    -[KTDevice setDeviceIDHash:](v18, "setDeviceIDHash:", v10);
    v19 = objc_msgSend(v16, "mutableCopy");
    -[KTDevice setClientDatas:](v18, "setClientDatas:", v19);

  }
  return v18;
}

- (KTDevice)initWithIdsDevice:(id)a3
{
  id v4;
  KTDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  KTClientDataRecord *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)KTDevice;
  v5 = -[KTDevice init](&v20, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdHash"));
    -[KTDevice setDeviceIDHash:](v5, "setDeviceIDHash:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[KTDevice setClientDatas:](v5, "setClientDatas:", v7);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientDataArray", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = -[KTClientDataRecord initWithSingleDataRecord:]([KTClientDataRecord alloc], "initWithSingleDataRecord:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](v5, "clientDatas"));
          objc_msgSend(v14, "addObject:", v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (KTDevice)initWithMutation:(id)a3
{
  id v4;
  KTDevice *v5;
  uint64_t v6;
  NSData *deviceIDHash;
  KTClientDataRecord *v8;
  uint64_t v9;
  NSMutableArray *clientDatas;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)KTDevice;
  v5 = -[KTDevice init](&v12, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdHash"));
    deviceIDHash = v5->_deviceIDHash;
    v5->_deviceIDHash = (NSData *)v6;

    v8 = -[KTClientDataRecord initWithMutation:]([KTClientDataRecord alloc], "initWithMutation:", v4);
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
    clientDatas = v5->_clientDatas;
    v5->_clientDatas = (NSMutableArray *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  KTDevice *v5;
  uint64_t v6;
  KTDevice *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;

  v5 = (KTDevice *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(KTDevice, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
      v9 = objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](v7, "deviceID"));
      if (v8 == (void *)v9)
      {

      }
      else
      {
        v10 = (void *)v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](self, "deviceID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceID](v7, "deviceID"));
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_15;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
      v16 = objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](v7, "deviceIDHash"));
      if (v15 == (void *)v16)
      {

      }
      else
      {
        v17 = (void *)v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](self, "deviceIDHash"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice deviceIDHash](v7, "deviceIDHash"));
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_15;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
      v22 = objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](v7, "clientDatas"));
      if (v21 == (void *)v22)
      {

      }
      else
      {
        v23 = (void *)v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](v7, "clientDatas"));
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if ((v26 & 1) == 0)
        {
LABEL_15:
          v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      v14 = 1;
      goto LABEL_18;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (id)clientRecordForAppVersion:(unint64_t)a3 clientDataHash:(id)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_clientDatas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "applicationVersion", (_QWORD)v17) == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "clientDataHash"));
          v14 = objc_msgSend(v13, "isEqualToData:", v6);

          if ((v14 & 1) != 0)
          {
            v15 = v12;
            goto LABEL_12;
          }
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)clientRecordsForHash:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_clientDatas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientDataHash", (_QWORD)v16));
        v13 = objc_msgSend(v12, "isEqualToData:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    v14 = v5;
  else
    v14 = 0;

  return v14;
}

- (void)removeClientDatasObject:(id)a3
{
  -[NSMutableArray removeObject:](self->_clientDatas, "removeObject:", a3);
}

- (void)addClientDatasObject:(id)a3
{
  -[NSMutableArray addObject:](self->_clientDatas, "addObject:", a3);
}

- (void)markClientDatasForAppVersion:(unint64_t)a3 mutationMs:(unint64_t)a4 except:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)a4 / 1000.0));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14);
        if ((!v8
           || (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "isEqual:", v8) & 1) == 0)
          && objc_msgSend(v15, "applicationVersion") == (id)a3
          && (objc_msgSend(v15, "marked:", v9) & 1) == 0
          && (objc_msgSend(v15, "expired:", v9) & 1) == 0)
        {
          objc_msgSend(v15, "markWithMutationMs:", a4);
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (BOOL)marked:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "marked:", v4))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)expired:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "expired:", v4))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)active:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "active:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (NSDate)addedDate
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addedDate"));
        v11 = objc_msgSend(v10, "compare:", v3);

        if (v11 == (id)-1)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addedDate"));

          v3 = (void *)v12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDate *)v3;
}

- (void)updateWithAddMutation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  KTClientDataRecord *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = objc_msgSend(v11, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "clientDataHash"));
  v8 = (KTClientDataRecord *)objc_claimAutoreleasedReturnValue(-[KTDevice clientRecordForAppVersion:clientDataHash:](self, "clientRecordForAppVersion:clientDataHash:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsMutation"));
  v10 = objc_msgSend(v9, "mutationMs");

  -[KTDevice markClientDatasForAppVersion:mutationMs:except:](self, "markClientDatasForAppVersion:mutationMs:except:", objc_msgSend(v11, "appVersion"), v10, v8);
  if (v8)
  {
    -[KTClientDataRecord updateWithAddMutation:error:](v8, "updateWithAddMutation:error:", v11, a4);
  }
  else
  {
    v8 = -[KTClientDataRecord initWithMutation:]([KTClientDataRecord alloc], "initWithMutation:", v11);
    -[KTDevice addClientDatasObject:](self, "addClientDatasObject:", v8);
  }

}

- (void)updateWithMarkDeleteMutation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(v9, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientDataHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientRecordForAppVersion:clientDataHash:](self, "clientRecordForAppVersion:clientDataHash:", v6, v7));

  if (v8)
    objc_msgSend(v8, "updateWithMarkDeleteMutation:error:", v9, a4);

}

- (void)updateWithDeviceStateArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  KTDevice *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v13 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10013196C;
        v14[3] = &unk_1002471F8;
        v14[4] = v12;
        if (objc_msgSend(v4, "indexOfObjectPassingTest:", v14) == (id)0x7FFFFFFFFFFFFFFFLL)
          -[KTDevice removeClientDatasObject:](v13, "removeClientDatasObject:", v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (BOOL)shouldRemove
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)cleanupRecords
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "shouldRemove", (_QWORD)v11))
          -[KTDevice removeClientDatasObject:](self, "removeClientDatasObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)deleteMarkedEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTDevice clientDatas](self, "clientDatas"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "marked:", v4, (_QWORD)v13))
          -[KTDevice removeClientDatasObject:](self, "removeClientDatasObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (NSData)deviceID
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)deviceIDHash
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceIDHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)clientDatas
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDatas, 0);
  objc_storeStrong((id *)&self->_deviceIDHash, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
