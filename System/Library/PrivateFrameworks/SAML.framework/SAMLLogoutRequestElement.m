@implementation SAMLLogoutRequestElement

+ (id)createElement:(id *)a3
{
  SAMLLogoutRequestElement *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLLogoutRequestElement alloc], "initWithTagName:error:", CFSTR("LogoutRequest"), a3);
  if (v3)
  {
    v11[0] = CFSTR("Issuer");
    v11[1] = CFSTR("Signature");
    v11[2] = CFSTR("NameId");
    v11[3] = CFSTR("SessionIndex");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v3, "setChildElementSequence:", v4);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("ID"), v6);
    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("Version"), CFSTR("2.0"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SAMLStringFromDate(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("IssueInstant"), v8);
    SAMLProtocolNamespace();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v9);

  }
  return v3;
}

- (NSString)identifier
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("ID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
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

- (NSString)reason
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Reason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setReason:(id)a3
{
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("Reason"), a3);
}

- (NSDate)notOnOrAfter
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("NotOnOrAfter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SAMLDateFromString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (void)setNotOnOrAfter:(id)a3
{
  id v4;

  SAMLStringFromDate(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("NotOnOrAfter"), v4);

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

- (SAMLNameId)nameId
{
  return (SAMLNameId *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("NameId"));
}

- (NSString)sessionIndex
{
  void *v2;
  void *v3;
  void *v4;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SessionIndex"));
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

- (void)setSessionIndex:(id)a3
{
  id v4;
  void *v5;
  XMLWrapperElement *v6;

  v4 = a3;
  v6 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("SessionIndex"), 0);
  -[XMLWrapperElement setTextContent:](v6, "setTextContent:", v4);

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SessionIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[XMLWrapperElement replaceChildElement:newElement:](self, "replaceChildElement:newElement:", v5, v6);
  else
    -[XMLWrapperElement addChildElement:](self, "addChildElement:", v6);

}

@end
