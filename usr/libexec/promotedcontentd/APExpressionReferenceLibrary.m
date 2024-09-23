@implementation APExpressionReferenceLibrary

- (APExpressionReferenceLibrary)initWithStorage:(id)a3
{
  id v5;
  APExpressionReferenceLibrary *v6;
  APUnfairRecursiveLock *v7;
  APUnfairRecursiveLock *lock;
  uint64_t v9;
  NSMutableDictionary *referenceCache;
  uint64_t v11;
  NSMutableDictionary *unsavedReferences;
  APExpressionReferenceLibrary *v13;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)APExpressionReferenceLibrary;
  v6 = -[APExpressionReferenceLibrary init](&v18, "init");
  if (!v6)
    goto LABEL_5;
  v7 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
  lock = v6->_lock;
  v6->_lock = v7;

  v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  referenceCache = v6->_referenceCache;
  v6->_referenceCache = (NSMutableDictionary *)v9;

  v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  unsavedReferences = v6->_unsavedReferences;
  v6->_unsavedReferences = (NSMutableDictionary *)v11;

  if ((objc_opt_respondsToSelector(v5, "initialize") & 1) == 0
    || (objc_msgSend(v5, "initialize") & 1) != 0)
  {
    objc_storeStrong((id *)&v6->_storage, a3);
LABEL_5:
    v13 = v6;
    goto LABEL_6;
  }
  v15 = APLogForCategory(46);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to initialize expression library data store. Aborting.", v17, 2u);
  }

  if ((objc_opt_respondsToSelector(v5, "finalize") & 1) != 0)
    objc_msgSend(v5, "finalize");
  v13 = 0;
LABEL_6:

  return v13;
}

- (void)_persistNewReferences
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v3, "lock");

  v4 = -[APExpressionReferenceLibrary updateCount](self, "updateCount");
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
    if ((unint64_t)objc_msgSend(v3, "count") < 0x65)
      goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
  if (!v5)
  {

    if (!v4)
      goto LABEL_12;
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
  v8 = objc_msgSend(v6, "persist:", v7);

  if (v4)
  {

    if ((v8 & 1) == 0)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v8)
  {
LABEL_10:
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
    objc_msgSend(v3, "removeAllObjects");
LABEL_11:

  }
LABEL_12:
  v9 = (id)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v9, "unlock");

}

- (id)_createNodeFromDictionary:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  APTargetingExpressionNode *v10;
  void *v11;
  void *v12;
  void *v13;
  APDataSourceNode *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("expression")));

  if (v9)
  {
    v10 = [APTargetingExpressionNode alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("expression")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("subexpressions")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("data")));
    v14 = -[APTargetingExpressionNode initWithParent:identifier:expressionOrReference:subExpressions:data:error:](v10, "initWithParent:identifier:expressionOrReference:subExpressions:data:error:", 0, v8, v11, v12, v13, a5);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("adaptor")));

    if (v15)
    {
      v14 = -[APDataSourceNode initWithParent:identifier:dataSource:error:]([APDataSourceNode alloc], "initWithParent:identifier:dataSource:error:", 0, v8, v7, a5);
    }
    else
    {
      v16 = APLogForCategory(6);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Value does not represent a targeting expression or data adaptor: %{public}@", (uint8_t *)&v19, 0xCu);
      }

      v14 = 0;
    }
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  APExpressionStorageProtocol *storage;
  objc_super v9;

  -[APExpressionReferenceLibrary _persistNewReferences](self, "_persistNewReferences");
  -[APUnfairRecursiveLock lock](self->_lock, "lock");
  v3 = objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
    v6 = objc_opt_respondsToSelector(v5, "finalize");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
      objc_msgSend(v7, "finalize");

    }
  }
  storage = self->_storage;
  self->_storage = 0;

  -[APUnfairRecursiveLock unlock](self->_lock, "unlock");
  v9.receiver = self;
  v9.super_class = (Class)APExpressionReferenceLibrary;
  -[APExpressionReferenceLibrary dealloc](&v9, "dealloc");
}

- (void)beginUpdate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v3, "lock");

  -[APExpressionReferenceLibrary setUpdateCount:](self, "setUpdateCount:", (char *)-[APExpressionReferenceLibrary updateCount](self, "updateCount") + 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v4, "unlock");

}

- (void)endUpdate
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v3, "lock");

  if (-[APExpressionReferenceLibrary updateCount](self, "updateCount"))
    -[APExpressionReferenceLibrary setUpdateCount:](self, "setUpdateCount:", (char *)-[APExpressionReferenceLibrary updateCount](self, "updateCount") - 1);
  -[APExpressionReferenceLibrary _persistNewReferences](self, "_persistNewReferences");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v4, "unlock");

}

