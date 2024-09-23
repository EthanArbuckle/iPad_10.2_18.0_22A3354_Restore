@implementation PKPayLaterPaymentSource

- (PKPayLaterPaymentSource)init
{
  PKPayLaterPaymentSource *v2;
  void *v3;
  uint64_t v4;
  NSString *identifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterPaymentSource;
  v2 = -[PKPayLaterPaymentSource init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

  }
  return v2;
}

- (unint64_t)type
{
  return 0;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)name
{
  return &stru_1E2ADF4C0;
}

- (int64_t)compare:(id)a3
{
  uint64_t v4;
  int64_t priority;
  BOOL v6;
  BOOL v7;
  int64_t v8;

  v4 = objc_msgSend(a3, "priority");
  priority = self->_priority;
  v6 = priority == v4;
  v7 = priority < v4;
  v8 = 1;
  if (!v7)
    v8 = -1;
  if (v6)
    return 0;
  else
    return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPaymentSource)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterPaymentSource *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterPaymentSource;
  v5 = -[PKPayLaterPaymentSource init](&v7, sel_init);
  if (v5)
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterPaymentSource identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("priority: %ld; "), -[PKPayLaterPaymentSource priority](self, "priority"));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
