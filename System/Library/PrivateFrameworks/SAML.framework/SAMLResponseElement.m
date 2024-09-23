@implementation SAMLResponseElement

+ (id)createElement:(id *)a3
{
  SAMLResponseElement *v3;
  void *v4;

  v3 = -[XMLWrapperElement initWithTagName:error:]([SAMLResponseElement alloc], "initWithTagName:error:", CFSTR("Response"), a3);
  if (v3)
  {
    SAMLProtocolNamespace();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[XMLWrapperElement setNamespace:](v3, "setNamespace:", v4);

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

- (NSString)relatedRequest
{
  void *v2;
  void *v3;

  -[XMLWrapperElement attributeWithName:](self, "attributeWithName:", CFSTR("InResponseTo"));
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

- (SAMLStatus)status
{
  return (SAMLStatus *)-[XMLWrapperElement firstElementByTagName:](self, "firstElementByTagName:", CFSTR("Status"));
}

- (NSArray)assertions
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
  -[XMLWrapperElement getElementsByTagName:](self, "getElementsByTagName:", CFSTR("Assertion"));
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

- (BOOL)assertionMeetsConditions:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SAMLResponseElement assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[SAMLResponseElement assertions](self, "assertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v8 = 0;
    if (v7)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        v10 = 0;
        v11 = v8;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v15 = v11;
          v13 = objc_msgSend(v12, "meetsConditions:", &v15);
          v8 = v15;

          if ((v13 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
          ++v10;
          v11 = v8;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    if (a3)
    {
      v8 = objc_retainAutorelease(v8);
      *a3 = v8;
    }
  }
  else
  {
    v8 = 0;
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)authnStatement
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SAMLResponseElement assertions](self, "assertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "authentication");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_msgSend(v6, "authentication");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

@end
