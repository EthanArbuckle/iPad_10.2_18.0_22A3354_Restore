@implementation SKUINetworkErrorViewController

- (SKUINetworkErrorViewController)init
{
  return -[SKUINetworkErrorViewController initWithError:](self, "initWithError:", 0);
}

- (SKUINetworkErrorViewController)initWithError:(id)a3
{
  id v5;
  SKUINetworkErrorViewController *v6;
  SKUINetworkErrorViewController *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUINetworkErrorViewController initWithError:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUINetworkErrorViewController;
  v6 = -[SKUINetworkErrorViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DDC138];
    objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__networkTypeChanged_, v9, v10);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC138], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUINetworkErrorViewController;
  -[SKUINetworkErrorViewController dealloc](&v4, sel_dealloc);
}

+ (BOOL)canDisplayError:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  char v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == -1009)
  {
    v6 = (_QWORD *)MEMORY[0x1E0CB32E8];
  }
  else
  {
    if (v4 != 110)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = (_QWORD *)MEMORY[0x1E0DAFA28];
  }
  v7 = objc_msgSend(v5, "isEqualToString:", *v6);
LABEL_7:

  return v7;
}

- (void)loadView
{
  int v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  SKUIClientContext *clientContext;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  SKUIClientContext *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v3 = MGGetBoolAnswer();
  v4 = MGGetBoolAnswer();
  v5 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  clientContext = self->_clientContext;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (clientContext)
    {
      v9 = CFSTR("NETWORK_ERROR_TITLE_IPAD");
LABEL_6:
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v11 = CFSTR("NETWORK_ERROR_TITLE_IPAD");
  }
  else
  {
    if (clientContext)
    {
      v9 = CFSTR("NETWORK_ERROR_TITLE_IPHONE");
      goto LABEL_6;
    }
    v11 = CFSTR("NETWORK_ERROR_TITLE_IPHONE");
  }
  +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v11, 0);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = (void *)v10;
  v13 = self->_clientContext;
  v20 = v12;
  if (((v5 | v4) & 1) != 0)
  {
    if (v4)
    {
      if (v3)
      {
        if (v13)
        {
          v14 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_OR_CELL");
LABEL_26:
          -[SKUIClientContext localizedStringForKey:](v13, "localizedStringForKey:", v14);
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
        v15 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_OR_CELL");
      }
      else
      {
        if (v13)
        {
          v14 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_ONLY");
          goto LABEL_26;
        }
        v15 = CFSTR("NETWORK_ERROR_MESSAGE_WLAN_ONLY");
      }
    }
    else if (v3)
    {
      if (v13)
      {
        v14 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_OR_CELL");
        goto LABEL_26;
      }
      v15 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_OR_CELL");
    }
    else
    {
      if (v13)
      {
        v14 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_ONLY");
        goto LABEL_26;
      }
      v15 = CFSTR("NETWORK_ERROR_MESSAGE_WIFI_ONLY");
    }
  }
  else
  {
    if (v13)
    {
      v14 = CFSTR("NETWORK_ERROR_MESSAGE_CELL_ONLY");
      goto LABEL_26;
    }
    v15 = CFSTR("NETWORK_ERROR_MESSAGE_CELL_ONLY");
  }
  +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v15, 0);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_27:
  v17 = (void *)v16;
  v18 = objc_alloc(MEMORY[0x1E0DC40B8]);
  v19 = (void *)objc_msgSend(v18, "initWithFrame:title:style:", v20, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v19, "setMessage:", v17);
  -[SKUINetworkErrorViewController setView:](self, "setView:", v19);

}

- (UIScrollView)scrollView
{
  return 0;
}

- (SKUIProductPageHeaderViewController)headerViewController
{
  return 0;
}

- (void)_networkTypeChanged:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SKUINetworkErrorViewController__networkTypeChanged___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

void __54__SKUINetworkErrorViewController__networkTypeChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  char v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DDC178], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "networkType");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
      objc_msgSend(v6, "networkErrorViewControllerInvalidated:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithError:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINetworkErrorViewController initWithError:]";
}

@end
