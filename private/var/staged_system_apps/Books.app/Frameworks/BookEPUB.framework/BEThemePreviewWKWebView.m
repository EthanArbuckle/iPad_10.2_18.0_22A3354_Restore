@implementation BEThemePreviewWKWebView

- (BEThemePreviewWKWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  BEThemePreviewWKWebView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BEThemePreviewWKWebView;
  v4 = -[BEThemePreviewWKWebView initWithFrame:configuration:](&v7, "initWithFrame:configuration:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[BEThemePreviewWKWebView setRegisteredFonts:](v4, "setRegisteredFonts:", v5);

    -[BEThemePreviewWKWebView _grantAccessToAssetServices](v4, "_grantAccessToAssetServices");
  }
  return v4;
}

- (id)_processPluginProxy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView webProcessPluginProxy](self, "webProcessPluginProxy"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView _remoteObjectRegistry](self, "_remoteObjectRegistry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:](_WKRemoteObjectInterface, "remoteObjectInterfaceWithProtocol:", &OBJC_PROTOCOL___BEWebProcessControllerProtocol));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithInterface:", v5));
    -[BEThemePreviewWKWebView setWebProcessPluginProxy:](self, "setWebProcessPluginProxy:", v6);

    if (!v5
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView webProcessPluginProxy](self, "webProcessPluginProxy")),
          v7,
          !v7))
    {
      v8 = _BookEPUBLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to get process plugin/proxy!", v11, 2u);
      }

    }
  }
  return (id)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView webProcessPluginProxy](self, "webProcessPluginProxy"));
}

- (void)be_registerFontFamilyForStyleManager:(id)a3 fontFamily:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    if ((objc_msgSend(v6, "isFontPreregistered:", v7) & 1) == 0)
    {
      if (objc_msgSend(v6, "isFontAvailable:", v7))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView registeredFonts](self, "registeredFonts"));
        v9 = objc_msgSend(v8, "containsObject:", v7);

        if ((v9 & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView _processPluginProxy](self, "_processPluginProxy"));
          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEThemePreviewWKWebView registeredFonts](self, "registeredFonts"));
            objc_msgSend(v11, "addObject:", v7);

            v12 = _BookEPUBLog();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v20 = v7;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Attempting ThemePreview #fontReg of #fontFamily '%{public}@'", buf, 0xCu);
            }

            objc_initWeak((id *)buf, self);
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_C610;
            v16[3] = &unk_3779A0;
            objc_copyWeak(&v18, (id *)buf);
            v17 = v7;
            objc_msgSend(v10, "registerFontFamily:completion:", v17, v16);

            objc_destroyWeak(&v18);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            v14 = _BookEPUBLog();
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v20 = v7;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to get ThemePreview process plugin/proxy! Unable to #fontReg fontFamily:%{public}@", buf, 0xCu);
            }

          }
        }
      }
    }
  }

}

- (BEWebProcessControllerProtocol)webProcessPluginProxy
{
  return self->_webProcessPluginProxy;
}

- (void)setWebProcessPluginProxy:(id)a3
{
  objc_storeStrong((id *)&self->_webProcessPluginProxy, a3);
}

- (NSMutableSet)registeredFonts
{
  return self->_registeredFonts;
}

- (void)setRegisteredFonts:(id)a3
{
  objc_storeStrong((id *)&self->_registeredFonts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredFonts, 0);
  objc_storeStrong((id *)&self->_webProcessPluginProxy, 0);
}

@end
