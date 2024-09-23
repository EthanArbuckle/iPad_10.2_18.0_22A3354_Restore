@implementation WFPencilActionConfigurationViewController

- (WFPencilActionConfigurationViewController)init
{
  WFPencilActionConfigurationViewController *v2;
  WFPencilActionConfigurationViewController *v3;
  WFPencilActionConfigurationViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPencilActionConfigurationViewController;
  v2 = -[WFSystemActionConfigurationViewController initWithConfigurationContext:](&v6, sel_initWithConfigurationContext_, CFSTR("WFSystemActionConfigurationContextPencilSettings"));
  v3 = v2;
  if (v2)
  {
    -[WFPencilActionConfigurationViewController configureSheetPresentationStyle](v2, "configureSheetPresentationStyle");
    v4 = v3;
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFPencilActionConfigurationViewController;
  -[WFPencilActionConfigurationViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WFPencilActionConfigurationViewController configureSheetPresentationStyle](self, "configureSheetPresentationStyle");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFPencilActionConfigurationViewController;
  -[WFPencilActionConfigurationViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[WFPencilActionConfigurationViewController configureSheetPresentationStyle](self, "configureSheetPresentationStyle");
}

- (void)configureSheetPresentationStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  _OWORD v14[11];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  +[WFPencilActionConfigurationMetricsProvider sharedProvider](WFPencilActionConfigurationMetricsProvider, "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v4 = -[WFPencilActionConfigurationViewController interfaceOrientation](self, "interfaceOrientation");
  if (v3)
  {
    objc_msgSend(v3, "metricsWithInterfaceOrientation:", v4);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
  }
  -[WFPencilActionConfigurationViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 2);
  -[WFPencilActionConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefersGrabberVisible:", 1);

  -[WFPencilActionConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);

  -[WFPencilActionConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setWantsBottomAttached:", 1);

  -[WFPencilActionConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setGrabberTopSpacing:", *(double *)&v20);

  -[WFPencilActionConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(double *)&v21;
  -[WFPencilActionConfigurationViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UISheetMinimumTopInset();
  objc_msgSend(v9, "_setAdditionalMinimumTopInset:", v10 - v12);

  -[WFPencilActionConfigurationViewController sheetPresentationController](self, "sheetPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferredCornerRadius:", *((double *)&v20 + 1));

  v14[8] = v23;
  v14[9] = v24;
  v14[10] = v25;
  v14[4] = v19;
  v14[5] = v20;
  v14[6] = v21;
  v14[7] = v22;
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  v14[3] = v18;
  objc_msgSend(v3, "sheetPreferredContentSizeWithMetrics:", v14);
  -[WFPencilActionConfigurationViewController setPreferredContentSize:](self, "setPreferredContentSize:");

}

@end
