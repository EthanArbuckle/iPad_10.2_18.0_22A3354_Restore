@implementation STPINListViewController

- (STPINListViewController)initWithRootViewModelCoordinator:(id)a3
{
  id v5;
  STPINListViewController *v6;
  STPINListViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STPINListViewController;
  v6 = -[STListViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coordinator, a3);

  return v7;
}

- (STPINListViewController)init
{
  return -[STPINListViewController initWithRootViewModelCoordinator:](self, "initWithRootViewModelCoordinator:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STPINListViewController;
  -[STPINListViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[STPINListViewController specifierIDPendingPush](self, "specifierIDPendingPush");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController specifierForID:](self, "specifierForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSListController st_shouldShowPINSheetForSpecifier:](self, "st_shouldShowPINSheetForSpecifier:", v5))
    -[STPINListViewController showPINSheet:](self, "showPINSheet:", v5);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STPINListViewController.viewDidAppear", v6, 2u);
  }

}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  -[STPINListViewController specifierForID:](self, "specifierForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PSListController st_shouldShowPINSheetForSpecifier:](self, "st_shouldShowPINSheetForSpecifier:", v5))
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)STPINListViewController;
    v6 = -[STPINListViewController shouldDeferPushForSpecifierID:](&v8, sel_shouldDeferPushForSpecifierID_, v4);
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v8 = -[STPINListViewController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[PSListController st_shouldShowPINSheetForSpecifier:](self, "st_shouldShowPINSheetForSpecifier:", v9))
  {
    -[STPINListViewController showPINSheet:](self, "showPINSheet:", v9);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STPINListViewController;
    -[STPINListViewController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

- (void)showPINSheet:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController setShowingPinTarget:](self, "setShowingPinTarget:", v5);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self, *MEMORY[0x24BE75E10]);
  v6.receiver = self;
  v6.super_class = (Class)STPINListViewController;
  -[STPINListViewController showPINSheet:](&v6, sel_showPINSheet_, v4);

}

- (void)setUpPasscodeAndLineWrapBehaviorForSpecifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;

  v3 = *MEMORY[0x24BE75868];
  v7 = a3;
  v4 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v3);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24DBBEA30, *MEMORY[0x24BE75E18]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, 0x24DB91010);

}

- (void)devicePINControllerDidDismissPINPane:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "specifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STPINListViewController showingPinTarget](self, "showingPinTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTarget:", v5);

  -[STPINListViewController setShowingPinTarget:](self, "setShowingPinTarget:", 0);
  -[PSListController st_devicePINControllerDidDismissPINPane:](self, "st_devicePINControllerDidDismissPINPane:", v4);

}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (id)showingPinTarget
{
  return self->_showingPinTarget;
}

- (void)setShowingPinTarget:(id)a3
{
  objc_storeStrong(&self->_showingPinTarget, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showingPinTarget, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
