@implementation SSBag

+ (SSBag)bagWithProfileConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0CFDBA0]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v4, "bagKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v4, "bagKeyForStringRepresentation:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = objc_msgSend(a1, "_AMSBagValueTypeFromSSBagValueType:", objc_msgSend(v10, "valueType"));
          objc_msgSend(v11, "defaultValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addBagKey:valueType:defaultValue:", v9, v12, v13);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  v14 = (void *)MEMORY[0x1E0CFD9F0];
  objc_msgSend(v4, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerBagKeySet:forProfile:profileVersion:", v29, v15, v16);

  v17 = a1;
  objc_sync_enter(v17);
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%@:%@"), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "cache");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v24 = objc_alloc((Class)v17);
    objc_msgSend(v4, "profile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profileVersion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v24, "_initWithProfile:profileVersion:", v25, v26);

    objc_msgSend(v17, "cache");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v23, v21);

  }
  objc_sync_exit(v17);

  return (SSBag *)v23;
}

- (id)_initWithProfile:(id)a3 profileVersion:(id)a4
{
  id v7;
  id v8;
  SSBag *v9;
  id *p_isa;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SSBag;
  v9 = -[SSBag init](&v15, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CFD7C0];
    objc_msgSend(p_isa, "_AMSBag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", p_isa, sel__bagChanged_, v12, v13);

  }
  return p_isa;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SSBag;
  -[SSBag dealloc](&v4, sel_dealloc);
}

+ (NSMutableDictionary)cache
{
  if (cache_ss_once_token___COUNTER__ != -1)
    dispatch_once(&cache_ss_once_token___COUNTER__, &__block_literal_global_9);
  return (NSMutableDictionary *)(id)cache_ss_once_object___COUNTER__;
}

void __14__SSBag_cache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)cache_ss_once_object___COUNTER__;
  cache_ss_once_object___COUNTER__ = (uint64_t)v0;

}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;

  -[SSBag _AMSBag](self, "_AMSBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isExpired
{
  void *v2;
  char v3;

  -[SSBag _AMSBag](self, "_AMSBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpired");

  return v3;
}

- (SSBagProfileConfig)profileConfig
{
  SSMutableBagProfileConfig *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(SSMutableBagProfileConfig);
  -[SSBag _AMSBag](self, "_AMSBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBagProfileConfig setProfile:](v3, "setProfile:", v5);

  -[SSBag _AMSBag](self, "_AMSBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBagProfileConfig setProfileVersion:](v3, "setProfileVersion:", v7);

  v8 = (void *)-[SSMutableBagProfileConfig copy](v3, "copy");
  return (SSBagProfileConfig *)v8;
}

- (id)resetCaches
{
  return +[SSBinaryPromise promiseWithSuccess](SSBinaryPromise, "promiseWithSuccess");
}

- (BOOL)URLIsTrusted:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  SSPromise *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  int v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("data"));

  if ((v6 & 1) != 0)
  {
    LOBYTE(v7) = 1;
    goto LABEL_35;
  }
  objc_msgSend(v4, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(SSPromise);
  -[SSPromise completionHandlerAdapter](v9, "completionHandlerAdapter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag arrayForKey:withCompletion:](self, "arrayForKey:withCompletion:", CFSTR("trustedDomains"), v10);

  v38 = 0;
  -[SSPromise resultWithError:](v9, "resultWithError:", &v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v38;
  if (v12)
  {
    +[SSLogConfig sharedBagCacheConfig](SSLogConfig, "sharedBagCacheConfig");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      v17 = v15;
    else
      v17 = v15 & 2;
    if (!v17)
      goto LABEL_15;
    v33 = v11;
    v18 = (void *)objc_opt_class();
    v40 = 138543618;
    v41 = v18;
    v42 = 2114;
    v43 = v12;
    v19 = v18;
    LODWORD(v32) = 22;
    v7 = (void *)_os_log_send_and_compose_impl();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v40, v32);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog(v13, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      v11 = v33;
LABEL_15:

LABEL_30:
      LOBYTE(v7) = 0;
      goto LABEL_33;
    }
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v11;
    v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (!v26)
      goto LABEL_30;
    v27 = v26;
    v33 = v11;
    v28 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v13);
        v30 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v30, "length"))
        {
          if (objc_msgSend(v30, "hasPrefix:", CFSTR(".")))
          {
            if ((objc_msgSend(v8, "hasSuffix:", v30) & 1) != 0)
              goto LABEL_31;
          }
          else if (!objc_msgSend(v8, "caseInsensitiveCompare:", v30))
          {
LABEL_31:
            LOBYTE(v7) = 1;
            goto LABEL_32;
          }
        }
      }
      v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v27)
        continue;
      break;
    }
    LOBYTE(v7) = 0;
  }
