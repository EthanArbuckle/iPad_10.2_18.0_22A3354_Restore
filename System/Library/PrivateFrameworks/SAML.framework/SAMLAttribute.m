@implementation SAMLAttribute

+ (id)createElement:(id *)a3
{
  SAMLAttribute *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAttribute alloc], "initWithTagName:error:", CFSTR("Attribute"), a3);
  if (v3)
  {
    SAMLAssertionNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  -[XMLWrapperElement setAttributeWithName:value:](self, "setAttributeWithName:value:", CFSTR("Name"), a3);
}

- (NSString)nameFormat
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("NameFormat"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)friendlyName
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("FriendlyName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)values
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("AttributeValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "textContent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addAttributeValue:(id)a3
{
  id v4;
  XMLWrapperNamespace *v5;
  XMLWrapperElement *v6;

  v4 = a3;
  v6 = -[XMLWrapperElement initWithTagName:error:]([XMLWrapperElement alloc], "initWithTagName:error:", CFSTR("AttributeValue"), 0);
  v5 = objc_alloc_init(XMLWrapperNamespace);
  -[XMLWrapperNamespace setPrefix:](v5, "setPrefix:", CFSTR("saml"));
  -[XMLWrapperNamespace setHref:](v5, "setHref:", CFSTR("urn:oasis:names:tc:SAML:2.0:assertion"));
  -[XMLWrapperElement setNamespace:](v6, "setNamespace:", v5);
  -[XMLWrapperElement setTextContent:](v6, "setTextContent:", v4);

  -[XMLWrapperElement addChildElement:](self, "addChildElement:", v6);
}

@end
