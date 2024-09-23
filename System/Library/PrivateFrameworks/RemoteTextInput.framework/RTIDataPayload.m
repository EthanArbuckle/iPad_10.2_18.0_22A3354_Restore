@implementation RTIDataPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v6, "encodeInt32:forKey:", LODWORD(self->_version), CFSTR("payloadVersion"));
  -[RTIDataPayload data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTIDataPayload data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("payloadData"));

  }
}

- (RTIDataPayload)initWithCoder:(id)a3
{
  id v4;
  RTIDataPayload *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v9.receiver = self;
  v9.super_class = (Class)RTIDataPayload;
  v5 = -[RTIDataPayload init](&v9, sel_init);
  if (v5)
  {
    v5->_version = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("payloadVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payloadData"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

+ (RTIDataPayload)payloadWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:version:", v4, 1);

  return (RTIDataPayload *)v5;
}

+ (RTIDataPayload)payloadWithData:(id)a3 version:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:version:", v6, a4);

  return (RTIDataPayload *)v7;
}

- (RTIDataPayload)initWithData:(id)a3 version:(unint64_t)a4
{
  id v7;
  RTIDataPayload *v8;
  RTIDataPayload *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTIDataPayload;
  v8 = -[RTIDataPayload init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_version = a4;
    objc_storeStrong((id *)&v8->_data, a3);
  }

  return v9;
}

- (RTIDataPayload)init
{
  return -[RTIDataPayload initWithData:version:](self, "initWithData:version:", 0, 1);
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; version = %lul"), -[RTIDataPayload version](self, "version"));
  if (self->_data)
  {
    -[RTIDataPayload data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; data length = %lul"), objc_msgSend(v4, "length"));

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  RTIDataPayload *v4;
  RTIDataPayload *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (RTIDataPayload *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTIDataPayload version](self, "version");
      if (v6 == -[RTIDataPayload version](v5, "version"))
      {
        -[RTIDataPayload data](self, "data");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDataPayload data](v5, "data");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          v11 = 1;
        }
        else
        {
          -[RTIDataPayload data](self, "data");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTIDataPayload data](v5, "data");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

        }
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
