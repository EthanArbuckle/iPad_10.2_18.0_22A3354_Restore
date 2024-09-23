@implementation WiFiSoftApUsageMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedWiFiSoftApUsageMonitor;
}

void __40__WiFiSoftApUsageMonitor_sharedInstance__block_invoke()
{
  WiFiSoftApUsageMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(WiFiSoftApUsageMonitor);
  v1 = (void *)sharedInstance_sharedWiFiSoftApUsageMonitor;
  sharedInstance_sharedWiFiSoftApUsageMonitor = (uint64_t)v0;

}

- (WiFiSoftApUsageMonitor)init
{
  WiFiSoftApUsageMonitor *v2;
  NSDate *softApOldestActiveTime;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WiFiSoftApUsageMonitor;
  v2 = -[WiFiSoftApUsageMonitor init](&v8, sel_init);
  v2->_statsValid = 0;
  softApOldestActiveTime = v2->_softApOldestActiveTime;
  v2->_softApOldestActiveTime = 0;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create("com.apple.wifi.softap-usage-monitor", v4);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v5;

  -[WiFiSoftApUsageMonitor initStats](v2, "initStats");
  return v2;
}

- (void)initStats:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  _BYTE buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = (void *)v6;
    v9 = 0;
    v10 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v7 = 136315394;
    v17 = v7;
    while (1)
    {
      v11 = v9;
      objc_msgSend(v8, "stringValue", v17, *(_OWORD *)buf, *(_QWORD *)&buf[16], v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("OldestActiveTime")))
            objc_storeStrong((id *)&self->_softApOldestActiveTime, v9);
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("StatsValid")))
          {
            self->_statsValid = objc_msgSend(v9, "BOOLValue");
          }
          else if (objc_msgSend(v12, "isEqualToString:", CFSTR("MaximizeCompatibilityEnabled")))
          {
            self->_compatibilityEnabled = objc_msgSend(v9, "BOOLValue");
          }
          else if (objc_msgSend(v12, "isEqualToString:", CFSTR("MaximizeCompatibilityToggled")))
          {
            self->_compatibilityToggled = objc_msgSend(v9, "BOOLValue");
          }
          else
          {
            v16 = objc_msgSend(v9, "unsignedLongValue");
            if (objc_msgSend(v12, "isEqualToString:", CFSTR("SoftApUpCount")))
            {
              self->_softApUpCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("NoClientConnectedSessionCount")))
            {
              self->_noClientConnectedSessionCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("OnlyAppleClientConnectedSessionCount")))
            {
              self->_onlyAppleClientConnectedSessionCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("OnlyOtherClientConnectedSessionCount")))
            {
              self->_onlyOtherClientConnectedSessionCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("MixClientConnectedSessionCount")))
            {
              self->_mixClientConnectedSessionCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("AppleClientConnectCount")))
            {
              self->_appleClientConnectCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("OtherClientConnectCount")))
            {
              self->_otherClientConnectCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("24GHzSessionCount")))
            {
              self->_twoFourGHzSessionCount = v16;
            }
            else if (objc_msgSend(v12, "isEqualToString:", CFSTR("5GHzSessionCount")))
            {
              self->_fiveGHzSessionCount = v16;
            }
          }
          goto LABEL_15;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          *(_QWORD *)&buf[4] = "-[WiFiSoftApUsageMonitor initStats:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v12;
          v13 = v10;
          v14 = "%s: unexpected value for %@";
          goto LABEL_14;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v17;
        *(_QWORD *)&buf[4] = "-[WiFiSoftApUsageMonitor initStats:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        v13 = v10;
        v14 = "%s: value is null for %@";
LABEL_14:
        _os_log_impl(&dword_1CC44E000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      }
LABEL_15:

      objc_msgSend(v5, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
      if (!v15)
      {

        break;
      }
    }
  }

}

