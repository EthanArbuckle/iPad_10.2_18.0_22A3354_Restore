@implementation SKUIErrorDocumentViewController

- (SKUIErrorDocumentViewController)initWithBackgroundColor:(id)a3 clientContext:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIErrorDocumentViewController *v16;
  unint64_t v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIErrorDocumentViewController initWithBackgroundColor:clientContext:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIErrorDocumentViewController;
  v16 = -[SKUIErrorDocumentViewController init](&v19, sel_init);
  if (v16)
  {
    v17 = SKUIColorSchemeStyleForColor(v6);
    if (v17 <= 3)
      v16->_contentUnavailableStyle = qword_1BBED1130[v17];
    objc_storeStrong((id *)&v16->_clientContext, a4);
  }

  return v16;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  SKUIClientContext *clientContext;
  void *v7;
  void *v8;
  id v9;

  SKUIErrorDocumentTitle(self->_clientContext);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0DC40B8]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:title:style:", v9, self->_contentUnavailableStyle, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SKUIErrorDocumentViewController retryActionBlock](self, "retryActionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "setMessage:", &stru_1E73A9FB0);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NETWORK_ERROR_BUTTON_RETRY"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setButtonTitle:", v7);

    -[SKUIErrorDocumentViewController retryActionBlock](self, "retryActionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setButtonAction:", v8);

  }
  -[SKUIErrorDocumentViewController setView:](self, "setView:", v4);

}

- (id)retryActionBlock
{
  return self->_retryActionBlock;
}

- (void)setRetryActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryActionBlock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithBackgroundColor:(uint64_t)a3 clientContext:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
