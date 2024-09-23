@implementation SPBeaconingKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconingKey)initWithDateInterval:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  SPBeaconingKey *v9;
  SPBeaconingKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPBeaconingKey;
  v9 = -[SPBeaconingKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateInterval, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (SPBeaconingKey)initWithDateInterval:(id)a3 key:(id)a4 secondaryKey:(id)a5 primaryIndex:(unint64_t)a6 secondaryIndex:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  SPBeaconingKey *v16;
  SPBeaconingKey *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SPBeaconingKey;
  v16 = -[SPBeaconingKey init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dateInterval, a3);
    objc_storeStrong((id *)&v17->_key, a4);
    objc_storeStrong((id *)&v17->_secondaryKey, a5);
    v17->_primaryIndex = a6;
    v17->_secondaryIndex = a7;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPBeaconingKey *v4;
  void *v5;
  void *v6;
  void *v7;
  SPBeaconingKey *v8;

  v4 = [SPBeaconingKey alloc];
  -[SPBeaconingKey dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconingKey key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconingKey secondaryKey](self, "secondaryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SPBeaconingKey initWithDateInterval:key:secondaryKey:primaryIndex:secondaryIndex:](v4, "initWithDateInterval:key:secondaryKey:primaryIndex:secondaryIndex:", v5, v6, v7, -[SPBeaconingKey primaryIndex](self, "primaryIndex"), -[SPBeaconingKey secondaryIndex](self, "secondaryIndex"));

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;
  void *v6;
  id v7;

  dateInterval = self->_dateInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dateInterval, CFSTR("dateInterval"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryKey, CFSTR("secondaryKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_primaryIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("primaryIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secondaryIndex);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("secondaryIndex"));

}

- (SPBeaconingKey)initWithCoder:(id)a3
{
  id v4;
  NSDateInterval *v5;
  NSDateInterval *dateInterval;
  NSData *v7;
  NSData *key;
  NSData *v9;
  NSData *secondaryKey;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateInterval"));
  v5 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  dateInterval = self->_dateInterval;
  self->_dateInterval = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  key = self->_key;
  self->_key = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryKey"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  secondaryKey = self->_secondaryKey;
  self->_secondaryKey = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryIndex"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_primaryIndex = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_secondaryIndex = objc_msgSend(v12, "unsignedIntegerValue");
  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPBeaconingKey dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconingKey key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconingKey secondaryKey](self, "secondaryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p -- dateInterval: %@ key: %@ secondaryKey: %@ primaryIndex: %llu secondaryIndex: %llu>"), v4, self, v5, v6, v7, -[SPBeaconingKey primaryIndex](self, "primaryIndex"), -[SPBeaconingKey secondaryIndex](self, "secondaryIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)secondaryKey
{
  return self->_secondaryKey;
}

- (void)setSecondaryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)primaryIndex
{
  return self->_primaryIndex;
}

- (void)setPrimaryIndex:(unint64_t)a3
{
  self->_primaryIndex = a3;
}

- (unint64_t)secondaryIndex
{
  return self->_secondaryIndex;
}

- (void)setSecondaryIndex:(unint64_t)a3
{
  self->_secondaryIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryKey, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
