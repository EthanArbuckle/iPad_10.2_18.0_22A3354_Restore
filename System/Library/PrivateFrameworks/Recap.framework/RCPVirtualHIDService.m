@implementation RCPVirtualHIDService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicMetaProperties, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_eventService, 0);
  objc_storeStrong((id *)&self->_waitForPointerReadyGroup, 0);
  objc_storeStrong((id *)&self->_waitForEventSystemGroup, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v7;
  id v8;
  NSObject *waitForEventSystemGroup;
  int v10;
  NSObject *v11;
  _DWORD v13[2];
  __int16 v14;
  RCPVirtualHIDService *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (_RCPIsAllowlistedProperty(v8))
    -[NSMutableDictionary setObject:forKey:](self->_dynamicMetaProperties, "setObject:forKey:", v7, v8);
  if (objc_msgSend(v8, "isEqual:", CFSTR("DeviceOpenedByEventSystem")))
  {
    self->_isOpen = objc_msgSend(v7, "BOOLValue");
    waitForEventSystemGroup = self->_waitForEventSystemGroup;
LABEL_5:
    dispatch_group_leave(waitForEventSystemGroup);
    goto LABEL_13;
  }
  if (!objc_msgSend(v8, "isEqual:", CFSTR("BKReadyToReceivePointerEvents")))
  {
    objc_msgSend(v8, "isEqual:", CFSTR("BatchInterval"));
    goto LABEL_13;
  }
  v10 = objc_msgSend(v7, "BOOLValue");
  RCPLogPlayback();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = v10;
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_1A5E84000, v11, OS_LOG_TYPE_DEFAULT, "--> pointer ready: (%{BOOL}u): %@", (uint8_t *)v13, 0x12u);
  }

  if (v10 && !self->_readyForPointerEvents)
  {
    self->_readyForPointerEvents = 1;
    waitForEventSystemGroup = self->_waitForPointerReadyGroup;
    goto LABEL_5;
  }
LABEL_13:

  return 1;
}

- (void)postHIDEvent:(__IOHIDEvent *)a3
{
  NSObject *v5;
  NSObject *waitForPointerReadyGroup;
  dispatch_time_t v7;
  NSObject *v8;
  int v9;
  RCPVirtualHIDService *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_readyForPointerEvents && IOHIDEventGetType() == 17)
  {
    RCPLogPlayback();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_1A5E84000, v5, OS_LOG_TYPE_DEFAULT, "waiting for ready: (%{public}@)", (uint8_t *)&v9, 0xCu);
    }

    waitForPointerReadyGroup = self->_waitForPointerReadyGroup;
    v7 = dispatch_time(0, 5000000000);
    dispatch_group_wait(waitForPointerReadyGroup, v7);
    if (!self->_readyForPointerEvents)
    {
      RCPLogPlayback();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RCPVirtualHIDService postHIDEvent:].cold.1((uint64_t)self, v8);

    }
  }
  -[HIDVirtualEventService dispatchEvent:](self->_eventService, "dispatchEvent:", a3);
}

- (BOOL)isRunning
{
  return self->_eventService != 0;
}

- (NSString)description
{
  void *v3;
  NSString *identifier;
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  int v14;
  __CFString *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RCPVirtualHIDService;
  -[RCPVirtualHIDService description](&v19, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  v5 = self->_propertyDictionary;
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Product"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Product"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("Transport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("PrimaryUsagePage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("PrimaryUsage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (unsigned __int16)objc_msgSend(v9, "unsignedIntValue");
  v12 = (unsigned __int16)objc_msgSend(v10, "unsignedIntValue");
  if (v6)
  {
    v13 = v6;
LABEL_24:
    v15 = v13;
    goto LABEL_25;
  }
  v14 = v12 | ((_DWORD)v11 << 16);
  if (v14 > 851971)
  {
    if (v14 > 851979)
    {
      if (v14 == 851980)
      {
        v15 = CFSTR("trackpad");
      }
      else
      {
        if (v14 != 852000)
          goto LABEL_26;
        v15 = CFSTR("pencil digitizer");
      }
    }
    else if (v14 == 851972)
    {
      v15 = CFSTR("touchscreen digitizer");
    }
    else
    {
      if (v14 != 851973)
        goto LABEL_26;
      v15 = CFSTR("touchpad digitizer");
    }
  }
  else if (v14 > 720896)
  {
    if (v14 == 720897)
    {
      v15 = CFSTR("built-in buttons");
    }
    else
    {
      if (v14 != 851969)
        goto LABEL_26;
      v15 = CFSTR("digitizer");
    }
  }
  else
  {
    if (v14 != 65538)
    {
      if (v14 == 65542)
      {
        v15 = CFSTR("keyboard");
        goto LABEL_22;
      }
LABEL_26:
      if (!v7)
      {
        v15 = 0;
        goto LABEL_25;
      }
      v13 = v7;
      goto LABEL_24;
    }
    v15 = CFSTR("mouse");
  }
LABEL_22:
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v15, v7);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%.02X/0x%.02X: (%@) %@"), v11, v12, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (%@) %@"), identifier, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = _RCPIsAllowlistedProperty(v5);
  v7 = 56;
  if (v6)
    v7 = 64;
  objc_msgSend(*(id *)((char *)&self->super.isa + v7), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)stop
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 100000000);
  _RCPVirtualHIDServiceQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__RCPVirtualHIDService_stop__block_invoke;
  block[3] = &unk_1E4FC1FB8;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  return 0;
}

