@implementation BEWKWebView

- (BEWKWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  BEWKWebView *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSMutableArray *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BEWKWebView;
  v4 = -[BEWKWebView initWithFrame:configuration:](&v10, "initWithFrame:configuration:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_3779E0));
    -[BEWKWebView _setInteractionTintColor:](v4, "_setInteractionTintColor:", v5);

    v6 = objc_opt_new(NSMutableSet);
    -[BEWKWebView setRegisteredFonts:](v4, "setRegisteredFonts:", v6);

    v7 = objc_opt_new(NSMutableSet);
    -[BEWKWebView setFontsAttemptingRegistration:](v4, "setFontsAttemptingRegistration:", v7);

    v8 = objc_opt_new(NSMutableArray);
    -[BEWKWebView setPendingFontRegistrationHandlers:](v4, "setPendingFontRegistrationHandlers:", v8);

    v4->_be_finishedInit = 1;
  }
  return v4;
}

- (BEWKWebView)initWithCoder:(id)a3
{
  BEWKWebView *v3;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BEWKWebView;
  v3 = -[BEWKWebView initWithCoder:](&v8, "initWithCoder:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", &stru_3779E0));
    -[BEWKWebView _setInteractionTintColor:](v3, "_setInteractionTintColor:", v4);

    v5 = objc_opt_new(NSMutableSet);
    -[BEWKWebView setRegisteredFonts:](v3, "setRegisteredFonts:", v5);

    v6 = objc_opt_new(NSMutableSet);
    -[BEWKWebView setFontsAttemptingRegistration:](v3, "setFontsAttemptingRegistration:", v6);

    v3->_be_finishedInit = 1;
  }
  return v3;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  BEWKWebView *v7;

  v3 = _BookEPUBLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Dealloc of #reuse webView:%@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)BEWKWebView;
  -[BEWKWebView dealloc](&v5, "dealloc");
}

- (BOOL)be_isLoadingSuspended
{
  return self->_be_suspendCount > 0;
}

- (void)be_suspendLoading
{
  int64_t be_suspendCount;

  -[BEWKWebView _be_validateSuspendCount](self, "_be_validateSuspendCount");
  be_suspendCount = self->_be_suspendCount;
  if (be_suspendCount >= 0x7FFFFFFFFFFFFFFDLL)
    be_suspendCount = 0x7FFFFFFFFFFFFFFDLL;
  self->_be_suspendCount = be_suspendCount + 1;
}

- (void)be_resumeLoading
{
  int64_t be_suspendCount;
  int64_t v4;

  -[BEWKWebView _be_validateSuspendCount](self, "_be_validateSuspendCount");
  be_suspendCount = self->_be_suspendCount;
  if (be_suspendCount <= 1)
    be_suspendCount = 1;
  v4 = be_suspendCount - 1;
  self->_be_suspendCount = v4;
  if (!v4)
    -[BEWKWebView _be_sendPendingLoad](self, "_be_sendPendingLoad");
}

- (void)setBe_imageFilterMode:(unint64_t)a3
{
  self->_be_imageFilterMode = a3;
}

- (unint64_t)be_imageFilterMode
{
  return self->_be_imageFilterMode;
}

- (BOOL)be_isFontRegistered:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView registeredFonts](self, "registeredFonts"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)be_clearRegisteredFonts
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  BEWKWebView *v10;

  v3 = _BookEPUBLog();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_identifier](self, "be_identifier"));
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Clearing registered fonts for webView:%@ self:%@", (uint8_t *)&v7, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView registeredFonts](self, "registeredFonts"));
  objc_msgSend(v6, "removeAllObjects");

}

