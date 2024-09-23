@implementation PKOSVersionRequirementRange

- (PKOSVersionRequirementRange)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKOSVersionRequirement *v6;
  void *v7;
  PKOSVersionRequirement *v8;
  PKOSVersionRequirementRange *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("minimum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[PKOSVersionRequirement initWithDictionary:]([PKOSVersionRequirement alloc], "initWithDictionary:", v5);
  else
    v6 = 0;
  objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("maximum"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[PKOSVersionRequirement initWithDictionary:]([PKOSVersionRequirement alloc], "initWithDictionary:", v7);
  else
    v8 = 0;
  if ((unint64_t)v6 | (unint64_t)v8)
  {
    self = -[PKOSVersionRequirementRange initWithMinimumVersion:maximumVersion:](self, "initWithMinimumVersion:maximumVersion:", v6, v8);
    v9 = self;
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Invalid version range", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (PKOSVersionRequirementRange)initWithMinimumVersion:(id)a3 maximumVersion:(id)a4
{
  id v7;
  id v8;
  PKOSVersionRequirementRange *v9;
  PKOSVersionRequirementRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKOSVersionRequirementRange;
  v9 = -[PKOSVersionRequirementRange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_minimum, a3);
    objc_storeStrong((id *)&v10->_maximum, a4);
  }

  return v10;
}

- (id)asDictionary
{
  id v3;
  PKOSVersionRequirement *minimum;
  void *v5;
  PKOSVersionRequirement *maximum;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  minimum = self->_minimum;
  if (minimum)
  {
    -[PKOSVersionRequirement asDictionary](minimum, "asDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("minimum"));

  }
  maximum = self->_maximum;
  if (maximum)
  {
    -[PKOSVersionRequirement asDictionary](maximum, "asDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("maximum"));

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (BOOL)versionMeetsRequirements:(id)a3 deviceClass:(id)a4
{
  id v6;
  id v7;
  PKOSVersionRequirement *minimum;
  _BOOL4 v9;
  PKOSVersionRequirement *maximum;
  _BOOL4 v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  minimum = self->_minimum;
  if (minimum)
    v9 = (unint64_t)(-[PKOSVersionRequirement compare:deviceClass:](minimum, "compare:deviceClass:", v6, v7) + 1) < 2;
  else
    v9 = 1;
  maximum = self->_maximum;
  if (maximum)
    v11 = -[PKOSVersionRequirement compare:deviceClass:](maximum, "compare:deviceClass:", v6, v7) == 1;
  else
    v11 = 1;
  if (v9 && v11)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")))
      v12 = -[PKOSVersionRequirementRange versionMeetsRequirements:deviceClass:](self, "versionMeetsRequirements:deviceClass:", v6, CFSTR("iPhone"));
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKOSVersionRequirementRange)initWithCoder:(id)a3
{
  id v4;
  PKOSVersionRequirementRange *v5;
  uint64_t v6;
  PKOSVersionRequirement *minimum;
  uint64_t v8;
  PKOSVersionRequirement *maximum;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKOSVersionRequirementRange;
  v5 = -[PKOSVersionRequirementRange init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimum"));
    v6 = objc_claimAutoreleasedReturnValue();
    minimum = v5->_minimum;
    v5->_minimum = (PKOSVersionRequirement *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximum"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximum = v5->_maximum;
    v5->_maximum = (PKOSVersionRequirement *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKOSVersionRequirement *minimum;
  id v5;

  minimum = self->_minimum;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minimum, CFSTR("minimum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximum, CFSTR("maximum"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKOSVersionRequirementRange *v5;
  PKOSVersionRequirement *v6;
  PKOSVersionRequirement *maximum;
  PKOSVersionRequirement *v8;
  PKOSVersionRequirement *minimum;

  v5 = -[PKOSVersionRequirementRange init](+[PKOSVersionRequirementRange allocWithZone:](PKOSVersionRequirementRange, "allocWithZone:"), "init");
  v6 = -[PKOSVersionRequirement copyWithZone:](self->_maximum, "copyWithZone:", a3);
  maximum = v5->_maximum;
  v5->_maximum = v6;

  v8 = -[PKOSVersionRequirement copyWithZone:](self->_minimum, "copyWithZone:", a3);
  minimum = v5->_minimum;
  v5->_minimum = v8;

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_minimum);
  objc_msgSend(v3, "safelyAddObject:", self->_maximum);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKOSVersionRequirementRange *v4;
  PKOSVersionRequirementRange *v5;
  BOOL v6;

  v4 = (PKOSVersionRequirementRange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKOSVersionRequirementRange isEqualToOSVersionRequirementRange:](self, "isEqualToOSVersionRequirementRange:", v5);

  return v6;
}

- (BOOL)isEqualToOSVersionRequirementRange:(id)a3
{
  _QWORD *v4;
  PKOSVersionRequirement *minimum;
  PKOSVersionRequirement *v6;
  BOOL v7;
  BOOL v8;
  PKOSVersionRequirement *maximum;
  PKOSVersionRequirement *v10;

  v4 = a3;
  minimum = self->_minimum;
  v6 = (PKOSVersionRequirement *)v4[1];
  if (minimum)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (-[PKOSVersionRequirement isEqual:](minimum, "isEqual:"))
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (minimum != v6)
    goto LABEL_7;
LABEL_9:
  maximum = self->_maximum;
  v10 = (PKOSVersionRequirement *)v4[2];
  if (maximum && v10)
    v8 = -[PKOSVersionRequirement isEqual:](maximum, "isEqual:");
  else
    v8 = maximum == v10;
LABEL_13:

  return v8;
}

- (PKOSVersionRequirement)minimum
{
  return self->_minimum;
}

- (PKOSVersionRequirement)maximum
{
  return self->_maximum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
}

@end
