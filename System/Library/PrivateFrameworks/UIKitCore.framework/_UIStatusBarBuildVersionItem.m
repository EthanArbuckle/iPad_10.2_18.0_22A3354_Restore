@implementation _UIStatusBarBuildVersionItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  _UIKitPreferencesOnce();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UIStatusBarShowBuildVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)needsUpdate
{
  return 1;
}

- (_UIStatusBarStringView)buildVersionView
{
  _UIStatusBarStringView *buildVersionView;

  buildVersionView = self->_buildVersionView;
  if (!buildVersionView)
  {
    -[_UIStatusBarBuildVersionItem _create_buildVersionView](self, "_create_buildVersionView");
    buildVersionView = self->_buildVersionView;
  }
  return buildVersionView;
}

- (void)_create_buildVersionView
{
  _UIStatusBarStringView *v3;
  _UIStatusBarStringView *v4;
  _UIStatusBarStringView *buildVersionView;
  void *v6;
  id v7;

  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  buildVersionView = self->_buildVersionView;
  self->_buildVersionView = v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVersion");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIStatusBarStringView setText:](self->_buildVersionView, "setText:", v7);
}

- (void)setBuildVersionView:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersionView, 0);
}

@end
