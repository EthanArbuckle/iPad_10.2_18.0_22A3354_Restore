@implementation WFScanRequest

+ (id)scanRequestForSSID:(id)a3 channels:(id)a4
{
  id v5;
  id v6;
  WFScanRequest *v7;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t v11[16];

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = -[WFScanRequest initWithSSID:channels:]([WFScanRequest alloc], "initWithSSID:channels:", v5, v6);
  }
  else
  {
    WFLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_219FC8000, v9, v10, "Missing SSID for directed scan", v11, 2u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)scanRequestForChannels:(id)a3
{
  id v3;
  WFScanRequest *v4;

  v3 = a3;
  v4 = -[WFScanRequest initWithSSID:channels:]([WFScanRequest alloc], "initWithSSID:channels:", 0, v3);

  return v4;
}

- (WFScanRequest)initWithSSID:(id)a3 channels:(id)a4
{
  id v7;
  id v8;
  WFScanRequest *v9;
  WFScanRequest *v10;
  uint64_t v11;
  NSUUID *UUID;
  NSObject *v14;
  os_log_type_t v15;
  __int16 v16[8];
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFScanRequest;
  v9 = -[WFScanRequest init](&v17, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_10:

    v10 = 0;
    goto LABEL_4;
  }
  if (!v8)
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      v16[0] = 0;
      _os_log_impl(&dword_219FC8000, v14, v15, "Missing channel array for scan request", (uint8_t *)v16, 2u);
    }

    goto LABEL_10;
  }
  objc_storeStrong((id *)&v9->_ssid, a3);
  objc_storeStrong((id *)&v10->_channels, a4);
  v10->_channelListIncludesTwoFour = -[WFScanRequest _channelListIncludesTwoFour:](v10, "_channelListIncludesTwoFour:", v8);
  v10->_rssiThreshold = -80;
  v10->_dwellTime = 0;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = objc_claimAutoreleasedReturnValue();
  UUID = v10->_UUID;
  v10->_UUID = (NSUUID *)v11;

  *(_WORD *)&v10->_applyRssiThresholdFilter = 1;
  v10->_lowPriorityScan = 0;
LABEL_4:

  return v10;
}

