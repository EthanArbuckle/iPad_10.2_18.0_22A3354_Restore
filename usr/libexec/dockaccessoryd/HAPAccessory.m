@implementation HAPAccessory

+ (id)productDataStringFromData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v5 = objc_opt_class(NSData, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hmf_hexadecimalStringWithOptions:", 2));

  return v8;
}

+ (id)serverIdentifierWithUniqueIdentifier:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+")));
  if (objc_msgSend(v3, "count") == (id)2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  else
    v4 = 0;

  return v4;
}

+ (id)instanceIDForUniqueIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+")));
  if (objc_msgSend(v3, "count") == (id)2)
  {
    v4 = objc_alloc_init((Class)NSNumberFormatter);
    objc_msgSend(v4, "setNumberStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "numberFromString:", v5));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isAccessoryPrimaryWithUniqueIdentifier:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("+")));
  if (objc_msgSend(v3, "count") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HAPAccessory)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  HAPAccessory *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *workQueue;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  const char *v22;
  id v23;
  __CFString *v24;
  HAPAccessory *v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  __CFString *v30;
  id v31;
  __CFString *v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((sub_10007BD14(v9) & 1) != 0)
  {
    v33.receiver = self;
    v33.super_class = (Class)HAPAccessory;
    v12 = -[HAPAccessory init](&v33, "init");
    self = v12;
    if (v12)
    {
      objc_storeWeak((id *)&v12->_server, v8);
      self->_linkType = (int64_t)objc_msgSend(v8, "linkType");
      self->_communicationProtocol = (int64_t)objc_msgSend(v8, "communicationProtocol");
      objc_storeStrong((id *)&self->_instanceID, a4);
      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.HAPAccessory", v14);
      workQueue = self->_workQueue;
      self->_workQueue = v15;

      if (v10)
      {
        if ((unint64_t)objc_msgSend(v10, "count") >= 0x65)
        {
          v18 = sub_10007CCE4(0, v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v20 = sub_10007CD2C(0);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            *(_DWORD *)buf = 138543362;
            v35 = v21;
            v22 = "%{public}@### Accessory exceeds maximum number of allowed services";
LABEL_9:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);

            goto LABEL_10;
          }
          goto LABEL_10;
        }
        objc_storeStrong((id *)&self->_services, a5);
        if (!-[HAPAccessory _validateCharacteristicValues](self, "_validateCharacteristicValues"))
        {
          v29 = sub_10007CCE4(0, v26);
          v19 = objc_claimAutoreleasedReturnValue(v29);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_10;
          v30 = sub_10007CD2C(0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v30);
          *(_DWORD *)buf = 138543362;
          v35 = v21;
          v22 = "%{public}@### Accessory failed validateCharacteristicValues";
          goto LABEL_9;
        }
        if (!-[HAPAccessory _updateAndValidateServices](self, "_updateAndValidateServices"))
        {
          v31 = sub_10007CCE4(0, v27);
          v19 = objc_claimAutoreleasedReturnValue(v31);
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            goto LABEL_10;
          v32 = sub_10007CD2C(0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v32);
          *(_DWORD *)buf = 138543362;
          v35 = v21;
          v22 = "%{public}@### Accessory failed _updateAndValidateServices";
          goto LABEL_9;
        }
      }
      self->_consecutiveFailedPingCount = 0;
      self->_primary = 1;
      self->_reachable = 1;
      self->_shouldDisconnectOnIdle = 0;
    }
    self = self;
    v25 = self;
    goto LABEL_15;
  }
  v23 = sub_10007CCE4(0, v11);
  v19 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v24 = sub_10007CD2C(0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v24);
    *(_DWORD *)buf = 138543362;
    v35 = v21;
    v22 = "%{public}@### Unable to initialize accessory because of invalid arguments";
    goto LABEL_9;
  }
LABEL_10:

  v25 = 0;
LABEL_15:

  return v25;
}

