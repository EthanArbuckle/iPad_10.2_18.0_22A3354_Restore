@implementation USWebUsageReport

- (USWebUsageReport)initWithDomainIdentifier:(id)a3 totalUsageTime:(double)a4 webUsageByDomain:(id)a5
{
  return -[USWebUsageReport initWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](self, "initWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", a3, 1, a5, a4);
}

- (USWebUsageReport)initWithDomainIdentifier:(id)a3 webUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 webUsageByDomain:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  USWebUsageReport *v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)USWebUsageReport;
  v9 = a6;
  v10 = a3;
  v11 = -[USWebUsageReport init](&v13, sel_init);
  -[USWebUsageReport _usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](v11, "_usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", v10, v7, v9, a5, v13.receiver, v13.super_class);

  return v11;
}

- (void)_usWebUsageReportCommonInitWithDomainIdentifier:(id)a3 webUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 webUsageByDomain:(id)a6
{
  id v10;
  NSString *v11;
  NSString *domainIdentifier;
  NSDictionary *v13;
  NSDictionary *webUsageByDomain;

  v10 = a6;
  v11 = (NSString *)objc_msgSend(a3, "copy");
  domainIdentifier = self->_domainIdentifier;
  self->_domainIdentifier = v11;

  self->_webUsageTrusted = a4;
  self->_totalUsageTime = a5;
  v13 = (NSDictionary *)objc_msgSend(v10, "copy");

  webUsageByDomain = self->_webUsageByDomain;
  self->_webUsageByDomain = v13;

}

- (USWebUsageReport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  USWebUsageReport *v14;
  USWebUsageReport *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DomainIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("WebUsageTrusted")))
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WebUsageTrusted"));
  else
    v6 = 1;
  v7 = objc_alloc(MEMORY[0x24BDBCF20]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("WebUsageByDomain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "containsValueForKey:", CFSTR("TotalUsageTime"));
  v13 = v12;
  if (v5 && v11 && v12)
  {
    v18.receiver = self;
    v18.super_class = (Class)USWebUsageReport;
    v14 = -[USWebUsageReport init](&v18, sel_init);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TotalUsageTime"));
    -[USWebUsageReport _usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:](v14, "_usWebUsageReportCommonInitWithDomainIdentifier:webUsageTrusted:totalUsageTime:webUsageByDomain:", v5, v6, v11);
    self = v14;
    v15 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v20 = v5;
      v21 = 1026;
      v22 = v6;
      v23 = 2114;
      v24 = v11;
      v25 = 1026;
      v26 = v13;
      _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to decode USWebUsageReport with domainIdentifier: %{public}@, webUsageTrusted: %{public}d, webUsageByDomain: %{public}@, hasTotalUsageTime: %{public}d", buf, 0x22u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4865, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v16);

    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainIdentifier;
  id v5;

  domainIdentifier = self->_domainIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainIdentifier, CFSTR("DomainIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_webUsageTrusted, CFSTR("WebUsageTrusted"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("TotalUsageTime"), self->_totalUsageTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_webUsageByDomain, CFSTR("WebUsageByDomain"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;
  objc_super v17;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v17.receiver = self;
  v17.super_class = (Class)USWebUsageReport;
  -[USWebUsageReport description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USWebUsageReport domainIdentifier](self, "domainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[USWebUsageReport webUsageTrusted](self, "webUsageTrusted");
  -[USWebUsageReport totalUsageTime](self, "totalUsageTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, DomainIdentifier: %@, WebUsageTrusted: %d, TotalUsageTime: %f, WebUsage: {"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 1;
  -[USWebUsageReport webUsageByDomain](self, "webUsageByDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __31__USWebUsageReport_description__block_invoke;
  v12[3] = &unk_24C7DB670;
  v14 = v15;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v12);

  objc_msgSend(v10, "appendString:", CFSTR("}"));
  _Block_object_dispose(v15, 8);
  return v10;
}

uint64_t __31__USWebUsageReport_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 24))
    return objc_msgSend(v4, "appendFormat:", CFSTR(", %@: %@"), a2, a3);
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSString)domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)webUsageTrusted
{
  return self->_webUsageTrusted;
}

- (double)totalUsageTime
{
  return self->_totalUsageTime;
}

- (NSDictionary)webUsageByDomain
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUsageByDomain, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end
