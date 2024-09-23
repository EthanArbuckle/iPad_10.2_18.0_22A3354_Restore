@implementation PKApplicationMessageKey

+ (id)createWithSource:(int64_t)a3 identifier:(id)a4
{
  id v5;
  _QWORD *v6;

  v5 = a4;
  v6 = -[PKApplicationMessageKey _initWithSource:identifier:]([PKApplicationMessageKey alloc], a3, v5);

  return v6;
}

- (_QWORD)_initWithSource:(void *)a3 identifier:
{
  id v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  objc_super v13;

  v5 = a3;
  v6 = v5;
  if (a1 && v5)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKApplicationMessageKey;
    v7 = objc_msgSendSuper2(&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7[1] = a2;
      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)v8[2];
      v8[2] = v9;

    }
    a1 = v8;
    v11 = a1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PKApplicationMessageKey)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageKey)initWithCoder:(id)a3
{
  id v4;
  PKApplicationMessageKey *v5;
  uint64_t v6;
  NSString *identifier;
  PKApplicationMessageKey *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplicationMessageKey;
  v5 = -[PKApplicationMessageKey init](&v11, sel_init);
  if (v5
    && (v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source")),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier")),
        v6 = objc_claimAutoreleasedReturnValue(),
        identifier = v5->_identifier,
        v5->_identifier = (NSString *)v6,
        identifier,
        !v5->_identifier))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKApplicationMessageKey"), 0, 0);
    objc_msgSend(v4, "failWithError:", v9);

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t source;
  id v5;

  source = self->_source;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSString *identifier;
  NSString *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self)
    {
      if (self->_source == v5[1])
      {
        identifier = self->_identifier;
        v8 = (NSString *)v6[2];
        if (identifier && v8)
          LOBYTE(self) = -[NSString isEqual:](identifier, "isEqual:");
        else
          LOBYTE(self) = identifier == v8;
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (unint64_t)hash
{
  -[NSString hash](self->_identifier, "hash", self->_source);
  return SipHash();
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
