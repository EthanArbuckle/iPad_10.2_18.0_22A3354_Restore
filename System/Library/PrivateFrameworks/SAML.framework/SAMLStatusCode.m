@implementation SAMLStatusCode

+ (id)createElement:(id *)a3
{
  SAMLStatusCode *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLStatusCode alloc], "initWithTagName:error:", CFSTR("StatusCode"), a3);
  if (v3)
  {
    SAMLProtocolNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (NSString)value
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SAMLStatusCode)statusCode
{
  return (SAMLStatusCode *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("StatusCode"));
}

@end
