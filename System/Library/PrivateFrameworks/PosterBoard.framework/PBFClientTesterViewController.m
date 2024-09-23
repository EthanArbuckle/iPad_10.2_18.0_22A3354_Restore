@implementation PBFClientTesterViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFClientTesterViewController;
  -[PBFClientTesterViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PBFClientTesterViewController setTitle:](self, "setTitle:", CFSTR("Client Tester"));
  -[PBFClientTesterViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("api"));

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v5 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("api"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  switch(v7)
  {
    case 0:
      objc_msgSend(v6, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Focus Poster Selection");
      goto LABEL_7;
    case 1:
      objc_msgSend(v6, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Gallery");
      goto LABEL_7;
    case 2:
      objc_msgSend(v6, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Editing");
      goto LABEL_7;
    case 3:
      objc_msgSend(v6, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Switcher");
      goto LABEL_7;
    case 4:
      objc_msgSend(v6, "textLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("Poster Selection");
LABEL_7:
      objc_msgSend(v8, "setText:", v10);

      break;
    default:
      return v6;
  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PRUISModalController *v18;
  PRUISModalController *modalController;
  id v20;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "row");

  switch(v7)
  {
    case 0:
      v8 = objc_alloc(MEMORY[0x1E0D7F810]);
      v9 = (void *)objc_opt_new();
      v10 = (void *)objc_msgSend(v8, "initWithActivityUUID:activityIdentifier:", v9, &stru_1E86FC5B8);
      goto LABEL_9;
    case 1:
    case 3:
      v14 = objc_opt_new();
      goto LABEL_12;
    case 2:
      objc_msgSend(MEMORY[0x1E0D7FA78], "mutableConfigurationWithRole:", *MEMORY[0x1E0D7FC58]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDisplayNameLocalizationKey:", CFSTR("SAMPLE_POSTER_TITLE"));
      v20 = 0;
      v11 = objc_msgSend(v9, "storeUserInfo:error:", &unk_1E8741B98, &v20);
      v12 = v20;
      if ((v11 & 1) == 0)
      {
        PBFLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[PBFClientTesterViewController tableView:didSelectRowAtIndexPath:].cold.1((uint64_t)v12, v13);

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F808]), "initWithExtensionIdentifier:configuration:", CFSTR("com.apple.PosterTester.SamplePoster"), v9);

LABEL_9:
      break;
    case 4:
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7F828]), "initWithAllowedConfigurationUUIDs:", 0);
LABEL_12:
      v10 = (void *)v14;
      break;
    default:
      v10 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "connectedScenes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (PRUISModalController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F7E8]), "initWithEntryPoint:", v10);
  modalController = self->_modalController;
  self->_modalController = v18;

  -[PRUISModalController setDelegate:](self->_modalController, "setDelegate:", self);
  -[PRUISModalController presentFromWindowScene:](self->_modalController, "presentFromWindowScene:", v17);

}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
  PRUISModalController *modalController;

  modalController = self->_modalController;
  self->_modalController = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalController, 0);
}

- (void)tableView:(uint64_t)a1 didSelectRowAtIndexPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "Could not store user info: %@", (uint8_t *)&v2, 0xCu);
}

@end
