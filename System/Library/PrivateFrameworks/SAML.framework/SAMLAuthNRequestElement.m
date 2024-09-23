@implementation SAMLAuthNRequestElement

+ (id)createElement:(id *)a3
{
  SAMLAuthNRequestElement *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  XMLWrapperNamespace *v12;
  _QWORD v14[8];

  v14[7] = *MEMORY[0x24BDAC8D0];
  v4 = -[XMLWrapperElement initWithTagName:error:]([SAMLAuthNRequestElement alloc], "initWithTagName:error:", CFSTR("AuthnRequest"), a3);
  if (v4)
  {
    v14[0] = CFSTR("Issuer");
    v14[1] = CFSTR("Signature");
    v14[2] = CFSTR("Subject");
    v14[3] = CFSTR("NameIdPolicy");
    v14[4] = CFSTR("Conditions");
    v14[5] = CFSTR("RequestedAuthnContext");
    v14[6] = CFSTR("Scoping");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v4, "setChildElementSequence:", v5);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("_"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[XMLWrapperElement setAttributeWithName:value:](v4, "setAttributeWithName:value:", CFSTR("ID"), v8);
    -[XMLWrapperElement setAttributeWithName:value:](v4, "setAttributeWithName:value:", CFSTR("Version"), CFSTR("2.0"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SAMLStringFromDate(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setAttributeWithName:value:](v4, "setAttributeWithName:value:", CFSTR("IssueInstant"), v10);
    +[SAMLNameIdPolicy createElement:](SAMLNameIdPolicy, "createElement:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement addChildElement:](v4, "addChildElement:", v11);
    v12 = objc_alloc_init(XMLWrapperNamespace);
    -[XMLWrapperNamespace setPrefix:](v12, "setPrefix:", CFSTR("samlp"));
    -[XMLWrapperNamespace setHref:](v12, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:protocol"));
    -[XMLWrapperElement setNamespace:](v4, "setNamespace:", v12);

  }
  return v4;
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

- (NSDate)issueInstant
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("IssueInstant"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SAMLDateFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSString)destination
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Destination"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDestination:(id)a3
{
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("Destination"), a3);
}

- (NSString)consent
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Consent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)forceAuthN
{
  void *v2;
  void *v3;
  char v4;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("ForceAuthn"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("true"));
  else
    v4 = 0;

  return v4;
}

- (void)setForceAuthN:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "vs_trueFalseStringValueFromBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("ForceAuthn"), v4);

}

- (BOOL)isPassive
{
  void *v2;
  void *v3;
  char v4;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("IsPassive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("true"));
  else
    v4 = 0;

  return v4;
}

- (void)setIsPassive:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "vs_trueFalseStringValueFromBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("IsPassive"), v4);

}

- (NSString)providerName
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("ProviderName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setProviderName:(id)a3
{
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("ProviderID"), a3);
}

- (NSString)issuer
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Issuer"));
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

- (void)setIssuer:(id)a3
{
  XMLWrapperElement *v4;
  XMLWrapperElement *v5;
  XMLWrapperNamespace *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("Issuer"), 0);
  v5 = v4;
  if (v4)
  {
    -[XMLWrapperElement setTextContent:](v4, "setTextContent:", v10);
    v6 = objc_alloc_init(XMLWrapperNamespace);
    -[XMLWrapperNamespace setPrefix:](v6, "setPrefix:", CFSTR("saml"));
    -[XMLWrapperNamespace setHref:](v6, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));
    -[XMLWrapperElement setNamespace:](v5, "setNamespace:", v6);
    -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Issuer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[XMLWrapperElement replaceChildElement:newElement:](self, "replaceChildElement:newElement:", v7, v5);
    }
    else
    {
      -[XMLWrapperElement elements](self, "elements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[XMLWrapperElement addChildElement:before:](self, "addChildElement:before:", v5, v9);

    }
  }

}

- (SAMLSignature)signature
{
  return (SAMLSignature *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Signature"));
}

- (SAMLSubject)subject
{
  return (SAMLSubject *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Subject"));
}

- (SAMLNameIdPolicy)nameIdPolicy
{
  return (SAMLNameIdPolicy *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("NameIdPolicy"));
}

- (SAMLConditions)conditions
{
  return (SAMLConditions *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Conditions"));
}

- (SAMLRequestedAuthNContext)context
{
  return (SAMLRequestedAuthNContext *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("RequestedAuthnContext"));
}

- (SAMLScoping)scoping
{
  return (SAMLScoping *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Scoping"));
}

@end
