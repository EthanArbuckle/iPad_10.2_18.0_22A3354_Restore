@implementation JSAEnvironment

- (JSAEnvironment)init
{
  JSAEnvironment *v2;
  JSAEnvironment *v3;
  NSString *appVersion;
  JSAThread *v5;
  JSAThread *thread;
  void ***v7;
  void *v8;
  id v9;
  uint64_t v10;
  BUOSStateHandler *v11;
  BUOSStateHandler *stateDumpHandle;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)JSAEnvironment;
  v2 = -[JSAEnvironment init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    appVersion = v2->_appVersion;
    v2->_appVersion = (NSString *)CFSTR("undefined");

    atomic_store(0, (unsigned int *)&v3->_exceptionHandlerReentrantCount);
    v5 = -[JSAThread initWithName:]([JSAThread alloc], "initWithName:", CFSTR("com.apple.iBooks.JSAThread"));
    thread = v3->_thread;
    v3->_thread = v5;

    objc_initWeak(&location, v3);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_7924;
    v17 = &unk_9DEF0;
    objc_copyWeak(&v18, &location);
    v7 = objc_retainBlock(&v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v14, v15, v16, v17));
    v9 = objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", UIApplicationDidReceiveMemoryWarningNotification, 0, 0, v7);
    sub_7A08(v3);
    if (MGGetBoolAnswer(CFSTR("InternalBuild"), v10))
    {
      v11 = (BUOSStateHandler *)objc_msgSend(objc_alloc((Class)BUOSStateHandler), "initWithTitle:block:", CFSTR("ScriptingLocalStorage"), &stru_9DF30);
      stateDumpHandle = v3->_stateDumpHandle;
      v3->_stateDumpHandle = v11;

    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JSManagedValue value](self->_nativeJSObject, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "virtualMachine"));
  objc_msgSend(v6, "removeManagedReference:withOwner:", self->_nativeJSObject, self);

  v7.receiver = self;
  v7.super_class = (Class)JSAEnvironment;
  -[JSAEnvironment dealloc](&v7, "dealloc");
}

- (id)appForOwnership
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id result;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[JSAEnvironment context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("App")));

  v6 = objc_msgSend(v4, "toObjectOfClass:", objc_opt_class(JSAApplication, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
LABEL_9:

    return v9;
  }
  v10 = JSALog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    sub_717E4(self, v11);

  if (!+[JSADevice isInternalBuild](JSADevice, "isInternalBuild"))
  {
LABEL_8:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[JSAEnvironment context](self, "context"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "globalObject"));

    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[JSAEnvironment context](self, "context"));
  BUReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/JSApp/JSApp/Infrastructure/JSAEnvironment.m", 127, "-[JSAEnvironment appForOwnership]", "NO", CFSTR("JS code error: Some native JS API that uses globalThis.App as the owner for JSManagedValue is called too early, before JS evaluation is complete. Context: %@"));

  v12 = BUCrashBreakpoint();
  result = (id)BUIsRunningTests(v12);
  if ((result & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[JSAEnvironment context](self, "context"));
    BUCrashFinalThrow(CFSTR("JS code error: Some native JS API that uses globalThis.App as the owner for JSManagedValue is called too early, before JS evaluation is complete. Context: %@"));

    goto LABEL_8;
  }
  __break(1u);
  return result;
}

- (void)loadScriptFromPackage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataAtPath:", CFSTR("app.js")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameForJSContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "version"));
  v10 = objc_msgSend(v7, "isBundled");

  -[JSAEnvironment loadScript:name:version:isBundled:completion:](self, "loadScript:name:version:isBundled:completion:", v11, v8, v9, v10, v6);
}

- (void)loadScript:(id)a3 name:(id)a4 version:(id)a5 isBundled:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  uint8_t buf[4];
  const char *v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = JSALog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v31 = "-[JSAEnvironment loadScript:name:version:isBundled:completion:]";
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "JSAEnvironment %{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[JSAEnvironment thread](self, "thread"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_8764;
  v23[3] = &unk_9DFA8;
  objc_copyWeak(&v28, (id *)buf);
  v19 = v12;
  v24 = v19;
  v20 = v13;
  v25 = v20;
  v21 = v14;
  v26 = v21;
  v29 = a6;
  v22 = v15;
  v27 = v22;
  objc_msgSend(v18, "enqueueBlock:", v23);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);

}

- (void)openURL:(id)a3 referrerURL:(id)a4 referrerApplicationName:(id)a5 options:(id)a6
{
  +[JSAApplication openURL:referrerURL:referrerApplicationName:options:](JSAApplication, "openURL:referrerURL:referrerApplicationName:options:", a3, a4, a5, a6);
}

