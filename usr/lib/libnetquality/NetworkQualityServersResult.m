@implementation NetworkQualityServersResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NetworkQualityServersResult)initWithCoder:(id)a3
{
  id v4;
  NetworkQualityServersResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *servers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NetworkQualityServersResult;
  v5 = -[NetworkQualityServersResult init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_servers"));
    v9 = objc_claimAutoreleasedReturnValue();
    servers = v5->_servers;
    v5->_servers = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_servers, CFSTR("_servers"));
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: _servers=%@>"), v5, self->_servers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NetworkQualityServersResult)init
{
  NetworkQualityServersResult *v2;
  NSArray *v3;
  NSArray *servers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NetworkQualityServersResult;
  v2 = -[NetworkQualityServersResult init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    servers = v2->_servers;
    v2->_servers = v3;

  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NetworkQualityServersResult *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(NetworkQualityServersResult);
  -[NetworkQualityServersResult servers](self, "servers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[NetworkQualityServersResult setServers:](v4, "setServers:", v6);

  return v4;
}

- (NSArray)servers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setServers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servers, 0);
}

@end
