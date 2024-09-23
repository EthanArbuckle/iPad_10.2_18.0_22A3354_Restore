@implementation WLImportViewController

- (WLImportViewController)initWithWelcomeController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WLImportViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  WLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)WLImportViewController;
  v10 = -[OBSetupAssistantProgressController initWithTitle:detailText:icon:](&v16, sel_initWithTitle_detailText_icon_, v6, 0, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_welcomeController, a3);
    -[OBBaseWelcomeController navigationItem](v10, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", &stru_24E1499D0);

    -[OBBaseWelcomeController navigationItem](v10, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROGRESS_IMPORTING_TEXT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLImportViewController setProgressDescription:](v10, "setProgressDescription:", v14);

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
