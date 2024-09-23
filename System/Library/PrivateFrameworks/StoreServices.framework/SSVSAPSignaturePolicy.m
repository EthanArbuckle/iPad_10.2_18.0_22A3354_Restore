@implementation SSVSAPSignaturePolicy

- (SSVSAPSignaturePolicy)initWithPolicyType:(int64_t)a3
{
  return -[SSVSAPSignaturePolicy initWithPolicyType:signatureComponents:](self, "initWithPolicyType:signatureComponents:", a3, 0);
}

- (SSVSAPSignaturePolicy)initWithPolicyType:(int64_t)a3 signatureComponents:(id)a4
{
  id v6;
  SSVSAPSignaturePolicy *v7;
  SSVSAPSignaturePolicy *v8;
  uint64_t v9;
  NSArray *signatureComponents;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SSVSAPSignaturePolicy;
  v7 = -[SSVSAPSignaturePolicy init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_policyType = a3;
    v9 = objc_msgSend(v6, "copy");
    signatureComponents = v8->_signatureComponents;
    v8->_signatureComponents = (NSArray *)v9;

  }
  return v8;
}

- (SSVSAPSignaturePolicy)initWithSignedActionsDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSVSAPSignatureComponent *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SSVSAPSignatureComponent *v21;
  SSVSAPSignaturePolicy *v22;
  SSVSAPSignaturePolicy *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "objectForKey:", CFSTR("headers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v25 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = -[SSVSAPSignatureComponent initWithComponentType:key:]([SSVSAPSignatureComponent alloc], "initWithComponentType:key:", 1, v12);
            objc_msgSend(v5, "addObject:", v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    v6 = v25;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("fields"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = self;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = -[SSVSAPSignatureComponent initWithComponentType:key:]([SSVSAPSignatureComponent alloc], "initWithComponentType:key:", 2, v20);
            objc_msgSend(v5, "addObject:", v21);

          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v17);
    }

    self = v24;
    v6 = v25;
  }
  if (objc_msgSend(v5, "count", v24))
  {
    v22 = -[SSVSAPSignaturePolicy initWithPolicyType:signatureComponents:](self, "initWithPolicyType:signatureComponents:", 2, v5);
  }
  else
  {

    v22 = 0;
  }

  return v22;
}

- (id)dataToSignWithRequestProperties:(id)a3
{
  id v4;
  SSVSAPSignatureDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = -[SSVSAPSignatureDataSource initWithURLRequestProperties:]([SSVSAPSignatureDataSource alloc], "initWithURLRequestProperties:", v4);

  -[SSVSAPSignaturePolicy _dataToSignWithDataSource:](self, "_dataToSignWithDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataToSignWithURLRequest:(id)a3
{
  id v4;
  SSVSAPSignatureDataSource *v5;
  void *v6;

  v4 = a3;
  v5 = -[SSVSAPSignatureDataSource initWithURLRequest:]([SSVSAPSignatureDataSource alloc], "initWithURLRequest:", v4);

  -[SSVSAPSignaturePolicy _dataToSignWithDataSource:](self, "_dataToSignWithDataSource:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataToSignWithURLResponse:(id)a3 responseData:(id)a4
{
  id v6;
  id v7;
  SSVSAPSignatureDataSource *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[SSVSAPSignatureDataSource initWithURLResponse:bodyData:]([SSVSAPSignatureDataSource alloc], "initWithURLResponse:bodyData:", v7, v6);

  -[SSVSAPSignaturePolicy _dataToSignWithDataSource:](self, "_dataToSignWithDataSource:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = (id)objc_msgSend(v9, "mutableCopy");
  v11 = v10;

  return v11;
}

- (id)_dataToSignWithDataSource:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "HTTPMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("POST"));

  if (v6)
  {
    objc_msgSend(v4, "HTTPBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_policyType == 2)
  {
    if (-[NSArray count](self->_signatureComponents, "count") == 1)
    {
      -[NSArray firstObject](self->_signatureComponents, "firstObject");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray _dataToSignWithDataSource:](v8, "_dataToSignWithDataSource:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = self->_signatureComponents;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "_dataToSignWithDataSource:", v4, (_QWORD)v15);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v7, "appendData:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v10);
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)policyType
{
  return self->_policyType;
}

- (NSArray)signatureComponents
{
  return self->_signatureComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureComponents, 0);
}

@end