- (void)be_processPendingFontRegistration
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD v11[4];
  id v12;
  BEWKWebView *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView pendingFontRegistrationHandlers](self, "pendingFontRegistrationHandlers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView pendingFontRegistrationHandlers](self, "pendingFontRegistrationHandlers"));
    v6 = objc_msgSend(v5, "copy");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView pendingFontRegistrationHandlers](self, "pendingFontRegistrationHandlers"));
    objc_msgSend(v7, "removeAllObjects");

    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v8));
        if (v8 >= (char *)objc_msgSend(v6, "count") - 1)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_A648;
          v11[3] = &unk_377928;
          v12 = v9;
          v13 = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
          v10 = (void (**)(_QWORD, _QWORD))v12;
        }
        else
        {
          v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fontRegistrationHandler"));
          v10[2](v10, 2);
        }

        ++v8;
      }
      while (v8 < objc_msgSend(v6, "count"));
    }

  }
}

- (void)be_configureFontWithStyleManager:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  id v8;
  NSObject *v9;
  void *v10;
  _BEWKWebViewPendingFontRegistration *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  _QWORD v15[5];
  void (**v16)(id, uint64_t);
  uint8_t buf[4];
  void *v18;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v6)
  {
    if (-[BEWKWebView attemptingFontRegistration](self, "attemptingFontRegistration"))
    {
      v8 = _BookEPUBLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Deferring #fontReg of #fontFamily '%{public}@'", buf, 0xCu);

      }
      v11 = objc_opt_new(_BEWKWebViewPendingFontRegistration);
      -[_BEWKWebViewPendingFontRegistration setStyleManager:](v11, "setStyleManager:", v6);
      -[_BEWKWebViewPendingFontRegistration setFontRegistrationHandler:](v11, "setFontRegistrationHandler:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView pendingFontRegistrationHandlers](self, "pendingFontRegistrationHandlers"));
      objc_msgSend(v12, "addObject:", v11);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
      v14 = -[BEWKWebView be_isFontRegistered:](self, "be_isFontRegistered:", v13);

      if (v14)
      {
        -[BEWKWebView be_willAttemptFontRegistration](self, "be_willAttemptFontRegistration");
        -[BEWKWebView be_fontRegistrationCompleted:](self, "be_fontRegistrationCompleted:", 1);
        v7[2](v7, 1);
      }
      else
      {
        -[BEWKWebView setAttemptingFontRegistration:](self, "setAttemptingFontRegistration:", 1);
        -[BEWKWebView be_willAttemptFontRegistration](self, "be_willAttemptFontRegistration");
        -[BEWKWebView _grantAccessToAssetServices](self, "_grantAccessToAssetServices");
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_A964;
        v15[3] = &unk_377950;
        v15[4] = self;
        v16 = v7;
        -[BEWKWebView _registerFontFamily:completion:](self, "_registerFontFamily:completion:", v6, v15);

      }
    }
  }
  else
  {
    -[BEWKWebView be_willAttemptFontRegistration](self, "be_willAttemptFontRegistration");
    -[BEWKWebView be_fontRegistrationCompleted:](self, "be_fontRegistrationCompleted:", 0);
    v7[2](v7, 0);
  }

}

- (NSDictionary)be_viewportArguments
{
  return (NSDictionary *)&off_395AF0;
}

- (void)_be_sendPendingLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _BEWKWebViewPendingLoad *be_pendingRequest;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BEWKWebViewPendingLoad data](self->_be_pendingRequest, "data"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BEWKWebViewPendingLoad request](self->_be_pendingRequest, "request"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BEWKWebViewPendingLoad response](self->_be_pendingRequest, "response"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BEWKWebViewPendingLoad data](self->_be_pendingRequest, "data"));
    v8 = -[BEWKWebView loadSimulatedRequest:response:responseData:](self, "loadSimulatedRequest:response:responseData:", v5, v6, v7);

LABEL_5:
    goto LABEL_6;
  }

  if (v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BEWKWebViewPendingLoad request](self->_be_pendingRequest, "request"));
    v9 = -[BEWKWebView loadRequest:](self, "loadRequest:", v5);
    goto LABEL_5;
  }
LABEL_6:
  be_pendingRequest = self->_be_pendingRequest;
  self->_be_pendingRequest = 0;

}

