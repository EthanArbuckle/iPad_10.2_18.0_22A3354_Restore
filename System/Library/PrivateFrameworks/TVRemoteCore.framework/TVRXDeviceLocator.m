@implementation TVRXDeviceLocator

- (TVRXDeviceLocator)init
{
  TVRXDeviceLocator *v2;
  TVRXDeviceQuery *v3;
  TVRXDeviceQuery *query;
  NSMutableDictionary *v5;
  NSMutableDictionary *searches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRXDeviceLocator;
  v2 = -[TVRXDeviceLocator init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TVRXDeviceQuery);
    query = v2->_query;
    v2->_query = v3;

    -[TVRXDeviceQuery setDelegate:](v2->_query, "setDelegate:", v2);
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    searches = v2->_searches;
    v2->_searches = v5;

  }
  return v2;
}

- (void)findDeviceWithIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _TVRXSearchReference *v12;

  v8 = a5;
  v9 = a3;
  v12 = objc_alloc_init(_TVRXSearchReference);
  -[_TVRXSearchReference setIdentifier:](v12, "setIdentifier:", v9);
  v10 = (void *)MEMORY[0x220746068](v8);

  -[_TVRXSearchReference setCompletionBlock:](v12, "setCompletionBlock:", v10);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerExpired_, v12, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRXSearchReference setExpirationTimer:](v12, "setExpirationTimer:", v11);
  -[NSMutableDictionary setObject:forKey:](self->_searches, "setObject:forKey:", v12, v9);

  -[TVRXDeviceQuery start](self->_query, "start");
}

- (void)cancelSearchForDeviceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Device Locator: Cancelling search with identifier %@", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_searches, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v14 = v11;

          if (v14)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_searches, "removeObjectForKey:", v4);
            if (!-[NSMutableDictionary count](self->_searches, "count"))
              -[TVRXDeviceQuery stop](self->_query, "stop");
          }
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_15:

}

- (void)_timerExpired:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *searches;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRCGeneralLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21A51B000, v5, OS_LOG_TYPE_DEFAULT, "Device Locator: Timer expired while looking for search with identifier %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "completionBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  searches = self->_searches;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](searches, "removeObjectForKey:", v10);

  if (!-[NSMutableDictionary count](self->_searches, "count"))
    -[TVRXDeviceQuery stop](self->_query, "stop");

}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a3, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v25)
  {
    v5 = *(_QWORD *)v31;
    v23 = *(_QWORD *)v31;
    v24 = v4;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v31 != v5)
          objc_enumerationMutation(v4);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v7, "identifier", v23, v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alternateIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](self->_searches, "objectForKey:", v8);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
LABEL_17:
          _TVRCGeneralLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = v19;
            _os_log_impl(&dword_21A51B000, v18, OS_LOG_TYPE_DEFAULT, "Device Locator: Found device in query with identifier %@", buf, 0xCu);

          }
          objc_msgSend(v11, "expirationTimer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "invalidate");

          objc_msgSend(v11, "completionBlock");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v21)
            (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v7);
          -[NSMutableDictionary removeObjectForKey:](self->_searches, "removeObjectForKey:", v8);
          if (!-[NSMutableDictionary count](self->_searches, "count"))
            -[TVRXDeviceQuery stop](self->_query, "stop");

        }
        else
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v11);
                -[NSMutableDictionary objectForKey:](self->_searches, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
                v16 = objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v17 = (void *)v16;

                  v11 = v17;
                  v5 = v23;
                  v4 = v24;
                  goto LABEL_17;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
              if (v13)
                continue;
              break;
            }
            v5 = v23;
            v4 = v24;
          }
        }

      }
      v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v25);
  }

}

- (TVRXDeviceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSMutableDictionary)searches
{
  return self->_searches;
}

- (void)setSearches:(id)a3
{
  objc_storeStrong((id *)&self->_searches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searches, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