- (HAPAccessory)initWithServer:(id)a3 instanceID:(id)a4
{
  return -[HAPAccessory initWithServer:instanceID:parsedServices:](self, "initWithServer:instanceID:parsedServices:", a3, a4, 0);
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory identifier](self, "identifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory instanceID](self, "instanceID"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPAccessory *v5;
  uint64_t v6;
  HAPAccessory *v7;
  HAPAccessory *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  BOOL v17;

  v5 = (HAPAccessory *)a3;
  if (self == v5)
  {
    v17 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPAccessory, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (!v8)
      goto LABEL_10;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory instanceID](self, "instanceID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory instanceID](v8, "instanceID"));
    v11 = objc_msgSend(v9, "isEqualToNumber:", v10);

    if (!v11)
      goto LABEL_10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory identifier](self, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory identifier](v8, "identifier"));
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14 && (v15 = -[HAPAccessory linkType](self, "linkType"), v15 == (id)-[HAPAccessory linkType](v8, "linkType")))
    {
      v16 = -[HAPAccessory communicationProtocol](self, "communicationProtocol");
      v17 = v16 == (id)-[HAPAccessory communicationProtocol](v8, "communicationProtocol");
    }
    else
    {
LABEL_10:
      v17 = 0;
    }

  }
  return v17;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v20;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory instanceID](self, "instanceID"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Instance ID: %@    "), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v3, "appendFormat:", CFSTR("Server: '%@' (%@)    "), v6, v8);

  if (-[HAPAccessory isPrimary](self, "isPrimary"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory category](self, "category"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Category: %@    "), v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory name](self, "name"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory name](self, "name"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Name: %@    "), v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory model](self, "model"));
  if (v12
    || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory manufacturer](self, "manufacturer"))) != 0)
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory serialNumber](self, "serialNumber"));

    if (!v20)
      return (NSString *)v3;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory model](self, "model"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory model](self, "model"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Model: %@    "), v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory manufacturer](self, "manufacturer"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory manufacturer](self, "manufacturer"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Manufacturer: %@    "), v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory serialNumber](self, "serialNumber"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory serialNumber](self, "serialNumber"));
    objc_msgSend(v3, "appendFormat:", CFSTR("Serial Number: %@    "), v18);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  return (NSString *)v3;
}

- (BOOL)isPaired
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
  v3 = objc_msgSend(v2, "isPaired");

  return v3;
}

- (BOOL)isReachable
{
  HAPAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;
  id v8;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "accessory:didUpdateReachabilityState:");

    if ((v7 & 1) != 0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[HAPAccessory delegate](self, "delegate"));
      objc_msgSend(v8, "accessory:didUpdateReachabilityState:", self, v3);

    }
  }
}

- (int)consecutiveFailedPingCount
{
  HAPAccessory *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LODWORD(v2) = v2->_consecutiveFailedPingCount;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setConsecutiveFailedPingCount:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_consecutiveFailedPingCount = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *uniqueIdentifier;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  NSString *identifier;
  NSString *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  NSString *v21;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (!self->_uniqueIdentifier)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);

    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained((id *)&self->_server);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](self->_instanceID, "stringValue"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v7, CFSTR("+"), v8));
      uniqueIdentifier = self->_uniqueIdentifier;
      self->_uniqueIdentifier = v9;

    }
    else
    {
      v11 = sub_10007CCE4(0, v5);
      v12 = (id)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = sub_10007CD2C(0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        identifier = self->_identifier;
        *(_DWORD *)buf = 138543618;
        v19 = v14;
        v20 = 2112;
        v21 = identifier;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot create globally unique identifier because there is no server for accessory: %@", buf, 0x16u);

      }
    }
  }
  v16 = self->_uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v16;
}

- (NSNumber)category
{
  uint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
  if (v3 && (v4 = (void *)v3, v5 = -[HAPAccessory isPrimary](self, "isPrimary"), v4, v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "category"));

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (sub_1000160B8())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory name](self, "name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory identifier](self, "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory instanceID](self, "instanceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@+%@"), v3, v4, v5));

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory identifier](self, "identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory instanceID](self, "instanceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@+%@"), v3, v4));
  }

  return v6;
}

