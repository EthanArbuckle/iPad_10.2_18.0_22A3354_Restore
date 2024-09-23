@implementation PLIOKitOperatorComposition

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (PLOperator)operator
{
  return (PLOperator *)objc_getProperty(self, a2, 64, 1);
}

- (id)propertiesFromIOEntry:(unsigned int)a3
{
  return +[PLIOKitOperatorComposition snapshotFromIOEntry:](PLIOKitOperatorComposition, "snapshotFromIOEntry:", *(_QWORD *)&a3);
}

- (id)properties
{
  return -[PLIOKitOperatorComposition propertiesFromIOEntry:](self, "propertiesFromIOEntry:", -[PLIOKitOperatorComposition service](self, "service"));
}

- (unsigned)service
{
  return self->_service;
}

+ (id)snapshotFromIOEntry:(unsigned int)a3
{
  CFMutableDictionaryRef properties;

  properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, 0, 0);
  return properties;
}

+ (id)snapshotFromIOEntry:(unsigned int)a3 forKey:(id)a4
{
  return (id)(id)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

+ (id)snapshotFromIOEntry:(unsigned int)a3 forKeys:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFAllocator *v11;
  uint64_t i;
  const __CFString *v13;
  void *CFProperty;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v13 = *(const __CFString **)(*((_QWORD *)&v16 + 1) + 8 * i);
        CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, v13, v11, 0);
        if (CFProperty)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", CFProperty, v13, (_QWORD)v16);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forService:(id)a4
{
  id v7;
  id v8;
  PLIOKitOperatorComposition *v9;
  PLIOKitOperatorComposition *v10;
  mach_port_t v11;
  IONotificationPort *v12;
  NSObject *v13;
  id v14;
  CFMutableDictionaryRef v15;
  mach_port_t v16;
  const __CFDictionary *v17;
  void *v18;
  uint64_t v19;
  PLIOKitOperatorComposition *v20;
  objc_super v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLIOKitOperatorComposition;
  v9 = -[PLIOKitOperatorComposition init](&v22, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_9;
  objc_storeStrong((id *)&v9->_operator, a3);
  objc_storeStrong((id *)&v10->_serviceName, a4);
  v11 = *MEMORY[0x1E0CBBAB8];
  v10->_ioNotifyPort = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
  v12 = -[PLIOKitOperatorComposition ioNotifyPort](v10, "ioNotifyPort");
  objc_msgSend(v7, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  IONotificationPortSetDispatchQueue(v12, v13);

  if (!objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("MainDisplay")))
  {
    IOMobileFramebufferGetMainDisplay();
    goto LABEL_10;
  }
  if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), "backlight-control"))
  {
    v25 = CFSTR("IOPropertyMatch");
    v23 = CFSTR("backlight-control");
    v24 = *MEMORY[0x1E0C9AE50];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = v11;
    v17 = (const __CFDictionary *)v19;
    goto LABEL_8;
  }
  -[PLIOKitOperatorComposition serviceName](v10, "serviceName");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = IOServiceMatching((const char *)objc_msgSend(v14, "UTF8String"));

  if (!v15)
  {
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  v16 = v11;
  v17 = v15;
LABEL_8:
  v10->_service = IOServiceGetMatchingService(v16, v17);
LABEL_9:
  v20 = v10;
LABEL_11:

  return v20;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forServiceClass:(id)a4
{
  id v7;
  id v8;
  PLIOKitOperatorComposition *v9;
  PLIOKitOperatorComposition *v10;
  IONotificationPort *v11;
  NSObject *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLIOKitOperatorComposition;
  v9 = -[PLIOKitOperatorComposition init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operator, a3);
    objc_storeStrong((id *)&v10->_serviceClassName, a4);
    v10->_service = 0;
    v10->_ioNotifyPort = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
    v11 = -[PLIOKitOperatorComposition ioNotifyPort](v10, "ioNotifyPort");
    objc_msgSend(v7, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    IONotificationPortSetDispatchQueue(v11, v12);

  }
  return v10;
}

- (void)dealloc
{
  IONotificationPort *ioNotifyPort;
  io_object_t service;
  objc_super v5;

  ioNotifyPort = self->_ioNotifyPort;
  if (ioNotifyPort)
    IONotificationPortDestroy(ioNotifyPort);
  service = self->_service;
  if (service)
    IOObjectRelease(service);
  v5.receiver = self;
  v5.super_class = (Class)PLIOKitOperatorComposition;
  -[PLIOKitOperatorComposition dealloc](&v5, sel_dealloc);
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forService:(id)a4 withBlock:(id)a5
{
  id v8;
  PLIOKitOperatorComposition *v9;
  uint64_t v10;
  id operatorBlock;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  PLIOKitOperatorComposition *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v46[5];
  _QWORD block[5];

  v8 = a5;
  v9 = -[PLIOKitOperatorComposition initWithOperator:forService:](self, "initWithOperator:forService:", a3, a4);
  if (!v9)
  {
LABEL_18:
    v29 = v9;
    goto LABEL_19;
  }
  v10 = MEMORY[0x1BCC9EB70](v8);
  operatorBlock = v9->_operatorBlock;
  v9->_operatorBlock = (id)v10;

  v9->_notificationRef = 0;
  v12 = IOServiceAddInterestNotification(-[PLIOKitOperatorComposition ioNotifyPort](v9, "ioNotifyPort"), -[PLIOKitOperatorComposition service](v9, "service"), "IOGeneralInterest", (IOServiceInterestCallback)ioCallBack, v9, &v9->_notificationRef);
  v13 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (!(_DWORD)v12)
  {
    if (v13)
    {
      v30 = objc_opt_class();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke_27;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v30;
      if (initWithOperator_forService_withBlock__defaultOnce_25 != -1)
        dispatch_once(&initWithOperator_forService_withBlock__defaultOnce_25, v46);
      if (initWithOperator_forService_withBlock__classDebugEnabled_26)
      {
        v31 = (void *)MEMORY[0x1E0CB3940];
        -[PLIOKitOperatorComposition operator](v9, "operator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "className");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: %@ is setup"), v33, v9->_serviceName);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOKitOperatorComposition.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIOKitOperatorComposition initWithOperator:forService:withBlock:]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v36, v37, 148);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[PLIOKitOperatorComposition initWithOperator:forService:withBlock:].cold.1((uint64_t)v34, v38, v39, v40, v41, v42, v43, v44);

      }
    }
    goto LABEL_18;
  }
  if (v13)
  {
    v14 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (initWithOperator_forService_withBlock__defaultOnce != -1)
      dispatch_once(&initWithOperator_forService_withBlock__defaultOnce, block);
    if (initWithOperator_forService_withBlock__classDebugEnabled)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      -[PLIOKitOperatorComposition operator](v9, "operator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "className");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: Error calling IOServiceAddInterestNotification (0x%08x) for service %@"), v17, v12, v9->_serviceName);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOKitOperatorComposition.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIOKitOperatorComposition initWithOperator:forService:withBlock:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 145);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLIOKitOperatorComposition initWithOperator:forService:withBlock:].cold.1((uint64_t)v18, v22, v23, v24, v25, v26, v27, v28);

    }
  }
  v29 = 0;
