@implementation BKPaginationFactory

- (BKPaginationFactory)initWithPaginationController:(id)a3
{
  id v4;
  BKPaginationFactory *v5;
  BKPaginationFactory *v6;

  v4 = a3;
  v5 = -[BKPaginationFactory init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_paginationController, v4);

  return v6;
}

- (id)lookupKeyForStyle:(id)a3 geometry:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  char *v10;
  void *v11;
  unsigned int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSString *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v25;
  __CFString *v26;
  void *v27;
  CGSize v28;

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "summaryString"));
  else
    v8 = CFSTR(".");
  v26 = (__CFString *)v8;
  v27 = v6;
  if (objc_msgSend(v7, "layout") == (char *)&dword_0 + 3)
  {
    v9 = CFSTR("-hscroll");
  }
  else
  {
    v10 = (char *)objc_msgSend(v7, "layout");
    v9 = CFSTR("-scroll");
    if (v10 != (_BYTE *)&dword_0 + 2)
      v9 = &stru_1C3088;
  }
  v25 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("BKUseOldFontStepsAndSpacing"));

  if (v12)
    v13 = CFSTR("-oldFontSteps");
  else
    v13 = &stru_1C3088;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bookDatabaseKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v17 = objc_msgSend(v16, "isBookSample");
  objc_msgSend(v7, "layoutSize");
  v18 = NSStringFromCGSize(v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = objc_msgSend(v7, "usePaginationLineGrid");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "paginationRevision"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%d;%@;%@;%d;%@%@%@"),
                    v15,
                    v17,
                    v26,
                    v19,
                    v20,
                    v22,
                    v25,
                    v13));

  return v23;
}

- (void)addResultSentinel:(id)a3
{
  id v4;
  BKPaginationResultsOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = [BKPaginationResultsOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookAnnotationProvider"));
  v11 = -[BKPaginationOperation init:paginationOperationController:annotationProvider:](v5, "init:paginationOperationController:annotationProvider:", v4, v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultsQueue"));
  objc_msgSend(v10, "addOperation:", v11);

}

- (void)addResultJob:(id)a3
{
  id v4;
  BKPaginationResultsOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = [BKPaginationResultsOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bookAnnotationProvider"));
  v11 = -[BKPaginationOperation init:paginationOperationController:annotationProvider:](v5, "init:paginationOperationController:annotationProvider:", v4, v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultsQueue"));
  objc_msgSend(v10, "addOperation:", v11);

}

- (BOOL)isStyleRequiredForPagination
{
  return 1;
}

- (BKPaginationController)paginationController
{
  return (BKPaginationController *)objc_loadWeakRetained((id *)&self->_paginationController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_paginationController);
}

@end
