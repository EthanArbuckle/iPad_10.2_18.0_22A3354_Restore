@implementation SKUICountdownViewController

- (SKUICountdownViewController)initWithCountdownComponent:(id)a3 artworkLoader:(id)a4
{
  id v7;
  id v8;
  SKUICountdownViewController *v9;
  SKUICountdownViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICountdownViewController initWithCountdownComponent:artworkLoader:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUICountdownViewController;
  v9 = -[SKUICountdownViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_countdownComponent, a3);
    objc_storeStrong((id *)&v10->_artworkLoader, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  SKUIArtworkRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKUICountdownViewController;
  -[SKUICountdownViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  -[SKUICountdownComponent countdown](self->_countdownComponent, "countdown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "artworkProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc_init(SKUIArtworkRequest);
    -[SKUIArtworkRequest setDelegate:](v6, "setDelegate:", self);
    +[SSVURLDataConsumer consumer](SKUIImageDataConsumer, "consumer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtworkRequest setDataConsumer:](v6, "setDataConsumer:", v7);

    objc_msgSend(v5, "largestArtwork");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtworkRequest setURL:](v6, "setURL:", v9);

    -[SKUIResourceLoader loadResourceWithRequest:reason:](self->_artworkLoader, "loadResourceWithRequest:reason:", v6, 1);
  }
  -[SKUICountdownViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUICountdownViewController;
  -[SKUICountdownViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[SKUICountdownViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (void)loadView
{
  SKUICountdownView *v3;
  void *v4;
  SKUICountdownView *v5;

  v3 = [SKUICountdownView alloc];
  -[SKUICountdownComponent countdown](self->_countdownComponent, "countdown");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SKUICountdownView initWithCountdown:clientContext:](v3, "initWithCountdown:clientContext:", v4, self->_clientContext);

  -[SKUICountdownViewController setView:](self, "setView:", v5);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SKUICountdownViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundImage:", v5);

}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (SKUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SKUICountdownComponent)countdownComponent
{
  return self->_countdownComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_countdownComponent, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

- (void)initWithCountdownComponent:artworkLoader:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICountdownViewController initWithCountdownComponent:artworkLoader:]";
}

@end
