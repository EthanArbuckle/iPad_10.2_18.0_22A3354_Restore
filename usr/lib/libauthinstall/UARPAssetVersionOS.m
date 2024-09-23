@implementation UARPAssetVersionOS

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetVersionOS)init
{
  -[UARPAssetVersionOS doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAssetVersionOS)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 releaseVersion:(unint64_t)a5 buildVersion:(unint64_t)a6
{
  UARPAssetVersionOS *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UARPAssetVersionOS;
  result = -[UARPAssetVersionOS init](&v11, sel_init);
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_releaseVersion = a5;
    result->_buildVersion = a6;
  }
  return result;
}

- (UARPAssetVersionOS)initWithVersionString:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  UARPAssetVersionOS *v11;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v4 = (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
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
    v8 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = objc_msgSend(v8, "integerValue");

    v5 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = objc_msgSend(v5, "integerValue");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "count") == 3)
  {
    v13 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = objc_msgSend(v13, "integerValue");

    v14 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = objc_msgSend(v14, "integerValue");

    v5 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
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
  v15 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = objc_msgSend(v15, "integerValue");

  v16 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v7 = objc_msgSend(v16, "integerValue");

  v17 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v9 = objc_msgSend(v17, "integerValue");

  v5 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
  v10 = objc_msgSend(v5, "integerValue");
LABEL_7:

LABEL_8:
  v11 = -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v6, v7, v9, v10);

  return v11;
}

- (UARPAssetVersionOS)initWithBVERString:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  UARPAssetVersionOS *v15;

  v4 = (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"));
  v5 = (id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));

  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (objc_msgSend(v6, "count") == 3)
  {
    v11 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v10 = objc_msgSend(v11, "integerValue");

    v12 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v13 = objc_msgSend(v12, "longLongValue");

    v9 = HIDWORD(v13);
    v7 = v13;
    v14 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
    v8 = objc_msgSend(v14, "integerValue");

  }
  v15 = -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", v10, v9, v7, v8);

  return v15;
}

- (BOOL)isValid
{
  return self->_majorVersion || self->_minorVersion || self->_releaseVersion || self->_buildVersion != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersionOS alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", self->_majorVersion, self->_minorVersion, self->_releaseVersion, self->_buildVersion);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t majorVersion;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  majorVersion = self->_majorVersion;
  v6 = a3;
  v7 = (id)objc_msgSend(v4, "numberWithUnsignedInteger:", majorVersion);
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("majorVersion"));

  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_minorVersion);
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("minorVersion"));

  v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_releaseVersion);
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("releaseVersion"));

  v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_buildVersion);
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("buildVersion"));

}

- (UARPAssetVersionOS)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  UARPAssetVersionOS *v9;

  v4 = a3;
  v5 = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("majorVersion"));
  v6 = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minorVersion"));
  v7 = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseVersion"));
  v8 = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildVersion"));

  v9 = -[UARPAssetVersionOS initWithMajorVersion:minorVersion:releaseVersion:buildVersion:](self, "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", objc_msgSend(v5, "unsignedIntegerValue"), objc_msgSend(v6, "unsignedIntegerValue"), objc_msgSend(v7, "unsignedIntegerValue"), objc_msgSend(v8, "unsignedIntegerValue"));
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
