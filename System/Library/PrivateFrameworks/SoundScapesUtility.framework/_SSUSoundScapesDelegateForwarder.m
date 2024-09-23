@implementation _SSUSoundScapesDelegateForwarder

- (id)initForViewController:(id)a3
{
  id v4;
  _SSUSoundScapesDelegateForwarder *v5;
  _SSUSoundScapesDelegateForwarder *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIBarButtonItem *doneButton;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_SSUSoundScapesDelegateForwarder;
  v5 = -[_SSUSoundScapesDelegateForwarder init](&v24, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_SSUSoundScapesDelegateForwarder setViewController:](v5, "setViewController:", v4);
    +[SSUSoundScapesPickerManager pickerIdentity](SSUSoundScapesPickerManager, "pickerIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v7, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AMBIENTSOUNDS"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SSUSoundScapesDelegateForwarder viewController](v6, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v11);

    if (!v6->_doneButton)
    {
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DONE"), 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v14, 2, v6, sel_mediaPickerConfirmChoices);
      doneButton = v6->_doneButton;
      v6->_doneButton = (UIBarButtonItem *)v15;

      -[_SSUSoundScapesDelegateForwarder viewController](v6, "viewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setRightBarButtonItem:", v6->_doneButton);

      -[_SSUSoundScapesDelegateForwarder viewController](v6, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "navigationItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLargeTitleDisplayMode:", 2);

    }
    -[_SSUSoundScapesDelegateForwarder viewController](v6, "viewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setClipsToBounds:", 1);

    -[_SSUSoundScapesDelegateForwarder updateNavigationItem](v6, "updateNavigationItem");
    v6->_exiting = 0;

  }
  return v6;
}

- (void)updateNavigationItem
{
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", self->_lastPickedArchive != 0);
}

- (void)mediaPickerConfirmChoices
{
  uint64_t v2;
  _QWORD block[5];

  v2 = MEMORY[0x24BDAC760];
  self->_exiting = 1;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __61___SSUSoundScapesDelegateForwarder_mediaPickerConfirmChoices__block_invoke;
  block[3] = &unk_2518F24D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)selectedSoundScapes:(id)a3 withError:(id)a4
{
  MPPlaybackArchive *v6;
  NSError *v7;
  MPPlaybackArchive *lastPickedArchive;
  MPPlaybackArchive *v9;
  NSError *lastPickedError;
  NSError *v11;
  _QWORD block[5];

  v6 = (MPPlaybackArchive *)a3;
  v7 = (NSError *)a4;
  lastPickedArchive = self->_lastPickedArchive;
  self->_lastPickedArchive = v6;
  v9 = v6;

  lastPickedError = self->_lastPickedError;
  self->_lastPickedError = v7;
  v11 = v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66___SSUSoundScapesDelegateForwarder_selectedSoundScapes_withError___block_invoke;
  block[3] = &unk_2518F24D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)requestDismiss
{
  uint64_t v2;
  _QWORD block[5];

  v2 = MEMORY[0x24BDAC760];
  self->_exiting = 1;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __50___SSUSoundScapesDelegateForwarder_requestDismiss__block_invoke;
  block[3] = &unk_2518F24D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)pickerDismissed
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!self->_exiting)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
    objc_msgSend(WeakRetained, "placeholderView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewWithTag:", 10001);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setHidden:", 0);
    -[_SSUSoundScapesDelegateForwarder viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);

  }
}

- (void)cleanup
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43___SSUSoundScapesDelegateForwarder_cleanup__block_invoke;
  block[3] = &unk_2518F24D0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

- (SSUSoundscapesPickerControllerDelegate)delegate
{
  return (SSUSoundscapesPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_EXHostViewController)viewController
{
  return (_EXHostViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_lastPickedError, 0);
  objc_storeStrong((id *)&self->_lastPickedArchive, 0);
}

@end
