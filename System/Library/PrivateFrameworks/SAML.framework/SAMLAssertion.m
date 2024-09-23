@implementation SAMLAssertion

+ (id)createElement:(id *)a3
{
  SAMLAssertion *v3;
  void *v4;
  void *v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x24BDAC8D0];
  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLAssertion alloc], "initWithTagName:error:", CFSTR("Assertion"), a3);
  if (v3)
  {
    v7[0] = CFSTR("Issuer");
    v7[1] = CFSTR("Signature");
    v7[2] = CFSTR("Subject");
    v7[3] = CFSTR("Conditions");
    v7[4] = CFSTR("Advice");
    v7[5] = CFSTR("AuthnStatement");
    v7[6] = CFSTR("AuthzDecisiontStatement");
    v7[7] = CFSTR("AttributeStatement");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setChildElementSequence:](v3, "setChildElementSequence:", v4);

    SAMLAssertionNamespace();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v5);

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

- (SAMLSignature)signature
{
  return (SAMLSignature *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Signature"));
}

- (SAMLSubject)subject
{
  return (SAMLSubject *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Subject"));
}

- (SAMLConditions)conditions
{
  return (SAMLConditions *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Conditions"));
}

- (SAMLAdvice)advice
{
  return (SAMLAdvice *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Advice"));
}

- (NSArray)samlAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AttributeStatement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "getElementsByTagName:", CFSTR("Attribute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  return (NSArray *)v3;
}

- (SAMLAuthNStatement)authentication
{
  return (SAMLAuthNStatement *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("AuthnStatement"));
}

- (NSArray)authorizations
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
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("AuthzDecisiontStatement"));
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

- (BOOL)isValid:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[SAMLAssertion signature](self, "signature");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SAMLAssertion signature](self, "signature"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isValid"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (a3)
    {
      SAMLParserErrorForErrorCode(500);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    -[SAMLAssertion authentication](self, "authentication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isValid") & 1) == 0)
    {
      if (a3)
      {
        SAMLParserErrorForErrorCode(401);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 1;
    }

  }
  return v11;
}

- (BOOL)meetsConditions:(id *)a3
{
  void *v4;

  -[SAMLAssertion conditions](self, "conditions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "assertionMeetsConditions:", a3);

  return (char)a3;
}

- (BOOL)isValidForRequestor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SAMLAssertion conditions](self, "conditions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audienceRestrictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 |= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEqualToString:", v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (id)authorizationForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SAMLAssertion authorizations](self, "authorizations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "resource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          objc_msgSend(v9, "decision");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

@end
