@implementation W5PeerDiscoveryEvent

- (W5PeerDiscoveryEvent)initWithPeersFound:(id)a3 peersLost:(id)a4 info:(id)a5
{
  id v9;
  id v10;
  id v11;
  W5PeerDiscoveryEvent *v12;
  W5PeerDiscoveryEvent *v13;
  NSDictionary *v14;
  NSObject *p_super;
  objc_super v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)W5PeerDiscoveryEvent;
  v12 = -[W5PeerDiscoveryEvent init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peersFound, a3);
    objc_storeStrong((id *)&v13->_peersLost, a4);
    v14 = (NSDictionary *)v11;
    p_super = &v13->_info->super;
    v13->_info = v14;
  }
  else
  {
    W5GetOSLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "-[W5PeerDiscoveryEvent initWithPeersFound:peersLost:info:]";
      v20 = 2080;
      v21 = "W5PeerDiscoveryEvent.m";
      v22 = 1024;
      v23 = 33;
      _os_log_send_and_compose_impl();
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5PeerDiscoveryEvent *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[W5PeerDiscoveryEvent init](+[W5PeerDiscoveryEvent allocWithZone:](W5PeerDiscoveryEvent, "allocWithZone:", a3), "init");
  -[W5PeerDiscoveryEvent peersFound](self, "peersFound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5PeerDiscoveryEvent setPeersFound:](v4, "setPeersFound:", v5);

  -[W5PeerDiscoveryEvent peersLost](self, "peersLost");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5PeerDiscoveryEvent setPeersLost:](v4, "setPeersLost:", v6);

  -[W5PeerDiscoveryEvent info](self, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5PeerDiscoveryEvent setInfo:](v4, "setInfo:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *peersFound;
  id v5;

  peersFound = self->_peersFound;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", peersFound, CFSTR("_peersFound"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peersLost, CFSTR("_peersLost"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_info, CFSTR("_info"));

}

- (W5PeerDiscoveryEvent)initWithCoder:(id)a3
{
  id v4;
  W5PeerDiscoveryEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *peersFound;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *peersLost;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *info;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)W5PeerDiscoveryEvent;
  v5 = -[W5PeerDiscoveryEvent init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_peersFound"));
    v9 = objc_claimAutoreleasedReturnValue();
    peersFound = v5->_peersFound;
    v5->_peersFound = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("_peersLost"));
    v14 = objc_claimAutoreleasedReturnValue();
    peersLost = v5->_peersLost;
    v5->_peersLost = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("_info"));
    v24 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (NSDictionary *)v24;

  }
  return v5;
}

- (NSArray)peersFound
{
  return self->_peersFound;
}

- (void)setPeersFound:(id)a3
{
  objc_storeStrong((id *)&self->_peersFound, a3);
}

- (NSArray)peersLost
{
  return self->_peersLost;
}

- (void)setPeersLost:(id)a3
{
  objc_storeStrong((id *)&self->_peersLost, a3);
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_peersLost, 0);
  objc_storeStrong((id *)&self->_peersFound, 0);
}

@end
