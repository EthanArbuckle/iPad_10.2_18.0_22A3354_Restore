@implementation SAMLAttributeQueryElement

+ (id)createElement:(id *)a3
{
  SAMLAttributeQueryElement *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  XMLWrapperNamespace *v10;
  XMLWrapperNamespace *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAttributeQueryElement alloc], "initWithTagName:error:", CFSTR("AttributeQuery"), a3);
  if (v3)
  {
    v13[0] = CFSTR("Issuer");
    v13[1] = CFSTR("Signature");
    v13[2] = CFSTR("Subject");
    v13[3] = CFSTR("Attribute");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
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
    v10 = objc_alloc_init(XMLWrapperNamespace);
    -[XMLWrapperNamespace setPrefix:](v10, "setPrefix:", CFSTR("samlp"));
    -[XMLWrapperNamespace setHref:](v10, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:protocol"));
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v10);
    v11 = objc_alloc_init(XMLWrapperNamespace);
    -[XMLWrapperNamespace setPrefix:](v11, "setPrefix:", CFSTR("saml"));
    -[XMLWrapperNamespace setHref:](v11, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v11);

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

- (NSString)destination
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Decision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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

- (void)setSubject:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Subject"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v5;
  if (v5)
    -[XMLWrapperElement replaceChildElement:newElement:](self, "replaceChildElement:newElement:", v5, v4);
  else
    -[XMLWrapperElement addChildElement:](self, "addChildElement:", v4);

}

- (NSArray)samlAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("Attribute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end
