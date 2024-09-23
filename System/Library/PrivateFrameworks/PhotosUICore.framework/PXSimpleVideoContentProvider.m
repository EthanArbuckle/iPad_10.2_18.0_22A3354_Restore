@implementation PXSimpleVideoContentProvider

- (PXSimpleVideoContentProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSimpleVideoContentProvider.m"), 20, CFSTR("%s is not available as initializer"), "-[PXSimpleVideoContentProvider init]");

  abort();
}

- (PXSimpleVideoContentProvider)initWithPlayerItem:(id)a3 contentIdentifier:(id)a4
{
  id v6;
  id v7;
  PXSimpleVideoContentProvider *v8;
  PXVideoContentProviderLoadingResult *v9;
  __int128 v10;
  uint64_t v11;
  PXVideoContentProviderLoadingResult *loadingResult;
  _OWORD v14[3];
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXSimpleVideoContentProvider;
  v8 = -[PXSimpleVideoContentProvider init](&v15, sel_init);
  if (v8)
  {
    v9 = [PXVideoContentProviderLoadingResult alloc];
    v10 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
    v14[0] = *MEMORY[0x1E0CA2E40];
    v14[1] = v10;
    v14[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
    v11 = -[PXVideoContentProviderLoadingResult initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:](v9, "initWithPlayerItem:url:timeRange:timeRangeMapper:error:priority:description:", v6, 0, v14, 0, 0, 3, &stru_1E5149688);
    loadingResult = v8->_loadingResult;
    v8->_loadingResult = (PXVideoContentProviderLoadingResult *)v11;

    objc_storeStrong((id *)&v8->_contentIdentifier, a4);
    v8->_loadingProgress = 1.0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PXSimpleVideoContentProvider;
  -[PXSimpleVideoContentProvider description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSimpleVideoContentProvider loadingResult](self, "loadingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, Result: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadingResult
{
  return self->_loadingResult;
}

- (void)setLoadingResult:(id)a3
{
  objc_storeStrong((id *)&self->_loadingResult, a3);
}

- (id)contentIdentifier
{
  return self->_contentIdentifier;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (void)setLoadingProgress:(double)a3
{
  self->_loadingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_loadingResult, 0);
}

@end
