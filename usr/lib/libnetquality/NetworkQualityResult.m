@implementation NetworkQualityResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NetworkQualityResult)initWithCoder:(id)a3
{
  id v4;
  NetworkQualityResult *v5;
  uint64_t v6;
  NSDate *timestamp;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NetworkQualityValue *downlinkCapacity;
  uint64_t v12;
  NSNumber *downlinkBytesTransferred;
  uint64_t v14;
  NSNumber *downlinkFlows;
  uint64_t v16;
  NSString *interfaceName;
  uint64_t v18;
  NetworkQualityValue *uplinkCapacity;
  uint64_t v20;
  NSNumber *uplinkBytesTransferred;
  uint64_t v22;
  NSNumber *uplinkFlows;
  uint64_t v24;
  NetworkQualityValue *downlinkResponsiveness;
  uint64_t v26;
  NSNumber *downlinkTCPResponsiveness;
  uint64_t v28;
  NSNumber *downlinkTLSResponsiveness;
  uint64_t v30;
  NSNumber *downlinkHTTPForeignResponsiveness;
  uint64_t v32;
  NSNumber *downlinkHTTPSelfResponsiveness;
  uint64_t v34;
  NetworkQualityValue *uplinkResponsiveness;
  uint64_t v36;
  NSNumber *uplinkTCPResponsiveness;
  uint64_t v38;
  NSNumber *uplinkTLSResponsiveness;
  uint64_t v40;
  NSNumber *uplinkHTTPForeignResponsiveness;
  uint64_t v42;
  NSNumber *uplinkHTTPSelfResponsiveness;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSDictionary *workingLatencyValues;
  uint64_t v51;
  NetworkQualityValue *latency;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSDictionary *idleLatencyValues;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSDictionary *protocolNames;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  NSDictionary *otherValues;
  uint64_t v74;
  NSString *testEndpoint;
  uint64_t v76;
  NSString *osVersion;
  uint64_t v78;
  NSError *error;
  uint64_t v80;
  NSString *appProtocol;
  void *v83;
  objc_super v84;

  v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)NetworkQualityResult;
  v5 = -[NetworkQualityResult init](&v84, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("index"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_index = objc_msgSend(v83, "integerValue");
    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("downlinkCapacity"));
    v10 = objc_claimAutoreleasedReturnValue();
    downlinkCapacity = v5->_downlinkCapacity;
    v5->_downlinkCapacity = (NetworkQualityValue *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("downlinkBytesTransferred"));
    v12 = objc_claimAutoreleasedReturnValue();
    downlinkBytesTransferred = v5->_downlinkBytesTransferred;
    v5->_downlinkBytesTransferred = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("downlinkFlows"));
    v14 = objc_claimAutoreleasedReturnValue();
    downlinkFlows = v5->_downlinkFlows;
    v5->_downlinkFlows = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interfaceName"));
    v16 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v16;

    v5->_isCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCellular"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("uplinkCapacity"));
    v18 = objc_claimAutoreleasedReturnValue();
    uplinkCapacity = v5->_uplinkCapacity;
    v5->_uplinkCapacity = (NetworkQualityValue *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("uplinkBytesTransferred"));
    v20 = objc_claimAutoreleasedReturnValue();
    uplinkBytesTransferred = v5->_uplinkBytesTransferred;
    v5->_uplinkBytesTransferred = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("uplinkFlows"));
    v22 = objc_claimAutoreleasedReturnValue();
    uplinkFlows = v5->_uplinkFlows;
    v5->_uplinkFlows = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("downlinkResponsiveness"));
    v24 = objc_claimAutoreleasedReturnValue();
    downlinkResponsiveness = v5->_downlinkResponsiveness;
    v5->_downlinkResponsiveness = (NetworkQualityValue *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("downlinkTCPResponsiveness"));
    v26 = objc_claimAutoreleasedReturnValue();
    downlinkTCPResponsiveness = v5->_downlinkTCPResponsiveness;
    v5->_downlinkTCPResponsiveness = (NSNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("downlinkTLSResponsiveness"));
    v28 = objc_claimAutoreleasedReturnValue();
    downlinkTLSResponsiveness = v5->_downlinkTLSResponsiveness;
    v5->_downlinkTLSResponsiveness = (NSNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("downlinkHTTPForeignResponsiveness"));
    v30 = objc_claimAutoreleasedReturnValue();
    downlinkHTTPForeignResponsiveness = v5->_downlinkHTTPForeignResponsiveness;
    v5->_downlinkHTTPForeignResponsiveness = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("downlinkHTTPSelfResponsiveness"));
    v32 = objc_claimAutoreleasedReturnValue();
    downlinkHTTPSelfResponsiveness = v5->_downlinkHTTPSelfResponsiveness;
    v5->_downlinkHTTPSelfResponsiveness = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("uplinkResponsiveness"));
    v34 = objc_claimAutoreleasedReturnValue();
    uplinkResponsiveness = v5->_uplinkResponsiveness;
    v5->_uplinkResponsiveness = (NetworkQualityValue *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("uplinkTCPResponsiveness"));
    v36 = objc_claimAutoreleasedReturnValue();
    uplinkTCPResponsiveness = v5->_uplinkTCPResponsiveness;
    v5->_uplinkTCPResponsiveness = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("uplinkTLSResponsiveness"));
    v38 = objc_claimAutoreleasedReturnValue();
    uplinkTLSResponsiveness = v5->_uplinkTLSResponsiveness;
    v5->_uplinkTLSResponsiveness = (NSNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("uplinkHTTPForeignResponsiveness"));
    v40 = objc_claimAutoreleasedReturnValue();
    uplinkHTTPForeignResponsiveness = v5->_uplinkHTTPForeignResponsiveness;
    v5->_uplinkHTTPForeignResponsiveness = (NSNumber *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("uplinkHTTPSelfResponsiveness"));
    v42 = objc_claimAutoreleasedReturnValue();
    uplinkHTTPSelfResponsiveness = v5->_uplinkHTTPSelfResponsiveness;
    v5->_uplinkHTTPSelfResponsiveness = (NSNumber *)v42;

    v44 = (void *)MEMORY[0x24BDBCF20];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, v46, v47, objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("workingLatencyValues"));
    v49 = objc_claimAutoreleasedReturnValue();
    workingLatencyValues = v5->_workingLatencyValues;
    v5->_workingLatencyValues = (NSDictionary *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("latency"));
    v51 = objc_claimAutoreleasedReturnValue();
    latency = v5->_latency;
    v5->_latency = (NetworkQualityValue *)v51;

    v53 = (void *)MEMORY[0x24BDBCF20];
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    objc_msgSend(v53, "setWithObjects:", v54, v55, v56, objc_opt_class(), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("idleLatencyValues"));
    v58 = objc_claimAutoreleasedReturnValue();
    idleLatencyValues = v5->_idleLatencyValues;
    v5->_idleLatencyValues = (NSDictionary *)v58;

    v60 = (void *)MEMORY[0x24BDBCF20];
    v61 = objc_opt_class();
    v62 = objc_opt_class();
    v63 = objc_opt_class();
    objc_msgSend(v60, "setWithObjects:", v61, v62, v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, CFSTR("protocolNamesValues"));
    v65 = objc_claimAutoreleasedReturnValue();
    protocolNames = v5->_protocolNames;
    v5->_protocolNames = (NSDictionary *)v65;

    v67 = (void *)MEMORY[0x24BDBCF20];
    v68 = objc_opt_class();
    v69 = objc_opt_class();
    v70 = objc_opt_class();
    objc_msgSend(v67, "setWithObjects:", v68, v69, v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, CFSTR("otherValues"));
    v72 = objc_claimAutoreleasedReturnValue();
    otherValues = v5->_otherValues;
    v5->_otherValues = (NSDictionary *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("testEndpoint"));
    v74 = objc_claimAutoreleasedReturnValue();
    testEndpoint = v5->_testEndpoint;
    v5->_testEndpoint = (NSString *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
    v76 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v78 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v78;

    v5->_proxied = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proxied"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appProtocol"));
    v80 = objc_claimAutoreleasedReturnValue();
    appProtocol = v5->_appProtocol;
    v5->_appProtocol = (NSString *)v80;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;
  id v6;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", self->_index);
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("index"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkCapacity, CFSTR("downlinkCapacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkBytesTransferred, CFSTR("downlinkBytesTransferred"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkFlows, CFSTR("downlinkFlows"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interfaceName, CFSTR("interfaceName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCellular, CFSTR("isCellular"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkCapacity, CFSTR("uplinkCapacity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkBytesTransferred, CFSTR("uplinkBytesTransferred"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkFlows, CFSTR("uplinkFlows"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkResponsiveness, CFSTR("downlinkResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkTCPResponsiveness, CFSTR("downlinkTCPResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkTLSResponsiveness, CFSTR("downlinkTLSResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkHTTPForeignResponsiveness, CFSTR("downlinkHTTPForeignResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_downlinkHTTPSelfResponsiveness, CFSTR("downlinkHTTPSelfResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkResponsiveness, CFSTR("uplinkResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkTCPResponsiveness, CFSTR("uplinkTCPResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkTLSResponsiveness, CFSTR("uplinkTLSResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkHTTPForeignResponsiveness, CFSTR("uplinkHTTPForeignResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uplinkHTTPSelfResponsiveness, CFSTR("uplinkHTTPSelfResponsiveness"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workingLatencyValues, CFSTR("workingLatencyValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_latency, CFSTR("latency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tcpLatency, CFSTR("tcpLatency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tlsLatency, CFSTR("tlsLatency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_httpLatency, CFSTR("httpLatency"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_idleLatencyValues, CFSTR("idleLatencyValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protocolNames, CFSTR("protocolNamesValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_otherValues, CFSTR("otherValues"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_testEndpoint, CFSTR("testEndpoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersion, CFSTR("osVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_proxied, CFSTR("proxied"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appProtocol, CFSTR("appProtocol"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: _downlinkCapacity=%@, _uplinkCapacity=%@, _downlinkResponsiveness=%@, _uplinkResponsiveness=%@>"), v5, self->_downlinkCapacity, self->_uplinkCapacity, self->_downlinkResponsiveness, self->_uplinkResponsiveness);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int64_t)ratingForResponsivenessScore:(int64_t)a3
{
  if (a3 <= 1000)
    return a3 > 200;
  else
    return 2;
}

- (NetworkQualityResult)init
{
  NetworkQualityResult *v2;
  NetworkQualityValue *v3;
  NetworkQualityValue *downlinkCapacity;
  NetworkQualityValue *v5;
  NetworkQualityValue *uplinkCapacity;
  NetworkQualityValue *v7;
  NetworkQualityValue *downlinkResponsiveness;
  NetworkQualityValue *v9;
  NetworkQualityValue *uplinkResponsiveness;
  NSDictionary *v11;
  NSDictionary *workingLatencyValues;
  NetworkQualityValue *v13;
  NetworkQualityValue *latency;
  NSDictionary *v15;
  NSDictionary *idleLatencyValues;
  NSDictionary *v17;
  NSDictionary *protocolNames;
  NSDictionary *v19;
  NSDictionary *otherValues;
  NSDictionary *v21;
  NSDictionary *urlSessionMetrics;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)NetworkQualityResult;
  v2 = -[NetworkQualityResult init](&v24, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NetworkQualityValue);
    downlinkCapacity = v2->_downlinkCapacity;
    v2->_downlinkCapacity = v3;

    v5 = objc_alloc_init(NetworkQualityValue);
    uplinkCapacity = v2->_uplinkCapacity;
    v2->_uplinkCapacity = v5;

    v7 = objc_alloc_init(NetworkQualityValue);
    downlinkResponsiveness = v2->_downlinkResponsiveness;
    v2->_downlinkResponsiveness = v7;

    v9 = objc_alloc_init(NetworkQualityValue);
    uplinkResponsiveness = v2->_uplinkResponsiveness;
    v2->_uplinkResponsiveness = v9;

    v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    workingLatencyValues = v2->_workingLatencyValues;
    v2->_workingLatencyValues = v11;

    v13 = objc_alloc_init(NetworkQualityValue);
    latency = v2->_latency;
    v2->_latency = v13;

    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    idleLatencyValues = v2->_idleLatencyValues;
    v2->_idleLatencyValues = v15;

    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    protocolNames = v2->_protocolNames;
    v2->_protocolNames = v17;

    v19 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    otherValues = v2->_otherValues;
    v2->_otherValues = v19;

    v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    urlSessionMetrics = v2->_urlSessionMetrics;
    v2->_urlSessionMetrics = v21;

  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NetworkQualityResult *v4;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v4 = objc_alloc_init(NetworkQualityResult);
  -[NetworkQualityResult timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NetworkQualityResult setTimestamp:](v4, "setTimestamp:", v6);

  -[NetworkQualityResult setIndex:](v4, "setIndex:", -[NetworkQualityResult index](self, "index"));
  -[NetworkQualityResult downlinkCapacity](self, "downlinkCapacity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[NetworkQualityResult setDownlinkCapacity:](v4, "setDownlinkCapacity:", v8);

  -[NetworkQualityResult downlinkBytesTransferred](self, "downlinkBytesTransferred");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[NetworkQualityResult setDownlinkBytesTransferred:](v4, "setDownlinkBytesTransferred:", v10);

  -[NetworkQualityResult downlinkFlows](self, "downlinkFlows");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[NetworkQualityResult setDownlinkFlows:](v4, "setDownlinkFlows:", v12);

  -[NetworkQualityResult interfaceName](self, "interfaceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[NetworkQualityResult setInterfaceName:](v4, "setInterfaceName:", v14);

  -[NetworkQualityResult setIsCellular:](v4, "setIsCellular:", -[NetworkQualityResult isCellular](self, "isCellular"));
  -[NetworkQualityResult uplinkCapacity](self, "uplinkCapacity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[NetworkQualityResult setUplinkCapacity:](v4, "setUplinkCapacity:", v16);

  -[NetworkQualityResult uplinkBytesTransferred](self, "uplinkBytesTransferred");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  -[NetworkQualityResult setUplinkBytesTransferred:](v4, "setUplinkBytesTransferred:", v18);

  -[NetworkQualityResult uplinkFlows](self, "uplinkFlows");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  -[NetworkQualityResult setUplinkFlows:](v4, "setUplinkFlows:", v20);

  -[NetworkQualityResult downlinkResponsiveness](self, "downlinkResponsiveness");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  -[NetworkQualityResult setDownlinkResponsiveness:](v4, "setDownlinkResponsiveness:", v22);

  -[NetworkQualityResult downlinkTCPResponsiveness](self, "downlinkTCPResponsiveness");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[NetworkQualityResult setDownlinkTCPResponsiveness:](v4, "setDownlinkTCPResponsiveness:", v24);

  -[NetworkQualityResult downlinkTLSResponsiveness](self, "downlinkTLSResponsiveness");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  -[NetworkQualityResult setDownlinkTLSResponsiveness:](v4, "setDownlinkTLSResponsiveness:", v26);

  -[NetworkQualityResult downlinkHTTPForeignResponsiveness](self, "downlinkHTTPForeignResponsiveness");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  -[NetworkQualityResult setDownlinkHTTPForeignResponsiveness:](v4, "setDownlinkHTTPForeignResponsiveness:", v28);

  -[NetworkQualityResult downlinkHTTPSelfResponsiveness](self, "downlinkHTTPSelfResponsiveness");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  -[NetworkQualityResult setDownlinkHTTPSelfResponsiveness:](v4, "setDownlinkHTTPSelfResponsiveness:", v30);

  -[NetworkQualityResult uplinkResponsiveness](self, "uplinkResponsiveness");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[NetworkQualityResult setUplinkResponsiveness:](v4, "setUplinkResponsiveness:", v32);

  -[NetworkQualityResult uplinkTCPResponsiveness](self, "uplinkTCPResponsiveness");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  -[NetworkQualityResult setUplinkTCPResponsiveness:](v4, "setUplinkTCPResponsiveness:", v34);

  -[NetworkQualityResult uplinkTLSResponsiveness](self, "uplinkTLSResponsiveness");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  -[NetworkQualityResult setUplinkTLSResponsiveness:](v4, "setUplinkTLSResponsiveness:", v36);

  -[NetworkQualityResult uplinkHTTPForeignResponsiveness](self, "uplinkHTTPForeignResponsiveness");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  -[NetworkQualityResult setUplinkHTTPForeignResponsiveness:](v4, "setUplinkHTTPForeignResponsiveness:", v38);

  -[NetworkQualityResult uplinkHTTPSelfResponsiveness](self, "uplinkHTTPSelfResponsiveness");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  -[NetworkQualityResult setUplinkHTTPSelfResponsiveness:](v4, "setUplinkHTTPSelfResponsiveness:", v40);

  -[NetworkQualityResult workingLatencyValues](self, "workingLatencyValues");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  -[NetworkQualityResult setWorkingLatencyValues:](v4, "setWorkingLatencyValues:", v42);

  -[NetworkQualityResult latency](self, "latency");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  -[NetworkQualityResult setLatency:](v4, "setLatency:", v44);

  -[NetworkQualityResult tcpLatency](self, "tcpLatency");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  -[NetworkQualityResult setTcpLatency:](v4, "setTcpLatency:", v46);

  -[NetworkQualityResult tlsLatency](self, "tlsLatency");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  -[NetworkQualityResult setTlsLatency:](v4, "setTlsLatency:", v48);

  -[NetworkQualityResult httpLatency](self, "httpLatency");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  -[NetworkQualityResult setHttpLatency:](v4, "setHttpLatency:", v50);

  -[NetworkQualityResult idleLatencyValues](self, "idleLatencyValues");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copy");
  -[NetworkQualityResult setIdleLatencyValues:](v4, "setIdleLatencyValues:", v52);

  -[NetworkQualityResult protocolNames](self, "protocolNames");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copy");
  -[NetworkQualityResult setProtocolNames:](v4, "setProtocolNames:", v54);

  -[NetworkQualityResult otherValues](self, "otherValues");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copy");
  -[NetworkQualityResult setOtherValues:](v4, "setOtherValues:", v56);

  -[NetworkQualityResult urlSessionMetrics](self, "urlSessionMetrics");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copy");
  -[NetworkQualityResult setUrlSessionMetrics:](v4, "setUrlSessionMetrics:", v58);

  -[NetworkQualityResult testEndpoint](self, "testEndpoint");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "copy");
  -[NetworkQualityResult setTestEndpoint:](v4, "setTestEndpoint:", v60);

  -[NetworkQualityResult osVersion](self, "osVersion");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copy");
  -[NetworkQualityResult setOsVersion:](v4, "setOsVersion:", v62);

  -[NetworkQualityResult error](self, "error");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "copy");
  -[NetworkQualityResult setError:](v4, "setError:", v64);

  -[NetworkQualityResult setProxied:](v4, "setProxied:", -[NetworkQualityResult proxied](self, "proxied"));
  -[NetworkQualityResult appProtocol](self, "appProtocol");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "copy");
  -[NetworkQualityResult setAppProtocol:](v4, "setAppProtocol:", v66);

  return v4;
}

- (void)finalizeResult
{
  void *v3;
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
  id v15;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityResult setTimestamp:](self, "setTimestamp:", v3);

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[NetworkQualityResult downlinkResponsiveness](self, "downlinkResponsiveness");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", +[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", objc_msgSend(v6, "integerValue")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityResult downlinkResponsiveness](self, "downlinkResponsiveness");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRating:", v7);

  v9 = (void *)MEMORY[0x24BDD16E0];
  -[NetworkQualityResult uplinkResponsiveness](self, "uplinkResponsiveness");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", +[NetworkQualityResult ratingForResponsivenessScore:](NetworkQualityResult, "ratingForResponsivenessScore:", objc_msgSend(v11, "integerValue")));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityResult uplinkResponsiveness](self, "uplinkResponsiveness");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRating:", v12);

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "operatingSystemVersionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NetworkQualityResult setOsVersion:](self, "setOsVersion:", v14);

}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NetworkQualityValue)downlinkCapacity
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDownlinkCapacity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)downlinkBytesTransferred
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownlinkBytesTransferred:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)downlinkFlows
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDownlinkFlows:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)isCellular
{
  return self->_isCellular;
}

- (void)setIsCellular:(BOOL)a3
{
  self->_isCellular = a3;
}

- (NetworkQualityValue)uplinkCapacity
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUplinkCapacity:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)uplinkBytesTransferred
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUplinkBytesTransferred:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)uplinkFlows
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUplinkFlows:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NetworkQualityValue)downlinkResponsiveness
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownlinkResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSNumber)downlinkTCPResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDownlinkTCPResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSNumber)downlinkTLSResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDownlinkTLSResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)downlinkHTTPForeignResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDownlinkHTTPForeignResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSNumber)downlinkHTTPSelfResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDownlinkHTTPSelfResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NetworkQualityValue)uplinkResponsiveness
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUplinkResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSNumber)uplinkTCPResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUplinkTCPResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSNumber)uplinkTLSResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUplinkTLSResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSNumber)uplinkHTTPForeignResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUplinkHTTPForeignResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSNumber)uplinkHTTPSelfResponsiveness
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUplinkHTTPSelfResponsiveness:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSDictionary)workingLatencyValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setWorkingLatencyValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NetworkQualityValue)latency
{
  return (NetworkQualityValue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLatency:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (NSNumber)tcpLatency
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTcpLatency:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (NSNumber)tlsLatency
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTlsLatency:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSNumber)httpLatency
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setHttpLatency:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSDictionary)idleLatencyValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setIdleLatencyValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 208);
}

