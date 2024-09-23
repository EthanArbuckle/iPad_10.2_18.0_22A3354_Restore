@implementation WiFiUserSettingsStore

- (WiFiUserSettingsStore)init
{
  WiFiUserSettingsStore *v2;
  CWFKeyValueStore *v3;
  CWFKeyValueStore *userSettingsKVS;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFiUserSettingsStore;
  v2 = -[WiFiUserSettingsStore init](&v7, "init");
  if (!v2)
  {
LABEL_8:

    return 0;
  }
  v3 = (CWFKeyValueStore *)objc_msgSend(objc_alloc((Class)CWFKeyValueStore), "initWithType:identifier:", 5, CFSTR("com.apple.wifi.user-settings"));
  userSettingsKVS = v2->_userSettingsKVS;
  v2->_userSettingsKVS = v3;

  if (!v2->_userSettingsKVS)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Error: User Settings CWFKeyValueStore alloc failed", "-[WiFiUserSettingsStore init]");
    objc_autoreleasePoolPop(v6);
    goto LABEL_8;
  }
  -[WiFiUserSettingsStore _setupKVSHandler](v2, "_setupKVSHandler");
  return v2;
}

- (void)_setupKVSHandler
{
  _QWORD v3[4];
  id v4;
  id from;

  from = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10015556C;
  v3[3] = &unk_100232748;
  objc_copyWeak(&v4, &from);
  -[CWFKeyValueStore setEventHandler:](self->_userSettingsKVS, "setEventHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&from);
}

- (void)_kvsDidChangeWithKeys:(id)a3 isExternal:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  if (!-[WiFiUserSettingsStore syncingEnabled](self, "syncingEnabled"))
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: KVS change disregarded, syncing not enabled", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v21);
    goto LABEL_25;
  }
  if (!a4)
  {
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: local changed to KVS keys='%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v6);
LABEL_25:
    objc_autoreleasePoolPop(v20);
    v7 = 0;
    goto LABEL_20;
  }
  v7 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = v6;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v9)
    goto LABEL_17;
  v10 = v9;
  v11 = *(_QWORD *)v24;
  v12 = CWFUserSettingsStoreAskToJoinModeKey;
  v13 = CWFUserSettingsStoreAutoHotspotModeKey;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v15, "isEqualToString:", v12))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CWFKeyValueStore objectForKey:](self->_userSettingsKVS, "objectForKey:", v12));
        objc_msgSend(v7, "setObject:forKey:", v16, v12);
        v17 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ask to join value changed to '%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v16);
      }
      else
      {
        if (!objc_msgSend(v15, "isEqualToString:", v13))
          continue;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CWFKeyValueStore objectForKey:](self->_userSettingsKVS, "objectForKey:", v13));
        objc_msgSend(v7, "setObject:forKey:", v16, v13);
        v17 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: hotspot mode value changed to '%@'", "-[WiFiUserSettingsStore _kvsDidChangeWithKeys:isExternal:]", v16);
      }
      objc_autoreleasePoolPop(v17);

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v10);
LABEL_17:

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore keyDidChangeHandler](self, "keyDidChangeHandler"));
  if (v18)
  {
    v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore keyDidChangeHandler](self, "keyDidChangeHandler"));
    ((void (**)(_QWORD, id))v19)[2](v19, v7);

  }
  v6 = v22;
LABEL_20:

}

- (void)setAutoInstantHotspotMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[WiFiUserSettingsStore syncingEnabled](self, "syncingEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v5, "setObject:forKey:", v6, CWFUserSettingsStoreAutoHotspotModeKey);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    objc_msgSend(v8, "synchronize");

  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: auto hotspot mode change disregarded, syncing not enabled (new value: %ld)", "-[WiFiUserSettingsStore setAutoInstantHotspotMode:]", a3);
    objc_autoreleasePoolPop(v7);
  }
}

- (void)setAskToJoinMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[WiFiUserSettingsStore syncingEnabled](self, "syncingEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v5, "setObject:forKey:", v6, CWFUserSettingsStoreAskToJoinModeKey);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[WiFiUserSettingsStore userSettingsKVS](self, "userSettingsKVS"));
    objc_msgSend(v8, "synchronize");

  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ask to join mode change disregarded, syncing not enabled (new value: %ld)", "-[WiFiUserSettingsStore setAskToJoinMode:]", a3);
    objc_autoreleasePoolPop(v7);
  }
}

- (void)setSyncingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;

  v3 = a3;
  self->_syncingEnabled = a3;
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
  {
    v5 = CFSTR("not enabled");
    if (v3)
      v5 = CFSTR("enabled");
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: syncing is %@", "-[WiFiUserSettingsStore setSyncingEnabled:]", v5);
  }
  objc_autoreleasePoolPop(v4);
}

- (BOOL)syncingEnabled
{
  return self->_syncingEnabled;
}

- (id)keyDidChangeHandler
{
  return self->_keyDidChangeHandler;
}

- (void)setKeyDidChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CWFKeyValueStore)userSettingsKVS
{
  return self->_userSettingsKVS;
}

- (void)setUserSettingsKVS:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsKVS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettingsKVS, 0);
  objc_storeStrong(&self->_keyDidChangeHandler, 0);
}

@end
