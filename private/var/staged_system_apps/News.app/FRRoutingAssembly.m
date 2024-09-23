@implementation FRRoutingAssembly

- (FRRoutingAssembly)initWithFeldsparContext:(id)a3 bridgedAppDelegate:(id)a4 window:(id)a5
{
  id v9;
  id v10;
  id v11;
  FRRoutingAssembly *v12;
  FRRoutingAssembly *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007E44C();
  v15.receiver = self;
  v15.super_class = (Class)FRRoutingAssembly;
  v12 = -[FRRoutingAssembly init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_feldsparContext, a3);
    objc_storeWeak((id *)&v13->_bridgedAppDelegate, v10);
    objc_storeStrong((id *)&v13->_window, a5);
  }

  return v13;
}

- (void)loadInRegistry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callback"));
  v6 = TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "whenResolvingProtocol:scope:callbackBlock:", &OBJC_PROTOCOL___FRURLRouterManagerType, v7, &stru_1000DBC78);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v9 = objc_msgSend(v8, "registerProtocol:factory:", &OBJC_PROTOCOL___FRURLRouterManagerType, &stru_1000DBCB8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v12 = objc_msgSend(v10, "registerClass:factory:", objc_opt_class(FRURLRouterManager, v11), &stru_1000DBCF8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v15 = objc_msgSend(v13, "registerClass:factory:", objc_opt_class(FRVanityURLRouterManager, v14), &stru_1000DBD38);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000AF20;
  v49[3] = &unk_1000DBD60;
  v49[4] = self;
  v17 = objc_msgSend(v16, "registerProtocol:factory:", &OBJC_PROTOCOL___FRUserNotificationResponseHandlerType, v49);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v20 = objc_msgSend(v18, "registerClass:factory:", objc_opt_class(FCVanityURLRedirectService, v19), &stru_1000DBDA0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v22 = objc_msgSend(v21, "registerProtocol:factory:", &OBJC_PROTOCOL___FRURLAnalyticsReferralFactory, &stru_1000DBDE0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v25 = objc_msgSend(v23, "registerClass:factory:", objc_opt_class(FRURLAnalyticsReferralFactory, v24), &stru_1000DBE20);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v28 = objc_msgSend(v26, "registerClass:factory:", objc_opt_class(FRUnrecognizedURLRouter, v27), &stru_1000DBE60);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v30 = objc_msgSend(v29, "withConfiguration:", &stru_1000DBEA0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "registerProtocol:factory:", &OBJC_PROTOCOL___TSExplicitContentRestrictionAlertPresenter, &stru_1000DBEE0));
  v33 = objc_msgSend(v32, "inScope:", 2);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FRRoutingAssembly bridgedAppDelegate](self, "bridgedAppDelegate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v37 = objc_opt_class(FRNewsBridgeDeeplinkRouter, v36);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100005E8C;
  v47[3] = &unk_1000DBF08;
  v48 = v34;
  v38 = v34;
  v39 = objc_msgSend(v35, "registerClass:factory:", v37, v47);

  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v41 = objc_msgSend(v40, "registerProtocol:factory:", &OBJC_PROTOCOL___TSNewsActivityIntentSerializer, &stru_1000DBF48);

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v43 = objc_msgSend(v42, "registerProtocol:factory:", &OBJC_PROTOCOL___TSNewsActivityIntentDeserializer, &stru_1000DBF68);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000422A8;
  v46[3] = &unk_1000DA578;
  v46[4] = self;
  v45 = objc_msgSend(v44, "registerProtocol:factory:", &OBJC_PROTOCOL___TSWelcomeDataManagerType, v46);

}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (UIApplicationDelegate)bridgedAppDelegate
{
  return (UIApplicationDelegate *)objc_loadWeakRetained((id *)&self->_bridgedAppDelegate);
}

- (UIWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_bridgedAppDelegate);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end
