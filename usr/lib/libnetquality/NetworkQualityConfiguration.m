@implementation NetworkQualityConfiguration

- (NetworkQualityConfiguration)init
{
  NetworkQualityConfiguration *v2;
  NetworkQualityConfiguration *v3;
  NSString *customConfigurationString;
  NSDictionary *customConfigurationDictionary;
  NSString *bonjourHost;
  NSString *networkInterfaceName;
  NSString *hostOverride;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NetworkQualityConfiguration;
  v2 = -[NetworkQualityConfiguration init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    customConfigurationString = v2->customConfigurationString;
    v2->customConfigurationString = 0;

    customConfigurationDictionary = v3->customConfigurationDictionary;
    v3->customConfigurationDictionary = 0;

    bonjourHost = v3->_bonjourHost;
    v3->_bonjourHost = 0;

    networkInterfaceName = v3->_networkInterfaceName;
    v3->_networkInterfaceName = 0;

    *(_WORD *)&v3->_workingLatency = 257;
    *(_DWORD *)&v3->_idleLatency = 16843009;
    *(_OWORD *)&v3->_minUploadFlows = xmmword_20E63BF80;
    *(_OWORD *)&v3->_minDownloadFlows = xmmword_20E63BF80;
    v3->_telemetry = 1;
    *(_OWORD *)&v3->_minRuntime = xmmword_20E63BF90;
    *(_DWORD *)&v3->_forceHTTP1 = 0;
    *(_OWORD *)&v3->_latencyCriteria = 0u;
    *(_OWORD *)&v3->_maxUplinkData = 0u;
    hostOverride = v3->_hostOverride;
    v3->_maxUplinkThroughput = 0;
    v3->_hostOverride = 0;

    *(_OWORD *)&v3->_movingAveragePeriod = xmmword_20E63BFA0;
    *(_OWORD *)&v3->_trimmedMeanThreshold = xmmword_20E63BFB0;
    v3->_useUnifiedHTTPStack = 0;
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NetworkQualityConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(NetworkQualityConfiguration);
  objc_storeStrong((id *)&v4->customConfigurationString, self->customConfigurationString);
  objc_storeStrong((id *)&v4->customConfigurationDictionary, self->customConfigurationDictionary);
  -[NetworkQualityConfiguration bonjourHost](self, "bonjourHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityConfiguration setBonjourHost:](v4, "setBonjourHost:", v5);

  -[NetworkQualityConfiguration networkInterfaceName](self, "networkInterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityConfiguration setNetworkInterfaceName:](v4, "setNetworkInterfaceName:", v6);

  -[NetworkQualityConfiguration setIdleLatency:](v4, "setIdleLatency:", -[NetworkQualityConfiguration idleLatency](self, "idleLatency"));
  -[NetworkQualityConfiguration setUpload:](v4, "setUpload:", -[NetworkQualityConfiguration upload](self, "upload"));
  -[NetworkQualityConfiguration setDownload:](v4, "setDownload:", -[NetworkQualityConfiguration download](self, "download"));
  -[NetworkQualityConfiguration setParallel:](v4, "setParallel:", -[NetworkQualityConfiguration parallel](self, "parallel"));
  -[NetworkQualityConfiguration setWorkingLatency:](v4, "setWorkingLatency:", -[NetworkQualityConfiguration workingLatency](self, "workingLatency"));
  -[NetworkQualityConfiguration setValidateCertificate:](v4, "setValidateCertificate:", -[NetworkQualityConfiguration validateCertificate](self, "validateCertificate"));
  -[NetworkQualityConfiguration setMinUploadFlows:](v4, "setMinUploadFlows:", -[NetworkQualityConfiguration minUploadFlows](self, "minUploadFlows"));
  -[NetworkQualityConfiguration setMaxUploadFlows:](v4, "setMaxUploadFlows:", -[NetworkQualityConfiguration maxUploadFlows](self, "maxUploadFlows"));
  -[NetworkQualityConfiguration setMinDownloadFlows:](v4, "setMinDownloadFlows:", -[NetworkQualityConfiguration minDownloadFlows](self, "minDownloadFlows"));
  -[NetworkQualityConfiguration setMaxDownloadFlows:](v4, "setMaxDownloadFlows:", -[NetworkQualityConfiguration maxDownloadFlows](self, "maxDownloadFlows"));
  -[NetworkQualityConfiguration setMaxDownlinkThroughput:](v4, "setMaxDownlinkThroughput:", -[NetworkQualityConfiguration maxDownlinkThroughput](self, "maxDownlinkThroughput"));
  -[NetworkQualityConfiguration setMaxUplinkThroughput:](v4, "setMaxUplinkThroughput:", -[NetworkQualityConfiguration maxUplinkThroughput](self, "maxUplinkThroughput"));
  -[NetworkQualityConfiguration setTelemetry:](v4, "setTelemetry:", -[NetworkQualityConfiguration telemetry](self, "telemetry"));
  -[NetworkQualityConfiguration setMinRuntime:](v4, "setMinRuntime:", -[NetworkQualityConfiguration minRuntime](self, "minRuntime"));
  -[NetworkQualityConfiguration setMaxRuntime:](v4, "setMaxRuntime:", -[NetworkQualityConfiguration maxRuntime](self, "maxRuntime"));
  -[NetworkQualityConfiguration setLatencyCriteria:](v4, "setLatencyCriteria:", -[NetworkQualityConfiguration latencyCriteria](self, "latencyCriteria"));
  -[NetworkQualityConfiguration setMaxDownlinkData:](v4, "setMaxDownlinkData:", -[NetworkQualityConfiguration maxDownlinkData](self, "maxDownlinkData"));
  -[NetworkQualityConfiguration setMaxUplinkData:](v4, "setMaxUplinkData:", -[NetworkQualityConfiguration maxUplinkData](self, "maxUplinkData"));
  -[NetworkQualityConfiguration setForceHTTP1:](v4, "setForceHTTP1:", -[NetworkQualityConfiguration forceHTTP1](self, "forceHTTP1"));
  -[NetworkQualityConfiguration setForceHTTP2:](v4, "setForceHTTP2:", -[NetworkQualityConfiguration forceHTTP2](self, "forceHTTP2"));
  -[NetworkQualityConfiguration setForceHTTP3:](v4, "setForceHTTP3:", -[NetworkQualityConfiguration forceHTTP3](self, "forceHTTP3"));
  -[NetworkQualityConfiguration setForceL4S:](v4, "setForceL4S:", -[NetworkQualityConfiguration forceL4S](self, "forceL4S"));
  -[NetworkQualityConfiguration setForceDisableL4S:](v4, "setForceDisableL4S:", -[NetworkQualityConfiguration forceDisableL4S](self, "forceDisableL4S"));
  -[NetworkQualityConfiguration setPrivateRelay:](v4, "setPrivateRelay:", -[NetworkQualityConfiguration privateRelay](self, "privateRelay"));
  -[NetworkQualityConfiguration setEdgeRelay:](v4, "setEdgeRelay:", -[NetworkQualityConfiguration edgeRelay](self, "edgeRelay"));
  -[NetworkQualityConfiguration setEdgeRelayRemote:](v4, "setEdgeRelayRemote:", -[NetworkQualityConfiguration edgeRelayRemote](self, "edgeRelayRemote"));
  -[NetworkQualityConfiguration hostOverride](self, "hostOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityConfiguration setHostOverride:](v4, "setHostOverride:", v7);

  -[NetworkQualityConfiguration setMovingAveragePeriod:](v4, "setMovingAveragePeriod:", -[NetworkQualityConfiguration movingAveragePeriod](self, "movingAveragePeriod"));
  -[NetworkQualityConfiguration setStandardDeviationThreshold:](v4, "setStandardDeviationThreshold:", -[NetworkQualityConfiguration standardDeviationThreshold](self, "standardDeviationThreshold"));
  -[NetworkQualityConfiguration setTrimmedMeanThreshold:](v4, "setTrimmedMeanThreshold:", -[NetworkQualityConfiguration trimmedMeanThreshold](self, "trimmedMeanThreshold"));
  -[NetworkQualityConfiguration setMultipathServiceType:](v4, "setMultipathServiceType:", -[NetworkQualityConfiguration multipathServiceType](self, "multipathServiceType"));
  -[NetworkQualityConfiguration setUseUnifiedHTTPStack:](v4, "setUseUnifiedHTTPStack:", -[NetworkQualityConfiguration useUnifiedHTTPStack](self, "useUnifiedHTTPStack"));
  return v4;
}

- (NetworkQualityConfiguration)initWithCoder:(id)a3
{
  id v4;
  NetworkQualityConfiguration *v5;
  uint64_t v6;
  NSString *customConfigurationString;
  uint64_t v8;
  NSDictionary *customConfigurationDictionary;
  uint64_t v10;
  NSString *bonjourHost;
  uint64_t v12;
  NSString *networkInterfaceName;
  uint64_t v14;
  NSString *hostOverride;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NetworkQualityConfiguration;
  v5 = -[NetworkQualityConfiguration init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationString"));
    v6 = objc_claimAutoreleasedReturnValue();
    customConfigurationString = v5->customConfigurationString;
    v5->customConfigurationString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationDictionary"));
    v8 = objc_claimAutoreleasedReturnValue();
    customConfigurationDictionary = v5->customConfigurationDictionary;
    v5->customConfigurationDictionary = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bonjourHost"));
    v10 = objc_claimAutoreleasedReturnValue();
    bonjourHost = v5->_bonjourHost;
    v5->_bonjourHost = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkInterfaceName"));
    v12 = objc_claimAutoreleasedReturnValue();
    networkInterfaceName = v5->_networkInterfaceName;
    v5->_networkInterfaceName = (NSString *)v12;

    v5->_idleLatency = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("idleLatency"));
    v5->_upload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("upload"));
    v5->_download = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("download"));
    v5->_parallel = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parallel"));
    v5->_workingLatency = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("workingLatency"));
    v5->_validateCertificate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("validateCertificate"));
    v5->_minUploadFlows = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minUploadFlows"));
    v5->_maxUploadFlows = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxUploadFlows"));
    v5->_minDownloadFlows = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minDownloadFlows"));
    v5->_maxDownloadFlows = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxDownloadFlows"));
    v5->_telemetry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("telemetry"));
    v5->_minRuntime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minRuntime"));
    v5->_maxRuntime = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxRuntime"));
    v5->_latencyCriteria = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("latencyCriteria"));
    v5->_maxDownlinkData = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxDownlinkData"));
    v5->_maxUplinkData = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxUplinkData"));
    v5->_maxDownlinkThroughput = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxDownlinkThroughput"));
    v5->_maxUplinkThroughput = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxUplinkThroughput"));
    v5->_forceHTTP1 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceHTTP1"));
    v5->_forceHTTP2 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceHTTP2"));
    v5->_forceHTTP3 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceHTTP3"));
    v5->_forceL4S = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceL4S"));
    v5->_forceDisableL4S = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forceDisableL4S"));
    v5->_privateRelay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("privateRelay"));
    v5->_edgeRelay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("edgeRelay"));
    v5->_edgeRelayRemote = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("edgeRelayRemote"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostOverride"));
    v14 = objc_claimAutoreleasedReturnValue();
    hostOverride = v5->_hostOverride;
    v5->_hostOverride = (NSString *)v14;

    v5->_movingAveragePeriod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("movingAveragePeriod"));
    v5->_standardDeviationThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("standardDeviationThreshold"));
    v5->_trimmedMeanThreshold = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("trimmedMeanThreshold"));
    v5->_multipathServiceType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("multipathServiceType"));
    v5->_useUnifiedHTTPStack = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useUnifiedHTTPStack"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *customConfigurationString;
  id v5;

  customConfigurationString = self->customConfigurationString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", customConfigurationString, CFSTR("configurationString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->customConfigurationDictionary, CFSTR("configurationDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bonjourHost, CFSTR("bonjourHost"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_networkInterfaceName, CFSTR("networkInterfaceName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_idleLatency, CFSTR("idleLatency"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_upload, CFSTR("upload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_download, CFSTR("download"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_parallel, CFSTR("parallel"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_workingLatency, CFSTR("workingLatency"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_validateCertificate, CFSTR("validateCertificate"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minUploadFlows, CFSTR("minUploadFlows"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxUploadFlows, CFSTR("maxUploadFlows"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minDownloadFlows, CFSTR("minDownloadFlows"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxDownloadFlows, CFSTR("maxDownloadFlows"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_telemetry, CFSTR("telemetry"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_minRuntime, CFSTR("minRuntime"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxRuntime, CFSTR("maxRuntime"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_latencyCriteria, CFSTR("latencyCriteria"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxDownlinkData, CFSTR("maxDownlinkData"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxUplinkData, CFSTR("maxUplinkData"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxDownlinkThroughput, CFSTR("maxDownlinkThroughput"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_maxUplinkThroughput, CFSTR("maxUplinkThroughput"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceHTTP1, CFSTR("forceHTTP1"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceHTTP2, CFSTR("forceHTTP2"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceHTTP3, CFSTR("forceHTTP3"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceL4S, CFSTR("forceL4S"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceDisableL4S, CFSTR("forceDisableL4S"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_privateRelay, CFSTR("privateRelay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_edgeRelay, CFSTR("edgeRelay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_edgeRelayRemote, CFSTR("edgeRelayRemote"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostOverride, CFSTR("hostOverride"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_movingAveragePeriod, CFSTR("movingAveragePeriod"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_standardDeviationThreshold, CFSTR("standardDeviationThreshold"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_trimmedMeanThreshold, CFSTR("trimmedMeanThreshold"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_multipathServiceType, CFSTR("multipathServiceType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useUnifiedHTTPStack, CFSTR("useUnifiedHTTPStack"));

}

- (void)setConfiguration:(id)a3
{
  NSString *v4;
  NSDictionary *customConfigurationString;
  NSDictionary *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    customConfigurationString = (NSDictionary *)self->customConfigurationString;
    self->customConfigurationString = v4;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (NSDictionary *)objc_msgSend(v7, "copy");
    customConfigurationString = self->customConfigurationDictionary;
    self->customConfigurationDictionary = v6;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSObject)configuration
{
  NSDictionary *customConfigurationString;
  NSDictionary *v4;
  const __CFString *v6;
  _BOOL4 v7;

  customConfigurationString = (NSDictionary *)self->customConfigurationString;
  if (customConfigurationString || (customConfigurationString = self->customConfigurationDictionary) != 0)
  {
    v4 = customConfigurationString;
  }
  else
  {
    if (-[NetworkQualityConfiguration edgeRelay](self, "edgeRelay"))
    {
      v6 = CFSTR("mensura-edge-relay.cdn-apple.com");
    }
    else
    {
      v7 = -[NetworkQualityConfiguration edgeRelayRemote](self, "edgeRelayRemote");
      v6 = CFSTR("mensura.cdn-apple.com");
      if (v7)
        v6 = CFSTR("mensura-edge-relay-remote.cdn-apple.com");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://%@/.well-known/nq"), v6);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityConfiguration configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: configuration=%@, bonjourHost=%@>"), v5, v6, self->_bonjourHost);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)bonjourHost
{
  return self->_bonjourHost;
}

- (void)setBonjourHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)networkInterfaceName
{
  return self->_networkInterfaceName;
}

- (void)setNetworkInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)idleLatency
{
  return self->_idleLatency;
}

- (void)setIdleLatency:(BOOL)a3
{
  self->_idleLatency = a3;
}

- (BOOL)upload
{
  return self->_upload;
}

- (void)setUpload:(BOOL)a3
{
  self->_upload = a3;
}

- (BOOL)download
{
  return self->_download;
}

- (void)setDownload:(BOOL)a3
{
  self->_download = a3;
}

- (BOOL)parallel
{
  return self->_parallel;
}

- (void)setParallel:(BOOL)a3
{
  self->_parallel = a3;
}

- (BOOL)workingLatency
{
  return self->_workingLatency;
}

- (void)setWorkingLatency:(BOOL)a3
{
  self->_workingLatency = a3;
}

- (BOOL)validateCertificate
{
  return self->_validateCertificate;
}

- (void)setValidateCertificate:(BOOL)a3
{
  self->_validateCertificate = a3;
}

- (int64_t)minUploadFlows
{
  return self->_minUploadFlows;
}

- (void)setMinUploadFlows:(int64_t)a3
{
  self->_minUploadFlows = a3;
}

- (int64_t)maxUploadFlows
{
  return self->_maxUploadFlows;
}

- (void)setMaxUploadFlows:(int64_t)a3
{
  self->_maxUploadFlows = a3;
}

- (int64_t)minDownloadFlows
{
  return self->_minDownloadFlows;
}

- (void)setMinDownloadFlows:(int64_t)a3
{
  self->_minDownloadFlows = a3;
}

- (int64_t)maxDownloadFlows
{
  return self->_maxDownloadFlows;
}

- (void)setMaxDownloadFlows:(int64_t)a3
{
  self->_maxDownloadFlows = a3;
}

- (BOOL)telemetry
{
  return self->_telemetry;
}

- (void)setTelemetry:(BOOL)a3
{
  self->_telemetry = a3;
}

- (int64_t)minRuntime
{
  return self->_minRuntime;
}

- (void)setMinRuntime:(int64_t)a3
{
  self->_minRuntime = a3;
}

- (int64_t)maxRuntime
{
  return self->_maxRuntime;
}

- (void)setMaxRuntime:(int64_t)a3
{
  self->_maxRuntime = a3;
}

- (int64_t)latencyCriteria
{
  return self->_latencyCriteria;
}

- (void)setLatencyCriteria:(int64_t)a3
{
  self->_latencyCriteria = a3;
}

- (int64_t)maxDownlinkData
{
  return self->_maxDownlinkData;
}

- (void)setMaxDownlinkData:(int64_t)a3
{
  self->_maxDownlinkData = a3;
}

- (int64_t)maxUplinkData
{
  return self->_maxUplinkData;
}

- (void)setMaxUplinkData:(int64_t)a3
{
  self->_maxUplinkData = a3;
}

- (int64_t)maxDownlinkThroughput
{
  return self->_maxDownlinkThroughput;
}

- (void)setMaxDownlinkThroughput:(int64_t)a3
{
  self->_maxDownlinkThroughput = a3;
}

- (int64_t)maxUplinkThroughput
{
  return self->_maxUplinkThroughput;
}

- (void)setMaxUplinkThroughput:(int64_t)a3
{
  self->_maxUplinkThroughput = a3;
}

- (BOOL)forceHTTP1
{
  return self->_forceHTTP1;
}

- (void)setForceHTTP1:(BOOL)a3
{
  self->_forceHTTP1 = a3;
}

- (BOOL)forceHTTP2
{
  return self->_forceHTTP2;
}

- (void)setForceHTTP2:(BOOL)a3
{
  self->_forceHTTP2 = a3;
}

- (BOOL)forceHTTP3
{
  return self->_forceHTTP3;
}

- (void)setForceHTTP3:(BOOL)a3
{
  self->_forceHTTP3 = a3;
}

- (BOOL)forceL4S
{
  return self->_forceL4S;
}

- (void)setForceL4S:(BOOL)a3
{
  self->_forceL4S = a3;
}

- (BOOL)forceDisableL4S
{
  return self->_forceDisableL4S;
}

- (void)setForceDisableL4S:(BOOL)a3
{
  self->_forceDisableL4S = a3;
}

- (BOOL)privateRelay
{
  return self->_privateRelay;
}

- (void)setPrivateRelay:(BOOL)a3
{
  self->_privateRelay = a3;
}

- (BOOL)edgeRelay
{
  return self->_edgeRelay;
}

- (void)setEdgeRelay:(BOOL)a3
{
  self->_edgeRelay = a3;
}

- (BOOL)edgeRelayRemote
{
  return self->_edgeRelayRemote;
}

- (void)setEdgeRelayRemote:(BOOL)a3
{
  self->_edgeRelayRemote = a3;
}

- (NSString)hostOverride
{
  return self->_hostOverride;
}

- (void)setHostOverride:(id)a3
{
  objc_storeStrong((id *)&self->_hostOverride, a3);
}

- (int64_t)movingAveragePeriod
{
  return self->_movingAveragePeriod;
}

- (void)setMovingAveragePeriod:(int64_t)a3
{
  self->_movingAveragePeriod = a3;
}

- (int64_t)standardDeviationThreshold
{
  return self->_standardDeviationThreshold;
}

- (void)setStandardDeviationThreshold:(int64_t)a3
{
  self->_standardDeviationThreshold = a3;
}

- (int64_t)trimmedMeanThreshold
{
  return self->_trimmedMeanThreshold;
}

- (void)setTrimmedMeanThreshold:(int64_t)a3
{
  self->_trimmedMeanThreshold = a3;
}

- (int64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (void)setMultipathServiceType:(int64_t)a3
{
  self->_multipathServiceType = a3;
}

- (BOOL)useUnifiedHTTPStack
{
  return self->_useUnifiedHTTPStack;
}

- (void)setUseUnifiedHTTPStack:(BOOL)a3
{
  self->_useUnifiedHTTPStack = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostOverride, 0);
  objc_storeStrong((id *)&self->_networkInterfaceName, 0);
  objc_storeStrong((id *)&self->_bonjourHost, 0);
  objc_storeStrong((id *)&self->customConfigurationDictionary, 0);
  objc_storeStrong((id *)&self->customConfigurationString, 0);
}

@end
