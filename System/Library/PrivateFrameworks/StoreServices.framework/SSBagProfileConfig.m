@implementation SSBagProfileConfig

- (SSBagProfileConfig)init
{
  SSBagProfileConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSBagProfileConfig;
  result = -[SSBagProfileConfig init](&v3, sel_init);
  if (result)
    result->_bagLoadTimeout = 60.0;
  return result;
}

- (NSArray)bagKeys
{
  void *v2;
  void *v3;

  -[SSBagProfileConfig bagKeysDictionary](self, "bagKeysDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)bagKeyForStringRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SSBagProfileConfig bagKeysDictionary](self, "bagKeysDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)SSBagProfileConfig;
  -[SSBagProfileConfig description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSBagProfileConfig profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  profile: %@\n"), v6);

  -[SSBagProfileConfig profileVersion](self, "profileVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("  profileVersion: %@\n"), v7);

  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[SSBagProfileConfig profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SSBagProfileConfig profileVersion](self, "profileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SSBagProfileConfig *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SSBagProfileConfig *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[SSBagProfileConfig profile](self, "profile"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SSBagProfileConfig profile](v4, "profile"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqualToString:", v6),
          v6,
          v5,
          v7))
    {
      -[SSBagProfileConfig profileVersion](self, "profileVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSBagProfileConfig profileVersion](v4, "profileVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SSBagProfileConfig *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *bagKeysDictionary;
  double v9;
  void *v10;
  uint64_t v11;
  NSString *profile;
  void *v13;
  uint64_t v14;
  NSString *profileVersion;

  v5 = -[SSBagProfileConfig init](+[SSBagProfileConfig allocWithZone:](SSBagProfileConfig, "allocWithZone:"), "init");
  -[SSBagProfileConfig bagKeysDictionary](self, "bagKeysDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  bagKeysDictionary = v5->_bagKeysDictionary;
  v5->_bagKeysDictionary = (NSDictionary *)v7;

  -[SSBagProfileConfig bagLoadTimeout](self, "bagLoadTimeout");
  v5->_bagLoadTimeout = v9;
  -[SSBagProfileConfig profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copyWithZone:", a3);
  profile = v5->_profile;
  v5->_profile = (NSString *)v11;

  -[SSBagProfileConfig profileVersion](self, "profileVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "copyWithZone:", a3);
  profileVersion = v5->_profileVersion;
  v5->_profileVersion = (NSString *)v14;

  return v5;
}

- (double)bagLoadTimeout
{
  return self->_bagLoadTimeout;
}

- (void)setBagLoadTimeout:(double)a3
{
  self->_bagLoadTimeout = a3;
}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)bagKeysDictionary
{
  return self->_bagKeysDictionary;
}

- (void)setBagKeysDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_bagKeysDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagKeysDictionary, 0);
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
