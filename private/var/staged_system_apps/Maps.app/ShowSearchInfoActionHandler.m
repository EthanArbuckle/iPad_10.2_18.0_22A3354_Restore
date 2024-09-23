@implementation ShowSearchInfoActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  SearchFieldItem *v8;
  void *v9;
  void *v10;
  SearchSession *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  v6 = objc_opt_class(ShowSearchInfoAction);
  if ((objc_opt_isKindOfClass(v13, v6) & 1) != 0)
  {
    v7 = v13;
    v8 = objc_alloc_init(SearchFieldItem);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchText"));
    -[SearchFieldItem setSearchString:](v8, "setSearchString:", v10);

    if (objc_msgSend(v5, "isCarPlayOnlyContext"))
    {
      v11 = -[SearchSession initWithOrigin:]([SearchSession alloc], "initWithOrigin:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchInfo"));
      -[SearchSession restoreSearchForItem:withResults:](v11, "restoreSearchForItem:withResults:", v8, v12);
    }
    else
    {
      v11 = (SearchSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchInfo"));
      -[SearchSession openSearch:andResults:](v11, "openSearch:andResults:", v8, v12);
    }

  }
}

@end
