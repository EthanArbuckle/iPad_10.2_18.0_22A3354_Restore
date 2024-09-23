@implementation VUIMediaItemEntityTypesFetchControllerResult

- (VUIMediaItemEntityTypesFetchControllerResult)init
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

- (VUIMediaItemEntityTypesFetchControllerResult)initWithFetchReason:(int64_t)a3 fetchResponse:(id)a4
{
  id v7;
  VUIMediaItemEntityTypesFetchControllerResult *v8;
  VUIMediaItemEntityTypesFetchControllerResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaItemEntityTypesFetchControllerResult;
  v8 = -[VUIMediaItemEntityTypesFetchControllerResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_fetchReason = a3;
    objc_storeStrong((id *)&v8->_fetchResponse, a4);
  }

  return v9;
}

- (id)description
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
  void *v16;
  objc_super v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18.receiver = self;
  v18.super_class = (Class)VUIMediaItemEntityTypesFetchControllerResult;
  -[VUIMediaItemEntityTypesFetchControllerResult description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaLibraryFetchReasonLogString(-[VUIMediaItemEntityTypesFetchControllerResult fetchReason](self, "fetchReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fetchReason"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemEntityTypesFetchControllerResult fetchResponse](self, "fetchResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fetchResponse"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemEntityTypesFetchControllerResult fetchChanges](self, "fetchChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fetchChanges"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@>"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (void)setFetchReason:(int64_t)a3
{
  self->_fetchReason = a3;
}

- (VUIMediaItemEntityTypesFetchResponse)fetchResponse
{
  return self->_fetchResponse;
}

- (void)setFetchResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResponse, a3);
}

- (VUIMediaItemEntityTypesFetchResponseChanges)fetchChanges
{
  return self->_fetchChanges;
}

- (void)setFetchChanges:(id)a3
{
  objc_storeStrong((id *)&self->_fetchChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchChanges, 0);
  objc_storeStrong((id *)&self->_fetchResponse, 0);
}

@end
