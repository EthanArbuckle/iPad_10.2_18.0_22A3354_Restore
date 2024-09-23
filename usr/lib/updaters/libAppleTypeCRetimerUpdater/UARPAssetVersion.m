@implementation UARPAssetVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetVersion)init
{
  -[UARPAssetVersion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAssetVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6
{
  UARPAssetVersion *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UARPAssetVersion;
  result = -[UARPAssetVersion init](&v11, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_releaseVersion = a5;
    result->_buildVersion = a6;
  }
  return result;
}

- (UARPAssetVersion)initWithVersionString:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  UARPAssetVersion *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    v7 = 0;
LABEL_5:
    v9 = 0;
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "integerValue");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "count") == 3)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "integerValue");
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "count") != 4)
  {
    v6 = 0;
    v7 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v16, "integerValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v17, "integerValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "integerValue");
LABEL_7:

LABEL_8:
  v11 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v6, v7, v9, v10);

  return v11;
}

- (UARPAssetVersion)initWithBVERString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  UARPAssetVersion *v15;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (objc_msgSend(v6, "count") == 3)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "integerValue");

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "longLongValue");

    v9 = HIDWORD(v13);
    v7 = v13;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v14, "integerValue");

  }
  v15 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v10, v9, v7, v8);

  return v15;
}

- (BOOL)isValid
{
  return self->_majorVersion || self->_minorVersion || self->_releaseVersion || self->_buildVersion != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", self->_majorVersion, self->_minorVersion, self->_releaseVersion, self->_buildVersion);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t majorVersion;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  majorVersion = self->_majorVersion;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", majorVersion);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("majorVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_minorVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("minorVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_releaseVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("releaseVersion"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_buildVersion);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("buildVersion"));

}

- (UARPAssetVersion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UARPAssetVersion *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("majorVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minorVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", objc_msgSend(v5, "unsignedIntegerValue"), objc_msgSend(v6, "unsignedIntegerValue"), objc_msgSend(v7, "unsignedIntegerValue"), objc_msgSend(v8, "unsignedIntegerValue"));
  return v9;
}

- (NSString)versionString
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu.%lu.%lu.%lu"), self->_majorVersion, self->_minorVersion, self->_releaseVersion, self->_buildVersion);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)releaseVersion
{
  return self->_releaseVersion;
}

- (unint64_t)buildVersion
{
  return self->_buildVersion;
}

@end