- (void)readValueForCharacteristic:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  HAPAccessory *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id *v27;
  id *v28;
  HAPAccessory *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
      if (v19)
      {
        v47 = v10;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000762E0;
        v35[3] = &unk_100237D58;
        v27 = &v37;
        v37 = v12;
        v28 = &v36;
        v36 = v10;
        objc_msgSend(v19, "readCharacteristicValues:timeout:completionQueue:completionHandler:", v26, v11, v35, a4);

      }
      else
      {
        v29 = self;
        v31 = sub_10007CCE4((uint64_t)v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = sub_10007CD2C(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          *(_DWORD *)buf = 138543618;
          v49 = v34;
          v50 = 2112;
          v51 = v10;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to read value for characteristic %@ because there is no server.", buf, 0x16u);

        }
        if (!v11 || !v12)
          goto LABEL_21;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100076278;
        v38[3] = &unk_100236E80;
        v27 = &v40;
        v40 = v12;
        v28 = &v39;
        v39 = v10;
        dispatch_async(v11, v38);
      }

LABEL_21:
      goto LABEL_22;
    }
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543362;
      v49 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100076210;
      block[3] = &unk_100236E80;
      v43 = v12;
      v42 = v10;
      dispatch_async(v11, block);

      v19 = v43;
      goto LABEL_21;
    }
  }
  else
  {
    v20 = self;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v49 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic is a requried parameter", buf, 0xCu);

    }
    if (v11 && v12)
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000761A8;
      v44[3] = &unk_100236E80;
      v45 = 0;
      v46 = v12;
      dispatch_async(v11, v44);

      v19 = v46;
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  HAPAccessory *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  HAPAccessory *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    if (a4 >= 0.0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
      v19 = v26;
      if (v26)
      {
        objc_msgSend(v26, "readCharacteristicValues:timeout:completionQueue:completionHandler:", v10, v11, v12, a4);
      }
      else
      {
        v27 = self;
        v29 = sub_10007CCE4((uint64_t)v27, v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = sub_10007CD2C(v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          *(_DWORD *)buf = 138543618;
          v40 = v32;
          v41 = 2112;
          v42 = v10;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to read characteristics %@ because there is no server.", buf, 0x16u);

        }
        if (v11 && v12)
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_10007695C;
          v33[3] = &unk_100236DC0;
          v34 = v12;
          dispatch_async(v11, v33);

        }
      }
      goto LABEL_20;
    }
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100076818;
      block[3] = &unk_100236DC0;
      v36 = v12;
      dispatch_async(v11, block);
      v19 = v36;
LABEL_20:

    }
  }
  else
  {
    v20 = self;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristics are required.", buf, 0xCu);

    }
    if (v11 && v12)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000766D4;
      v37[3] = &unk_100236DC0;
      v38 = v12;
      dispatch_async(v11, v37);
      v19 = v38;
      goto LABEL_20;
    }
  }

}

- (void)writeCharacteristicValue:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  HAPAccessory *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id *v27;
  id *v28;
  HAPAccessory *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD block[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v10)
  {
    if (a4 >= 0.0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
      if (v19)
      {
        v48 = v10;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10007700C;
        v36[3] = &unk_100237D58;
        v27 = &v38;
        v38 = v12;
        v28 = &v37;
        v37 = v10;
        objc_msgSend(v19, "writeCharacteristicValues:timeout:completionQueue:completionHandler:", v26, v11, v36, a4);

      }
      else
      {
        v29 = self;
        v31 = sub_10007CCE4((uint64_t)v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = sub_10007CD2C(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "characteristic"));
          *(_DWORD *)buf = 138543618;
          v50 = v34;
          v51 = 2112;
          v52 = v35;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to write value for characteristic %@ because there is no server.", buf, 0x16u);

        }
        if (!v11 || !v12)
          goto LABEL_21;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100076F8C;
        v39[3] = &unk_100236E80;
        v27 = &v41;
        v41 = v12;
        v28 = &v40;
        v40 = v10;
        dispatch_async(v11, v39);
      }

LABEL_21:
      goto LABEL_22;
    }
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543362;
      v50 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100076F0C;
      block[3] = &unk_100236E80;
      v44 = v12;
      v43 = v10;
      dispatch_async(v11, block);

      v19 = v44;
      goto LABEL_21;
    }
  }
  else
  {
    v20 = self;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v50 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@The target characteristic write request is a requried parameter", buf, 0xCu);

    }
    if (v11 && v12)
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100076E8C;
      v45[3] = &unk_100236E80;
      v46 = 0;
      v47 = v12;
      dispatch_async(v11, v45);

      v19 = v47;
      goto LABEL_21;
    }
  }
