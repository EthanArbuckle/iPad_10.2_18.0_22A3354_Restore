@implementation TRIGloballyAvailableNamespaces

- (TRIGloballyAvailableNamespaces)initWithKVStore:(id)a3
{
  id v6;
  TRIGloballyAvailableNamespaces *v7;
  TRIGloballyAvailableNamespaces *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIGloballyAvailableNamespaces.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kvStore"));

  }
  v11.receiver = self;
  v11.super_class = (Class)TRIGloballyAvailableNamespaces;
  v7 = -[TRIGloballyAvailableNamespaces init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_kvStore, a3);

  return v8;
}

- (BOOL)setNamespaces:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 0, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;

  if (v6)
  {
    -[TRIKVStore setBlob:forKey:usingTransaction:](self->_kvStore, "setBlob:forKey:usingTransaction:", v6, CFSTR("globally_available_namespaces"), 0);
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Couldn't generate data for globally available namespace with error:%@", buf, 0xCu);
    }

  }
  return v6 != 0;
}

- (id)namespaces
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[TRIKVStore blobForKey:usingTransaction:](self->_kvStore, "blobForKey:usingTransaction:", CFSTR("globally_available_namespaces"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = (void *)MEMORY[0x1D8232A5C]();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v4);
    v15 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v7, v2, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Unable to unarchive globally available namespaces with error: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v10;

  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_INFO, "No globally available namespaces found.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStore, 0);
}

@end
