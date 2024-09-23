@implementation HAPService

- (CBService)cbService
{
  id AssociatedObject;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  AssociatedObject = objc_getAssociatedObject(self, "cbService");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = objc_opt_class(CBService, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;

  return (CBService *)v6;
}

- (void)setCBService:(id)a3
{
  objc_setAssociatedObject(self, "cbService", a3, (void *)1);
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4 parsedCharacteristics:(id)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSString *v23;
  NSString *type;
  void *v25;
  uint64_t v26;
  id v27;
  __CFString *v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  const char *v37;
  id v38;
  __CFString *v39;
  NSObject *v40;
  id v41;
  __CFString *v42;
  void *v43;
  const char *v44;
  id v45;
  __CFString *v46;
  HAPService *v47;
  uint64_t v49;
  id v50;
  __CFString *v51;
  NSObject *log;
  id v53;
  void *v54;
  id v55;
  void *v56;
  objc_super v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  NSString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((sub_10007B894(v12) & 1) != 0)
  {
    v17 = sub_10007BA30(v12);
    v19 = objc_claimAutoreleasedReturnValue(v17);
    if (v19)
    {
      if ((sub_10007BD14(v13) & 1) != 0)
      {
        v57.receiver = self;
        v57.super_class = (Class)HAPService;
        self = -[HAPService init](&v57, "init");
        if (self)
        {
          v55 = v15;
          v53 = v13;
          v21 = v14;
          v22 = objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
          v23 = (NSString *)objc_claimAutoreleasedReturnValue(+[HMFObjectCacheNSString hmf_cachedInstanceForString:](HMFObjectCacheNSString, "hmf_cachedInstanceForString:", v19));
          type = self->_type;
          self->_type = v23;

          v54 = (void *)v22;
          v25 = (void *)v22;
          v14 = v21;
          v13 = v53;
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "serviceUTIFromType:", v19));
          if (v56)
          {
            v27 = sub_10007CCE4(0, v26);
            log = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
            {
              v28 = sub_10007CD2C(0);
              v29 = objc_claimAutoreleasedReturnValue(v28);
              v30 = self->_type;
              *(_DWORD *)buf = 138544130;
              v59 = v29;
              v31 = (void *)v29;
              v60 = 2112;
              v61 = v30;
              v62 = 2112;
              v63 = v56;
              v64 = 2112;
              v65 = v53;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@%@ ----> %@ [%@]", buf, 0x2Au);

            }
          }
          objc_storeStrong((id *)&self->_instanceID, a4);
          v15 = v55;
          if (v14)
          {
            if ((unint64_t)objc_msgSend(v14, "count") >= 0x65)
            {
              v33 = sub_10007CCE4(0, v32);
              v34 = objc_claimAutoreleasedReturnValue(v33);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v35 = sub_10007CD2C(0);
                v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
                *(_DWORD *)buf = 138543362;
                v59 = (uint64_t)v36;
                v37 = "%{public}@### HAPService exceeds maximum number of allowed characteristics";
LABEL_28:
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);

                goto LABEL_29;
              }
              goto LABEL_29;
            }
            objc_storeStrong((id *)&self->_characteristics, a5);
            if (!-[HAPService updateAndValidateCharacteristics](self, "updateAndValidateCharacteristics"))
            {
              v50 = sub_10007CCE4(0, v49);
              v34 = objc_claimAutoreleasedReturnValue(v50);
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v51 = sub_10007CD2C(0);
                v36 = (void *)objc_claimAutoreleasedReturnValue(v51);
                *(_DWORD *)buf = 138543362;
                v59 = (uint64_t)v36;
                v37 = "%{public}@### HAPService failed updateAndValidateCharacteristics";
                goto LABEL_28;
              }
LABEL_29:

              goto LABEL_21;
            }
          }
          self->_serviceProperties = a6;
          objc_storeStrong((id *)&self->_linkedServices, a7);

        }
        self = self;
        v47 = self;
        goto LABEL_22;
      }
      v45 = sub_10007CCE4(0, v20);
      v40 = objc_claimAutoreleasedReturnValue(v45);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      v46 = sub_10007CD2C(0);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v46);
      *(_DWORD *)buf = 138543362;
      v59 = (uint64_t)v43;
      v44 = "%{public}@### Unable to initialize service because of invalid instance ID";
      goto LABEL_19;
    }
    v41 = sub_10007CCE4(0, v18);
    v40 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v42 = sub_10007CD2C(0);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      *(_DWORD *)buf = 138543362;
      v59 = (uint64_t)v43;
      v44 = "%{public}@### Unable to initialize service because type name is not a UUID";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);

    }
