@implementation SKUIIncompatibleAppViewController

- (SKUIIncompatibleAppViewController)initWithIncompatibleItem:(id)a3
{
  id v5;
  SKUIIncompatibleAppViewController *v6;
  SKUIIncompatibleAppViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIncompatibleAppViewController initWithIncompatibleItem:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIIncompatibleAppViewController;
  v6 = -[SKUIIncompatibleAppViewController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_incompatibleItem, a3);
    -[SKUIItem title](v7->_incompatibleItem, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIncompatibleAppViewController setTitle:](v7, "setTitle:", v8);

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SKUIIncompatibleAppView removeButtonTarget:action:forControlEvents:](self->_incompatibleView, "removeButtonTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SKUIIncompatibleAppViewController;
  -[SKUIViewController dealloc](&v3, sel_dealloc);
}

- (UIScrollView)scrollView
{
  return 0;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  SSVLoadURLOperation *v5;
  SSVLoadURLOperation *loadIconOperation;
  SSVLoadURLOperation *v7;
  void *v8;
  SSVLoadURLOperation *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;

  if (!self->_iconImage && !self->_loadIconOperation)
  {
    -[SKUIIncompatibleAppViewController _artworkContext](self, "_artworkContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForItem:", self->_incompatibleItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (SSVLoadURLOperation *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v4);
      loadIconOperation = self->_loadIconOperation;
      self->_loadIconOperation = v5;

      v7 = self->_loadIconOperation;
      objc_msgSend(v3, "dataConsumerForItem:", self->_incompatibleItem);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVLoadURLOperation setDataConsumer:](v7, "setDataConsumer:", v8);

      -[SSVLoadURLOperation setITunesStoreRequest:](self->_loadIconOperation, "setITunesStoreRequest:", 0);
      -[SSVLoadURLOperation setQueuePriority:](self->_loadIconOperation, "setQueuePriority:", 4);
      objc_initWeak(&location, self);
      v9 = self->_loadIconOperation;
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __47__SKUIIncompatibleAppViewController_reloadData__block_invoke;
      v14 = &unk_1E73A1EE0;
      objc_copyWeak(&v15, &location);
      -[SSVLoadURLOperation setOutputBlock:](v9, "setOutputBlock:", &v11);
      -[SKUIIncompatibleAppViewController operationQueue](self, "operationQueue", v11, v12, v13, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addOperation:", self->_loadIconOperation);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

  }
}

void __47__SKUIIncompatibleAppViewController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKUIIncompatibleAppViewController_reloadData__block_invoke_2;
  block[3] = &unk_1E73A1D50;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __47__SKUIIncompatibleAppViewController_reloadData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setArtworkWithImage:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)loadView
{
  SKUIIncompatibleAppView *incompatibleView;
  void *v4;
  SKUIIncompatibleAppView *v5;
  SKUIIncompatibleAppView *v6;
  SKUIIncompatibleAppView *v7;
  void *v8;
  SKUIProductPageItem *incompatibleItem;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  SKUIIncompatibleAppView *v16;
  void *v17;
  void *v18;
  void *v19;
  SKUIIncompatibleAppView *v20;
  void *v21;
  void *v22;
  void *v23;
  SKUIIncompatibleAppView *v24;
  void *v25;
  void *v26;
  void *v27;
  SKUIIncompatibleAppView *v28;
  void *v29;
  void *v30;
  void *v31;
  SKUIIncompatibleAppView *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;

  incompatibleView = self->_incompatibleView;
  if (!incompatibleView)
  {
    -[SKUIViewController clientContext](self, "clientContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(SKUIIncompatibleAppView);
    v6 = self->_incompatibleView;
    self->_incompatibleView = v5;

    v7 = self->_incompatibleView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIncompatibleAppView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    incompatibleItem = self->_incompatibleItem;
    if (!incompatibleItem)
    {
LABEL_29:

      incompatibleView = self->_incompatibleView;
      goto LABEL_30;
    }
    v35 = -[SKUIItem itemKind](incompatibleItem, "itemKind");
    v36 = v4;
    if (v35 == 5)
    {
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("INCOMPATIBLE_MAC_APP_TITLE"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("INCOMPATIBLE_MAC_APP_TITLE"), 0, CFSTR("ProductPage"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v12 = CFSTR("INCOMPATIBLE_MAC_APP_MESSAGE");
LABEL_14:
        objc_msgSend(v4, "localizedStringForKey:inTable:", v12, CFSTR("ProductPage"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v15 = (void *)v13;
        v16 = self->_incompatibleView;
        v17 = (void *)MEMORY[0x1E0CB3940];
        -[SKUIIncompatibleAppViewController title](self, "title");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithValidatedFormat:validFormatSpecifiers:error:", v37, CFSTR("%@"), 0, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIIncompatibleAppView setTitle:](v16, "setTitle:", v19);

        v20 = self->_incompatibleView;
        v21 = (void *)MEMORY[0x1E0CB3940];
        -[SKUIIncompatibleAppViewController title](self, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIIncompatibleAppView setMessage:](v20, "setMessage:", v23);

        v24 = self->_incompatibleView;
        -[SKUIIncompatibleAppViewController _artworkContext](self, "_artworkContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "placeholderImageForItem:", self->_incompatibleItem);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIIncompatibleAppView setIconImage:](v24, "setIconImage:", v26);

        v4 = v36;
        v27 = v15;
        if (v35 != 5)
        {
          v28 = self->_incompatibleView;
          if (v36)
            objc_msgSend(v36, "localizedStringForKey:inTable:", CFSTR("INCOMPATIBLE_LEARN_MORE_ABOUT_IPAD"), CFSTR("ProductPage"));
          else
            +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("INCOMPATIBLE_LEARN_MORE_ABOUT_IPAD"), 0, CFSTR("ProductPage"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIIncompatibleAppView addButtonWithTitle:](v28, "addButtonWithTitle:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "addTarget:action:forControlEvents:", self, sel__learnMoreAboutIPad_, 64);
        }
        -[SKUIProductPageItem supportURLString](self->_incompatibleItem, "supportURLString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = self->_incompatibleView;
          if (v36)
            objc_msgSend(v36, "localizedStringForKey:inTable:", CFSTR("INCOMPATIBLE_LEARN_MORE_ABOUT_APP"), CFSTR("ProductPage"));
          else
            +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("INCOMPATIBLE_LEARN_MORE_ABOUT_APP"), 0, CFSTR("ProductPage"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKUIIncompatibleAppView addButtonWithTitle:](v32, "addButtonWithTitle:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addTarget:action:forControlEvents:", self, sel__learnMoreAboutApp_, 64);
        }

        goto LABEL_29;
      }
      v14 = CFSTR("INCOMPATIBLE_MAC_APP_MESSAGE");
    }
    else
    {
      -[SKUIViewController clientContext](self, "clientContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        objc_msgSend(v10, "localizedStringForKey:inTable:", CFSTR("INCOMPATIBLE_IPAD_APP_TITLE"), CFSTR("ProductPage"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("INCOMPATIBLE_IPAD_APP_TITLE"), 0, CFSTR("ProductPage"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v12 = CFSTR("INCOMPATIBLE_IPAD_APP_MESSAGE");
        goto LABEL_14;
      }
      v14 = CFSTR("INCOMPATIBLE_IPAD_APP_MESSAGE");
    }
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v14, 0, CFSTR("ProductPage"));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_30:
  -[SKUIIncompatibleAppViewController setView:](self, "setView:", incompatibleView);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SKUIIncompatibleAppViewController reloadData](self, "reloadData");
  v5.receiver = self;
  v5.super_class = (Class)SKUIIncompatibleAppViewController;
  -[SKUIViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)_learnMoreAboutApp:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SKUIProductPageItem supportURLString](self->_incompatibleItem, "supportURLString", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
    v5 = v4;
    if (v4)
      SKUIMetricsOpenURL(v4);

    v3 = v6;
  }

}

- (void)_learnMoreAboutIPad:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("http://apple.com/ipad"));
  SKUIMetricsOpenURL(v3);

}

- (id)_artworkContext
{
  SKUIItemArtworkContext *artworkContext;
  SKUIItemArtworkContext *v4;
  SKUIItemArtworkContext *v5;

  artworkContext = self->_artworkContext;
  if (!artworkContext)
  {
    +[SKUIItemArtworkContext lockupContextWithSize:](SKUIItemArtworkContext, "lockupContextWithSize:", 3);
    v4 = (SKUIItemArtworkContext *)objc_claimAutoreleasedReturnValue();
    v5 = self->_artworkContext;
    self->_artworkContext = v4;

    artworkContext = self->_artworkContext;
  }
  return artworkContext;
}

- (void)_setArtworkWithImage:(id)a3 error:(id)a4
{
  SSVLoadURLOperation *loadIconOperation;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
    -[SKUIIncompatibleAppView setIconImage:](self->_incompatibleView, "setIconImage:", self->_iconImage);
  }
  loadIconOperation = self->_loadIconOperation;
  self->_loadIconOperation = 0;

}

- (SKUIProductPageChildViewControllerDelegate)delegate
{
  return (SKUIProductPageChildViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return self->_headerViewController;
}

- (void)setHeaderViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerViewController, a3);
}

- (SKUIProductPageItem)incompatibleItem
{
  return self->_incompatibleItem;
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
  objc_storeStrong((id *)&self->_incompatibleView, 0);
  objc_storeStrong((id *)&self->_loadIconOperation, 0);
  objc_storeStrong((id *)&self->_incompatibleItem, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_artworkContext, 0);
}

- (void)initWithIncompatibleItem:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIncompatibleAppViewController initWithIncompatibleItem:]";
}

@end
