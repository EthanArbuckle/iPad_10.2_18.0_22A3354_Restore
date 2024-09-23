@implementation SPDataIntegrityCheck

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPDataIntegrityCheck)initWithValue:(id)a3 severity:(int64_t)a4
{
  id v7;
  SPDataIntegrityCheck *v8;
  SPDataIntegrityCheck *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPDataIntegrityCheck;
  v8 = -[SPDataIntegrityCheck init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_value, a3);
    v9->_severity = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPDataIntegrityCheck *v4;
  void *v5;
  SPDataIntegrityCheck *v6;

  v4 = [SPDataIntegrityCheck alloc];
  -[SPDataIntegrityCheck value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SPDataIntegrityCheck initWithValue:severity:](v4, "initWithValue:severity:", v5, -[SPDataIntegrityCheck severity](self, "severity"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_severity, CFSTR("severity"));

}

- (SPDataIntegrityCheck)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *value;
  int64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  self->_value = v5;

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("severity"));
  self->_severity = v7;
  return self;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)severity
{
  return self->_severity;
}

- (void)setSeverity:(int64_t)a3
{
  self->_severity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
