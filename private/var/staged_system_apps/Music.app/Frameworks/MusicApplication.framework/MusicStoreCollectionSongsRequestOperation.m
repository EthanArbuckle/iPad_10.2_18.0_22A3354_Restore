@implementation MusicStoreCollectionSongsRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCollectionSongsRequestOperation request](self, "request", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionIdentifiers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "globalPlaylistID"));

  if (objc_msgSend(v8, "length"))
  {
    if (v8)
    {
LABEL_3:
      v9 = objc_alloc((Class)MPStoreModelRequestConfiguration);
      v18 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
      v11 = objc_msgSend(v9, "initWithRequestedItemIdentifiers:reason:", v10, 2);

      goto LABEL_8;
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "universalStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v12, "adamID")));
    v14 = MPStoreItemMetadataStringNormalizeStoreIDValue();
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v8 = (void *)v15;
    if (v15)
      goto LABEL_3;
  }
  if (a4)
  {
    v16 = SSError(SSErrorDomain, 137, 0, 0);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  MusicStoreCollectionSongsResponse *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  MusicStoreCollectionSongsResponse *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  MusicStoreCollectionSongsResponse *v33;
  void (**v34)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (!v9)
  {
    v10 = 0;
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeItemMetadataForItemIdentifier:", v9));
  if (!v10)
  {
LABEL_8:
    v23 = SSError(SSErrorDomain, 111, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v7[2](v7, 0, v11);
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCollectionSongsRequestOperation request](self, "request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionProperties"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProperties"));
  v13 = objc_msgSend(objc_alloc((Class)MPModelStoreBrowseContentItemBuilder), "initWithRequestedPropertySet:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCollectionSongsRequestOperation userIdentity](self, "userIdentity"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelObjectWithStoreItemMetadata:userIdentity:", v10, v14));

  if (!v15)
  {

    goto LABEL_8;
  }
  v26 = v13;
  v16 = objc_alloc_init((Class)MPMutableSectionedCollection);
  objc_msgSend(v16, "appendSection:", v15);
  v17 = -[MusicStoreCollectionSongsResponse initWithRequest:]([MusicStoreCollectionSongsResponse alloc], "initWithRequest:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childrenStoreIDs"));
  if (objc_msgSend(v27, "count"))
  {
    v25 = v17;
    v18 = v16;
    v19 = v27;
    v24 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __88__MusicStoreCollectionSongsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
    v29[3] = &unk_1339768;
    v29[4] = self;
    v34 = v7;
    v30 = v28;
    v31 = v19;
    v32 = v18;
    v33 = v25;
    v21 = v19;
    v16 = v18;
    v17 = v25;
    v22 = v21;
    objc_msgSend(v20, "requestStoreItemMetadataForReason:withItemIdentifiers:responseHandler:", 1, v21, v29);

    v12 = v24;
  }
  else
  {
    -[MusicStoreCollectionSongsResponse setResults:](v17, "setResults:", v16);
    ((void (**)(id, MusicStoreCollectionSongsResponse *, void *))v7)[2](v7, v17, 0);
  }

LABEL_11:
}

void __88__MusicStoreCollectionSongsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else if (objc_msgSend(v5, "isFinalResponse"))
    {
      v7 = objc_msgSend(objc_alloc((Class)MPStoreModelSongBuilder), "initWithRequestedPropertySet:", *(_QWORD *)(a1 + 40));
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = *(id *)(a1 + 48);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeItemMetadataForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i)));
            if (v13)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userIdentity"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "modelObjectWithStoreItemMetadata:userIdentity:", v13, v14));

              if (v15)
              {
                objc_msgSend(*(id *)(a1 + 56), "appendItem:", v15);

              }
            }

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      objc_msgSend(*(id *)(a1 + 64), "setResults:", *(_QWORD *)(a1 + 56));
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

      v6 = 0;
    }
  }

}

@end
