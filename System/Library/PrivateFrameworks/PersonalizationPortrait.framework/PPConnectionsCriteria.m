@implementation PPConnectionsCriteria

- (PPConnectionsCriteria)initWithLocationField:(unsigned __int8)a3 bundleIdentifier:(id)a4
{
  id v7;
  PPConnectionsCriteria *v8;
  PPConnectionsCriteria *v9;

  v7 = a4;
  v8 = -[PPConnectionsCriteria init](self, "init");
  v9 = v8;
  if (v8)
  {
    v8->_locationField = a3;
    objc_storeStrong((id *)&v8->_bundleIdentifier, a4);
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPConnectionsCriteria l:%u b:%@>"), self->_locationField, self->_bundleIdentifier);
}

- (PPConnectionsCriteria)initWithCoder:(id)a3
{
  id v4;
  PPConnectionsCriteria *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPConnectionsCriteria;
  v5 = -[PPConnectionsCriteria init](&v9, sel_init);
  if (v5)
  {
    v5->_locationField = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationField"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t locationField;
  id v5;

  locationField = self->_locationField;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", locationField, CFSTR("locationField"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));

}

- (unsigned)locationField
{
  return self->_locationField;
}

- (void)setLocationField:(unsigned __int8)a3
{
  self->_locationField = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
