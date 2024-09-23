@implementation EpubPaginationFactory

- (EpubPaginationFactory)initWithPaginationController:(id)a3
{
  id v4;
  EpubPaginationFactory *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *respectImageSizeClass;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EpubPaginationFactory;
  v5 = -[BKPaginationFactory initWithPaginationController:](&v13, "initWithPaginationController:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "book"));
    v5->_isFixedLayout = objc_msgSend(v6, "isFixedLayout");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "book"));
    v5->_respectsPageBreaks = objc_msgSend(v7, "obeyPageBreaks");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "book"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "respectImageSizeClass"));
    respectImageSizeClass = v5->_respectImageSizeClass;
    v5->_respectImageSizeClass = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "book"));
    v5->_respectImageSizeClassIsPrefix = objc_msgSend(v11, "respectImageSizeClassIsPrefix");

  }
  return v5;
}

- (id)lookupKeyForStyle:(id)a3 geometry:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  objc_super v12;

  if (self->_isFixedLayout)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController", a3, a4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookDatabaseKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "paginationRevision"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v6, v8));

    return v9;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)EpubPaginationFactory;
    v11 = -[BKPaginationFactory lookupKeyForStyle:geometry:](&v12, "lookupKeyForStyle:geometry:", a3, a4);
    return (id)objc_claimAutoreleasedReturnValue(v11);
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EpubPaginationFactory;
  -[EpubPaginationFactory dealloc](&v4, "dealloc");
}

- (void)quit
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)EpubPaginationFactory;
  -[BKPaginationFactory quit](&v2, "quit");
}

- (void)addPrepareJob:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  BKPictureBookPaginationOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a3;
  if (!self->_isFixedLayout)
  {
    v5 = _BookEPUBLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[EpubPaginationFactory addPrepareJob:]"));
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_FAULT, "Only Pagination Jobs for fixed layout content should go through %@", (uint8_t *)&v15, 0xCu);

    }
  }
  v8 = [BKPictureBookPaginationOperation alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bookAnnotationProvider"));
  v12 = -[BKPaginationOperation init:paginationOperationController:annotationProvider:](v8, "init:paginationOperationController:annotationProvider:", v4, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationFactory paginationController](self, "paginationController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "prepareQueue"));
  objc_msgSend(v14, "addOperation:", v12);

}

- (BOOL)isStyleRequiredForPagination
{
  return !self->_isFixedLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_respectImageSizeClass, 0);
}

@end
