@implementation PKAccessoryDeviceMonitor

- (PKAccessoryDeviceMonitor)initWithDelegate:(id)a3
{
  id v4;
  PKAccessoryDeviceMonitor *v5;
  PKAccessoryDeviceMonitor *v6;
  NSMutableSet *v7;
  NSMutableSet *accessoryAttached;
  uint64_t v9;
  ACCConnectionInfo *accessoryConnectionInfo;
  NSMutableDictionary *v11;
  NSMutableDictionary *attachmentDictionary;
  int v13;
  NSObject *v14;
  const __CFString *v15;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAccessoryDeviceMonitor;
  v5 = -[PKAccessoryDeviceMonitor init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    accessoryAttached = v6->_accessoryAttached;
    v6->_accessoryAttached = v7;

    -[objc_class sharedInstance](getACCConnectionInfoClass(), "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    accessoryConnectionInfo = v6->_accessoryConnectionInfo;
    v6->_accessoryConnectionInfo = (ACCConnectionInfo *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachmentDictionary = v6->_attachmentDictionary;
    v6->_attachmentDictionary = v11;

    v13 = -[ACCConnectionInfo registerDelegate:](v6->_accessoryConnectionInfo, "registerDelegate:", v6);
    PKLogFacilityTypeGetObject(0x19uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("Unsuccessfully");
      if (v13)
        v15 = CFSTR("Successfully");
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Registered for CoreAccessory delegate %@", buf, 0xCu);
    }

  }
  return v6;
}

- (BOOL)accessoryAttachedForEndpointUUID:(id)a3
{
  return -[NSMutableSet containsObject:](self->_accessoryAttached, "containsObject:", a3);
}

- (void)accessoryConnectionAttached:(id)a3 type:(int)a4 info:(id)a5 properties:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4 == 9)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_accessoryConnectionUUID, a3);
    os_unfair_lock_unlock(&self->_lock);
    PKLogFacilityTypeGetObject(0x19uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138413058;
      v16 = v11;
      v17 = 1024;
      v18 = 9;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Connection has attached with the following UUID %@ type %d following info %@ and properties %@", (uint8_t *)&v15, 0x26u);
    }

  }
}

- (void)accessoryConnectionDetached:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSString *accessoryConnectionUUID;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_accessoryConnectionUUID;
  v6 = (NSString *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (!v6 || !v5)
    {

      goto LABEL_11;
    }
    v8 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_11;
  }
  PKLogFacilityTypeGetObject(0x19uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Connection has detached with the following UUID %@", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  accessoryConnectionUUID = self->_accessoryConnectionUUID;
  self->_accessoryConnectionUUID = 0;

  os_unfair_lock_unlock(&self->_lock);
LABEL_11:

}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  id v12;
  id v13;
  id v14;
  PKAccessoryDevice *v15;
  NSObject *v16;
  PKAccessoryDeviceMonitorDelegate **p_delegate;
  id WeakRetained;
  void *v19;
  id v20;
  char v21;
  id v22;
  int v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  PKAccessoryDevice *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (a4 == 13)
  {
    v15 = -[PKAccessoryDevice initWithDictionary:endpointUUID:]([PKAccessoryDevice alloc], "initWithDictionary:endpointUUID:", v13, v12);
    PKLogFacilityTypeGetObject(0x19uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138413314;
      v24 = v14;
      v25 = 1024;
      v26 = 13;
      v27 = 1024;
      v28 = a5;
      v29 = 2112;
      v30 = v13;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Accessory has attached with the following connection UUID %@ transportType %d following protocol %d, and device properties %@ and device %@", (uint8_t *)&v23, 0x2Cu);
    }

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_attachmentDictionary, "setObject:forKeyedSubscript:", v15, v12);
    -[NSMutableSet addObject:](self->_accessoryAttached, "addObject:", v12);
    os_unfair_lock_unlock(&self->_lock);
    if (-[PKAccessoryDevice isSleeve](v15, "isSleeve"))
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      if (WeakRetained)
      {
        v19 = WeakRetained;
        v20 = objc_loadWeakRetained((id *)p_delegate);
        v21 = objc_opt_respondsToSelector();

        if ((v21 & 1) != 0)
        {
          v22 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(v22, "didAttachSleeveAccessory:", v15);

        }
      }
    }

  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  PKAccessoryDeviceMonitorDelegate **p_delegate;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentDictionary, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableSet removeObject:](self->_accessoryAttached, "removeObject:", v6);
    -[NSMutableDictionary removeObjectForKey:](self->_attachmentDictionary, "removeObjectForKey:", v6);
    os_unfair_lock_unlock(&self->_lock);
    PKLogFacilityTypeGetObject(0x19uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412802;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Accessory has detached with the following connection UUID %@ and endpoint UUID %@ and device %@", (uint8_t *)&v16, 0x20u);
    }

    if (objc_msgSend(v8, "isSleeve"))
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      if (WeakRetained)
      {
        v12 = WeakRetained;
        v13 = objc_loadWeakRetained((id *)p_delegate);
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) != 0)
        {
          v15 = objc_loadWeakRetained((id *)p_delegate);
          objc_msgSend(v15, "didDetachSleeveAccessory");

        }
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryConnectionUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryAttached, 0);
  objc_storeStrong((id *)&self->_attachmentDictionary, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionInfo, 0);
}

@end
