@implementation KTOptInStateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTOptInStateRequest)initWithApplication:(id)a3
{
  id v4;
  KTOptInStateRequest *v5;
  KTOptInStateRequest *v6;
  KTOptInStateRequest *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTOptInStateRequest;
  v5 = -[KTOptInStateRequest init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[KTOptInStateRequest setApplication:](v5, "setApplication:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[KTOptInStateRequest application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("application"));

  objc_msgSend(v7, "encodeBool:forKey:", -[KTOptInStateRequest fetchCloudKit](self, "fetchCloudKit"), CFSTR("fetchCloudKit"));
  objc_msgSend(v7, "encodeBool:forKey:", -[KTOptInStateRequest sync](self, "sync"), CFSTR("synchronous"));
  -[KTOptInStateRequest uri](self, "uri");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[KTOptInStateRequest uri](self, "uri");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("uri"));

  }
}

- (KTOptInStateRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  KTOptInStateRequest *v7;
  KTOptInStateRequest *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (v10.receiver = self,
        v10.super_class = (Class)KTOptInStateRequest,
        v7 = -[KTOptInStateRequest init](&v10, sel_init),
        (self = v7) != 0))
  {
    -[KTOptInStateRequest setApplication:](v7, "setApplication:", v6);
    -[KTOptInStateRequest setUri:](self, "setUri:", v5);
    -[KTOptInStateRequest setFetchCloudKit:](self, "setFetchCloudKit:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fetchCloudKit")));
    -[KTOptInStateRequest setSync:](self, "setSync:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("synchronous")));
    self = self;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)fetchCloudKit
{
  return self->_fetchCloudKit;
}

- (void)setFetchCloudKit:(BOOL)a3
{
  self->_fetchCloudKit = a3;
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUri:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uri, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end