- (void)_registerFontFamily:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  char v13;
  void *v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  void (**v32)(id, uint64_t);
  __int128 *p_buf;
  id v34;
  id location;
  __int128 buf;
  uint64_t v37;
  char v38;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "font"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView registeredFonts](self, "registeredFonts"));
  v10 = objc_msgSend(v9, "containsObject:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView fontsAttemptingRegistration](self, "fontsAttemptingRegistration"));
  v12 = objc_msgSend(v11, "containsObject:", v8);

  if (objc_msgSend(v8, "length"))
    v13 = v10;
  else
    v13 = 1;
  if ((v13 & 1) != 0 || (v12 & 1) != 0)
  {
    if (!objc_msgSend(v8, "length"))
    {
LABEL_21:
      v7[2](v7, 1);
      goto LABEL_22;
    }
    v15 = _BookEPUBLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v17)
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        v18 = "#FontFamily '%{public}@' already #fontReg";
LABEL_19:
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, v18, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v17)
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      v18 = "#FontFamily '%{public}@' already attempting #fontReg";
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  if (objc_msgSend(v6, "isFontPreregistered:", v8))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView registeredFonts](self, "registeredFonts"));
    objc_msgSend(v14, "addObject:", v8);

    -[BEWKWebView be_fontFamilySuccessfullyRegistered:](self, "be_fontFamilySuccessfullyRegistered:", v8);
    v7[2](v7, 1);
  }
  else if ((objc_msgSend(v6, "isFontAvailable:", v8) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView _processPluginProxy](self, "_processPluginProxy"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView fontsAttemptingRegistration](self, "fontsAttemptingRegistration"));
      objc_msgSend(v20, "addObject:", v8);

      v21 = _BookEPUBLog();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Attempting #fontReg of #fontFamily '%{public}@'", (uint8_t *)&buf, 0xCu);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v37 = 0x2020000000;
      v38 = 0;
      objc_initWeak(&location, self);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_AF40;
      v30[3] = &unk_377978;
      objc_copyWeak(&v34, &location);
      v31 = v8;
      p_buf = &buf;
      v32 = v7;
      objc_msgSend(v19, "registerFontFamily:completion:", v31, v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v25 = _BookEPUBLog();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_ERROR, "Failed to get process plugin/proxy! Unable to #fontReg fontFamily:%{public}@", (uint8_t *)&buf, 0xCu);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView fontsAttemptingRegistration](self, "fontsAttemptingRegistration"));
      objc_msgSend(v27, "addObject:", v8);

      v28 = _BookEPUBLog();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_FAULT, "Unable to access process plugin failure #fontReg #fontFamily '%{public}@'", (uint8_t *)&buf, 0xCu);
      }

      -[BEWKWebView be_fontFamilyFailedToRegister:](self, "be_fontFamilyFailedToRegister:", v8);
      v7[2](v7, 0);
    }

  }
  else
  {
    v23 = _BookEPUBLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Skipping #fontReg of #fontFamily '%{public}@' because it is not yet available", (uint8_t *)&buf, 0xCu);
    }

    -[BEWKWebView be_fontFamilyFailedToRegister:](self, "be_fontFamilyFailedToRegister:", v8);
    v7[2](v7, 0);
  }
LABEL_22:

}

- (void)be_containsProtectedContent
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BEWKWebView _processPluginProxy](self, "_processPluginProxy"));
  objc_msgSend(v2, "processContainsProtectedContent");

}

- (void)be_enableAX
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BEWKWebView _processPluginProxy](self, "_processPluginProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_identifier](self, "be_identifier"));
  objc_msgSend(v4, "enableAXWithIdentifier:", v3);

}

- (void)be_updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BEWKWebView _processPluginProxy](self, "_processPluginProxy"));
  objc_msgSend(v8, "updateAXCurrentReadingStateWithMessage:forValue:", v7, v6);

}

