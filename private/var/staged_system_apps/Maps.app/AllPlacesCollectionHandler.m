@implementation AllPlacesCollectionHandler

- (AllPlacesCollectionHandler)init
{
  AllPlacesCollectionHandler *v2;
  void *v3;
  uint64_t v4;
  NSArray *storeSubscriptionTypes;
  NSArray *queryContents;
  objc_super v8;
  uint64_t v9;

  v8.receiver = self;
  v8.super_class = (Class)AllPlacesCollectionHandler;
  v2 = -[CollectionHandler init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v3, "subscribe:", v2);

    v9 = objc_opt_class(MSCollectionPlaceItem);
    v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v4;

    queryContents = v2->_queryContents;
    v2->_queryContents = (NSArray *)&__NSArray0__struct;

    -[AllPlacesCollectionHandler storeDidChangeWithTypes:](v2, "storeDidChangeWithTypes:", &__NSArray0__struct);
  }
  return v2;
}

- (id)identifier
{
  return CFSTR("__internal_CollectionSavedPlacesIdentifier");
}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[Collection] All Places"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)glyphImage
{
  return +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("pin.point.of.interest.2.fill"));
}

- (int64_t)handlerType
{
  return 2;
}

- (int64_t)contentType
{
  return 1;
}

- (int)showAction
{
  return 2085;
}

- (void)rebuildContent
{
  -[CollectionHandler rebuildContent:](self, "rebuildContent:", self->_queryContents);
}

- (void)updateContent
{
  -[AllPlacesCollectionHandler rebuildContent](self, "rebuildContent");
  -[CollectionHandler updateSorting](self, "updateSorting");
}

- (BOOL)canDeleteContent
{
  return 1;
}

- (void)removeObjects:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  _UNKNOWN **v8;
  uint64_t v9;
  __objc2_class **v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  AllPlacesCollectionHandler *v23;
  __objc2_class **v24;
  _UNKNOWN **v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];

  v5 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = CPLaneGuidance_ptr;
    v9 = *(_QWORD *)v33;
    v10 = &classRef_HistoryEntryRecentRouteInfoSource;
    do
    {
      v11 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(v8[491]);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = (objc_class *)v10[304];
          v31.receiver = self;
          v31.super_class = v14;
          v15 = -[CollectionHandler itemForMapItem:](&v31, "itemForMapItem:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          if (v16)
            goto LABEL_17;
        }
        else
        {
          v17 = v12;
          if (objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine))
            v18 = v17;
          else
            v18 = 0;
          v19 = v18;

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler mapping](self, "mapping"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v19));

            if (!v16)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionHandler mapping](self, "mapping"));
              v22 = v9;
              v23 = self;
              v24 = v10;
              v25 = v8;
              v26 = v5;
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", v27));

              v5 = v26;
              v8 = v25;
              v10 = v24;
              self = v23;
              v9 = v22;
              v7 = v30;

            }
          }
          else
          {
            v16 = 0;
          }

          if (v16)
          {
LABEL_17:
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore", v30));
            v36 = v16;
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
            objc_msgSend(v28, "deleteWithObjects:error:", v29, 0);

          }
        }

        v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)MSCollectionPlaceItemRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008E9DB0;
  v6[3] = &unk_1011AD9D0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "fetchWithCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_storeStrong((id *)&self->_queryContents, 0);
}

@end
