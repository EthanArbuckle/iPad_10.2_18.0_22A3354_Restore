@implementation ICAMSBagAdapter

- (void)_didFinishLoadingBag:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSMutableArray *pendingBagValuePromises;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_urlBag, a3);
  objc_storeStrong((id *)&self->_urlBagLoadingError, a4);
  v9 = (void *)-[NSMutableArray copy](self->_pendingBagValuePromises, "copy");
  pendingBagValuePromises = self->_pendingBagValuePromises;
  self->_pendingBagValuePromises = 0;

  os_unfair_lock_unlock(&self->_lock);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v16 = (void *)objc_opt_class();
        objc_msgSend(v15, "bagKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "bagValueType");
        v22 = 0;
        objc_msgSend(v16, "_valueForBagKey:valueType:fromURLBag:urlBagLoadingError:valueRetrievingError:", v17, v18, v7, v8, &v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v22;

        if (v20)
          objc_msgSend(v15, "finishWithError:", v20);
        else
          objc_msgSend(v15, "finishWithResult:", v19);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

}

- (id)_bagValueForKey:(id)a3 valueType:(unint64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  ICURLBag *urlBag;
  NSError *urlBagLoadingError;
  void *v11;
  ICAMSBagValuePromise *v12;
  void *v13;
  NSMutableArray *v15;
  NSMutableArray *pendingBagValuePromises;
  void *v17;
  ICStoreRequestContext *requestContext;
  _QWORD v19[5];
  id v20;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (*(_OWORD *)&self->_urlBag == 0)
  {
    if (!self->_pendingBagValuePromises)
    {
      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      pendingBagValuePromises = self->_pendingBagValuePromises;
      self->_pendingBagValuePromises = v15;

    }
    v12 = -[ICAMSBagValuePromise initWithBagKey:bagValueType:]([ICAMSBagValuePromise alloc], "initWithBagKey:bagValueType:", v6, a4);
    -[NSMutableArray addObject:](self->_pendingBagValuePromises, "addObject:", v12);
    if (-[NSMutableArray count](self->_pendingBagValuePromises, "count") == 1)
    {
      +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      requestContext = self->_requestContext;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __45__ICAMSBagAdapter__bagValueForKey_valueType___block_invoke;
      v19[3] = &unk_1E4391658;
      v19[4] = self;
      objc_msgSend(v17, "getBagForRequestContext:withCompletionHandler:", requestContext, v19);

    }
    objc_msgSend(MEMORY[0x1E0CFD9F8], "bagValueWithKey:valueType:valuePromise:", v6, a4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)objc_opt_class();
    urlBag = self->_urlBag;
    urlBagLoadingError = self->_urlBagLoadingError;
    v20 = 0;
    objc_msgSend(v8, "_valueForBagKey:valueType:fromURLBag:urlBagLoadingError:valueRetrievingError:", v6, a4, urlBag, urlBagLoadingError, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (ICAMSBagValuePromise *)v20;
    if (v12)
      objc_msgSend(MEMORY[0x1E0CFD9F8], "failingBagValueWithKey:valueType:error:", v6, a4, v12);
    else
      objc_msgSend(MEMORY[0x1E0CFD9F8], "frozenBagValueWithKey:value:valueType:", v6, v11, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);

  return v13;
}

+ (id)_valueForBagKey:(id)a3 valueType:(unint64_t)a4 fromURLBag:(id)a5 urlBagLoadingError:(id)a6 valueRetrievingError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v13)
  {
    if (v14)
    {
      v23 = v14;
      goto LABEL_9;
    }
    v17 = 0;
    goto LABEL_13;
  }
  objc_msgSend(a1, "_valueFromICURLBag:forKeyPath:valueType:", v13, v12, a4);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No value for bag key '%@'"), v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v22 = -7201;
    goto LABEL_8;
  }
  v17 = (void *)v16;
  if ((objc_msgSend(a1, "_value:matchesExpectedType:", v16, a4) & 1) != 0)
  {
LABEL_13:
    v23 = 0;
    if (!a7)
      goto LABEL_11;
    goto LABEL_10;
  }

  v18 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0CB2938];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("value for bag key '%@' is unexpected type '%@'"), v12, objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  v22 = -7202;
LABEL_8:
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("ICError"), v22, v20);
  v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  v17 = 0;
  if (a7)
LABEL_10:
    *a7 = objc_retainAutorelease(v23);
LABEL_11:

  return v17;
}

