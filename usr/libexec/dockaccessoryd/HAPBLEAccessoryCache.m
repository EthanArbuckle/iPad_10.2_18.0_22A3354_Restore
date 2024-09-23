@implementation HAPBLEAccessoryCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLEAccessoryCache)initWithPairingIdentifier:(id)a3 saveBlock:(id)a4
{
  id v7;
  id v8;
  HAPBLEAccessoryCache *v9;
  _UNKNOWN **v10;
  uint64_t v11;
  NSNumber *metadataVersion;
  uint64_t v13;
  NSMutableArray *cachedServices;
  id v15;
  id saveBlock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HAPBLEAccessoryCache;
  v9 = -[HAPBLEAccessoryCache init](&v18, "init");
  if (v9)
  {
    v10 = sub_1000160AC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    metadataVersion = v9->_metadataVersion;
    v9->_metadataVersion = (NSNumber *)v11;

    objc_storeStrong((id *)&v9->_pairingIdentifier, a3);
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    cachedServices = v9->_cachedServices;
    v9->_cachedServices = (NSMutableArray *)v13;

    v15 = objc_retainBlock(v8);
    saveBlock = v9->_saveBlock;
    v9->_saveBlock = v15;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEAccessoryCache *v4;
  uint64_t v5;
  HAPBLEAccessoryCache *v6;
  uint64_t v7;
  HAPBLEAccessoryCache *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (HAPBLEAccessoryCache *)a3;
  v6 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v7 = objc_opt_class(v4, v5);
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache pairingIdentifier](self, "pairingIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache pairingIdentifier](v8, "pairingIdentifier"));

      v11 = objc_msgSend(v9, "isEqual:", v10);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache pairingIdentifier](self, "pairingIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (void)updateWithPeripheralInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryName"));

  -[HAPBLEAccessoryCache setPeripheralInfo:](self, "setPeripheralInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo"));
  objc_msgSend(v6, "updateAccessoryName:", v7);

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache pairingIdentifier](self, "pairingIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("PI"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo"));
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("PIN"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](self, "cachedServices"));
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("CS"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache metadataVersion](self, "metadataVersion"));
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("MV"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache lastKeyBagIdentityIndexFailingPV](self, "lastKeyBagIdentityIndexFailingPV"));
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("PVX"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[HAPBLEAccessoryCache discoveryVersion](self, "discoveryVersion"), CFSTR("DV"));
}

- (HAPBLEAccessoryCache)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HAPBLEAccessoryCache *v6;
  id v7;
  uint64_t v8;
  NSNumber *metadataVersion;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *pairingIdentifier;
  uint64_t v14;
  id v15;
  uint64_t v16;
  HAPBLEPeripheralInfo *peripheralInfo;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSMutableArray *cachedServices;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSNumber *lastKeyBagIdentityIndexFailingPV;
  objc_super v29;
  _QWORD v30[2];

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HAPBLEAccessoryCache;
  v6 = -[HAPBLEAccessoryCache init](&v29, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("MV"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    metadataVersion = v6->_metadataVersion;
    v6->_metadataVersion = (NSNumber *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("PI"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    pairingIdentifier = v6->_pairingIdentifier;
    v6->_pairingIdentifier = (NSString *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(HAPBLEPeripheralInfo, v14), CFSTR("PIN"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    peripheralInfo = v6->_peripheralInfo;
    v6->_peripheralInfo = (HAPBLEPeripheralInfo *)v16;

    v30[0] = objc_opt_class(NSArray, v18);
    v30[1] = objc_opt_class(HAPBLEServiceCache, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v20));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("CS")));
    cachedServices = v6->_cachedServices;
    v6->_cachedServices = (NSMutableArray *)v22;

    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v24), CFSTR("PVX"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    lastKeyBagIdentityIndexFailingPV = v6->_lastKeyBagIdentityIndexFailingPV;
    v6->_lastKeyBagIdentityIndexFailingPV = (NSNumber *)v26;

    v6->_discoveryVersion = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DV"));
  }

  return v6;
}

- (id)getCachedServiceWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](self, "cachedServices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serviceUUID"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateWithService:(id)a3
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](self, "cachedServices", 0));
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
          objc_msgSend(v10, "updateWithService:", v4);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](self, "cachedServices"));
  objc_msgSend(v5, "addObject:", v4);
LABEL_11:

}

+ (int64_t)currentDiscoveryVersion
{
  return 0;
}

- (void)save
{
  void (**v2)(void);
  void (**v3)(void);

  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache saveBlock](self, "saveBlock"));
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (void)setLastKeyBagIdentityIndexFailingPV:(id)a3
{
  id v5;

  v5 = a3;
  if ((HMFEqualObjects(v5, self->_lastKeyBagIdentityIndexFailingPV) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, a3);
    -[HAPBLEAccessoryCache save](self, "save");
  }

}

- (void)updateCurrentPairingIdentityIndexIfNeededForKeyBag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  HAPBLEAccessoryCache *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache lastKeyBagIdentityIndexFailingPV](self, "lastKeyBagIdentityIndexFailingPV"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache lastKeyBagIdentityIndexFailingPV](self, "lastKeyBagIdentityIndexFailingPV"));
    v7 = (char *)objc_msgSend(v6, "longLongValue") + 1;

    if (objc_msgSend(v4, "isValidIndex:", v7))
    {
      v8 = self;
      v10 = sub_10007CCE4((uint64_t)v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = sub_10007CD2C(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache pairingIdentifier](v8, "pairingIdentifier"));
        v18 = 138543874;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Updating keybag identity index to %@ for %@.", (uint8_t *)&v18, 0x20u);

      }
      v16 = objc_msgSend(v4, "getCurrentIndexInBag");
      objc_msgSend(v4, "setCurrentIndexInBag:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentIdentity"));

      if (!v17)
        objc_msgSend(v4, "setCurrentIndexInBag:", v16);
    }
  }

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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](self, "cachedServices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\nList of Services: %tu\n"), objc_msgSend(v3, "count")));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](self, "cachedServices"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      v10 = v4;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9)));

        v9 = (char *)v9 + 1;
        v10 = v4;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](self, "peripheralInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v11, v4));

  return v12;
}

- (NSNumber)metadataVersion
{
  return self->_metadataVersion;
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (HAPBLEPeripheralInfo)peripheralInfo
{
  return self->_peripheralInfo;
}

- (void)setPeripheralInfo:(id)a3
{
  objc_storeStrong((id *)&self->_peripheralInfo, a3);
}

- (NSMutableArray)cachedServices
{
  return self->_cachedServices;
}

- (NSNumber)lastKeyBagIdentityIndexFailingPV
{
  return self->_lastKeyBagIdentityIndexFailingPV;
}

- (int64_t)discoveryVersion
{
  return self->_discoveryVersion;
}

- (void)setDiscoveryVersion:(int64_t)a3
{
  self->_discoveryVersion = a3;
}

- (id)saveBlock
{
  return self->_saveBlock;
}

- (void)setSaveBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveBlock, 0);
  objc_storeStrong((id *)&self->_lastKeyBagIdentityIndexFailingPV, 0);
  objc_storeStrong((id *)&self->_cachedServices, 0);
  objc_storeStrong((id *)&self->_peripheralInfo, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataVersion, 0);
}

@end
