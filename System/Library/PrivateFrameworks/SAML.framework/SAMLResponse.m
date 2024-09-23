@implementation SAMLResponse

- (SAMLResponse)initWithData:(id)a3 schema:(id)a4 error:(id *)a5
{
  SAMLResponse *v6;
  SAMLResponse *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *responseElement;
  objc_class *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SAMLResponse;
  v6 = -[XMLWrapperDoc initWithData:schema:error:](&v14, sel_initWithData_schema_error_, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[XMLWrapperDoc documentElement](v6, "documentElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[XMLWrapperDoc documentElement](v7, "documentElement");
      v10 = objc_claimAutoreleasedReturnValue();
      responseElement = v7->_responseElement;
      v7->_responseElement = (SAMLResponseElement *)v10;
LABEL_6:

      return v7;
    }
    if (a5)
    {
      -[XMLWrapperDoc documentElement](v7, "documentElement");
      responseElement = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      SAMLInvalidDocumentElementErrorForClass(v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  return v7;
}

- (id)assertions
{
  void *v2;
  void *v3;

  -[SAMLResponse responseElement](self, "responseElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)attributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMLResponse responseElement](self, "responseElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "samlAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "values", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v14, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return (NSDictionary *)v3;
}

- (id)attributeValuesForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SAMLResponse attributes](self, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)selectedProvider
{
  void *v2;
  void *v3;

  -[XMLWrapperDoc documentElement](self, "documentElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "issuer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)subject
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SAMLResponse responseElement](self, "responseElement", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "subject");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)userName
{
  void *v2;
  void *v3;

  -[SAMLResponse attributeValuesForName:](self, "attributeValuesForName:", CFSTR("username"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasValidAuthentication
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SAMLResponse assertions](self, "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        v13 = v7;
        v9 = objc_msgSend(v8, "isValid:", &v13);
        v4 = v13;

        if (v9)
        {
          objc_msgSend(v8, "authentication");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isValid");

          if ((v11 & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        ++v6;
        v7 = v4;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v3)
        continue;
      break;
    }
LABEL_12:

  }
  return v3;
}

- (id)authenticationTTL
{
  void *v2;
  void *v3;
  void *v4;

  -[SAMLResponse responseElement](self, "responseElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authnStatement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "sessionNotOnOrAfter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAuthenticationTTL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SAMLResponse responseElement](self, "responseElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authnStatement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    SAMLStringFromDate(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttributeWithName:value:", CFSTR("SessionNotOnOrAfter"), v6);

  }
}

- (id)authenticationSessionId
{
  void *v2;
  void *v3;
  void *v4;

  -[SAMLResponse responseElement](self, "responseElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authnStatement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "sessionIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)assertionMeetsConditions:(id *)a3
{
  void *v4;

  -[SAMLResponse responseElement](self, "responseElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "assertionMeetsConditions:", a3);

  return (char)a3;
}

- (BOOL)isValid:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[SAMLResponse responseElement](self, "responseElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signature");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

LABEL_6:
    -[SAMLResponse responseElement](self, "responseElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isMemberOfClass:", objc_opt_class());

    if ((v13 & 1) != 0)
      return 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAMLResponse assertions](self, "assertions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        v21 = v18;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v20);
          v26 = v21;
          v23 = objc_msgSend(v22, "isValid:", &v26);
          v18 = v26;

          if (v23)
            objc_msgSend(v14, "addObject:", v22);
          ++v20;
          v21 = v18;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    if (objc_msgSend(v15, "count") && !objc_msgSend(v14, "count"))
    {
      if (a3 && v18)
      {
        v25 = objc_retainAutorelease(v18);
      }
      else
      {
        if (!a3)
        {
          v11 = 0;
          goto LABEL_22;
        }
        SAMLParserErrorForErrorCode(400);
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v11 = 0;
      *a3 = v25;
    }
    else
    {
      v11 = 1;
    }
LABEL_22:

    return v11;
  }
  v7 = (void *)v6;
  -[SAMLResponse responseElement](self, "responseElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signature");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isValid");

  if ((v10 & 1) != 0)
    goto LABEL_6;
  if (!a3)
    return 0;
  SAMLParserErrorForErrorCode(500);
  v11 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v11;
}

- (id)statusCodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAMLResponse responseElement](self, "responseElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "statusCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "statusCode");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        objc_msgSend(v8, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        objc_msgSend(v8, "statusCode");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v10;
      }
      while (v10);
    }
  }

  return v3;
}

- (id)primaryStatusCode
{
  void *v2;
  void *v3;

  -[SAMLResponse statusCodes](self, "statusCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)expectedAction
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;

  -[SAMLResponse statusCodes](self, "statusCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[SAMLResponse primaryStatusCode](self, "primaryStatusCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:status:Success")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("urn:oasis:names:tc:SAML:2.0:status:Responder")))
    {
      if ((unint64_t)objc_msgSend(v3, "count") < 2)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(v3, "objectAtIndex:", 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_msgSend(v6, "isEqual:", CFSTR("urn:oasis:names:tc:SAML:2.0:status:NoPassive")) & 1) != 0)
      {
        v5 = 2;
      }
      else if (objc_msgSend(v6, "isEqual:", CFSTR("urn:apple:status:MSORequestsUI")))
      {
        v5 = 2;
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)authorizationStatusForResource:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SAMLResponse assertions](self, "assertions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "authorizationForResource:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (SAMLResponseElement)responseElement
{
  return self->_responseElement;
}

- (void)setResponseElement:(id)a3
{
  objc_storeStrong((id *)&self->_responseElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseElement, 0);
}

@end
