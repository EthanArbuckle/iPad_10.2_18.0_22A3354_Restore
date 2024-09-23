@implementation STUnifiedTransportPayloadDestination

- (STUnifiedTransportPayloadDestination)initWithDSID:(id)a3
{
  void *v4;
  STUnifiedTransportPayloadDestination *v5;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUnifiedTransportPayloadDestination initWithAddress:type:](self, "initWithAddress:type:", v4, CFSTR("User"));

  return v5;
}

- (STUnifiedTransportPayloadDestination)initWithAddress:(id)a3 type:(id)a4
{
  return -[STUnifiedTransportPayloadDestination initWithAddress:type:state:](self, "initWithAddress:type:state:", a3, a4, 1);
}

- (STUnifiedTransportPayloadDestination)initWithAddress:(id)a3 type:(id)a4 state:(unint64_t)a5
{
  id v8;
  id v9;
  STUnifiedTransportPayloadDestination *v10;
  uint64_t v11;
  NSString *address;
  uint64_t v13;
  NSString *type;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STUnifiedTransportPayloadDestination;
  v10 = -[STUnifiedTransportPayloadDestination init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    address = v10->_address;
    v10->_address = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    type = v10->_type;
    v10->_type = (NSString *)v13;

    v10->_state = a5;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[STUnifiedTransportPayloadDestination address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("address"));

  -[STUnifiedTransportPayloadDestination type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[STUnifiedTransportPayloadDestination state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("state"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  NSString *v5;
  NSString *address;
  NSString *v7;
  NSString *type;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("address"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  self->_address = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUnifiedTransportPayloadDestination setState:](self, "setState:", objc_msgSend(v9, "unsignedIntegerValue"));
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUnifiedTransportPayloadDestination)initWithCoder:(id)a3
{
  id v4;
  STUnifiedTransportPayloadDestination *v5;
  uint64_t v6;
  NSString *address;
  uint64_t v8;
  NSString *type;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUnifiedTransportPayloadDestination;
  v5 = -[STUnifiedTransportPayloadDestination init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v6 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *address;
  id v5;

  address = self->_address;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", address, CFSTR("address"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithAddress:type:state:", self->_address, self->_type, self->_state);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[STUnifiedTransportPayloadDestination address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUnifiedTransportPayloadDestination type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%p:{\n Address: %@\n Type:%@\n State:%lu\n}"), self, v4, v5, -[STUnifiedTransportPayloadDestination state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  STUnifiedTransportPayloadDestination *v4;
  STUnifiedTransportPayloadDestination *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (STUnifiedTransportPayloadDestination *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[STUnifiedTransportPayloadDestination address](self, "address");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[STUnifiedTransportPayloadDestination address](v5, "address");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[STUnifiedTransportPayloadDestination address](self, "address");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[STUnifiedTransportPayloadDestination address](v5, "address");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqualToString:", v9))
          {
            -[STUnifiedTransportPayloadDestination type](self, "type");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[STUnifiedTransportPayloadDestination type](v5, "type");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqualToString:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[STUnifiedTransportPayloadDestination address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[STUnifiedTransportPayloadDestination type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
