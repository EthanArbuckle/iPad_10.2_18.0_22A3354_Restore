@implementation SAMLSignatureKeyValue

+ (id)createElement:(id *)a3
{
  return -[XMLWrapperElement initWithTagName:error:]([SAMLSignatureKeyValue alloc], "initWithTagName:error:", CFSTR("KeyValue"), a3);
}

- (SAMLDSAKeyValue)dsaKeyValue
{
  return (SAMLDSAKeyValue *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("DSAKeyValue"));
}

- (SAMLRSAKeyValue)rsaKeyValue
{
  return (SAMLRSAKeyValue *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("RSAKeyValue"));
}

@end
