@implementation PPTStoreProductPageTest

- (PPTStoreProductPageTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPTStoreProductPageTest;
  return -[PPTStoreDependentTest initWithName:options:testDefinition:isMainTest:](&v7, "initWithName:options:testDefinition:isMainTest:", a3, a4, a5, a6);
}

- (int)timeBeforeTest
{
  return 20;
}

- (void)_handleTestEnd:(id)a3
{
  if (-[PPTStoreProductPageTest startPPTTestCalled](self, "startPPTTestCalled", a3))
  {
    -[PPTStoreProductPageTest setStartPPTTestCalled:](self, "setStartPPTTestCalled:", 0);
    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 0);
  }
}

- (void)startTest
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;

  -[PPTBasicTest setTestTimeout:](self, "setTestTimeout:", 60);
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleTestEnd:", BCCardStackTransitionTestAnimationWillBeginNotification, 0);

  v4 = +[BSUITemplate factory](BSUITemplate, "factory");
  v5 = sub_1001DA41C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting test named: %{public}@ and waiting for tab bar", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100177540;
  v9[3] = &unk_1008E7590;
  v9[4] = self;
  objc_msgSend(v8, "requestTabBarSceneController:", v9);

}

- (void)_startTestWithRootBarCoordinating:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  char isKindOfClass;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  id v44;
  void *v45;
  PPTStoreProductPageTest *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD block[4];
  id v51;
  PPTStoreProductPageTest *v52;
  NSObject *v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  void *v58;

  v4 = a3;
  v5 = sub_1001DA41C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
    *(_DWORD *)buf = 138543362;
    v58 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "With tab bar controller, starting test named: %{public}@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKRootBarItemsProvider BooksIdentifier](BKRootBarItemsProvider, "BooksIdentifier"));
  objc_msgSend(v4, "selectWithIdentifier:isUserAction:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedNavigationController"));
  v10 = objc_opt_class(BSUIFeedNavigationController);
  v11 = BUDynamicCast(v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entries"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entries"));
    v18 = objc_msgSend(v17, "indexOfObjectPassingTest:", &stru_1008ED180);

    if (v18 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = sub_1001DA41C();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v21 = "feedViewController: could not find swoosh-root.xml";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
      }
    }
    else
    {
      v46 = self;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entries"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v18));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject data](v20, "data"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dictionary"));

      v49 = v25;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForKey:", CFSTR("swooshConfig")));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "valueForKey:", CFSTR("swooshBodyConfig")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "valueForKey:", CFSTR("items")));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 0));
      v28 = objc_opt_class(NSArray);
      isKindOfClass = objc_opt_isKindOfClass(v27, v28);

      if ((isKindOfClass & 1) != 0)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 0));
        v31 = objc_msgSend(v30, "count");

        if (v31 == (id)1)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 1));
          v33 = v32;
          v34 = 0;
        }
        else
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 0));
          v33 = v32;
          v34 = 1;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v34));

      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectAtIndexedSubscript:", 1));
      }
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "valueForKey:", CFSTR("url")));
      v37 = (void *)v36;
      if (v36)
      {
        v45 = v35;
        v55[0] = CFSTR("swooshIndex");
        v55[1] = CFSTR("url");
        v56[0] = &off_10092EEE0;
        v56[1] = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v20, "delegate"));
        objc_msgSend(v39, "feedEntry:handleBehavior:name:arguments:", v20, 0, CFSTR("GOTO_BOOK"), v38);

        v40 = sub_1001DA41C();
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "waiting 10s for card stack to close", buf, 2u);
        }

        v42 = dispatch_time(0, 10000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100177B1C;
        block[3] = &unk_1008E7B70;
        v51 = v4;
        v52 = v46;
        v53 = v20;
        v54 = v38;
        v43 = v38;
        dispatch_after(v42, (dispatch_queue_t)&_dispatch_main_q, block);

        v35 = v45;
      }
      else
      {
        v44 = sub_1001DA41C();
        v43 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "feedViewController: could not find swoosh-root.xml", buf, 2u);
        }
      }

    }
  }
  else
  {
    v22 = sub_1001DA41C();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v21 = "feedViewController has no entries";
      goto LABEL_9;
    }
  }

}

- (BOOL)startPPTTestCalled
{
  return self->_startPPTTestCalled;
}

- (void)setStartPPTTestCalled:(BOOL)a3
{
  self->_startPPTTestCalled = a3;
}

@end
