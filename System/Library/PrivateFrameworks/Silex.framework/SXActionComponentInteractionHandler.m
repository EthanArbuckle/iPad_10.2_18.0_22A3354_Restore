@implementation SXActionComponentInteractionHandler

- (SXActionComponentInteractionHandler)initWithAction:(id)a3 actionManager:(id)a4 actionSerializer:(id)a5 analyticsReportingProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXActionComponentInteractionHandler *v15;
  SXActionComponentInteractionHandler *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SXActionComponentInteractionHandler;
  v15 = -[SXActionComponentInteractionHandler init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_action, a3);
    objc_storeStrong((id *)&v16->_actionManager, a4);
    objc_storeStrong((id *)&v16->_actionSerializer, a5);
    objc_storeStrong((id *)&v16->_analyticsReportingProvider, a6);
  }

  return v16;
}

- (void)handleInteractionType:(unint64_t)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  -[SXActionComponentInteractionHandler actionManager](self, "actionManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXActionComponentInteractionHandler action](self, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performAction:postActionHandlers:sourceView:sourceRect:mode:", v12, v13, v10, 0, x, y, width, height);

}

- (id)contextMenuForComponentView:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[SXActionComponentInteractionHandler actionManager](self, "actionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXActionComponentInteractionHandler action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextMenuConfigurationForAction:sourceView:sourceRect:", v11, v9, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)toolTipForComponentView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SXActionComponentInteractionHandler actionSerializer](self, "actionSerializer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXActionComponentInteractionHandler action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForAction:type:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SXLinkTapEvent *v9;
  void *v10;
  SXLinkTapEvent *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  if (a4 == 2)
  {
    v14 = v6;
    -[SXActionComponentInteractionHandler actionSerializer](self, "actionSerializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForAction:type:", v14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SXLinkTapEvent alloc];
      objc_msgSend(v14, "analytics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SXLinkTapEvent initWithDestinationURL:analytics:](v9, "initWithDestinationURL:analytics:", v8, v10);

      -[SXActionComponentInteractionHandler analyticsReportingProvider](self, "analyticsReportingProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "analyticsReporting");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reportEvent:", v11);

    }
    v6 = v14;
  }

}

- (id)previewViewController
{
  void *v3;
  void *v4;
  void *v5;

  -[SXActionComponentInteractionHandler actionManager](self, "actionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXActionComponentInteractionHandler action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewViewControllerForAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)commitViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXActionComponentInteractionHandler actionManager](self, "actionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitPreviewViewController:", v4);

}

- (SXAction)action
{
  return self->_action;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXActionSerializer)actionSerializer
{
  return self->_actionSerializer;
}

- (SXAnalyticsReportingProvider)analyticsReportingProvider
{
  return self->_analyticsReportingProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReportingProvider, 0);
  objc_storeStrong((id *)&self->_actionSerializer, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end
