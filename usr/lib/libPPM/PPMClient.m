@implementation PPMClient

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)pushTelemetryToPPM:(__CFDictionary *)a3 error:(id *)a4
{
  void *v6;
  int v7;
  int Count;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  const void *Value;
  const void *v13;
  CFTypeID v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  const char *v19;
  unsigned int v20;
  CFTypeID v21;
  CFTypeID v22;
  unint64_t v23;
  char *v24;
  _DWORD *v25;
  __CFString *v26;
  int valuePtr;
  int v29;
  unsigned int v30;
  _BYTE v31[2560];
  _DWORD v32[20];
  void *values[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *keys[4];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52[32];
  uint64_t v53;
  CFRange v54;

  v53 = *MEMORY[0x24BDAC8D0];
  -[PPMClient identifier](self, "identifier", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPMClient getClientNumber:](self, "getClientNumber:", v6);

  if (v7 == -1)
  {
    NSLog(CFSTR("PPM Error: Unsupported PPM client in pushTelemetry"));
    return 0;
  }
  bzero(&v30, 0xA54uLL);
  v29 = v7;
  Count = CFDictionaryGetCount(a3);
  v9 = Count;
  if (v7 != 7)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    memset(keys, 0, sizeof(keys));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    *(_OWORD *)values = 0u;
    v34 = 0u;
    CFDictionaryGetKeysAndValues(a3, (const void **)keys, (const void **)values);
    v30 = v9;
    if (!v9)
      return -[PPMClientUserClientInterface pushTelemetry:userDictRef:](self->userClient, "pushTelemetry:userDictRef:", self->connect, &v29) == 0;
    v23 = 0;
    v24 = v31;
    v25 = v32;
    v26 = CFSTR("PPM Error: failed to get keys from telemetry\n");
    while (1)
    {
      if (!CFStringGetCString((CFStringRef)keys[v23], v24, 128, 0x600u))
        goto LABEL_29;
      if (!CFNumberGetValue((CFNumberRef)values[v23], kCFNumberIntType, v25))
        break;
      ++v23;
      v24 += 128;
      ++v25;
      if (v23 >= v30)
        return -[PPMClientUserClientInterface pushTelemetry:userDictRef:](self->userClient, "pushTelemetry:userDictRef:", self->connect, &v29) == 0;
    }
    v26 = CFSTR("PPM Error: failed to get values from telemetry\n");
LABEL_29:
    NSLog(&v26->isa);
    return 0;
  }
  if (Count >= 9)
  {
    NSLog(CFSTR("PPM Error: space not enough for telemetry values\n"));
    return 0;
  }
  v10 = 0;
  v30 = 0;
  while (1)
  {
    v11 = *(&kDefinedBasebandTelemetryKeys + v10);
    Value = CFDictionaryGetValue(a3, v11);
    if (Value)
    {
      v13 = Value;
      if (CFStringCompare(v11, CFSTR("kPPMTxHistogram"), 0) || (v14 = CFGetTypeID(v13), v14 != CFArrayGetTypeID()))
      {
        v21 = CFGetTypeID(v13);
        if (v21 == CFNumberGetTypeID())
        {
          CFStringGetCString(v11, &v31[128 * (unint64_t)v30], 128, 0x8000100u);
          CFNumberGetValue((CFNumberRef)v13, kCFNumberIntType, &v32[v30++]);
        }
        else
        {
          v22 = CFGetTypeID(v13);
          NSLog(CFSTR("PPM Error: baseband telemetry key %@ has value of unknown type %ld"), v11, v22);
        }
        goto LABEL_19;
      }
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      *(_OWORD *)values = 0u;
      v34 = 0u;
      v15 = CFArrayGetCount((CFArrayRef)v13);
      v16 = v15;
      if (v15 >= 13)
      {
        NSLog(CFSTR("PPM Error: baseband telemetry histogram too large"));
        return 0;
      }
      v54.length = v15;
      v54.location = 0;
      CFArrayGetValues((CFArrayRef)v13, v54, (const void **)values);
      if (v16 >= 1)
        break;
    }
LABEL_19:
    if (++v10 == 7)
      return -[PPMClientUserClientInterface pushTelemetry:userDictRef:](self->userClient, "pushTelemetry:userDictRef:", self->connect, &v29) == 0;
  }
  v17 = 0;
  while (1)
  {
    valuePtr = 0;
    if (!CFNumberGetValue((CFNumberRef)values[v17], kCFNumberIntType, &valuePtr))
      break;
    if (valuePtr)
    {
      v18 = &v31[128 * (unint64_t)v30];
      v46 = xmmword_2132A11C8;
      v47 = unk_2132A11D8;
      v48 = xmmword_2132A11E8;
      v49 = unk_2132A11F8;
      strcpy((char *)keys, "kPPMTxHistogramBin");
      BYTE3(keys[2]) = unk_2132A119B;
      HIDWORD(keys[2]) = unk_2132A119C;
      keys[3] = (void *)unk_2132A11A0;
      v44 = xmmword_2132A11A8;
      v45 = unk_2132A11B8;
      __sprintf_chk(v52, 0, 0x20uLL, "%d", v17);
      v19 = (const char *)__strcat_chk();
      strcpy(v18, v19);
      v20 = v30;
      v32[v30] = valuePtr;
      v30 = v20 + 1;
    }
    if (v16 == ++v17)
      goto LABEL_19;
  }
  NSLog(CFSTR("PPM Error: failed to get baseband histogram from telemetry"));
  return 0;
}