uint64_t __28__RCPVirtualHIDService_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
}

+ (id)serviceWithIdentifier:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:properties:", v7, v6);

  return v8;
}

- (RCPVirtualHIDService)initWithIdentifier:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  dispatch_group_t v15;
  void *v16;
  dispatch_group_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  dispatch_time_t v29;
  _QWORD v31[4];
  id v32;
  objc_super v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)RCPVirtualHIDService;
  v8 = -[RCPVirtualHIDService init](&v33, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 6);
    *((_QWORD *)v8 + 6) = v9;

    objc_msgSend(v7, "properties");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v8 + 7);
    *((_QWORD *)v8 + 7) = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = (void *)*((_QWORD *)v8 + 8);
    *((_QWORD *)v8 + 8) = v13;

    v15 = dispatch_group_create();
    v16 = (void *)*((_QWORD *)v8 + 2);
    *((_QWORD *)v8 + 2) = v15;

    dispatch_group_enter(*((dispatch_group_t *)v8 + 2));
    v17 = dispatch_group_create();
    v18 = (void *)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v17;

    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "deviceClass");

    if (v20 || _AXSAssistiveTouchEnabled())
    {
      if (objc_msgSend(v7, "sendsMousePointerEvents"))
      {
        objc_opt_class();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          RCPLogPlayback();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v8;
            _os_log_impl(&dword_1A5E84000, v21, OS_LOG_TYPE_DEFAULT, "service waiting for ready: (%{public}@)", buf, 0xCu);
          }

          *((_BYTE *)v8 + 33) = 0;
          dispatch_group_enter(*((dispatch_group_t *)v8 + 3));
          goto LABEL_14;
        }
      }
      RCPLogPlayback();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 138543362;
      v35 = v8;
      v23 = "service doesn't wait for pointer ready: (%{public}@)";
    }
    else
    {
      if (!objc_msgSend(v7, "sendsMousePointerEvents"))
        goto LABEL_13;
      RCPLogPlayback();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

LABEL_13:
        *((_BYTE *)v8 + 33) = 1;
LABEL_14:
        v24 = (void *)objc_opt_new();
        v25 = (void *)*((_QWORD *)v8 + 5);
        *((_QWORD *)v8 + 5) = v24;
        v26 = v24;

        _RCPVirtualHIDServiceQueue();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setDelegate:", v8);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __54__RCPVirtualHIDService_initWithIdentifier_properties___block_invoke;
        v31[3] = &unk_1E4FC1FB8;
        v32 = v8;
        objc_msgSend(v26, "setCancelHandler:", v31);
        objc_msgSend(v26, "setDispatchQueue:", v27);
        objc_msgSend(v26, "activate");
        v28 = *((_QWORD *)v8 + 2);
        v29 = dispatch_time(0, 10000000000);
        dispatch_group_wait(v28, v29);

        goto LABEL_15;
      }
      *(_DWORD *)buf = 138543362;
      v35 = v8;
      v23 = "service doesn't support pointer input: (%{public}@)";
    }
    _os_log_impl(&dword_1A5E84000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
    goto LABEL_12;
  }
LABEL_15:

  return (RCPVirtualHIDService *)v8;
}

void __54__RCPVirtualHIDService_initWithIdentifier_properties___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  RCPLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A5E84000, v2, OS_LOG_TYPE_DEFAULT, "service canceled: (%{public}@)", (uint8_t *)&v4, 0xCu);
  }

}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  RCPLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("terminated");
    if (a3 == 10)
      v7 = CFSTR("enumerated");
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1A5E84000, v6, OS_LOG_TYPE_INFO, "notification:%{public}@", (uint8_t *)&v8, 0xCu);
  }

}

- (RCPEventSenderProperties)properties
{
  return self->_properties;
}

- (BOOL)startWithError:(id *)a3
{
  return 1;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  return 0;
}

- (HIDVirtualEventService)eventService
{
  return self->_eventService;
}

- (void)setEventService:(id)a3
{
  objc_storeStrong((id *)&self->_eventService, a3);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)propertyDictionary
{
  return self->_propertyDictionary;
}

- (void)setPropertyDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_propertyDictionary, a3);
}

- (NSMutableDictionary)dynamicMetaProperties
{
  return self->_dynamicMetaProperties;
}

- (void)setDynamicMetaProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicMetaProperties, a3);
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)readyForPointerEvents
{
  return self->_readyForPointerEvents;
}

- (void)setReadyForPointerEvents:(BOOL)a3
{
  self->_readyForPointerEvents = a3;
}

- (void)postHIDEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A5E84000, a2, OS_LOG_TYPE_ERROR, "*** did not get ready notification: (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end
