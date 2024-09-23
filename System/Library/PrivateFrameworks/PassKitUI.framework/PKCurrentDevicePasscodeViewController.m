@implementation PKCurrentDevicePasscodeViewController

- (PKCurrentDevicePasscodeViewController)initWithPasscodeUpgradeFlowController:(id)a3
{
  id v4;
  PKCurrentDevicePasscodeViewController *v5;
  PKCurrentDevicePasscodeViewController *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCurrentDevicePasscodeViewController;
  v5 = -[DevicePINController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_flowController, v4);
    v7 = (objc_class *)objc_alloc_init(MEMORY[0x1E0D804E8]);
    v8 = (int)*MEMORY[0x1E0D80628];
    v9 = *(Class *)((char *)&v6->super.super.super.super.super.super.isa + v8);
    *(Class *)((char *)&v6->super.super.super.super.super.super.isa + v8) = v7;

    objc_msgSend(*(id *)((char *)&v6->super.super.super.super.super.super.isa + v8), "setEditPaneClass:", objc_opt_class());
    objc_msgSend(*(id *)((char *)&v6->super.super.super.super.super.super.isa + v8), "setProperty:forKey:", &unk_1E3FAD498, *MEMORY[0x1E0D809D0]);
    -[DevicePINController setShouldDismissWhenDone:](v6, "setShouldDismissWhenDone:", 0);
    -[DevicePINController setHidesCancelButton:](v6, "setHidesCancelButton:", 1);
  }

  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCurrentDevicePasscodeViewController;
  -[DevicePINController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80570]), "resignFirstResponder");
  if (!self->_viewHasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    objc_msgSend(WeakRetained, "beginShowingViewController");

    self->_viewHasAppeared = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKCurrentDevicePasscodeViewController;
  -[DevicePINController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80570]), "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCurrentDevicePasscodeViewController;
  -[DevicePINController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (self->_viewHasAppeared)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_flowController);
    objc_msgSend(WeakRetained, "endedShowingViewController");

    self->_viewHasAppeared = 0;
  }
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (id)pinInstructionsPrompt
{
  return (id)PKLocalizedPaymentString(CFSTR("PASSCODE_UPGRADE_ENTER_CURRENT_PASSCODE"));
}

- (BOOL)requiresKeyboard
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flowController);
}

@end
