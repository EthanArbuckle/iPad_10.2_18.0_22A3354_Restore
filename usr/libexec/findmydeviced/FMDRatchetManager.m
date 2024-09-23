@implementation FMDRatchetManager

+ (BOOL)isFeatureEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LARatchetManager sharedInstance](LARatchetManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "isFeatureEnabled");

  return v3;
}

+ (id)ratchetErrorDeniedWithUnderlyingError:(id)a3
{
  __CFString *v3;
  id v4;
  id v5;
  void *v6;
  NSErrorUserInfoKey v8;
  id v9;

  v3 = off_100304A10;
  if (a3)
  {
    v8 = NSUnderlyingErrorKey;
    v9 = a3;
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 1, v5));

  }
  else
  {
    v5 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, 1, 0));
  }

  return v6;
}

+ (id)ratchetManageriCloudSignOut
{
  FMDRatchetManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[FMDRatchetManager initWithIdentifier:]([FMDRatchetManager alloc], "initWithIdentifier:", CFSTR("com.apple.findmydevice.ratchet.turnOff"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_REASON_SIGNOUT"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedReason:](v2, "setLocalizedReason:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_BEGIN_TITLE_SIGNOUT"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedBeginTitle:](v2, "setLocalizedBeginTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_BEGIN_SIGNOUT"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedBeginBody:](v2, "setLocalizedBeginBody:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_COUNTDOWN_SIGNOUT"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedCountdownBody:](v2, "setLocalizedCountdownBody:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_CALLOUT_REASON_SIGNOUT"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedCalloutReason:](v2, "setLocalizedCalloutReason:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT")));
  -[FMDRatchetManager setDeepLinkURL:](v2, "setDeepLinkURL:", v8);

  -[FMDRatchetManager setFallbackToNoAuthentication:](v2, "setFallbackToNoAuthentication:", 1);
  return v2;
}

+ (id)ratchetManagerTurnOffFMIP
{
  FMDRatchetManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = -[FMDRatchetManager initWithIdentifier:]([FMDRatchetManager alloc], "initWithIdentifier:", CFSTR("com.apple.findmydevice.ratchet.turnOff"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_REASON_TURN_OFF"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedReason:](v2, "setLocalizedReason:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_BEGIN_TITLE_TURN_OFF"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedBeginTitle:](v2, "setLocalizedBeginTitle:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_BEGIN_TURN_OFF"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedBeginBody:](v2, "setLocalizedBeginBody:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_COUNTDOWN_TURN_OFF"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedCountdownBody:](v2, "setLocalizedCountdownBody:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("FM_RATCHET_CALLOUT_REASON_TURN_OFF"), "fmd_localizedStringInTable:", CFSTR("Localizable-DIMPLEKEY")));
  -[FMDRatchetManager setLocalizedCalloutReason:](v2, "setLocalizedCalloutReason:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING/FindMyDevice-Settings")));
  -[FMDRatchetManager setDeepLinkURL:](v2, "setDeepLinkURL:", v8);

  -[FMDRatchetManager setFallbackToNoAuthentication:](v2, "setFallbackToNoAuthentication:", 1);
  return v2;
}

- (FMDRatchetManager)initWithIdentifier:(id)a3
{
  id v5;
  FMDRatchetManager *v6;
  FMDRatchetManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDRatchetManager;
  v6 = -[FMDRatchetManager init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ratchetIdentifier, a3);

  return v7;
}

- (void)evaluateOperation
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager currentTask](self, "currentTask"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)FMFuture);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000304E0;
    v13[3] = &unk_1002C1570;
    v14 = (id)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager permittedOperationBlock](self, "permittedOperationBlock"));
    v5 = v14;
    v6 = objc_msgSend(v4, "addSuccessBlock:", v13);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000304F4;
    v11[3] = &unk_1002C1598;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager deniedOperationBlock](self, "deniedOperationBlock"));
    v7 = v12;
    v8 = objc_msgSend(v4, "addFailureBlock:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100030508;
    v10[3] = &unk_1002C15C0;
    v10[4] = self;
    v9 = objc_msgSend(v4, "addCompletionBlock:", v10);
    -[FMDRatchetManager setCurrentTask:](self, "setCurrentTask:", v4);
    -[FMDRatchetManager armRatchetIfNeeded](self, "armRatchetIfNeeded");

  }
}

- (id)ratchetOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[7];

  v12[0] = &off_1002D8008;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager localizedReason](self, "localizedReason"));
  v13[0] = v3;
  v12[1] = &off_1002D8020;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager localizedCalloutReason](self, "localizedCalloutReason"));
  v13[1] = v4;
  v12[2] = &off_1002D8038;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager deepLinkURL](self, "deepLinkURL"));
  v13[2] = v5;
  v12[3] = &off_1002D8050;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager localizedBeginTitle](self, "localizedBeginTitle"));
  v13[3] = v6;
  v12[4] = &off_1002D8068;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager localizedBeginBody](self, "localizedBeginBody"));
  v13[4] = v7;
  v12[5] = &off_1002D8080;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager localizedCountdownBody](self, "localizedCountdownBody"));
  v13[5] = v8;
  v12[6] = &off_1002D8098;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDRatchetManager fallbackToNoAuthentication](self, "fallbackToNoAuthentication")));
  v13[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 7));

  return v10;
}

