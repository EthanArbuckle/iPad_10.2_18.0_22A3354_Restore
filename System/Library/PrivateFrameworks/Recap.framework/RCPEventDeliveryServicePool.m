@implementation RCPEventDeliveryServicePool

- (id)deliveryServiceForSenderProperties:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[RCPEventDeliveryServicePool shouldIgnoreSenderProperties](self, "shouldIgnoreSenderProperties");
  if (!v4 || v5)
  {
    RCPLogPlayback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A5E84000, v7, OS_LOG_TYPE_DEFAULT, "properties were nil, or ignoring properties set. Falling back to a platform specific default sender.", buf, 2u);
    }

    RCPLogPlayback();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A5E84000, v8, OS_LOG_TYPE_DEFAULT, "defaulting to touch screen digitizer sender", v11, 2u);
    }

    +[RCPEventSenderProperties touchScreenDigitizerSender](RCPEventSenderProperties, "touchScreenDigitizerSender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventDeliveryServicePool _findServiceForSenderProperties:](self, "_findServiceForSenderProperties:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[RCPEventDeliveryServicePool _findServiceForSenderProperties:](self, "_findServiceForSenderProperties:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v6, "isRunning") & 1) == 0)
    objc_msgSend(v6, "startWithError:", 0);

  return v6;
}

- (BOOL)shouldIgnoreSenderProperties
{
  return self->_shouldIgnoreSenderProperties;
}

- (id)_findServiceForSenderProperties:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *deliveryServicesBySenderID;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "senderID");
  if (v5)
  {
    v6 = v5;
    deliveryServicesBySenderID = self->_deliveryServicesBySenderID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](deliveryServicesBySenderID, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recap-%llX"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[RCPVirtualHIDService serviceWithIdentifier:properties:](RCPVirtualHIDService, "serviceWithIdentifier:properties:", v10, v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      RCPLogPlayback();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v9;
        _os_log_impl(&dword_1A5E84000, v11, OS_LOG_TYPE_DEFAULT, "new virtual service %{public}@", buf, 0xCu);
      }

      v12 = self->_deliveryServicesBySenderID;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, v13);

    }
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deliveryServicesBySenderProperties, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[RCPVirtualHIDService serviceWithIdentifier:properties:](RCPVirtualHIDService, "serviceWithIdentifier:properties:", CFSTR("recapulon"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      RCPLogPlayback();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v9;
        _os_log_impl(&dword_1A5E84000, v14, OS_LOG_TYPE_DEFAULT, "new virtual service %{public}@", buf, 0xCu);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deliveryServicesBySenderProperties, "setObject:forKeyedSubscript:", v9, v4);
    }
  }

  return v9;
}

- (BOOL)prewarmForSenderProperties:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v10;

  v6 = a3;
  if (!v6)
  {
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  -[RCPEventDeliveryServicePool _findServiceForSenderProperties:](self, "_findServiceForSenderProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "startWithError:", &v10);
  v8 = v10;

  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v8 == 0;
}

- (void)tearDown
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary copy](self->_deliveryServicesBySenderID, "copy");
  v4 = (void *)-[NSMutableDictionary copy](self->_deliveryServicesBySenderProperties, "copy");
  -[NSMutableDictionary removeAllObjects](self->_deliveryServicesBySenderID, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deliveryServicesBySenderProperties, "removeAllObjects");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "stop");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "stop");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (RCPEventDeliveryServicePool)init
{
  RCPEventDeliveryServicePool *v2;
  RCPEventDeliveryServicePool *v3;
  uint64_t v4;
  NSMutableDictionary *deliveryServicesBySenderID;
  uint64_t v6;
  NSMutableDictionary *deliveryServicesBySenderProperties;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RCPEventDeliveryServicePool;
  v2 = -[RCPEventDeliveryServicePool init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldIgnoreSenderProperties = 0;
    v4 = objc_opt_new();
    deliveryServicesBySenderID = v3->_deliveryServicesBySenderID;
    v3->_deliveryServicesBySenderID = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    deliveryServicesBySenderProperties = v3->_deliveryServicesBySenderProperties;
    v3->_deliveryServicesBySenderProperties = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)setShouldIgnoreSenderProperties:(BOOL)a3
{
  self->_shouldIgnoreSenderProperties = a3;
}

- (NSMutableDictionary)deliveryServicesBySenderID
{
  return self->_deliveryServicesBySenderID;
}

- (void)setDeliveryServicesBySenderID:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryServicesBySenderID, a3);
}

- (NSMutableDictionary)deliveryServicesBySenderProperties
{
  return self->_deliveryServicesBySenderProperties;
}

- (void)setDeliveryServicesBySenderProperties:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryServicesBySenderProperties, a3);
}

- (RCPEventDeliveryService)fallbackDeliveryService
{
  return self->_fallbackDeliveryService;
}

- (void)setFallbackDeliveryService:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackDeliveryService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackDeliveryService, 0);
  objc_storeStrong((id *)&self->_deliveryServicesBySenderProperties, 0);
  objc_storeStrong((id *)&self->_deliveryServicesBySenderID, 0);
}

@end