LABEL_22:

}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  HAPAccessory *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  HAPAccessory *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  HAPAccessory *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[4];
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "count"))
  {
    if (a4 >= 0.0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory server](self, "server"));
      v19 = v26;
      if (v26)
      {
        objc_msgSend(v26, "writeCharacteristicValues:timeout:completionQueue:completionHandler:", v10, v11, v12, a4);
      }
      else
      {
        v27 = self;
        v29 = sub_10007CCE4((uint64_t)v27, v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = sub_10007CD2C(v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          *(_DWORD *)buf = 138543618;
          v40 = v32;
          v41 = 2112;
          v42 = v10;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to write characteristics %@ because there is no server.", buf, 0x16u);

        }
        if (v11 && v12)
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1000776C4;
          v33[3] = &unk_100236DC0;
          v34 = v12;
          dispatch_async(v11, v33);

        }
      }
      goto LABEL_20;
    }
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138543362;
      v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@The timeout must not be negative.", buf, 0xCu);

    }
    if (v11 && v12)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100077580;
      block[3] = &unk_100236DC0;
      v36 = v12;
      dispatch_async(v11, block);
      v19 = v36;
LABEL_20:

    }
  }
  else
  {
    v20 = self;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@One or more target characteristic writes are required.", buf, 0xCu);

    }
    if (v11 && v12)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10007743C;
      v37[3] = &unk_100236DC0;
      v38 = v12;
      dispatch_async(v11, v37);
      v19 = v38;
      goto LABEL_20;
    }
  }

}

- (BOOL)_updateAndValidateServices
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v34;
  __CFString *v35;
  id v36;
  __CFString *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  __CFString *v42;
  uint64_t v43;
  id v44;
  HAPAccessory *v45;
  NSObject *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  NSObject *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v4 = objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services"));
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v52;
    v45 = self;
    v46 = v4;
    v43 = *(_QWORD *)v52;
    while (2)
    {
      v8 = 0;
      v44 = v6;
      do
      {
        if (*(_QWORD *)v52 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID", v43));
        v11 = objc_msgSend(v3, "containsObject:", v10);

        if (v11)
        {
          v36 = sub_10007CCE4(0, v12);
          v14 = objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          v37 = sub_10007CD2C(0);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringValue"));
          *(_DWORD *)buf = 138543618;
          v57 = v38;
          v58 = 2112;
          v59 = v40;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has service with duplicate instance ID '%@'", buf, 0x16u);

LABEL_32:
          goto LABEL_23;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID"));
        objc_msgSend(v3, "addObject:", v13);

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristics"));
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v48;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v48 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "instanceID"));
              v21 = objc_msgSend(v3, "containsObject:", v20);

              if (v21)
              {
                v27 = sub_10007CCE4(0, v22);
                v28 = objc_claimAutoreleasedReturnValue(v27);
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  v29 = sub_10007CD2C(0);
                  v30 = objc_claimAutoreleasedReturnValue(v29);
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "instanceID"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringValue"));
                  *(_DWORD *)buf = 138543618;
                  v57 = v30;
                  v58 = 2112;
                  v59 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has characteristic with duplicate instance ID '%@'", buf, 0x16u);

                }
                v4 = v46;
                goto LABEL_23;
              }
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "instanceID"));
              objc_msgSend(v3, "addObject:", v23);

            }
            v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v16)
              continue;
            break;
          }
        }

        self = v45;
        if (!-[HAPAccessory _updateService:](v45, "_updateService:", v9))
        {
          v41 = sub_10007CCE4(0, v24);
          v14 = objc_claimAutoreleasedReturnValue(v41);
          v4 = v46;
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          v42 = sub_10007CD2C(0);
          v38 = objc_claimAutoreleasedReturnValue(v42);
          *(_DWORD *)buf = 138543362;
          v57 = v38;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateService", buf, 0xCu);
          goto LABEL_32;
        }
        v8 = (char *)v8 + 1;
        v7 = v43;
        v4 = v46;
      }
      while (v8 != v44);
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (-[HAPAccessory updateForAccessoryInformationService](self, "updateForAccessoryInformationService"))
  {
    v26 = 1;
  }
  else
  {
    v34 = sub_10007CCE4(0, v25);
    v4 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v35 = sub_10007CD2C(0);
      v14 = objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 138543362;
      v57 = v14;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@### Accessory failed _updateForAccessoryInformationService", buf, 0xCu);
LABEL_23:

    }
    v26 = 0;
  }

  return v26;
}

- (BOOL)_updateService:(id)a3
{
  if (a3)
    objc_msgSend(a3, "setAccessory:", self);
  return 1;
}

