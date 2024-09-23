@implementation SSMetricsLoadURLEvent

- (BOOL)xpSamplingForced
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingForced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setXPSessionDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSessionDuration"));

}

- (void)setXPSamplingPercentageUsers:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingPercentageUsers"));

}

- (void)setXPSamplingPercentageCachedResponses:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingPercentageCachedResponses"));

}

- (void)setXPSamplingForced:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingForced"));

}

- (void)setClientCorrelationKey:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientCorrelationKey"));
}

- (SSMetricsLoadURLEvent)init
{
  SSMetricsLoadURLEvent *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMetricsLoadURLEvent;
  v2 = -[SSMetricsMutableEvent init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsLoadURLEvent setClientCorrelationKey:](v2, "setClientCorrelationKey:", v4);

    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("loadUrl"));
    -[SSMetricsMutableEvent setTopic:](v2, "setTopic:", CFSTR("xp_amp_clientperf"));
  }
  return v2;
}

- (NSString)appleTimingApp
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("appleTimingApp"));
}

- (BOOL)apsRelayAttempted
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelayAttempted"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)apsRelayDidFallback
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelayDidFallback"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)apsRelaySucceeded
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelaySucceeded"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)apsRelayRequested
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("apsRelayRequested"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)cachedResponse
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("cachedResponse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)clientCorrelationKey
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientCorrelationKey"));
}

- (NSString)clientError
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientError"));
}

- (double)connectionEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (NSString)connectionInterface
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionInterface"));
}

- (BOOL)connectionReused
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionReused"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (unint64_t)connectionStartNStatRXBytes
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStartNStatRXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)connectionStartNStatTXBytes
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStartNStatTXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)connectionStopNStatRXBytes
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStopNStatRXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (unint64_t)connectionStopNStatTXBytes
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStopNStatTXBytes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)connectionStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (NSString)connectionType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionType"));
}

- (NSString)DNSServers
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("dnsServersIPAddresses"));
}

- (double)domainLookupEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("domainLookupEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (double)domainLookupStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("domainLookupStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (NSString)edgeNodeCacheStatus
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("edgeNodeCacheStatus"));
}

- (double)fetchStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("fetchStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (NSArray)networkQualityReports
{
  return (NSArray *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("networkQualityReports"));
}

- (NSString)originalApp
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("app"));
}

- (unint64_t)redirectCount
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("redirectCount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)redirectEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("redirectEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (unint64_t)requestMessageSize
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestMessageSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)redirectStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("redirectStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (double)requestStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (NSString)requestURL
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestUrl"));
}

- (NSString)resolvedIPAddress
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("resolvedIPAddress"));
}

- (NSString)responseDate
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseDate"));
}

- (double)responseEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (unint64_t)responseMessageSize
{
  void *v2;
  unint64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseMessageSize"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (double)responseStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("responseStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (double)secureConnectionStartTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("secureConnectionStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
}

- (int64_t)statusCode
{
  void *v2;
  int64_t v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("statusCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)TLSSessionTickets
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("tlsSessionTicketsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAppleTimingApp:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("appleTimingApp"));
}

- (void)setApsRelayAttempted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelayAttempted"));

}

- (void)setApsRelayDidFallback:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelayDidFallback"));

}

- (void)setApsRelayRequested:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelayRequested"));

}

- (void)setApsRelaySucceeded:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("apsRelaySucceeded"));

}

- (void)setCachedResponse:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("cachedResponse"));

}

- (void)setClientError:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientError"));
}

- (void)setConnectionEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionEndTime"));

}

- (void)setConnectionInterface:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("connectionInterface"));
}

- (void)setConnectionReused:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionReused"));

}

- (void)setConnectionStartNStatRXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStartNStatRXBytes"));

}

- (void)setConnectionStartNStatTXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStartNStatTXBytes"));

}

- (void)setConnectionStopNStatRXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStopNStatRXBytes"));

}

- (void)setConnectionStopNStatTXBytes:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStopNStatTXBytes"));

}

- (void)setConnectionStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionStartTime"));

}

- (void)setConnectionType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("connectionType"));
}

- (void)setDNSServers:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("dnsServersIPAddresses"));
}

- (void)setDomainLookupEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("domainLookupEndTime"));

}

- (void)setDomainLookupStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("domainLookupStartTime"));

}

- (void)setEdgeNodeCacheStatus:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("edgeNodeCacheStatus"));
}

- (void)setFetchStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("fetchStartTime"));

}

- (void)setNetworkQualityReports:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("networkQualityReports"));
}

- (void)setOriginalApp:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("app"));
}

- (void)setRedirectCount:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("redirectCount"));

}

- (void)setRedirectEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("redirectEndTime"));

}

