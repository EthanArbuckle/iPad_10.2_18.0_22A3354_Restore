@implementation MapsAppTestResizeWindow

- (MapsAppTestResizeWindow)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestResizeWindow *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MapsAppTestResizeWindow;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v13, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeoutInSeconds")));
    v9->_timeoutInSeconds = (int64_t)objc_msgSend(v10, "integerValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("numberOfResizes")));
    v9->_numberOfResizes = (int64_t)objc_msgSend(v11, "integerValue");

  }
  return v9;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];

  -[MapsAppTest startedTest](self, "startedTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapViewForPPTTest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  v6 = objc_alloc((Class)sub_100AC439C());
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AC4454;
  v10[3] = &unk_1011AC860;
  v10[4] = self;
  v8 = objc_msgSend(v6, "initWithTestName:window:completionHandler:", v7, v5, v10);

  objc_msgSend(v8, "setMinimumWindowSize:", 300.0, 300.0);
  objc_msgSend(v8, "setMaximumWindowSize:", 600.0, 600.0);
  objc_msgSend(sub_100AC445C(), "runTestWithParameters:", v8);

  return 1;
}

@end
