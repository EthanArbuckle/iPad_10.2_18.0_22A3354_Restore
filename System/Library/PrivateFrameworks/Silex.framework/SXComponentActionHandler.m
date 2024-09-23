@implementation SXComponentActionHandler

- (SXComponentActionHandler)initWithActionManager:(id)a3 actionSerializer:(id)a4 analyticsReportingProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXComponentActionHandler *v12;
  SXComponentActionHandler *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXComponentActionHandler;
  v12 = -[SXAnalyticsEvent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionManager, a3);
    objc_storeStrong((id *)&v13->_actionSerializer, a4);
    objc_storeStrong((id *)&v13->_analyticsReportingProvider, a5);
  }

  return v13;
}

- (void)handleAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5 invocationType:(unint64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v12 = a6 == 1;
  v13 = a4;
  v14 = a3;
  -[SXComponentActionHandler actionManager](self, "actionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "performAction:postActionHandlers:sourceView:sourceRect:mode:", v14, v16, v13, v12, x, y, width, height);

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
    -[SXComponentActionHandler actionSerializer](self, "actionSerializer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForAction:type:", v14, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SXLinkTapEvent alloc];
      objc_msgSend(v14, "analytics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SXLinkTapEvent initWithDestinationURL:analytics:](v9, "initWithDestinationURL:analytics:", v8, v10);

      -[SXComponentActionHandler analyticsReportingProvider](self, "analyticsReportingProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "analyticsReporting");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reportEvent:", v11);

    }
    v6 = v14;
  }

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
}

@end