- (NSDictionary)protocolNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProtocolNames:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (NSDictionary)otherValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setOtherValues:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (NSDictionary)urlSessionMetrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setUrlSessionMetrics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (NSString)testEndpoint
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTestEndpoint:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 240);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 248);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (BOOL)proxied
{
  return self->_proxied;
}

- (void)setProxied:(BOOL)a3
{
  self->_proxied = a3;
}

- (NSString)appProtocol
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAppProtocol:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appProtocol, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_urlSessionMetrics, 0);
  objc_storeStrong((id *)&self->_otherValues, 0);
  objc_storeStrong((id *)&self->_protocolNames, 0);
  objc_storeStrong((id *)&self->_idleLatencyValues, 0);
  objc_storeStrong((id *)&self->_httpLatency, 0);
  objc_storeStrong((id *)&self->_tlsLatency, 0);
  objc_storeStrong((id *)&self->_tcpLatency, 0);
  objc_storeStrong((id *)&self->_latency, 0);
  objc_storeStrong((id *)&self->_workingLatencyValues, 0);
  objc_storeStrong((id *)&self->_uplinkHTTPSelfResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkHTTPForeignResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkTLSResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkTCPResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkHTTPSelfResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkHTTPForeignResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkTLSResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkTCPResponsiveness, 0);
  objc_storeStrong((id *)&self->_downlinkResponsiveness, 0);
  objc_storeStrong((id *)&self->_uplinkFlows, 0);
  objc_storeStrong((id *)&self->_uplinkBytesTransferred, 0);
  objc_storeStrong((id *)&self->_uplinkCapacity, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_downlinkFlows, 0);
  objc_storeStrong((id *)&self->_downlinkBytesTransferred, 0);
  objc_storeStrong((id *)&self->_downlinkCapacity, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
