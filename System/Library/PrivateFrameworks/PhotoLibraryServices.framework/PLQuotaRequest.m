@implementation PLQuotaRequest

- (PLQuotaRequest)initWithURLString:(id)a3 authToken:(id)a4 personID:(id)a5
{
  id v8;
  id v9;
  PLQuotaRequest *v10;
  uint64_t v11;
  NSString *authToken;
  uint64_t v13;
  NSString *personID;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLQuotaRequest;
  v10 = -[AARequest initWithURLString:](&v16, sel_initWithURLString_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    authToken = v10->_authToken;
    v10->_authToken = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    personID = v10->_personID;
    v10->_personID = (NSString *)v13;

  }
  return v10;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PLQuotaRequest;
  -[AARequest urlRequest](&v18, sel_urlRequest);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->_personID, self->_authToken);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Basic %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v7, CFSTR("Authorization"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("ProductVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@ iOS/%@"), v12, v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v14, CFSTR("User-agent"));
  objc_msgSend(MEMORY[0x1E0CFAC38], "udid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v15, CFSTR("X-Client-UDID"));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
}

@end
