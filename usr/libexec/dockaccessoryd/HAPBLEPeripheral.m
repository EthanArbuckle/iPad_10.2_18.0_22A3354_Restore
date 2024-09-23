@implementation HAPBLEPeripheral

- (HAPBLEPeripheral)initWithName:(id)a3 peripheralUUID:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HAPBLEPeripheral *v12;
  HAPBLEPeripheral *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *cbPeripheralUUIDs;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSUUID *uniqueBTIdentifier;
  objc_super v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HAPBLEPeripheral;
  v12 = -[HAPBLEPeripheral init](&v22, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_identifier, a5);
    v23 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v15 = (NSMutableArray *)objc_msgSend(v14, "mutableCopy");
    cbPeripheralUUIDs = v13->_cbPeripheralUUIDs;
    v13->_cbPeripheralUUIDs = v15;

    v18 = objc_msgSend((id)objc_opt_class(v13, v17), "uuidForBTLEPeripheral:", v13);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    uniqueBTIdentifier = v13->_uniqueBTIdentifier;
    v13->_uniqueBTIdentifier = (NSUUID *)v19;

    v13->_lastSeen = CFAbsoluteTimeGetCurrent();
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  HAPBLEPeripheral *v5;
  uint64_t v6;
  HAPBLEPeripheral *v7;
  HAPBLEPeripheral *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v5 = (HAPBLEPeripheral *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    v6 = objc_opt_class(HAPBLEPeripheral, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;
    if (v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](self, "identifier")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](v8, "identifier")),
          v11 = HMFEqualObjects(v9, v10),
          v10,
          v9,
          v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral uniqueBTIdentifier](self, "uniqueBTIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral uniqueBTIdentifier](v8, "uniqueBTIdentifier"));
      v14 = HMFEqualObjects(v12, v13);

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)shortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral name](self, "name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](self, "identifier"));
  v4 = HMFBooleanToString(-[HAPBLEPeripheral isCached](self, "isCached"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "state")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@ (%@) periph[%@] -> %@ (%p: %@)"), v14, v3, v5, v6, v8, v9, v11));

  return v12;
}

- (NSArray)peripheralUUIDs
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = -[NSMutableArray copy](self->_cbPeripheralUUIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)mergeWithPeripheral:(id)a3
{
  HAPBLEPeripheral *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HAPBLEPeripheral *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  HAPBLEPeripheral *v38;
  HAPBLEPeripheral *v39;
  void *v40;
  NSMutableArray *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *i;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSMutableArray *cbPeripheralUUIDs;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;

  v4 = (HAPBLEPeripheral *)a3;
  if (self == v4)
    goto LABEL_38;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](v4, "identifier"));
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_38;
  -[HAPBLEPeripheral lastSeen](v4, "lastSeen");
  v9 = v8;
  -[HAPBLEPeripheral lastSeen](self, "lastSeen");
  v11 = v9 - v10;
  if (v11 > 0.0)
  {
    -[HAPBLEPeripheral lastSeen](v4, "lastSeen");
    -[HAPBLEPeripheral setLastSeen:](self, "setLastSeen:");
    -[HAPBLEPeripheral setIsCached:](self, "setIsCached:", -[HAPBLEPeripheral isCached](v4, "isCached"));
    v12 = objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](v4, "cbPeripheral"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));

      if (!v14)
      {
        v15 = self;
        v17 = sub_10007CCE4((uint64_t)v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = sub_10007CD2C(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral shortDescription](v15, "shortDescription"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](v4, "cbPeripheral"));
          *(_DWORD *)buf = 138543874;
          v62 = v20;
          v63 = 2112;
          v64 = v21;
          v65 = 2112;
          v66 = v22;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Updating the BLE peripheral: %@ with CBPeripheral: %@", buf, 0x20u);

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](v4, "cbPeripheral"));
        -[HAPBLEPeripheral setCbPeripheral:](v15, "setCbPeripheral:", v23);

      }
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](v4, "identifier"));
  v25 = v24;
  if (v11 <= 0.0 && v24 != 0)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](self, "identifier"));

    if (v55)
      goto LABEL_16;
    goto LABEL_15;
  }

  if (v25)
  {
LABEL_15:
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral identifier](v4, "identifier"));
    -[HAPBLEPeripheral setIdentifier:](self, "setIdentifier:", v27);

  }
