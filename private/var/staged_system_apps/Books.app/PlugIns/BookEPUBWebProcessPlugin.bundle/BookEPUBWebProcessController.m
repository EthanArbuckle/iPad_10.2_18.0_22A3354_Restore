@implementation BookEPUBWebProcessController

- (void)registerFontFamily:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  const __CFDictionary *v7;
  CTFontDescriptorRef v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  const __CFArray *v13;
  id v14;
  id v15;
  BOOL matched;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  CTFontDescriptorRef v22;
  CTFontDescriptorRef v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];

  v5 = a3;
  v6 = a4;
  v26[0] = kCTFontFamilyNameAttribute;
  v26[1] = kCTFontDownloadedAttribute;
  v27[0] = v5;
  v27[1] = &__kCFBooleanTrue;
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2));
  v8 = CTFontDescriptorCreateWithAttributes(v7);

  v9 = _BookEPUBWebProcessPluginLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Attempting registration for #fontFamily '%{public}@'", buf, 0xCu);
  }

  if (!v8)
  {
    v11 = _BookEPUBWebProcessPluginLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v5;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to get font descriptor for #fontFamily:'%{public}@'", buf, 0xCu);
    }

  }
  v23 = v8;
  v13 = (const __CFArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_C3E8;
  v19[3] = &unk_20828;
  v14 = v5;
  v20 = v14;
  v22 = v8;
  v15 = v6;
  v21 = v15;
  matched = CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v13, 0, v19);

  if (!matched)
  {
    v17 = _BookEPUBWebProcessPluginLog();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v14;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_FAULT, "Failed to get font descriptor for #fontFamily: %{public}@", buf, 0xCu);
    }

    CFRelease(v8);
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
  }

}

- (void)enableAXWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BookEPUBWebProcessController webProcessPlugin](self, "webProcessPlugin"));
  v6 = _BookEPUBWebProcessPluginLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Enabling AX on:%@", (uint8_t *)&v10, 0xCu);
    }

    v9 = +[BEAccessibilityManager sharedInstance](BEAccessibilityManager, "sharedInstance");
    +[BEAXWebContentUtilities setWebProcessPlugin:](BEAXWebContentUtilities, "setWebProcessPlugin:", v5);
    objc_msgSend(v5, "setBe_identifier:", v4);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Error initializing AX - no webProcessPlugin", (uint8_t *)&v10, 2u);
    }

  }
}

- (void)updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BookEPUBWebProcessController webProcessPlugin](self, "webProcessPlugin"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "updateCurrentReadingState:forKeyPath:", v7, v6);
  }
  else
  {
    v10 = _BookEPUBWebProcessPluginLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "Error passing AX message - no webProcessPlugin", v12, 2u);
    }

  }
}

- (BookEPUBWebProcessPlugin)webProcessPlugin
{
  return (BookEPUBWebProcessPlugin *)objc_loadWeakRetained((id *)&self->_webProcessPlugin);
}

- (void)setWebProcessPlugin:(id)a3
{
  objc_storeWeak((id *)&self->_webProcessPlugin, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webProcessPlugin);
}

@end
