@implementation SKUIToastPresentationWindow

- (SKUIToastPresentationWindow)init
{
  SKUIToastPresentationWindow *v3;
  SKUIToastPresentationWindow *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToastPresentationWindow init].cold.1();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIToastPresentationWindow;
  v3 = -[UIApplicationRotationFollowingWindow init](&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    -[SKUIToastPresentationWindow setOpaque:](v3, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIToastPresentationWindow setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIToastPresentationWindow setScreen:](v4, "setScreen:", v6);

    -[SKUIToastPresentationWindow setWindowLevel:](v4, "setWindowLevel:", *MEMORY[0x1E0DC5628]);
    -[SKUIToastPresentationWindow setHidden:](v4, "setHidden:", 1);
  }
  return v4;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SKUIToastPresentationWindow _presentationViewController](self, "_presentationViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__SKUIToastPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E73A1618;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, v5, v12);

}

uint64_t __73__SKUIToastPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, BOOL);
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = (void (**)(id, BOOL))a5;
  -[SKUIToastPresentationWindow _presentationViewController](self, "_presentationViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v8)
      v8[2](v8, v10 == v11);
  }
  else
  {
    -[SKUIToastPresentationWindow presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, v6, v8);
  }

}

- (id)_presentationViewController
{
  void *v3;
  id v4;

  -[SKUIToastPresentationWindow rootViewController](self, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3478]);
    objc_msgSend(v4, "setSizesWindowToScene:", 1);
    -[SKUIToastPresentationWindow setRootViewController:](self, "setRootViewController:", v4);

  }
  return (id)-[SKUIToastPresentationWindow rootViewController](self, "rootViewController");
}

- (void)init
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIToastPresentationWindow init]";
}

@end
