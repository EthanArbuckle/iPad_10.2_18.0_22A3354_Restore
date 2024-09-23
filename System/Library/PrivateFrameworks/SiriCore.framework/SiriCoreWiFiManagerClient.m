@implementation SiriCoreWiFiManagerClient

- (SiriCoreWiFiManagerClient)init
{
  SiriCoreWiFiManagerClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriCoreWiFiManagerClient;
  result = -[SiriCoreWiFiManagerClient init](&v3, sel_init);
  if (result)
    result->_type = 0;
  return result;
}

- (void)dealloc
{
  __WiFiManagerClient *primitiveWiFiManagerClient;
  objc_super v4;

  primitiveWiFiManagerClient = self->_primitiveWiFiManagerClient;
  if (primitiveWiFiManagerClient)
    CFRelease(primitiveWiFiManagerClient);
  v4.receiver = self;
  v4.super_class = (Class)SiriCoreWiFiManagerClient;
  -[SiriCoreWiFiManagerClient dealloc](&v4, sel_dealloc);
}

- (__WiFiManagerClient)_primitiveWiFiManagerClient
{
  __WiFiManagerClient *result;

  result = self->_primitiveWiFiManagerClient;
  if (!result)
  {
    result = (__WiFiManagerClient *)WiFiManagerClientCreate();
    self->_primitiveWiFiManagerClient = result;
  }
  return result;
}

- (void)_setWiFiManagerClientType:(int)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[SiriCoreWiFiManagerClient _primitiveWiFiManagerClient](self, "_primitiveWiFiManagerClient");
  if (self->_type != a3)
  {
    v5 = *MEMORY[0x24BE08FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[SiriCoreWiFiManagerClient _setWiFiManagerClientType:]";
      v8 = 1024;
      v9 = a3;
      _os_log_impl(&dword_211AB2000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }
    self->_type = a3;
    -[SiriCoreWiFiManagerClient _primitiveWiFiManagerClient](self, "_primitiveWiFiManagerClient");
    WiFiManagerClientSetType();
  }
}