LABEL_32:
  v11 = v33;
LABEL_33:

  if (v12)
    LOBYTE(v7) = 0;
LABEL_35:

  return (char)v7;
}

- (void)arrayForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__SSBag_arrayForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB778;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __36__SSBag_arrayForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)BOOLForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "BOOLForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__SSBag_BOOLForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB7A0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __35__SSBag_BOOLForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)dictionaryForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__SSBag_dictionaryForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB7C8;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __41__SSBag_dictionaryForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)doubleForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__SSBag_doubleForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB7A0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __37__SSBag_doubleForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)integerForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "integerForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__SSBag_integerForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB7A0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __38__SSBag_integerForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)stringForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__SSBag_stringForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB7F0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __37__SSBag_stringForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)URLForKey:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[SSBag _AMSBag](self, "_AMSBag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__SSBag_URLForKey_withCompletion___block_invoke;
  v11[3] = &unk_1E47BB818;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "valueWithCompletion:", v11);

}

uint64_t __34__SSBag_URLForKey_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SSBag _AMSBag](self, "_AMSBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)arrayPromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag arrayForKey:withCompletion:](self, "arrayForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)BOOLPromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag BOOLForKey:withCompletion:](self, "BOOLForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)dictionaryPromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag dictionaryForKey:withCompletion:](self, "dictionaryForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)doublePromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag doubleForKey:withCompletion:](self, "doubleForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)integerPromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag integerForKey:withCompletion:](self, "integerForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)stringPromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag stringForKey:withCompletion:](self, "stringForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)URLPromiseForKey:(id)a3
{
  id v4;
  SSPromise *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSPromise);
  -[SSPromise nilValueCompletionHandlerAdapter](v5, "nilValueCompletionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag URLForKey:withCompletion:](self, "URLForKey:withCompletion:", v4, v6);

  return v5;
}

- (id)arrayForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag arrayPromiseForKey:](self, "arrayPromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (id)BOOLForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag BOOLPromiseForKey:](self, "BOOLPromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (id)dictionaryForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag dictionaryPromiseForKey:](self, "dictionaryPromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (id)doubleForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag doublePromiseForKey:](self, "doublePromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (id)integerForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag integerPromiseForKey:](self, "integerPromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag stringPromiseForKey:](self, "stringPromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (id)URLForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SSBag URLPromiseForKey:](self, "URLPromiseForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v8))
      v9 = 0;
    else
      v9 = v6;
    v10 = v9;

  }
  return v10;
}

- (BOOL)canHandleTrustedDomains
{
  SSPromise *v3;
  SSPromise *v4;
  void *v5;
  id v6;
  BOOL v7;
  id v9;
  _QWORD v10[4];
  SSPromise *v11;

  v3 = objc_alloc_init(SSPromise);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__SSBag_canHandleTrustedDomains__block_invoke;
  v10[3] = &unk_1E47BB840;
  v4 = v3;
  v11 = v4;
  -[SSBag arrayForKey:withCompletion:](self, "arrayForKey:withCompletion:", CFSTR("trustedDomains"), v10);
  v9 = 0;
  -[SSPromise resultWithError:](v4, "resultWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v6)
    v7 = 0;
  else
    v7 = objc_msgSend(v5, "count") != 0;

  return v7;
}

uint64_t __32__SSBag_canHandleTrustedDomains__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "finishWithError:");
  if (a2)
    v5 = a2;
  else
    v5 = MEMORY[0x1E0C9AA60];
  return objc_msgSend(v3, "finishWithResult:", v5);
}

- (id)_AMSBag
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CFD9E8];
  -[SSBag profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSBag profileVersion](self, "profileVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bagForProfile:profileVersion:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)_AMSBagValueTypeFromSSBagValueType:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return qword_1A27A0DB0[a3 - 1];
}

- (void)_bagChanged:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SSBagChangedNotification"), self);

}

- (NSString)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (NSString)profileVersion
{
  return self->_profileVersion;
}

- (void)setProfileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_profileVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileVersion, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
