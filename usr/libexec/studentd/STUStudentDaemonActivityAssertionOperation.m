@implementation STUStudentDaemonActivityAssertionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUStudentDaemonActivityAssertionOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKStudentDaemonActivityAssertionRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D34C0);
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
  v3.super_class = (Class)STUStudentDaemonActivityAssertionOperation;
  -[STUTaskOperation cancel](&v3, "cancel");
  -[STUStudentDaemonActivityAssertionOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "endOperationIfNeeded", 0, 0);
}

- (void)endOperationIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (-[STUStudentDaemonActivityAssertionOperation isExecuting](self, "isExecuting"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "daemon"));
    objc_msgSend(v4, "releaseDaemonActivityAssertion");

    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    -[STUStudentDaemonActivityAssertionOperation endOperationWithError:](self, "endOperationWithError:", v6);

  }
}

- (void)runWithRequest:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daemon"));
  objc_msgSend(v3, "acquireDaemonActivityAssertion");

}

@end
