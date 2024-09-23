@implementation AEAggregationhelper

- (AEAggregationhelper)initWithPlugins:(id)a3 forUrl:(id)a4 withOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  AEAggregationhelper *v12;
  AEAggregationhelper *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[AEAggregationhelper init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_plugins, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (void)dealloc
{
  NSURL *url;
  NSArray *plugins;
  NSDictionary *options;
  objc_super v6;

  url = self->_url;
  self->_url = 0;

  plugins = self->_plugins;
  self->_plugins = 0;

  options = self->_options;
  self->_options = 0;

  v6.receiver = self;
  v6.super_class = (Class)AEAggregationhelper;
  -[AEAggregationhelper dealloc](&v6, "dealloc");
}

- (id)helperCoverImage
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_autoreleasePoolPush();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_plugins;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "helperForURL:withOptions:", self->_url, self->_options, (_QWORD)v12));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "helperCoverImage"));

      if (v10)
        break;
      if (v6 == (id)++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_plugins;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "helperForURL:withOptions:", self->_url, self->_options, (_QWORD)v16));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "helperMetadataForKey:needsCoordination:", v6, v4));

      if (v14)
        break;
      if (v10 == (id)++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v14 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v14;
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_plugins;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "helperForURL:withOptions:", self->_url, self->_options, (_QWORD)v14));
        if ((objc_opt_respondsToSelector(v13, "setMetadata:forKey:") & 1) != 0)
          objc_msgSend(v13, "setMetadata:forKey:", v6, v7);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)helperDeletePersistentCache
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = objc_autoreleasePoolPush();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_plugins;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "helperForURL:withOptions:", self->_url, self->_options, (_QWORD)v10));
        objc_msgSend(v9, "helperDeletePersistentCache");

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(v3);
}

- (void)helperUpdateCachedURLTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_plugins;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "helperForURL:withOptions:", self->_url, self->_options, (_QWORD)v12));
        objc_msgSend(v11, "helperUpdateCachedURLTo:", v4);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(v5);
}

- (id)annotationProviderWithCoordination:(BOOL)a3 forAssetID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  char **v12;
  void *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v6 = a4;
  v7 = objc_autoreleasePoolPush();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_plugins;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v19 = v7;
    v11 = *(_QWORD *)v21;
    v12 = &selRef__removeCloseBox;
    while (2)
    {
      v13 = 0;
      v14 = v12[437];
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13), "helperForURL:withOptions:", self->_url, self->_options));
        if ((objc_opt_respondsToSelector(v15, v14) & 1) != 0)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotationProviderWithCoordination:forAssetID:", v4, v6));
          if (v16)
          {
            v17 = (void *)v16;

            goto LABEL_12;
          }
        }

        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v12 = &selRef__removeCloseBox;
      if (v10)
        continue;
      break;
    }
    v17 = 0;
LABEL_12:
    v7 = v19;
  }
  else
  {
    v17 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v17;
}

- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssertVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  char **v18;
  void *v19;
  char *v20;
  void *v21;
  BOOL v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v25 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_autoreleasePoolPush();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_plugins;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v24 = v13;
    v17 = *(_QWORD *)v27;
    v18 = &selRef__removeCloseBox;
    while (2)
    {
      v19 = 0;
      v20 = v18[232];
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v19), "helperForURL:withOptions:", self->_url, self->_options, v24));
        if ((objc_opt_respondsToSelector(v21, v20) & 1) != 0
          && (objc_msgSend(v21, "acknowledgeAnnotationProvider:willMergeAnnotationsWithAssertVersionMismatch:assetID:assetURL:", v25, v10, v11, v12) & 1) == 0)
        {

          v22 = 0;
          goto LABEL_12;
        }

        v19 = (char *)v19 + 1;
      }
      while (v16 != v19);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v18 = &selRef__removeCloseBox;
      if (v16)
        continue;
      break;
    }
    v22 = 1;
LABEL_12:
    v13 = v24;
  }
  else
  {
    v22 = 1;
  }

  objc_autoreleasePoolPop(v13);
  return v22;
}

- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4
{
  id *v4;
  void *v6;
  NSArray *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char **v12;
  void *v13;
  char *v14;
  void *v15;
  unsigned int v16;
  id v17;
  BOOL v18;
  id v19;
  void *v21;
  id *v22;
  _BOOL4 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v23 = a4;
  if (!a3)
    return 0;
  v4 = a3;
  v6 = objc_autoreleasePoolPush();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_plugins;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v21 = v6;
    v22 = v4;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    v12 = &selRef_ensureLayoutForTextContainer_;
    while (2)
    {
      v13 = 0;
      v14 = v12[300];
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v13), "helperForURL:withOptions:", self->_url, self->_options, v21, v22));
        if ((objc_opt_respondsToSelector(v15, v14) & 1) != 0)
        {
          v24 = v10;
          v16 = objc_msgSend(v15, "helperValidateBookAuthorizationWithError:needsCoordination:", &v24, v23);
          v17 = v24;

          if (v16)
          {

            v18 = 1;
            goto LABEL_15;
          }
          v10 = v17;
        }

        v13 = (char *)v13 + 1;
      }
      while (v9 != v13);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v12 = &selRef_ensureLayoutForTextContainer_;
      if (v9)
        continue;
      break;
    }
    v18 = 0;
    v17 = v10;
LABEL_15:
    v6 = v21;
    v4 = v22;
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }

  objc_autoreleasePoolPop(v6);
  v19 = objc_retainAutorelease(v17);
  *v4 = v19;

  return v18;
}

- (void)viewControllerFromPluginIndex:(int)a3 withCompletion:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  NSDictionary *options;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  int v15;
  int v16;

  v6 = a4;
  v7 = -[NSArray count](self->_plugins, "count");
  if (v7 > a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_plugins, "objectAtIndex:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "helperForURL:withOptions:", self->_url, self->_options));
    options = self->_options;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_B4724;
    v13[3] = &unk_290608;
    v15 = a3;
    v16 = v7;
    v13[4] = self;
    v14 = v6;
    objc_msgSend(v9, "helperViewControllerWithOptions:completion:", options, v13);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_B4864;
    v11[3] = &unk_28BF90;
    v12 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    v8 = v12;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  -[AEAggregationhelper viewControllerFromPluginIndex:withCompletion:](self, "viewControllerFromPluginIndex:withCompletion:", 0, a4);
}

- (id)helperMinifiedController
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_autoreleasePoolPush();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_plugins;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "helperForURL:withOptions:", self->_url, self->_options, (_QWORD)v12));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "helperMinifiedController"));

      if (v10)
        break;
      if (v6 == (id)++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
}

@end
