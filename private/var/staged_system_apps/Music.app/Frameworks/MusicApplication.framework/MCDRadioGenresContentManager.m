@implementation MCDRadioGenresContentManager

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioGenresContentManager genreCategories](self, "genreCategories"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager lastReceivedResponse](self, "lastReceivedResponse"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __48__MCDRadioGenresContentManager_itemAtIndexPath___block_invoke;
    v18[3] = &unk_133A190;
    v19 = v6;
    v9 = v6;
    objc_msgSend(v8, "enumerateSectionsUsingBlock:", v18);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayFromArray:collationStringSelector:", v9, "title"));
    -[MCDRadioGenresContentManager setGenreCategories:](self, "setGenreCategories:", v11);

  }
  v12 = objc_msgSend(v4, "row");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioGenresContentManager genreCategories](self, "genreCategories"));
  v14 = objc_msgSend(v13, "count");

  if (v12 >= v14)
  {
    v16 = 0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCDRadioGenresContentManager genreCategories](self, "genreCategories"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

  }
  return v16;
}

id __48__MCDRadioGenresContentManager_itemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

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

  v3 = objc_alloc_init((Class)MPModelStoreBrowseRequest);
  objc_msgSend(v3, "setFilteringPolicy:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "parentSection");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentSection"));
    objc_msgSend(v3, "configureWithParentSection:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v9 = objc_opt_respondsToSelector(v8, "domain");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    objc_msgSend(v3, "setDomain:", objc_msgSend(v10, "domain"));

  }
  return v3;
}

- (NSArray)genreCategories
{
  return self->_genreCategories;
}

- (void)setGenreCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreCategories, 0);
}

@end
