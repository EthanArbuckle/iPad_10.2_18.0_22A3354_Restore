@implementation SAMLSubjectConfirmation

+ (id)createElement:(id *)a3
{
  SAMLSubjectConfirmation *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLSubjectConfirmation alloc], "initWithTagName:error:", CFSTR("SubjectConfirmation"), a3);
  if (v3)
  {
    SAMLAssertionNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

  }
  return v3;
}

- (_xmlNode)xmlNode:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _xmlNode *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("NameId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectConfirmationData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[XMLWrapperElement elements](self, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        -[XMLWrapperElement removeChildElement:](self, "removeChildElement:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        -[XMLWrapperElement addChildElement:](self, "addChildElement:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  v20.receiver = self;
  v20.super_class = (Class)SAMLSubjectConfirmation;
  v18 = -[XMLWrapperElement xmlNode:](&v20, sel_xmlNode_, a3);

  return v18;
}

- (NSString)method
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("Method"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (SAMLNameId)nameId
{
  return (SAMLNameId *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("NameId"));
}

- (NSDate)notBefore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectConfirmationData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("NotBefore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SAMLDateFromString(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSDate *)v7;
}

- (NSDate)notOnOrAfter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectConfirmationData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("NotOnOrAfter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SAMLDateFromString(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return (NSDate *)v7;
}

- (NSString)recipient
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectConfirmationData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("Recipient"));
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

- (NSString)inResponseTo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectConfirmationData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("InResponseTo"));
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

- (NSString)address
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("SubjectConfirmationData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "attributeWithName:", CFSTR("Address"));
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

@end