- (void)initStats
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("WiFiHotspotUsageHistory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[WiFiSoftApUsageMonitor initStats:](self, "initStats:", v3);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("time_window=%@, sessionCnt=%lu, noClientSessionCnt=%lu, onlyAppleSessionCnt=%lu, only3rdPartySessionCnt=%lu mixClientSessionCnt=%lu 2.4GHzSessionCnt=%lu 5GHzSessionCnt=%lu appleClientCnt=%lu, otherClientCnt=%lu, compatibilityEnabled=%u, compatibilityToggled=%u"), self->_softApOldestActiveTime, self->_softApUpCount, self->_noClientConnectedSessionCount, self->_onlyAppleClientConnectedSessionCount, self->_onlyOtherClientConnectedSessionCount, self->_mixClientConnectedSessionCount, self->_appleClientConnectCount, self->_otherClientConnectCount, self->_twoFourGHzSessionCount, self->_fiveGHzSessionCount, self->_compatibilityEnabled, self->_compatibilityToggled);
}

- (void)updateStatsInternal:(id)a3
{
  id v4;
  BOOL compatibilityEnabled;
  void *v6;
  NSDate *softApOldestActiveTime;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  compatibilityEnabled = self->_compatibilityEnabled;
  v19 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("MaximizeCompatibilityEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      self->_compatibilityEnabled = objc_msgSend(v6, "BOOLValue");
  }
  softApOldestActiveTime = self->_softApOldestActiveTime;
  self->_compatibilityToggled |= self->_compatibilityEnabled ^ compatibilityEnabled;
  if (softApOldestActiveTime && self->_statsValid)
  {
    v8 = v6;
  }
  else
  {
    -[WiFiSoftApUsageMonitor resetStatsInternal](self, "resetStatsInternal");
    objc_msgSend(v19, "objectForKey:", CFSTR("SessionStartTimestamp"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&self->_softApOldestActiveTime, v8);
    }
  }
  objc_msgSend(v19, "objectForKey:", CFSTR("AppleClientConnectCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend(v9, "unsignedLongValue");
    self->_appleClientConnectCount += v10;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v19, "objectForKey:", CFSTR("OtherClientConnectCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = objc_msgSend(v11, "unsignedLongValue");
    self->_otherClientConnectCount += v12;
    v13 = v12 != 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = !v13;
  v15 = 32;
  if (!v14)
    v15 = 48;
  v16 = 40;
  if (!v14)
    v16 = 56;
  if (v10)
    v15 = v16;
  ++*(Class *)((char *)&self->super.isa + v15);
  objc_msgSend(v19, "objectForKey:", CFSTR("TwoFourGHzChannelCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v17, "unsignedLongValue"))
        ++self->_twoFourGHzSessionCount;
    }
  }
  objc_msgSend(v19, "objectForKey:", CFSTR("FiveGHzChannelCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v18, "unsignedLongValue"))
        ++self->_fiveGHzSessionCount;
    }
  }
  ++self->_softApUpCount;
  self->_statsValid = 1;

}

- (void)updateStats:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WiFiSoftApUsageMonitor_updateStats___block_invoke;
  block[3] = &unk_1E881C8C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(internalQueue, block);

}

uint64_t __38__WiFiSoftApUsageMonitor_updateStats___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateStatsInternal:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "persistStats");
}

- (void)resetStatsInternal
{
  NSDate *softApOldestActiveTime;

  self->_statsValid = 0;
  softApOldestActiveTime = self->_softApOldestActiveTime;
  self->_softApOldestActiveTime = 0;

  self->_compatibilityToggled = 0;
  *(_OWORD *)&self->_softApUpCount = 0u;
  *(_OWORD *)&self->_onlyAppleClientConnectedSessionCount = 0u;
  *(_OWORD *)&self->_mixClientConnectedSessionCount = 0u;
  *(_OWORD *)&self->_otherClientConnectCount = 0u;
  self->_fiveGHzSessionCount = 0;
}

- (void)resetStats
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WiFiSoftApUsageMonitor_resetStats__block_invoke;
  block[3] = &unk_1E881C8E8;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __36__WiFiSoftApUsageMonitor_resetStats__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetStatsInternal");
}

