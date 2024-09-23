@implementation TransparencyIDSRegistrationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TransparencyIDSRegistrationRequest initialTimeout](self, "initialTimeout");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("initialTimeout"));
  objc_msgSend(v4, "encodeBool:forKey:", -[TransparencyIDSRegistrationRequest dontWaitForKeySigning](self, "dontWaitForKeySigning"), CFSTR("dontWaitForKeySigning"));
  -[TransparencyIDSRegistrationRequest requests](self, "requests");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("requests"));

}

- (TransparencyIDSRegistrationRequest)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TransparencyIDSRegistrationRequest *v11;
  TransparencyIDSRegistrationRequest *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialTimeout"));
  v6 = v5;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("requests"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11 = -[TransparencyIDSRegistrationRequest initWithSignatureRequests:](self, "initWithSignatureRequests:", v10),
        (self = v11) != 0))
  {
    -[TransparencyIDSRegistrationRequest setInitialTimeout:](v11, "setInitialTimeout:", v6);
    -[TransparencyIDSRegistrationRequest setDontWaitForKeySigning:](self, "setDontWaitForKeySigning:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dontWaitForKeySigning")));
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (TransparencyIDSRegistrationRequest)initWithSignatureRequests:(id)a3
{
  id v4;
  TransparencyIDSRegistrationRequest *v5;
  TransparencyIDSRegistrationRequest *v6;
  TransparencyIDSRegistrationRequest *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyIDSRegistrationRequest;
  v5 = -[TransparencyIDSRegistrationRequest init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TransparencyIDSRegistrationRequest setRequests:](v5, "setRequests:", v4);
    -[TransparencyIDSRegistrationRequest setInitialTimeout:](v6, "setInitialTimeout:", 30.0);
    v7 = v6;
  }

  return v6;
}

- (double)initialTimeout
{
  return self->_initialTimeout;
}

- (void)setInitialTimeout:(double)a3
{
  self->_initialTimeout = a3;
}

- (BOOL)dontWaitForKeySigning
{
  return self->_dontWaitForKeySigning;
}

- (void)setDontWaitForKeySigning:(BOOL)a3
{
  self->_dontWaitForKeySigning = a3;
}

- (NSDictionary)requests
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
