@implementation MCDStoreContentManager

- (id)_modelRequest
{
  MusicStoreCollectionSongsRequest *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;

  v3 = objc_alloc_init(MusicStoreCollectionSongsRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "requestSectionKind");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestSectionKind"));
    -[MusicStoreCollectionSongsRequest setSectionKind:](v3, "setSectionKind:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v9 = objc_opt_respondsToSelector(v8, "requestSectionProperties");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestSectionProperties"));
    -[MusicStoreCollectionSongsRequest setSectionProperties:](v3, "setSectionProperties:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v13 = objc_opt_respondsToSelector(v12, "requestItemKind");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requestItemKind"));
    -[MusicStoreCollectionSongsRequest setItemKind:](v3, "setItemKind:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v17 = objc_opt_respondsToSelector(v16, "requestItemProperties");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "requestItemProperties"));
    -[MusicStoreCollectionSongsRequest setItemProperties:](v3, "setItemProperties:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v21 = objc_opt_respondsToSelector(v20, "itemSortDescriptors");

  if ((v21 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "itemSortDescriptors"));
    -[MusicStoreCollectionSongsRequest setItemSortDescriptors:](v3, "setItemSortDescriptors:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v25 = objc_opt_respondsToSelector(v24, "requestIdentifierSet");

  if ((v25 & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "requestIdentifierSet"));
    -[MusicStoreCollectionSongsRequest setCollectionIdentifiers:](v3, "setCollectionIdentifiers:", v27);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v29 = objc_opt_respondsToSelector(v28, "requestLabel");

  if ((v29 & 1) != 0)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "requestLabel"));
    -[MusicStoreCollectionSongsRequest setLabel:](v3, "setLabel:", v31);

  }
  return v3;
}

- (id)_operationForRequest:(id)a3
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __47__MCDStoreContentManager__operationForRequest___block_invoke;
  v4[3] = &unk_133A648;
  v4[4] = self;
  return objc_msgSend(a3, "newOperationWithResponseHandler:", v4);
}

id __47__MCDStoreContentManager__operationForRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processResponse:error:", a2, a3);
}

@end