+ (id)_valueFromICURLBag:(id)a3 forKeyPath:(id)a4 valueType:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v14 = 0;
    goto LABEL_30;
  }
  v12 = (void *)v11;
  if (objc_msgSend(v10, "count") == 1)
  {
    switch(a5)
    {
      case 0uLL:
        objc_msgSend(v8, "arrayForBagKey:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 1uLL:
      case 2uLL:
      case 3uLL:
        objc_msgSend(v8, "numberForBagKey:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 4uLL:
        objc_msgSend(v8, "stringForBagKey:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      case 5uLL:
        objc_msgSend(v8, "urlForBagKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      case 6uLL:
        objc_msgSend(v8, "dictionaryForBagKey:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_28:
        v16 = (void *)v13;
        break;
      default:
        v16 = 0;
        break;
    }
    goto LABEL_29;
  }
  objc_msgSend(v8, "dictionaryForBagKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v16 = 0;
    goto LABEL_18;
  }
  v24 = a1;
  v16 = 0;
  v17 = 1;
  while (1)
  {
    v18 = v12;
    v19 = v15;
    objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != objc_msgSend(v10, "count") - 1)
      break;
    v20 = v15;

    v16 = v20;
LABEL_12:
    if (++v17 >= (unint64_t)objc_msgSend(v10, "count"))
      goto LABEL_18;
  }
  if (v15 && (_NSIsNSDictionary() & 1) != 0)
    goto LABEL_12;
  v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v24;
    v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Encountered missing bag value at key path %{public}@", buf, 0x16u);
  }

LABEL_18:
LABEL_19:
  if (a5 == 5 && v16 && _NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
    v22 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v22;
  }
LABEL_29:
  v14 = v16;

LABEL_30:
  return v14;
}

+ (BOOL)_value:(id)a3 matchesExpectedType:(unint64_t)a4
{
  id v5;
  char isKindOfClass;
  char v7;

  v5 = a3;
  switch(a4)
  {
    case 0uLL:
      isKindOfClass = _NSIsNSArray();
      goto LABEL_8;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      isKindOfClass = _NSIsNSNumber();
      goto LABEL_8;
    case 4uLL:
      isKindOfClass = _NSIsNSString();
      goto LABEL_8;
    case 5uLL:
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_8;
    case 6uLL:
      isKindOfClass = _NSIsNSDictionary();
LABEL_8:
      v7 = isKindOfClass;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7 & 1;
}

- (id)doubleForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 2);
}

- (id)integerForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 3);
}

- (id)BOOLForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 1);
}

- (id)arrayForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 0);
}

uint64_t __45__ICAMSBagAdapter__bagValueForKey_valueType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didFinishLoadingBag:error:", a2, a3);
}

- (ICAMSBagAdapter)initWithRequestContext:(id)a3
{
  id v5;
  ICAMSBagAdapter *v6;
  ICAMSBagAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAMSBagAdapter;
  v6 = -[ICAMSBagAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_requestContext, a3);
  }

  return v7;
}

- (BOOL)isExpired
{
  os_unfair_lock_s *p_lock;
  ICURLBag *urlBag;
  BOOL v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urlBag = self->_urlBag;
  if (urlBag)
    v5 = -[ICURLBag isExpired](urlBag, "isExpired");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSDate)expirationDate
{
  os_unfair_lock_s *p_lock;
  ICURLBag *urlBag;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urlBag = self->_urlBag;
  if (urlBag)
  {
    -[ICURLBag expirationDate](urlBag, "expirationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v5;
}

- (NSString)profile
{
  void *v2;
  void *v3;

  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bagProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  void *v2;
  void *v3;

  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bagProfileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)dictionaryForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 6);
}

- (id)stringForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 4);
}

- (id)URLForKey:(id)a3
{
  return -[ICAMSBagAdapter _bagValueForKey:valueType:](self, "_bagValueForKey:valueType:", a3, 5);
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ICStoreRequestContext *requestContext;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke;
  v13[3] = &unk_1E4390EF8;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v7 = MEMORY[0x1A1AFA8D0](v13);
  v8 = (void *)v7;
  if (*(_OWORD *)&self->_urlBag == 0)
  {
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    requestContext = self->_requestContext;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_3;
    v11[3] = &unk_1E438D3F8;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v9, "getBagForRequestContext:withCompletionHandler:", requestContext, v11);

  }
  else
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }

}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_urlBagLoadingError, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_pendingBagValuePromises, 0);
}

void __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_2;
    v2[3] = &unk_1E438B680;
    v3 = *(id *)(a1 + 40);
    objc_msgSend(v1, "createAMSSnapshotBagWithCompletion:", v2);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_didFinishLoadingBag:error:", a2, a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__ICAMSBagAdapter_createSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
