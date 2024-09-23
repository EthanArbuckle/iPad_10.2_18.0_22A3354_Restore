@implementation MCDStorePlaybackItemsManager

- (id)_modelRequest
{
  id v3;
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

  v3 = objc_alloc_init((Class)MPCModelStorePlaybackItemsRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "requestLabel");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestLabel"));
    objc_msgSend(v3, "setLabel:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v9 = objc_opt_respondsToSelector(v8, "requestSectionKind");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestSectionKind"));
    objc_msgSend(v3, "setSectionKind:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v13 = objc_opt_respondsToSelector(v12, "requestSectionProperties");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "requestSectionProperties"));
    objc_msgSend(v3, "setSectionProperties:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v17 = objc_opt_respondsToSelector(v16, "requestItemKind");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "requestItemKind"));
    objc_msgSend(v3, "setItemKind:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v21 = objc_opt_respondsToSelector(v20, "requestItemProperties");

  if ((v21 & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "requestItemProperties"));
    objc_msgSend(v3, "setItemProperties:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v25 = objc_opt_respondsToSelector(v24, "storeIDs");

  if ((v25 & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storeIDs"));
    objc_msgSend(v3, "setStoreIDs:", v27);

  }
  return v3;
}

@end
