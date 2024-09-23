@implementation TSgPTPPort

- (TSgPTPPort)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TSgPTPPort init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Do not call %@"), v5);

  return 0;
}

+ (id)gPTPPortWithImplDC:(id)a3
{
  id v3;
  unsigned int v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "portType");
  if (v4 > 8 || (v5 = (void *)objc_msgSend(objc_alloc(*off_1E694B400[v4]), "initWithImplDC:", v3)) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[TSgPTPPort gPTPPortWithImplDC:].cold.1(v3);
    v5 = 0;
  }

  return v5;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  void *v4;
  void *v5;

  +[_TSF_TSDgPTPPort gPTPPortWithClockIdentifier:portNumber:](_TSF_TSDgPTPPort, "gPTPPortWithClockIdentifier:portNumber:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSgPTPPort gPTPPortWithImplDC:](TSgPTPPort, "gPTPPortWithImplDC:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (TSgPTPPort)initWithClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  void *v5;
  TSgPTPPort *v6;

  +[_TSF_TSDgPTPPort gPTPPortWithClockIdentifier:portNumber:](_TSF_TSDgPTPPort, "gPTPPortWithClockIdentifier:portNumber:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TSgPTPPort initWithImplDC:](self, "initWithImplDC:", v5);

  return v6;
}

- (TSgPTPPort)initWithImplDC:(id)a3
{
  id v5;
  TSgPTPPort *v6;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "[portImpl isKindOfClass:[TSDgPTPPort class]]";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      v20 = 1024;
      v21 = 135;
      v8 = MEMORY[0x1E0C81028];
LABEL_10:
      _os_log_impl(&dword_1B56CB000, v8, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_11:

    self = 0;
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSgPTPPort;
  v6 = -[TSgPTPPort init](&v9, sel_init);
  self = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_impl, a3);
      goto LABEL_5;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "portImpl != nil";
      v12 = 2048;
      v13 = 0;
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      v20 = 1024;
      v21 = 141;
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_5:

  return self;
}

- (void)dealloc
{
  objc_super v3;

  -[_TSF_TSDgPTPPort finalizeNotifications](self->_impl, "finalizeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)TSgPTPPort;
  -[TSgPTPPort dealloc](&v3, sel_dealloc);
}

- (void)updateProperties
{
  -[_TSF_TSDgPTPPort updateProperties](self->_impl, "updateProperties");
}

- (BOOL)startAutomaticPropertyUpdates
{
  return -[_TSF_TSDgPTPPort startAutomaticPropertyUpdates](self->_impl, "startAutomaticPropertyUpdates");
}

- (BOOL)stopAutomaticPropertyUpdates
{
  return -[_TSF_TSDgPTPPort stopAutomaticPropertyUpdates](self->_impl, "stopAutomaticPropertyUpdates");
}

+ (id)keyPathsForValuesAffectingPortNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.portNumber"), 0);
}

- (unsigned)portNumber
{
  return -[_TSF_TSDgPTPPort portNumber](self->_impl, "portNumber");
}

+ (id)keyPathsForValuesAffectingPortRole
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.portRole"), 0);
}

- (int)portRole
{
  return -[_TSF_TSDgPTPPort portRole](self->_impl, "portRole");
}

+ (id)keyPathsForValuesAffectingClockIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.clockIdentifier"), 0);
}

- (unint64_t)clockIdentifier
{
  return -[_TSF_TSDgPTPPort clockIdentifier](self->_impl, "clockIdentifier");
}

+ (id)keyPathsForValuesAffectingPortType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.portType"), 0);
}

- (int)portType
{
  return -[_TSF_TSDgPTPPort portType](self->_impl, "portType");
}

+ (id)keyPathsForValuesAffectingPropertyUpdateQueue
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.propertyUpdateQueue"), 0);
}

