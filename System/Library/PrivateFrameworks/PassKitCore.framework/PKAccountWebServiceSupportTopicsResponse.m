@implementation PKAccountWebServiceSupportTopicsResponse

- (PKAccountWebServiceSupportTopicsResponse)initWithData:(id)a3
{
  PKAccountWebServiceSupportTopicsResponse *v3;
  PKAccountWebServiceSupportTopicsResponse *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKAccountSupportTopic *v14;
  PKAccountSupportTopic *v15;
  uint64_t v16;
  NSArray *topics;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PKAccountWebServiceSupportTopicsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v23, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKArrayForKey:", CFSTR("topics"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v14 = [PKAccountSupportTopic alloc];
              v15 = -[PKAccountSupportTopic initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v19);
              if (v15)
                objc_msgSend(v7, "addObject:", v15);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v10);
      }

      v16 = objc_msgSend(v7, "copy");
      topics = v4->_topics;
      v4->_topics = (NSArray *)v16;

    }
  }
  return v4;
}

- (NSArray)topics
{
  return self->_topics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
}

@end
