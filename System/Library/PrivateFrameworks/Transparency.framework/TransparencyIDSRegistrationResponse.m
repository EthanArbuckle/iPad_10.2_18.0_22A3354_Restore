@implementation TransparencyIDSRegistrationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TransparencyIDSRegistrationResponse registrationData](self, "registrationData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("registrationData"));

}

- (TransparencyIDSRegistrationResponse)initWithCoder:(id)a3
{
  id v4;
  TransparencyIDSRegistrationResponse *v5;
  uint64_t v6;
  void *v7;
  TransparencyIDSRegistrationResponse *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TransparencyIDSRegistrationResponse;
  v5 = -[TransparencyIDSRegistrationResponse init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("registrationData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyIDSRegistrationResponse setRegistrationData:](v5, "setRegistrationData:", v7);

    v8 = v5;
  }

  return v5;
}

- (NSDictionary)registrationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegistrationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationData, 0);
}

@end
