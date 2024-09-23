@implementation NSPToggleStats

- (NSPToggleStats)init
{
  NSPToggleStats *v2;
  NSPProxyAgentNetworkStatistics *v3;
  NSPProxyAgentNetworkStatistics *primaryPathStatistics;
  NSPProxyAgentNetworkStatistics *v5;
  NSPProxyAgentNetworkStatistics *fallbackPathStatistics;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSPToggleStats;
  v2 = -[NSPToggleStats init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    primaryPathStatistics = v2->_primaryPathStatistics;
    v2->_primaryPathStatistics = v3;

    v5 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    fallbackPathStatistics = v2->_fallbackPathStatistics;
    v2->_fallbackPathStatistics = v5;

  }
  return v2;
}

- (id)eventName
{
  return CFSTR("com.apple.nsp.ToggleStats");
}

- (void)addNetworkStatsToToggleStatsDict:(id)a3 networkStats:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    v42 = nplog_obj(v7, v8, v9);
    v40 = objc_claimAutoreleasedReturnValue(v42);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v46 = "-[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]";
    v43 = "%s called with null toggleStatsDict";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, v43, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v7)
  {
    v44 = nplog_obj(0, v8, v9);
    v40 = objc_claimAutoreleasedReturnValue(v44);
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v46 = "-[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:]";
    v43 = "%s called with null networkStats";
    goto LABEL_14;
  }
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](self, "primaryPathStatistics"));

  if (v11 == v10)
  {
    v13 = CFSTR("PrimaryPath");
  }
  else
  {
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](self, "fallbackPathStatistics"));

    if (v12 == v10)
      v13 = CFSTR("FallbackPath");
    else
      v13 = 0;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("ProxyConnectionSuccessCount")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[2]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionTimeoutCount")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[3]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionRefusedCount")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[4]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionHostDownCount")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[5]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionHostUnreachableCount")));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[6]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionErrorCount")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[7]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionDNSTimeoutCount")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[8]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionDNSBlockedCount")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[9]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IngressProxyConnectionCertErrorCount")));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[10]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("EgressProxyConnectionErrorCount")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[11]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("OriginProxyConnectionErrorCount")));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[12]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("EgressProxyUnavailableErrorCount")));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[13]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("IncompleteHandshakeStallCount")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[14]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, v38);

  v40 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v13, CFSTR("PostHandShakeStallCount")));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10[15]));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, v40);

LABEL_9:
}

- (id)analyticsDict
{
  id v3;
  void *v4;
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

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPToggleStats toggleState](self, "toggleState")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ToggleState"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats configOutageCount](self, "configOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ConfigOutageCount"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats tokenOutageCount](self, "tokenOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("TokenOutageCount"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats networkOutageCount](self, "networkOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("NetworkOutageCount"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats proxyOutageCount](self, "proxyOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("ProxyOutageCount"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats odohOutageCount](self, "odohOutageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("ODoHOutageCount"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats systemIncompatibleCount](self, "systemIncompatibleCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("SystemIncompatibleCount"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats fraudAlertCount](self, "fraudAlertCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("FraudAlertCount"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats odohAuthFailureCount](self, "odohAuthFailureCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("ODoHAuthFailureCount"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPToggleStats odohBadMessageCount](self, "odohBadMessageCount")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("ODoHBadMessageCount"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](self, "primaryPathStatistics"));
  -[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:](self, "addNetworkStatsToToggleStatsDict:networkStats:", v3, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](self, "fallbackPathStatistics"));
  -[NSPToggleStats addNetworkStatsToToggleStatsDict:networkStats:](self, "addNetworkStatsToToggleStatsDict:networkStats:", v3, v15);

  return v3;
}

- (void)sendToggleOnStats
{
  -[NSPToggleStats setToggleState:](self, "setToggleState:", 1);
  -[NSPProxyAnalytics sendAnalytics](self, "sendAnalytics");
}

