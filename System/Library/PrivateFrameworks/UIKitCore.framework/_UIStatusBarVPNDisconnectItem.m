@implementation _UIStatusBarVPNDisconnectItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("vpnEntry"));
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a4, "valueForKey:", CFSTR("vpnEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "isEnabled") ^ 1;
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (_UIStatusBarVPNDisconnectView)disconnectView
{
  _UIStatusBarVPNDisconnectView *disconnectView;

  disconnectView = self->_disconnectView;
  if (!disconnectView)
  {
    -[_UIStatusBarVPNDisconnectItem _create_disconnectView](self, "_create_disconnectView");
    disconnectView = self->_disconnectView;
  }
  return disconnectView;
}

- (void)_create_disconnectView
{
  _UIStatusBarVPNDisconnectView *v3;
  _UIStatusBarVPNDisconnectView *v4;
  _UIStatusBarVPNDisconnectView *disconnectView;

  v3 = [_UIStatusBarVPNDisconnectView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  disconnectView = self->_disconnectView;
  self->_disconnectView = v4;

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIStatusBarVPNDisconnectItem;
  v7 = a4;
  -[_UIStatusBarItem applyUpdate:toDisplayItem:](&v13, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEnabled", v13.receiver, v13.super_class);

  if (v9 && objc_msgSend(v6, "dataChanged"))
  {
    -[_UIStatusBarVPNDisconnectItem disconnectView](self, "disconnectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetSlashForUpdate:", v6);

    -[_UIStatusBarVPNDisconnectItem disconnectView](self, "disconnectView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animateSlashForUpdate:", v6);

  }
  return v8;
}

- (void)setDisconnectView:(id)a3
{
  objc_storeStrong((id *)&self->_disconnectView, a3);
}

- (NSTimer)slashBeginTimer
{
  return self->_slashBeginTimer;
}

- (void)setSlashBeginTimer:(id)a3
{
  objc_storeStrong((id *)&self->_slashBeginTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slashBeginTimer, 0);
  objc_storeStrong((id *)&self->_disconnectView, 0);
}

@end
