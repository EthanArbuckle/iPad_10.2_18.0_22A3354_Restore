@implementation KTIDStaticKeyStoreHandle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  KTIDStaticKeyStoreHandle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[KTIDStaticKeyStoreHandle init](+[KTIDStaticKeyStoreHandle allocWithZone:](KTIDStaticKeyStoreHandle, "allocWithZone:"), "init");
  -[KTIDStaticKeyStoreHandle handle](self, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[KTIDStaticKeyStoreHandle setHandle:](v5, "setHandle:", v7);

  -[KTIDStaticKeyStoreHandle setValid:](v5, "setValid:", -[KTIDStaticKeyStoreHandle valid](self, "valid"));
  -[KTIDStaticKeyStoreHandle validationDate](self, "validationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[KTIDStaticKeyStoreHandle setValidationDate:](v5, "setValidationDate:", v9);

  -[KTIDStaticKeyStoreHandle setErrorCode:](v5, "setErrorCode:", -[KTIDStaticKeyStoreHandle errorCode](self, "errorCode"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[KTIDStaticKeyStoreHandle handle](self, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("handle"));

  objc_msgSend(v6, "encodeBool:forKey:", -[KTIDStaticKeyStoreHandle valid](self, "valid"), CFSTR("valid"));
  -[KTIDStaticKeyStoreHandle validationDate](self, "validationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("validationDate"));

  objc_msgSend(v6, "encodeInt:forKey:", -[KTIDStaticKeyStoreHandle errorCode](self, "errorCode"), CFSTR("errorCode"));
}

- (KTIDStaticKeyStoreHandle)initWithCoder:(id)a3
{
  id v4;
  KTIDStaticKeyStoreHandle *v5;
  void *v6;
  void *v7;
  KTIDStaticKeyStoreHandle *v8;

  v4 = a3;
  v5 = objc_alloc_init(KTIDStaticKeyStoreHandle);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDStaticKeyStoreHandle setHandle:](v5, "setHandle:", v6);

    -[KTIDStaticKeyStoreHandle setValid:](v5, "setValid:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("valid")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validationDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDStaticKeyStoreHandle setValidationDate:](v5, "setValidationDate:", v7);

    -[KTIDStaticKeyStoreHandle setErrorCode:](v5, "setErrorCode:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("errorCode")));
    v8 = v5;
  }

  return v5;
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSDate)validationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setValidationDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationDate, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