- (void)statsDictionaryInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 statsValid;
  void *v17;
  id v18;

  v4 = a3;
  v18 = v4;
  if (self->_statsValid)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_softApOldestActiveTime, CFSTR("OldestActiveTime"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_softApUpCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v5, CFSTR("SoftApUpCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_noClientConnectedSessionCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v6, CFSTR("NoClientConnectedSessionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_onlyAppleClientConnectedSessionCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, CFSTR("OnlyAppleClientConnectedSessionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_onlyOtherClientConnectedSessionCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, CFSTR("OnlyOtherClientConnectedSessionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_mixClientConnectedSessionCount);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, CFSTR("MixClientConnectedSessionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_appleClientConnectCount);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("AppleClientConnectCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_otherClientConnectCount);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("OtherClientConnectCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_twoFourGHzSessionCount);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("24GHzSessionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzSessionCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("5GHzSessionCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_compatibilityEnabled);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("MaximizeCompatibilityEnabled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_compatibilityToggled);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("MaximizeCompatibilityToggled"));

    statsValid = self->_statsValid;
  }
  else
  {
    statsValid = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", statsValid);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("StatsValid"));

}

- (id)statsDictionary
{
  id v3;
  NSObject *internalQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  internalQueue = self->_internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__WiFiSoftApUsageMonitor_statsDictionary__block_invoke;
  v9[3] = &unk_1E881C8C0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(internalQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

uint64_t __41__WiFiSoftApUsageMonitor_statsDictionary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "statsDictionaryInternal:", *(_QWORD *)(a1 + 40));
}

- (void)persistStats
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[WiFiSoftApUsageMonitor statsDictionaryInternal:](self, "statsDictionaryInternal:", v4);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("WiFiHotspotUsageHistory"));

}

- (NSDate)softApOldestActiveTime
{
  return self->_softApOldestActiveTime;
}

- (void)setSoftApOldestActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_softApOldestActiveTime, a3);
}

- (unint64_t)softApUpCount
{
  return self->_softApUpCount;
}

- (void)setSoftApUpCount:(unint64_t)a3
{
  self->_softApUpCount = a3;
}

- (unint64_t)noClientConnectedSessionCount
{
  return self->_noClientConnectedSessionCount;
}

- (void)setNoClientConnectedSessionCount:(unint64_t)a3
{
  self->_noClientConnectedSessionCount = a3;
}

- (unint64_t)onlyAppleClientConnectedSessionCount
{
  return self->_onlyAppleClientConnectedSessionCount;
}

- (void)setOnlyAppleClientConnectedSessionCount:(unint64_t)a3
{
  self->_onlyAppleClientConnectedSessionCount = a3;
}

- (unint64_t)onlyOtherClientConnectedSessionCount
{
  return self->_onlyOtherClientConnectedSessionCount;
}

- (void)setOnlyOtherClientConnectedSessionCount:(unint64_t)a3
{
  self->_onlyOtherClientConnectedSessionCount = a3;
}

- (unint64_t)mixClientConnectedSessionCount
{
  return self->_mixClientConnectedSessionCount;
}

- (void)setMixClientConnectedSessionCount:(unint64_t)a3
{
  self->_mixClientConnectedSessionCount = a3;
}

- (unint64_t)appleClientConnectCount
{
  return self->_appleClientConnectCount;
}

- (void)setAppleClientConnectCount:(unint64_t)a3
{
  self->_appleClientConnectCount = a3;
}

- (unint64_t)otherClientConnectCount
{
  return self->_otherClientConnectCount;
}

- (void)setOtherClientConnectCount:(unint64_t)a3
{
  self->_otherClientConnectCount = a3;
}

- (unint64_t)twoFourGHzSessionCount
{
  return self->_twoFourGHzSessionCount;
}

- (void)setTwoFourGHzSessionCount:(unint64_t)a3
{
  self->_twoFourGHzSessionCount = a3;
}

- (unint64_t)fiveGHzSessionCount
{
  return self->_fiveGHzSessionCount;
}

- (void)setFiveGHzSessionCount:(unint64_t)a3
{
  self->_fiveGHzSessionCount = a3;
}

- (BOOL)compatibilityEnabled
{
  return self->_compatibilityEnabled;
}

- (void)setCompatibilityEnabled:(BOOL)a3
{
  self->_compatibilityEnabled = a3;
}

- (BOOL)compatibilityToggled
{
  return self->_compatibilityToggled;
}

- (void)setCompatibilityToggled:(BOOL)a3
{
  self->_compatibilityToggled = a3;
}

- (BOOL)statsValid
{
  return self->_statsValid;
}

- (void)setStatsValid:(BOOL)a3
{
  self->_statsValid = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInternalQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_softApOldestActiveTime, 0);
}

@end