- (void)registerObjects:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[JSAEnvironment thread](self, "thread"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8B80;
    v6[3] = &unk_9DCF8;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "enqueueBlock:", v6);

  }
}

+ (void)_exposeObjectsAndClassesToContext:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  JSAFoundation *v10;
  _QWORD *v11;
  JSAFoundation *v12;
  _QWORD *v13;
  JSAFoundation *v14;
  _QWORD *v15;
  JSAFoundation *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  JSAFoundation *v55;
  _QWORD v56[4];
  JSAFoundation *v57;
  _QWORD v58[4];
  JSAFoundation *v59;
  _QWORD v60[4];
  JSAFoundation *v61;
  uint8_t buf[16];

  v3 = a3;
  v4 = JSASignpostExecution();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);

  v7 = JSASignpostExecution();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Expose Objects", ", buf, 2u);
  }

  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_953C;
  v60[3] = &unk_9DFD0;
  v10 = objc_alloc_init(JSAFoundation);
  v61 = v10;
  v11 = objc_retainBlock(v60);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("setInterval"));

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_9548;
  v58[3] = &unk_9DFF8;
  v12 = v10;
  v59 = v12;
  v13 = objc_retainBlock(v58);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("clearInterval"));

  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_9554;
  v56[3] = &unk_9DFD0;
  v14 = v12;
  v57 = v14;
  v15 = objc_retainBlock(v56);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("setTimeout"));

  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_9560;
  v54[3] = &unk_9DFF8;
  v16 = v14;
  v55 = v16;
  v17 = objc_retainBlock(v54);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("clearTimeout"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[JSValue valueWithNewObjectInContext:](JSValue, "valueWithNewObjectInContext:", v3));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("native"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAAccountController, v19), CFSTR("AccountController"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &stru_9E038, CFSTR("currentPackage"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_95AC;
  v52[3] = &unk_9E0B0;
  v20 = v3;
  v53 = v20;
  v21 = objc_retainBlock(v52);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("templateRegistrationPromise"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAMetricsController, v22), CFSTR("MetricsController"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAStore, v23), CFSTR("Store"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAAccount, v24), CFSTR("Account"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAApplication, v25), CFSTR("Application"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAAssetRequest, v26), CFSTR("AssetRequest"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSABase64, v27), CFSTR("Base64"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSACalendar, v28), CFSTR("Calendar"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSACookie, v29), CFSTR("Cookie"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(_TtC5JSApp26JSADateComponentsFormatter, v30), CFSTR("DateComponentsFormatter"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSADateFormatter, v31), CFSTR("DateFormatter"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSADevice, v32), CFSTR("Device"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAFamilySharing, v33), CFSTR("FamilySharing"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSALocale, v34), CFSTR("Locale"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAOSLog, v35), CFSTR("OSLog"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSANetwork, v36), CFSTR("Network"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAParentalApproval, v37), CFSTR("ParentalApproval"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAPersistence, v38), CFSTR("Persistence"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAPostReviewRequest, v39), CFSTR("PostReviewRequest"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAProfileBagKeyEntry, v40), CFSTR("ProfileBagKeyEntry"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAProfileBagManager, v41), CFSTR("ProfileBagManager"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAShare, v42), CFSTR("Share"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAStoreContentLookupRequest, v43), CFSTR("StoreContentLookupRequest"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAStoreHTTPRequest, v44), CFSTR("StoreHTTPRequest"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAStoreHTTPResponse, v45), CFSTR("StoreHTTPResponse"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSATimer, v46), CFSTR("Timer"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAURLParser, v47), CFSTR("URLParser"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(JSAUserDefaults, v48), CFSTR("UserDefaults"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &off_A5B60, CFSTR("nativeAPIVersion"));
  v49 = JSASignpostExecution();
  v50 = objc_claimAutoreleasedReturnValue(v49);
  v51 = v50;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v51, OS_SIGNPOST_INTERVAL_END, v6, "Expose Objects", ", buf, 2u);
  }

}

- (int)_exceptionHandlerReentrantCountPtr
{
  return &self->_exceptionHandlerReentrantCount;
}

- (JSContext)context
{
  return self->_context;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (JSManagedValue)nativeJSObject
{
  return self->_nativeJSObject;
}

- (void)setNativeJSObject:(id)a3
{
  objc_storeStrong((id *)&self->_nativeJSObject, a3);
}

- (BUOSStateHandler)stateDumpHandle
{
  return self->_stateDumpHandle;
}

- (void)setStateDumpHandle:(id)a3
{
  objc_storeStrong((id *)&self->_stateDumpHandle, a3);
}

- (NSString)bootURL
{
  return self->_bootURL;
}

- (void)setBootURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (JSAThread)thread
{
  return self->_thread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_bootURL, 0);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_nativeJSObject, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
