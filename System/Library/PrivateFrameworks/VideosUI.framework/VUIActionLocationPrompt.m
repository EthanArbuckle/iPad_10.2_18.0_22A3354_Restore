@implementation VUIActionLocationPrompt

- (VUIActionLocationPrompt)initWithContextData:(id)a3
{
  id v4;
  VUIActionLocationPrompt *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *dialogMetrics;
  objc_super v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VUIActionLocationPrompt;
  v5 = -[VUIActionLocationPrompt init](&v15, sel_init);
  if (v5)
  {
    v5->_geoLocationEnforced = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("geoLocationEnforced"), 0);
    v6 = (void *)MEMORY[0x1E0C99E08];
    v18[0] = CFSTR("dialogId");
    v18[1] = CFSTR("dialogType");
    v19[0] = CFSTR("locationAuthorization");
    v19[1] = CFSTR("locationAuthorization");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("metrics"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v16 = CFSTR("details");
      v17 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addEntriesFromDictionary:", v11);

    }
    v12 = objc_msgSend(v8, "copy");
    dialogMetrics = v5->_dialogMetrics;
    v5->_dialogMetrics = (NSDictionary *)v12;

  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC87C8], "defaultLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke;
  v10[3] = &unk_1E9F9F2E0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "fetchAuthorizationStatus:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __72__VUIActionLocationPrompt_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (a2 == -1 || (v5 = objc_msgSend(WeakRetained, "geoLocationEnforced"), v6 = v12, !a2) && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v12, sel__locationAuthorizationStatusDidChange_, *MEMORY[0x1E0DC8948], 0);

    objc_msgSend(v12, "setCompletionHandler:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0DC87C8], "defaultLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestAuthorizationWithForcedPrompt:", objc_msgSend(v12, "geoLocationEnforced"));

    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dialogMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordDialog:", v10);

LABEL_7:
    v6 = v12;
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_locationAuthorizationStatusDidChange:(id)a3
{
  void *v4;
  void (**completionHandler)(id, BOOL);
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  completionHandler = (void (**)(id, BOOL))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, !self->_geoLocationEnforced);
    v6 = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)geoLocationEnforced
{
  return self->_geoLocationEnforced;
}

- (void)setGeoLocationEnforced:(BOOL)a3
{
  self->_geoLocationEnforced = a3;
}

- (NSDictionary)dialogMetrics
{
  return self->_dialogMetrics;
}

- (void)setDialogMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_dialogMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogMetrics, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
