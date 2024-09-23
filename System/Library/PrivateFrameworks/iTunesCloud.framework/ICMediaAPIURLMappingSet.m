@implementation ICMediaAPIURLMappingSet

- (ICMediaAPIURLMappingSet)initWithResponsePayload:(id)a3
{
  id v4;
  ICMediaAPIURLMappingSet *v5;
  uint64_t v6;
  NSArray *responsePayload;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMediaAPIURLMappingSet;
  v5 = -[ICMediaAPIURLMappingSet init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responsePayload = v5->_responsePayload;
    v5->_responsePayload = (NSArray *)v6;

  }
  return v5;
}

- (NSArray)responsePayload
{
  return self->_responsePayload;
}

- (void)enumerateMappingsUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ICMediaAPIURLMapping *v11;
  ICMediaAPIURLMapping *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_responsePayload;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (_NSIsNSDictionary())
        {
          v11 = [ICMediaAPIURLMapping alloc];
          v12 = -[ICMediaAPIURLMapping initWithResponseDictionary:](v11, "initWithResponseDictionary:", v10, (_QWORD)v13);
          v4[2](v4, v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)mappingsForFeatureName:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  ICMediaAPIURLMapping *v12;
  ICMediaAPIURLMapping *v13;
  id v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_responsePayload;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if (_NSIsNSDictionary())
        {
          v12 = [ICMediaAPIURLMapping alloc];
          v13 = -[ICMediaAPIURLMapping initWithResponseDictionary:](v12, "initWithResponseDictionary:", v11, (_QWORD)v18);
          -[ICMediaAPIURLMapping featureName](v13, "featureName");
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14 == v4)
          {

          }
          else
          {
            v15 = v14;
            v16 = objc_msgSend(v4, "isEqual:", v14);

            if (!v16)
              goto LABEL_12;
          }
          objc_msgSend(v5, "addObject:", v13);
LABEL_12:

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsePayload, 0);
}

@end