LABEL_20:

    goto LABEL_21;
  }
  v38 = sub_10007CCE4(0, v16);
  v19 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v39 = sub_10007CD2C(0);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    *(_DWORD *)buf = 138543618;
    v59 = (uint64_t)v40;
    v60 = 2112;
    v61 = (NSString *)v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@### Unable to initialize service because of invalid service type name: %@", buf, 0x16u);
    goto LABEL_20;
  }
LABEL_21:
  v47 = 0;
LABEL_22:

  return v47;
}

- (HAPService)initWithType:(id)a3 instanceID:(id)a4
{
  return -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](self, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", a3, a4, 0, 0, 0);
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService instanceID](self, "instanceID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPService *v5;
  uint64_t v6;
  HAPService *v7;
  HAPService *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  unsigned __int8 v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = (HAPService *)a3;
  if (self == v5)
  {
    v15 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPService, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
      goto LABEL_8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService instanceID](self, "instanceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService instanceID](v8, "instanceID"));
    v11 = sub_10007BF54(v9, v10);

    if ((v11 & 1) != 0
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService type](self, "type")),
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService type](v8, "type")),
          v14 = sub_10007BF28((unint64_t)v12, (uint64_t)v13),
          v13,
          v12,
          (v14 & 1) != 0))
    {
LABEL_8:
      v15 = 0;
    }
    else
    {
      v17 = objc_claimAutoreleasedReturnValue(-[HAPService accessory](self, "accessory"));
      if (v17)
      {
        v18 = (void *)v17;
        v19 = objc_claimAutoreleasedReturnValue(-[HAPService accessory](v8, "accessory"));
        if (v19)
        {
          v20 = (void *)v19;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService accessory](self, "accessory"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService accessory](v8, "accessory"));
          v15 = objc_msgSend(v21, "isEqual:", v22);

        }
        else
        {
          v15 = 1;
        }

      }
      else
      {
        v15 = 1;
      }
    }

  }
  return v15;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService instanceID](self, "instanceID"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Instance ID: %@"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService type](self, "type"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Type: %@"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService propertiesDescription](self, "propertiesDescription"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Properties: %@"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService linkedServices](self, "linkedServices"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", Linked Service: %@"), v7);

  return (NSString *)v3;
}

