@implementation _TUIFeedCaptureDynamicStateProvider

+ (id)imageResourceProviderWithURL:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  _TUIFeedCaptureInstanceKey *v35;
  TUIDynamicValue *v36;
  id v37;
  void *v39;
  void *v40;
  objc_class *v41;
  id v42;
  id obj;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("json"));

  if (v6)
  {
    v41 = (objc_class *)a1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));

    v9 = objc_opt_class(NSDictionary, v8);
    v42 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v10, 0, 0));
    v12 = TUIDynamicCast(v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v15 = objc_opt_class(NSArray, v14);
    v39 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("instances")));
    v17 = TUIDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v44 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v18, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v46;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v23);
          v25 = objc_opt_class(NSDictionary, v20);
          v26 = TUIDynamicCast(v25, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("instance")));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("parameters")));
          v31 = objc_opt_class(NSDictionary, v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("value")));
          v33 = TUIDynamicCast(v31, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

          if (v28)
          {
            v35 = -[_TUIFeedCaptureInstanceKey initWithInstance:options:]([_TUIFeedCaptureInstanceKey alloc], "initWithInstance:options:", v28, v29);
            v36 = -[TUIDynamicValue initWithValue:]([TUIDynamicValue alloc], "initWithValue:", v34);
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v36, v35);

          }
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v21);
    }

    v37 = objc_msgSend([v41 alloc], "initWithKind:instancesMap:", v40, v44);
    v4 = v42;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (_TUIFeedCaptureDynamicStateProvider)initWithKind:(id)a3 instancesMap:(id)a4
{
  id v7;
  id v8;
  _TUIFeedCaptureDynamicStateProvider *v9;
  _TUIFeedCaptureDynamicStateProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIFeedCaptureDynamicStateProvider;
  v9 = -[_TUIFeedCaptureDynamicStateProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_kind, a3);
    objc_storeStrong((id *)&v10->_instanceMap, a4);
  }

  return v10;
}

- (id)dynamicStateForKind:(id)a3 instance:(id)a4 parameters:(id)a5
{
  id v8;
  id v9;
  NSDictionary *instanceMap;
  _TUIFeedCaptureInstanceKey *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(a3, "isEqualToString:", self->_kind))
  {
    instanceMap = self->_instanceMap;
    v11 = -[_TUIFeedCaptureInstanceKey initWithInstance:options:]([_TUIFeedCaptureInstanceKey alloc], "initWithInstance:options:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](instanceMap, "objectForKeyedSubscript:", v11));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSDictionary)instanceMap
{
  return self->_instanceMap;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_instanceMap, 0);
}

@end