- (BOOL)hasAssociatedNetworkWithRSSI:(int64_t *)a3 andSNR:(int64_t *)a4 andPhyMode:(id *)a5 andChannelInfo:(id *)a6 isCaptive:(BOOL *)a7
{
  return -[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:](self, "hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)hasAssociatedNetworkWithRSSI:(int64_t *)a3 andSNR:(int64_t *)a4 andCCA:(int64_t *)a5 andPhyMode:(id *)a6 andChannelInfo:(id *)a7 isCaptive:(BOOL *)a8
{
  os_log_t *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  const void *v19;
  int64_t IntProperty;
  int64_t v21;
  int64_t v22;
  id v23;
  uint64_t Channel;
  uint64_t OperatingBand;
  const __CFString *v26;
  _BOOL4 v27;
  NSObject *v28;
  id v29;
  uint64_t PhyMode;
  __CFString *v31;
  __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  int64_t rssi;
  int64_t snr;
  int64_t cca;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[14];
  __int16 v44;
  int64_t v45;
  __int16 v46;
  int64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v15 = (os_log_t *)MEMORY[0x24BE08FB8];
  v16 = *MEMORY[0x24BE08FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
    _os_log_impl(&dword_211AB2000, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (a3)
    *a3 = self->_rssi;
  if (a4)
    *a4 = self->_snr;
  if (a5)
    *a5 = self->_cca;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  -[SiriCoreWiFiManagerClient _primitiveWiFiManagerClient](self, "_primitiveWiFiManagerClient");
  v17 = (void *)WiFiManagerClientCopyDevices();
  if (!objc_msgSend(v17, "count")
    || (objc_msgSend(v17, "firstObject"), (v18 = WiFiDeviceClientCopyCurrentNetwork()) == 0))
  {
    v27 = 0;
    goto LABEL_57;
  }
  v19 = (const void *)v18;
  IntProperty = WiFiNetworkGetIntProperty();
  self->_rssi = IntProperty;
  if (a3)
    *a3 = IntProperty;
  v21 = WiFiNetworkGetIntProperty();
  self->_snr = v21;
  if (a4)
    *a4 = v21;
  v22 = WiFiNetworkGetIntProperty();
  self->_cca = v22;
  if (a5)
    *a5 = v22;
  if (a7)
  {
    v23 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("Channel ")));
    *a7 = v23;
    Channel = WiFiNetworkGetChannel();
    if (Channel)
    {
      objc_msgSend(v23, "appendFormat:", CFSTR("%@ ("), Channel);
      OperatingBand = WiFiNetworkGetOperatingBand();
      if ((_DWORD)OperatingBand == 2)
      {
        v26 = CFSTR("5GHz");
      }
      else if ((_DWORD)OperatingBand == 1)
      {
        v26 = CFSTR("2.4GHz");
      }
      else if ((_DWORD)OperatingBand)
      {
        v39 = OperatingBand;
        v26 = CFSTR("[Unknown enum=%u]GHz");
      }
      else
      {
        v26 = CFSTR("?GHz");
      }
      objc_msgSend(v23, "appendFormat:", v26, v39);
      objc_msgSend(v23, "appendFormat:", CFSTR(", %uMHz"), WiFiNetworkGetChannelWidthInMHz());
      objc_msgSend(v23, "appendString:", CFSTR(")"));
    }
    else
    {
      objc_msgSend(v23, "appendFormat:", CFSTR("unknown"));
    }
    v28 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      v29 = *a7;
      *(_DWORD *)buf = 136315394;
      v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
      v42 = 2112;
      *(_QWORD *)v43 = v29;
      _os_log_impl(&dword_211AB2000, v28, OS_LOG_TYPE_DEFAULT, "%s Channel Info: %@", buf, 0x16u);
    }

  }
  if (a6)
  {
    PhyMode = WiFiNetworkGetPhyMode();
    if ((PhyMode & 0x7E) != 0)
    {
      v31 = CFSTR("802.11b");
      if ((PhyMode & 4) == 0)
        v31 = CFSTR("802.11a");
      if ((PhyMode & 0x48) != 0)
        v31 = CFSTR("802.11g");
      if ((PhyMode & 0x10) != 0)
        v31 = CFSTR("802.11n");
      *a6 = v31;
    }
    if ((PhyMode & 0x80) != 0)
    {
      v32 = CFSTR("802.11ac");
    }
    else
    {
      v32 = (__CFString *)*a6;
      if (*a6)
        goto LABEL_52;
      v32 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unknown=0x%04x"), PhyMode);
    }
    *a6 = v32;
LABEL_52:
    v33 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
      v42 = 2112;
      *(_QWORD *)v43 = v32;
      _os_log_impl(&dword_211AB2000, v33, OS_LOG_TYPE_DEFAULT, "%s PhyMode: %@", buf, 0x16u);
    }
  }
  if (a8)
    *a8 = WiFiNetworkIsCaptive() != 0;
  CFRelease(v19);
  v27 = 1;
LABEL_57:
  v34 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    rssi = self->_rssi;
    snr = self->_snr;
    cca = self->_cca;
    *(_DWORD *)buf = 136316162;
    v41 = "-[SiriCoreWiFiManagerClient hasAssociatedNetworkWithRSSI:andSNR:andCCA:andPhyMode:andChannelInfo:isCaptive:]";
    v42 = 1024;
    *(_DWORD *)v43 = v27;
    *(_WORD *)&v43[4] = 2048;
    *(_QWORD *)&v43[6] = rssi;
    v44 = 2048;
    v45 = snr;
    v46 = 2048;
    v47 = cca;
    _os_log_impl(&dword_211AB2000, v34, OS_LOG_TYPE_DEFAULT, "%s Associated: %d RSSI is %ld SNR is %ld CCA is %ld", buf, 0x30u);
  }

  return v27;
}

- (BOOL)isWifiEnabled
{
  -[SiriCoreWiFiManagerClient _primitiveWiFiManagerClient](self, "_primitiveWiFiManagerClient");
  return WiFiManagerClientGetPower() != 0;
}

- (void)releaseWiFiAssertion
{
  -[SiriCoreWiFiManagerClient _setWiFiManagerClientType:](self, "_setWiFiManagerClientType:", 0);
}

- (void)acquireWiFiAssertion:(int64_t)a3
{
  -[SiriCoreWiFiManagerClient _setWiFiManagerClientType:](self, "_setWiFiManagerClientType:", 1);
}

@end
