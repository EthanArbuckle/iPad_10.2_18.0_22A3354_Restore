@implementation MSDAccountContext

- (id)description
{
  int has_internal_content;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  has_internal_content = os_variant_has_internal_content("com.apple.mobilestoredemod");
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_claimAutoreleasedReturnValue(-[MSDAccountContext username](self, "username"));
  v9 = (void *)v8;
  if (has_internal_content)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext password](self, "password"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext recoveryKey](self, "recoveryKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: Username=%@ Password=%@ RecoveryKey=%@>"), v7, self, v9, v10, v11));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: Username=%@>"), v7, self, v8));
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDAccountContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MSDAccountContext *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSSet *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MSDAccountContext;
  v6 = -[MSDAccountContext init](&v30, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("username"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[MSDAccountContext setUsername:](v6, "setUsername:", v8);

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v9), CFSTR("password"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MSDAccountContext setPassword:](v6, "setPassword:", v11);

    v13 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v12), CFSTR("localSecret"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[MSDAccountContext setLocalSecret:](v6, "setLocalSecret:", v14);

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v15), CFSTR("recoveryKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[MSDAccountContext setRecoveryKey:](v6, "setRecoveryKey:", v17);

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v18), CFSTR("resetCDP"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[MSDAccountContext setResetCDP:](v6, "setResetCDP:", objc_msgSend(v20, "BOOLValue"));

    v22 = objc_opt_class(NSDictionary, v21);
    v24 = objc_opt_class(NSString, v23);
    v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, v24, objc_opt_class(NSNumber, v25), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("features")));
    -[MSDAccountContext setFeatures:](v6, "setFeatures:", v28);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext username](self, "username"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("username"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext password](self, "password"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("password"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext localSecret](self, "localSecret"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localSecret"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDAccountContext recoveryKey](self, "recoveryKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("recoveryKey"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MSDAccountContext resetCDP](self, "resetCDP")));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("resetCDP"));

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MSDAccountContext features](self, "features"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("features"));

}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSString)localSecret
{
  return self->_localSecret;
}

- (void)setLocalSecret:(id)a3
{
  objc_storeStrong((id *)&self->_localSecret, a3);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryKey, a3);
}

- (BOOL)resetCDP
{
  return self->_resetCDP;
}

- (void)setResetCDP:(BOOL)a3
{
  self->_resetCDP = a3;
}

- (NSDictionary)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_localSecret, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
