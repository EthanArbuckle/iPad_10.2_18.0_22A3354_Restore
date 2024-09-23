@implementation PKAMSEnagementMessageCell

- (void)setMessage:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_message, a3);
  if (self->_message)
  {
    objc_initWeak(&location, self);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __40__PKAMSEnagementMessageCell_setMessage___block_invoke;
    v10 = &unk_1E3E61310;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "setActionOnViewed:", &v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v5, "dialogRequest", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAMSEnagementMessageCell displayDialogRequest:](self, "displayDialogRequest:", v6);

}

void __40__PKAMSEnagementMessageCell_setMessage___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[128], "enqueueImpressionMetrics");
    WeakRetained = v2;
  }

}

- (void)displayDialogRequest:(id)a3
{
  id v4;
  AMSUIDashboardMessageViewController *dashboardMessageController;
  void *v6;
  AMSUIDashboardMessageViewController *v7;
  AMSUIDashboardMessageViewController *v8;
  AMSUIDashboardMessageViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  dashboardMessageController = self->_dashboardMessageController;
  v18 = v4;
  if (dashboardMessageController)
  {
    -[AMSUIDashboardMessageViewController view](dashboardMessageController, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[AMSUIDashboardMessageViewController removeFromParentViewController](self->_dashboardMessageController, "removeFromParentViewController");
    v7 = self->_dashboardMessageController;
    self->_dashboardMessageController = 0;

    v4 = v18;
  }
  if (v4)
  {
    v8 = (AMSUIDashboardMessageViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDE50]), "initWithRequest:", v18);
    v9 = self->_dashboardMessageController;
    self->_dashboardMessageController = v8;

    -[AMSUIDashboardMessageViewController setImpressionsReportingFrequency:](self->_dashboardMessageController, "setImpressionsReportingFrequency:", 0);
    -[AMSUIDashboardMessageViewController setShouldAutomaticallyReportMetrics:](self->_dashboardMessageController, "setShouldAutomaticallyReportMetrics:", 0);
    -[AMSUIDashboardMessageViewController setDelegate:](self->_dashboardMessageController, "setDelegate:", self);
    -[UIView pkui_viewControllerFromResponderChain](self, "pkui_viewControllerFromResponderChain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addChildViewController:", self->_dashboardMessageController);

    -[AMSUIDashboardMessageViewController view](self->_dashboardMessageController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAMSEnagementMessageCell addSubview:](self, "addSubview:", v11);

    -[AMSUIDashboardMessageViewController view](self->_dashboardMessageController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    v4 = v18;
    if (v15)
    {
      -[AMSUIDashboardMessageViewController view](self->_dashboardMessageController, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBackgroundColor:", v17);

      v4 = v18;
    }
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMSUIDashboardMessageViewController view](self->_dashboardMessageController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAMSEnagementMessageCell;
  -[PKAMSEnagementMessageCell layoutSubviews](&v4, sel_layoutSubviews);
  -[AMSUIDashboardMessageViewController view](self->_dashboardMessageController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAMSEnagementMessageCell bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  objc_super v3;

  -[PKAMSEnagementMessageCell setMessage:](self, "setMessage:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PKAMSEnagementMessageCell;
  -[PKAMSEnagementMessageCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  return 1;
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a4;
  objc_msgSend(v5, "originalRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedActionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "locateActionWithIdentifier:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v8 = objc_msgSend(v11, "style");
    if (v8 >= 2)
    {
      if (v8 != 2)
        goto LABEL_8;
      -[PKDashboardPassMessage actionOnDismiss](self->_message, "actionOnDismiss");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKDashboardPassMessage actionOnButtonPress](self->_message, "actionOnButtonPress");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    if (v9)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);

    }
  }
LABEL_8:

}

- (PKDashboardPassMessage)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_dashboardMessageController, 0);
}

@end
