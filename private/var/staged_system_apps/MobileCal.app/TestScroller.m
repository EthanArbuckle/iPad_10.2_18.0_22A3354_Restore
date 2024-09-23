@implementation TestScroller

- (TestScroller)initWithOptions:(id)a3 testName:(id)a4 application:(id)a5
{
  id v8;
  id v9;
  id v10;
  TestScroller *v11;
  NSObject *v12;
  NSArray *validTestScrollTypeStrings;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TestScroller;
  v11 = -[TestScroller init](&v25, "init");
  if (v11)
  {
    v12 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v9;
      v28 = 2114;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Initializing TestScroller. TestName: %{public}@, Options: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v11->_testName, a4);
    objc_storeStrong((id *)&v11->_application, a5);
    validTestScrollTypeStrings = v11->_validTestScrollTypeStrings;
    v11->_validTestScrollTypeStrings = (NSArray *)&off_1001BC898;

    v11->_currentIter = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("totalScrollDistance")));
    v15 = v14;
    if (v14)
    {
      v11->_totalScrollDistance = objc_msgSend(v14, "intValue");
    }
    else
    {
      v16 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error: totalScrollDistance given is nil", buf, 2u);
      }
      v11->_inputInvalid = 1;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("scrollDistanceInterval")));
    v18 = v17;
    if (v17)
    {
      v11->_scrollDistanceInterval = objc_msgSend(v17, "intValue");
    }
    else
    {
      v19 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error: scrollDistanceInterval given is nil", buf, 2u);
      }
      v11->_inputInvalid = 1;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("iterations")));
    v21 = v20;
    if (v20)
    {
      v11->_iterations = objc_msgSend(v20, "intValue");
    }
    else
    {
      v22 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error: iterations given is nil", buf, 2u);
      }
      v11->_inputInvalid = 1;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("axis")));
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("Horizontal")))
      v11->_horizontal = 1;
    v11->_scrollType = -[TestScroller _scrollTypeFromOptions:](v11, "_scrollTypeFromOptions:", v8);

  }
  return v11;
}

- (void)runRecapTestIfNeeded:(id)a3
{
  id v4;
  TestScroller *v5;
  int currentIter;
  int iterations;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  NSString *testName;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int totalScrollDistance;
  double v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  TestScroller *v37;
  id v38;
  uint8_t buf[4];
  int v40;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  currentIter = v5->_currentIter;
  v5->_currentIter = currentIter + 1;
  iterations = v5->_iterations;
  v8 = kCalUILogHandle;
  v9 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG);
  if (currentIter >= iterations)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Recap Test Finished", buf, 2u);
    }
    -[Application finishedTest:](v5->_application, "finishedTest:", v5->_testName);
    -[TestScroller _callCompletionIfExists](v5, "_callCompletionIfExists");
  }
  else
  {
    if (v9)
    {
      v10 = v5->_currentIter;
      *(_DWORD *)buf = 67109120;
      v40 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Running Recap Test, iteration: %d", buf, 8u);
    }
    v11 = objc_alloc((Class)RPTScrollViewTestParameters);
    testName = v5->_testName;
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = sub_1000BF4BC;
    v36 = &unk_1001B26A0;
    v37 = v5;
    v13 = v4;
    v38 = v13;
    v14 = objc_msgSend(v11, "initWithTestName:scrollView:completionHandler:", testName, v13, &v33);
    v15 = RPTViewFrameInScreenSpace(v13);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v13, "adjustedContentInset", v33, v34, v35, v36, v37);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    totalScrollDistance = v5->_totalScrollDistance;
    v31 = (double)totalScrollDistance;
    if (totalScrollDistance == -1)
      v31 = 3.40282347e38;
    if (v31 != 0.0)
      objc_msgSend(v14, "setScrollingContentLength:");
    objc_msgSend(v14, "setIterationDurationFactor:", 0.5);
    objc_msgSend(v14, "setScrollingBounds:", v15 + v25, v17 + v23, v19 - (v25 + v29), v21 - (v23 + v27));
    if (v5->_horizontal)
      v32 = 5;
    else
      v32 = 4;
    objc_msgSend(v14, "setDirection:", v32);
    +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v14);

  }
  objc_sync_exit(v5);

}

- (void)scrollView:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id completionBlock;
  unint64_t scrollType;
  int totalScrollDistance;
  double v11;
  NSString *testName;
  uint64_t iterations;
  uint64_t scrollDistanceInterval;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v6 = a3;
  v7 = objc_msgSend(a4, "copy");
  completionBlock = self->_completionBlock;
  self->_completionBlock = v7;

  if (v6)
  {
    scrollType = self->_scrollType;
    switch(scrollType)
    {
      case 2uLL:
        -[Application startedTest:](self->_application, "startedTest:", self->_testName);
        totalScrollDistance = self->_totalScrollDistance;
        v11 = (double)(totalScrollDistance / self->_scrollDistanceInterval);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1000BF628;
        v17[3] = &unk_1001B25D0;
        v17[4] = self;
        objc_msgSend(v6, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:", 0, v17, 0, 0, (double)totalScrollDistance, 0.0, v11);
        break;
      case 1uLL:
        testName = self->_testName;
        scrollDistanceInterval = self->_scrollDistanceInterval;
        iterations = self->_iterations;
        v15 = self->_totalScrollDistance;
        if (self->_horizontal)
          v16 = 1;
        else
          v16 = 2;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1000BF620;
        v18[3] = &unk_1001B4B40;
        v18[4] = self;
        objc_msgSend(v6, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:", testName, iterations, scrollDistanceInterval, v15, v16, 0, v18);
        break;
      case 0uLL:
        -[TestScroller runRecapTestIfNeeded:](self, "runRecapTestIfNeeded:", v6);
        break;
    }
  }
  else
  {
    -[Application failedTest:withFailure:](self->_application, "failedTest:withFailure:", self->_testName, CFSTR("There was no scroll view"));
  }

}

- (unint64_t)_scrollTypeFromOptions:(id)a3
{
  void *v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v12;
  int v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("scrollType")));
  if (!v4)
    goto LABEL_4;
  v5 = -[NSArray indexOfObject:](self->_validTestScrollTypeStrings, "indexOfObject:", v4);
  if (!v5)
  {
    if ((+[RPTTestRunner isRecapAvailable](RPTTestRunner, "isRecapAvailable") & 1) != 0)
    {
      v6 = 0;
      goto LABEL_8;
    }
    v12 = kCalUILogHandle;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v13) = 0;
    v8 = "Error: Input invalid because Recap is not available";
    v9 = v12;
    v10 = 2;
    goto LABEL_6;
  }
  v6 = v5;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    v7 = kCalUILogHandle;
    if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v6 = 0;
      self->_inputInvalid = 1;
      goto LABEL_8;
    }
    v13 = 138412290;
    v14 = v4;
    v8 = "Error: Input invalid due to wrong scrollType string: %@";
    v9 = v7;
    v10 = 12;
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)_callCompletionIfExists
{
  void (**completionBlock)(void);

  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
    completionBlock[2]();
}

- (BOOL)inputInvalid
{
  return self->_inputInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_validTestScrollTypeStrings, 0);
}

@end
