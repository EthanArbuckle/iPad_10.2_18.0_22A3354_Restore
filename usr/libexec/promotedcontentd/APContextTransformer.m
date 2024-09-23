@implementation APContextTransformer

- (APContextTransformer)initWithContext:(id)a3 contentIdentifier:(id)a4 placementType:(int64_t)a5
{
  id v9;
  id v10;
  APContextTransformer *v11;
  APContextTransformer *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *bodyContext;
  NSMutableDictionary *v15;
  NSMutableDictionary *headerContext;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)APContextTransformer;
  v11 = -[APContextTransformer init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contentIdentifier, a4);
    objc_storeStrong((id *)&v12->_originalContext, a3);
    v12->_placementType = a5;
    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
    bodyContext = v12->_bodyContext;
    v12->_bodyContext = v13;

    v15 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
    headerContext = v12->_headerContext;
    v12->_headerContext = v15;

  }
  return v12;
}

- (id)transformedContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  APContextTransformer *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer originalContext](self, "originalContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementalContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer bodyContext](self, "bodyContext"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer headerContext](self, "headerContext"));
  v31 = self;
  v32 = v3;
  if (!-[APContextTransformer placementType](self, "placementType")
    || (id)-[APContextTransformer placementType](self, "placementType") == (id)4)
  {
    if (qword_100269840 != -1)
      dispatch_once(&qword_100269840, &stru_100214B40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", qword_100269838));

    if (!v6)
    {
      v7 = objc_msgSend(v4, "mutableCopy");
      if (-[APContextTransformer placementType](self, "placementType"))
        v8 = CFSTR("NATIVE");
      else
        v8 = CFSTR("ANY");
      objc_msgSend(v7, "setObject:forKey:", v8, qword_100269838);
      v9 = objc_msgSend(v7, "copy");

      v4 = v9;
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v16 = objc_autoreleasePoolPush();
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(".")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("body"));

        v20 = v5;
        if ((v19 & 1) != 0
          || (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject")),
              v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("header")),
              v21,
              v20 = v33,
              v22))
        {
          objc_msgSend(v20, "_addProperty:fromSupplementalContext:", v15, v10);
        }

        objc_autoreleasePoolPop(v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  objc_msgSend(v33, "setObject:forKey:", v23, CFSTR("onboard_status"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer contentIdentifier](v31, "contentIdentifier"));
  objc_msgSend(v5, "setValue:forKey:", v24, CFSTR("adOpId"));

  -[APContextTransformer _addCurrentArticleContext](v31, "_addCurrentArticleContext");
  -[APContextTransformer _addAdjacentContext](v31, "_addAdjacentContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "requestedAdIdentifier"));

  if (v25)
  {
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("feedMetadata")));
    if (!v26)
      v26 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "requestedAdIdentifier"));
    objc_msgSend(v26, "setValue:forKey:", v27, CFSTR("customTargetingId"));

    objc_msgSend(v5, "setValue:forKey:", v26, CFSTR("feedMetadata"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "requestedAdIdentifier"));
    objc_msgSend(v5, "setValue:forKey:", v28, CFSTR("customTargetingId"));

  }
  v29 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v5, CFSTR("body"), v33, CFSTR("header"), 0);

  return v29;
}

- (int64_t)placementType
{
  return self->_placementType;
}

- (NSMutableDictionary)headerContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)_addCurrentArticleContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[APContextTransformer originalContext](self, "originalContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer bodyContext](self, "bodyContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("currentArticle")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "current"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "categories"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "current"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keywords"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "current"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "language"));

  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("categories"));
  objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("keywords"));
  objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("sourceContentLanguage"));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("currentArticle"));

}

- (APContext)originalContext
{
  return (APContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)_addAdjacentContext
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer originalContext](self, "originalContext"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adjacent", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = objc_autoreleasePoolPush();
        -[APContextTransformer _addContext:](self, "_addContext:", v9);
        objc_autoreleasePoolPop(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerContext, 0);
  objc_storeStrong((id *)&self->_bodyContext, 0);
  objc_storeStrong((id *)&self->_originalContext, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

- (void)_addContext:(id)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;

  v22 = a3;
  if (objc_msgSend(v22, "adjacency") == (id)151)
  {
    v4 = CFSTR("nextArticle");
  }
  else if (objc_msgSend(v22, "adjacency") == (id)150)
  {
    v4 = CFSTR("groupContext");
  }
  else if (objc_msgSend(v22, "adjacency") == (id)152)
  {
    v4 = CFSTR("groupContextAbove");
  }
  else
  {
    if (objc_msgSend(v22, "adjacency") != (id)156)
      goto LABEL_22;
    v4 = CFSTR("groupContextBelow");
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer bodyContext](self, "bodyContext"));
  v21 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v7 = objc_msgSend(v6, "mutableCopy");

  if (!v7)
    v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "categories"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "categories"));
    objc_msgSend(v8, "addObjectsFromArray:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("categories")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11));
  if (v12)
    objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("categories"));
  v13 = objc_alloc_init((Class)NSMutableArray);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keywords"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "keywords"));
    objc_msgSend(v13, "addObjectsFromArray:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("keywords")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v16));
  if (v17)
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("keywords"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "language"));

  if (v18)
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "language"));
  objc_msgSend(v7, "setValue:forKey:", v18, CFSTR("languages"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[APContextTransformer bodyContext](self, "bodyContext"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v7));
  objc_msgSend(v19, "setValue:forKey:", v20, v21);

LABEL_22:
}

- (NSMutableDictionary)bodyContext
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPlacementType:(int64_t)a3
{
  self->_placementType = a3;
}

@end
