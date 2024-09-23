@implementation SKUIProductReviewURLProvider

- (SKUIProductReviewURLProvider)init
{
  SKUIClientContext *v3;
  SKUIProductReviewURLProvider *v4;

  v3 = objc_alloc_init(SKUIClientContext);
  v4 = -[SKUIProductReviewURLProvider initWithClientContext:itemID:](self, "initWithClientContext:itemID:", v3, &stru_1E73A9FB0);

  return v4;
}

- (SKUIProductReviewURLProvider)initWithClientContext:(id)a3 itemID:(id)a4
{
  id v6;
  id v7;
  SKUIProductReviewURLProvider *v8;
  SKUIProductReviewURLProvider *v9;
  uint64_t v10;
  SSURLBag *urlBag;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductReviewURLProvider;
  v8 = -[SKUIProductReviewURLProvider init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemID, a4);
    objc_msgSend(v6, "URLBag");
    v10 = objc_claimAutoreleasedReturnValue();
    urlBag = v9->_urlBag;
    v9->_urlBag = (SSURLBag *)v10;

  }
  return v9;
}

- (void)fetchURLsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SKUIProductReviewURLProvider urlBag](self, "urlBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke;
  v7[3] = &unk_1E73A4728;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v7[4] = self;
  v8 = v6;
  objc_msgSend(v5, "loadValueForKey:completionBlock:", CFSTR("p2-application-user-rate-content"), v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[6];
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "_urlByAppendingItemId:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setRateURL:", v8);

    }
  }
  objc_msgSend(WeakRetained, "urlBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke_2;
  v12[3] = &unk_1E73A4700;
  v12[4] = WeakRetained;
  v10 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v10;
  v12[5] = *(_QWORD *)(a1 + 32);
  v11 = v6;
  objc_msgSend(v9, "loadValueForKey:completionBlock:", CFSTR("p2-application-user-write-review"), v12);

}

void __56__SKUIProductReviewURLProvider_fetchURLsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_urlByAppendingItemId:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setWriteReviewURL:", v6);

    }
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, BOOL))(v7 + 16))(v7, *(_QWORD *)(a1 + 40), (v5 | *(_QWORD *)(a1 + 48)) == 0);

}

- (id)_urlByAppendingItemId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB39D8];
  -[SKUIProductReviewURLProvider itemID](self, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("id"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v9);

  objc_msgSend(v4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSURL)rateURL
{
  return self->_rateURL;
}

- (void)setRateURL:(id)a3
{
  objc_storeStrong((id *)&self->_rateURL, a3);
}

- (NSURL)writeReviewURL
{
  return self->_writeReviewURL;
}

- (void)setWriteReviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_writeReviewURL, a3);
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SSURLBag)urlBag
{
  return self->_urlBag;
}

- (void)setUrlBag:(id)a3
{
  objc_storeStrong((id *)&self->_urlBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_writeReviewURL, 0);
  objc_storeStrong((id *)&self->_rateURL, 0);
}

@end
