@implementation RAPCuratedCollectionContext

- (RAPCuratedCollectionContext)initWithCuratedCollection:(id)a3 placeCollectionMapItems:(id)a4
{
  id v7;
  id v8;
  RAPCuratedCollectionContext *v9;
  RAPCuratedCollectionContext *v10;
  NSArray *v11;
  NSArray *placeCollectionMapItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPCuratedCollectionContext;
  v9 = -[RAPCuratedCollectionContext init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedCollection, a3);
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    placeCollectionMapItems = v10->_placeCollectionMapItems;
    v10->_placeCollectionMapItems = v11;

  }
  return v10;
}

- (GEORPCuratedCollectionContext)geoContext
{
  id v3;
  RAPCuratedCollectionContext *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];

  v3 = objc_alloc_init((Class)GEORPCuratedCollectionContext);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection itemIds](self->_curatedCollection, "itemIds"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "muid"))
          objc_msgSend(v3, "addPlaceEntityMuid:", objc_msgSend(v10, "muid"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v7);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection photos](v4->_curatedCollection, "photos"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
        v16 = objc_alloc_init((Class)GEORPFeedbackClientImageInfo);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "largestPhoto"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "url"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
        objc_msgSend(v16, "setImageUrl:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection publisherAttributionIdentifierString](v4->_curatedCollection, "publisherAttributionIdentifierString"));
        objc_msgSend(v16, "setProviderImageId:", v20);

        objc_msgSend(v3, "addImageInfo:", v16);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v12);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionTitle](v4->_curatedCollection, "collectionTitle"));
  objc_msgSend(v3, "setOriginalName:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionDescription](v4->_curatedCollection, "collectionDescription"));
  objc_msgSend(v3, "setOriginalDescription:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionURL](v4->_curatedCollection, "collectionURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
  objc_msgSend(v3, "setOriginalUrl:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionIdentifier](v4->_curatedCollection, "collectionIdentifier"));
  objc_msgSend(v3, "setCuratedCollectionMuid:", objc_msgSend(v25, "muid"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection itemIds](v4->_curatedCollection, "itemIds"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(v3, "addPlaceEntityMuid:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)k), "muid"));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v28);
  }

  return (GEORPCuratedCollectionContext *)v3;
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollection, a3);
}

- (NSArray)placeCollectionMapItems
{
  return self->_placeCollectionMapItems;
}

- (void)setPlaceCollectionMapItems:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollectionMapItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollectionMapItems, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end
