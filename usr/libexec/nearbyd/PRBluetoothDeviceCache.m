@implementation PRBluetoothDeviceCache

- (PRBluetoothDeviceCache)init
{
  PRBluetoothDeviceCache *v2;
  PRBluetoothDeviceCache *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *u64IdentifierToBluetoothDeviceMap;
  NSMutableDictionary *v6;
  NSMutableDictionary *tokenDataToBluetoothDeviceMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *idsIdentifierToBluetoothDeviceMap;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PRBluetoothDeviceCache;
  v2 = -[PRBluetoothDeviceCache init](&v11, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new(NSMutableDictionary);
    u64IdentifierToBluetoothDeviceMap = v3->_u64IdentifierToBluetoothDeviceMap;
    v3->_u64IdentifierToBluetoothDeviceMap = v4;

    v6 = objc_opt_new(NSMutableDictionary);
    tokenDataToBluetoothDeviceMap = v3->_tokenDataToBluetoothDeviceMap;
    v3->_tokenDataToBluetoothDeviceMap = v6;

    v8 = objc_opt_new(NSMutableDictionary);
    idsIdentifierToBluetoothDeviceMap = v3->_idsIdentifierToBluetoothDeviceMap;
    v3->_idsIdentifierToBluetoothDeviceMap = v8;

  }
  return v3;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeAllObjects](self->_u64IdentifierToBluetoothDeviceMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_tokenDataToBluetoothDeviceMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_idsIdentifierToBluetoothDeviceMap, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)cacheDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *u64IdentifierToBluetoothDeviceMap;
  void *v10;
  NSMutableDictionary *tokenDataToBluetoothDeviceMap;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *idsIdentifierToBluetoothDeviceMap;
  void *v15;
  int v16;
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "u64Identifier");
    v7 = qword_10085F520;
    if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Caching device with address: 0x%llx", (uint8_t *)&v16, 0xCu);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:](u64IdentifierToBluetoothDeviceMap, "setObject:forKeyedSubscript:", v5, v10);

    tokenDataToBluetoothDeviceMap = self->_tokenDataToBluetoothDeviceMap;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "discoveryTokenData"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](tokenDataToBluetoothDeviceMap, "setObject:forKeyedSubscript:", v5, v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
    LOBYTE(v12) = v13 == 0;

    if ((v12 & 1) == 0)
    {
      idsIdentifierToBluetoothDeviceMap = self->_idsIdentifierToBluetoothDeviceMap;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsDeviceID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](idsIdentifierToBluetoothDeviceMap, "setObject:forKeyedSubscript:", v5, v15);

    }
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)uncacheDevice:(id)a3
{
  id v4;
  id v5;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *u64IdentifierToBluetoothDeviceMap;
  void *v8;
  NSMutableDictionary *tokenDataToBluetoothDeviceMap;
  void *v10;
  void *v11;
  NSMutableDictionary *idsIdentifierToBluetoothDeviceMap;
  void *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    v5 = objc_msgSend(v4, "u64Identifier");
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v5));
    -[NSMutableDictionary removeObjectForKey:](u64IdentifierToBluetoothDeviceMap, "removeObjectForKey:", v8);

    tokenDataToBluetoothDeviceMap = self->_tokenDataToBluetoothDeviceMap;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "discoveryTokenData"));
    -[NSMutableDictionary removeObjectForKey:](tokenDataToBluetoothDeviceMap, "removeObjectForKey:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDeviceID"));
    if (v11)
    {
      idsIdentifierToBluetoothDeviceMap = self->_idsIdentifierToBluetoothDeviceMap;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDeviceID"));
      -[NSMutableDictionary removeObjectForKey:](idsIdentifierToBluetoothDeviceMap, "removeObjectForKey:", v13);

    }
    os_unfair_lock_unlock(p_lock);
    v4 = v14;
  }

}

- (BOOL)uncacheDeviceByTokenData:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_tokenDataToBluetoothDeviceMap, "objectForKey:", v4));
    os_unfair_lock_unlock(&self->_lock);
    v6 = v5 != 0;
    if (v5)
      -[PRBluetoothDeviceCache uncacheDevice:](self, "uncacheDevice:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isCached:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "discoveryTokenData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForTokenData:](self, "deviceForTokenData:", v6));
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCachedByTokenData:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRBluetoothDeviceCache deviceForTokenData:](self, "deviceForTokenData:", v4));
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)deviceForIdentifier:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *u64IdentifierToBluetoothDeviceMap;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  u64IdentifierToBluetoothDeviceMap = self->_u64IdentifierToBluetoothDeviceMap;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](u64IdentifierToBluetoothDeviceMap, "objectForKeyedSubscript:", v7));

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)deviceForTokenData:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tokenDataToBluetoothDeviceMap, "objectForKeyedSubscript:", v4));
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idsIdentifierToBluetoothDeviceMap, "objectForKeyedSubscript:", v4));
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifierToBluetoothDeviceMap, 0);
  objc_storeStrong((id *)&self->_tokenDataToBluetoothDeviceMap, 0);
  objc_storeStrong((id *)&self->_u64IdentifierToBluetoothDeviceMap, 0);
}

@end