- (id)propertiesDescription
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  if ((-[HAPService serviceProperties](self, "serviceProperties") & 1) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("primary"));
  if ((-[HAPService serviceProperties](self, "serviceProperties") & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("hidden"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init((Class)NSMutableString);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v4, "appendString:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v3, "removeObject:", v6);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11));
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)updateAndValidateCharacteristics
{
  HAPService *v2;
  id v3;
  void *v4;
  HAPService *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  HAPService *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  HAPService *v24;
  const char *v25;
  HAPService *v26;
  uint64_t v27;
  id v28;
  __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  HAPService *v37;

  v2 = self;
  if (-[HAPService _validateServiceCharacteristics](self, "_validateServiceCharacteristics"))
  {
    v3 = objc_alloc((Class)NSMutableSet);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](v2, "characteristics"));
    v5 = (HAPService *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = objc_claimAutoreleasedReturnValue(-[HAPService characteristics](v2, "characteristics", 0));
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (!v7)
    {
      v15 = 1;
      goto LABEL_23;
    }
    v8 = v7;
    v9 = *(_QWORD *)v32;
LABEL_4:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instanceID"));
      v13 = -[HAPService containsObject:](v5, "containsObject:", v12);

      if (v13)
        break;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instanceID"));
      -[HAPService addObject:](v5, "addObject:", v14);

      if (!-[HAPService _updateCharacteristic:](v2, "_updateCharacteristic:", v11))
      {
        v26 = v2;
        v28 = sub_10007CCE4((uint64_t)v26, v27);
        v22 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v29 = sub_10007CD2C(v26);
          v24 = (HAPService *)objc_claimAutoreleasedReturnValue(v29);
          *(_DWORD *)buf = 138543362;
          v37 = v24;
          v25 = "%{public}@Failed to update characteristic";
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);

        }
        goto LABEL_20;
      }
      if (v8 == (id)++v10)
      {
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v15 = 1;
        if (v8)
          goto LABEL_4;
        goto LABEL_23;
      }
    }
    v19 = v2;
    v21 = sub_10007CCE4((uint64_t)v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_10007CD2C(v19);
      v24 = (HAPService *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543362;
      v37 = v24;
      v25 = "%{public}@Duplicate characteristic instance IDs";
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  v5 = v2;
  v17 = sub_10007CCE4((uint64_t)v5, v16);
  v6 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v18 = sub_10007CD2C(v5);
    v2 = (HAPService *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138543362;
    v37 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to validate characteristics", buf, 0xCu);
LABEL_21:

  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (BOOL)_updateCharacteristic:(id)a3
{
  if (a3)
    objc_msgSend(a3, "setService:", self);
  return 1;
}

- (BOOL)_validateServiceCharacteristics
{
  void *v3;
  id v4;
  HAPService *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  int v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](self, "characteristics"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HAPService _validateMandatoryCharacteristics](self, "_validateMandatoryCharacteristics");
  }
  else
  {
    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@One or more characteristics are required", (uint8_t *)&v12, 0xCu);

    }
  }
  return v4 != 0;
}

- (BOOL)_validateMandatoryCharacteristics
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
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](self, "characteristics", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "type"));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService type](self, "type"));
  v12 = objc_msgSend(v3, "validateMandatoryCharacteristics:forService:", v4, v11);

  return v12;
}

- (id)characteristicsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](self, "characteristics", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "type"));
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  char v14;
  void *i;
  void *v16;
  void *v17;
  HAPService *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];

  v4 = a3;
  if (-[HAPService isEqual:](self, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](self, "characteristics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

    v26 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristics"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

    v25 = v6;
    v9 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v9, "intersectSet:", v8);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (!v11)
    {
      v14 = 1;
      goto LABEL_18;
    }
    v12 = v11;
    v13 = *(_QWORD *)v28;
    v14 = 1;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "member:", v16));
        if (v17)
        {
          if ((objc_msgSend(v16, "shouldMergeObject:", v17) & 1) != 0)
            goto LABEL_13;
          v18 = self;
          v20 = sub_10007CCE4((uint64_t)v18, v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = sub_10007CD2C(v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            *(_DWORD *)buf = 138543874;
            v32 = v23;
            v33 = 2112;
            v34 = v17;
            v35 = 2112;
            v36 = v10;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge characteristic, %@, with existing characteristic: %@", buf, 0x20u);

          }
        }
        v14 = 0;
LABEL_13:

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (!v12)
      {
LABEL_18:

        v4 = v26;
        goto LABEL_19;
      }
    }
  }
  v14 = 0;
LABEL_19:

  return v14 & 1;
}

