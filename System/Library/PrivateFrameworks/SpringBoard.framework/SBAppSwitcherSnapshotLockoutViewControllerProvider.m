@implementation SBAppSwitcherSnapshotLockoutViewControllerProvider

- (SBAppSwitcherSnapshotLockoutViewControllerProvider)init
{
  SBAppSwitcherSnapshotLockoutViewControllerProvider *v2;
  NSMutableArray *v3;
  NSMutableArray *availableControllers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBAppSwitcherSnapshotLockoutViewControllerProvider;
  v2 = -[SBAppSwitcherSnapshotLockoutViewControllerProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    availableControllers = v2->_availableControllers;
    v2->_availableControllers = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__receivedMemoryWarning_, *MEMORY[0x1E0CEB298], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB298], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherSnapshotLockoutViewControllerProvider;
  -[SBAppSwitcherSnapshotLockoutViewControllerProvider dealloc](&v4, sel_dealloc);
}

- (id)blockingViewControllerForBundleIdentifier:(id)a3 screenTimePolicy:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NSMutableArray _sb_dequeue](self->_availableControllers, "_sb_dequeue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0D8C088], "newTranslucentBlockingViewController");
    objc_msgSend(MEMORY[0x1E0D8C088], "closeApplicationHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOkButtonHandler:", v8);

    objc_msgSend(v7, "_setIgnoresWrapperViewForContentOverlayInsets:", 1);
  }
  objc_msgSend(v7, "updateAppearanceUsingPolicy:forBundleIdentifier:", a4, v6);

  return v7;
}

- (void)recycleBlockingViewController:(id)a3
{
  -[NSMutableArray _sb_enqueue:](self->_availableControllers, "_sb_enqueue:", a3);
}

- (void)_receivedMemoryWarning:(id)a3
{
  -[NSMutableArray removeAllObjects](self->_availableControllers, "removeAllObjects", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableControllers, 0);
}

@end