- (void)sendToggleOffStats
{
  -[NSPToggleStats setToggleState:](self, "setToggleState:", 0);
  -[NSPProxyAnalytics sendAnalytics](self, "sendAnalytics");
}

- (void)resetStats
{
  _OWORD *v3;
  _OWORD *v4;

  -[NSPToggleStats setConfigOutageCount:](self, "setConfigOutageCount:", 0);
  -[NSPToggleStats setTokenOutageCount:](self, "setTokenOutageCount:", 0);
  -[NSPToggleStats setNetworkOutageCount:](self, "setNetworkOutageCount:", 0);
  -[NSPToggleStats setProxyOutageCount:](self, "setProxyOutageCount:", 0);
  -[NSPToggleStats setOdohOutageCount:](self, "setOdohOutageCount:", 0);
  -[NSPToggleStats setSystemIncompatibleCount:](self, "setSystemIncompatibleCount:", 0);
  -[NSPToggleStats setFraudAlertCount:](self, "setFraudAlertCount:", 0);
  -[NSPToggleStats setOdohAuthFailureCount:](self, "setOdohAuthFailureCount:", 0);
  -[NSPToggleStats setOdohBadMessageCount:](self, "setOdohBadMessageCount:", 0);
  v3 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats primaryPathStatistics](self, "primaryPathStatistics"));
  if (v3)
  {
    v3[6] = 0u;
    v3[7] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[1] = 0u;
  }

  v4 = (_OWORD *)objc_claimAutoreleasedReturnValue(-[NSPToggleStats fallbackPathStatistics](self, "fallbackPathStatistics"));
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[1] = 0u;
  }

}

- (unint64_t)tokenOutageCount
{
  return self->_tokenOutageCount;
}

- (void)setTokenOutageCount:(unint64_t)a3
{
  self->_tokenOutageCount = a3;
}

- (unint64_t)configOutageCount
{
  return self->_configOutageCount;
}

- (void)setConfigOutageCount:(unint64_t)a3
{
  self->_configOutageCount = a3;
}

- (unint64_t)networkOutageCount
{
  return self->_networkOutageCount;
}

- (void)setNetworkOutageCount:(unint64_t)a3
{
  self->_networkOutageCount = a3;
}

- (unint64_t)proxyOutageCount
{
  return self->_proxyOutageCount;
}

- (void)setProxyOutageCount:(unint64_t)a3
{
  self->_proxyOutageCount = a3;
}

- (unint64_t)odohOutageCount
{
  return self->_odohOutageCount;
}

- (void)setOdohOutageCount:(unint64_t)a3
{
  self->_odohOutageCount = a3;
}

- (unint64_t)systemIncompatibleCount
{
  return self->_systemIncompatibleCount;
}

- (void)setSystemIncompatibleCount:(unint64_t)a3
{
  self->_systemIncompatibleCount = a3;
}

- (unint64_t)fraudAlertCount
{
  return self->_fraudAlertCount;
}

- (void)setFraudAlertCount:(unint64_t)a3
{
  self->_fraudAlertCount = a3;
}

- (NSPProxyAgentNetworkStatistics)primaryPathStatistics
{
  return self->_primaryPathStatistics;
}

- (void)setPrimaryPathStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPathStatistics, a3);
}

- (NSPProxyAgentNetworkStatistics)fallbackPathStatistics
{
  return self->_fallbackPathStatistics;
}

- (void)setFallbackPathStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackPathStatistics, a3);
}

- (unint64_t)odohAuthFailureCount
{
  return self->_odohAuthFailureCount;
}

- (void)setOdohAuthFailureCount:(unint64_t)a3
{
  self->_odohAuthFailureCount = a3;
}

- (unint64_t)odohBadMessageCount
{
  return self->_odohBadMessageCount;
}

- (void)setOdohBadMessageCount:(unint64_t)a3
{
  self->_odohBadMessageCount = a3;
}

- (BOOL)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(BOOL)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackPathStatistics, 0);
  objc_storeStrong((id *)&self->_primaryPathStatistics, 0);
}

@end
