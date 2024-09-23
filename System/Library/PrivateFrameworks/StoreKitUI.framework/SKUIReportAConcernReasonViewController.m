@implementation SKUIReportAConcernReasonViewController

- (SKUIReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIReportAConcernConfiguration *v13;
  SKUIReportAConcernReasonViewController *v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIReportAConcernReasonViewController initWithNibName:bundle:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v14 = -[SKUIReportAConcernReasonViewController initWithConfiguration:](self, "initWithConfiguration:", v13);

  return v14;
}

- (SKUIReportAConcernReasonViewController)initWithCoder:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIReportAConcernConfiguration *v12;
  SKUIReportAConcernReasonViewController *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIReportAConcernReasonViewController initWithCoder:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_alloc_init(SKUIReportAConcernConfiguration);
  v13 = -[SKUIReportAConcernReasonViewController initWithConfiguration:](self, "initWithConfiguration:", v12);

  return v13;
}

- (SKUIReportAConcernReasonViewController)initWithConfiguration:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIReportAConcernReasonViewController *v14;
  SKUIReportAConcernReasonViewController *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIReportAConcernReasonViewController initWithConfiguration:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIReportAConcernReasonViewController;
  v14 = -[SKUIReportAConcernReasonViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_configuration, a3);

  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  SKUIReportAConcernReasonDataSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SKUIReportAConcernReasonViewController;
  -[SKUIReportAConcernReasonViewController viewDidLoad](&v25, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REPORT_A_CONCERN"), &stru_1E73A9FB0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernReasonViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_1E73A9FB0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 0, 0, 0);
  -[SKUIReportAConcernReasonViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackBarButtonItem:", v8);

  v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E73A9FB0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, sel_cancelPressed_);
  -[SKUIReportAConcernReasonViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLeftBarButtonItem:", v13);

  v15 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v16 = (void *)objc_msgSend(v15, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v16, "setDelegate:", self);
  v17 = -[SKUIReportAConcernReasonDataSource initWithTableView:]([SKUIReportAConcernReasonDataSource alloc], "initWithTableView:", v16);
  -[SKUIReportAConcernReasonViewController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reasons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernReasonDataSource setReasons:](v17, "setReasons:", v19);

  -[SKUIReportAConcernReasonViewController configuration](self, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "selectReasonTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernReasonDataSource setSelectReasonTitle:](v17, "setSelectReasonTitle:", v21);

  -[SKUIReportAConcernReasonViewController configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "selectReasonSubtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernReasonDataSource setSelectReasonSubtitle:](v17, "setSelectReasonSubtitle:", v23);

  objc_msgSend(v16, "setDataSource:", v17);
  -[SKUIReportAConcernReasonViewController setDataSource:](self, "setDataSource:", v17);
  -[SKUIReportAConcernReasonViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addSubview:", v16);

  -[SKUIReportAConcernReasonViewController setTableView:](self, "setTableView:", v16);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SKUIReportAConcernReasonViewController;
  -[SKUIReportAConcernReasonViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[SKUIReportAConcernReasonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SKUIReportAConcernReasonViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)cancelPressed:(id)a3
{
  -[SKUIReportAConcernReasonViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SKUIReportAConcernDetailsViewController *v12;
  SKUIReportAConcernMetadata *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[SKUIReportAConcernReasonViewController configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[SKUIReportAConcernReasonViewController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = -[SKUIReportAConcernDetailsViewController initWithConfiguration:]([SKUIReportAConcernDetailsViewController alloc], "initWithConfiguration:", v11);
  v13 = objc_alloc_init(SKUIReportAConcernMetadata);
  -[SKUIReportAConcernMetadata setSelectedReason:](v13, "setSelectedReason:", v17);
  -[SKUIReportAConcernMetadata setItemIdentifier:](v13, "setItemIdentifier:", objc_msgSend(v11, "itemIdentifier"));
  objc_msgSend(v11, "reportConcernURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernMetadata setReportConcernURL:](v13, "setReportConcernURL:", v14);

  -[SKUIReportAConcernDetailsViewController setMetadata:](v12, "setMetadata:", v13);
  -[SKUIReportAConcernReasonViewController completion](self, "completion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIReportAConcernDetailsViewController setCompletion:](v12, "setCompletion:", v15);

  -[SKUIReportAConcernReasonViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pushViewController:animated:", v12, 1);

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (SKUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (SKUIReportAConcernReasonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)initWithNibName:(uint64_t)a3 bundle:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
