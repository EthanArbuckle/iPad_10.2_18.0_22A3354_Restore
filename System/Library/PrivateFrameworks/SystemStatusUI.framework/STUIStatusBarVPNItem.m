@implementation STUIStatusBarVPNItem

- (id)dependentEntryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0D78]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vpnView, 0);
}

- (STUIStatusBarStringView)vpnView
{
  STUIStatusBarStringView *vpnView;

  vpnView = self->_vpnView;
  if (!vpnView)
  {
    -[STUIStatusBarVPNItem _create_vpnView](self, "_create_vpnView");
    vpnView = self->_vpnView;
  }
  return vpnView;
}

- (void)_create_vpnView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *vpnView;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  vpnView = self->_vpnView;
  self->_vpnView = v4;

  -[STUIStatusBarStringView setText:](self->_vpnView, "setText:", CFSTR("VPN"));
  -[STUIStatusBarStringView setEncapsulated:](self->_vpnView, "setEncapsulated:", 1);
}

- (void)setVpnView:(id)a3
{
  objc_storeStrong((id *)&self->_vpnView, a3);
}

@end