- (int)getClientNumber:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.duet.ppm-attr.stck")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.duet.ppm-attr.wifi")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.duet.ppm-attr.bsbd")))
  {
    v4 = 7;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (PPMClient)initWithClientIdentifier:(id)a3
{
  id v5;
  PPMClient *v6;
  PPMClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPMClient;
  v6 = -[PPMClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->identifier, a3);

  return v7;
}

+ (id)sharedInstanceWithClientRepresentation:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "sharedInstanceWithClientRepresentation:options:error:", a3, 0, a4);
}

+ (id)sharedInstanceWithClientRepresentation:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__PPMClient_sharedInstanceWithClientRepresentation_options_error___block_invoke;
  block[3] = &unk_24CF81180;
  v11 = v5;
  v6 = sharedInstanceWithClientRepresentation_options_error__onceToken;
  v7 = v5;
  if (v6 != -1)
    dispatch_once(&sharedInstanceWithClientRepresentation_options_error__onceToken, block);
  v8 = (id)sharedInstanceWithClientRepresentation_options_error__sharedInstance;

  return v8;
}

void __66__PPMClient_sharedInstanceWithClientRepresentation_options_error___block_invoke(uint64_t a1)
{
  PPMClient *v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  v1 = -[PPMClient initWithClientIdentifier:]([PPMClient alloc], "initWithClientIdentifier:", *(_QWORD *)(a1 + 32));
  v2 = (void *)sharedInstanceWithClientRepresentation_options_error__sharedInstance;
  sharedInstanceWithClientRepresentation_options_error__sharedInstance = (uint64_t)v1;

  v3 = (void *)sharedInstanceWithClientRepresentation_options_error__sharedInstance;
  if (sharedInstanceWithClientRepresentation_options_error__sharedInstance)
  {
    objc_msgSend((id)sharedInstanceWithClientRepresentation_options_error__sharedInstance, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "setupIOKitUserClientWith:error:", v4, 0);

    if ((v5 & 1) == 0)
    {
      v6 = (void *)sharedInstanceWithClientRepresentation_options_error__sharedInstance;
      sharedInstanceWithClientRepresentation_options_error__sharedInstance = 0;

    }
  }
}

