@implementation NSPProbeStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.ProbeStats");
}

- (id)probeReasonToString
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[NSPProbeStats probeReason](self, "probeReason");
  v3 = CFSTR("Unknown");
  if (v2 == 1)
    v3 = CFSTR("Proxy");
  if (v2 == 2)
    return CFSTR("DNS");
  else
    return (id)v3;
}

- (id)analyticsDict
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  NSObject *v24;
  int v25;
  const char *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats tierType](self, "tierType"));

  if (v3)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats tierType](self, "tierType"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("TierType"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats probeReasonToString](self, "probeReasonToString"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("ProbeReason"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProbeStats probeInterface](self, "probeInterface"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("ProbeInterface"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats probeDurationSec](self, "probeDurationSec")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("ProbeDuration"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats proxyProbeCount](self, "proxyProbeCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("ProxyProbeCount"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats proxyProbeSuccessCount](self, "proxyProbeSuccessCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("ProxyProbeSuccessCount"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats proxyProbeFailedCount](self, "proxyProbeFailedCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("ProxyProbeFailedCount"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats proxyProbeRedirectedCount](self, "proxyProbeRedirectedCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("ProxyProbeRedirectedCount"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats proxyProbeServerErrorCount](self, "proxyProbeServerErrorCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("ProxyProbeServerErrorCount"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats directProbeCount](self, "directProbeCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("DirectProbeCount"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats directProbeSuccessCount](self, "directProbeSuccessCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("DirectProbeSuccessCount"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats directProbeFailedCount](self, "directProbeFailedCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("DirectProbeFailedCount"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats directProbeRedirectedCount](self, "directProbeRedirectedCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("DirectProbeRedirectedCount"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPProbeStats directProbeServerErrorCount](self, "directProbeServerErrorCount")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("DirectProbeServerErrorCount"));

    return v7;
  }
  else
  {
    v23 = nplog_obj(v4, v5, v6);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v25 = 136315138;
      v26 = "-[NSPProbeStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%s called with null self.tierType", (uint8_t *)&v25, 0xCu);
    }

    return 0;
  }
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (int64_t)probeReason
{
  return self->_probeReason;
}

- (void)setProbeReason:(int64_t)a3
{
  self->_probeReason = a3;
}

- (NSString)probeInterface
{
  return self->_probeInterface;
}

- (void)setProbeInterface:(id)a3
{
  objc_storeStrong((id *)&self->_probeInterface, a3);
}

- (unint64_t)probeDurationSec
{
  return self->_probeDurationSec;
}

- (void)setProbeDurationSec:(unint64_t)a3
{
  self->_probeDurationSec = a3;
}

- (unint64_t)proxyProbeCount
{
  return self->_proxyProbeCount;
}

- (void)setProxyProbeCount:(unint64_t)a3
{
  self->_proxyProbeCount = a3;
}

- (unint64_t)proxyProbeSuccessCount
{
  return self->_proxyProbeSuccessCount;
}

- (void)setProxyProbeSuccessCount:(unint64_t)a3
{
  self->_proxyProbeSuccessCount = a3;
}

- (unint64_t)proxyProbeFailedCount
{
  return self->_proxyProbeFailedCount;
}

- (void)setProxyProbeFailedCount:(unint64_t)a3
{
  self->_proxyProbeFailedCount = a3;
}

- (unint64_t)proxyProbeRedirectedCount
{
  return self->_proxyProbeRedirectedCount;
}

- (void)setProxyProbeRedirectedCount:(unint64_t)a3
{
  self->_proxyProbeRedirectedCount = a3;
}

- (unint64_t)proxyProbeServerErrorCount
{
  return self->_proxyProbeServerErrorCount;
}

- (void)setProxyProbeServerErrorCount:(unint64_t)a3
{
  self->_proxyProbeServerErrorCount = a3;
}

- (unint64_t)directProbeCount
{
  return self->_directProbeCount;
}

- (void)setDirectProbeCount:(unint64_t)a3
{
  self->_directProbeCount = a3;
}

- (unint64_t)directProbeSuccessCount
{
  return self->_directProbeSuccessCount;
}

- (void)setDirectProbeSuccessCount:(unint64_t)a3
{
  self->_directProbeSuccessCount = a3;
}

- (unint64_t)directProbeFailedCount
{
  return self->_directProbeFailedCount;
}

- (void)setDirectProbeFailedCount:(unint64_t)a3
{
  self->_directProbeFailedCount = a3;
}

- (unint64_t)directProbeRedirectedCount
{
  return self->_directProbeRedirectedCount;
}

- (void)setDirectProbeRedirectedCount:(unint64_t)a3
{
  self->_directProbeRedirectedCount = a3;
}

- (unint64_t)directProbeServerErrorCount
{
  return self->_directProbeServerErrorCount;
}

- (void)setDirectProbeServerErrorCount:(unint64_t)a3
{
  self->_directProbeServerErrorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeInterface, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end
