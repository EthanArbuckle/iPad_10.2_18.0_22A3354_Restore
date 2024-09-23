@implementation AudioAccessoryDeviceConfig

- (AudioAccessoryDeviceConfig)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  AudioAccessoryDeviceConfig *v7;
  int v8;
  int v9;
  int v10;
  AudioAccessoryDeviceConfig *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  uint64_t v17;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AudioAccessoryDeviceConfig;
  v7 = -[AudioAccessoryDeviceConfig init](&v16, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_19;
    v13 = NSErrorF_safe(NSOSStatusErrorDomain, 4294960540, "AADeviceConfig super init failed");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
LABEL_18:
    v11 = 0;
    *a4 = v14;
    goto LABEL_13;
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (!a4)
      goto LABEL_19;
    v15 = NSErrorF_safe(NSOSStatusErrorDomain, 4294960540, "XPC non-dict");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_18;
  }
  v17 = 0;
  v8 = CUXPCDecodeUInt64RangedEx(v6, "aaSt", 0, 0xFFFFFFFFLL, &v17, a4);
  if (v8 == 6)
  {
    v7->_autoANCStrength = v17;
  }
  else if (v8 == 5)
  {
    goto LABEL_19;
  }
  v17 = 0;
  v9 = CUXPCDecodeUInt64RangedEx(v6, "esmt", 0, 255, &v17, a4);
  if (v9 == 6)
  {
    v7->_enableSiriMultitone = v17;
  }
  else if (v9 == 5)
  {
    goto LABEL_19;
  }
  v17 = 0;
  v10 = CUXPCDecodeUInt64RangedEx(v6, "hrmt", 0, 255, &v17, a4);
  if (v10 != 6)
  {
    if (v10 != 5)
      goto LABEL_12;
LABEL_19:
    v11 = 0;
    goto LABEL_13;
  }
  v7->_enableHeartRateMonitor = v17;
LABEL_12:
  v11 = v7;
LABEL_13:

  return v11;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_autoANCStrength = a3;
}

- (unsigned)enableSiriMultitone
{
  return self->_enableSiriMultitone;
}

- (void)setEnableSiriMultitone:(unsigned __int8)a3
{
  self->_enableSiriMultitone = a3;
}

- (unsigned)enableHeartRateMonitor
{
  return self->_enableHeartRateMonitor;
}

- (void)setEnableHeartRateMonitor:(unsigned __int8)a3
{
  self->_enableHeartRateMonitor = a3;
}

@end
