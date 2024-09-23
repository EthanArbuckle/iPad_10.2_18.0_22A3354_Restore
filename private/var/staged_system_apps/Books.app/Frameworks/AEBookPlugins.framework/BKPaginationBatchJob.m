@implementation BKPaginationBatchJob

+ (id)jobName
{
  return CFSTR("Paginate-One");
}

- (BKPaginationBatchJob)init
{
  BKPaginationBatchJob *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKPaginationBatchJob;
  v2 = -[BKJob init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationBatchJob jobName](BKPaginationBatchJob, "jobName"));
    -[BKJob setName:](v2, "setName:", v3);

  }
  return v2;
}

- (void)copyState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKPaginationBatchJob;
  v4 = a3;
  -[BKPaginationJob copyState:](&v10, "copyState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookDatabaseKey", v10.receiver, v10.super_class));
  -[BKPaginationBatchJob setBookDatabaseKey:](self, "setBookDatabaseKey:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lookupKey"));
  -[BKPaginationBatchJob setLookupKey:](self, "setLookupKey:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "style"));
  -[BKPaginationBatchJob setStyle:](self, "setStyle:", v7);

  objc_msgSend(v4, "pageSize");
  -[BKPaginationBatchJob setPageSize:](self, "setPageSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "historyEntities"));
  -[BKPaginationBatchJob setHistoryEntities:](self, "setHistoryEntities:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
  -[BKPaginationBatchJob setConfiguration:](self, "setConfiguration:", v9);

}

- (NSString)bookDatabaseKey
{
  return self->_bookDatabaseKey;
}

- (void)setBookDatabaseKey:(id)a3
{
  objc_storeStrong((id *)&self->_bookDatabaseKey, a3);
}

- (NSString)lookupKey
{
  return self->_lookupKey;
}

- (void)setLookupKey:(id)a3
{
  objc_storeStrong((id *)&self->_lookupKey, a3);
}

- (ContentStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (NSArray)historyEntities
{
  return self->_historyEntities;
}

- (void)setHistoryEntities:(id)a3
{
  objc_storeStrong((id *)&self->_historyEntities, a3);
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_historyEntities, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_bookDatabaseKey, 0);
  objc_storeStrong((id *)&self->_lookupKey, 0);
}

@end
