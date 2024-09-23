@implementation _UIUserDefaultsHostActivity

- (id)activityViewController
{
  -[_UIUserDefaultsHostActivity _prepareActivityViewControllerIfNeeded](self, "_prepareActivityViewControllerIfNeeded");
  return -[_UIUserDefaultsHostActivity presentableActivityViewController](self, "presentableActivityViewController");
}

- (void)activityDidFinish:(BOOL)a3 items:(id)a4 error:(id)a5
{
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIUserDefaultsHostActivity;
  -[UIActivity activityDidFinish:items:error:](&v8, sel_activityDidFinish_items_error_, a3, a4, a5);
  -[_UIUserDefaultsHostActivity presentableActivityViewController](self, "presentableActivityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___UIUserDefaultsHostActivity_activityDidFinish_items_error___block_invoke;
  v7[3] = &unk_1E4001608;
  v7[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

}

- (void)_settingsViewControllerDidDismiss:(id)a3
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (void)_cleanup
{
  -[_UIUserDefaultsHostActivity setPresentableActivityViewController:](self, "setPresentableActivityViewController:", 0);
}

- (void)_prepareActivityViewControllerIfNeeded
{
  void *v3;
  _UIActivityUserDefaultsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIUserDefaultsActivityPresentableViewController *v11;
  _UIActivityUserDefaultsViewController *v12;

  -[_UIUserDefaultsHostActivity presentableActivityViewController](self, "presentableActivityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [_UIActivityUserDefaultsViewController alloc];
    -[_UIUserDefaultsActivity availableActivities](self, "availableActivities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIUserDefaultsActivity userDefaults](self, "userDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UIActivityUserDefaultsViewController initWithActivities:userDefaults:](v4, "initWithActivities:userDefaults:", v5, v6);

    _ShareSheetBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Activities"), CFSTR("Activities"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsViewController setTitle:](v12, "setTitle:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__settingsViewControllerDidDismiss_);
    -[_UIActivityUserDefaultsViewController navigationItem](v12, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:", v9);

    v11 = -[_UIUserDefaultsActivityPresentableViewController initWithUserDefaultsViewController:]([_UIUserDefaultsActivityPresentableViewController alloc], "initWithUserDefaultsViewController:", v12);
    -[_UIUserDefaultsHostActivity setPresentableActivityViewController:](self, "setPresentableActivityViewController:", v11);

  }
}

- (UIViewController)presentableActivityViewController
{
  return self->_presentableActivityViewController;
}

- (void)setPresentableActivityViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentableActivityViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentableActivityViewController, 0);
}

@end
