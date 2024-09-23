@implementation DirectionIntentItemProvider

- (void)directionItemWithLocalSearchCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionIntent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionIntentOrigin"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directionIntentDestination"));

    -[DirectionIntentItemProvider directionItemWithDirectionIntent:localSearchCompletionOrigin:localSearchCompletionDestination:searchResultOrigin:searchResultDestination:completion:](self, "directionItemWithDirectionIntent:localSearchCompletionOrigin:localSearchCompletionDestination:searchResultOrigin:searchResultDestination:completion:", v10, v8, v9, 0, 0, v6);
  }
}

- (void)directionItemWithDirectionIntent:(id)a3 searchResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "origin"));
    if (objc_msgSend(v10, "hasResultIndex"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "origin"));
      v12 = objc_msgSend(v11, "resultIndex");
      v13 = objc_msgSend(v8, "count");

      if (v12 >= v13)
      {
        v14 = 0;
LABEL_8:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "destination"));
        if (objc_msgSend(v15, "hasResultIndex"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "destination"));
          v17 = objc_msgSend(v16, "resultIndex");
          v18 = objc_msgSend(v8, "count");

          if (v17 >= v18)
          {
            v19 = 0;
            goto LABEL_14;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "destination"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v15, "resultIndex")));
        }
        else
        {
          v19 = 0;
        }

LABEL_14:
        -[DirectionIntentItemProvider directionItemWithDirectionIntent:localSearchCompletionOrigin:localSearchCompletionDestination:searchResultOrigin:searchResultDestination:completion:](self, "directionItemWithDirectionIntent:localSearchCompletionOrigin:localSearchCompletionDestination:searchResultOrigin:searchResultDestination:completion:", v20, 0, 0, v14, v19, v9);

        goto LABEL_15;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "origin"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v10, "resultIndex")));
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_8;
  }
LABEL_15:

}

- (void)directionItemWithDirectionIntent:(id)a3 localSearchCompletionOrigin:(id)a4 localSearchCompletionDestination:(id)a5 searchResultOrigin:(id)a6 searchResultDestination:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, id);
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SearchFieldItem *v29;
  DirectionItem *v30;
  unsigned int v31;
  uint64_t v32;
  DirectionItem *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, id))a8;
  if (v19)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = sub_100B66860;
    v50 = sub_100B66870;
    v51 = 0;
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = sub_100B66860;
    v44 = sub_100B66870;
    v45 = 0;
    v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "origin"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100B66878;
    v37[3] = &unk_1011E6DD0;
    v39 = &v46;
    v22 = v20;
    v38 = v22;
    -[DirectionIntentItemProvider searchFieldItemWithResolveditem:localSearchCompletionFromServer:searchResultFromServer:completion:](self, "searchFieldItemWithResolveditem:localSearchCompletionFromServer:searchResultFromServer:completion:", v21, v15, v17, v37);

    dispatch_group_enter(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100B668C4;
    v34[3] = &unk_1011E6DD0;
    v36 = &v40;
    v24 = v22;
    v35 = v24;
    -[DirectionIntentItemProvider searchFieldItemWithResolveditem:localSearchCompletionFromServer:searchResultFromServer:completion:](self, "searchFieldItemWithResolveditem:localSearchCompletionFromServer:searchResultFromServer:completion:", v23, v16, v18, v34);

    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = v25;
    if (v47[5])
    {
      objc_msgSend(v25, "addObject:");
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v27));
      objc_msgSend(v26, "addObject:", v28);

    }
    if (v41[5])
    {
      objc_msgSend(v26, "addObject:");
    }
    else
    {
      v29 = objc_opt_new(SearchFieldItem);
      objc_msgSend(v26, "addObject:", v29);

    }
    if (objc_msgSend(v26, "count"))
    {
      v30 = [DirectionItem alloc];
      v31 = objc_msgSend(v14, "transportType") - 1;
      if (v31 > 5)
        v32 = 1;
      else
        v32 = qword_100E3EFD0[v31];
      v33 = -[DirectionItem initWithItems:transportType:](v30, "initWithItems:transportType:", v26, v32);
      v19[2](v19, v33);

    }
    else
    {
      v19[2](v19, 0);
    }

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v46, 8);

  }
}

- (void)searchFieldItemWithResolveditem:(id)a3 localSearchCompletionFromServer:(id)a4 searchResultFromServer:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  ClientTypeResolver *v13;
  SearchFieldItem *v14;
  void *v15;
  id v16;
  SearchFieldItem *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  SearchFieldItem *v21;
  void (**v22)(id, _QWORD);
  _QWORD v23[4];
  SearchFieldItem *v24;
  void (**v25)(id, _QWORD);

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (v12)
  {
    v13 = objc_alloc_init(ClientTypeResolver);
    v14 = objc_alloc_init(SearchFieldItem);
    switch(objc_msgSend(v9, "itemType"))
    {
      case 0u:
        v12[2](v12, 0);
        break;
      case 1u:
      case 2u:
      case 6u:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver personalizedItemSource](v13, "personalizedItemSource"));
        v16 = objc_msgSend(v9, "itemType");
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100B66B34;
        v23[3] = &unk_1011E6DF8;
        v24 = v14;
        v25 = v12;
        objc_msgSend(v15, "addressOrLOIWithType:completion:", v16, v23);

        v17 = v24;
        goto LABEL_6;
      case 3u:
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver parkedCarSource](v13, "parkedCarSource"));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100B66BF0;
        v20[3] = &unk_1011C13F0;
        v21 = v14;
        v22 = v12;
        objc_msgSend(v18, "objectWithCompletion:", v20);

        v17 = v21;
LABEL_6:

        break;
      case 4u:
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
        -[SearchFieldItem setSearchResult:](v14, "setSearchResult:", v19);

        goto LABEL_12;
      case 5u:
        if (v10)
        {
          -[SearchFieldItem setCompletion:](v14, "setCompletion:", v10);
        }
        else if (v11)
        {
          -[SearchFieldItem setSearchResult:](v14, "setSearchResult:", v11);
        }
LABEL_12:
        ((void (**)(id, SearchFieldItem *))v12)[2](v12, v14);
        break;
      default:
        break;
    }

  }
}

@end
