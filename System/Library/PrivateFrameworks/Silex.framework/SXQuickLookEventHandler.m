@implementation SXQuickLookEventHandler

- (SXQuickLookEventHandler)initWithInteractor:(id)a3 router:(id)a4
{
  id v7;
  id v8;
  SXQuickLookEventHandler *v9;
  SXQuickLookEventHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookEventHandler;
  v9 = -[SXQuickLookEventHandler init](&v12, sel_init);
  v10 = v9;
  if (v7)
  {
    objc_storeStrong((id *)&v9->_interactor, a3);
    objc_storeStrong((id *)&v10->_router, a4);
  }

  return v10;
}

- (void)requestThumbnailWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[SXQuickLookEventHandler interactor](self, "interactor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadThumbnailWithSize:", width, height);

}

- (void)didTapThumbnailView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SXQuickLookTransitionContext *v8;

  v4 = a3;
  v8 = -[SXQuickLookTransitionContext initWithOriginView:]([SXQuickLookTransitionContext alloc], "initWithOriginView:", v4);

  -[SXQuickLookEventHandler router](self, "router");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookEventHandler interactor](self, "interactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "file");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentFile:transitionContext:", v7, v8);

}

- (void)didLoadThumbnail:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SXQuickLookEventHandler_didLoadThumbnail___block_invoke;
  v6[3] = &unk_24D687408;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __44__SXQuickLookEventHandler_didLoadThumbnail___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showThumbnailImage:", *(_QWORD *)(a1 + 40));

}

- (void)failedToLoadThumbnail
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SXQuickLookEventHandler_failedToLoadThumbnail__block_invoke;
  block[3] = &unk_24D6874A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__SXQuickLookEventHandler_failedToLoadThumbnail__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SXBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Failed to load thumbnail"), &stru_24D68E0F8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showThumbnailErrorWithMessage:", v2);

}

- (SXQuickLookEventHandlerDelegate)delegate
{
  return (SXQuickLookEventHandlerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SXQuickLookInteractor)interactor
{
  return self->_interactor;
}

- (SXQuickLookRouter)router
{
  return self->_router;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_router, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
