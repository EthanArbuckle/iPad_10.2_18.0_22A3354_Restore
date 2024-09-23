@implementation MCDLibraryContentManager

- (id)_modelRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;

  v3 = objc_alloc_init((Class)MPModelLibraryRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestItemKind"));
  objc_msgSend(v3, "setItemKind:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestSectionProperties"));
  objc_msgSend(v3, "setSectionProperties:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestItemProperties"));
  objc_msgSend(v3, "setItemProperties:", v9);

  if (-[_MCDContentManager limitedUI](self, "limitedUI"))
  {
    objc_msgSend(v3, "setContentRange:", 0, 12);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v11 = objc_opt_respondsToSelector(v10, "contentRange");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
      v13 = objc_msgSend(v12, "contentRange");
      objc_msgSend(v3, "setContentRange:", v13, v14);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v16 = objc_opt_respondsToSelector(v15, "requestLabel");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "requestLabel"));
    objc_msgSend(v3, "setLabel:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v20 = objc_opt_respondsToSelector(v19, "itemSortDescriptors");

  if ((v20 & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "itemSortDescriptors"));
    objc_msgSend(v3, "setItemSortDescriptors:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v24 = objc_opt_respondsToSelector(v23, "scopedContainers");

  if ((v24 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "scopedContainers"));
    objc_msgSend(v3, "setScopedContainers:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v28 = objc_opt_respondsToSelector(v27, "allowedSectionIdentifiers");

  if ((v28 & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "allowedSectionIdentifiers"));
    objc_msgSend(v3, "setAllowedSectionIdentifiers:", v30);

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
  v32 = objc_opt_respondsToSelector(v31, "requestSectionKind");

  if ((v32 & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "requestSectionKind"));
    objc_msgSend(v3, "setSectionKind:", v34);

  }
  if (-[_MCDContentManager showLocalContent](self, "showLocalContent"))
    objc_msgSend(v3, "setFilteringOptions:", (unint64_t)objc_msgSend(v3, "filteringOptions") | 2);
  if (-[_MCDContentManager showFavoriteContent](self, "showFavoriteContent"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v36 = objc_opt_respondsToSelector(v35, "favoriteFilteringOptions");

    if ((v36 & 1) != 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
      objc_msgSend(v3, "setFilteringOptions:", (unint64_t)objc_msgSend(v3, "filteringOptions") | (unint64_t)objc_msgSend(v37, "favoriteFilteringOptions"));

    }
  }
  return v3;
}

- (void)setSortingPreference:(id)a3
{
  NSString *v4;
  void *v5;
  char v6;
  void *v7;
  NSString *v8;

  v4 = (NSString *)a3;
  if (self->_sortingPreference != v4)
  {
    self->_sortingPreference = v4;
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
    v6 = objc_opt_respondsToSelector(v5, "setSortingPreference:");

    v4 = v8;
    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[_MCDContentManager dataSource](self, "dataSource"));
      objc_msgSend(v7, "setSortingPreference:", v8);

      -[_MCDContentManager setLastReceivedResponse:](self, "setLastReceivedResponse:", 0);
      v4 = v8;
    }
  }

}

- (NSString)sortingPreference
{
  return self->_sortingPreference;
}

@end
