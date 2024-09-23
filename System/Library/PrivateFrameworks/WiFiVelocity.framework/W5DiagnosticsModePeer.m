@implementation W5DiagnosticsModePeer

- (W5DiagnosticsModePeer)initWithRole:(int64_t)a3 peer:(id)a4
{
  return -[W5DiagnosticsModePeer initWithRole:peer:info:](self, "initWithRole:peer:info:", a3, a4, 0);
}

- (W5DiagnosticsModePeer)initWithRole:(int64_t)a3 peer:(id)a4 info:(id)a5
{
  id v9;
  id v10;
  W5DiagnosticsModePeer *v11;
  W5DiagnosticsModePeer *v12;
  NSMutableDictionary *v13;
  NSObject *p_super;
  objc_super v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)W5DiagnosticsModePeer;
  v11 = -[W5DiagnosticsModePeer init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_role = a3;
    objc_storeStrong((id *)&v11->_peer, a4);
    v13 = (NSMutableDictionary *)v10;
    p_super = &v12->_info->super.super;
    v12->_info = v13;
  }
  else
  {
    W5GetOSLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = "-[W5DiagnosticsModePeer initWithRole:peer:info:]";
      v19 = 2080;
      v20 = "W5DiagnosticsModePeer.m";
      v21 = 1024;
      v22 = 37;
      _os_log_send_and_compose_impl();
    }
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5DiagnosticsModePeer *v4;
  void *v5;
  void *v6;

  v4 = -[W5DiagnosticsModePeer init](+[W5DiagnosticsModePeer allocWithZone:](W5DiagnosticsModePeer, "allocWithZone:", a3), "init");
  -[W5DiagnosticsModePeer setRole:](v4, "setRole:", -[W5DiagnosticsModePeer role](self, "role"));
  -[W5DiagnosticsModePeer peer](self, "peer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5DiagnosticsModePeer setPeer:](v4, "setPeer:", v5);

  -[W5DiagnosticsModePeer info](self, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[W5DiagnosticsModePeer setInfo:](v4, "setInfo:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t role;
  id v5;

  role = self->_role;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", role, CFSTR("_role"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_peer, CFSTR("_peer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_info, CFSTR("_info"));

}

- (W5DiagnosticsModePeer)initWithCoder:(id)a3
{
  id v4;
  W5DiagnosticsModePeer *v5;
  void *v6;
  uint64_t v7;
  W5Peer *peer;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *info;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)W5DiagnosticsModePeer;
  v5 = -[W5DiagnosticsModePeer init](&v22, sel_init);
  if (v5)
  {
    v5->_role = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_role"));
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_peer"));
    v7 = objc_claimAutoreleasedReturnValue();
    peer = v5->_peer;
    v5->_peer = (W5Peer *)v7;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_info"));
    v18 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (NSMutableDictionary *)v18;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  W5DescriptionForDiagnosticsRole(self->_role);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Diagnostics Mode Peer role='%@ (%ld)' with peer='%@' info='%@'"), v4, self->_role, self->_peer, self->_info);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (W5Peer)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_storeStrong((id *)&self->_peer, a3);
}

- (NSMutableDictionary)info
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
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
