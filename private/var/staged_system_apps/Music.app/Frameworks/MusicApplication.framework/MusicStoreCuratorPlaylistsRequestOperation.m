@implementation MusicStoreCuratorPlaylistsRequestOperation

- (id)configurationForLoadingModelDataWithStoreURLBag:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[6];
  void *v24;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCuratorPlaylistsRequestOperation request](self, "request", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "additionalPlaylistIdentifiers"));
  v9 = objc_msgSend(v8, "count");
  if (v9)
  {
    v10 = v9;
    v11 = v8;
    v12 = +[MPStoreItemMetadataRequestController optimalBatchSize](MPStoreItemMetadataRequestController, "optimalBatchSize");
    if (v10 > v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subarrayWithRange:", 0, v12));

      v11 = (id)v13;
    }
    v14 = 1;
    v15 = objc_msgSend(objc_alloc((Class)MPStoreModelRequestConfiguration), "initWithRequestedItemIdentifiers:reason:", v11, 1);

    if (v15)
      goto LABEL_5;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v6, "curatorStoreAdamID")));
    v18 = MPStoreItemMetadataStringNormalizeStoreIDValue();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
    {
      v20 = objc_alloc((Class)MPStoreModelRequestConfiguration);
      v24 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
      v15 = objc_msgSend(v20, "initWithRequestedItemIdentifiers:reason:", v21, 2);

    }
    else if (a4)
    {
      v22 = SSError(SSErrorDomain, 137, 0, 0);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v22);
    }
    else
    {
      v15 = 0;
    }

    v14 = 0;
    if (v15)
    {
LABEL_5:
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __100__MusicStoreCuratorPlaylistsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke;
      v23[3] = &unk_1339C68;
      v23[4] = self;
      v23[5] = v14;
      -[MusicStoreCuratorPlaylistsRequestOperation dispatchSync:](self, "dispatchSync:", v23);
    }
  }

  return v15;
}

id __100__MusicStoreCuratorPlaylistsRequestOperation_configurationForLoadingModelDataWithStoreURLBag_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRequestType:", *(_QWORD *)(a1 + 40));
}

- (void)produceResponseWithLoadedOutput:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __89__MusicStoreCuratorPlaylistsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke;
  v10[3] = &unk_1339AD8;
  v10[4] = self;
  v10[5] = &v11;
  -[MusicStoreCuratorPlaylistsRequestOperation dispatchSync:](self, "dispatchSync:", v10);
  v9 = v12[3];
  if (v9)
  {
    if (v9 == 1)
      -[MusicStoreCuratorPlaylistsRequestOperation _produceIncrementalResponseWithLoadedItemMetadataResponse:completion:](self, "_produceIncrementalResponseWithLoadedItemMetadataResponse:completion:", v8, v7);
  }
  else
  {
    -[MusicStoreCuratorPlaylistsRequestOperation _produceInitialResponseWithLoadedItemMetadataResponse:completion:](self, "_produceInitialResponseWithLoadedItemMetadataResponse:completion:", v8, v7);
  }
  _Block_object_dispose(&v11, 8);

}

