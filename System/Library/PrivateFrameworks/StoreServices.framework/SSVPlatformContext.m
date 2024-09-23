@implementation SSVPlatformContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unpersonalizedLookupURLString, 0);
  objc_storeStrong((id *)&self->_signedQueryParameters, 0);
  objc_storeStrong((id *)&self->_signedHeaders, 0);
  objc_storeStrong((id *)&self->_sapContext, 0);
  objc_storeStrong((id *)&self->_lookupURLString, 0);
}

- (SSVPlatformContext)initWithBagDictionary:(id)a3
{
  id v4;
  SSVPlatformContext *v5;
  void *v6;
  uint64_t v7;
  NSString *lookupURLString;
  void *v9;
  uint64_t v10;
  NSString *unpersonalizedLookupURLString;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *signedQueryParameters;
  void *v18;
  uint64_t v19;
  NSArray *signedHeaders;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SSVPlatformContext;
  v5 = -[SSVPlatformContext init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("storeplatform-lookup-url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_msgSend(v6, "copy");
      lookupURLString = v5->_lookupURLString;
      v5->_lookupURLString = (NSString *)v7;

      objc_msgSend(v4, "objectForKey:", CFSTR("storeplatform-lookup-url-unpersonalized"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "copy");
        unpersonalizedLookupURLString = v5->_unpersonalizedLookupURLString;
        v5->_unpersonalizedLookupURLString = (NSString *)v10;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("signed-actions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("MZStorePlatform"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "objectForKey:", CFSTR("lookup"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "objectForKey:", CFSTR("fields"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = objc_msgSend(v15, "copy");
              signedQueryParameters = v5->_signedQueryParameters;
              v5->_signedQueryParameters = (NSArray *)v16;

            }
            objc_msgSend(v14, "objectForKey:", CFSTR("headers"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = objc_msgSend(v18, "copy");
              signedHeaders = v5->_signedHeaders;
              v5->_signedHeaders = (NSArray *)v19;

            }
          }

        }
      }
    }
    else
    {
      v12 = v5;
      v9 = v6;
      v5 = 0;
    }

  }
  return v5;
}

- (SSVPlatformContext)initWithLookupURL:(id)a3 unpersonalizedLookupURL:(id)a4 signedHeaders:(id)a5 signedQueryParameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SSVPlatformContext *v14;
  uint64_t v15;
  NSString *lookupURLString;
  uint64_t v17;
  NSArray *signedHeaders;
  uint64_t v19;
  NSArray *signedQueryParameters;
  uint64_t v21;
  NSString *unpersonalizedLookupURLString;
  SSVPlatformContext *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v25.receiver = self;
    v25.super_class = (Class)SSVPlatformContext;
    v14 = -[SSVPlatformContext init](&v25, sel_init);
    if (v14)
    {
      objc_msgSend(v10, "absoluteString");
      v15 = objc_claimAutoreleasedReturnValue();
      lookupURLString = v14->_lookupURLString;
      v14->_lookupURLString = (NSString *)v15;

      v17 = objc_msgSend(v12, "copy");
      signedHeaders = v14->_signedHeaders;
      v14->_signedHeaders = (NSArray *)v17;

      v19 = objc_msgSend(v13, "copy");
      signedQueryParameters = v14->_signedQueryParameters;
      v14->_signedQueryParameters = (NSArray *)v19;

      objc_msgSend(v11, "absoluteString");
      v21 = objc_claimAutoreleasedReturnValue();
      unpersonalizedLookupURLString = v14->_unpersonalizedLookupURLString;
      v14->_unpersonalizedLookupURLString = (NSString *)v21;

    }
    self = v14;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSDictionary)bagDictionary
{
  void *v3;
  void *v4;
  NSString *lookupURLString;
  id v6;
  void *v7;
  NSArray *signedHeaders;
  NSArray *signedQueryParameters;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  lookupURLString = self->_lookupURLString;
  if (lookupURLString)
    objc_msgSend(v3, "setObject:forKey:", lookupURLString, CFSTR("storeplatform-lookup-url"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = v6;
  signedHeaders = self->_signedHeaders;
  if (signedHeaders)
    objc_msgSend(v6, "setObject:forKey:", signedHeaders, CFSTR("headers"));
  signedQueryParameters = self->_signedQueryParameters;
  if (signedQueryParameters)
    objc_msgSend(v7, "setObject:forKey:", signedQueryParameters, CFSTR("fields"));
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("lookup"), 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v10, CFSTR("MZStorePlatform"), 0);
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("signed-actions"));

  }
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_lookupURLString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  objc_storeStrong((id *)(v5 + 16), self->_sapContext);
  v8 = -[NSArray copyWithZone:](self->_signedHeaders, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSArray copyWithZone:](self->_signedQueryParameters, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSString copyWithZone:](self->_unpersonalizedLookupURLString, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  return (id)v5;
}

- (NSString)lookupURLString
{
  return self->_lookupURLString;
}

- (SSVSAPContext)SAPContext
{
  return self->_sapContext;
}

- (void)setSAPContext:(id)a3
{
  objc_storeStrong((id *)&self->_sapContext, a3);
}

- (NSArray)signedHeaders
{
  return self->_signedHeaders;
}

- (NSArray)signedQueryParameters
{
  return self->_signedQueryParameters;
}

- (NSString)unpersonalizedLookupURLString
{
  return self->_unpersonalizedLookupURLString;
}

@end