- (id)referenceFromIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  NSErrorUserInfoKey v28;
  void *v29;
  NSErrorUserInfoKey v30;
  void *v31;
  uint8_t buf[4];
  void *v33;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v7, "lock");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary referenceCache](self, "referenceCache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v6));

    if (v11
      || (v12 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "find:", v6)),
          v12,
          v11))
    {
      v13 = objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary _createNodeFromDictionary:identifier:error:](self, "_createNodeFromDictionary:identifier:error:", v11, v6, a4));
      if (v13)
      {
        v9 = (void *)v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary referenceCache](self, "referenceCache"));
        objc_msgSend(v14, "setObject:forKey:", v9, v6);

      }
      else
      {
        if (a4)
          v15 = (const __CFString *)*a4;
        else
          v15 = CFSTR("(unavailable)");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error creating node %@: %@"), v6, v15));
        v17 = APLogForCategory(46);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v33 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v19, "unlock");

  if (a4 && !v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reference '%@' not registered."), v6));
    v30 = NSLocalizedDescriptionKey;
    v31 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1128, v21));

  }
  if ((objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___APExpressionEvaluationProtocol) & 1) != 0)
  {
    v22 = v9;
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reference %@ does not conform to APExpressionEvaluationProtocol"), v6));
    v24 = APLogForCategory(46);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    if (a4)
    {
      v28 = NSLocalizedDescriptionKey;
      v29 = v23;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1121, v26));

    }
    v22 = 0;
  }

  return v22;
}

- (id)_validateAndAddReference:(id)a3 reference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  NSErrorUserInfoKey v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v8, "lock");

  v9 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
    objc_msgSend(v10, "setObject:forKey:", v7, v6);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
    objc_msgSend(v11, "unlock");

    v12 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
    objc_msgSend(v13, "unlock");

    v14 = (objc_class *)objc_opt_class(v7);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Object must be dictionary type (%@)"), v16));

    v20 = NSLocalizedDescriptionKey;
    v21 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v18));

  }
  return v12;
}

- (id)addReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  NSErrorUserInfoKey v32;
  void *v33;
  NSErrorUserInfoKey v34;
  void *v35;
  NSErrorUserInfoKey v36;
  void *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v31 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 4, &v31));
    v8 = v31;
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v13 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
      {
        v14 = v7;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

        v17 = objc_opt_class(NSString);
        v30 = v14;
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allValues"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

          v20 = objc_opt_class(NSDictionary);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
          {
            v10 = (id)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary _validateAndAddReference:reference:](self, "_validateAndAddReference:reference:", v16, v19));
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reference '%@' must be dictionary type."), v16, v30));
            v32 = NSLocalizedDescriptionKey;
            v33 = v27;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
            v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v28));

          }
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Identifier '%@' must be string type."), v16, v14));
          v34 = NSLocalizedDescriptionKey;
          v35 = v19;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
          v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v26));

        }
      }
      else
      {
        v21 = (objc_class *)objc_opt_class(v7);
        v22 = NSStringFromClass(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reference is an invalid JSON object type '%@'"), v23));

        v36 = NSLocalizedDescriptionKey;
        v37 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
        v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1112, v25));

      }
    }

  }
  else
  {
    v38 = NSLocalizedDescriptionKey;
    v39 = CFSTR("Reference is nil or empty.");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.targetingexpressions"), -1122, v11));

    v9 = v12;
    v10 = v9;
  }

  return v10;
}

- (id)addReferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary addReference:](self, "addReference:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), (_QWORD)v15));
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v13, "unlock");

  return v6;
}

- (void)removeReferences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary referenceCache](self, "referenceCache", (_QWORD)v17));
        objc_msgSend(v12, "removeObjectForKey:", v11);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
        objc_msgSend(v13, "removeObjectForKey:", v11);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
          objc_msgSend(v15, "remove:", v11);

        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v16, "unlock");

}

- (unint64_t)referenceCount
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
  if ((objc_opt_respondsToSelector(v4, "recordCount") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary storage](self, "storage"));
    v6 = (char *)objc_msgSend(v5, "recordCount");

  }
  else
  {
    v6 = 0;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary unsavedReferences](self, "unsavedReferences"));
  v8 = &v6[(_QWORD)objc_msgSend(v7, "count")];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APExpressionReferenceLibrary lock](self, "lock"));
  objc_msgSend(v9, "unlock");

  return (unint64_t)v8;
}

- (NSMutableDictionary)referenceCache
{
  return self->_referenceCache;
}

- (void)setReferenceCache:(id)a3
{
  objc_storeStrong((id *)&self->_referenceCache, a3);
}

- (NSMutableDictionary)unsavedReferences
{
  return self->_unsavedReferences;
}

- (void)setUnsavedReferences:(id)a3
{
  objc_storeStrong((id *)&self->_unsavedReferences, a3);
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (unint64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unint64_t)a3
{
  self->_updateCount = a3;
}

- (APExpressionStorageProtocol)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_unsavedReferences, 0);
  objc_storeStrong((id *)&self->_referenceCache, 0);
}

@end
