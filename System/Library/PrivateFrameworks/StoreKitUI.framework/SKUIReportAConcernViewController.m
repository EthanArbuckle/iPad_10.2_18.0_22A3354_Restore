@implementation SKUIReportAConcernViewController

- (SKUIReportAConcernViewController)initWithConfiguration:(id)a3
{
  id v4;
  SKUIReportAConcernReasonViewController *v5;
  SKUIReportAConcernViewController *v6;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernViewController initWithConfiguration:].cold.1();
  }
  v5 = -[SKUIReportAConcernReasonViewController initWithConfiguration:]([SKUIReportAConcernReasonViewController alloc], "initWithConfiguration:", v4);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SKUIReportAConcernViewController_initWithConfiguration___block_invoke;
  v9[3] = &unk_1E73A6698;
  objc_copyWeak(&v10, &location);
  -[SKUIReportAConcernReasonViewController setCompletion:](v5, "setCompletion:", v9);
  v8.receiver = self;
  v8.super_class = (Class)SKUIReportAConcernViewController;
  v6 = -[SKUIReportAConcernViewController initWithRootViewController:](&v8, sel_initWithRootViewController_, v5);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __58__SKUIReportAConcernViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_37);

}

void __58__SKUIReportAConcernViewController_initWithConfiguration___block_invoke_2()
{
  void *v0;
  void *v1;
  SKUIToastViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SKUIToastViewController *v7;
  id v8;

  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("toast-exclamation"), v1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v2 = [SKUIToastViewController alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TOAST_CONCERN_REPORTED_PRIMARY"), &stru_1E73A9FB0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TOAST_CONCERN_REPORTED_SECONDARY"), &stru_1E73A9FB0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SKUIToastViewController initWithTitle:description:image:](v2, "initWithTitle:description:image:", v4, v6, v8);

  -[SKUIToastViewController present](v7, "present");
}

- (void)initWithConfiguration:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIReportAConcernViewController initWithConfiguration:]";
}

@end
