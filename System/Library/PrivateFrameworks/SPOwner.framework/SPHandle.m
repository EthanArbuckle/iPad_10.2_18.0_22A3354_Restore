@implementation SPHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SPHandle)handleWithString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "containsString:", CFSTR("@")))
    +[SPHandle handleWithEmailAddress:](SPHandle, "handleWithEmailAddress:", v3);
  else
    +[SPHandle handleWithPhoneNumber:](SPHandle, "handleWithPhoneNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPHandle *)v4;
}

+ (SPHandle)handleWithEmailAddress:(id)a3
{
  id v3;
  SPHandle *v4;

  v3 = a3;
  v4 = -[SPHandle initWithType:destination:]([SPHandle alloc], "initWithType:destination:", 0, v3);

  return v4;
}

+ (SPHandle)handleWithPhoneNumber:(id)a3
{
  id v3;
  SPHandle *v4;

  v3 = a3;
  v4 = -[SPHandle initWithType:destination:]([SPHandle alloc], "initWithType:destination:", 1, v3);

  return v4;
}

- (SPHandle)initWithType:(int64_t)a3 destination:(id)a4
{
  id v7;
  SPHandle *v8;
  SPHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPHandle;
  v8 = -[SPHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_destination, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SPHandle *v4;
  SPHandle *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (SPHandle *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[SPHandle type](self, "type");
      if (v6 == -[SPHandle type](v5, "type"))
      {
        -[SPHandle destination](self, "destination");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPHandle destination](v5, "destination");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[SPHandle destination](self, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SPHandle type](self, "type") ^ v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPHandle *v4;
  int64_t v5;
  void *v6;
  SPHandle *v7;

  v4 = [SPHandle alloc];
  v5 = -[SPHandle type](self, "type");
  -[SPHandle destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPHandle initWithType:destination:](v4, "initWithType:destination:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destination, CFSTR("destination"));

}

- (SPHandle)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *destination;

  v4 = a3;
  self->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destination"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  destination = self->_destination;
  self->_destination = v5;

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[SPHandle type](self, "type");
  -[SPHandle destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %ld:%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
