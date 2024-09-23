@implementation WiFiPersonalHotspotStats

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  return (id)sharedInstance_sharedPersonalHotspotStats;
}

void __42__WiFiPersonalHotspotStats_sharedInstance__block_invoke()
{
  WiFiPersonalHotspotStats *v0;
  void *v1;

  v0 = objc_alloc_init(WiFiPersonalHotspotStats);
  v1 = (void *)sharedInstance_sharedPersonalHotspotStats;
  sharedInstance_sharedPersonalHotspotStats = (uint64_t)v0;

}

- (WiFiPersonalHotspotStats)init
{
  WiFiPersonalHotspotStats *v2;
  WiFiPersonalHotspotStats *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiPersonalHotspotStats;
  v2 = -[WiFiPersonalHotspotStats init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[WiFiPersonalHotspotStats __resetWiFiPersonalHotspotStats](v2, "__resetWiFiPersonalHotspotStats");
  return v3;
}

- (void)__resetWiFiPersonalHotspotStats
{
  NSString *joinReason;
  NSString *failureReporter;
  NSString *deviceName;

  self->_successfulJoinAttempt = 0;
  *(_OWORD *)&self->_joinStartedAt = 0u;
  *(_OWORD *)&self->_joinEndedAt = 0u;
  joinReason = self->_joinReason;
  self->_joinReason = 0;

  failureReporter = self->_failureReporter;
  self->_failureReporter = 0;

  self->_joinFailureCode = 0;
  deviceName = self->_deviceName;
  self->_deviceName = 0;

  self->_band = 0;
}

- (void)setJoinStartedEvent:(double)a3 withReason:(unint64_t)a4 deviceName:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSString *joinReason;
  NSString *deviceName;

  v8 = (NSString *)a5;
  -[WiFiPersonalHotspotStats __resetWiFiPersonalHotspotStats](self, "__resetWiFiPersonalHotspotStats");
  self->_joinStartedAt = a3;
  +[WiFiUsageSession joinReasonString:](WiFiUsageSession, "joinReasonString:", a4);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  joinReason = self->_joinReason;
  self->_joinReason = v9;

  deviceName = self->_deviceName;
  self->_deviceName = v8;

}

- (void)setJoinEndedEvent:(double)a3 successfulJoinAttempt:(BOOL)a4 joinFailureCode:(int64_t)a5 failureReporter:(id)a6 band:(int64_t)a7 deviceName:(id)a8
{
  id v15;
  id v16;

  v16 = a6;
  v15 = a8;
  if (self->_joinStartedAt != 0.0
    && self->_latency == 0.0
    && -[NSString isEqualToString:](self->_deviceName, "isEqualToString:", v15))
  {
    self->_joinEndedAt = a3;
    self->_successfulJoinAttempt = a4;
    self->_joinFailureCode = a5;
    objc_storeStrong((id *)&self->_failureReporter, a6);
    self->_band = a7;
    self->_latency = self->_joinEndedAt - self->_joinStartedAt;
    -[WiFiPersonalHotspotStats __submitWiFiPersonalHotspotStats:end:latencyType:](self, "__submitWiFiPersonalHotspotStats:end:latencyType:", CFSTR("PH Enablement"));
    -[WiFiPersonalHotspotStats __submitWiFiPersonalHotspotStats:end:latencyType:](self, "__submitWiFiPersonalHotspotStats:end:latencyType:", CFSTR("WiFi"), self->_personalHotspotDiscoveryEndedAt, self->_joinEndedAt);
    -[WiFiPersonalHotspotStats __submitWiFiPersonalHotspotStats:end:latencyType:](self, "__submitWiFiPersonalHotspotStats:end:latencyType:", CFSTR("Total"), self->_joinStartedAt, self->_joinEndedAt);
  }

}

- (void)__submitWiFiPersonalHotspotStats:(double)a3 end:(double)a4 latencyType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSString *joinReason;
  void *v13;
  NSString *failureReporter;
  void *v15;
  id v16;
  void *v17;

  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3 != 0.0 && a4 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4 - a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("latency"));

  }
  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("latencyType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_successfulJoinAttempt);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("successfulJoinAttempt"));

  joinReason = self->_joinReason;
  if (joinReason)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", joinReason, CFSTR("joinReason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_band);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("band"));

  failureReporter = self->_failureReporter;
  if (failureReporter)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", failureReporter, CFSTR("failureReporter"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinFailureCode);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("joinFailureCode"));

  v17 = v9;
  v16 = v9;
  AnalyticsSendEventLazy();

}

id __77__WiFiPersonalHotspotStats___submitWiFiPersonalHotspotStats_end_latencyType___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (double)joinStartedAt
{
  return self->_joinStartedAt;
}

- (double)personalHotspotDiscoveryEndedAt
{
  return self->_personalHotspotDiscoveryEndedAt;
}

- (void)setPersonalHotspotDiscoveryEndedAt:(double)a3
{
  self->_personalHotspotDiscoveryEndedAt = a3;
}

- (double)joinEndedAt
{
  return self->_joinEndedAt;
}

- (double)latency
{
  return self->_latency;
}

- (BOOL)successfulJoinAttempt
{
  return self->_successfulJoinAttempt;
}

- (NSString)joinReason
{
  return self->_joinReason;
}

- (NSString)failureReporter
{
  return self->_failureReporter;
}

- (int64_t)joinFailureCode
{
  return self->_joinFailureCode;
}

- (int64_t)band
{
  return self->_band;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_failureReporter, 0);
  objc_storeStrong((id *)&self->_joinReason, 0);
}

@end
