@implementation RCRequestInfo

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[RCRequestInfo requestKey](self, "requestKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCRequestInfo responseKey](self, "responseKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCRequestInfo fallbackURL](self, "fallbackURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RCRequestInfo requestType](self, "requestType");
  -[RCRequestInfo additionalChangeTags](self, "additionalChangeTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCRequestInfo requestCacheKey](self, "requestCacheKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCRequestInfo mutableAdditionalFields](self, "mutableAdditionalFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCRequestInfo cachePolicy](self, "cachePolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; requestKey: %@ responseKey: %@ fallbackURL: %@ requestType: %lu, additionalChangeTags: %@, cacheKey: %@, additionalFields: %@ cachePolicy: %@>"),
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (RCCachePolicy)cachePolicy
{
  return self->_cachePolicy;
}

- (NSString)responseKey
{
  return self->_responseKey;
}

- (NSMutableDictionary)mutableAdditionalFields
{
  return self->_mutableAdditionalFields;
}

- (NSURL)fallbackURL
{
  return self->_fallbackURL;
}

- (NSArray)additionalChangeTags
{
  return self->_additionalChangeTags;
}

- (NSString)requestCacheKey
{
  return self->_requestCacheKey;
}

- (NSString)requestKey
{
  return self->_requestKey;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (NSDictionary)allAdditionalFields
{
  void *v2;
  void *v3;

  -[RCRequestInfo mutableAdditionalFields](self, "mutableAdditionalFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestCacheKey:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  RCRequestInfo *v18;

  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[RCCachePolicy defaultCachePolicy](RCCachePolicy, "defaultCachePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:](self, "initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:", v16, v15, v14, a6, v13, v16, v17);

  return v18;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestFeedType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  RCRequestInfo *v19;

  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[RCCachePolicy defaultCachePolicy](RCCachePolicy, "defaultCachePolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:](self, "initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:", v17, v16, v15, a6, v14, a8, v18);

  return v19;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestFeedType:(unint64_t)a8 cachePolicy:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  const __CFString *v20;
  id v21;
  int v22;
  RCRequestInfo *v23;
  RCRequestInfo *v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCRequestInfo(News) initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:].cold.2();
    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCRequestInfo(News) initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:].cold.1();
LABEL_6:
  if (a8 == 1)
  {
    v20 = CFSTR("premium");
  }
  else
  {
    if (a8 != 2)
    {
      v21 = v15;
      v20 = 0;
      v22 = 0;
      goto LABEL_12;
    }
    v20 = CFSTR("premium_lite");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v15, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 1;
LABEL_12:
  v23 = -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:](self, "initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:", v15, v16, v17, a6, v18, v21, v19);
  v24 = v23;
  if (v22 && v23)
    -[RCRequestInfo setValue:forAdditionalField:](v23, "setValue:forAdditionalField:", v20, CFSTR("feedType"));

  return v24;
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7
{
  return -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:](self, "initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:", a3, a4, a5, a6, a7, a3);
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5
{
  return -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:](self, "initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:", a3, a4, a5, 0, 0);
}

- (RCRequestInfo)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 requestType:(unint64_t)a6 additionalChangeTags:(id)a7 requestCacheKey:(id)a8 cachePolicy:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RCRequestInfo *v21;
  uint64_t v22;
  NSString *requestKey;
  uint64_t v24;
  NSString *responseKey;
  uint64_t v26;
  NSURL *fallbackURL;
  uint64_t v28;
  NSArray *additionalChangeTags;
  uint64_t v30;
  NSMutableDictionary *mutableAdditionalFields;
  uint64_t v32;
  NSString *requestCacheKey;
  uint64_t v34;
  RCCachePolicy *cachePolicy;
  objc_super v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:].cold.2();
    if (v16)
      goto LABEL_6;
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[RCRequestInfo initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:].cold.1();
LABEL_6:
  v37.receiver = self;
  v37.super_class = (Class)RCRequestInfo;
  v21 = -[RCRequestInfo init](&v37, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    requestKey = v21->_requestKey;
    v21->_requestKey = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    responseKey = v21->_responseKey;
    v21->_responseKey = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    fallbackURL = v21->_fallbackURL;
    v21->_fallbackURL = (NSURL *)v26;

    v21->_requestType = a6;
    v28 = objc_msgSend(v18, "copy");
    additionalChangeTags = v21->_additionalChangeTags;
    v21->_additionalChangeTags = (NSArray *)v28;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = objc_claimAutoreleasedReturnValue();
    mutableAdditionalFields = v21->_mutableAdditionalFields;
    v21->_mutableAdditionalFields = (NSMutableDictionary *)v30;

    v32 = objc_msgSend(v19, "copy");
    requestCacheKey = v21->_requestCacheKey;
    v21->_requestCacheKey = (NSString *)v32;

    v34 = objc_msgSend(v20, "copy");
    cachePolicy = v21->_cachePolicy;
    v21->_cachePolicy = (RCCachePolicy *)v34;

  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAdditionalFields, 0);
  objc_storeStrong((id *)&self->_cachePolicy, 0);
  objc_storeStrong((id *)&self->_requestCacheKey, 0);
  objc_storeStrong((id *)&self->_additionalChangeTags, 0);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_responseKey, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[RCRequestInfo requestKey](self, "requestKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      -[RCRequestInfo responseKey](self, "responseKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "responseKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        -[RCRequestInfo fallbackURL](self, "fallbackURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fallbackURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11)
          && (v12 = -[RCRequestInfo requestType](self, "requestType"), v12 == objc_msgSend(v5, "requestType")))
        {
          v28 = (void *)MEMORY[0x1E0DE7910];
          -[RCRequestInfo additionalChangeTags](self, "additionalChangeTags");
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "additionalChangeTags");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = v28;
          v27 = (void *)v14;
          v29 = (void *)v13;
          if (objc_msgSend(v15, "rc_object:isEqualToObject:", v13))
          {
            -[RCRequestInfo requestCacheKey](self, "requestCacheKey");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "requestCacheKey");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)v16;
            if ((void *)v16 == v17)
            {
              v25 = v17;
              -[RCRequestInfo mutableAdditionalFields](self, "mutableAdditionalFields");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "mutableAdditionalFields");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v19, "isEqualToDictionary:"))
              {
                -[RCRequestInfo cachePolicy](self, "cachePolicy");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "cachePolicy");
                v23 = v19;
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v22, "isEqual:", v20);

                v19 = v23;
              }
              else
              {
                v18 = 0;
              }

              v17 = v25;
            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;

  -[RCRequestInfo requestKey](self, "requestKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RCRequestInfo responseKey](self, "responseKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[RCRequestInfo fallbackURL](self, "fallbackURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RCRequestInfo requestType](self, "requestType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[RCRequestInfo additionalChangeTags](self, "additionalChangeTags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ objc_msgSend(v11, "hash");
  -[RCRequestInfo requestCacheKey](self, "requestCacheKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[RCRequestInfo mutableAdditionalFields](self, "mutableAdditionalFields");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash") ^ v10;
  -[RCRequestInfo cachePolicy](self, "cachePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (void)setValue:(id)a3 forAdditionalField:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[RCRequestInfo mutableAdditionalFields](self, "mutableAdditionalFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (void)initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestCacheKey:cachePolicy:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
