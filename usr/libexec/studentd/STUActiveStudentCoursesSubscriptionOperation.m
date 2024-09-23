@implementation STUActiveStudentCoursesSubscriptionOperation

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUActiveStudentCoursesSubscriptionOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUActiveStudentCoursesSubscriptionOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUActiveStudentCoursesSubscriptionOperation.m"), 21, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (-[STUActiveStudentCoursesSubscriptionOperation isExecuting](self, "isExecuting"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self);

    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUActiveStudentCoursesSubscriptionOperation endOperationWithError:](self, "endOperationWithError:", v9);

  }
}

- (void)runWithRequest:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "activeCoursesDidChange:", CRKActiveStudentCoursesDidChangeNotificationName, 0);

}

- (void)activeCoursesDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  -[STUActiveStudentCoursesSubscriptionOperation postNotificationWithName:userInfo:](self, "postNotificationWithName:userInfo:", v6, v5);
}

@end
