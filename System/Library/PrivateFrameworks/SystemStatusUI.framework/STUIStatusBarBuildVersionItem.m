@implementation STUIStatusBarBuildVersionItem

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  if (qword_1EDBEDFD0 != -1)
    dispatch_once(&qword_1EDBEDFD0, &__block_literal_global_15);
  return _MergedGlobals_48;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersionView, 0);
}

void __63__STUIStatusBarBuildVersionItem_canEnableDisplayItem_fromData___block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  objc_msgSend(v2, "dictionaryRepresentation");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIStatusBarShowBuildVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_48 = objc_msgSend(v1, "BOOLValue");

}

- (BOOL)needsUpdate
{
  return 1;
}

- (STUIStatusBarStringView)buildVersionView
{
  STUIStatusBarStringView *buildVersionView;

  buildVersionView = self->_buildVersionView;
  if (!buildVersionView)
  {
    -[STUIStatusBarBuildVersionItem _create_buildVersionView](self, "_create_buildVersionView");
    buildVersionView = self->_buildVersionView;
  }
  return buildVersionView;
}

- (void)_create_buildVersionView
{
  STUIStatusBarStringView *v3;
  STUIStatusBarStringView *v4;
  STUIStatusBarStringView *buildVersionView;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  buildVersionView = self->_buildVersionView;
  self->_buildVersionView = v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVersion");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (MEMORY[0x1D17DDF18]("-[STUIStatusBarBuildVersionItem _create_buildVersionView]"))
  {
    if (qword_1EDBEDFD8 != -1)
      dispatch_once(&qword_1EDBEDFD8, &__block_literal_global_23);
    if (byte_1EDBEDFC9)
    {
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("*"));
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v7;
    }
  }
  -[STUIStatusBarStringView setText:](self->_buildVersionView, "setText:", v8);

}

- (void)setBuildVersionView:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersionView, a3);
}

@end
