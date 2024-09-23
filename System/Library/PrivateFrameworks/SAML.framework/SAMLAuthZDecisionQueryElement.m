@implementation SAMLAuthZDecisionQueryElement

+ (id)createElement:(id *)a3
{
  SAMLAuthZDecisionQueryElement *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAuthZDecisionQueryElement alloc], "initWithTagName:error:", CFSTR("AuthzDecisionQuery"), a3);
  if (v3)
  {
    v12[0] = CFSTR("Issuer");
    v12[1] = CFSTR("Signature");
    v12[2] = CFSTR("Subject");
    v12[3] = CFSTR("Action");
    v12[4] = CFSTR("Element");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v3, "setChildElementSequence:", v4);

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("_"), "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("ID"), v7);
    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("Version"), CFSTR("2.0"));
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SAMLStringFromDate(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setAttributeWithName:value:](v3, "setAttributeWithName:value:", CFSTR("IssueInstant"), v9);
    SAMLProtocolNamespace();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v10);

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
  void *v5;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("IssueInstant"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SAMLDateFromString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
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

- (NSString)resource
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Resource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setResource:(id)a3
{
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("Resource"), a3);
}

- (NSString)channelId
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

- (void)setChannelId:(id)a3
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

- (NSArray)actions
{
  return (NSArray *)-[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("Action"));
}

- (void)addAction:(id)a3
{
  XMLWrapperElement *v4;
  XMLWrapperElement *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("Action"), 0);
  v5 = v4;
  if (v4)
  {
    -[XMLWrapperElement setTextContent:](v4, "setTextContent:", v7);
    -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Element"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[XMLWrapperElement addChildElement:before:](self, "addChildElement:before:", v5, v6);
    else
      -[XMLWrapperElement addChildElement:](self, "addChildElement:", v5);

  }
}

- (SAMLEvidence)evidence
{
  return (SAMLEvidence *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Element"));
}

- (void)setEvidence:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Element"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    -[XMLWrapperElement replaceChildElement:newElement:](self, "replaceChildElement:newElement:", v5, v4);
  else
    -[XMLWrapperElement addChildElement:](self, "addChildElement:", v4);

}

@end
