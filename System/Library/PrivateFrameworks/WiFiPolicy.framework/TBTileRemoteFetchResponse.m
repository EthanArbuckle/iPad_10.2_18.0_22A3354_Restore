@implementation TBTileRemoteFetchResponse

+ (id)responseWithTileItems:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTileItems:", v4);

  return v5;
}

- (TBTileRemoteFetchResponse)initWithTileItems:(id)a3
{
  id v4;
  void *v5;
  TBError *v6;
  TBError *v7;
  void *v8;
  TBTileRemoteFetchResponse *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = 0;
  }
  else
  {
    v7 = [TBError alloc];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("No results returned from remote source");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[TBError initWithType:userInfo:](v7, "initWithType:userInfo:", 154, v8);

  }
  v11.receiver = self;
  v11.super_class = (Class)TBTileRemoteFetchResponse;
  v9 = -[TBRemoteFetchResponse initWithResults:tiles:error:](&v11, sel_initWithResults_tiles_error_, 0, v5, v6);

  return v9;
}

@end
