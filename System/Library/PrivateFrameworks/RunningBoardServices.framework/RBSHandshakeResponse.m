@implementation RBSHandshakeResponse

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSHandshakeResponse)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSHandshakeResponse *v5;
  uint64_t v6;
  RBSProcessHandle *handle;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *assertionIdentifiersByOldIdentifier;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSDictionary *assertionErrorsByOldIdentifier;
  uint64_t v22;
  NSDictionary *managedEndpointByLaunchIdentifier;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RBSHandshakeResponse;
  v5 = -[RBSHandshakeResponse init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
    v6 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (RBSProcessHandle *)v6;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("success-values")))
    {
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("success-values"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v11, objc_opt_class(), CFSTR("success-keys"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithObjects:forKeys:", v10, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      assertionIdentifiersByOldIdentifier = v5->_assertionIdentifiersByOldIdentifier;
      v5->_assertionIdentifiersByOldIdentifier = (NSDictionary *)v13;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("fail-values")))
    {
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v16, objc_opt_class(), CFSTR("fail-values"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v18, objc_opt_class(), CFSTR("fail-keys"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:", v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      assertionErrorsByOldIdentifier = v5->_assertionErrorsByOldIdentifier;
      v5->_assertionErrorsByOldIdentifier = (NSDictionary *)v20;

    }
    objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("_managedEndpointByLaunchIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    managedEndpointByLaunchIdentifier = v5->_managedEndpointByLaunchIdentifier;
    v5->_managedEndpointByLaunchIdentifier = (NSDictionary *)v22;

  }
  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  RBSProcessHandle *handle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  handle = self->_handle;
  v9 = a3;
  -[RBSProcessHandle fullEncode:forKey:](handle, "fullEncode:forKey:", v9, CFSTR("_handle"));
  -[NSDictionary allKeys](self->_assertionIdentifiersByOldIdentifier, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("success-keys"));

  -[NSDictionary allValues](self->_assertionIdentifiersByOldIdentifier, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("success-values"));

  -[NSDictionary allKeys](self->_assertionErrorsByOldIdentifier, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("fail-keys"));

  -[NSDictionary allValues](self->_assertionErrorsByOldIdentifier, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("fail-values"));

  objc_msgSend(v9, "encodeDictionary:forKey:", self->_managedEndpointByLaunchIdentifier, CFSTR("_managedEndpointByLaunchIdentifier"));
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (void)setManagedEndpointByLaunchIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, a3);
}

- (void)setAssertionIdentifiersByOldIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assertionIdentifiersByOldIdentifier, a3);
}

- (void)setAssertionErrorsByOldIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assertionErrorsByOldIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionErrorsByOldIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionIdentifiersByOldIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (NSDictionary)assertionIdentifiersByOldIdentifier
{
  return self->_assertionIdentifiersByOldIdentifier;
}

- (NSDictionary)assertionErrorsByOldIdentifier
{
  return self->_assertionErrorsByOldIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  RBSHandshakeResponse *v4;
  uint64_t v5;
  BOOL v6;
  RBSProcessHandle *handle;
  RBSProcessHandle *v8;
  NSDictionary *assertionIdentifiersByOldIdentifier;
  NSDictionary *v10;
  NSDictionary *assertionErrorsByOldIdentifier;
  NSDictionary *v12;
  NSDictionary *managedEndpointByLaunchIdentifier;
  const __CFDictionary *v14;
  CFIndex Count;
  NSDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (RBSHandshakeResponse *)a3;
  if (self == v4)
    goto LABEL_29;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    v6 = 0;
    goto LABEL_30;
  }
  handle = self->_handle;
  v8 = v4->_handle;
  if (handle != v8)
  {
    v6 = 0;
    if (!handle || !v8)
      goto LABEL_30;
    if (!-[RBSProcessHandle isEqual:](handle, "isEqual:"))
      goto LABEL_3;
  }
  assertionIdentifiersByOldIdentifier = self->_assertionIdentifiersByOldIdentifier;
  v10 = v4->_assertionIdentifiersByOldIdentifier;
  if (assertionIdentifiersByOldIdentifier != v10)
  {
    v6 = 0;
    if (!assertionIdentifiersByOldIdentifier || !v10)
      goto LABEL_30;
    if (!-[NSDictionary isEqual:](assertionIdentifiersByOldIdentifier, "isEqual:"))
      goto LABEL_3;
  }
  assertionErrorsByOldIdentifier = self->_assertionErrorsByOldIdentifier;
  v12 = v4->_assertionErrorsByOldIdentifier;
  if (assertionErrorsByOldIdentifier != v12)
  {
    v6 = 0;
    if (!assertionErrorsByOldIdentifier || !v12)
      goto LABEL_30;
    if (!-[NSDictionary isEqual:](assertionErrorsByOldIdentifier, "isEqual:"))
      goto LABEL_3;
  }
  managedEndpointByLaunchIdentifier = self->_managedEndpointByLaunchIdentifier;
  v14 = (const __CFDictionary *)v4->_managedEndpointByLaunchIdentifier;
  if (managedEndpointByLaunchIdentifier == (NSDictionary *)v14)
  {
LABEL_29:
    v6 = 1;
    goto LABEL_30;
  }
  v6 = 0;
  if (managedEndpointByLaunchIdentifier && v14)
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)managedEndpointByLaunchIdentifier);
    if (Count != CFDictionaryGetCount(v14))
      goto LABEL_3;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = managedEndpointByLaunchIdentifier;
    v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[NSDictionary objectForKey:](v16, "objectForKey:", v21, (_QWORD)v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFDictionary objectForKey:](v14, "objectForKey:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "_isEquivalentToEndpoint:", v23);

          if (!v24)
          {
            v6 = 0;
            goto LABEL_32;
          }
        }
        v18 = -[NSDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_32:

  }
LABEL_30:

  return v6;
}

@end
