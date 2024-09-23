@implementation SKUIGiftStepViewController

- (SKUIGiftStepViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SKUIGiftStepViewController *v8;
  uint64_t v9;
  SKUIGift *gift;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftStepViewController initWithGift:configuration:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIGiftStepViewController;
  v8 = -[SKUIGiftStepViewController init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    gift = v8->_gift;
    v8->_gift = (SKUIGift *)v9;

    objc_storeStrong((id *)&v8->_giftConfiguration, a4);
  }

  return v8;
}

- (void)finishGiftingWithResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[SKUIGiftStepViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "giftDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v9 = (id)v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "giftViewController:didFinishWithResult:", v5, v3);
  }
  else
  {
    -[SKUIGiftStepViewController parentViewController](self, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      v7 = self;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (SKUIGift)gift
{
  return self->_gift;
}

- (void)loadItemArtworkWithArtworkContext:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SSVLoadURLOperation *v10;
  SSVLoadURLOperation *loadOperation;
  SSVLoadURLOperation *v12;
  void *v13;
  SSVLoadURLOperation *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[SKUIGift item](self->_gift, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && !self->_loadOperation)
  {
    objc_msgSend(v6, "URLForItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v9);
      loadOperation = self->_loadOperation;
      self->_loadOperation = v10;

      v12 = self->_loadOperation;
      objc_msgSend(v6, "dataConsumerForItem:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setDataConsumer:](v12, "setDataConsumer:", v13);

      -[SSVLoadURLOperation setITunesStoreRequest:](self->_loadOperation, "setITunesStoreRequest:", 0);
      objc_initWeak(&location, self);
      v14 = self->_loadOperation;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__SKUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke;
      v16[3] = &unk_1E73A3228;
      objc_copyWeak(&v18, &location);
      v17 = v7;
      -[SSVLoadURLOperation setOutputBlock:](v14, "setOutputBlock:", v16);
      -[SKUIGiftStepViewController operationQueue](self, "operationQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addOperation:", self->_loadOperation);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

  }
}

void __80__SKUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__SKUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke_2;
  v9[3] = &unk_1E73A3200;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __80__SKUIGiftStepViewController_loadItemArtworkWithArtworkContext_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishImageLoadWithImage:error:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_finishImageLoadWithImage:(id)a3 error:(id)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, id, id);
  SSVLoadURLOperation *loadOperation;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, id, id))a5;
  -[SSVLoadURLOperation setOutputBlock:](self->_loadOperation, "setOutputBlock:", 0);
  loadOperation = self->_loadOperation;
  self->_loadOperation = 0;

  if (v9)
    v9[2](v9, v11, v8);

}

- (SKUIGiftConfiguration)giftConfiguration
{
  return self->_giftConfiguration;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_loadOperation, 0);
  objc_storeStrong((id *)&self->_giftConfiguration, 0);
  objc_storeStrong((id *)&self->_gift, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGiftStepViewController initWithGift:configuration:]";
}

@end
