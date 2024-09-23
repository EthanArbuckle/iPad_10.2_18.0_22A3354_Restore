@implementation TVRUICoreDeviceQuery

- (void)startQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id buf[2];

  v6 = a3;
  v7 = a4;
  -[TVRUICoreDeviceQuery setDelegate:](self, "setDelegate:", v6);
  v8 = objc_alloc_init(MEMORY[0x24BEB4080]);
  -[TVRUICoreDeviceQuery setQuery:](self, "setQuery:", v8);

  -[TVRUICoreDeviceQuery query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUICoreDeviceQuery setDeviceList:](self, "setDeviceList:", v10);

  _TVRUIDeviceQueryLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "UI requesting device query to start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[TVRUICoreDeviceQuery query](self, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke;
  v14[3] = &unk_24DE2CB78;
  objc_copyWeak(&v16, buf);
  v13 = v7;
  v15 = v13;
  objc_msgSend(v12, "startWithCompletionHandler:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);

}

void __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  char v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke_2;
    v5[3] = &unk_24DE2CB50;
    v6 = *(id *)(a1 + 32);
    v7 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __53__TVRUICoreDeviceQuery_startQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)hasStarted
{
  void *v2;

  -[TVRUICoreDeviceQuery query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (void)stop
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TVRUICoreDeviceQuery query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _TVRUIDeviceQueryLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "UI requesting device query to stop", v6, 2u);
    }

    -[TVRUICoreDeviceQuery query](self, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

    -[TVRUICoreDeviceQuery setQuery:](self, "setQuery:", 0);
  }
}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIDeviceQueryLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v34 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Device query did update. Num devices %ld ", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRUIDeviceQueryLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUICoreDeviceQuery deviceList](self, "deviceList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = (uint64_t)v9;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Old device list: %{public}@", buf, 0xCu);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = v4;
  objc_msgSend(v4, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[TVRUICoreDeviceQuery deviceList](self, "deviceList");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v17);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v18 = -[TVRUICoreDevice _initWithCoreDevice:]([TVRUICoreDevice alloc], "_initWithCoreDevice:", v15);
          _TVRUIDeviceQueryLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v34 = (uint64_t)v18;
            v35 = 2114;
            v36 = v15;
            _os_log_impl(&dword_21B042000, v19, OS_LOG_TYPE_DEFAULT, "Adding new uidevice: %{public}@ for core device: %{public}@", buf, 0x16u);
          }

        }
        objc_msgSend(v15, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v20);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v12);
  }

  -[TVRUICoreDeviceQuery deviceList](self, "deviceList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

  -[TVRUICoreDeviceQuery setDeviceList:](self, "setDeviceList:", v7);
  _TVRUIDeviceQueryLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUICoreDeviceQuery deviceList](self, "deviceList");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = (uint64_t)v23;
    _os_log_impl(&dword_21B042000, v22, OS_LOG_TYPE_DEFAULT, "New device list: %{public}@", buf, 0xCu);

  }
  -[TVRUICoreDeviceQuery delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TVRUICoreDeviceQuery delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUICoreDeviceQuery deviceList](self, "deviceList");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allValues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "deviceListUpdated:", v27);

  }
}

- (void)didUpdateSuggestedDevices:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          -[TVRUICoreDeviceQuery deviceList](self, "deviceList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          _TVRUIDeviceQueryLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v14)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v26 = v14;
              v27 = 2112;
              v28 = v11;
              _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "Found coreUIDevice:%@ for device:%@", buf, 0x16u);
            }

            objc_msgSend(v5, "addObject:", v14);
          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v11;
              _os_log_error_impl(&dword_21B042000, v16, OS_LOG_TYPE_ERROR, "Cannot find coredevice for device:%@", buf, 0xCu);
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }

    -[TVRUICoreDeviceQuery delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
    {
      -[TVRUICoreDeviceQuery delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "suggestedDevices:", v5);

    }
    v4 = v20;
  }

}

- (TVRUIDeviceSearchDelegate)delegate
{
  return (TVRUIDeviceSearchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRCDeviceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (NSMutableDictionary)deviceList
{
  return self->_deviceList;
}

- (void)setDeviceList:(id)a3
{
  objc_storeStrong((id *)&self->_deviceList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceList, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
