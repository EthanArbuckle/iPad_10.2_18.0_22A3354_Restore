@implementation PKWebServiceLoggableHeaders

- (PKWebServiceLoggableHeaders)init
{

  return 0;
}

- (PKWebServiceLoggableHeaders)initWithHeaders:(id)a3
{
  id v5;
  PKWebServiceLoggableHeaders *v6;
  PKWebServiceLoggableHeaders *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKWebServiceLoggableHeaders;
  v6 = -[PKWebServiceLoggableHeaders init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_headers, a3);

  return v7;
}

- (id)description
{
  return -[PKWebServiceLoggableHeaders _descriptionIncludingPrivateFields:](self, "_descriptionIncludingPrivateFields:", 1);
}

- (id)redactedDescription
{
  return -[PKWebServiceLoggableHeaders _descriptionIncludingPrivateFields:](self, "_descriptionIncludingPrivateFields:", 0);
}

- (id)_descriptionIncludingPrivateFields:(BOOL)a3
{
  _BOOL4 v3;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  __CFString *v11;
  __CFString *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v20 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_headers;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v5);
      v11 = (__CFString *)*(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
      v12 = v11;
      if (v11 == CFSTR("x-conversation-id")
        || v11
        && (v13 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("x-conversation-id")),
            v12,
            v13))
      {
        -[NSDictionary PKStringForKey:](self->_headers, "PKStringForKey:", v12);
        v14 = v8;
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v3)
          continue;
        -[NSDictionary objectForKeyedSubscript:](self->_headers, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("\t%@ = \"%@\"\n"), v12, v14);
      }

    }
    v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v7);
LABEL_17:

  if (!v3)
    objc_msgSend(v20, "appendFormat:", CFSTR("\t%lu <private> fields\n"), -[NSDictionary count](self->_headers, "count") - (v8 != 0));
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v8)
    v16 = objc_msgSend(v15, "initWithFormat:", CFSTR("{\n\tx-conversation-id = \"%@\"\n%@}"), v8, v20);
  else
    v16 = objc_msgSend(v15, "initWithFormat:", CFSTR("{\n%@}"), v20, v19);
  v17 = (void *)v16;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
