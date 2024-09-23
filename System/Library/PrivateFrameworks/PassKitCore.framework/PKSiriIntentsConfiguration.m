@implementation PKSiriIntentsConfiguration

- (PKSiriIntentsConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKSiriIntentsConfiguration *v5;
  uint64_t v6;
  NSArray *supportedCarKeyIntents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSiriIntentsConfiguration;
  v5 = -[PKSiriIntentsConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("vehicleFunctions"));
    v6 = objc_claimAutoreleasedReturnValue();
    supportedCarKeyIntents = v5->_supportedCarKeyIntents;
    v5->_supportedCarKeyIntents = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSiriIntentsConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKSiriIntentsConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *supportedCarKeyIntents;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSiriIntentsConfiguration;
  v5 = -[PKSiriIntentsConfiguration init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("vehicleFunctions"));
    v9 = objc_claimAutoreleasedReturnValue();
    supportedCarKeyIntents = v5->_supportedCarKeyIntents;
    v5->_supportedCarKeyIntents = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedCarKeyIntents, CFSTR("vehicleFunctions"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSiriIntentsConfiguration *v4;

  v4 = +[PKSiriIntentsConfiguration allocWithZone:](PKSiriIntentsConfiguration, "allocWithZone:", a3);
  objc_storeStrong((id *)&v4->_supportedCarKeyIntents, self->_supportedCarKeyIntents);
  return v4;
}

- (NSArray)supportedCarKeyIntents
{
  return self->_supportedCarKeyIntents;
}

- (void)setSupportedCarKeyIntents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCarKeyIntents, 0);
}

@end