- (BOOL)registerForNotificationsWithError:(id *)a3 handler:(id)a4
{
  id v5;
  NSObject *v6;
  mach_port_t v7;
  const __CFDictionary *v8;
  uint64_t MatchingServices;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  io_iterator_t existing[2];
  _OWORD v19[32];
  _BYTE v20[136];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  *(_QWORD *)existing = 0;
  v6 = dispatch_queue_create("ppmNotificationQueue", 0);
  v7 = *MEMORY[0x24BDD8B18];
  v8 = IOServiceMatching("ApplePPM");
  MatchingServices = IOServiceGetMatchingServices(v7, v8, &existing[1]);
  if ((_DWORD)MatchingServices)
  {
    NSLog(CFSTR("PPM Error:IOServiceGetMatchingServices returned 0x%08x\n\n"), MatchingServices, *(_QWORD *)existing);
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v10 = IOIteratorNext(existing[1]);
  if ((_DWORD)v10)
  {
    v11 = v10;
    while (1)
    {
      memset(v20, 0, 128);
      memset(v19, 0, sizeof(v19));
      if (MEMORY[0x2199AFAC8](v11, v20))
        v20[0] = 0;
      gNotifyPort = (uint64_t)IONotificationPortCreate(v7);
      IONotificationPortSetDispatchQueue((IONotificationPortRef)gNotifyPort, v6);
      v12 = MEMORY[0x2199AFAD4](v11, "IOService", v19);
      if ((_DWORD)v12)
      {
        NSLog(CFSTR("PPM Error:IORegistryEntryGetPath returned 0x%08x.\n"), v12, *(_QWORD *)existing);
        IONotificationPortDestroy((IONotificationPortRef)gNotifyPort);
        goto LABEL_13;
      }
      v13 = IOServiceAddInterestNotification((IONotificationPortRef)gNotifyPort, v11, "IOGeneralInterest", (IOServiceInterestCallback)budgetNotificationCallback, self, existing);
      if ((_DWORD)v13)
        break;
      IOObjectRelease(v11);
      v11 = IOIteratorNext(existing[1]);
      if (!(_DWORD)v11)
        goto LABEL_10;
    }
    NSLog(CFSTR("PPM Error:IOServiceAddInterestNotification returned 0x%08x.\n"), v13, *(_QWORD *)existing);
LABEL_13:
    IOObjectRelease(v11);
    goto LABEL_14;
  }
LABEL_10:
  IOObjectRelease(existing[1]);
  v14 = MEMORY[0x2199AFC30](v5);
  v15 = (void *)handler;
  handler = v14;

  v16 = 1;
LABEL_15:

  return v16;
}

- (BOOL)setupIOKitUserClientWith:(id)a3 error:(id *)a4
{
  id v5;
  mach_port_t v6;
  const __CFDictionary *v7;
  uint64_t MatchingServices;
  BOOL v9;
  io_object_t v11;
  io_service_t v12;
  task_port_t *v13;
  uint64_t v14;
  PPMClientUserClientInterface *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  io_iterator_t existing[2];

  v5 = a3;
  *(_QWORD *)existing = 0;
  v6 = *MEMORY[0x24BDD8B18];
  v7 = IOServiceMatching("ApplePPM");
  MatchingServices = IOServiceGetMatchingServices(v6, v7, existing);
  if (!(_DWORD)MatchingServices)
  {
    v11 = IOIteratorNext(existing[0]);
    if (!v11)
    {
      IOObjectRelease(existing[0]);
      NSLog(CFSTR("PPM Error:No matching driver found\n"));
      goto LABEL_3;
    }
    v12 = v11;
    v13 = (task_port_t *)MEMORY[0x24BDAEC58];
    do
    {
      v14 = IOServiceOpen(v12, *v13, 0, &existing[1]);
      if ((_DWORD)v14)
      {
        NSLog(CFSTR("PPM Error:IOServiceOpen returned 0x%08x\n"), v14);
        IOObjectRelease(v12);
        goto LABEL_3;
      }
      IOObjectRelease(v12);
      v12 = IOIteratorNext(existing[0]);
    }
    while (v12);
    IOObjectRelease(existing[0]);
    v15 = objc_alloc_init(PPMClientUserClientInterface);
    if (v15)
    {
      -[PPMClient setUserClient:](self, "setUserClient:", v15);
      v16 = -[PPMClient getClientNumber:](self, "getClientNumber:", v5);
      if ((_DWORD)v16 == -1)
      {
        NSLog(CFSTR("PPM Error: Unsupported PPM client in setupIOKitUserClient\n"));
      }
      else
      {
        v17 = v16;
        -[PPMClient setIdentifier:](self, "setIdentifier:", v5);
        v18 = -[PPMClientUserClientInterface openPPMUserClient:clientNumber:](self->userClient, "openPPMUserClient:clientNumber:", existing[1], v17);
        if (!(_DWORD)v18)
        {
          -[PPMClient setConnect:](self, "setConnect:", existing[1]);
          v9 = 1;
          goto LABEL_17;
        }
        NSLog(CFSTR("PPM Error: openPPMUserClient returned 0x%08x\n"), v18);
      }
    }
    v9 = 0;
LABEL_17:

    goto LABEL_4;
  }
  NSLog(CFSTR("PPM Error:IOServiceGetMatchingServices returned 0x%08x\n\n"), MatchingServices);
LABEL_3:
  v9 = 0;
LABEL_4:

  return v9;
}

- (BOOL)admissionCheckWithLevel:(id)a3 options:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v8;
  void (**v9)(id, BOOL, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v17;
  int v18;

  v8 = a3;
  v9 = (void (**)(id, BOOL, _QWORD))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = objc_msgSend(v8, "intValue");
  else
    v10 = 1;
  v18 = 0;
  -[PPMClient identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("PPM: admissionCheck for %@, level %d (%@)\n"), v11, v10, v8);

  -[PPMClient identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PPMClient getClientNumber:](self, "getClientNumber:", v12);

  if ((_DWORD)v13 == -1)
  {
    NSLog(CFSTR("PPM Error: Unsupported PPM client in admissionCheck\n"), v17);
    goto LABEL_8;
  }
  v14 = -[PPMClientUserClientInterface admissionCheckOfValuePPM:clientNumber:level:result:](self->userClient, "admissionCheckOfValuePPM:clientNumber:level:result:", self->connect, v13, v10, &v18);
  if ((_DWORD)v14)
  {
    NSLog(CFSTR("PPM Error: AdmissionCheckWithHandler failed with 0x%08x"), v14);
LABEL_8:
    v15 = 0;
    goto LABEL_12;
  }
  if (v9)
    v9[2](v9, v18 != 0, MEMORY[0x24BDBD1B8]);
  v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)activityStoppedWithLevel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 0;
  -[PPMClient identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPMClient getClientNumber:](self, "getClientNumber:", v8);

  if ((_DWORD)v9 == -1)
  {
    NSLog(CFSTR("PPM Error: Unsupported PPM client in activityStopped\n"));
    v10 = 0;
  }
  else
  {
    v10 = -[PPMClientUserClientInterface stopActivity:clientNumber:level:](self->userClient, "stopActivity:clientNumber:level:", self->connect, v9, v7) == 0;
  }

  return v10;
}

- (BOOL)endInteraction:(id *)a3
{
  return 1;
}

- (BOOL)activityStartedWithLevel:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 0;
  -[PPMClient identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PPMClient getClientNumber:](self, "getClientNumber:", v8);

  if ((_DWORD)v9 == -1)
  {
    NSLog(CFSTR("PPM Error: Unsupported PPM client in activityStarted\n"));
    v10 = 0;
  }
  else
  {
    v10 = -[PPMClientUserClientInterface startActivity:clientNumber:level:](self->userClient, "startActivity:clientNumber:level:", self->connect, v9, v7) == 0;
  }

  return v10;
}

- (PPMClientUserClientInterface)userClient
{
  return (PPMClientUserClientInterface *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)connect
{
  return self->connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->connect = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)version
{
  return self->version;
}

- (void)setVersion:(unsigned int)a3
{
  self->version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->userClient, 0);
}

@end
