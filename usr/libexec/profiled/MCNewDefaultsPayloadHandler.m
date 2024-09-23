@implementation MCNewDefaultsPayloadHandler

- (MCNewDefaultsPayloadHandler)initWithPayload:(id)a3 profileHandler:(id)a4
{
  MCNewDefaultsPayloadHandler *v4;
  NSMutableSet *v5;
  NSMutableSet *changedDomains;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCNewDefaultsPayloadHandler;
  v4 = -[MCNewPayloadHandler initWithPayload:profileHandler:](&v8, "initWithPayload:profileHandler:", a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    changedDomains = v4->_changedDomains;
    v4->_changedDomains = v5;

  }
  return v4;
}

- (BOOL)_install
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domains", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        -[NSMutableSet addObject:](self->_changedDomains, "addObject:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultsForDomain:", v11));
        if (!+[MCManagedPreferencesManager addManagedPreferences:toDomain:](MCManagedPreferencesManager, "addManagedPreferences:toDomain:", v12, v11))
        {

          v15 = 0;
          goto LABEL_14;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v11));
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, "addEntriesFromDictionary:", v12);
        }
        else
        {
          v14 = objc_msgSend(v12, "mutableCopy");
        }
        objc_msgSend(v5, "setObject:forKey:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_14:

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  objc_msgSend(v16, "_sendChangeNotificationsBasedOnDefaultsAdditionByDomain:", v5);

  return v15;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (-[MCNewDefaultsPayloadHandler _install](self, "_install", a3, a4, a5))
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v9 = MCDefaultsErrorDomain;
    v10 = MCErrorArray(CFSTR("DEFAULTS_COULD_NOT_INSTALL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 10000, v11, MCErrorTypeFatal, 0));

    v8 = v7 == 0;
    if (a6 && v7)
    {
      v7 = objc_retainAutorelease(v7);
      v8 = 0;
      *a6 = v7;
    }
  }

  return v8;
}

- (void)_remove
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domains"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        -[NSMutableSet addObject:](self->_changedDomains, "addObject:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "defaultsForDomain:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
        +[MCManagedPreferencesManager removeManagedPreferences:fromDomain:](MCManagedPreferencesManager, "removeManagedPreferences:fromDomain:", v12, v10);
        objc_msgSend(v5, "setObject:forKey:", v12, v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  objc_msgSend(v13, "_sendChangeNotificationsBasedOnDefaultsRemovalByDomain:", v5);

}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCNewDefaultsPayloadHandler _remove](self, "_remove");
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_changedDomains, "allObjects", a3, a4));
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:](MCManagedPreferencesManager, "sendManagedPreferencesChangedNotificationForDomains:", v4);

}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_changedDomains, "allObjects", a3, a4));
  +[MCManagedPreferencesManager sendManagedPreferencesChangedNotificationForDomains:](MCManagedPreferencesManager, "sendManagedPreferencesChangedNotificationForDomains:", v4);

}

- (NSMutableSet)changedDomains
{
  return self->_changedDomains;
}

- (void)setChangedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_changedDomains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedDomains, 0);
}

@end
