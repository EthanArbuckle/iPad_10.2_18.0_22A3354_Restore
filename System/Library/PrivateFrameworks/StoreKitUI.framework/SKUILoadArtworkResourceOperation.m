@implementation SKUILoadArtworkResourceOperation

- (SKUILoadArtworkResourceOperation)initWithResourceRequest:(id)a3
{
  id v4;
  SKUILoadArtworkResourceOperation *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILoadArtworkResourceOperation initWithResourceRequest:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadArtworkResourceOperation;
  v5 = -[SKUILoadResourceOperation initWithResourceRequest:](&v7, sel_initWithResourceRequest_, v4);

  return v5;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  -[SKUILoadResourceOperation resourceRequest](self, "resourceRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DAF698]);
    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithURL:", v7);

    objc_msgSend(v3, "dataConsumer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataConsumer:", v9);

    objc_msgSend(v8, "setITunesStoreRequest:", 0);
    objc_msgSend(v8, "setRecordsMetrics:", 0);
    -[SKUILoadResourceOperation outputBlock](self, "outputBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOutputBlock:", v10);

    -[SKUILoadArtworkResourceOperation setUnderlyingOperation:](self, "setUnderlyingOperation:", v8);
    objc_msgSend(v8, "main");

  }
  else if (v4)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__81;
    v30 = __Block_byref_object_dispose__81;
    v31 = 0;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v11 = (void *)MEMORY[0x1E0DC3870];
      SKUIBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "imageNamed:inBundle:", v4, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v27[5];
      v27[5] = v13;

    }
    else
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __40__SKUILoadArtworkResourceOperation_main__block_invoke;
      v23 = &unk_1E73A0270;
      v25 = &v26;
      v24 = v4;
      dispatch_sync(MEMORY[0x1E0C80D38], &v20);
      v12 = v24;
    }

    if ((-[SKUILoadArtworkResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      objc_msgSend(v3, "dataConsumer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "imageForImage:", v27[5]);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v27[5];
        v27[5] = v17;

      }
      -[SKUILoadResourceOperation outputBlock](self, "outputBlock", v20, v21, v22, v23);
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      if (v19 && (-[SKUILoadArtworkResourceOperation isCancelled](self, "isCancelled") & 1) == 0)
        v19[2](v19, v27[5], 0);

    }
    _Block_object_dispose(&v26, 8);

  }
}

void __40__SKUILoadArtworkResourceOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = *(_QWORD *)(a1 + 32);
  SKUIBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", v3, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUILoadArtworkResourceOperation;
  -[SKUILoadResourceOperation cancel](&v4, sel_cancel);
  -[SKUILoadArtworkResourceOperation underlyingOperation](self, "underlyingOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (SSVLoadURLOperation)underlyingOperation
{
  return (SSVLoadURLOperation *)objc_loadWeakRetained((id *)&self->_underlyingOperation);
}

- (void)setUnderlyingOperation:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingOperation, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_underlyingOperation);
}

- (void)initWithResourceRequest:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadArtworkResourceOperation initWithResourceRequest:]";
}

@end
