@implementation SPLocationProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPLocationProvider)initWithTimestamp:(id)a3 provider:(id)a4
{
  id v7;
  id v8;
  SPLocationProvider *v9;
  SPLocationProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPLocationProvider;
  v9 = -[SPLocationProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_provider, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SPLocationProvider *v4;
  SPLocationProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SPLocationProvider *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPLocationProvider timestamp](self, "timestamp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPLocationProvider timestamp](v5, "timestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToDate:", v7))
      {
        -[SPLocationProvider provider](self, "provider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPLocationProvider provider](v5, "provider");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPLocationProvider *v4;
  void *v5;
  void *v6;
  SPLocationProvider *v7;

  v4 = [SPLocationProvider alloc];
  -[SPLocationProvider timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationProvider provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPLocationProvider initWithTimestamp:provider:](v4, "initWithTimestamp:provider:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provider, CFSTR("provider"));

}

- (SPLocationProvider)initWithCoder:(id)a3
{
  id v4;
  SPLocationProvider *v5;
  uint64_t v6;
  NSDate *timestamp;
  uint64_t v8;
  SPHandle *provider;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPLocationProvider;
  v5 = -[SPLocationProvider init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provider"));
    v8 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (SPHandle *)v8;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SPLocationProvider provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationProvider timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Location Provider: %@, timestamp: %@"), v5, v7);

  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPLocationProvider provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPLocationProvider timestamp](self, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@:%@>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (SPHandle)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
