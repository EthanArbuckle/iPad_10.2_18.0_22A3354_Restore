@implementation SWSnapshotManager

- (SWSnapshotManager)initWithWebView:(id)a3 configurationManager:(id)a4
{
  id v7;
  id v8;
  SWSnapshotManager *v9;
  SWSnapshotManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWSnapshotManager;
  v9 = -[SWSnapshotManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    objc_storeStrong((id *)&v10->_configurationManager, a4);
  }

  return v10;
}

- (void)takeSnapshotWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  _QWORD v19[5];

  v18 = a3;
  -[SWSnapshotManager configurationManager](self, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (objc_class *)MEMORY[0x24BDFA8F0];
    v7 = v5;
    v8 = objc_alloc_init(v6);
    objc_msgSend(v7, "contentFrame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    objc_msgSend(v8, "setRect:", v10, v12, v14, v16);
    objc_msgSend(v8, "setAfterScreenUpdates:", 0);
    -[SWSnapshotManager webView](self, "webView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "takeSnapshotWithConfiguration:completionHandler:", v8, v18);

  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__SWSnapshotManager_takeSnapshotWithCompletionHandler___block_invoke;
    v19[3] = &unk_24DA0BA68;
    v19[4] = v18;
    __55__SWSnapshotManager_takeSnapshotWithCompletionHandler___block_invoke((uint64_t)v19);
  }

}

void __55__SWSnapshotManager_takeSnapshotWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("web_content"), 4, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (WKWebView)webView
{
  return self->_webView;
}

- (SWConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
