@implementation VUIPlistMediaItemEntityTypesOperation

- (VUIPlistMediaItemEntityTypesOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIPlistMediaItemEntityTypesOperation)initWithDatabase:(id)a3
{
  id v5;
  VUIPlistMediaItemEntityTypesOperation *v6;
  VUIPlistMediaItemEntityTypesOperation *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("database"));
  v9.receiver = self;
  v9.super_class = (Class)VUIPlistMediaItemEntityTypesOperation;
  v6 = -[VUIPlistMediaItemEntityTypesOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_database, a3);

  return v7;
}

- (void)executionDidBegin
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  VUIMediaItemEntityTypesFetchResponse *v17;
  void *v18;
  id v19;

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  -[VUIPlistMediaItemEntityTypesOperation database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "episodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    objc_msgSend(v19, "addObjectsFromArray:", v5);
  }
  objc_msgSend(v4, "homeVideos", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

    objc_msgSend(v19, "addObjectsFromArray:", v7);
  }
  objc_msgSend(v4, "movies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

    objc_msgSend(v19, "addObjectsFromArray:", v9);
  }
  objc_msgSend(v4, "movieRentals");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    objc_msgSend(v19, "addObjectsFromArray:", v11);
  }
  +[VUIMediaLibraryUtilities mediaItemEntityTypesSortComparator](VUIMediaLibraryUtilities, "mediaItemEntityTypesSortComparator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortUsingComparator:", v13);

  objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("isLocal"), MEMORY[0x1E0C9AAB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") != 0;
  v17 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
  -[VUIMediaItemEntityTypesFetchResponse setMediaItemEntityTypes:](v17, "setMediaItemEntityTypes:", v3);
  -[VUIMediaItemEntityTypesFetchResponse setLocalMediaItemsAvailable:](v17, "setLocalMediaItemsAvailable:", v16);
  -[VUIPlistMediaItemEntityTypesOperation setResponse:](self, "setResponse:", v17);
  -[VUIAsynchronousOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");

}

- (VUIMediaItemEntityTypesFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (VUIPlistMediaDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
