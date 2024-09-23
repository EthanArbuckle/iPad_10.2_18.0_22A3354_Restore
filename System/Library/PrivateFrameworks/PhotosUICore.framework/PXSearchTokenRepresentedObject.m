@implementation PXSearchTokenRepresentedObject

- (PXSearchTokenRepresentedObject)initWithTitle:(id)a3 queryToken:(id)a4
{
  return -[PXSearchTokenRepresentedObject initWithTitle:queryToken:priorityAssetUUID:](self, "initWithTitle:queryToken:priorityAssetUUID:", a3, a4, 0);
}

- (PXSearchTokenRepresentedObject)initWithTitle:(id)a3 queryToken:(id)a4 priorityAssetUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXSearchTokenRepresentedObject *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *priorityAssetUUID;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchTokenRepresentedObject;
  v11 = -[PXSearchTokenRepresentedObject init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queryToken, a4);
    v14 = objc_msgSend(v10, "copy");
    priorityAssetUUID = v11->_priorityAssetUUID;
    v11->_priorityAssetUUID = (NSString *)v14;

  }
  return v11;
}

- (PXSearchTokenRepresentedObject)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PXSearchTokenRepresentedObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryRepresentedObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    self = -[PXSearchTokenRepresentedObject initWithTitle:queryToken:](self, "initWithTitle:queryToken:", v5, v7);
    v9 = self;
  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive Query Token. Unable to initalize PXSearchTokenRepresentedObject, error: %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)dictionaryForArchiving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PXSearchTokenRepresentedObject title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("title"));

  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[PXSearchTokenRepresentedObject queryToken](self, "queryToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("queryRepresentedObject"));
    v9 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Failed to encode Query Token, error: %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXSearchTokenRepresentedObject title](self, "title");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[PXSearchTokenRepresentedObject queryToken](self, "queryToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
      v9 = 1;
    else
      v9 = objc_msgSend(v10, "isEqual:", v11);

    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXSearchTokenRepresentedObject title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXSearchTokenRepresentedObject queryToken](self, "queryToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%p\n"), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("Title: %@\n"), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("Priority Asset UUID: %@\n"), self->_priorityAssetUUID);
  objc_msgSend(v3, "appendFormat:", CFSTR("QueryToken: %@\n"), self->_queryToken);
  return v3;
}

- (PXSearchTokenRepresentedObject)initWithCoder:(id)a3
{
  id v4;
  PXSearchTokenRepresentedObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  PSIQueryToken *queryToken;
  uint64_t v13;
  NSString *title;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXSearchTokenRepresentedObject;
  v5 = -[PXSearchTokenRepresentedObject init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("queryRepresentedObject"));
    v11 = objc_claimAutoreleasedReturnValue();
    queryToken = v5->_queryToken;
    v5->_queryToken = (PSIQueryToken *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v13 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  PXAssertGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_1A6789000, v3, OS_LOG_TYPE_FAULT, "Encoding Search Token Represented Object is no longer supported.", v4, 2u);
  }

}

- (PXSearchTokenRepresentedObject)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchTokenRepresentedObject.m"), 124, CFSTR("%s is not available as initializer"), "-[PXSearchTokenRepresentedObject init]");

  abort();
}

- (NSString)title
{
  return self->_title;
}

- (PSIQueryToken)queryToken
{
  return self->_queryToken;
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_queryToken, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchTokenRepresentedObject.m"), 120, CFSTR("%s is not available as initializer"), "+[PXSearchTokenRepresentedObject new]");

  abort();
}

@end