- (BOOL)mergeObject:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  HAPService *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  HAPService *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  id v25;
  HAPService *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  HAPService *v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  id v41;
  id v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  void *k;
  void *v47;
  HAPService *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  HAPService *v55;
  uint64_t v56;
  id v57;
  NSObject *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  HAPService *v66;
  BOOL v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  __CFString *v71;
  void *v72;
  void *v74;
  id v75;
  HAPService *v76;
  NSObject *v77;
  BOOL v78;
  id v79;
  id v80;
  id obj;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  id v100;

  v4 = a3;
  v6 = objc_opt_class(HAPService, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    if (-[HAPService shouldMergeObject:](self, "shouldMergeObject:", v8))
    {
      v74 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](self, "characteristics"));
      v10 = (HAPService *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

      v75 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristics"));
      v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

      v76 = v10;
      v13 = -[HAPService mutableCopy](v10, "mutableCopy");
      v77 = v12;
      objc_msgSend(v13, "minusSet:", v12);
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
      v78 = v14 != 0;
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v91;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v91 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
            v19 = self;
            v21 = sub_10007CCE4((uint64_t)v19, v20);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = sub_10007CD2C(v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              *(_DWORD *)buf = 138543618;
              v98 = v24;
              v99 = 2112;
              v100 = v18;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@Removed characteristic: %@", buf, 0x16u);

            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
        }
        while (v15);
      }

      v25 = -[NSObject mutableCopy](v12, "mutableCopy");
      v26 = v76;
      objc_msgSend(v25, "minusSet:", v76);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPService characteristics](self, "characteristics"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
      v29 = objc_msgSend(v28, "shouldValidateValueAfterReading");

      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v80 = v25;
      v30 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(_QWORD *)v87 != v32)
              objc_enumerationMutation(v80);
            v34 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j);
            v35 = self;
            v37 = sub_10007CCE4((uint64_t)v35, v36);
            v38 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = sub_10007CD2C(v35);
              v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
              *(_DWORD *)buf = 138543618;
              v98 = v40;
              v99 = 2112;
              v100 = v34;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%{public}@Added characteristic: %@", buf, 0x16u);

            }
            objc_msgSend(v34, "setService:", v35);
            objc_msgSend(v34, "setShouldValidateValueAfterReading:", v29);
          }
          v31 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
        }
        while (v31);
        v78 = 1;
        v26 = v76;
      }

      v41 = -[HAPService mutableCopy](v26, "mutableCopy");
      objc_msgSend(v41, "minusSet:", obj);
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v79 = v41;
      v42 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      v43 = v77;
      if (v42)
      {
        v44 = v42;
        v45 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v44; k = (char *)k + 1)
          {
            if (*(_QWORD *)v83 != v45)
              objc_enumerationMutation(v79);
            v47 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)k);
            v48 = self;
            v50 = sub_10007CCE4((uint64_t)v48, v49);
            v51 = objc_claimAutoreleasedReturnValue(v50);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              v52 = sub_10007CD2C(v48);
              v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
              *(_DWORD *)buf = 138543618;
              v98 = v53;
              v99 = 2112;
              v100 = v47;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing characteristic: %@", buf, 0x16u);

            }
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject member:](v43, "member:", v47));
            if (v54 && objc_msgSend(v47, "mergeObject:", v54))
            {
              v55 = v48;
              v57 = sub_10007CCE4((uint64_t)v55, v56);
              v58 = objc_claimAutoreleasedReturnValue(v57);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                v59 = sub_10007CD2C(v55);
                v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
                *(_DWORD *)buf = 138543618;
                v98 = v60;
                v99 = 2112;
                v100 = v47;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%{public}@Updated characteristic: %@", buf, 0x16u);

                v43 = v77;
              }

              v78 = 1;
            }

          }
          v44 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
        }
        while (v44);
      }

      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "allObjects"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v61));

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "allObjects"));
      objc_msgSend(v62, "addObjectsFromArray:", v63);

      v64 = objc_msgSend(v62, "copy");
      -[HAPService setCharacteristics:](self, "setCharacteristics:", v64);

      v8 = v74;
      -[HAPService setServiceProperties:](self, "setServiceProperties:", objc_msgSend(v74, "serviceProperties"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "linkedServices"));
      -[HAPService setLinkedServices:](self, "setLinkedServices:", v65);

      v4 = v75;
      v66 = v76;
      v67 = v78;
    }
    else
    {
      v66 = self;
      v69 = sub_10007CCE4((uint64_t)v66, v68);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      v77 = v70;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = sub_10007CD2C(v66);
        v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
        *(_DWORD *)buf = 138543618;
        v98 = v72;
        v99 = 2112;
        v100 = v8;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%{public}@Not merging with service: %@", buf, 0x16u);

      }
      v67 = 0;
    }

  }
  else
  {
    v67 = 0;
  }

  return v67;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HAPAccessory)accessory
{
  return (HAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
