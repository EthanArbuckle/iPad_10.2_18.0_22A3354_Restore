@implementation BKPaginationResultsOperation

- (BOOL)needsBookManagedObjectContext
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v3 = objc_msgSend(v2, "isSentinel") ^ 1;

  return v3;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationAbortJob jobName](BKPaginationAbortJob, "jobName"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = _BookEPUBLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_FAULT, "Only we only expect to get abort jobs in this flow but we got %@", (uint8_t *)&v21, 0xCu);

    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
  v12 = objc_msgSend(v11, "isSentinel");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationBatchEndJob jobName](BKPaginationBatchEndJob, "jobName"));
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation paginationOperationController](self, "paginationOperationController"));
      objc_msgSend(v17, "batchEnded:", -[BKPaginationOperation isJobGenerationValid](self, "isJobGenerationValid"));

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKPaginationOperation job](self, "job"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationAbortJob jobName](BKPaginationAbortJob, "jobName"));
      objc_msgSend(v19, "isEqualToString:", v20);

    }
  }
  else
  {
    -[BKPaginationOperation isJobGenerationValid](self, "isJobGenerationValid");
  }
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BKPaginationResultsOperation;
  -[BKPaginationOperation cancel](&v2, "cancel");
}

@end
