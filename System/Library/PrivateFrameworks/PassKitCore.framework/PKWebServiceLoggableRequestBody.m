@implementation PKWebServiceLoggableRequestBody

- (PKWebServiceLoggableRequestBody)init
{

  return 0;
}

- (PKWebServiceLoggableRequestBody)initWithBody:(id)a3 sensitiveKeys:(id)a4
{
  id v7;
  id v8;
  PKWebServiceLoggableRequestBody *v9;
  PKWebServiceLoggableRequestBody *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKWebServiceLoggableRequestBody;
  v9 = -[PKWebServiceLoggableRequestBody init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_body, a3);
    objc_storeStrong((id *)&v10->_sensitiveKeys, a4);
  }

  return v10;
}

- (id)description
{
  return -[PKWebServiceLoggableRequestBody _descriptionIncludingPrivateFields:](self, "_descriptionIncludingPrivateFields:", 1);
}

- (id)redactedDescription
{
  return -[PKWebServiceLoggableRequestBody _descriptionIncludingPrivateFields:](self, "_descriptionIncludingPrivateFields:", 0);
}

- (id)_descriptionIncludingPrivateFields:(BOOL)a3
{
  void *v4;
  NSData *v5;
  NSData *body;
  NSData *v7;
  NSData *v8;
  NSData *v9;

  if (self->_body)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        -[PKWebServiceLoggableRequestBody _redactLogsFromJSONObject:](self, "_redactLogsFromJSONObject:", v5);
        body = v5;
      }
      else
      {
        v8 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_body, 4);
        v5 = v8;
        if (v8)
        {
          v9 = v8;
LABEL_11:
          v7 = v9;

          return v7;
        }
        body = self->_body;
      }
      -[NSData description](body, "description");
      v9 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v7 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lu bytes"), -[NSData length](self->_body, "length"));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_redactLogsFromJSONObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (-[NSSet containsObject:](self->_sensitiveKeys, "containsObject:", v11))
          {
            objc_msgSend(v5, "setObject:forKey:", CFSTR("<redacted>"), v11);
          }
          else
          {
            objc_msgSend(v5, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKWebServiceLoggableRequestBody _redactLogsFromJSONObject:](self, "_redactLogsFromJSONObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v4;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          -[PKWebServiceLoggableRequestBody _redactLogsFromJSONObject:](self, "_redactLogsFromJSONObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }
    goto LABEL_21;
  }
LABEL_22:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveKeys, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end