- (void)setPropertyUpdateQueue:(id)a3
{
  -[_TSF_TSDgPTPPort setPropertyUpdateQueue:](self->_impl, "setPropertyUpdateQueue:", a3);
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return -[_TSF_TSDgPTPPort propertyUpdateQueue](self->_impl, "propertyUpdateQueue");
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ClassName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@+%@\n"), v6, v8);

  objc_msgSend(v7, "appendFormat:", CFSTR("%@    Port Number: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PortNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v7, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v9, "unsignedShortValue"));
  else
    objc_msgSend(v7, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    Port Role: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PortRole"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    switch(objc_msgSend(v11, "intValue"))
    {
      case 0u:
        v12 = CFSTR("Disabled\n");
        goto LABEL_12;
      case 1u:
        v12 = CFSTR("Passive\n");
        goto LABEL_12;
      case 2u:
        v12 = CFSTR("Slave\n");
        goto LABEL_12;
      case 3u:
        v12 = CFSTR("Master\n");
        goto LABEL_12;
      default:
        objc_msgSend(v7, "appendFormat:", CFSTR("Unknown (%d)\n"), objc_msgSend(v11, "intValue"));
        break;
    }
  }
  else
  {
    v12 = CFSTR("Could not read property\n");
LABEL_12:
    objc_msgSend(v7, "appendString:", v12);
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@    Port Type: "), v6);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PortType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    switch(objc_msgSend(v13, "intValue"))
    {
      case 1u:
        v14 = CFSTR("AVB Ethernet\n");
        goto LABEL_17;
      case 2u:
        v14 = CFSTR("Unicast Point-to-Point Link Layer\n");
        goto LABEL_17;
      case 3u:
        v14 = CFSTR("Unicast Point-to-Point UDPv4\n");
        goto LABEL_17;
      case 4u:
        v14 = CFSTR("Unicast Point-to-Point UDPv6\n");
        goto LABEL_17;
      case 5u:
        v14 = CFSTR("Unicast End-to-End Link Layer\n");
        goto LABEL_17;
      case 6u:
        v14 = CFSTR("Unicast End-to-End UDPv4\n");
        goto LABEL_17;
      case 7u:
        v14 = CFSTR("Unicast End-to-End UDPv6\n");
        goto LABEL_17;
      case 8u:
        v14 = CFSTR("Local Clock\n");
        goto LABEL_17;
      default:
        objc_msgSend(v7, "appendFormat:", CFSTR("Unknown (%d)\n"), objc_msgSend(v13, "intValue"));
        break;
    }
  }
  else
  {
    v14 = CFSTR("Could not read property\n");
LABEL_17:
    objc_msgSend(v7, "appendString:", v14);
  }

  return v7;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return +[_TSF_TSDgPTPPort diagnosticInfoForClockIdentifier:andPortNumber:](_TSF_TSDgPTPPort, "diagnosticInfoForClockIdentifier:andPortNumber:", a3, a4);
}

- (id)getMetrics
{
  void *v2;
  TSPortMetrics *v3;

  -[_TSF_TSDgPTPPort getMetrics](self->_impl, "getMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[TSPortMetrics initWithDaemonMetrics:]([TSPortMetrics alloc], "initWithDaemonMetrics:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)getMetricsWithDelta:(id)a3
{
  _TSF_TSDgPTPPort *impl;
  void *v4;
  void *v5;
  TSPortMetrics *v6;

  impl = self->_impl;
  objc_msgSend(a3, "toDaemonMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPPort getMetricsWithDelta:](impl, "getMetricsWithDelta:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = -[TSPortMetrics initWithDaemonMetrics:]([TSPortMetrics alloc], "initWithDaemonMetrics:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

+ (void)gPTPPortWithImplDC:(void *)a1 .cold.1(void *a1)
{
  objc_class *v2;
  id v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = 136315650;
  v5 = objc_msgSend(v3, "UTF8String");
  v6 = 2048;
  v7 = objc_opt_class();
  v8 = 1024;
  v9 = objc_msgSend(a1, "portType");
  _os_log_error_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create port for %s %p %u", (uint8_t *)&v4, 0x1Cu);

}

@end