- (id)be_updateAXValueForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];

  v8[0] = CFSTR("BEWebProcessPluginIdentifierParameterKey");
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_identifier](self, "be_identifier"));
  v8[1] = CFSTR("BEWebProcessPluginMessageParameterKey");
  v9[0] = v5;
  v9[1] = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));

  return v6;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView webProcessPluginProxy](self, "webProcessPluginProxy"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView _remoteObjectRegistry](self, "_remoteObjectRegistry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:](_WKRemoteObjectInterface, "remoteObjectInterfaceWithProtocol:", &OBJC_PROTOCOL___BEWebProcessControllerProtocol));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithInterface:", v5));
    -[BEWKWebView setWebProcessPluginProxy:](self, "setWebProcessPluginProxy:", v6);

    if (!v5
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView webProcessPluginProxy](self, "webProcessPluginProxy")),
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
  return (id)objc_claimAutoreleasedReturnValue(-[BEWKWebView webProcessPluginProxy](self, "webProcessPluginProxy"));
}

- (CGPoint)_initialContentOffsetForScrollView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_requestedContentOffset](self, "be_requestedContentOffset"));
  v10.receiver = self;
  v10.super_class = (Class)BEWKWebView;
  -[BEWKWebView _initialContentOffsetForScrollView](&v10, "_initialContentOffsetForScrollView");
  if (v3)
    objc_msgSend(v3, "CGPointValue");
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_layerTreeCommitComplete
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BEWKWebView;
  -[BEWKWebView _layerTreeCommitComplete](&v3, "_layerTreeCommitComplete");
  -[BEWKWebView _be_forceInitialContentOffset](self, "_be_forceInitialContentOffset");
}

- (void)_be_forceInitialContentOffset
{
  -[BEWKWebView be_applyRequestedContentOffset](self, "be_applyRequestedContentOffset");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v6 = a4;
  v7 = NSStringFromSelector(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (objc_msgSend(&off_395B40, "containsObject:", v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)BEWKWebView;
    v9 = -[BEWKWebView canPerformAction:withSender:](&v11, "canPerformAction:withSender:", a3, v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  double y;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double x;
  void *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];

  v4 = a3;
  y = CGPointZero.y;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_textInputChild](self, "be_textInputChild"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    v12 = y;
    x = CGPointZero.x;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(UIContextMenuInteraction);
        v17 = BUDynamicCast(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "locationInView:", self);
          v22 = v20;
          v23 = v21;
          if (CGPointZero.x == v20 && y == v21)
          {
            v12 = v21;
            x = v20;
          }
          else
          {
            v12 = 1.79769313e308;
            v25 = v20 == 1.79769313e308 && v21 == 1.79769313e308;
            x = 1.79769313e308;
            if (!v25)
            {

              v12 = v23;
              x = v22;
              goto LABEL_21;
            }
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v10);
  }
  else
  {
    v12 = y;
    x = CGPointZero.x;
  }
LABEL_21:

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_textInputChild](self, "be_textInputChild"));
  -[BEWKWebView convertPoint:toView:](self, "convertPoint:toView:", v26, x, v12);
  v28 = v27;
  v30 = v29;

  v31 = _BookEPUBLog();
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(double *)v37 = x;
    *(double *)&v37[1] = v12;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v37, "{CGPoint=dd}"));
    *(double *)v36 = v28;
    *(double *)&v36[1] = v30;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v36, "{CGPoint=dd}"));
    *(_DWORD *)buf = 138412546;
    v43 = v33;
    v44 = 2112;
    v45 = v34;
    _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Building context menu at location - viewPoint:%@ contentPoint:%@", buf, 0x16u);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView be_uiHandler](self, "be_uiHandler"));
  objc_msgSend(v35, "buildMenuWithBuilder:inWebView:atPoint:", v4, self, v28, v30);

}

