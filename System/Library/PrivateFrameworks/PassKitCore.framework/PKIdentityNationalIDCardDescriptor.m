@implementation PKIdentityNationalIDCardDescriptor

- (PKIdentityNationalIDCardDescriptor)init
{
  id v3;
  PKIdentityNationalIDCardDescriptor *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D16A18]);
  v4 = -[PKIdentityNationalIDCardDescriptor initWithDIIdentityNationalIDCardDescriptor:](self, "initWithDIIdentityNationalIDCardDescriptor:", v3);

  return v4;
}

- (PKIdentityNationalIDCardDescriptor)initWithDIIdentityNationalIDCardDescriptor:(id)a3
{
  id v5;
  PKIdentityNationalIDCardDescriptor *v6;
  PKIdentityNationalIDCardDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKIdentityNationalIDCardDescriptor;
  v6 = -[PKIdentityNationalIDCardDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrapped, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKIdentityNationalIDCardDescriptor elements](self, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("elements: ["));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = &stru_1E2ADF4C0;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[PKIdentityNationalIDCardDescriptor intentToStoreForElement:](self, "intentToStoreForElement:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v7);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v12);

          v7 = CFSTR(", ");
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v7 = CFSTR(", ");
      }
      while (v6);
    }

    objc_msgSend(v3, "appendString:", CFSTR("] "));
    v4 = v15;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v13 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v13;
}

- (NSArray)elements
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PKIdentityElement *v10;
  PKIdentityElement *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[DIIdentityNationalIDCardDescriptor elements](self->_wrapped, "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [PKIdentityElement alloc];
        v11 = -[PKIdentityElement initWithDIIdentityElement:](v10, "initWithDIIdentityElement:", v9, (_QWORD)v13);
        objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)addElements:(id)a3 withIntentToStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "asDIIdentityElement", (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "asDIIdentityIntentToStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIIdentityNationalIDCardDescriptor addElements:withIntentToStore:](self->_wrapped, "addElements:withIntentToStore:", v8, v15);

}

- (id)intentToStoreForElement:(id)a3
{
  void *v4;
  void *v5;
  PKIdentityIntentToStore *v6;

  objc_msgSend(a3, "asDIIdentityElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIIdentityNationalIDCardDescriptor intentToStoreForElement:](self->_wrapped, "intentToStoreForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKIdentityIntentToStore initWithDIIdentityIntentToStore:]([PKIdentityIntentToStore alloc], "initWithDIIdentityIntentToStore:", v5);

  return v6;
}

- (void)setRegionCode:(id)a3
{
  -[DIIdentityNationalIDCardDescriptor setRegionCode:](self->_wrapped, "setRegionCode:", a3);
}

- (NSString)regionCode
{
  return (NSString *)-[DIIdentityNationalIDCardDescriptor regionCode](self->_wrapped, "regionCode");
}

- (id)asDIIdentityNationalIDCardDescriptor
{
  return self->_wrapped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapped, 0);
}

@end
