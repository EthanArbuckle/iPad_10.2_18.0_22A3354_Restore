@implementation WebAppEligibilityViewController

- (WebAppEligibilityViewController)initWithWebClip:(id)a3 scene:(id)a4
{
  id v7;
  id v8;
  WebAppEligibilityViewController *v9;
  WebAppEligibilityViewController *v10;
  UIWebClip *webClip;
  WebAppEligibilityViewController *v12;
  uint64_t v13;
  UIAlertController *alertController;
  WebAppEligibilityViewController *v15;
  _QWORD v17[4];
  WebAppEligibilityViewController *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WebAppEligibilityViewController;
  v9 = -[WebAppEligibilityViewController init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webClip, a3);
    objc_storeStrong((id *)&v10->_scene, a4);
    webClip = v10->_webClip;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __57__WebAppEligibilityViewController_initWithWebClip_scene___block_invoke;
    v17[3] = &unk_24FA284B0;
    v12 = v10;
    v18 = v12;
    -[UIWebClip eligibilityAlert:](webClip, "eligibilityAlert:", v17);
    v13 = objc_claimAutoreleasedReturnValue();
    alertController = v12->_alertController;
    v12->_alertController = (UIAlertController *)v13;

    v15 = v12;
  }

  return v10;
}

void __57__WebAppEligibilityViewController_initWithWebClip_scene___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "pageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__WebAppEligibilityViewController_initWithWebClip_scene___block_invoke_2;
    v5[3] = &unk_24FA284B0;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x24BDBD1B8], v5);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "_sf_destroyScene");
  }
}

uint64_t __57__WebAppEligibilityViewController_initWithWebClip_scene___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "_sf_destroyScene");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebAppEligibilityViewController;
  -[WebAppEligibilityViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WebAppEligibilityViewController presentAlertIfNeeded](self, "presentAlertIfNeeded");
  -[WebAppEligibilityViewController _openURLAndDestroySceneIfNeeded](self, "_openURLAndDestroySceneIfNeeded");
}

- (void)loadView
{
  id v3;
  void *v4;
  UIContentUnavailableView *v5;
  UIContentUnavailableView *unavailableView;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDF6978]);
  objc_msgSend(MEMORY[0x24BDF6970], "emptyConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIContentUnavailableView *)objc_msgSend(v3, "initWithConfiguration:", v4);
  unavailableView = self->_unavailableView;
  self->_unavailableView = v5;

  -[UIContentUnavailableView setAutoresizingMask:](self->_unavailableView, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIContentUnavailableView setBackgroundColor:](self->_unavailableView, "setBackgroundColor:", v7);

  -[WebAppEligibilityViewController setView:](self, "setView:", self->_unavailableView);
}

- (void)presentAlertIfNeeded
{
  void *v3;

  if (-[UIWebClip eligibilityStatus](self->_webClip, "eligibilityStatus") == 1
    || !-[UIWebClip eligibilityStatus](self->_webClip, "eligibilityStatus") && self->_overrideShowAlert)
  {
    -[UIAlertController presentingViewController](self->_alertController, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[WebAppEligibilityViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertController, 1, 0);
  }
}

- (void)_openURLAndDestroySceneIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[UIWebClip eligibilityStatus](self->_webClip, "eligibilityStatus") == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWebClip pageURL](self->_webClip, "pageURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__WebAppEligibilityViewController__openURLAndDestroySceneIfNeeded__block_invoke;
    v5[3] = &unk_24FA284B0;
    v5[4] = self;
    objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x24BDBD1B8], v5);

  }
}

uint64_t __66__WebAppEligibilityViewController__openURLAndDestroySceneIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "_sf_destroyScene");
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (BOOL)overrideShowAlert
{
  return self->_overrideShowAlert;
}

- (void)setOverrideShowAlert:(BOOL)a3
{
  self->_overrideShowAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_unavailableView, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
