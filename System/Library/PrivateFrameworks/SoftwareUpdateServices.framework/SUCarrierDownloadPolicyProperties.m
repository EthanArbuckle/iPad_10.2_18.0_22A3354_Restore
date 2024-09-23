@implementation SUCarrierDownloadPolicyProperties

- (SUCarrierDownloadPolicyProperties)init
{
  NSMutableDictionary *v2;
  NSMutableDictionary *keyMap;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v26;
  id obj;
  SUCarrierDownloadPolicyProperties *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _QWORD v35[11];

  v35[9] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)SUCarrierDownloadPolicyProperties;
  v28 = -[SUCarrierDownloadPolicyProperties init](&v33, sel_init);
  if (v28)
  {
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    keyMap = v28->_keyMap;
    v28->_keyMap = v2;

    v35[0] = CFSTR("SoftwareUpdateOptInRequired");
    v35[1] = CFSTR("AllowDownloadOverCellular");
    v35[2] = CFSTR("AllowDownloadOver2G");
    v35[3] = CFSTR("DaysToWaitForCellularDownload");
    v35[4] = CFSTR("AllowAutomaticDownloadOverCellular");
    v35[5] = CFSTR("MaxBytesOverCellular");
    v35[6] = CFSTR("PeakStartTime");
    v35[7] = CFSTR("PeakEndTime");
    v35[8] = CFSTR("AllowEnhancedDownloadOnNRHDM");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CTDataDelegate sharedInstance](CTDataDelegate, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getPreferredDataSubscriptionContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 2);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v26 = v4;
      obj = v4;
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v30;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v30 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18);
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("OTASoftwareUpdate"), v19, 0);
            +[CTDataDelegate sharedInstance](CTDataDelegate, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "getCTClient");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v22, "copyCarrierBundleValueWithDefault:keyHierarchy:bundleType:error:", v6, v20, v14, 0);

            if (v23)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v28->_keyMap, "setObject:forKeyedSubscript:", v23, v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v16);
      }

      v4 = v26;
    }
    else
    {
      SULogInfo(CFSTR("Failed to get preferred CTXPCServiceSubscriptionContext"), v7, v8, v9, v10, v11, v12, v13, v25);
    }

  }
  return v28;
}

- (BOOL)isDownloadFree
{
  return !-[SUCarrierDownloadPolicyProperties _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("SoftwareUpdateOptInRequired"), 0);
}

- (BOOL)isDownloadAllowable
{
  return -[SUCarrierDownloadPolicyProperties _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("AllowDownloadOverCellular"), 1);
}

- (BOOL)isDownloadAllowableOver2G
{
  return -[SUCarrierDownloadPolicyProperties _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("AllowDownloadOver2G"), 0);
}

- (BOOL)isAutoDownloadAllowable
{
  return -[SUCarrierDownloadPolicyProperties _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("AllowAutomaticDownloadOverCellular"), 0);
}

- (int64_t)maximumDownloadSizeInBytes
{
  int64_t result;

  result = -[SUCarrierDownloadPolicyProperties _longLongForKey:defaultValue:](self, "_longLongForKey:defaultValue:", CFSTR("MaxBytesOverCellular"), -1);
  if (result < 0)
    return -1;
  return result;
}

- (unint64_t)numberOfDaysToWaitForCellularDownload
{
  uint64_t v2;

  v2 = -[SUCarrierDownloadPolicyProperties _integerForKey:defaultValue:](self, "_integerForKey:defaultValue:", CFSTR("DaysToWaitForCellularDownload"), 0);
  if ((v2 & (unint64_t)~(v2 >> 63)) >= 0x1C)
    return 28;
  else
    return v2 & ~(v2 >> 63);
}

- (int64_t)peakStartHour
{
  int64_t v3;

  v3 = -[SUCarrierDownloadPolicyProperties _integerForKey:defaultValue:](self, "_integerForKey:defaultValue:", CFSTR("PeakStartTime"), -1);
  if (-[SUCarrierDownloadPolicyProperties _isValidHour:](self, "_isValidHour:", v3))
    return v3;
  else
    return -1;
}

- (int64_t)peakEndHour
{
  int64_t v3;

  v3 = -[SUCarrierDownloadPolicyProperties _integerForKey:defaultValue:](self, "_integerForKey:defaultValue:", CFSTR("PeakEndTime"), -1);
  if (-[SUCarrierDownloadPolicyProperties _isValidHour:](self, "_isValidHour:", v3))
    return v3;
  else
    return -1;
}

- (BOOL)allowInexpensiveHDMUnlimited
{
  return -[SUCarrierDownloadPolicyProperties _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("AllowEnhancedDownloadOnNRHDM"), 1);
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  const __CFString *v11;
  const __CFString *v13;
  void *v14;

  v14 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUCarrierDownloadPolicyProperties isDownloadFree](self, "isDownloadFree"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v13 = v3;
  if (-[SUCarrierDownloadPolicyProperties isDownloadAllowable](self, "isDownloadAllowable"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (-[SUCarrierDownloadPolicyProperties isDownloadAllowableOver2G](self, "isDownloadAllowableOver2G"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUCarrierDownloadPolicyProperties isAutoDownloadAllowable](self, "isAutoDownloadAllowable"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = -[SUCarrierDownloadPolicyProperties maximumDownloadSizeInBytes](self, "maximumDownloadSizeInBytes");
  v8 = -[SUCarrierDownloadPolicyProperties numberOfDaysToWaitForCellularDownload](self, "numberOfDaysToWaitForCellularDownload");
  v9 = -[SUCarrierDownloadPolicyProperties peakStartHour](self, "peakStartHour");
  v10 = -[SUCarrierDownloadPolicyProperties peakEndHour](self, "peakEndHour");
  if (-[SUCarrierDownloadPolicyProperties allowInexpensiveHDMUnlimited](self, "allowInexpensiveHDMUnlimited"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  return (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("SUDownloadPolicy <%p>:\n            \tisDownloadFree: %@\n            \tisDownloadAllowable: %@\n            \tisDownloadAllowableOver2G: %@\n            \tisAutoDownloadAllowable: %@\n            \tmaximumDownloadSizeInBytes: %llu\n            \tnumberOfDaysToWaitForCellularDownload: %lu\n            \tpeakStartHour: %ld\n            \tpeakEndHour: %ld\n            \tAllowEnhancedDownloadOnNRHDM: %@\n"), self, v13, v4, v5, v6, v7, v8, v9, v10, v11);
}

- (BOOL)_isValidHour:(int64_t)a3
{
  return (unint64_t)a3 < 0x18;
}

- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  -[SUCarrierDownloadPolicyProperties _numberForKey:](self, "_numberForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (int64_t)_longLongForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[SUCarrierDownloadPolicyProperties _numberForKey:](self, "_numberForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "longLongValue");

  return a4;
}

- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[SUCarrierDownloadPolicyProperties _numberForKey:](self, "_numberForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "unsignedIntegerValue");

  return a4;
}

- (int64_t)_integerForKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;
  void *v6;

  -[SUCarrierDownloadPolicyProperties _numberForKey:](self, "_numberForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (id)_numberForKey:(id)a3
{
  void *v3;
  id v4;

  -[NSMutableDictionary objectForKey:](self->_keyMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMap, 0);
}

@end
