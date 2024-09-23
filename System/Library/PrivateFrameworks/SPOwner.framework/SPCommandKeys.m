@implementation SPCommandKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCommandKeys)initWithBeaconingKey:(id)a3 commandKey:(id)a4 connectionToken:(id)a5 nearbyToken:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SPCommandKeys *v15;
  SPCommandKeys *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SPCommandKeys;
  v15 = -[SPCommandKeys init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_beaconingKey, a3);
    objc_storeStrong((id *)&v16->_commandKey, a4);
    objc_storeStrong((id *)&v16->_connectionToken, a5);
    objc_storeStrong((id *)&v16->_nearbyToken, a6);
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPCommandKeys *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SPCommandKeys *v9;

  v4 = [SPCommandKeys alloc];
  -[SPCommandKeys beaconingKey](self, "beaconingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKeys commandKey](self, "commandKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKeys connectionToken](self, "connectionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKeys nearbyToken](self, "nearbyToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SPCommandKeys initWithBeaconingKey:commandKey:connectionToken:nearbyToken:](v4, "initWithBeaconingKey:commandKey:connectionToken:nearbyToken:", v5, v6, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  SPBeaconingKey *beaconingKey;
  id v5;

  beaconingKey = self->_beaconingKey;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beaconingKey, CFSTR("beaconingKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commandKey, CFSTR("commandKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_connectionToken, CFSTR("connectionToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nearbyToken, CFSTR("nearbyToken"));

}

- (SPCommandKeys)initWithCoder:(id)a3
{
  id v4;
  SPBeaconingKey *v5;
  SPBeaconingKey *beaconingKey;
  NSData *v7;
  NSData *commandKey;
  NSData *v9;
  NSData *connectionToken;
  NSData *v11;
  NSData *nearbyToken;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconingKey"));
  v5 = (SPBeaconingKey *)objc_claimAutoreleasedReturnValue();
  beaconingKey = self->_beaconingKey;
  self->_beaconingKey = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("commandKey"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  commandKey = self->_commandKey;
  self->_commandKey = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectionToken"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  connectionToken = self->_connectionToken;
  self->_connectionToken = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nearbyToken"));
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();

  nearbyToken = self->_nearbyToken;
  self->_nearbyToken = v11;

  return self;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPCommandKeys beaconingKey](self, "beaconingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKeys commandKey](self, "commandKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[SPCommandKeys connectionToken](self, "connectionToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  -[SPCommandKeys nearbyToken](self, "nearbyToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p -- beaconingKey: %@ commandKey: %lu connectionToken: %lu nearbyToken: %lu>"), v4, self, v5, v7, v9, objc_msgSend(v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSData)address
{
  void *v2;
  void *v3;
  void *v4;

  -[SPCommandKeys beaconingKey](self, "beaconingKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subdataWithRange:", 0, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSDateInterval)dateInterval
{
  void *v2;
  void *v3;

  -[SPCommandKeys beaconingKey](self, "beaconingKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateInterval *)v3;
}

- (SPBeaconingKey)beaconingKey
{
  return self->_beaconingKey;
}

- (void)setBeaconingKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)commandKey
{
  return self->_commandKey;
}

- (void)setCommandKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)connectionToken
{
  return self->_connectionToken;
}

- (void)setConnectionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)nearbyToken
{
  return self->_nearbyToken;
}

- (void)setNearbyToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyToken, 0);
  objc_storeStrong((id *)&self->_connectionToken, 0);
  objc_storeStrong((id *)&self->_commandKey, 0);
  objc_storeStrong((id *)&self->_beaconingKey, 0);
}

@end
