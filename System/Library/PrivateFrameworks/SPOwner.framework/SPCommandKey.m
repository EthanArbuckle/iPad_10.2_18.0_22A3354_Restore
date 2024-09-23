@implementation SPCommandKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)address
{
  void *v2;
  void *v3;
  void *v4;

  -[SPCommandKey beaconingKey](self, "beaconingKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subdataWithRange:", 0, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (SPCommandKey)initWithBeaconingKey:(id)a3 commandKey:(id)a4 connectionToken:(id)a5 nearbyToken:(id)a6 primaryIndex:(id)a7 secondaryIndex:(id)a8 type:(int64_t)a9
{
  id v16;
  id v17;
  id v18;
  SPCommandKey *v19;
  SPCommandKey *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v17 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SPCommandKey;
  v19 = -[SPCommandKey init](&v25, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_beaconingKey, a3);
    objc_storeStrong((id *)&v20->_commandKey, a4);
    objc_storeStrong((id *)&v20->_connectionToken, a5);
    objc_storeStrong((id *)&v20->_nearbyToken, a6);
    objc_storeStrong((id *)&v20->_primaryIndex, a7);
    objc_storeStrong((id *)&v20->_secondaryIndex, a8);
    v20->_type = a9;
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPCommandKey *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SPCommandKey *v11;

  v4 = [SPCommandKey alloc];
  -[SPCommandKey beaconingKey](self, "beaconingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKey commandKey](self, "commandKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKey connectionToken](self, "connectionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKey nearbyToken](self, "nearbyToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKey primaryIndex](self, "primaryIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKey secondaryIndex](self, "secondaryIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SPCommandKey initWithBeaconingKey:commandKey:connectionToken:nearbyToken:primaryIndex:secondaryIndex:type:](v4, "initWithBeaconingKey:commandKey:connectionToken:nearbyToken:primaryIndex:secondaryIndex:type:", v5, v6, v7, v8, v9, v10, -[SPCommandKey type](self, "type"));

  return v11;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryIndex, CFSTR("primaryIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryIndex, CFSTR("secondaryIndex"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (SPCommandKey)initWithCoder:(id)a3
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
  NSNumber *v13;
  NSNumber *primaryIndex;
  NSNumber *v15;
  NSNumber *secondaryIndex;
  int64_t v17;

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

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryIndex"));
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  primaryIndex = self->_primaryIndex;
  self->_primaryIndex = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryIndex"));
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  secondaryIndex = self->_secondaryIndex;
  self->_secondaryIndex = v15;

  v17 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  self->_type = v17;
  return self;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v15 = objc_opt_class();
  -[SPCommandKey beaconingKey](self, "beaconingKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPCommandKey commandKey](self, "commandKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[SPCommandKey connectionToken](self, "connectionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[SPCommandKey nearbyToken](self, "nearbyToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  -[SPCommandKey primaryIndex](self, "primaryIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongValue");
  -[SPCommandKey secondaryIndex](self, "secondaryIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p -- beaconingKey: %@ commandKey: %lu connectionToken: %lu nearbyToken: %lu> primaryIndex: %lu> secondaryIndex: %lu>"), v15, self, v14, v4, v6, v8, v10, objc_msgSend(v11, "unsignedLongValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSDateInterval)dateInterval
{
  void *v2;
  void *v3;

  -[SPCommandKey beaconingKey](self, "beaconingKey");
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

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSNumber)primaryIndex
{
  return self->_primaryIndex;
}

- (void)setPrimaryIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)secondaryIndex
{
  return self->_secondaryIndex;
}

- (void)setSecondaryIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)commandKey
{
  return self->_commandKey;
}

- (void)setCommandKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandKey, 0);
  objc_storeStrong((id *)&self->_secondaryIndex, 0);
  objc_storeStrong((id *)&self->_primaryIndex, 0);
  objc_storeStrong((id *)&self->_nearbyToken, 0);
  objc_storeStrong((id *)&self->_connectionToken, 0);
  objc_storeStrong((id *)&self->_beaconingKey, 0);
  objc_storeStrong((id *)&self->dateInterval, 0);
}

@end
