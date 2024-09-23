@implementation NSPOutageReasonStats

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPOutageReasonStats)initWithCoder:(id)a3
{
  id v4;
  NSPOutageReasonStats *v5;
  id v6;
  uint64_t v7;
  NSString *tierType;
  id v9;
  uint64_t v10;
  NSString *outageReasonType;
  id v12;
  uint64_t v13;
  NSString *outageReasonSubType;
  id v15;
  uint64_t v16;
  NSString *primaryIngressProxy;
  id v18;
  uint64_t v19;
  NSString *primaryEgressProxy;
  id v21;
  uint64_t v22;
  NSString *fallbackIngressProxy;
  id v24;
  uint64_t v25;
  NSString *fallbackEgressProxy;
  id v27;
  uint64_t v28;
  NSString *odohProxy;
  id v30;
  uint64_t v31;
  NSString *tokenProxy;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NSPOutageReasonStats;
  v5 = -[NSPOutageReasonStats init](&v34, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("TierType"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    tierType = v5->_tierType;
    v5->_tierType = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("OutageReasonType"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    outageReasonType = v5->_outageReasonType;
    v5->_outageReasonType = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("OutageReasonSubType"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    outageReasonSubType = v5->_outageReasonSubType;
    v5->_outageReasonSubType = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("PrimaryIngressProxy"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    primaryIngressProxy = v5->_primaryIngressProxy;
    v5->_primaryIngressProxy = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("PrimaryEgressProxy"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    primaryEgressProxy = v5->_primaryEgressProxy;
    v5->_primaryEgressProxy = (NSString *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("FallbackIngressProxy"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    fallbackIngressProxy = v5->_fallbackIngressProxy;
    v5->_fallbackIngressProxy = (NSString *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("FallbackEgressProxy"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    fallbackEgressProxy = v5->_fallbackEgressProxy;
    v5->_fallbackEgressProxy = (NSString *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ODoHProxy"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    odohProxy = v5->_odohProxy;
    v5->_odohProxy = (NSString *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("TokenProxy"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    tokenProxy = v5->_tokenProxy;
    v5->_tokenProxy = (NSString *)v31;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tierType](self, "tierType"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("TierType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("OutageReasonType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("OutageReasonSubType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryIngressProxy](self, "primaryIngressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("PrimaryIngressProxy"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryEgressProxy](self, "primaryEgressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("PrimaryEgressProxy"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackIngressProxy](self, "fallbackIngressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("FallbackIngressProxy"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackEgressProxy](self, "fallbackEgressProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("FallbackEgressProxy"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats odohProxy](self, "odohProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ODoHProxy"));

  v13 = (id)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tokenProxy](self, "tokenProxy"));
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("TokenProxy"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPOutageReasonStats *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = -[NSPOutageReasonStats init](+[NSPOutageReasonStats allocWithZone:](NSPOutageReasonStats, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tierType](self, "tierType"));
  -[NSPOutageReasonStats setTierType:](v4, "setTierType:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));
  -[NSPOutageReasonStats setOutageReasonType:](v4, "setOutageReasonType:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));
  -[NSPOutageReasonStats setOutageReasonSubType:](v4, "setOutageReasonSubType:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryIngressProxy](self, "primaryIngressProxy"));
  -[NSPOutageReasonStats setPrimaryIngressProxy:](v4, "setPrimaryIngressProxy:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryEgressProxy](self, "primaryEgressProxy"));
  -[NSPOutageReasonStats setPrimaryEgressProxy:](v4, "setPrimaryEgressProxy:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackIngressProxy](self, "fallbackIngressProxy"));
  -[NSPOutageReasonStats setFallbackIngressProxy:](v4, "setFallbackIngressProxy:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackEgressProxy](self, "fallbackEgressProxy"));
  -[NSPOutageReasonStats setFallbackEgressProxy:](v4, "setFallbackEgressProxy:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats odohProxy](self, "odohProxy"));
  -[NSPOutageReasonStats setOdohProxy:](v4, "setOdohProxy:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tokenProxy](self, "tokenProxy"));
  -[NSPOutageReasonStats setTokenProxy:](v4, "setTokenProxy:", v13);

  return v4;
}

- (id)eventName
{
  return CFSTR("com.apple.nsp.outageReasonStats");
}

- (id)analyticsDict
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  const char *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));

  if (!v3)
  {
    v22 = nplog_obj(v4, v5, v6);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    v26 = 136315138;
    v27 = "-[NSPOutageReasonStats analyticsDict]";
    v24 = "%s called with null self.outageReasonType";
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v26, 0xCu);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));

  if (!v7)
  {
    v25 = nplog_obj(v8, v9, v10);
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v26 = 136315138;
    v27 = "-[NSPOutageReasonStats analyticsDict]";
    v24 = "%s called with null self.outageReasonSubType";
    goto LABEL_10;
  }
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tierType](self, "tierType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("TierType"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonType](self, "outageReasonType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("OutageReasonType"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats outageReasonSubType](self, "outageReasonSubType"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("OutageReasonSubType"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryIngressProxy](self, "primaryIngressProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("PrimaryIngressProxy"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats primaryEgressProxy](self, "primaryEgressProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("PrimaryEgressProxy"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackIngressProxy](self, "fallbackIngressProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("FallbackIngressProxy"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats fallbackEgressProxy](self, "fallbackEgressProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("FallbackEgressProxy"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats odohProxy](self, "odohProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, CFSTR("ODoHProxy"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSPOutageReasonStats tokenProxy](self, "tokenProxy"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("TokenProxy"));

  return v11;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (NSString)outageReasonType
{
  return self->_outageReasonType;
}

- (void)setOutageReasonType:(id)a3
{
  objc_storeStrong((id *)&self->_outageReasonType, a3);
}

- (NSString)outageReasonSubType
{
  return self->_outageReasonSubType;
}

- (void)setOutageReasonSubType:(id)a3
{
  objc_storeStrong((id *)&self->_outageReasonSubType, a3);
}

- (NSString)primaryIngressProxy
{
  return self->_primaryIngressProxy;
}

- (void)setPrimaryIngressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_primaryIngressProxy, a3);
}

- (NSString)primaryEgressProxy
{
  return self->_primaryEgressProxy;
}

- (void)setPrimaryEgressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_primaryEgressProxy, a3);
}

- (NSString)fallbackIngressProxy
{
  return self->_fallbackIngressProxy;
}

- (void)setFallbackIngressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackIngressProxy, a3);
}

- (NSString)fallbackEgressProxy
{
  return self->_fallbackEgressProxy;
}

- (void)setFallbackEgressProxy:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackEgressProxy, a3);
}

- (NSString)odohProxy
{
  return self->_odohProxy;
}

- (void)setOdohProxy:(id)a3
{
  objc_storeStrong((id *)&self->_odohProxy, a3);
}

- (NSString)tokenProxy
{
  return self->_tokenProxy;
}

- (void)setTokenProxy:(id)a3
{
  objc_storeStrong((id *)&self->_tokenProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenProxy, 0);
  objc_storeStrong((id *)&self->_odohProxy, 0);
  objc_storeStrong((id *)&self->_fallbackEgressProxy, 0);
  objc_storeStrong((id *)&self->_fallbackIngressProxy, 0);
  objc_storeStrong((id *)&self->_primaryEgressProxy, 0);
  objc_storeStrong((id *)&self->_primaryIngressProxy, 0);
  objc_storeStrong((id *)&self->_outageReasonSubType, 0);
  objc_storeStrong((id *)&self->_outageReasonType, 0);
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end
