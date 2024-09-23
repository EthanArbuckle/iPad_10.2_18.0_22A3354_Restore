@implementation SAMLSignature

+ (id)createElement:(id *)a3
{
  SAMLSignature *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLSignature alloc], "initWithTagName:error:", CFSTR("Signature"), a3);
  if (v3)
  {
    v7[0] = CFSTR("SignedInfo");
    v7[1] = CFSTR("SignatureValue");
    v7[2] = CFSTR("KeyInfo");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v3, "setChildElementSequence:", v4);

    SAMLSignatureNamespace();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v5);

  }
  return v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SAMLSignedInfo)signedInfo
{
  return (SAMLSignedInfo *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SignedInfo"));
}

- (NSData)signatureValue
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SignatureValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(v2, "textContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithBase64EncodedString:options:", v4, 1);

  }
  else
  {
    v5 = 0;
  }

  return (NSData *)v5;
}

- (NSString)signatureValueId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SignatureValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("ID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (SAMLKeyInfo)keyInfo
{
  return (SAMLKeyInfo *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("KeyInfo"));
}

- (BOOL)isValid
{
  return 1;
}

@end
