@implementation ICDebugSpinner

- (void)show
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[16];
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebugSpinner windows](self, "windows"));

  v4 = os_log_create("com.apple.notes", "UI");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trying to show debug spinner, but it's already showing", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_100407904(v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = objc_alloc_init((Class)NSMutableArray);
    -[ICDebugSpinner setWindows:](self, "setWindows:", v13);

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppDelegate sharedInstance](ICAppDelegate, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "viewControllerManagers"));

    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v5);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v18), "window"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "windowScene"));

          if (v20)
          {
            v21 = objc_alloc_init((Class)UIWindow);
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebugSpinner windows](self, "windows"));
            objc_msgSend(v22, "addObject:", v21);

            objc_msgSend(v21, "setWindowScene:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
            objc_msgSend(v21, "setBackgroundColor:", v23);

            objc_msgSend(v21, "setWindowLevel:", UIWindowLevelStatusBar);
            objc_msgSend(v21, "makeKeyAndVisible");
            objc_msgSend(v21, "setAlpha:", 0.0);
            v24 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 101);
            TSDCenterOfRect(objc_msgSend(v21, "bounds"));
            objc_msgSend(v24, "setCenter:");
            objc_msgSend(v24, "startAnimating");
            objc_msgSend(v24, "setHidden:", 0);
            objc_msgSend(v21, "addSubview:", v24);
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100077AEC;
            v26[3] = &unk_100550110;
            v27 = v21;
            v25 = v21;
            +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v26, 0.25);

          }
          else
          {
            +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((scene) != nil)", "-[ICDebugSpinner show]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "scene");
          }

          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v16);
    }
  }

}

- (void)hide
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  ICDebugSpinner *v17;
  _QWORD v18[4];
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100407938(v3, v4, v5, v6, v7, v8, v9, v10);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebugSpinner windows](self, "windows"));
  v12 = objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100077CB4;
        v20[3] = &unk_100550110;
        v20[4] = v19;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100077CC0;
        v18[3] = &unk_100550BE8;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v20, v18, 0.25);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[ICDebugSpinner setWindows:](v17, "setWindows:", 0);
}

- (NSMutableArray)windows
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWindows:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windows, 0);
}

@end
