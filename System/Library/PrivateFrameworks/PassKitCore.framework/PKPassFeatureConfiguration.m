@implementation PKPassFeatureConfiguration

- (PKPassFeatureConfiguration)init
{

  return 0;
}

- (PKPassFeatureConfiguration)initWithDictionary:(id)a3
{
  id v4;
  PKPassFeatureConfiguration *v5;
  void *v6;
  PKOSVersionRequirementRange *v7;
  PKOSVersionRequirementRange *versionRange;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassFeatureConfiguration;
  v5 = -[PKPassFeatureConfiguration init](&v10, sel_init);
  if (v5)
  {
    v5->_enabled = objc_msgSend(v4, "PKBoolForKey:", CFSTR("enabled"));
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("versionRange"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[PKOSVersionRequirementRange initWithDictionary:]([PKOSVersionRequirementRange alloc], "initWithDictionary:", v6);
      versionRange = v5->_versionRange;
      v5->_versionRange = v7;

    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassFeatureConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPassFeatureConfiguration *v5;
  void *v6;
  uint64_t v7;
  PKOSVersionRequirementRange *versionRange;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassFeatureConfiguration;
  v5 = -[PKPassFeatureConfiguration init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enabled = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("versionRange"));
    v7 = objc_claimAutoreleasedReturnValue();
    versionRange = v5->_versionRange;
    v5->_versionRange = (PKOSVersionRequirementRange *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 enabled;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  enabled = self->_enabled;
  v7 = a3;
  objc_msgSend(v4, "numberWithBool:", enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("enabled"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_versionRange, CFSTR("versionRange"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: "), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("enabled: '%@'; "), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR("versionRange: '%@'; "), self->_versionRange);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_versionRange);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_enabled - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPassFeatureConfiguration *v4;
  PKPassFeatureConfiguration *v5;
  BOOL v6;

  v4 = (PKPassFeatureConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassFeatureConfiguration isEqualToPassFeatureConfiguration:](self, "isEqualToPassFeatureConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToPassFeatureConfiguration:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  PKOSVersionRequirementRange *versionRange;
  PKOSVersionRequirementRange *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && self->_enabled == *((unsigned __int8 *)v4 + 8))
  {
    versionRange = self->_versionRange;
    v7 = (PKOSVersionRequirementRange *)v5[2];
    if (versionRange && v7)
      v8 = -[PKOSVersionRequirementRange isEqual:](versionRange, "isEqual:");
    else
      v8 = versionRange == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (PKOSVersionRequirementRange)versionRange
{
  return self->_versionRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionRange, 0);
}

@end
