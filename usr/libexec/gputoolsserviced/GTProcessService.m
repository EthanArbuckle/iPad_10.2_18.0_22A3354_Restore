@implementation GTProcessService

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessService)initWithService:(id)a3 processInfo:(id)a4
{
  id v7;
  id v8;
  GTProcessService *v9;
  GTProcessService *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTProcessService;
  v9 = -[GTProcessService init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProperties, a3);
    objc_storeStrong((id *)&v10->_processInfo, a4);
  }

  return v10;
}

- (GTProcessService)initWithCoder:(id)a3
{
  id v4;
  GTProcessService *v5;
  id v6;
  uint64_t v7;
  GTServiceProperties *serviceProperties;
  id v9;
  uint64_t v10;
  GTProcessInfo *processInfo;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTProcessService;
  v5 = -[GTProcessService init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GTServiceProperties), CFSTR("serviceProperties"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    serviceProperties = v5->_serviceProperties;
    v5->_serviceProperties = (GTServiceProperties *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(GTProcessInfo), CFSTR("processInfo"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    processInfo = v5->_processInfo;
    v5->_processInfo = (GTProcessInfo *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GTServiceProperties *serviceProperties;
  id v5;

  serviceProperties = self->_serviceProperties;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceProperties, CFSTR("serviceProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processInfo, CFSTR("processInfo"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  GTProcessService *v4;

  v4 = objc_alloc_init(GTProcessService);
  -[GTProcessService setServiceProperties:](v4, "setServiceProperties:", self->_serviceProperties);
  -[GTProcessService setProcessInfo:](v4, "setProcessInfo:", self->_processInfo);
  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: serviceProperties=%@ processInfo=%@>"), objc_opt_class(self), self->_serviceProperties, self->_processInfo);
}

- (GTServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (GTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
}

@end