- (BOOL)updateForAccessoryInformationService
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  unsigned int v33;
  void *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  id v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  id v47;
  __CFString *v48;
  void *v49;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];

  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "type"));
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-4D69736D6574"));

        if (v10)
        {
          if (v5)
          {
            v43 = sub_10007CCE4(0, v11);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = sub_10007CD2C(0);
              v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
              *(_DWORD *)buf = 138543362;
              v62 = v46;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@### Accessory has more than one Accessory Information Service", buf, 0xCu);

            }
            goto LABEL_43;
          }
          v5 = v8;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v4)
        continue;
      break;
    }

    if (v5)
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject characteristics](v5, "characteristics"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(_QWORD *)v53 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));

            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
              v22 = objc_opt_class(NSString, v21);
              if ((objc_opt_isKindOfClass(v20, v22) & 1) != 0)
                v23 = v20;
              else
                v23 = 0;
              v24 = v23;

              v25 = (void *)objc_claimAutoreleasedReturnValue(+[HMFObjectCacheNSString hmf_cachedInstanceForString:](HMFObjectCacheNSString, "hmf_cachedInstanceForString:", v24));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
              v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("00000023-0000-1000-8000-4D69736D6574"));

              if (v27)
              {
                -[HAPAccessory setName:](self, "setName:", v25);
              }
              else
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
                v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("00000020-0000-1000-8000-4D69736D6574"));

                if (v29)
                {
                  -[HAPAccessory setManufacturer:](self, "setManufacturer:", v25);
                }
                else
                {
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
                  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("00000021-0000-1000-8000-4D69736D6574"));

                  if (v31)
                  {
                    -[HAPAccessory setModel:](self, "setModel:", v25);
                  }
                  else
                  {
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
                    v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("00000030-0000-1000-8000-4D69736D6574"));

                    if (v33)
                    {
                      -[HAPAccessory setSerialNumber:](self, "setSerialNumber:", v25);
                    }
                    else
                    {
                      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
                      v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("00000052-0000-1000-8000-4D69736D6574"));

                      if (v35)
                      {
                        -[HAPAccessory setFirmwareVersion:](self, "setFirmwareVersion:", v25);
                      }
                      else
                      {
                        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
                        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("00000220-0000-1000-8000-4D69736D6574"));

                        if (v37)
                        {
                          v39 = (void *)objc_opt_class(self, v38);
                          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
                          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "productDataStringFromData:", v40));
                          -[HAPAccessory setProductData:](self, "setProductData:", v41);

                        }
                      }
                    }
                  }
                }
              }

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v15);
      }

      v42 = 1;
      goto LABEL_44;
    }
  }
  else
  {

  }
  v47 = sub_10007CCE4(0, v12);
  v5 = objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v48 = sub_10007CD2C(0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    *(_DWORD *)buf = 138543362;
    v62 = v49;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@### Accessory is missing an Accessory Information Service", buf, 0xCu);

  }
LABEL_43:
  v42 = 0;
LABEL_44:

  return v42;
}

- (void)invalidate
{
  HAPAccessory *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  HAPAccessory *v14;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Invalidating and updating connection state for HAP Accessory: %@", (uint8_t *)&v11, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory delegate](v2, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "accessory:didUpdateConnectionState:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory delegate](v2, "delegate"));
    objc_msgSend(v10, "accessory:didUpdateConnectionState:", v2, 0);

  }
}

- (BOOL)_validateCharacteristicValues
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v33;
    v27 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristics"));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v29;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
              if (objc_msgSend(v13, "shouldValidateValueAfterReading"))
              {
                v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                if (v14)
                {
                  v15 = (void *)v14;
                  v16 = objc_msgSend(v13, "properties");

                  if ((v16 & 2) != 0)
                  {
                    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
                    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "validateValue:outValue:", v17, 0));

                    if (v18)
                    {
                      v21 = sub_10007CCE4(0, v19);
                      v22 = objc_claimAutoreleasedReturnValue(v21);
                      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                      {
                        v23 = sub_10007CD2C(0);
                        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "type"));
                        *(_DWORD *)buf = 138543874;
                        v37 = v24;
                        v38 = 2112;
                        v39 = v25;
                        v40 = 2112;
                        v41 = v18;
                        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@[HAP Accessory] ### Failed to validate value with type %@ with error %@", buf, 0x20u);

                      }
                      v20 = 0;
                      goto LABEL_24;
                    }
                  }
                }
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
            if (v10)
              continue;
            break;
          }
        }

        v5 = v27;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      v20 = 1;
    }
    while (v4);
  }
  else
  {
    v20 = 1;
  }
