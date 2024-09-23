@implementation CRRepairSession

- (CRRepairSession)initWithDelegate:(id)a3
{
  id v4;
  CRRepairSession *v5;
  CRRepairSession *v6;
  CRTestSequencer *v7;
  dispatch_queue_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRRepairSession;
  v5 = -[CRRepairSession init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    -[CRRepairSession setDelegate:](v5, "setDelegate:", v4);
    v7 = -[CRTestSequencer initWithDelegate:]([CRTestSequencer alloc], "initWithDelegate:", v4);
    -[CRRepairSession setTestSequencer:](v6, "setTestSequencer:", v7);

    v8 = dispatch_queue_create("com.apple.corerepair.testSequencerQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    -[CRRepairSession setTestSequencerQueue:](v6, "setTestSequencerQueue:", v8);

    -[CRRepairSession setSuiteId:](v6, "setSuiteId:", &off_100058420);
  }

  return v6;
}

- (void)endWithCompletionHandler:(id)a3
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CRRepairSession endWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v6, 0xCu);
  }

  v3[2](v3, 0);
}

- (void)requestAsset:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;

  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CRRepairSession requestAsset:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairCore.framework"), "stringByAppendingPathComponent:", v5));
  v14 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v9, 2, &v14));
  v11 = v14;
  if (v11)
  {
    v12 = handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100037658((uint64_t)v5, v11, v13);

  }
  v6[2](v6, v10, v11);

}

- (void)requestSuiteResult:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;

  v5 = (void (**)(id, void *, _QWORD))a4;
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CRRepairSession requestSuiteResult:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRRepairSession testSequencer](self, "testSequencer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suiteResult"));
  v5[2](v5, v9, 0);

}

- (void)requestSuiteStart:(id)a3 withCompletionHandler:(id)a4
{
  void (**v5)(id, void *, const __CFString *, const __CFString *, _QWORD);
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;

  v5 = (void (**)(id, void *, const __CFString *, const __CFString *, _QWORD))a4;
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CRRepairSession requestSuiteStart:withCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRRepairSession suiteId](self, "suiteId"));
  v5[2](v5, v8, CFSTR("START_SUITE"), CFSTR("SSR suite"), 0);

  v9 = objc_claimAutoreleasedReturnValue(-[CRRepairSession testSequencerQueue](self, "testSequencerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000877C;
  block[3] = &unk_100050C80;
  block[4] = self;
  dispatch_async(v9, block);

}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  const char *v25;

  v4 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CRRepairSession requestSuitesAvailableWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  v7 = (void *)objc_opt_new(CRRepairHistory);
  v8 = objc_msgSend(v7, "deviceSupportsRepairBootIntent");

  if (v8)
  {
    if (!-[CRRepairSession isSSRBootIntentSet](self, "isSSRBootIntentSet"))
    {
      v9 = handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Boot intent not set, check for unsealed data", buf, 2u);
      }

      v23 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRFDRUtils findUnsealedDataWithError:](CRFDRUtils, "findUnsealedDataWithError:", &v23));
      v12 = v23;
      v13 = v12;
      if (!v11 || v12)
      {
        v20 = handleForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_100037708((uint64_t)v13, v21);
      }
      else
      {
        if (objc_msgSend(v11, "count"))
        {

          goto LABEL_11;
        }
        v22 = handleForCategory(0);
        v21 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
        }
      }

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      goto LABEL_18;
    }
LABEL_11:
    v14 = objc_alloc((Class)ASTSuite);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRRepairSession suiteId](self, "suiteId"));
    v16 = objc_msgSend(v14, "initWithId:suiteNameLocalizedString:suiteDescriptionLocalizedString:estimatedCompletionTimeLocalizedString:primaryAssetLocator:secondaryAssetLocator:", v15, &stru_100052650, &stru_100052650, 0, 0, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v16));
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v17, 0);

    goto LABEL_18;
  }
  v18 = handleForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10003777C(v19);

  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
LABEL_18:

}

- (void)requestTermsAndConditionsWithCompletion:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CRRepairSession requestTermsAndConditionsWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLocalization localizedStringWithKey:](CRLocalization, "localizedStringWithKey:", CFSTR("CR_TERMS_CONDITIONS")));
  v3[2](v3, v6, 0);

}

- (void)sendTestResult:(id)a3 withCompletion:(id)a4
{
  char *v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  _QWORD v14[5];
  char *v15;
  uint8_t buf[4];
  const char *v17;

  v6 = (char *)a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CRRepairSession sendTestResult:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", buf, 0xCu);
  }

  v10 = handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "testResult:%@", buf, 0xCu);
  }

  v7[2](v7, 0);
  v12 = objc_claimAutoreleasedReturnValue(-[CRRepairSession testSequencerQueue](self, "testSequencerQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008CF4;
  v14[3] = &unk_100050CA8;
  v14[4] = self;
  v15 = v6;
  v13 = v6;
  dispatch_async(v12, v14);

}

- (void)startWithCompletionHandler:(id)a3
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CRRepairSession startWithCompletionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v6, 0xCu);
  }

  v3[2](v3, 0);
}

- (void)ping:(id)a3
{
  void (**v3)(id, _QWORD);
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CRRepairSession ping:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[CRDiagnostics][%s]", (uint8_t *)&v6, 0xCu);
  }

  v3[2](v3, 0);
}

- (BOOL)isSSRBootIntentSet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/mobile/Library/Preferences/%@.plist"), CFSTR("com.apple.CheckerBoard")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("persistedBootIntentReason")));
  v5 = v4;
  v6 = v4 && (objc_msgSend(v4, "isEqualToNumber:", &off_100058438) & 1) != 0;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRRepairSession delegate](self, "delegate"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("delegate"));

}

- (CRRepairSession)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  CRRepairSession *v14;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  v6 = objc_opt_class(ASTRepairSessionProvider);
  v7 = objc_opt_class(CRRepairSession);
  v8 = objc_opt_class(NSString);
  v9 = objc_opt_class(NSDictionary);
  v10 = objc_opt_class(NSNumber);
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(NSData), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("delegate")));

  v14 = -[CRRepairSession initWithDelegate:]([CRRepairSession alloc], "initWithDelegate:", v13);
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTRepairSessionProvider)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (CRTestSequencer)testSequencer
{
  return self->_testSequencer;
}

- (void)setTestSequencer:(id)a3
{
  objc_storeStrong((id *)&self->_testSequencer, a3);
}

- (OS_dispatch_queue)testSequencerQueue
{
  return self->_testSequencerQueue;
}

- (void)setTestSequencerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_testSequencerQueue, a3);
}

- (NSNumber)suiteId
{
  return self->_suiteId;
}

- (void)setSuiteId:(id)a3
{
  objc_storeStrong((id *)&self->_suiteId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suiteId, 0);
  objc_storeStrong((id *)&self->_testSequencerQueue, 0);
  objc_storeStrong((id *)&self->_testSequencer, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
