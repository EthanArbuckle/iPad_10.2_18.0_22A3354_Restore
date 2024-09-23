@implementation STUDevicePropertyNotificationSubscriptionOperation

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUDevicePropertyNotificationSubscriptionOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUDevicePropertyNotificationSubscriptionOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
}

- (void)cancelIfNeeded
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  void *v7;
  id v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUDevicePropertyNotificationSubscriptionOperation.m"), 20, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (-[STUDevicePropertyNotificationSubscriptionOperation isExecuting](self, "isExecuting"))
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[STUDevicePropertyNotificationSubscriptionOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
}

@end