LABEL_24:

  return v20;
}

- (id)servicesOfType:(id)a3
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services", 0));
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

- (id)characteristicsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "characteristicsOfType:", v4));
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)characteristicOfType:(id)a3 serviceType:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v9 = v7;
  v10 = 0;
  if (!v6 || !v7)
    goto LABEL_9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory servicesOfType:](self, "servicesOfType:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v14 = objc_opt_class(HAPService, v13);
  if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
  {
    v10 = 0;
    goto LABEL_7;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory servicesOfType:](self, "servicesOfType:", v9));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

  if (v16)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "characteristicsOfType:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v11 = v16;
LABEL_7:

    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  v17 = objc_opt_class(HAPCharacteristic, v8);
  if ((objc_opt_isKindOfClass(v10, v17) & 1) != 0)
    v18 = v10;
  else
    v18 = 0;
  v19 = v18;

  return v19;
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
  HAPAccessory *v18;
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
  if (-[HAPAccessory isEqual:](self, "isEqual:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

    v26 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "services"));
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
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to merge service, %@, with existing service: %@", buf, 0x20u);

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
  HAPAccessory *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  HAPAccessory *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  id v25;
  HAPAccessory *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  HAPAccessory *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  void *v43;
  HAPAccessory *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  HAPAccessory *v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  unsigned __int8 v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned __int8 v72;
  void *v73;
  void *v74;
  void *v75;
  unsigned __int8 v76;
  void *v77;
  void *v78;
  void *v79;
  unsigned __int8 v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned __int8 v84;
  void *v85;
  HAPAccessory *v86;
  uint64_t v87;
  id v88;
  __CFString *v89;
  void *v90;
  void *v92;
  id v93;
  HAPAccessory *v94;
  BOOL v95;
  id v96;
  id v97;
  id obj;
  NSObject *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;

  v4 = a3;
  v6 = objc_opt_class(HAPAccessory, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
  {
    if (-[HAPAccessory shouldMergeObject:](self, "shouldMergeObject:", v8))
    {
      v92 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory services](self, "services"));
      v10 = (HAPAccessory *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));

      v93 = v4;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "services"));
      v12 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

      v94 = v10;
      v13 = -[HAPAccessory mutableCopy](v10, "mutableCopy");
      objc_msgSend(v13, "minusSet:", v12);
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
      v95 = v14 != 0;
      v99 = v12;
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v109 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
            v19 = self;
            v21 = sub_10007CCE4((uint64_t)v19, v20);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = sub_10007CD2C(v19);
              v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
              *(_DWORD *)buf = 138543618;
              v116 = v24;
              v117 = 2112;
              v118 = v18;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@Removed service: %@", buf, 0x16u);

              v12 = v99;
            }

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v114, 16);
        }
        while (v15);
      }

      v25 = -[NSObject mutableCopy](v12, "mutableCopy");
      v26 = v94;
      objc_msgSend(v25, "minusSet:", v94);
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v97 = v25;
      v27 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v105;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(_QWORD *)v105 != v29)
              objc_enumerationMutation(v97);
            v31 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)j);
            v32 = self;
            v34 = sub_10007CCE4((uint64_t)v32, v33);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = sub_10007CD2C(v32);
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              *(_DWORD *)buf = 138543618;
              v116 = v37;
              v117 = 2112;
              v118 = v31;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%{public}@Added service: %@", buf, 0x16u);

            }
            objc_msgSend(v31, "setAccessory:", v32);
          }
          v28 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v104, v113, 16);
        }
        while (v28);
        v95 = 1;
        v26 = v94;
        v12 = v99;
      }

      v38 = -[HAPAccessory mutableCopy](v26, "mutableCopy");
      objc_msgSend(v38, "minusSet:", obj);
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v96 = v38;
      v39 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v101;
        do
        {
          for (k = 0; k != v40; k = (char *)k + 1)
          {
            if (*(_QWORD *)v101 != v41)
              objc_enumerationMutation(v96);
            v43 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)k);
            v44 = self;
            v46 = sub_10007CCE4((uint64_t)v44, v45);
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              v48 = sub_10007CD2C(v44);
              v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
              *(_DWORD *)buf = 138543618;
              v116 = v49;
              v117 = 2112;
              v118 = v43;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing service: %@", buf, 0x16u);

            }
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject member:](v12, "member:", v43));
            if (v50 && objc_msgSend(v43, "mergeObject:", v50))
            {
              v51 = v44;
              v53 = sub_10007CCE4((uint64_t)v51, v52);
              v54 = objc_claimAutoreleasedReturnValue(v53);
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                v55 = sub_10007CD2C(v51);
                v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
                *(_DWORD *)buf = 138543618;
                v116 = v56;
                v117 = 2112;
                v118 = v43;
                _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "%{public}@Updated service: %@", buf, 0x16u);

                v12 = v99;
              }

              v95 = 1;
            }

          }
          v40 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
        }
        while (v40);
      }

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "allObjects"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v57));

      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "allObjects"));
      objc_msgSend(v58, "addObjectsFromArray:", v59);

      v60 = objc_msgSend(v58, "copy");
      -[HAPAccessory setServices:](self, "setServices:", v60);

      v61 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory name](self, "name"));
      v8 = v92;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "name"));
      v63 = objc_msgSend(v61, "isEqualToString:", v62);

      v64 = v95;
      if ((v63 & 1) == 0)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "name"));
        -[HAPAccessory setName:](self, "setName:", v65);

        v64 = 1;
      }
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory manufacturer](self, "manufacturer"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "manufacturer"));
      v68 = objc_msgSend(v66, "isEqualToString:", v67);

      v4 = v93;
      if ((v68 & 1) == 0)
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "manufacturer"));
        -[HAPAccessory setManufacturer:](self, "setManufacturer:", v69);

        v64 = 1;
      }
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory model](self, "model"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "model"));
      v72 = objc_msgSend(v70, "isEqualToString:", v71);

      if ((v72 & 1) == 0)
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "model"));
        -[HAPAccessory setModel:](self, "setModel:", v73);

        v64 = 1;
      }
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory serialNumber](self, "serialNumber"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "serialNumber"));
      v76 = objc_msgSend(v74, "isEqualToString:", v75);

      if ((v76 & 1) == 0)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "serialNumber"));
        -[HAPAccessory setSerialNumber:](self, "setSerialNumber:", v77);

        v64 = 1;
      }
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory firmwareVersion](self, "firmwareVersion"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firmwareVersion"));
      v80 = objc_msgSend(v78, "isEqualToString:", v79);

      if ((v80 & 1) == 0)
      {
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "firmwareVersion"));
        -[HAPAccessory setFirmwareVersion:](self, "setFirmwareVersion:", v81);

        v64 = 1;
      }
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessory productData](self, "productData"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "productData"));
      v84 = objc_msgSend(v82, "isEqualToString:", v83);

      if ((v84 & 1) == 0)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "productData"));
        -[HAPAccessory setProductData:](self, "setProductData:", v85);

        v64 = 1;
      }

      v86 = v94;
    }
    else
    {
      v86 = self;
      v88 = sub_10007CCE4((uint64_t)v86, v87);
      v12 = objc_claimAutoreleasedReturnValue(v88);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v89 = sub_10007CD2C(v86);
        v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
        *(_DWORD *)buf = 138543618;
        v116 = v90;
        v117 = 2112;
        v118 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Not merging with accessory: %@", buf, 0x16u);

      }
      v64 = 0;
    }

  }
  else
  {
    v64 = 0;
  }

  return v64 & 1;
}

+ (id)logCategory
{
  if (qword_1002716D0 != -1)
    dispatch_once(&qword_1002716D0, &stru_100237D78);
  return (id)qword_1002716D8;
}

- (BOOL)shouldDisconnectOnIdle
{
  return self->_shouldDisconnectOnIdle;
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  self->_shouldDisconnectOnIdle = a3;
}

- (HAPAccessoryDelegate)delegate
{
  return (HAPAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HAPAccessoryServer)server
{
  return (HAPAccessoryServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (void)setServerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (HMFMACAddress)bluetoothClassicMacAddress
{
  return (HMFMACAddress *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBluetoothClassicMacAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSDate)timeBecameReachable
{
  return self->_timeBecameReachable;
}

- (void)setTimeBecameReachable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)productData
{
  return self->_productData;
}

- (void)setProductData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)sleepInterval
{
  return self->_sleepInterval;
}

- (void)setSleepInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepInterval, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeBecameReachable, 0);
  objc_storeStrong((id *)&self->_bluetoothClassicMacAddress, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
