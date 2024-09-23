@implementation SXQuickLookInteractor

- (SXQuickLookInteractor)initWithFile:(id)a3 service:(id)a4
{
  id v7;
  id v8;
  SXQuickLookInteractor *v9;
  SXQuickLookInteractor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookInteractor;
  v9 = -[SXQuickLookInteractor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    objc_storeStrong((id *)&v10->_service, a4);
  }

  return v10;
}

- (void)loadThumbnailWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  height = a3.height;
  width = a3.width;
  objc_initWeak(&location, self);
  -[SXQuickLookInteractor service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookInteractor file](self, "file");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke;
  v11[3] = &unk_24D68DB48;
  objc_copyWeak(&v12, &location);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke_2;
  v9[3] = &unk_24D68A650;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "fetchThumbnailForFile:size:onCompletion:onError:", v7, v11, v9, width, height);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didLoadThumbnail:", v3);

}

void __47__SXQuickLookInteractor_loadThumbnailWithSize___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "failedToLoadThumbnail");

}

- (SXQuickLookInteractorDelegate)delegate
{
  return (SXQuickLookInteractorDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SXQuickLookFile)file
{
  return self->_file;
}

- (SXQuickLookService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