- (void)setRedirectStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("redirectStartTime"));

}

- (void)setRequestStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requestStartTime"));

}

- (void)setRequestMessageSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requestMessageSize"));

}

- (void)setRequestURL:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("requestUrl"));
}

- (void)setResolvedIPAddress:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("resolvedIPAddress"));
}

- (void)setResponseDate:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("responseDate"));
}

- (void)setResponseEndTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseEndTime"));

}

- (void)setResponseMessageSize:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseMessageSize"));

}

- (void)setResponseStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("responseStartTime"));

}

- (void)setSecureConnectionStartTime:(double)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 0.0)
  {
    v4 = 0;
  }
  else
  {
    -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("secureConnectionStartTime"));

}

- (void)setStatusCode:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("statusCode"));

}

- (void)setTIDState:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("tidState"));
}

- (void)setTLSSessionTickets:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("tlsSessionTicketsEnabled"));

}

- (NSString)TIDState
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("tidState"));
}

- (double)xpSessionDuration
{
  void *v2;
  double v3;
  double v4;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSessionDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)xpSamplingPercentageUsers
{
  void *v2;
  double v3;
  double v4;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingPercentageUsers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)xpSamplingPercentageCachedResponses
{
  void *v2;
  double v3;
  double v4;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingPercentageCachedResponses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

+ (BOOL)shouldCollectTimingData
{
  return objc_msgSend(a1, "shouldCollectTimingDataWithSessionDelegate:", 0);
}

+ (BOOL)shouldCollectTimingDataWithSessionDelegate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;

  +[SSMetricsTimingDefaults sharedInstanceWithSessionDelegate:](SSMetricsTimingDefaults, "sharedInstanceWithSessionDelegate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionDurationLoadURL");
  v6 = v5 * 1000.0;
  objc_msgSend(v4, "samplingPercentageUsersLoadURL");
  LOBYTE(a1) = objc_msgSend(a1, "shouldCollectTimingDataWithSessionDuration:samplingPercentage:", v6, v7);
  objc_msgSend(v4, "update");

  return (char)a1;
}

