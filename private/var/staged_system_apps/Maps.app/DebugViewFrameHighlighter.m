@implementation DebugViewFrameHighlighter

+ (BOOL)frameHighlightingEnabled
{
  const char *Uid;
  uint64_t v3;
  id v5;
  NSObject *v6;
  int v7;
  const char *Name;

  Uid = sel_getUid("_toolsDebugColorViewBounds");
  v3 = objc_opt_class(UIView);
  if ((objc_opt_respondsToSelector(v3, Uid) & 1) != 0)
    return objc_msgSend((id)objc_opt_class(UIView), Uid);
  v5 = sub_1008F7B98();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    Name = sel_getName(Uid);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "UIView.class doesn't respond to %s", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

+ (void)setFrameHighlightingEnabled:(BOOL)a3 persistToDefaults:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  const char *Uid;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *Name;

  v4 = a4;
  v5 = a3;
  Uid = sel_getUid("_enableToolsDebugColorViewBounds:");
  v7 = objc_opt_class(UIView);
  if ((objc_opt_respondsToSelector(v7, Uid) & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(UIView), Uid, v5);
    if (v4)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v11, "setBool:forKey:", v5, CFSTR("kDebugViewFrameHighlightingEnabledDefaultsKey"));

    }
  }
  else
  {
    v8 = sub_1008F7B98();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      Name = sel_getName(Uid);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "UIView.class doesn't respond to %s", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v10, "setBool:forKey:", 0, CFSTR("kDebugViewFrameHighlightingEnabledDefaultsKey"));

  }
}

+ (void)setFrameHighlightingEnabled:(BOOL)a3
{
  objc_msgSend(a1, "setFrameHighlightingEnabled:persistToDefaults:", a3, 1);
}

+ (BOOL)shouldHighlightOnLaunch
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kDebugViewFrameHighlightingEnabledDefaultsKey"));

  return v3;
}

@end
