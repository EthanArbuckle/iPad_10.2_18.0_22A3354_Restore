@implementation PRRenderingEnvironmentViewController

- (PRRenderingEnvironmentViewController)initWithEnvironment:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PRRenderingEnvironmentViewController *v9;
  PRRenderingEnvironmentViewController *v10;
  uint64_t v11;
  FBSMutableSceneSettings *settings;

  v7 = a3;
  v8 = a4;
  v9 = -[PRRenderingEnvironmentViewController init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_environment, a3);
    v11 = objc_opt_new();
    settings = v10->_settings;
    v10->_settings = (FBSMutableSceneSettings *)v11;

    -[PRPosterEnvironmentImpl _applyToSceneSettings:](v10->_environment, "_applyToSceneSettings:", v10->_settings);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRRenderingEnvironmentViewController;
  -[PRRenderingEnvironmentViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PRRenderingEnvironmentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:style:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("switch"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("segment"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("color"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("slider"));
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  -[PRRenderingEnvironmentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[PRRenderingEnvironmentViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v5);

  objc_msgSend(v5, "reloadData");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (tableView_cellForRowAtIndexPath__onceToken != -1)
    dispatch_once(&tableView_cellForRowAtIndexPath__onceToken, &__block_literal_global_19);
  v8 = objc_msgSend(v7, "row");
  objc_msgSend((id)tableView_cellForRowAtIndexPath__keys, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend((id)tableView_cellForRowAtIndexPath__dixt, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTag:", v10);
  objc_msgSend(v12, "_configure");
  -[FBSMutableSceneSettings otherSettings](self->_settings, "otherSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForSetting:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setCurrentValue:", v14);

  if (v10 == 20492 || v10 == 20664 || v10 == 20562)
  {
    -[PRPosterEnvironmentImpl caseColor](self->_environment, "caseColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setCurrentValue:", v15);

  }
  return v12;
}

void __72__PRRenderingEnvironmentViewController_tableView_cellForRowAtIndexPath___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)tableView_cellForRowAtIndexPath__keys;
  tableView_cellForRowAtIndexPath__keys = (uint64_t)&unk_1E21DD140;

  v3[0] = &unk_1E21DCD10;
  v3[1] = &unk_1E21DCD28;
  v4[0] = CFSTR("segment");
  v4[1] = CFSTR("slider");
  v3[2] = &unk_1E21DCD40;
  v4[2] = CFSTR("color");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)tableView_cellForRowAtIndexPath__dixt;
  tableView_cellForRowAtIndexPath__dixt = v1;

}

- (void)cell:(id)a3 valueChanged:(id)a4
{
  uint64_t v6;
  FBSMutableSceneSettings *settings;
  float v8;
  FBSMutableSceneSettings *v9;
  void *v10;
  void *v11;
  void *v12;
  PRPosterEnvironmentImpl *v13;
  PRPosterEnvironmentImpl *environment;
  id WeakRetained;
  id v16;

  v16 = a4;
  v6 = objc_msgSend(a3, "tag");
  switch(v6)
  {
    case 20664:
      settings = self->_settings;
      objc_msgSend(v16, "floatValue");
      -[FBSMutableSceneSettings pr_setUnlockProgress:](settings, "pr_setUnlockProgress:", v8);
      break;
    case 20562:
      v9 = self->_settings;
      objc_msgSend(v16, "BSColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBSMutableSceneSettings pr_setCaseColor:](v9, "pr_setCaseColor:", v10);

      break;
    case 20492:
      -[FBSMutableSceneSettings pui_setMode:](self->_settings, "pui_setMode:", objc_msgSend(v16, "integerValue"));
      break;
  }
  -[PRRenderingEnvironmentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[PRPosterEnvironmentImpl initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:]([PRPosterEnvironmentImpl alloc], "initWithSceneSettings:traitCollection:targetConfig:extensionBundleURL:", self->_settings, v12, 0, 0);
  environment = self->_environment;
  self->_environment = v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "environmentViewController:didUpdateEnvironment:", self, self->_environment);

}

- (void)cell:(id)a3 presentViewController:(id)a4
{
  -[PRRenderingEnvironmentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (PRPosterEnvironmentImpl)currentEnvironment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