LABEL_16:
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral name](self, "name"));
  v29 = objc_msgSend(v28, "length");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral name](v4, "name"));
  v31 = objc_msgSend(v30, "length");

  if (v29 < v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral name](v4, "name"));
    -[HAPBLEPeripheral setName:](self, "setName:", v32);

  }
  v33 = objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral peripheralUUIDs](v4, "peripheralUUIDs"));
  if (v33)
  {
    v34 = (void *)v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral peripheralUUIDs](self, "peripheralUUIDs"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral peripheralUUIDs](v4, "peripheralUUIDs"));
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) == 0)
    {
      if (v11 <= 0.0)
        v38 = v4;
      else
        v38 = self;
      if (v11 <= 0.0)
        v39 = self;
      else
        v39 = v4;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral peripheralUUIDs](v38, "peripheralUUIDs"));
      v41 = (NSMutableArray *)objc_msgSend(v40, "mutableCopy");

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral peripheralUUIDs](v39, "peripheralUUIDs", 0));
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v44; i = (char *)i + 1)
          {
            if (*(_QWORD *)v57 != v45)
              objc_enumerationMutation(v42);
            v47 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
            -[NSMutableArray removeObject:](v41, "removeObject:", v47);
            -[NSMutableArray addObject:](v41, "addObject:", v47);
          }
          v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v44);
      }

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
      v49 = objc_msgSend(v48, "state");

      if (v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
        -[NSMutableArray removeObject:](v41, "removeObject:", v51);

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifier"));
        -[NSMutableArray addObject:](v41, "addObject:", v53);

      }
      if ((unint64_t)-[NSMutableArray count](v41, "count") >= 6)
        -[NSMutableArray removeObjectsInRange:](v41, "removeObjectsInRange:", 0, (char *)-[NSMutableArray count](v41, "count") - 5);
      os_unfair_lock_lock_with_options(&self->_lock, 0);
      cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
      self->_cbPeripheralUUIDs = v41;

      os_unfair_lock_unlock(&self->_lock);
    }
  }
LABEL_38:

}

- (void)connectedToCBPeripheral:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *cbPeripheralUUIDs;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = v14;
  if (v6)
  {
    os_unfair_lock_lock_with_options(&self->_lock, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));

    if (v8)
    {
      cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheral cbPeripheral](self, "cbPeripheral"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      -[NSMutableArray removeObject:](cbPeripheralUUIDs, "removeObject:", v11);

    }
    if (v14)
    {
      v12 = self->_cbPeripheralUUIDs;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      -[NSMutableArray removeObject:](v12, "removeObject:", v13);

    }
    os_unfair_lock_unlock(&self->_lock);
    v7 = 0;
  }
  -[HAPBLEPeripheral setCbPeripheral:](self, "setCbPeripheral:", v7);

}

- (void)disconnectedFromCBPeripheral:(id)a3 shouldRemove:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *cbPeripheralUUIDs;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[HAPBLEPeripheral setCbPeripheral:](self, "setCbPeripheral:", 0);
  if (v9 && v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options(&self->_lock, 0);
    cbPeripheralUUIDs = self->_cbPeripheralUUIDs;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    -[NSMutableArray removeObject:](cbPeripheralUUIDs, "removeObject:", v8);

    os_unfair_lock_unlock(p_lock);
  }

}

+ (id)uuidForBTLEPeripheral:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueBTIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueBTIdentifier"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peripheralUUIDs"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    v3 = v6;
  }

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSUUID)uniqueBTIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (CBPeripheral)cbPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCbPeripheral:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)cbPeripheralUUIDs
{
  return self->_cbPeripheralUUIDs;
}

- (void)setCbPeripheralUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cbPeripheralUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbPeripheralUUIDs, 0);
  objc_storeStrong((id *)&self->_cbPeripheral, 0);
  objc_storeStrong((id *)&self->_uniqueBTIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
