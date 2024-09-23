@implementation SFRemoteHotspotInfo

- (SFRemoteHotspotInfo)initWithName:(id)a3 password:(id)a4 channel:(id)a5
{
  id v8;
  id v9;
  id v10;
  SFRemoteHotspotInfo *v11;
  uint64_t v12;
  NSString *name;
  uint64_t v14;
  NSString *password;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFRemoteHotspotInfo;
  v11 = -[SFRemoteHotspotInfo init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    password = v11->_password;
    v11->_password = (NSString *)v14;

    objc_storeStrong((id *)&v11->_channel, a5);
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_password)
    v7 = "yes";
  else
    v7 = "no";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name: %@, channel: %@, hasPassword: %s>"), v5, self, self->_name, self->_channel, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SFRemoteHotspotInfo)initWithCoder:(id)a3
{
  id v4;
  SFRemoteHotspotInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
  void *v9;
  uint64_t v10;
  NSString *password;
  void *v12;
  uint64_t v13;
  NSNumber *channel;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFRemoteHotspotInfo;
  v5 = -[SFRemoteHotspotInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkPassword"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    password = v5->_password;
    v5->_password = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkChannel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    channel = v5->_channel;
    v5->_channel = (NSNumber *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("networkName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_password, CFSTR("networkPassword"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_channel, CFSTR("networkChannel"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSNumber)channel
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
