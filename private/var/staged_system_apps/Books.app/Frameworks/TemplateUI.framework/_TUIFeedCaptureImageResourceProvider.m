@implementation _TUIFeedCaptureImageResourceProvider

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
  _TUIFeedCaptureInstanceKey *v30;
  _TUIFeedCaptureImageResourceInstance *v31;
  id v32;
  void *v34;
  void *v35;
  objc_class *v36;
  id v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("json"));

  if (v6)
  {
    v36 = (objc_class *)a1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingPathExtension"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));

    v9 = objc_opt_class(NSDictionary, v8);
    v37 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v10, 0, 0));
    v12 = TUIDynamicCast(v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v15 = objc_opt_class(NSArray, v14);
    v34 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("instances")));
    v17 = TUIDynamicCast(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v39 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v18, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v18;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v41;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v23);
          v25 = objc_opt_class(NSDictionary, v20);
          v26 = TUIDynamicCast(v25, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("instance")));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("options")));
          if (v28)
          {
            v30 = -[_TUIFeedCaptureInstanceKey initWithInstance:options:]([_TUIFeedCaptureInstanceKey alloc], "initWithInstance:options:", v28, v29);
            v31 = -[_TUIFeedCaptureImageResourceInstance initWithDictionary:]([_TUIFeedCaptureImageResourceInstance alloc], "initWithDictionary:", v27);
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v31, v30);

          }
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v21);
    }

    v32 = objc_msgSend([v36 alloc], "initWithKind:instancesMap:", v35, v39);
    v4 = v37;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (_TUIFeedCaptureImageResourceProvider)initWithKind:(id)a3 instancesMap:(id)a4
{
  id v7;
  id v8;
  _TUIFeedCaptureImageResourceProvider *v9;
  _TUIFeedCaptureImageResourceProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIFeedCaptureImageResourceProvider;
  v9 = -[_TUIFeedCaptureImageResourceProvider init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_kind, a3);
    objc_storeStrong((id *)&v10->_instancesMap, a4);
  }

  return v10;
}

- (id)imageResourceForNaturalSize:(CGSize)a3 contentsScale:(double)a4 instance:(id)a5 options:(id)a6
{
  id v8;
  id v9;
  _TUIFeedCaptureInstanceKey *v10;
  void *v11;

  v8 = a6;
  v9 = a5;
  v10 = -[_TUIFeedCaptureInstanceKey initWithInstance:options:]([_TUIFeedCaptureInstanceKey alloc], "initWithInstance:options:", v9, v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_instancesMap, "objectForKeyedSubscript:", v10));
  return v11;
}

- (id)intrinsicImageResourceForInstance:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  _TUIFeedCaptureInstanceKey *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_TUIFeedCaptureInstanceKey initWithInstance:options:]([_TUIFeedCaptureInstanceKey alloc], "initWithInstance:options:", v7, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_instancesMap, "objectForKeyedSubscript:", v8));
  return v9;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSDictionary)instancesMap
{
  return self->_instancesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instancesMap, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
