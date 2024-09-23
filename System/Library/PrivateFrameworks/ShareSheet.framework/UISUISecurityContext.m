@implementation UISUISecurityContext

- (UISUISecurityContext)initWithSecurityScopedResources:(id)a3
{
  id v5;
  UISUISecurityContext *v6;
  UISUISecurityContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISUISecurityContext;
  v6 = -[UISUISecurityContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_securityScopedResources, a3);
    v7->_activationCount = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[UISUISecurityContext isActive](self, "isActive");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> active = %@, resources = %@"), v4, self, v6, self->_securityScopedResources);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)securityScopedResourcesMatchingPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUISecurityContext securityScopedResources](self, "securityScopedResources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__UISUISecurityContext_securityScopedResourcesMatchingPredicate___block_invoke;
    v11[3] = &unk_1E40034E0;
    v13 = v4;
    v7 = v5;
    v12 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

    v8 = v12;
    v9 = v7;

  }
  else
  {
    -[UISUISecurityContext securityScopedResources](self, "securityScopedResources");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __65__UISUISecurityContext_securityScopedResourcesMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (UISUISecurityContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  UISUISecurityContext *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_securityScopedResources);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[UISUISecurityContext initWithSecurityScopedResources:](self, "initWithSecurityScopedResources:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *securityScopedResources;
  id v4;
  id v5;

  securityScopedResources = self->_securityScopedResources;
  v4 = a3;
  NSStringFromSelector(sel_securityScopedResources);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", securityScopedResources, v5);

}

- (BOOL)isActive
{
  return self->_activationCount > 0;
}

- (void)activate
{
  int64_t activationCount;
  NSMutableArray *v4;
  NSMutableArray *URLsBeingAccessed;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  activationCount = self->_activationCount;
  self->_activationCount = activationCount + 1;
  if (!activationCount)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    URLsBeingAccessed = self->_URLsBeingAccessed;
    self->_URLsBeingAccessed = v4;

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_securityScopedResources;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "startAccessing", (_QWORD)v13))
          {
            objc_msgSend(v11, "url");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              -[NSMutableArray addObject:](self->_URLsBeingAccessed, "addObject:", v12);

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)deactivate
{
  int64_t v2;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *URLsBeingAccessed;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = self->_activationCount - 1;
  self->_activationCount = v2;
  if (!v2)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_securityScopedResources;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "stopAccessing", (_QWORD)v10);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    URLsBeingAccessed = self->_URLsBeingAccessed;
    self->_URLsBeingAccessed = 0;

  }
}

- (id)accessibleURLs
{
  return (id)-[NSMutableArray copy](self->_URLsBeingAccessed, "copy");
}

- (NSArray)securityScopedResources
{
  return self->_securityScopedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopedResources, 0);
  objc_storeStrong((id *)&self->_URLsBeingAccessed, 0);
}

@end
