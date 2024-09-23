@implementation PBFDataRefreshState

- (PBFDataRefreshState)initWithNeedsRefresh:(BOOL)a3 reason:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  PBFDataRefreshState *v9;
  uint64_t v10;
  NSString *refreshReason;
  objc_super v13;
  uint64_t *v14;
  uint64_t v15;

  v14 = &v15;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v15);

  v13.receiver = self;
  v13.super_class = (Class)PBFDataRefreshState;
  v9 = -[PBFDataRefreshState init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    refreshReason = v9->_refreshReason;
    v9->_refreshReason = (NSString *)v10;

    v9->_needsRefresh = a3;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_needsRefresh, CFSTR("needsRefresh"));
  objc_msgSend(v3, "appendString:withName:", self->_refreshReason, CFSTR("refreshReason"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (NSString)refreshReason
{
  return self->_refreshReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshReason, 0);
}

@end