- (void)armRatchetIfNeeded
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchet](self, "ratchet"));

  if (v3)
  {
    v4 = sub_10005334C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchetIdentifier](self, "ratchetIdentifier"));
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ratchet already initialized %@.", buf, 0xCu);

    }
  }
  else
  {
    v7 = objc_alloc((Class)LARatchet);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchetIdentifier](self, "ratchetIdentifier"));
    v5 = objc_msgSend(v7, "initWithIdentifier:", v8);

    -[FMDRatchetManager setRatchet:](self, "setRatchet:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchetOptions](self, "ratchetOptions"));
    v10 = sub_10005334C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchetIdentifier](self, "ratchetIdentifier"));
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Arming ratchet %@ with options %@.", buf, 0x16u);

    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003088C;
    v13[3] = &unk_1002C15E8;
    v13[4] = self;
    -[NSObject armWithOptions:completion:](v5, "armWithOptions:completion:", v9, v13);

  }
}

- (void)handleRatchetError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", LARatchetErrorUserInfoKeyState));

  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v4, "code");
    v9 = sub_10005334C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchetIdentifier](self, "ratchetIdentifier"));
        v13 = objc_msgSend(v7, "rawValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
        v21 = 138412802;
        v22 = v12;
        v23 = 2048;
        v24 = v13;
        v25 = 2112;
        v26 = v14;
        v15 = "Unexpected failure to arm ratchet %@ state %li, error: %@.";
LABEL_12:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v21, 0x20u);

      }
    }
    else if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager ratchetIdentifier](self, "ratchetIdentifier"));
      v20 = objc_msgSend(v7, "rawValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
      v21 = 138412802;
      v22 = v12;
      v23 = 2048;
      v24 = v20;
      v25 = 2112;
      v26 = v14;
      v15 = "Failed to arm ratchet %@ state %li, error: %@.";
      goto LABEL_12;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager currentTask](self, "currentTask"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDRatchetManager ratchetErrorDeniedWithUnderlyingError:](FMDRatchetManager, "ratchetErrorDeniedWithUnderlyingError:", v4));
    objc_msgSend(v18, "finishWithError:", v19);

    goto LABEL_10;
  }
  v16 = sub_10005334C();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_1002275D0(self, v4, v17);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FMDRatchetManager currentTask](self, "currentTask"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDRatchetManager ratchetErrorDeniedWithUnderlyingError:](FMDRatchetManager, "ratchetErrorDeniedWithUnderlyingError:", v4));
  objc_msgSend(v7, "finishWithError:", v18);
LABEL_10:

}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(id)a3
{
  objc_storeStrong((id *)&self->_localizedReason, a3);
}

- (NSString)localizedBeginTitle
{
  return self->_localizedBeginTitle;
}

- (void)setLocalizedBeginTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedBeginTitle, a3);
}

- (NSString)localizedBeginBody
{
  return self->_localizedBeginBody;
}

- (void)setLocalizedBeginBody:(id)a3
{
  objc_storeStrong((id *)&self->_localizedBeginBody, a3);
}

- (NSString)localizedCountdownBody
{
  return self->_localizedCountdownBody;
}

- (void)setLocalizedCountdownBody:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCountdownBody, a3);
}

- (NSString)localizedCalloutReason
{
  return self->_localizedCalloutReason;
}

- (void)setLocalizedCalloutReason:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCalloutReason, a3);
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void)setDeepLinkURL:(id)a3
{
  objc_storeStrong((id *)&self->_deepLinkURL, a3);
}

- (BOOL)fallbackToNoAuthentication
{
  return self->_fallbackToNoAuthentication;
}

- (void)setFallbackToNoAuthentication:(BOOL)a3
{
  self->_fallbackToNoAuthentication = a3;
}

- (id)permittedOperationBlock
{
  return self->_permittedOperationBlock;
}

- (void)setPermittedOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deniedOperationBlock
{
  return self->_deniedOperationBlock;
}

- (void)setDeniedOperationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)ratchetIdentifier
{
  return self->_ratchetIdentifier;
}

- (void)setRatchetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_ratchetIdentifier, a3);
}

- (LARatchet)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
  objc_storeStrong((id *)&self->_ratchet, a3);
}

- (FMFuture)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_ratchet, 0);
  objc_storeStrong((id *)&self->_ratchetIdentifier, 0);
  objc_storeStrong(&self->_deniedOperationBlock, 0);
  objc_storeStrong(&self->_permittedOperationBlock, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_localizedCalloutReason, 0);
  objc_storeStrong((id *)&self->_localizedCountdownBody, 0);
  objc_storeStrong((id *)&self->_localizedBeginBody, 0);
  objc_storeStrong((id *)&self->_localizedBeginTitle, 0);
  objc_storeStrong((id *)&self->_localizedReason, 0);
}

@end
