@implementation VUIActionOpenWebLink

- (VUIActionOpenWebLink)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7;
  id v8;
  VUIActionOpenWebLink *v9;
  VUIActionOpenWebLink *v10;
  uint64_t v11;
  NSString *webUrl;
  uint64_t v13;
  NSDictionary *metrics;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VUIActionOpenWebLink;
  v9 = -[VUIActionOpenWebLink init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
    objc_msgSend(v7, "vui_stringForKey:", CFSTR("webUrl"));
    v11 = objc_claimAutoreleasedReturnValue();
    webUrl = v10->_webUrl;
    v10->_webUrl = (NSString *)v11;

    objc_msgSend(v7, "vui_dictionaryForKey:", CFSTR("metrics"));
    v13 = objc_claimAutoreleasedReturnValue();
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v13;

  }
  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSString *webUrl;
  BOOL v11;
  NSDictionary *metrics;
  void *v13;
  NSString *v14;
  void *v15;
  VUIActionAppPunchout *v16;
  VUIActionAppPunchout *actionPunchout;
  VUIActionAppPunchout *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  v9 = WeakRetained;
  webUrl = self->_webUrl;
  if (webUrl)
    v11 = WeakRetained == 0;
  else
    v11 = 1;
  if (!v11)
  {
    v23[0] = CFSTR("openUrl");
    v23[1] = CFSTR("metrics");
    metrics = self->_metrics;
    if (!metrics)
      metrics = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v24[0] = webUrl;
    v24[1] = metrics;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = webUrl;
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[VUIActionAppPunchout initWithContextData:appContext:]([VUIActionAppPunchout alloc], "initWithContextData:appContext:", v15, v9);
    actionPunchout = self->_actionPunchout;
    self->_actionPunchout = v16;

    if (self->_actionPunchout)
    {
      objc_initWeak(&location, self);
      v18 = self->_actionPunchout;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __69__VUIActionOpenWebLink_performWithTargetResponder_completionHandler___block_invoke;
      v19[3] = &unk_1E9F99650;
      objc_copyWeak(&v21, &location);
      v20 = v7;
      -[VUIActionAppPunchout performWithTargetResponder:completionHandler:](v18, "performWithTargetResponder:completionHandler:", v6, v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

  }
}

void __69__VUIActionOpenWebLink_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setActionPunchout:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);

}

- (NSDictionary)contextData
{
  return self->_contextData;
}

- (void)setContextData:(id)a3
{
  objc_storeStrong((id *)&self->_contextData, a3);
}

- (VUIAppContext)appContext
{
  return (VUIAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (NSString)webUrl
{
  return self->_webUrl;
}

- (void)setWebUrl:(id)a3
{
  objc_storeStrong((id *)&self->_webUrl, a3);
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (VUIActionAppPunchout)actionPunchout
{
  return self->_actionPunchout;
}

- (void)setActionPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_actionPunchout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPunchout, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_webUrl, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextData, 0);
}

@end
