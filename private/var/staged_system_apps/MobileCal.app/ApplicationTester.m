@implementation ApplicationTester

- (ApplicationTester)initWithModel:(id)a3
{
  id v5;
  ApplicationTester *v6;
  ApplicationTester *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ApplicationTester;
  v6 = -[ApplicationTester init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

+ (BOOL)testingSessionStarted
{
  return byte_1001F6250;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  objc_class *v13;
  ApplicationTest *v14;
  ApplicationTest *currentlyRunningTest;
  NSObject *v16;
  NSObject *v17;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  ApplicationTester *v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!self->_model)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ApplicationTester.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_model != nil"));

  }
  v12 = -[ApplicationTester _testClassForTestName:](self, "_testClassForTestName:", v10);
  v13 = v12;
  if (v12)
  {
    byte_1001F6250 = 1;
    v14 = (ApplicationTest *)objc_msgSend([v12 alloc], "initWithApplication:model:options:", v9, self->_model, v11);
    currentlyRunningTest = self->_currentlyRunningTest;
    self->_currentlyRunningTest = v14;

    v16 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Running test: [%{public}@]", buf, 0xCu);
    }
    -[ApplicationTest runTest](self->_currentlyRunningTest, "runTest");
  }
  else
  {
    v17 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not find test class for test name: [%{public}@]. You may need to include this class in the collection returned from your [%{public}@]'s -testClasses method.", buf, 0x16u);
    }
  }

  return v13 != 0;
}

- (NSString)extendedLaunchTestName
{
  return 0;
}

- (Class)_testClassForTestName:(id)a3
{
  NSString *v3;
  NSString *v4;
  Class v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  objc_class *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  Class v19;

  v3 = (NSString *)a3;
  v4 = v3;
  if (!v3)
  {
    v13 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      v10 = "nil 'testName' provided.  Will not return a test class.";
      v11 = v13;
      v12 = 2;
      goto LABEL_7;
    }
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  v5 = NSClassFromString(v3);
  *(_QWORD *)&v6 = objc_opt_class(ApplicationTest).n128_u64[0];
  v8 = v7;
  if ((-[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", v7, v6) & 1) == 0)
  {
    v9 = kCalUILogTestHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v5;
      v10 = "Will not provide test class since it is not a subclass of [%@].  Candidate class: [%@]";
      v11 = v9;
      v12 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  v14 = v5;

  return v14;
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_currentlyRunningTest, 0);
  objc_storeStrong((id *)&self->_testNamesToTestClasses, 0);
}

@end
