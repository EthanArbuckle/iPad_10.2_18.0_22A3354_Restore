@implementation SSMetricsPageEvent

- (SSMetricsPageEvent)init
{
  SSMetricsPageEvent *v2;
  SSMetricsPageEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSMetricsPageEvent;
  v2 = -[SSMetricsBaseEvent init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SSMetricsMutableEvent setEventType:](v2, "setEventType:", CFSTR("page"));
  return v3;
}

- (BOOL)isCachedResponse
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("isCachedResponse"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isUbered
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("isUber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSString)clientCorrelationKey
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("clientCorrelationKey"));
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

- (BOOL)connectionReused
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("connectionReused"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

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

- (NSString)navigationType
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("navigation"));
}

- (NSString)pageHistoryDescription
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageHistory"));
}

- (double)pageRenderTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("pageRenderTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsEvent timeIntervalFromMilliseconds:](self, "timeIntervalFromMilliseconds:", v3);
  v5 = v4;

  return v5;
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

- (NSString)referringAppName
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("refApp"));
}

- (NSString)referringURL
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("refUrl"));
}

- (double)requestEndTime
{
  void *v3;
  double v4;
  double v5;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("requestEndTime"));
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

- (NSString)searchTerm
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("searchTerm"));
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

- (NSString)serverApplicationInstance
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("serverAppInstance"));
}

- (NSString)serverTiming
{
  return (NSString *)-[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("serverTiming"));
}

- (void)setCachedResponse:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("isCachedResponse"));

}

- (void)setClientCorrelationKey:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("clientCorrelationKey"));
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

- (void)setConnectionReused:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("connectionReused"));

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

- (void)setNavigationType:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("navigation"));
}

- (void)setPageHistoryDescription:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("pageHistory"));
}

- (void)setPageHistoryDescriptionWithIdentifiers:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsPageEvent setPageHistoryDescription:](self, "setPageHistoryDescription:", v4);

  }
}

- (void)setPageRenderTime:(double)a3
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
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("pageRenderTime"));

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

- (void)setReferringAppName:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("refApp"));
}

- (void)setReferringURL:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("refUrl"));
}

- (void)setRequestEndTime:(double)a3
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
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("requestEndTime"));

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

- (void)setSearchTerm:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("searchTerm"));
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

- (void)setServerApplicationInstance:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("serverAppInstance"));
}

- (void)setServerTiming:(id)a3
{
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", a3, CFSTR("serverTiming"));
}

- (void)setUbered:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("isUber"));

}

- (void)setXPSessionDuration:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSessionDuration"));

}

- (void)setXPSamplingForced:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SSMetricsMutableEvent setProperty:forBodyKey:](self, "setProperty:forBodyKey:", v4, CFSTR("xpSamplingForced"));

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

- (BOOL)xpSamplingForced
{
  void *v2;
  char v3;

  -[SSMetricsMutableEvent propertyForBodyKey:](self, "propertyForBodyKey:", CFSTR("xpSamplingForced"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SSMetricsPageEvent;
  -[SSMetricsBaseEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMetricsPageEvent serverApplicationInstance](self, "serverApplicationInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Instance: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