- (id)loadRequest:(id)a3
{
  id v4;
  _BEWKWebViewPendingLoad *v5;
  _BEWKWebViewPendingLoad *be_pendingRequest;
  void *v7;
  id v8;
  objc_super v10;

  v4 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setAttribution:", 1);
  if (-[BEWKWebView be_isLoadingSuspended](self, "be_isLoadingSuspended"))
  {
    v5 = (_BEWKWebViewPendingLoad *)objc_claimAutoreleasedReturnValue(+[_BEWKWebViewPendingLoad pendingLoadWithRequest:](_BEWKWebViewPendingLoad, "pendingLoadWithRequest:", v4));
    be_pendingRequest = self->_be_pendingRequest;
    self->_be_pendingRequest = v5;

    v7 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BEWKWebView;
    v8 = -[BEWKWebView loadRequest:](&v10, "loadRequest:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  return v7;
}

- (id)loadFileURL:(id)a3 allowingReadAccessToURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BEWKWebView loadFileURL:allowingReadAccessToURL:]"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BEWKWebView loadHTMLString:baseURL:]"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)loadData:(id)a3 MIMEType:(id)a4 characterEncodingName:(id)a5 baseURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _BEWKWebViewPendingLoad *v16;
  _BEWKWebViewPendingLoad *be_pendingRequest;
  void *v18;
  id v19;
  objc_super v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v10, v12, objc_msgSend(v13, "length"), v11);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v10));
  objc_msgSend(v15, "setAttribution:", 1);
  if (-[BEWKWebView be_isLoadingSuspended](self, "be_isLoadingSuspended"))
  {
    v16 = (_BEWKWebViewPendingLoad *)objc_claimAutoreleasedReturnValue(+[_BEWKWebViewPendingLoad pendingLoadWithRequest:response:data:](_BEWKWebViewPendingLoad, "pendingLoadWithRequest:response:data:", v15, v14, v13));

    be_pendingRequest = self->_be_pendingRequest;
    self->_be_pendingRequest = v16;

    v18 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)BEWKWebView;
    v19 = -[BEWKWebView loadSimulatedRequest:response:responseData:](&v21, "loadSimulatedRequest:response:responseData:", v15, v14, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);

  }
  return v18;
}

- (id)loadSimulatedRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BEWKWebViewPendingLoad *v11;
  _BEWKWebViewPendingLoad *be_pendingRequest;
  void *v13;
  id v14;
  objc_super v16;

  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v10, "setAttribution:", 1);
  if (-[BEWKWebView be_isLoadingSuspended](self, "be_isLoadingSuspended"))
  {
    v11 = (_BEWKWebViewPendingLoad *)objc_claimAutoreleasedReturnValue(+[_BEWKWebViewPendingLoad pendingLoadWithRequest:response:data:](_BEWKWebViewPendingLoad, "pendingLoadWithRequest:response:data:", v10, v9, v8));

    be_pendingRequest = self->_be_pendingRequest;
    self->_be_pendingRequest = v11;

    v13 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)BEWKWebView;
    v14 = -[BEWKWebView loadSimulatedRequest:withResponse:responseData:](&v16, "loadSimulatedRequest:withResponse:responseData:", v10, v9, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  return v13;
}

- (id)loadFileRequest:(id)a3 allowingReadAccessToURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BEWKWebView loadFileRequest:allowingReadAccessToURL:]"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (id)loadSimulatedRequest:(id)a3 withResponseHTMLString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BEWKWebView loadSimulatedRequest:withResponseHTMLString:]"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (CGRect)_visibleContentRect
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char *v18;
  double Width;
  double v20;
  double v21;
  double Height;
  CGFloat MinY;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double MinX;
  objc_super v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect result;

  v31.receiver = self;
  v31.super_class = (Class)BEWKWebView;
  -[BEWKWebView _visibleContentRect](&v31, "_visibleContentRect");
  x = v3;
  y = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView scrollView](self, "scrollView"));
  objc_msgSend(v11, "contentSize");
  v13 = v12;
  v15 = v14;

  -[BEWKWebView be_gutterLength](self, "be_gutterLength");
  v17 = v16;
  v18 = (char *)-[BEWKWebView _paginationMode](self, "_paginationMode");
  if ((unint64_t)(v18 - 3) < 2)
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = v8;
    v34.size.height = v10;
    Height = CGRectGetHeight(v34);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = v8;
    v35.size.height = v10;
    MinY = CGRectGetMinY(v35);
    v24 = fmax(MinY - Height - v17, 0.0);
    if (MinY > 0.0)
      y = v24;
    if (v17 + v17 + Height * 3.0 >= v15)
      v10 = v15;
    else
      v10 = v17 + v17 + Height * 3.0;
  }
  else if ((unint64_t)(v18 - 1) <= 1)
  {
    v29 = v15;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = v8;
    v32.size.height = v10;
    Width = CGRectGetWidth(v32);
    v20 = v17 + Width + v17 + Width;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = v8;
    v33.size.height = v10;
    MinX = CGRectGetMinX(v33);
    if (-[BEWKWebView _paginationMode](self, "_paginationMode") == (char *)&dword_0 + 1)
    {
      if (v13 <= v20)
      {
        x = CGPointZero.x;
        y = CGPointZero.y;
        v10 = v29;
        v8 = v13;
        goto LABEL_19;
      }
      v21 = fmax(MinX - Width - v17, 0.0);
      if (MinX > 0.0)
        x = v21;
    }
    else
    {
      if (v13 <= v20)
        goto LABEL_19;
      x = MinX - Width - v17;
    }
    if (v17 + v17 + Width * 3.0 >= v13)
      v8 = v13;
    else
      v8 = v17 + v17 + Width * 3.0;
  }