id __89__MusicStoreCuratorPlaylistsRequestOperation_produceResponseWithLoadedOutput_completion___block_invoke(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "_requestType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_produceInitialResponseWithLoadedItemMetadataResponse:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  MusicStoreCuratorPlaylistsResponse *v19;
  void *v20;
  _BYTE *v21;
  _BYTE *v22;
  id v23;
  _BYTE *v24;
  BOOL v25;
  int64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  MusicStoreCuratorPlaylistsResponse *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  MusicStoreCuratorPlaylistsRequestOperation *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  MusicStoreCuratorPlaylistsResponse *v52;
  id v53;
  void (**v54)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (!v9)
  {
    v10 = 0;
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeItemMetadataForItemIdentifier:", v9));
  if (!v10)
  {
LABEL_10:
    v29 = SSError(SSErrorDomain, 111, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v7[2](v7, 0, v30);

    goto LABEL_14;
  }
  v47 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCuratorPlaylistsRequestOperation request](self, "request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sectionProperties"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemProperties"));
  v14 = objc_msgSend(objc_alloc((Class)MPStoreModelCuratorBuilder), "initWithRequestedPropertySet:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCuratorPlaylistsRequestOperation userIdentity](self, "userIdentity"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "modelObjectWithStoreItemMetadata:userIdentity:", v10, v15));

  if (!v16)
  {

    v6 = v47;
    goto LABEL_10;
  }
  v17 = (void *)v16;
  v43 = v13;
  v44 = v12;
  v42 = self;
  v18 = objc_alloc_init((Class)MPMutableSectionedCollection);
  objc_msgSend(v18, "appendSection:", v17);
  v19 = -[MusicStoreCuratorPlaylistsResponse initWithRequest:]([MusicStoreCuratorPlaylistsResponse alloc], "initWithRequest:", v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlistIdentifiers"));
  v21 = objc_msgSend(v20, "count");
  v45 = v20;
  v46 = v14;
  if (v21)
  {
    v22 = v21;
    v38 = v17;
    v40 = v11;
    v23 = v20;
    v24 = +[MPStoreItemMetadataRequestController optimalBatchSize](MPStoreItemMetadataRequestController, "optimalBatchSize");
    v25 = v22 > v24;
    v26 = v22 - v24;
    if (v25)
    {
      v27 = v24;
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subarrayWithRange:", 0, v24));

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subarrayWithRange:", v27, v26));
      v23 = (id)v28;
    }
    else
    {
      v34 = 0;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[MPStoreItemMetadataRequestController sharedStoreItemMetadataRequestController](MPStoreItemMetadataRequestController, "sharedStoreItemMetadataRequestController", v38, v40));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __111__MusicStoreCuratorPlaylistsRequestOperation__produceInitialResponseWithLoadedItemMetadataResponse_completion___block_invoke;
    v48[3] = &unk_133A128;
    v48[4] = v42;
    v54 = v7;
    v32 = v43;
    v49 = v43;
    v50 = v23;
    v51 = v18;
    v33 = v19;
    v52 = v19;
    v53 = v34;
    v36 = v34;
    v37 = v23;
    objc_msgSend(v35, "requestStoreItemMetadataForReason:withItemIdentifiers:responseHandler:", 1, v37, v48);

    v31 = v44;
    v17 = v39;
    v11 = v41;
  }
  else
  {
    -[MusicStoreCuratorPlaylistsResponse setResults:](v19, "setResults:", v18);
    ((void (**)(id, MusicStoreCuratorPlaylistsResponse *, void *))v7)[2](v7, v19, 0);
    v32 = v13;
    v31 = v44;
    v33 = v19;
  }

  v6 = v47;
LABEL_14:

}

void __111__MusicStoreCuratorPlaylistsRequestOperation__produceInitialResponseWithLoadedItemMetadataResponse_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    }
    else if (objc_msgSend(v5, "isFinalResponse"))
    {
      v7 = objc_msgSend(objc_alloc((Class)MPStoreModelPlaylistBuilder), "initWithRequestedPropertySet:", *(_QWORD *)(a1 + 40));
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
      objc_msgSend(*(id *)(a1 + 64), "setAdditionalPlaylistIdentifiers:", *(_QWORD *)(a1 + 72));
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

      v6 = 0;
    }
  }

}

- (void)_produceIncrementalResponseWithLoadedItemMetadataResponse:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;
  id v12;
  void *v13;
  BOOL v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  char *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  MusicStoreCuratorPlaylistsResponse *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(id, MusicStoreCuratorPlaylistsResponse *, _QWORD);
  char *v44;
  void *v45;
  id obj;
  MusicStoreCuratorPlaylistsRequestOperation *v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v6 = a3;
  v43 = (void (**)(id, MusicStoreCuratorPlaylistsResponse *, _QWORD))a4;
  v47 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCuratorPlaylistsRequestOperation request](self, "request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previousResponse"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "additionalPlaylistIdentifiers"));
  v10 = objc_msgSend(v9, "count");
  v11 = +[MPStoreItemMetadataRequestController optimalBatchSize](MPStoreItemMetadataRequestController, "optimalBatchSize");
  v12 = v9;
  v13 = v12;
  v14 = v10 > v11;
  v15 = v10 - v11;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subarrayWithRange:", 0, v11));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", v11, v15));
  }
  else
  {
    v39 = 0;
    v16 = v12;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemProperties"));
  v19 = v18;
  v42 = v7;
  v40 = v13;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemProperties"));
  v21 = v20;

  v41 = v8;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
  v23 = objc_msgSend(v22, "mutableCopy");

  v44 = (char *)objc_msgSend(v23, "numberOfSections") - 1;
  v45 = v23;
  v24 = (char *)objc_msgSend(v23, "numberOfItemsInSection:");
  v25 = objc_alloc_init((Class)NSMutableArray);
  v38 = v21;
  v26 = objc_msgSend(objc_alloc((Class)MPStoreModelPlaylistBuilder), "initWithRequestedPropertySet:", v21);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v16;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v29)
          objc_enumerationMutation(obj);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeItemMetadataForItemIdentifier:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i)));
        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[MusicStoreCuratorPlaylistsRequestOperation userIdentity](v47, "userIdentity"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "modelObjectWithStoreItemMetadata:userIdentity:", v31, v32));

          if (v33)
          {
            objc_msgSend(v45, "appendItem:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v24, v44));
            objc_msgSend(v25, "addObject:", v34);

            ++v24;
          }
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v28);
  }

  if (objc_msgSend(v25, "count"))
  {
    v35 = objc_alloc((Class)MPChangeDetails);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __115__MusicStoreCuratorPlaylistsRequestOperation__produceIncrementalResponseWithLoadedItemMetadataResponse_completion___block_invoke;
    v48[3] = &unk_133A150;
    v49 = v25;
    v36 = objc_msgSend(v35, "initWithBlock:", v48);

  }
  else
  {
    v36 = 0;
  }
  v37 = -[MusicStoreCuratorPlaylistsResponse initWithRequest:]([MusicStoreCuratorPlaylistsResponse alloc], "initWithRequest:", v42);
  -[MusicStoreCuratorPlaylistsResponse setResults:](v37, "setResults:", v45);
  -[MusicStoreCuratorPlaylistsResponse setChangeDetails:](v37, "setChangeDetails:", v36);
  -[MusicStoreCuratorPlaylistsResponse setAdditionalPlaylistIdentifiers:](v37, "setAdditionalPlaylistIdentifiers:", v39);
  v43[2](v43, v37, 0);

}

id __115__MusicStoreCuratorPlaylistsRequestOperation__produceIncrementalResponseWithLoadedItemMetadataResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInsertedItemIndexPaths:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)_requestType
{
  return self->__requestType;
}

- (void)_setRequestType:(unint64_t)a3
{
  self->__requestType = a3;
}

@end
