@implementation ICQRecommendationsViewControllerWrapper

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _TtC13iCloudQuotaUI29RecommendationsViewController *v6;
  id v7;
  void *v8;
  void *v9;
  _TtC13iCloudQuotaUI25RecommendationsController *v10;
  void *v11;
  void *v12;
  _TtC13iCloudQuotaUI25RecommendationsController *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)ICQRecommendationsViewControllerWrapper;
  -[ICQRecommendationsViewControllerWrapper viewDidLoad](&v17, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  -[ICQRecommendationsViewControllerWrapper setView:](self, "setView:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQRecommendationsViewControllerWrapper view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = objc_alloc_init(_TtC13iCloudQuotaUI29RecommendationsViewController);
  v7 = objc_alloc(MEMORY[0x24BE060C8]);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithAccountStore:", v8);

  objc_msgSend(v9, "setDelegate:", self);
  v10 = [_TtC13iCloudQuotaUI25RecommendationsController alloc];
  objc_msgSend(v9, "accounts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RecommendationsController initWithAccount:](v10, "initWithAccount:", v12);
  -[ICQRecommendationsViewControllerWrapper setRecController:](self, "setRecController:", v13);

  -[ICQUIRecommendationsRestorableViewController setAccountManager:](v6, "setAccountManager:", v9);
  -[ICQRecommendationsViewControllerWrapper recController](self, "recController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUIRecommendationsRestorableViewController setController:](v6, "setController:", v14);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v6);
  -[ICQUIRecommendationsRestorableViewController controller](v6, "controller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "refresh");

  -[UIViewController addChildAndPinToEdgesWithChildViewController:](self, "addChildAndPinToEdgesWithChildViewController:", v15);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQRecommendationsViewControllerWrapper;
  -[ICQRecommendationsViewControllerWrapper viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[ICQRecommendationsViewControllerWrapper recController](self, "recController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refresh");

}

- (id)accountsForAccountManager:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE06080]);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (_TtC13iCloudQuotaUI25RecommendationsController)recController
{
  return self->_recController;
}

- (void)setRecController:(id)a3
{
  objc_storeStrong((id *)&self->_recController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recController, 0);
}

@end