- (WFScanRequest)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFScanRequest init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)scanParameters
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id obj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[WFScanRequest _defaultScanDictionary](self, "_defaultScanDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[WFScanRequest channels](self, "channels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v23[0] = CFSTR("CHANNEL");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "channel"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = CFSTR("CHANNEL_FLAGS");
        v24[0] = v8;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "flags"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v4);
  }

  objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("SCAN_CHANNELS"));
  -[WFScanRequest ssid](self, "ssid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFScanRequest ssid](self, "ssid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("SSID_STR"));

  }
  if (!-[WFScanRequest applyRssiThresholdFilter](self, "applyRssiThresholdFilter"))
  {
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("SCAN_RSSI_THRESHOLD"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v13, CFSTR("SCAN_RSSI_THRESHOLD"));

  }
  if (-[WFScanRequest dwellTime](self, "dwellTime"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFScanRequest dwellTime](self, "dwellTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("SCAN_DWELL_TIME"));

  }
  if (-[WFScanRequest includeBSSList](self, "includeBSSList"))
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SCAN_INC_BSS_LIST"));
  if (-[WFScanRequest lowPriorityScan](self, "lowPriorityScan"))
    objc_msgSend(v16, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SCAN_LOW_PRIORITY"));

  return v16;
}

- (id)_defaultScanDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("SCAN_MERGE"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("MONITOR_QBSS_LOAD"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("SCAN_TYPE"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("SCAN_NUM_SCANS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WFScanRequest rssiThreshold](self, "rssiThreshold"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("SCAN_RSSI_THRESHOLD"));

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFScanRequest ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("directed");
  else
    v7 = CFSTR("broadcast");
  -[WFScanRequest UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringToIndex:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFScanRequest channels](self, "channels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFScanRequest _channelListFromArrayOfChannels:](self, "_channelListFromArrayOfChannels:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p type='%@' uuid='%@' channels=[%@]"), v5, self, v7, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[WFScanRequest applyRssiThresholdFilter](self, "applyRssiThresholdFilter"))
    objc_msgSend(v13, "appendString:", CFSTR(" rssiFilter=0"));
  if (-[WFScanRequest dwellTime](self, "dwellTime"))
    objc_msgSend(v13, "appendFormat:", CFSTR(" dwellTime=%lu"), -[WFScanRequest dwellTime](self, "dwellTime"));
  if (-[WFScanRequest lowPriorityScan](self, "lowPriorityScan"))
    objc_msgSend(v13, "appendString:", CFSTR(" lowPriority=1"));
  objc_msgSend(v13, "appendString:", CFSTR(">"));
  return v13;
}

- (id)_channelListFromArrayOfChannels:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "appendFormat:", CFSTR("%d"), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "channel"));
        if (v8 + 1 + v10 < (unint64_t)objc_msgSend(v5, "count"))
          objc_msgSend(v4, "appendString:", CFSTR(","));
        ++v10;
      }
      while (v7 != v10);
      v8 += v7;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)cScanParameters
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = objc_alloc_init(MEMORY[0x24BE29F28]);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[WFScanRequest channels](self, "channels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__WFScanRequest_cScanParameters__block_invoke;
  v8[3] = &unk_24DC360D0;
  v8[4] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(v3, "setChannels:", v10[5]);
  objc_msgSend(v3, "setMergeScanResults:", 1);
  objc_msgSend(v3, "setScanType:", 1);
  objc_msgSend(v3, "setNumberOfScans:", 1);
  objc_msgSend(v3, "setMinimumRSSI:", -[WFScanRequest rssiThreshold](self, "rssiThreshold"));
  -[WFScanRequest ssid](self, "ssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFScanRequest ssid](self, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSSID:", v6);

  }
  if (!-[WFScanRequest applyRssiThresholdFilter](self, "applyRssiThresholdFilter"))
    objc_msgSend(v3, "setMinimumRSSI:", 0);
  if (-[WFScanRequest dwellTime](self, "dwellTime"))
    objc_msgSend(v3, "setDwellTime:", -[WFScanRequest dwellTime](self, "dwellTime"));
  objc_msgSend(v3, "setANQPElementIDListForPasspointScanResults:", &unk_24DC5DCA8);
  objc_msgSend(v3, "setIncludeMatchingKnownNetworkProfiles:", 1);
  _Block_object_dispose(&v9, 8);

  return v3;
}

void __32__WFScanRequest_cScanParameters__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BE29F08];
  v4 = a2;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setChannel:", objc_msgSend(v4, "channel"));
  v5 = objc_msgSend(v4, "flags");

  objc_msgSend(v6, "setFlags:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);

}

- (BOOL)_channelListIncludesTwoFour:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = a3;
  v4 = v3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (v3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__WFScanRequest__channelListIncludesTwoFour___block_invoke;
    v7[3] = &unk_24DC360D0;
    v7[4] = &v8;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

unint64_t __45__WFScanRequest__channelListIncludesTwoFour___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(a2, "channel");
  if (result <= 0xC)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)applyRssiThresholdFilter
{
  return self->_applyRssiThresholdFilter;
}

- (void)setApplyRssiThresholdFilter:(BOOL)a3
{
  self->_applyRssiThresholdFilter = a3;
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

- (void)setDwellTime:(unint64_t)a3
{
  self->_dwellTime = a3;
}

- (BOOL)includeBSSList
{
  return self->_includeBSSList;
}

- (void)setIncludeBSSList:(BOOL)a3
{
  self->_includeBSSList = a3;
}

- (BOOL)lowPriorityScan
{
  return self->_lowPriorityScan;
}

- (void)setLowPriorityScan:(BOOL)a3
{
  self->_lowPriorityScan = a3;
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
  objc_storeStrong((id *)&self->_channels, a3);
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_rssiThreshold = a3;
}

- (BOOL)channelListIncludesTwoFour
{
  return self->_channelListIncludesTwoFour;
}

- (void)setChannelListIncludesTwoFour:(BOOL)a3
{
  self->_channelListIncludesTwoFour = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