+ (BOOL)shouldCollectTimingDataWithSessionDuration:(double)a3 samplingPercentage:(double)a4
{
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  if ((objc_msgSend(a1, "shouldLogTimingMetrics") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_timingMetricsWindowStartTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", a3 / 1000.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "compare:", v10) != -1)
    {
      objc_msgSend(a1, "_randomDouble");
      v7 = 0;
      if (v11 == 0.0 || v11 > a4)
        goto LABEL_8;
      objc_msgSend(a1, "_setTimingMetricsWindowStartTime:", v8);
    }
    v7 = 1;
LABEL_8:

    return v7;
  }
  return 1;
}

+ (BOOL)shouldReportCachedEvent
{
  void *v3;

  +[SSMetricsTimingDefaults sharedInstance](SSMetricsTimingDefaults, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "samplingPercentageCachedResponsesLoadURL");
  LOBYTE(a1) = objc_msgSend(a1, "shouldReportCachedEventWithSamplingPercentage:");
  objc_msgSend(v3, "update");

  return (char)a1;
}

+ (BOOL)shouldReportCachedEventWithSamplingPercentage:(double)a3
{
  double v5;

  if (a3 == 0.0)
    return 0;
  objc_msgSend(a1, "_randomDouble");
  return v5 <= a3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_super v34;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v34.receiver = self;
  v34.super_class = (Class)SSMetricsLoadURLEvent;
  -[SSMetricsLoadURLEvent description](&v34, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[SSMetricsLoadURLEvent appleTimingApp](self, "appleTimingApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nappleTimingApp = %@"), v5);

  if (-[SSMetricsLoadURLEvent apsRelayAttempted](self, "apsRelayAttempted"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\napsRelayAttempted = %@"), v6);
  if (-[SSMetricsLoadURLEvent apsRelayDidFallback](self, "apsRelayDidFallback"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\napsRelayDidFallback = %@"), v7);
  if (-[SSMetricsLoadURLEvent apsRelaySucceeded](self, "apsRelaySucceeded"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\napsRelaySucceeded = %@"), v8);
  -[SSMetricsLoadURLEvent clientCorrelationKey](self, "clientCorrelationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nclientCorrelationKey = %@"), v9);

  -[SSMetricsLoadURLEvent requestURL](self, "requestURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nrequestUrl = %@"), v10);

  -[SSMetricsLoadURLEvent connectionType](self, "connectionType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionType = %@"), v11);

  -[SSMetricsLoadURLEvent DNSServers](self, "DNSServers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ndnsServers = %@"), v12);

  -[SSMetricsLoadURLEvent resolvedIPAddress](self, "resolvedIPAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresolvedIPAddress = %@"), v13);

  objc_msgSend(v3, "appendFormat:", CFSTR("\nstatusCode = %ld"), -[SSMetricsLoadURLEvent statusCode](self, "statusCode"));
  -[SSMetricsLoadURLEvent TIDState](self, "TIDState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\ntidState = %@"), v14);

  -[SSMetricsLoadURLEvent clientError](self, "clientError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nclientError = %@"), v15);

  -[SSMetricsLoadURLEvent fetchStartTime](self, "fetchStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nfetchStartTime = %f"), v16);
  -[SSMetricsLoadURLEvent domainLookupStartTime](self, "domainLookupStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\ndomainLookupStartTime = %f"), v17);
  -[SSMetricsLoadURLEvent domainLookupEndTime](self, "domainLookupEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\ndomainLookupEndTime = %f"), v18);
  -[SSMetricsLoadURLEvent connectionStartTime](self, "connectionStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionStartTime = %f"), v19);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionStartNStatRXBytes = %ld"), -[SSMetricsLoadURLEvent connectionStartNStatRXBytes](self, "connectionStartNStatRXBytes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionStartNStatTXBytes = %ld"), -[SSMetricsLoadURLEvent connectionStartNStatTXBytes](self, "connectionStartNStatTXBytes"));
  -[SSMetricsLoadURLEvent secureConnectionStartTime](self, "secureConnectionStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nsecureConnectionStartTime = %f"), v20);
  -[SSMetricsLoadURLEvent connectionEndTime](self, "connectionEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionEndTime = %f"), v21);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionStopNStatRXBytes = %ld"), -[SSMetricsLoadURLEvent connectionStopNStatRXBytes](self, "connectionStopNStatRXBytes"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionStopNStatTXBytes = %ld"), -[SSMetricsLoadURLEvent connectionStopNStatTXBytes](self, "connectionStopNStatTXBytes"));
  if (-[SSMetricsLoadURLEvent connectionReused](self, "connectionReused"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nconnectionReused = %@"), v22);
  -[SSMetricsLoadURLEvent requestStartTime](self, "requestStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nrequestStartTime = %f"), v23);
  -[SSMetricsLoadURLEvent responseDate](self, "responseDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresponseDate = %@"), v24);

  -[SSMetricsLoadURLEvent responseStartTime](self, "responseStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresponseStartTime = %f"), v25);
  -[SSMetricsLoadURLEvent responseEndTime](self, "responseEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nresponseEndTime = %f"), v26);
  -[SSMetricsLoadURLEvent redirectStartTime](self, "redirectStartTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nredirectStartTime = %f"), v27);
  -[SSMetricsLoadURLEvent redirectEndTime](self, "redirectEndTime");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nredirectEndTime = %f"), v28);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nredirectCount = %ld"), -[SSMetricsLoadURLEvent redirectCount](self, "redirectCount"));
  if (-[SSMetricsLoadURLEvent xpSamplingForced](self, "xpSamplingForced"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSamplingForced = %@"), v29);
  -[SSMetricsLoadURLEvent xpSamplingPercentageCachedResponses](self, "xpSamplingPercentageCachedResponses");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSamplingPercentageCachedResponses = %f"), v30);
  -[SSMetricsLoadURLEvent xpSamplingPercentageUsers](self, "xpSamplingPercentageUsers");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSamplingPercentageUsers = %f"), v31);
  -[SSMetricsLoadURLEvent xpSessionDuration](self, "xpSessionDuration");
  objc_msgSend(v3, "appendFormat:", CFSTR("\nxpSessionDuration = %f"), v32);
  objc_msgSend(v3, "appendFormat:", CFSTR("\nrequestMessageSize = %lu"), -[SSMetricsLoadURLEvent requestMessageSize](self, "requestMessageSize"));
  objc_msgSend(v3, "appendFormat:", CFSTR("\responseMessageSize = %lu"), -[SSMetricsLoadURLEvent responseMessageSize](self, "responseMessageSize"));
  return v3;
}

+ (double)_randomDouble
{
  if (_randomDouble_onceToken_0 != -1)
    dispatch_once(&_randomDouble_onceToken_0, &__block_literal_global_32);
  return drand48();
}

void __38__SSMetricsLoadURLEvent__randomDouble__block_invoke()
{
  uint32_t v0;

  v0 = arc4random();
  srand48(v0);
}

+ (void)_setTimingMetricsWindowStartTime:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("TimingMetricsWindowStartTime"), a3, CFSTR("com.apple.itunesstored"));
}

+ (id)_timingMetricsWindowStartTime
{
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("TimingMetricsWindowStartTime"), CFSTR("com.apple.itunesstored"));
}

@end
