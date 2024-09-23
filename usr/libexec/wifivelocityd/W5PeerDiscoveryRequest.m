@implementation W5PeerDiscoveryRequest

- (W5PeerDiscoveryRequest)initWithConfiguration:(id)a3 uuid:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  W5PeerDiscoveryRequest *v12;
  W5PeerDiscoveryRequest *v13;
  id v14;
  id handler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)W5PeerDiscoveryRequest;
  v12 = -[W5PeerDiscoveryRequest init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeStrong((id *)&v13->_uuid, a4);
    v14 = objc_retainBlock(v11);
    handler = v13->_handler;
    v13->_handler = v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", 0));
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ : %p "), v7, self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
  objc_msgSend(v3, "appendFormat:", CFSTR("UUID='%@' "), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest configuration](self, "configuration"));
  objc_msgSend(v3, "appendFormat:", CFSTR("configuration='%@'"), v10);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v11 = objc_msgSend(v3, "copy");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  W5PeerDiscoveryRequest *v4;
  uint64_t v5;
  W5PeerDiscoveryRequest *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (W5PeerDiscoveryRequest *)a3;
  v6 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = -[W5PeerDiscoveryRequest isEqualToPeerDiscoveryRequest:](self, "isEqualToPeerDiscoveryRequest:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToPeerDiscoveryRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest uuid](self, "uuid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiscoveryRequest uuid](self, "uuid"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (W5PeerDiscoveryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
