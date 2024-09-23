@implementation STUBrowseForShareTargetsOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___STUBrowseForShareTargetsOperation;
  return objc_msgSendSuper2(&v5, "validateRequest:error:", a3, a4);
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUBrowseForShareTargetsOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUBrowseForShareTargetsOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
}

- (void)cancelIfNeeded
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  void *v8;
  id v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUBrowseForShareTargetsOperation.m"), 31, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (-[STUBrowseForShareTargetsOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self);

    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUBrowseForShareTargetsOperation endOperationWithError:](self, "endOperationWithError:", v9);

  }
}

- (void)runWithRequest:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "activeCoursesDidChange:", CRKActiveStudentCoursesDidChangeNotificationName, 0);

  -[STUBrowseForShareTargetsOperation postTargetsDidChangeNotification](self, "postTargetsDidChangeNotification");
}

- (void)activeCoursesDidChange:(id)a3
{
  -[STUBrowseForShareTargetsOperation postTargetsDidChangeNotification](self, "postTargetsDidChangeNotification", a3);
}

- (void)postTargetsDidChangeNotification
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000777E8;
  v2[3] = &unk_1000CB648;
  v2[4] = self;
  -[STUBrowseForShareTargetsOperation fetchAvailableShareTargetsWithCompletion:](self, "fetchAvailableShareTargetsWithCompletion:", v2);
}

- (void)fetchAvailableShareTargetsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUBrowseForShareTargetsOperation.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "daemon"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100077A24;
  v10[3] = &unk_1000CBFB0;
  v11 = v5;
  v8 = v5;
  objc_msgSend(v7, "fetchActiveInstructorsIncludingImages:includeIdleInstructors:completion:", 1, 0, v10);

}

@end
