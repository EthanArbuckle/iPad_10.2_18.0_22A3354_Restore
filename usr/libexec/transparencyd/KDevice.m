@implementation KDevice

- (KDevice)initWithPushToken:(id)a3 registrationData:(id)a4
{
  id v6;
  id v7;
  KDevice *v8;
  KDevice *v9;
  void *v10;
  KDevice *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)KDevice;
  v8 = -[KDevice init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    -[KDevice setPushToken:](v8, "setPushToken:", v6);
    -[KDevice setRegistrationData:](v9, "setRegistrationData:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[KDevice setApps:](v9, "setApps:", v10);

    v11 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(KDevice, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice pushToken](self, "pushToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pushToken"));
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice registrationData](self, "registrationData"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "registrationData"));
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  char *v4;
  void *v5;
  char *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice pushToken](self, "pushToken"));
  v4 = (char *)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KDevice registrationData](self, "registrationData"));
  v6 = &v4[(_QWORD)objc_msgSend(v5, "hash")];

  return (unint64_t)v6;
}

- (void)addApplication:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KDevice apps](self, "apps"));
  objc_msgSend(v5, "addObject:", v4);

}

- (void)markedSigned
{
  -[KDevice setHasSignature:](self, "setHasSignature:", 1);
}

- (NSString)state
{
  if (-[KDevice hasSignature](self, "hasSignature"))
    return (NSString *)CFSTR("signed");
  else
    return (NSString *)CFSTR("initial");
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)registrationData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableSet)apps
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)hasSignature
{
  return self->_hasSignature;
}

- (void)setHasSignature:(BOOL)a3
{
  self->_hasSignature = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_registrationData, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
