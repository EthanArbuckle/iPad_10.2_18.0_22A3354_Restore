@implementation MCDRootController

- (MCDRootController)initWithWindow:(id)a3
{
  id v5;
  MCDRootController *v6;
  MCDRootController *v7;
  NSArray *tabIdentifiers;
  MCDBrowserViewController *v9;
  MCDBrowserViewController *browserViewController;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCDRootController;
  v6 = -[MCDRootController init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_carDisplayWindow, a3);
    -[UIWindow setHidden:](v7->_carDisplayWindow, "setHidden:", 0);
    tabIdentifiers = v7->_tabIdentifiers;
    v7->_tabIdentifiers = (NSArray *)&__NSArray0__struct;

    v9 = objc_opt_new(MCDBrowserViewController);
    browserViewController = v7->_browserViewController;
    v7->_browserViewController = v9;

    -[UIWindow setRootViewController:](v7->_carDisplayWindow, "setRootViewController:", v7->_browserViewController);
  }

  return v7;
}

- (void)sceneDidDisconnect
{
  -[MCDBrowserViewController MCD_popNowPlayingViewControllerAnimated:](self->_browserViewController, "MCD_popNowPlayingViewControllerAnimated:", 0);
}

- (void)showNowPlaying:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t (*v5)(void);
  uint64_t v6;
  NSObject *v7;
  _Unwind_Exception *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = (uint64_t (*)(void))off_1011ECE18;
  v13 = off_1011ECE18;
  if (!off_1011ECE18)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000317F0;
    v9[3] = &unk_1010A89D8;
    v9[4] = &v10;
    sub_1000317F0((uint64_t)v9);
    v5 = (uint64_t (*)(void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    v8 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v8);
  }
  v6 = v5();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Launching to Now Playing", (uint8_t *)v9, 2u);
  }

  -[MCDBrowserViewController pushNowPlaying:](self->_browserViewController, "pushNowPlaying:", v3);
}

- (void)showSharePlayTogetherSettings
{
  -[MCDBrowserViewController pushSharePlayTogetherSettings](self->_browserViewController, "pushSharePlayTogetherSettings");
}

- (void)setTabIdentifiers:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_tabIdentifiers, a3);
  v5 = a3;
  -[MCDBrowserViewController setTabIdentifiers:](self->_browserViewController, "setTabIdentifiers:", v5);

}

- (void)reloadTabsContent
{
  -[MCDBrowserViewController reloadTabsContent](self->_browserViewController, "reloadTabsContent");
}

- (UIWindow)carDisplayWindow
{
  return self->_carDisplayWindow;
}

- (NSArray)tabIdentifiers
{
  return self->_tabIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIdentifiers, 0);
  objc_storeStrong((id *)&self->_carDisplayWindow, 0);
  objc_storeStrong((id *)&self->_browserViewController, 0);
}

@end
