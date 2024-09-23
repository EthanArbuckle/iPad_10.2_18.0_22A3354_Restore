@implementation HAPBLEServiceCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLEServiceCache)initWithServiceUUID:(id)a3 instanceId:(id)a4 instanceOrder:(unint64_t)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v13;
  id v14;
  id v15;
  HAPBLEServiceCache *v16;
  HAPBLEServiceCache *v17;
  uint64_t v18;
  NSMutableArray *cachedCharacteristics;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPBLEServiceCache;
  v16 = -[HAPBLEServiceCache init](&v21, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_serviceUUID, a3);
    objc_storeStrong((id *)&v17->_serviceInstanceId, a4);
    v17->_serviceInstanceOrder = a5;
    v17->_serviceProperties = a6;
    objc_storeStrong((id *)&v17->_linkedServices, a7);
    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    cachedCharacteristics = v17->_cachedCharacteristics;
    v17->_cachedCharacteristics = (NSMutableArray *)v18;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEServiceCache *v4;
  uint64_t v5;
  HAPBLEServiceCache *v6;
  uint64_t v7;
  HAPBLEServiceCache *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  BOOL v16;

  v4 = (HAPBLEServiceCache *)a3;
  v6 = v4;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    v7 = objc_opt_class(v4, v5);
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceUUID](self, "serviceUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceUUID](v8, "serviceUUID"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v11
        && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId")),
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceInstanceId](v8, "serviceInstanceId")),
            v14 = objc_msgSend(v12, "isEqual:", v13),
            v13,
            v12,
            v14))
      {
        v15 = -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder");
        v16 = v15 == (id)-[HAPBLEServiceCache serviceInstanceOrder](v8, "serviceInstanceOrder");
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceUUID](self, "serviceUUID"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)updateWithService:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAPBLEServiceCache setServiceInstanceOrder:](self, "setServiceInstanceOrder:", objc_msgSend(v4, "serviceInstanceOrder"));
  -[HAPBLEServiceCache setServiceProperties:](self, "setServiceProperties:", objc_msgSend(v4, "serviceProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "linkedServices"));
  -[HAPBLEServiceCache setLinkedServices:](self, "setLinkedServices:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedCharacteristics"));
  -[HAPBLEServiceCache setCachedCharacteristics:](self, "setCachedCharacteristics:", v6);

}

- (void)updateWithCharacteristic:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "isEqual:", v4))
        {
          objc_msgSend(v10, "updateWithCharacteristic:", v4);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics"));
  objc_msgSend(v5, "addObject:", v4);
LABEL_11:

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceUUID](self, "serviceUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SUUI"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SI"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder"), CFSTR("SO"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEServiceCache serviceProperties](self, "serviceProperties"), CFSTR("SP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache linkedServices](self, "linkedServices"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LS"));

  v8 = (id)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CC"));

}

- (HAPBLEServiceCache)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HAPBLEServiceCache *v6;
  id v7;
  uint64_t v8;
  NSUUID *serviceUUID;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *serviceInstanceId;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *linkedServices;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSMutableArray *cachedCharacteristics;
  HAPBLEServiceCache *v26;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[2];

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HAPBLEServiceCache;
  v6 = -[HAPBLEServiceCache init](&v28, "init");
  if (!v6)
    goto LABEL_5;
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("SUUI"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  serviceUUID = v6->_serviceUUID;
  v6->_serviceUUID = (NSUUID *)v8;

  v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("SI"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  serviceInstanceId = v6->_serviceInstanceId;
  v6->_serviceInstanceId = (NSNumber *)v12;

  v6->_serviceInstanceOrder = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SO"));
  v6->_serviceProperties = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SP"));
  v30[0] = objc_opt_class(NSArray, v14);
  v30[1] = objc_opt_class(NSNumber, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("LS")));
  linkedServices = v6->_linkedServices;
  v6->_linkedServices = (NSArray *)v18;

  v29[0] = objc_opt_class(NSArray, v20);
  v29[1] = objc_opt_class(HAPBLECharacteristicCache, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v22));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("CC")));
  cachedCharacteristics = v6->_cachedCharacteristics;
  v6->_cachedCharacteristics = (NSMutableArray *)v24;

  if (!v6->_serviceInstanceId)
    goto LABEL_5;
  if (v6->_serviceUUID)
    v26 = v6;
  else
LABEL_5:
    v26 = 0;

  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nList of Characteristics: %tu\n"), objc_msgSend(v3, "count")));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v9)));

        v9 = (char *)v9 + 1;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceUUID](self, "serviceUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId"));
  v13 = -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder");
  v14 = sub_1000271A4((char)-[HAPBLEServiceCache serviceProperties](self, "serviceProperties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEServiceCache linkedServices](self, "linkedServices"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\nService Info:\n\tService UUID: %@,\n\tInstanceId: %@,\n\tOrder: %lu,\n\tProperties: %@,\n\tLinkedServices: %@,\n\t %@"), v11, v12, v13, v15, v16, v4));

  return v17;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (NSNumber)serviceInstanceId
{
  return self->_serviceInstanceId;
}

- (unint64_t)serviceInstanceOrder
{
  return self->_serviceInstanceOrder;
}

- (void)setServiceInstanceOrder:(unint64_t)a3
{
  self->_serviceInstanceOrder = a3;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (NSMutableArray)cachedCharacteristics
{
  return self->_cachedCharacteristics;
}

- (void)setCachedCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCharacteristics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceId, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
}

@end