LABEL_19:

  return v29;
}

BOOL __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initWithOperator_forService_withBlock__classDebugEnabled = result;
  return result;
}

BOOL __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke_27(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initWithOperator_forService_withBlock__classDebugEnabled_26 = result;
  return result;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forServiceClass:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  PLIOKitOperatorComposition *v10;
  uint64_t v11;
  id operatorBlock;
  IONotificationPort *ioNotifyPort;
  const __CFDictionary *v14;
  mach_error_t v15;
  const char *v16;
  io_object_t v17;
  FILE *v18;
  char *v19;
  PLIOKitOperatorComposition *v20;
  io_iterator_t notification;

  v8 = a4;
  v9 = a5;
  v10 = -[PLIOKitOperatorComposition initWithOperator:forServiceClass:](self, "initWithOperator:forServiceClass:", a3, v8);
  if (!v10)
  {
LABEL_9:
    v20 = v10;
    goto LABEL_10;
  }
  v11 = MEMORY[0x1BCC9EB70](v9);
  operatorBlock = v10->_operatorBlock;
  v10->_operatorBlock = (id)v11;

  v10->_notificationRef = 0;
  notification = 0;
  ioNotifyPort = v10->_ioNotifyPort;
  v14 = IOServiceMatching((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  v15 = IOServiceAddMatchingNotification(ioNotifyPort, "IOServiceFirstPublish", v14, (IOServiceMatchingCallback)eventManagerMatching, v10->_ioNotifyPort, &notification);
  if (!v15)
  {
    v16 = "could not register for IOAccessoryManager interest: %s\n";
    while (1)
    {
      v17 = IOIteratorNext(notification);
      v10->_service = v17;
      if (!v17)
        break;
      v15 = IOServiceAddInterestNotification(-[PLIOKitOperatorComposition ioNotifyPort](v10, "ioNotifyPort"), -[PLIOKitOperatorComposition service](v10, "service"), "IOGeneralInterest", (IOServiceInterestCallback)ioCallBack, v10, &v10->_notificationRef);
      if (v15)
        goto LABEL_7;
    }
    IOObjectRelease(notification);
    goto LABEL_9;
  }
  v16 = "could not register for IOAccessoryManager matching: %s\n";
LABEL_7:
  v18 = (FILE *)*MEMORY[0x1E0C80C10];
  v19 = mach_error_string(v15);
  fprintf(v18, v16, v19);
  v20 = 0;
LABEL_10:

  return v20;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forDynamicServiceClass:(id)a4 forNotificationType:(char)a5[128] withMatchBlock:(id)a6
{
  id v10;
  id v11;
  PLIOKitOperatorComposition *v12;
  uint64_t v13;
  id matchBlock;
  id v15;
  CFMutableDictionaryRef v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  PLIOKitOperatorComposition *v22;

  v10 = a6;
  v11 = a4;
  v12 = -[PLIOKitOperatorComposition initWithOperator:forServiceClass:](self, "initWithOperator:forServiceClass:", a3, v11);
  v13 = MEMORY[0x1BCC9EB70](v10);

  matchBlock = v12->_matchBlock;
  v12->_matchBlock = (id)v13;

  v12->_notificationRef = 0;
  v15 = objc_retainAutorelease(v11);
  v16 = IOServiceMatching((const char *)objc_msgSend(v15, "UTF8String"));
  LODWORD(v10) = objc_msgSend(v15, "isEqualToString:", CFSTR("AFKEndpointInterface"));

  if ((_DWORD)v10)
  {
    if (+[PLPlatform kPLDeviceClassIsOneOf:](PLPlatform, "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0))
    {
      v17 = &unk_1E6AF71B0;
    }
    else
    {
      v17 = &unk_1E6AF71D8;
    }
    -[__CFDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, CFSTR("IOPropertyMatch"));
    -[__CFDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", CFSTR("powerlog-service"), CFSTR("IONameMatch"));
  }
  if (IOServiceAddMatchingNotification(v12->_ioNotifyPort, a5, v16, (IOServiceMatchingCallback)applyIOIterator, v12, &v12->_iterator))
  {
    _os_assumes_log();
  }
  else
  {
    -[PLIOKitOperatorComposition operator](v12, "operator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __105__PLIOKitOperatorComposition_initWithOperator_forDynamicServiceClass_forNotificationType_withMatchBlock___block_invoke;
    block[3] = &unk_1E6A52050;
    v22 = v12;
    dispatch_async(v19, block);

  }
  return v12;
}

void __105__PLIOKitOperatorComposition_initWithOperator_forDynamicServiceClass_forNotificationType_withMatchBlock___block_invoke(uint64_t a1)
{
  applyIOIterator(*(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "iterator"));
}

- (id)propertiesFromIOEntry:(unsigned int)a3 forKey:(id)a4
{
  return +[PLIOKitOperatorComposition snapshotFromIOEntry:forKey:](PLIOKitOperatorComposition, "snapshotFromIOEntry:forKey:", *(_QWORD *)&a3, a4);
}

- (id)propertiesForKeys:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  +[PLIOKitOperatorComposition snapshotFromIOEntry:forKeys:](PLIOKitOperatorComposition, "snapshotFromIOEntry:forKeys:", -[PLIOKitOperatorComposition service](self, "service"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)propertiesForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PLIOKitOperatorComposition propertiesFromIOEntry:forKey:](self, "propertiesFromIOEntry:forKey:", -[PLIOKitOperatorComposition service](self, "service"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (IONotificationPort)ioNotifyPort
{
  return self->_ioNotifyPort;
}

- (void)setIoNotifyPort:(IONotificationPort *)a3
{
  self->_ioNotifyPort = a3;
}

- (unsigned)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(unsigned int)a3
{
  self->_notificationRef = a3;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)serviceClassName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceClassName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unsigned)iterator
{
  return self->_iterator;
}

- (void)setIterator:(unsigned int)a3
{
  self->_iterator = a3;
}

- (unsigned)conn
{
  return self->_conn;
}

- (void)setConn:(unsigned int)a3
{
  self->_conn = a3;
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (void)setMatchBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setOperator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong(&self->_matchBlock, 0);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_serviceClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)initWithOperator:(uint64_t)a3 forService:(uint64_t)a4 withBlock:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

@end
