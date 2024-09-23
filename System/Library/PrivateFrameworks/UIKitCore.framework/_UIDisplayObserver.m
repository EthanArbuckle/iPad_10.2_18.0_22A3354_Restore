@implementation _UIDisplayObserver

+ (id)sharedObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36___UIDisplayObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD7DE00 != -1)
    dispatch_once(&qword_1ECD7DE00, block);
  return (id)_MergedGlobals_1063;
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  void *v5;
  id v6;

  v5 = (void *)UIApp;
  v6 = a5;
  +[UIScreen _FBSDisplayConfigurationConnected:andNotify:](UIScreen, "_FBSDisplayConfigurationConnected:andNotify:", v6, objc_msgSend(v5, "_hasCalledRunWithMainScene"));

}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  +[UIScreen _screenWithFBSDisplayIdentity:](UIScreen, "_screenWithFBSDisplayIdentity:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateDisplayConfiguration:", v6);

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  +[UIScreen _FBSDisplayIdentityDisconnected:](UIScreen, "_FBSDisplayIdentityDisconnected:", a4);
}

@end
