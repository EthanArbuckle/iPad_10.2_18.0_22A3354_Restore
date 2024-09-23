@implementation TUIKTSingleAccountViewController

- (TUIKTSingleAccountViewController)initWithOptions:(id)a3
{
  id v5;
  TUIKTSingleAccountViewController *v6;
  TUIKTSingleAccountViewController *v7;

  v5 = a3;
  v6 = -[TUIKTSingleAccountViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_options, a3);

  return v7;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  TUIAccountKeySpecifierProvider *accountKeySpecifierProvider;
  TUIAccountKeySpecifierProvider *v7;
  TUIAccountKeySpecifierProvider *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
    if (!accountKeySpecifierProvider)
    {
      v7 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
      v8 = self->_accountKeySpecifierProvider;
      self->_accountKeySpecifierProvider = v7;

      -[TUIAccountKeySpecifierProvider setDelegate:](self->_accountKeySpecifierProvider, "setDelegate:", self);
      accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
    }
    -[TUIAccountKeySpecifierProvider specifiers](accountKeySpecifierProvider, "specifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    v10 = (objc_class *)objc_msgSend(v5, "copy");
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v10;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[TUIKTSingleAccountViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  else
    -[TUIKTSingleAccountViewController showViewController:sender:](self, "showViewController:sender:", v6, v7);

}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_5);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }

}

void __80__TUIKTSingleAccountViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_21);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }

}

void __80__TUIKTSingleAccountViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_22);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKTSingleAccountViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v9, v11, v5);

  }
  else
  {
    -[TUIKTSingleAccountViewController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

void __87__TUIKTSingleAccountViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_5, &__block_literal_global_23);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }

}

void __92__TUIKTSingleAccountViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_5 = (uint64_t)v0;

}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (TUIAccountKeySpecifierProvider)accountKeySpecifierProvider
{
  return self->_accountKeySpecifierProvider;
}

- (void)setAccountKeySpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeySpecifierProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
