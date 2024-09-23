@implementation CollectionSaveSession

- (CollectionSaveSession)initWithMapItem:(id)a3
{
  id v4;
  CollectionSaveSession *v5;
  CollectionSaveSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CollectionSaveSession;
  v5 = -[CollectionEditSession init](&v8, "init");
  v6 = v5;
  if (v5)
    -[CollectionEditSession addSelectedObject:](v5, "addSelectedObject:", v4);

  return v6;
}

- (MKMapItem)mapItem
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anyObject"));

  v4 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return (MKMapItem *)v5;
}

- (GEOTransitLine)transitLine
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anyObject"));

  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
    v4 = v3;
  else
    v4 = 0;

  return (GEOTransitLine *)v4;
}

- (BOOL)canRenameSelectedObjectInCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
  v6 = objc_msgSend(v5, "count");

  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession mapItem](self, "mapItem"));
    if (objc_msgSend(v7, "_maps_canRenameCollectionItem"))
      v8 = objc_msgSend(v4, "containsItem:", v7) ^ 1;
    else
      LOBYTE(v8) = 0;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)applyToCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  id v26;
  id obj;
  _QWORD v28[5];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self, "collection"));
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession mapItem](self, "mapItem"));

  if (v10 && v9)
  {
    if (!-[CollectionEditSession suppressAnalytics](self, "suppressAnalytics"))
    {
      v11 = -[CollectionEditSession analyticsTarget](self, "analyticsTarget");
      v12 = (id)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self, "collection"));

      v26 = v7;
      v25 = v9;
      if (v12 != v6)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession collection](self, "collection"));
        if (objc_msgSend(v13, "handlerType") == (id)3)
          v11 = 256;
        else
          v11 = 252;

      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(obj);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i), "_identifier"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "muid")));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
            +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2073, v11, v20);

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      v7 = v26;
      v9 = v25;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10098EE9C;
    v28[3] = &unk_1011B7758;
    v28[4] = self;
    v29 = v7;
    objc_msgSend(v9, "addObjects:completion:", v21, v28);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](NSError, "GEOErrorWithCode:reason:", 0, CFSTR("Nil map item or collection")));
    if (v7)
      (*((void (**)(id, void *))v7 + 2))(v7, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession resultBlock](self, "resultBlock"));

    if (v23)
    {
      v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CollectionEditSession resultBlock](self, "resultBlock"));
      ((void (**)(_QWORD, void *))v24)[2](v24, v22);

    }
  }

}

@end