LABEL_19:
  v25 = x;
  v26 = y;
  v27 = v8;
  v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGPoint v28;
  CGRect v29;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BEWKWebView _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:", v8));

  v10 = UIAccessibilityPointForPoint(self, x, y);
  v12 = v11;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "accessibilityFrame");
        v28.x = v10;
        v28.y = v12;
        if (CGRectContainsPoint(v29, v28))
        {
          v20 = v18;

          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
        continue;
      break;
    }
  }

  v22.receiver = self;
  v22.super_class = (Class)BEWKWebView;
  v19 = -[BEWKWebView _accessibilityHitTest:withEvent:](&v22, "_accessibilityHitTest:withEvent:", v7, x, y);
  v20 = (id)objc_claimAutoreleasedReturnValue(v19);
LABEL_11:

  return v20;
}

- (BOOL)be_finishedInit
{
  return self->_be_finishedInit;
}

- (_BEWKWebViewPendingLoad)be_pendingRequest
{
  return self->_be_pendingRequest;
}

- (void)setBe_pendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_be_pendingRequest, a3);
}

- (int64_t)be_suspendCount
{
  return self->_be_suspendCount;
}

- (void)setBe_suspendCount:(int64_t)a3
{
  self->_be_suspendCount = a3;
}

- (NSMutableSet)registeredFonts
{
  return self->_registeredFonts;
}

- (void)setRegisteredFonts:(id)a3
{
  objc_storeStrong((id *)&self->_registeredFonts, a3);
}

- (NSMutableSet)fontsAttemptingRegistration
{
  return self->_fontsAttemptingRegistration;
}

- (void)setFontsAttemptingRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_fontsAttemptingRegistration, a3);
}

- (BOOL)attemptingFontRegistration
{
  return self->_attemptingFontRegistration;
}

- (void)setAttemptingFontRegistration:(BOOL)a3
{
  self->_attemptingFontRegistration = a3;
}

- (NSMutableArray)pendingFontRegistrationHandlers
{
  return self->_pendingFontRegistrationHandlers;
}

- (void)setPendingFontRegistrationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingFontRegistrationHandlers, a3);
}

- (BEWebProcessControllerProtocol)webProcessPluginProxy
{
  return self->_webProcessPluginProxy;
}

- (void)setWebProcessPluginProxy:(id)a3
{
  objc_storeStrong((id *)&self->_webProcessPluginProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessPluginProxy, 0);
  objc_storeStrong((id *)&self->_pendingFontRegistrationHandlers, 0);
  objc_storeStrong((id *)&self->_fontsAttemptingRegistration, 0);
  objc_storeStrong((id *)&self->_registeredFonts, 0);
  objc_storeStrong((id *)&self->_be_pendingRequest, 0);
}

@end
