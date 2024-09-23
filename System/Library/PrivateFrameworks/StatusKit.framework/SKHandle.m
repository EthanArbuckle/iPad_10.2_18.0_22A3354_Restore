@implementation SKHandle

- (SKHandle)initWithString:(id)a3
{
  id v4;
  SKHandle *v5;
  uint64_t v6;
  NSString *handleString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKHandle;
  v5 = -[SKHandle init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handleString = v5->_handleString;
    v5->_handleString = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SKHandle handleString](self, "handleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; handleString = \"%@\">"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SKHandle isExactlyEqualToHandle:](self, "isExactlyEqualToHandle:", v4);

  return v5;
}

- (BOOL)isExactlyEqualToHandle:(id)a3
{
  SKHandle *v4;
  SKHandle *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SKHandle *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[SKHandle handleString](v4, "handleString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || self->_handleString)
    {
      -[SKHandle handleString](v5, "handleString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", self->_handleString);

    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SKHandle handleString](self, "handleString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_handleString, CFSTR("handleString"));
}

- (SKHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SKHandle *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handleString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SKHandle initWithString:](self, "initWithString:", v5);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SKHandle *v4;
  void *v5;
  SKHandle *v6;

  v4 = +[SKHandle allocWithZone:](SKHandle, "allocWithZone:", a3);
  -[SKHandle handleString](self, "handleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKHandle initWithString:](v4, "initWithString:", v5);

  return v6;
}

- (NSString)handleString
{
  return self->_handleString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleString, 0);
}

@end
