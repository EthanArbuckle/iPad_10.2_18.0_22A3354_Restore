@implementation SAMLStatus

+ (id)createElement:(id *)a3
{
  SAMLStatus *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLStatus alloc], "initWithTagName:error:", CFSTR("Status"), a3);
  if (v3)
  {
    SAMLProtocolNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (SAMLStatusCode)statusCode
{
  return (SAMLStatusCode *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("StatusCode"));
}

- (NSString)statusMessage
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("samlp:StatusMessage"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)statusDetail
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("samlp:StatusDetail"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (id)status
{
  void *v2;
  void *v3;

  -[SAMLStatus statusCode](self, "statusCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
