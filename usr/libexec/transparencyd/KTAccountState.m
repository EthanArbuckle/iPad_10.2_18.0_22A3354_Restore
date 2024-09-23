@implementation KTAccountState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountState altDSID](self, "altDSID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("altDSID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[KTAccountState environment](self, "environment")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("env"));

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[KTAccountState hasBeenEnabled](self, "hasBeenEnabled")));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("hasBeen"));

}

- (KTAccountState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  KTAccountState *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  KTAccountState *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)KTAccountState;
  v6 = -[KTAccountState init](&v19, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("altDSID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[KTAccountState setAltDSID:](v6, "setAltDSID:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v9), CFSTR("hasBeenEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[KTAccountState setHasBeenEnabled:](v6, "setHasBeenEnabled:", objc_msgSend(v11, "BOOLValue"));

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v12), CFSTR("env"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v14, "intValue");

    if (v15 == 1)
      v16 = 1;
    else
      v16 = 2 * (v15 == 2);
    -[KTAccountState setEnvironment:](v6, "setEnvironment:", v16);
    v17 = v6;
  }

  return v6;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (BOOL)hasBeenEnabled
{
  return self->_hasBeenEnabled;
}

- (void)setHasBeenEnabled:(BOOL)a3
{
  self->_hasBeenEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
