@implementation CollectionAddOrRemoveSession

- (void)applyToCollection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession transitLine](self, "transitLine"));
  if ((v9 || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession mapItem](self, "mapItem"))) != 0)
    && (v9, v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionSaveSession mapItem](self, "mapItem"));
    v11 = objc_msgSend(v8, "containsItem:", v10);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10098F298;
      v29[3] = &unk_1011B7758;
      v29[4] = self;
      v30 = v7;
      objc_msgSend(v8, "removeObjects:completion:", v12, v29);

      v13 = v30;
    }
    else
    {
      if (!-[CollectionEditSession suppressAnalytics](self, "suppressAnalytics"))
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(v17);
              -[CollectionAddOrRemoveSession _instrumentSaveOrRemoveFromCollectionWithMapItem:instrumentSave:](self, "_instrumentSaveOrRemoveFromCollectionWithMapItem:instrumentSave:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), 1);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
          }
          while (v19);
        }

      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession selectedObjectSet](self, "selectedObjectSet"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10098F4C0;
      v23[3] = &unk_1011B7758;
      v23[4] = self;
      v24 = v7;
      objc_msgSend(v8, "addObjects:completion:", v22, v23);

      v13 = v24;
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError GEOErrorWithCode:reason:](NSError, "GEOErrorWithCode:reason:", 0, CFSTR("Nil map item or collection")));
    if (v7)
      (*((void (**)(id, void *))v7 + 2))(v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession resultBlock](self, "resultBlock"));

    if (v15)
    {
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CollectionEditSession resultBlock](self, "resultBlock"));
      ((void (**)(_QWORD, void *))v16)[2](v16, v14);

    }
  }

}

- (void)_instrumentSaveOrRemoveFromCollectionWithMapItem:(id)a3 instrumentSave:(BOOL)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  if (a4)
    v5 = 2073;
  else
    v5 = 476;
  v6 = a3;
  v7 = -[CollectionEditSession analyticsTarget](self, "analyticsTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_identifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "muid")));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionEditSession analyticsHandler](self, "analyticsHandler"));
  if (v10)
  {
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CollectionEditSession analyticsHandler](self, "analyticsHandler"));
    ((void (**)(_QWORD, uint64_t, uint64_t, id))v11)[2](v11, v5, v7, v12);

  }
  else
  {
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v5, v7, v12);
  }

}

@end
