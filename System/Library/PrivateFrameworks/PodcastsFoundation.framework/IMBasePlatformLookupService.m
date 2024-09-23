@implementation IMBasePlatformLookupService

- (IMBasePlatformLookupService)init
{
  IMBasePlatformLookupService *v2;
  IMBasePlatformLookupService *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMBasePlatformLookupService;
  v2 = -[IMBaseStoreService init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMBaseStoreService setWantsJSSignature:](v2, "setWantsJSSignature:", 1);
  return v3;
}

- (NSString)protocolVersion
{
  NSString *protocolVersion;

  protocolVersion = self->_protocolVersion;
  if (protocolVersion)
    return protocolVersion;
  else
    return (NSString *)CFSTR("1");
}

- (id)platformAction
{
  return 0;
}

- (id)baseUrl
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[IMBaseStoreService bag](self, "bag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForKey:", CFSTR("storeplatform-base-url-unpersonalized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://client-api.itunes.apple.com/WebObjects/MZStorePlatform.woa/wa/"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "pf_components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasSuffix:", CFSTR("lookup")))
  {
    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPath:", v7);

  }
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[IMBasePlatformLookupService baseUrl](self, "baseUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMBasePlatformLookupService platformAction](self, "platformAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PFClientUtil clientIdentifier](PFClientUtil, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("caller"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("platform"), CFSTR("iphone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMBasePlatformLookupService protocolVersion](self, "protocolVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("version"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A8]), "initWithURL:", v10);
  return v11;
}

- (void)performRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IMBasePlatformLookupService urlRequest](self, "urlRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMBaseStoreService performUrlRequest:callback:](self, "performUrlRequest:callback:", v5, v4);

}

- (void)setProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_protocolVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolVersion, 0);
}

@end
