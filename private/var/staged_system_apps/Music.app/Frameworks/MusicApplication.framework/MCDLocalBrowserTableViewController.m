@implementation MCDLocalBrowserTableViewController

- (MCDLocalBrowserTableViewController)initWithLimitedUI:(BOOL)a3
{
  MCDLocalBrowserTableViewController *v3;
  MCDLocalBrowserTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCDLocalBrowserTableViewController;
  v3 = -[MCDBrowserTableViewController initWithLimitedUI:](&v6, "initWithLimitedUI:", a3);
  v4 = v3;
  if (v3)
    -[MCDLocalBrowserTableViewController setPlayActivityFeatureName:](v3, "setPlayActivityFeatureName:", CFSTR("downloaded_music"));
  return v4;
}

- (id)titleForIdentifier:(id)a3
{
  id v4;
  id MCDRecentlyAddedControllerIdentifier;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  MCDRecentlyAddedControllerIdentifier = getMCDRecentlyAddedControllerIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue(MCDRecentlyAddedControllerIdentifier);
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Recently Downloaded"), &stru_13E1990, 0));

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MCDLocalBrowserTableViewController;
    v10 = -[MCDBrowserTableViewController titleForIdentifier:](&v12, "titleForIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v9;
}

- (BOOL)showOnlyLocalContent
{
  return 1;
}

- (id)_textForHeaderView
{
  return +[NSString downloadedOnlyMessage](NSString, "downloadedOnlyMessage");
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 27.0;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = objc_opt_class(UITableViewHeaderFooterView);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = v8;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v11 = getMCDSetupTableHeaderViewSymbolLoc_ptr;
    v19 = getMCDSetupTableHeaderViewSymbolLoc_ptr;
    if (!getMCDSetupTableHeaderViewSymbolLoc_ptr)
    {
      v12 = (void *)MusicCarDisplayUILibrary_8();
      v11 = dlsym(v12, "MCDSetupTableHeaderView");
      v17[3] = (uint64_t)v11;
      getMCDSetupTableHeaderViewSymbolLoc_ptr = v11;
    }
    _Block_object_dispose(&v16, 8);
    if (!v11)
    {
      v15 = (_Unwind_Exception *)soft_MCDMusicGeneralLogging_cold_1();
      _Block_object_dispose(&v16, 8);
      _Unwind_Resume(v15);
    }
    ((void (*)(id))v11)(v10);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLocalBrowserTableViewController _textForHeaderView](self, "_textForHeaderView", v16));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textLabel"));
    objc_msgSend(v14, "setText:", v13);

  }
}

@end
