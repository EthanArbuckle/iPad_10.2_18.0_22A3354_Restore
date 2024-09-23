@implementation PLIOHIDOperatorComposition

- (PLIOHIDOperatorComposition)initWithOperator:(id)a3 forService:(id)a4
{
  id v7;
  id v8;
  PLIOHIDOperatorComposition *v9;
  void *v10;
  void *v11;
  CFArrayRef v12;
  NSArray *serviceClients;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  PLIOHIDOperatorComposition *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t block;
  uint64_t v48;
  BOOL (*v49)(uint64_t);
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  objc_super v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v53.receiver = self;
  v53.super_class = (Class)PLIOHIDOperatorComposition;
  v9 = -[PLIOHIDOperatorComposition init](&v53, sel_init);
  if (!v9)
  {
LABEL_13:
    v31 = v9;
    goto LABEL_22;
  }
  if (initWithOperator_forService__onceToken != -1)
    dispatch_once(&initWithOperator_forService__onceToken, &__block_literal_global_1);
  objc_storeStrong((id *)&v9->_operator, a3);
  objc_storeStrong((id *)&v9->_serviceName, a4);
  v9->_eventSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  v55[0] = &unk_1E6ABAA30;
  v54[0] = CFSTR("PrimaryUsagePage");
  v54[1] = CFSTR("PrimaryUsage");
  objc_msgSend((id)serviceIDs, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  IOHIDEventSystemClientSetMatching();
  v12 = IOHIDEventSystemClientCopyServices(v9->_eventSystemClient);
  serviceClients = v9->_serviceClients;
  v9->_serviceClients = (NSArray *)v12;

  v14 = -[NSArray count](v9->_serviceClients, "count");
  v15 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v14)
  {
    if (v15)
    {
      v16 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v48 = 3221225472;
      v49 = __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_27;
      v50 = &__block_descriptor_40_e5_v8__0lu32l8;
      v51 = v16;
      if (initWithOperator_forService__defaultOnce_25 != -1)
        dispatch_once(&initWithOperator_forService__defaultOnce_25, &block);
      if (initWithOperator_forService__classDebugEnabled_26)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        -[PLOperator className](v9->_operator, "className");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[NSArray count](v9->_serviceClients, "count");
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: %luu clients for %@"), v18, v19, v8, block, v48, v49, v50, v51);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOHIDOperatorComposition.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIOHIDOperatorComposition initWithOperator:forService:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v22, v23, 52);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[PLIOHIDOperatorComposition initWithOperator:forService:].cold.1((uint64_t)v20, v24, v25, v26, v27, v28, v29, v30);

      }
    }

    goto LABEL_13;
  }
  if (v15)
  {
    v32 = objc_opt_class();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_19;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v32;
    if (initWithOperator_forService__defaultOnce != -1)
      dispatch_once(&initWithOperator_forService__defaultOnce, v52);
    if (initWithOperator_forService__classDebugEnabled)
    {
      v33 = (void *)MEMORY[0x1E0CB3940];
      -[PLOperator className](v9->_operator, "className");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@: no clients for %@"), v34, v8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOHIDOperatorComposition.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIOHIDOperatorComposition initWithOperator:forService:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v37, v38, 49);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[PLIOHIDOperatorComposition initWithOperator:forService:].cold.1((uint64_t)v35, v39, v40, v41, v42, v43, v44, v45);

    }
  }

  v31 = 0;
LABEL_22:

  return v31;
}

void __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("AmbientLightSensor");
  v2[1] = CFSTR("AmbientLightSensorLevel");
  v3[0] = &unk_1E6ABAA00;
  v3[1] = &unk_1E6ABAA18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceIDs;
  serviceIDs = v0;

}

BOOL __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_19(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initWithOperator_forService__classDebugEnabled = result;
  return result;
}

BOOL __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_27(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initWithOperator_forService__classDebugEnabled_26 = result;
  return result;
}

- (PLIOHIDOperatorComposition)initWithOperator:(id)a3 forService:(id)a4 withBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLIOHIDOperatorComposition *v12;
  PLIOHIDOperatorComposition *v13;
  uint64_t v14;
  id operatorBlock;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PLIOHIDOperatorComposition;
  v12 = -[PLIOHIDOperatorComposition init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operator, a3);
    objc_storeStrong((id *)&v13->_serviceName, a4);
    v14 = MEMORY[0x1BCC9EB70](v11);
    operatorBlock = v13->_operatorBlock;
    v13->_operatorBlock = (id)v14;

    v16 = IOHIDEventSystemClientCreate();
    v13->_eventSystemClient = (__IOHIDEventSystemClient *)v16;
    if (v16)
    {
      objc_msgSend(v9, "workQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      IOHIDEventSystemClientScheduleWithDispatchQueue();

      IOHIDEventSystemClientRegisterPropertyChangedCallback();
    }
  }

  return v13;
}

- (double)doubleForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[5];

  v4 = a3;
  -[PLIOHIDOperatorComposition serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("AmbientLightSensor"));

  -[PLIOHIDOperatorComposition serviceClients](self, "serviceClients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)IOHIDServiceClientCopyEvent();

  if (v8)
  {
    objc_msgSend((id)serviceIDs, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intValue");
    IOHIDEventGetFloatValue();
    v11 = v10;

    CFRelease(v8);
  }
  else
  {
    v11 = -1.0;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v12 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__PLIOHIDOperatorComposition_doubleForKey___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (doubleForKey__defaultOnce != -1)
        dispatch_once(&doubleForKey__defaultOnce, block);
      if (doubleForKey__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we have no event"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOHIDOperatorComposition.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIOHIDOperatorComposition doubleForKey:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 88);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLIOHIDOperatorComposition initWithOperator:forService:].cold.1((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);

      }
    }
  }

  return v11;
}

BOOL __43__PLIOHIDOperatorComposition_doubleForKey___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  doubleForKey__classDebugEnabled = result;
  return result;
}

- (id)dictionaryForKey:(id)a3
{
  __CFString *v4;
  void *v5;
  CFTypeID v6;

  v4 = (__CFString *)a3;
  v5 = (void *)IOHIDEventSystemClientCopyProperty(-[PLIOHIDOperatorComposition eventSystemClient](self, "eventSystemClient"), v4);

  if (v5)
  {
    v6 = CFGetTypeID(v5);
    if (v6 != CFDictionaryGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *eventSystemClient;
  objc_super v4;

  eventSystemClient = self->_eventSystemClient;
  if (eventSystemClient)
    CFRelease(eventSystemClient);
  v4.receiver = self;
  v4.super_class = (Class)PLIOHIDOperatorComposition;
  -[PLIOHIDOperatorComposition dealloc](&v4, sel_dealloc);
}

- (__IOHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_eventSystemClient = a3;
}

- (NSArray)serviceClients
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PLOperator)operator
{
  return (PLOperator *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOperator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceClients, 0);
}

- (void)initWithOperator:(uint64_t)a3 forService:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
