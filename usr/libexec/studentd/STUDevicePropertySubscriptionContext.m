@implementation STUDevicePropertySubscriptionContext

- (STUDevicePropertySubscriptionContext)initWithSession:(id)a3 postsDMFNotification:(BOOL)a4
{
  id v6;
  STUDevicePropertySubscriptionContext *v7;
  STUDevicePropertySubscriptionContext *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *mSubscriptionCountByPropertyKey;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)STUDevicePropertySubscriptionContext;
  v7 = -[STUDevicePropertySubscriptionContext init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_session, v6);
    v8->_postsDMFNotification = a4;
    v9 = objc_opt_new(NSMutableDictionary);
    mSubscriptionCountByPropertyKey = v8->mSubscriptionCountByPropertyKey;
    v8->mSubscriptionCountByPropertyKey = v9;

  }
  return v8;
}

- (NSArray)propertyKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->mSubscriptionCountByPropertyKey, "allKeys");
}

- (void)subscribePropertyKeys:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  char *v11;
  void *v12;
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
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mSubscriptionCountByPropertyKey, "objectForKeyedSubscript:", v9));
        v11 = (char *)objc_msgSend(v10, "integerValue");

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11 + 1));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->mSubscriptionCountByPropertyKey, "setObject:forKeyedSubscript:", v12, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)unsubscribePropertyKeys:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
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
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->mSubscriptionCountByPropertyKey, "objectForKeyedSubscript:", v9));
        v11 = (uint64_t)objc_msgSend(v10, "integerValue");

        if (v11 < 2)
        {
          -[NSMutableDictionary removeObjectForKey:](self->mSubscriptionCountByPropertyKey, "removeObjectForKey:", v9);
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11 - 1));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->mSubscriptionCountByPropertyKey, "setObject:forKeyedSubscript:", v12, v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)postNotificationForPropertyChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[STUDevicePropertySubscriptionContext session](self, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertySubscriptionContext notificationName](self, "notificationName"));
  objc_msgSend(v6, "postNotificationWithName:userInfo:", v5, v4);

}

- (id)notificationName
{
  unsigned int v2;
  id *v3;

  v2 = -[STUDevicePropertySubscriptionContext postsDMFNotification](self, "postsDMFNotification");
  v3 = (id *)&CRKDevicePropertiesDidChangeNotificationName;
  if (v2)
    v3 = (id *)&DMFDevicePropertiesDidChangeNotificationName;
  return *v3;
}

- (CATTaskSession)session
{
  return (CATTaskSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (BOOL)postsDMFNotification
{
  return self->_postsDMFNotification;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->mSubscriptionCountByPropertyKey, 0);
}

@end
