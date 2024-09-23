@implementation PUStorageTipNavigationViewController

- (PUStorageTipNavigationViewController)init
{
  PUStorageTipListViewController *v3;
  PUStorageTipNavigationViewController *v4;
  PUStorageTipNavigationViewController *v5;
  objc_super v7;

  v3 = objc_alloc_init(PUStorageTipListViewController);
  v7.receiver = self;
  v7.super_class = (Class)PUStorageTipNavigationViewController;
  v4 = -[PUStorageTipNavigationViewController initWithRootViewController:](&v7, sel_initWithRootViewController_, v3);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_listViewController, v3);

  return v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PUStorageTipNavigationViewController;
  -[PUStorageTipNavigationViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  if (-[PUStorageTipNavigationViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[PUStorageTipNavigationViewController listViewController](self, "listViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "storageRecovered");

    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "Storage recovered before clamping = %td", buf, 0xCu);
    }

    v7 = v5 & ~(v5 >> 63);
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v7;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "Storage recovered given to cloud delegate = %td", buf, 0xCu);
    }

    -[PUStorageTipNavigationViewController cloudRecommendationsDelegate](self, "cloudRecommendationsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userDidCompleteAction:", v10);

  }
}

- (void)setParentController:(id)a3
{
  objc_storeStrong((id *)&self->_parentController, a3);
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  void *v5;
  id preferenceValue;

  v5 = (void *)objc_msgSend(a4, "copy", a3);
  preferenceValue = self->_preferenceValue;
  self->_preferenceValue = v5;

}

- (id)readPreferenceValue:(id)a3
{
  return self->_preferenceValue;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (RecommendationFlowControllerDelegate)cloudRecommendationsDelegate
{
  return (RecommendationFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->cloudRecommendationsDelegate);
}

- (void)setCloudRecommendationsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->cloudRecommendationsDelegate, a3);
}

- (PUStorageTipListViewController)listViewController
{
  return self->_listViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_destroyWeak((id *)&self->cloudRecommendationsDelegate);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong(&self->_preferenceValue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
