@implementation KTAccountKeyServerProtocolActual

- (KTAccountKeyServerProtocolActual)initWithSettings:(id)a3
{
  id v4;
  KTAccountKeyServerProtocolActual *v5;
  KTAccountKeyServerProtocolActual *v6;
  KTAccountKeyServerProtocolActual *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTAccountKeyServerProtocolActual;
  v5 = -[KTAccountKeyServerProtocolActual init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    -[KTAccountKeyServerProtocolActual setSettings:](v5, "setSettings:", v4);
    v7 = v6;
  }

  return v6;
}

- (id)accountKeyService:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServerProtocolActual settings](self, "settings"));
  v6 = objc_msgSend(v5, "allowsInternalSecurityPolicies");

  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServerProtocolActual settings](self, "settings")),
        v8 = objc_msgSend(v7, "getBool:", CFSTR("noAccountKey")),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountKeyServer sharedKeyServiceForApplication:](KTAccountKeyServer, "sharedKeyServiceForApplication:", v4));
  }

  return v9;
}

- (BOOL)verifyData:(id)a3 signature:(id)a4 accountPublicKeyInfo:(id)a5 error:(id *)a6
{
  return +[KTAccountKeyServer verifyData:signature:accountPublicKeyInfo:error:](KTAccountKeyServer, "verifyData:signature:accountPublicKeyInfo:error:", a3, a4, a5, a6);
}

- (void)clearCachedPCSIdentities
{
  +[KTAccountKeyServer clearCachedPCSIdentities](KTAccountKeyServer, "clearCachedPCSIdentities");
}

- (id)copyCachedPCSIdentityForApplication:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountKeyServerProtocolActual accountKeyService:](self, "accountKeyService:", a3));
  v4 = objc_msgSend(v3, "copyCachedPCSIdentity");

  return v4;
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
