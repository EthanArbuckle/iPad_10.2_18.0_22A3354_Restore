@implementation VUIMediaEntitiesFetchControllerResult

- (VUIMediaEntitiesFetchControllerResult)initWithFetchReason:(int64_t)a3 fetchResponses:(id)a4
{
  id v6;
  VUIMediaEntitiesFetchControllerResult *v7;
  VUIMediaEntitiesFetchControllerResult *v8;
  uint64_t v9;
  NSArray *fetchResponses;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIMediaEntitiesFetchControllerResult;
  v7 = -[VUIMediaEntitiesFetchControllerResult init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_fetchReason = a3;
    v9 = objc_msgSend(v6, "copy");
    fetchResponses = v8->_fetchResponses;
    v8->_fetchResponses = (NSArray *)v9;

  }
  return v8;
}

- (NSArray)fetchResponses
{
  return self->_fetchResponses;
}

- (VUIMediaEntitiesFetchControllerResult)init
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
  v18.super_class = (Class)VUIMediaEntitiesFetchControllerResult;
  -[VUIMediaEntitiesFetchControllerResult description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaLibraryFetchReasonLogString(-[VUIMediaEntitiesFetchControllerResult fetchReason](self, "fetchReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fetchReason"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntitiesFetchControllerResult fetchResponses](self, "fetchResponses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fetchResponses"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntitiesFetchControllerResult fetchResponseChanges](self, "fetchResponseChanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("fetchResponseChanges"), v12);
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

- (void)setFetchResponses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)fetchResponseChanges
{
  return self->_fetchResponseChanges;
}

- (void)setFetchResponseChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResponseChanges, 0);
  objc_storeStrong((id *)&self->_fetchResponses, 0);
}

@end
