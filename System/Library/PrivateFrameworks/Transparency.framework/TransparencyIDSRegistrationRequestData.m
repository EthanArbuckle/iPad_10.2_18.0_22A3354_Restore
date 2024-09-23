@implementation TransparencyIDSRegistrationRequestData

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
  -[TransparencyIDSRegistrationRequestData application](self, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("application"));

  -[TransparencyIDSRegistrationRequestData tbsKTIDSRegistrationData](self, "tbsKTIDSRegistrationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("registrationData"));

  -[TransparencyIDSRegistrationRequestData pushToken](self, "pushToken");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pushToken"));

}

- (TransparencyIDSRegistrationRequestData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  TransparencyIDSRegistrationRequestData *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationData"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v10 = 0;
  }
  else
  {
    self = -[TransparencyIDSRegistrationRequestData initWithApplication:registrationData:](self, "initWithApplication:registrationData:", v5, v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationRequestData setPushToken:](self, "setPushToken:", v9);

    v10 = self;
  }

  return v10;
}

- (TransparencyIDSRegistrationRequestData)initWithApplication:(id)a3 registrationData:(id)a4
{
  id v6;
  id v7;
  TransparencyIDSRegistrationRequestData *v8;
  TransparencyIDSRegistrationRequestData *v9;
  TransparencyIDSRegistrationRequestData *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TransparencyIDSRegistrationRequestData;
  v8 = -[TransparencyIDSRegistrationRequestData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TransparencyIDSRegistrationRequestData setApplication:](v8, "setApplication:", v6);
    -[TransparencyIDSRegistrationRequestData setTbsKTIDSRegistrationData:](v9, "setTbsKTIDSRegistrationData:", v7);
    -[TransparencyIDSRegistrationRequestData setPushToken:](v9, "setPushToken:", 0);
    v10 = v9;
  }

  return v9;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSData)tbsKTIDSRegistrationData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTbsKTIDSRegistrationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_tbsKTIDSRegistrationData, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
