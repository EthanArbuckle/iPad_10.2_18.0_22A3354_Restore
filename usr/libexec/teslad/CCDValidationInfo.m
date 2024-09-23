@implementation CCDValidationInfo

- (CCDValidationInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v7;
  id v8;
  CCDValidationInfo *v9;
  CCDValidationInfo *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CCDValidationInfo;
  v9 = -[CCDValidationInfo init](&v13, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isRequired")));
    v10->_isRequired = objc_msgSend(v11, "BOOLValue");

    objc_storeStrong((id *)&v10->_validationInfo, a4);
  }

  return v10;
}

- (BOOL)validateSelfWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));

  if (v9)
    LOBYTE(self) = -[CCDValidationInfo validateSelfUsingValidationInfoWithDictionary:resultsDictionary:](self, "validateSelfUsingValidationInfoWithDictionary:resultsDictionary:", v6, v7);
  else
    LODWORD(self) = !-[CCDValidationInfo isRequired](self, "isRequired");

  return (char)self;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CCDValidationInfo validateSelfUsingValidationInfoWithDictionary:resultsDictionary:]", "CCDValidationInfo.m", 50, "0");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void)setIsRequired:(BOOL)a3
{
  self->_isRequired = a3;
}

- (NSDictionary)validationInfo
{
  return self->_validationInfo;
}

- (void)setValidationInfo:(id)a3
{
  objc_storeStrong((id *)&self->_validationInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
