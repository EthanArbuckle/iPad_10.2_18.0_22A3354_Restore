@implementation STUWakeScreenOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUWakeScreenOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKWakeScreenRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CATErrorWithCodeAndUserInfo(2, &off_1000D3FD8);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUWakeScreenOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUWakeScreenOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "cancelIfNeeded", 0, 0);
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
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUWakeScreenOperation.m"), 46, CFSTR("%@ must be called from the main thread"), v7);

  }
  if (-[STUWakeScreenOperation isExecuting](self, "isExecuting"))
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[STUWakeScreenOperation endOperationWithError:](self, "endOperationWithError:", v8);

  }
}

- (void)runWithRequest:(id)a3
{
  uint64_t v4;
  id v5;

  if (-[STUWakeScreenOperation isExecuting](self, "isExecuting", a3))
  {
    if (-[STUWakeScreenOperation isCancelled](self, "isCancelled"))
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
    else
      v4 = CRKErrorWithCodeAndUserInfo(112, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[STUWakeScreenOperation endOperationWithError:](self, "endOperationWithError:", v5);

  }
}

@end
