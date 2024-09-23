@implementation APServerRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *client;
  NSDictionary *headers;
  objc_class *responseClass;
  NSString *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self)
  {
    objc_msgSend(v9, "encodeObject:forKey:", self->_requestId, CFSTR("ri"));
    client = self->_client;
  }
  else
  {
    objc_msgSend(v9, "encodeObject:forKey:", 0, CFSTR("ri"));
    client = 0;
  }
  objc_msgSend(v9, "encodeObject:forKey:", client, CFSTR("c"));
  if (self)
  {
    objc_msgSend(v9, "encodeObject:forKey:", self->_URL, CFSTR("u"));
    headers = self->_headers;
  }
  else
  {
    objc_msgSend(v9, "encodeObject:forKey:", 0, CFSTR("u"));
    headers = 0;
  }
  objc_msgSend(v9, "encodeObject:forKey:", headers, CFSTR("h"));
  if (self)
  {
    objc_msgSend(v9, "encodeObject:forKey:", self->_protoBuffer, CFSTR("p"));
    responseClass = self->_responseClass;
  }
  else
  {
    objc_msgSend(v9, "encodeObject:forKey:", 0, CFSTR("p"));
    responseClass = 0;
  }
  v7 = NSStringFromClass(responseClass);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("rc"));

}

- (APServerRequest)initWithCoder:(id)a3
{
  id v4;
  APServerRequest *v5;
  id v6;
  uint64_t v7;
  NSUUID *requestId;
  id v9;
  uint64_t v10;
  NSString *client;
  id v12;
  uint64_t v13;
  NSURL *URL;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *headers;
  id v20;
  uint64_t v21;
  PBCodable *protoBuffer;
  id v23;
  NSString *v24;
  Class v25;
  uint64_t v26;
  Class responseClass;

  v4 = a3;
  v5 = -[APServerRequest init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("ri"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    requestId = v5->_requestId;
    v5->_requestId = (NSUUID *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("c"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    client = v5->_client;
    v5->_client = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("u"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    URL = v5->_URL;
    v5->_URL = (NSURL *)v13;

    v15 = objc_opt_class(NSDictionary);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(NSString), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("h")));
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v18;

    v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PBCodable), CFSTR("p"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    protoBuffer = v5->_protoBuffer;
    v5->_protoBuffer = (PBCodable *)v21;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("rc"));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue(v23);
    v25 = NSClassFromString(v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    responseClass = v5->_responseClass;
    v5->_responseClass = (Class)v26;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_responseClass, 0);
  objc_storeStrong((id *)&self->_protoBuffer, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
