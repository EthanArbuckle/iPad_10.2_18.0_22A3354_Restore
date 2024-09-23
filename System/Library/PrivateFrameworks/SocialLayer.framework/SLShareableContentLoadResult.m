@implementation SLShareableContentLoadResult

- (SLShareableContentLoadResult)initWithWithData:(id)a3 archivedObjectClassName:(id)a4 urlWrapper:(id)a5 wasOpenedInPlace:(BOOL)a6 error:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SLShareableContentLoadResult *v17;
  SLShareableContentLoadResult *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SLShareableContentLoadResult;
  v17 = -[SLShareableContentLoadResult init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    objc_storeStrong((id *)&v18->_archivedObjectClassName, a4);
    objc_storeStrong((id *)&v18->_urlWrapper, a5);
    v18->_wasOpenedInPlace = a6;
    objc_storeStrong((id *)&v18->_error, a7);
  }

  return v18;
}

+ (SLShareableContentLoadResult)resultWithData:(id)a3 archivedObjectClass:(Class)a4 urlWrapper:(id)a5 wasOpenedInPlace:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = objc_alloc((Class)a1);
  v16 = v15;
  if (a4)
  {
    NSStringFromClass(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:", v12, v17, v13, v8, v14);

  }
  else
  {
    v18 = (void *)objc_msgSend(v15, "initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:", v12, 0, v13, v8, v14);
  }

  return (SLShareableContentLoadResult *)v18;
}

+ (SLShareableContentLoadResult)resultWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:", 0, 0, 0, 0, v4);

  return (SLShareableContentLoadResult *)v5;
}

- (Class)archivedObjectClass
{
  NSString *v2;
  NSString *v3;
  objc_class *v4;

  -[SLShareableContentLoadResult archivedObjectClassName](self, "archivedObjectClassName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (SLShareableContentIsArchivedObjectClassNameAllowed_onceToken != -1)
      dispatch_once(&SLShareableContentIsArchivedObjectClassNameAllowed_onceToken, &__block_literal_global_9);
    if (objc_msgSend((id)SLShareableContentIsArchivedObjectClassNameAllowed_allowedArchivedObjectClassNames, "containsObject:", v3))v2 = (NSString *)NSClassFromString(v3);
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentLoadResult)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SLShareableContentLoadResult *v19;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_data);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_archivedObjectClass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_urlWrapper);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_wasOpenedInPlace);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeBoolForKey:", v14);

  v16 = objc_opt_class();
  NSStringFromSelector(sel_error);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SLShareableContentLoadResult initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:](self, "initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:", v7, v10, v13, v15, v18);
  return v19;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SLShareableContentLoadResult data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_data);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentLoadResult archivedObjectClassName](self, "archivedObjectClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_archivedObjectClassName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLShareableContentLoadResult urlWrapper](self, "urlWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_urlWrapper);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[SLShareableContentLoadResult wasOpenedInPlace](self, "wasOpenedInPlace");
  NSStringFromSelector(sel_wasOpenedInPlace);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  -[SLShareableContentLoadResult error](self, "error");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_error);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v13);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentLoadResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SLShareableContentLoadResult *v19;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_data);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_archivedObjectClass);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_urlWrapper);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_wasOpenedInPlace);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeBoolForKey:", v14);

  v16 = objc_opt_class();
  NSStringFromSelector(sel_error);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[SLShareableContentLoadResult initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:](self, "initWithWithData:archivedObjectClassName:urlWrapper:wasOpenedInPlace:error:", v7, v10, v13, v15, v18);
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[SLShareableContentLoadResult data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_data);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentLoadResult archivedObjectClassName](self, "archivedObjectClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_archivedObjectClassName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLShareableContentLoadResult urlWrapper](self, "urlWrapper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_urlWrapper);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[SLShareableContentLoadResult wasOpenedInPlace](self, "wasOpenedInPlace");
  NSStringFromSelector(sel_wasOpenedInPlace);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  -[SLShareableContentLoadResult error](self, "error");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_error);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, v13);

}

- (NSData)data
{
  return self->_data;
}

- (SLSecurityScopedURL)urlWrapper
{
  return self->_urlWrapper;
}

- (BOOL)wasOpenedInPlace
{
  return self->_wasOpenedInPlace;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)archivedObjectClassName
{
  return self->_archivedObjectClassName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedObjectClassName, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
