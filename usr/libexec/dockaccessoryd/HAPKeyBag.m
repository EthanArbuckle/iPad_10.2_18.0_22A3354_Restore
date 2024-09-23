@implementation HAPKeyBag

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HAPKeyBag *v10;
  HAPKeyBag *v12;
  SEL v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag _populateBagWithPairingIdentitiesForAccessory:fromStore:](self, "_populateBagWithPairingIdentitiesForAccessory:fromStore:", v6, v7));
    v10 = -[HAPKeyBag initWithAccessoryIdentifier:keyStore:controllerKeyList:](self, "initWithAccessoryIdentifier:keyStore:controllerKeyList:", v6, v8, v9);

    return v10;
  }
  else
  {
    v12 = (HAPKeyBag *)_HMFPreconditionFailure(CFSTR("accessoryIdentifier"));
    return -[HAPKeyBag initWithAccessoryIdentifier:keyStore:controllerKeyList:](v12, v13, v14, v15, v16);
  }
}

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4 controllerKeyList:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HAPKeyBag *v13;
  HAPKeyBag *v14;
  NSArray *v15;
  NSArray *availableKeysToTry;
  HAPKeyBag *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  NSString *accessoryIdentifier;
  void *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
    _HMFPreconditionFailure(CFSTR("accessoryIdentifier"));
  v12 = v11;
  v27.receiver = self;
  v27.super_class = (Class)HAPKeyBag;
  v13 = -[HAPKeyBag init](&v27, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
    objc_storeWeak((id *)&v14->_keyStore, v10);
    v14->_currentIndexInBag = -1;
    v15 = (NSArray *)objc_msgSend(v12, "copy");
    availableKeysToTry = v14->_availableKeysToTry;
    v14->_availableKeysToTry = v15;

    v17 = v14;
    v19 = sub_10007CCE4((uint64_t)v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = sub_10007CD2C(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      accessoryIdentifier = v14->_accessoryIdentifier;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v14->_availableKeysToTry, "count")));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v14->_availableKeysToTry, "firstObject"));
      *(_DWORD *)buf = 138544130;
      v29 = v22;
      v30 = 2112;
      v31 = accessoryIdentifier;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Initialized key bag for accessory [%@] with %@ keys and primary identity: [%@]", buf, 0x2Au);

    }
  }

  return v14;
}

- (void)refreshKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *availableKeysToTry;
  HAPKeyBag *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag accessoryIdentifier](self, "accessoryIdentifier"));

  if (!v3)
  {
    _HMFPreconditionFailure(CFSTR("self.accessoryIdentifier"));
LABEL_10:
    _HMFPreconditionFailure(CFSTR("self.keyStore"));
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag keyStore](self, "keyStore"));

  if (!v4)
    goto LABEL_10;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag accessoryIdentifier](self, "accessoryIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag keyStore](self, "keyStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag _populateBagWithPairingIdentitiesForAccessory:fromStore:](self, "_populateBagWithPairingIdentitiesForAccessory:fromStore:", v5, v6));

  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if ((HMFEqualObjects(v7, self->_availableKeysToTry) & 1) != 0)
  {
    self->_currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    availableKeysToTry = self->_availableKeysToTry;
    self->_availableKeysToTry = v8;

    self->_currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
    v10 = self;
    v12 = sub_10007CCE4((uint64_t)v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = sub_10007CD2C(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag accessoryIdentifier](v10, "accessoryIdentifier"));
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@Refreshed key bag for accessory [%@] with identities: [%@]", (uint8_t *)&v17, 0x20u);

    }
  }

}

- (id)_populateBagWithPairingIdentitiesForAccessory:(id)a3 fromStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HAPKeyBag *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  id v20;
  int v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allAccessoryPairingKeys"));
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &__NSArray0__struct;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getAssociatedControllerKeyForAccessory:", v6));
  if (v13
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "readControllerPairingKeyForAccessory:error:", v6, 0))) != 0)
  {
    objc_msgSend(v12, "removeObject:", v13);
    objc_msgSend(v12, "insertObject:atIndex:", v13, 0);

  }
  if (objc_msgSend(v12, "hmf_isEmpty"))
  {
    v14 = self;
    v16 = sub_10007CCE4((uint64_t)v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = sub_10007CD2C(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v22 = 138543362;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@This is strange. We do not have any controller keys in the key chain.", (uint8_t *)&v22, 0xCu);

    }
  }
  v20 = objc_msgSend(v12, "copy");

  objc_autoreleasePoolPop(v8);
  return v20;
}

- (int64_t)getCurrentIndexInBag
{
  os_unfair_lock_s *p_lock;
  int64_t currentIndexInBag;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  currentIndexInBag = self->_currentIndexInBag;
  os_unfair_lock_unlock(p_lock);
  return currentIndexInBag;
}

- (void)setCurrentIndexInBag:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_currentIndexInBag = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isValidIndex:(int64_t)a3
{
  void *v4;
  BOOL v5;

  if (a3 < 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag availableKeysToTry](self, "availableKeysToTry"));
  v5 = (unint64_t)objc_msgSend(v4, "count") > a3;

  return v5;
}

- (id)nextIdentity
{
  void *v4;
  HAPKeyBag *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  if (-[HAPKeyBag isEmpty](self, "isEmpty"))
    return 0;
  -[HAPKeyBag setCurrentIndexInBag:](self, "setCurrentIndexInBag:", (char *)-[HAPKeyBag currentIndexInBag](self, "currentIndexInBag") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag currentIdentity](self, "currentIdentity"));
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[HAPKeyBag currentIndexInBag](v5, "currentIndexInBag")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag availableKeysToTry](v5, "availableKeysToTry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count")));
    v14 = 138544130;
    v15 = v10;
    v16 = 2112;
    v17 = v4;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Fetching Identity [%@] at index : %@, total keys: [%@]", (uint8_t *)&v14, 0x2Au);

  }
  return v4;
}

- (id)currentIdentity
{
  void *v3;
  void *v4;
  HAPKeyBag *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  if (-[HAPKeyBag currentIndexInBag](self, "currentIndexInBag") == -1)
    -[HAPKeyBag setCurrentIndexInBag:](self, "setCurrentIndexInBag:", (char *)-[HAPKeyBag currentIndexInBag](self, "currentIndexInBag") + 1);
  if (-[HAPKeyBag isValidIndex:](self, "isValidIndex:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag availableKeysToTry](self, "availableKeysToTry"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag")));

    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Current Identity [%@]", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isEmpty
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag availableKeysToTry](self, "availableKeysToTry"));
  v3 = objc_msgSend(v2, "hmf_isEmpty");

  return v3;
}

- (unint64_t)totalIdentities
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag availableKeysToTry](self, "availableKeysToTry"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)logIdentifier
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPKeyBag accessoryIdentifier](self, "accessoryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[HAPKeyBag getCurrentIndexInBag](self, "getCurrentIndexInBag")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[HAPKeyBag totalIdentities](self, "totalIdentities")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ (%@/%@)"), v3, v4, v5, v6));

  return v7;
}

+ (id)logCategory
{
  if (qword_100271710 != -1)
    dispatch_once(&qword_100271710, &stru_1002381F8);
  return (id)qword_100271718;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)availableKeysToTry
{
  return self->_availableKeysToTry;
}

- (void)setAvailableKeysToTry:(id)a3
{
  objc_storeStrong((id *)&self->_availableKeysToTry, a3);
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_loadWeakRetained((id *)&self->_keyStore);
}

- (int64_t)currentIndexInBag
{
  return self->_currentIndexInBag;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_availableKeysToTry, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
