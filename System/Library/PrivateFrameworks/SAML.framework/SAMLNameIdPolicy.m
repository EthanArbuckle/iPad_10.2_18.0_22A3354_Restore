@implementation SAMLNameIdPolicy

+ (id)createElement:(id *)a3
{
  SAMLNameIdPolicy *v3;
  SAMLNameIdPolicy *v4;
  void *v5;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLNameIdPolicy alloc], "initWithTagName:error:", CFSTR("NameIdPolicy"), a3);
  v4 = v3;
  if (v3)
  {
    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("Format"), CFSTR("urn:oasis:names:tc:SAML:2.0:nameid-format:transient"));
    -[XMLWrapperElement setAttributeWithName:value:](v4, "setAttributeWithName:value:", CFSTR("AllowCreate"), CFSTR("false"));
    SAMLProtocolNamespace();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v4, "setNamespace:", v5);

  }
  return v4;
}

- (NSString)format
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Format"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)allowCreation
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("AllowCreate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
